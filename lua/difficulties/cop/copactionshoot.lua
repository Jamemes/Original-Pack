local mvec3_set = mvector3.set
local mvec3_set_z = mvector3.set_z
local mvec3_sub = mvector3.subtract
local mvec3_norm = mvector3.normalize
local mvec3_dir = mvector3.direction
local mvec3_set_l = mvector3.set_length
local mvec3_add = mvector3.add
local mvec3_dot = mvector3.dot
local mvec3_cross = mvector3.cross
local mvec3_rot = mvector3.rotate_with
local mvec3_rand_orth = mvector3.random_orthogonal
local mvec3_lerp = mvector3.lerp
local mrot_axis_angle = mrotation.set_axis_angle
local temp_vec1 = Vector3()
local temp_vec2 = Vector3()
local temp_vec3 = Vector3()
local temp_rot1 = Rotation()
local bezier_curve = {
	0,
	0,
	1,
	1
}
function CopActionShoot:update(t)
	local vis_state = self._ext_base:lod_stage()
	vis_state = vis_state or 4
	if vis_state == 1 then
	elseif vis_state * 3 > self._skipped_frames then
		self._skipped_frames = self._skipped_frames + 1
		return
	else
		self._skipped_frames = 1
	end
	local shoot_from_pos = self._shoot_from_pos
	local ext_anim = self._ext_anim
	local target_vec, target_dis, autotarget, target_pos
	if self._attention then
		target_pos, target_vec, target_dis, autotarget = self:_get_target_pos(shoot_from_pos, self._attention, t)
		local tar_vec_flat = temp_vec2
		mvec3_set(tar_vec_flat, target_vec)
		mvec3_set_z(tar_vec_flat, 0)
		mvec3_norm(tar_vec_flat)
		local fwd = self._common_data.fwd
		local fwd_dot = mvec3_dot(fwd, tar_vec_flat)
		if self._turn_allowed then
			local active_actions = self._common_data.active_actions
			local queued_actions = self._common_data.queued_actions
			if (not active_actions[2] or active_actions[2]:type() == "idle") and (not queued_actions or not queued_actions[1] and not queued_actions[2]) and not self._ext_movement:chk_action_forbidden("walk") then
				local fwd_dot_flat = mvec3_dot(tar_vec_flat, fwd)
				if fwd_dot_flat < 0.96 then
					local spin = tar_vec_flat:to_polar_with_reference(fwd, math.UP).spin
					local new_action_data = {
						type = "turn",
						body_part = 2,
						angle = spin
					}
					self._ext_movement:action_request(new_action_data)
				end
			end
		end
		target_vec = self:_upd_ik(target_vec, fwd_dot, t)
	end
	if ext_anim.reload or ext_anim.equip or ext_anim.melee or ext_anim.equip then
	elseif self._weapon_base:clip_empty() then
		if self._autofiring then
			self._weapon_base:stop_autofire()
			self._ext_movement:play_redirect("up_idle")
			self._autofiring = nil
			self._autoshots_fired = nil
		end
		if self._ext_anim.base_no_reload then
			self._weapon_unit:base():on_reload()
		else
			local res = CopActionReload._play_reload(self)
			if res then
				self._machine:set_speed(res, self._reload_speed)
			end
			if Network:is_server() then
				managers.network:session():send_to_peers("reload_weapon_cop", self._unit)
			end
		end
	elseif self._autofiring then
		if not target_vec or not self._common_data.allow_fire then
			self._weapon_base:stop_autofire()
			self._shoot_t = t + 0.6
			self._autofiring = nil
			self._autoshots_fired = nil
			self._ext_movement:play_redirect("up_idle")
		else
			local spread = self._spread
			local falloff, i_range = self:_get_shoot_falloff(target_dis, self._falloff)
			local dmg_buff = self._unit:base():get_total_buff("base_damage")
			local dmg_mul = (1 + dmg_buff) * falloff.dmg_mul
			local new_target_pos = self._shoot_history and self:_get_unit_shoot_pos(t, target_pos, target_dis, self._w_usage_tweak, falloff, i_range, autotarget)
			if new_target_pos then
				target_pos = new_target_pos
			else
				spread = math.min(20, spread)
			end
			local spread_pos = temp_vec2
			mvec3_rand_orth(spread_pos, target_vec)
			mvec3_set_l(spread_pos, spread)
			mvec3_add(spread_pos, target_pos)
			target_dis = mvec3_dir(target_vec, shoot_from_pos, spread_pos)
			local fired = self._weapon_base:trigger_held(shoot_from_pos, target_vec, dmg_mul, self._shooting_player, nil, nil, nil, self._attention.unit)
			if fired then
				if fired.hit_enemy and fired.hit_enemy.type == "death" and self._unit:unit_data().mission_element then
					self._unit:unit_data().mission_element:event("killshot", self._unit)
				end
				if not ext_anim.recoil and vis_state == 1 and not ext_anim.base_no_recoil and not ext_anim.move then
					self._ext_movement:play_redirect("recoil_auto")
				end
				if not self._autofiring or self._autoshots_fired >= self._autofiring - 1 then
					self._autofiring = nil
					self._autoshots_fired = nil
					self._weapon_base:stop_autofire()
					self._ext_movement:play_redirect("up_idle")
					if vis_state == 1 then
						self._shoot_t = t + (self._common_data.is_suppressed and 1.5 or 1) * math.lerp(falloff.recoil[1], falloff.recoil[2], self:_pseudorandom())
					else
						self._shoot_t = t + falloff.recoil[2]
					end
				else
					self._autoshots_fired = self._autoshots_fired + 1
				end
			end
		end
	elseif target_vec and self._common_data.allow_fire and t > self._shoot_t and t > self._mod_enable_t then
		local shoot
		if autotarget or self._shooting_husk_player and t > self._next_vis_ray_t then
			if self._shooting_husk_player then
				self._next_vis_ray_t = t + 2
			end
			local fire_line = World:raycast("ray", shoot_from_pos, target_pos, "slot_mask", self._verif_slotmask, "ray_type", "ai_vision")
			if fire_line then
				if 3 < t - self._line_of_sight_t then
					local aim_delay_minmax = self._w_usage_tweak.aim_delay
					local lerp_dis = math.min(1, target_vec:length() / self._falloff[#self._falloff].r)
					local aim_delay = math.lerp(aim_delay_minmax[1], aim_delay_minmax[2], lerp_dis)
					aim_delay = aim_delay + self:_pseudorandom() * aim_delay * 0.3
					if self._common_data.is_suppressed then
						aim_delay = aim_delay * 1.5
					end
					self._shoot_t = t + aim_delay
				elseif fire_line.distance > 300 then
					shoot = true
				end
			else
				if 1 < t - self._line_of_sight_t and not self._last_vis_check_status then
					local shoot_hist = self._shoot_history
					local displacement = mvector3.distance(target_pos, shoot_hist.m_last_pos)
					local focus_delay = self._w_usage_tweak.focus_delay * math.min(1, displacement / self._w_usage_tweak.focus_dis)
					shoot_hist.focus_start_t = t
					shoot_hist.focus_delay = focus_delay
					shoot_hist.m_last_pos = mvector3.copy(target_pos)
				end
				self._line_of_sight_t = t
				shoot = true
			end
			self._last_vis_check_status = shoot
		elseif self._shooting_husk_player then
			shoot = self._last_vis_check_status
		else
			shoot = true
		end
		if self._common_data.char_tweak.no_move_and_shoot and self._common_data.ext_anim and self._common_data.ext_anim.move then
			shoot = false
			self._shoot_t = t + (self._common_data.char_tweak.move_and_shoot_cooldown or 1)
		end
		if shoot then
			local melee
			if autotarget and (not self._common_data.melee_countered_t or t - self._common_data.melee_countered_t > 15) and target_dis < 130 and self._w_usage_tweak.melee_speed and t > self._melee_timeout_t then
				melee = self:_chk_start_melee(target_vec, target_dis, autotarget, target_pos)
			end
			if not melee then
				local falloff, i_range = self:_get_shoot_falloff(target_dis, self._falloff)
				local dmg_buff = self._unit:base():get_total_buff("base_damage")
				local dmg_mul = (1 + dmg_buff) * falloff.dmg_mul
				local firemode
				if self._automatic_weap then
					local random_mode = self:_pseudorandom()
					for i_mode, mode_chance in ipairs(falloff.mode) do
						if mode_chance >= random_mode then
							firemode = i_mode
						else
						end
					end
				else
					firemode = 1
				end
				if firemode > 1 then
					self._weapon_base:start_autofire(firemode < 4 and firemode)
					if self._w_usage_tweak.autofire_rounds then
						if firemode < 4 then
							self._autofiring = firemode
						elseif falloff.autofire_rounds then
							local diff = falloff.autofire_rounds[2] - falloff.autofire_rounds[1]
							self._autofiring = math.round(falloff.autofire_rounds[1] + self:_pseudorandom() * diff)
						else
							local diff = self._w_usage_tweak.autofire_rounds[2] - self._w_usage_tweak.autofire_rounds[1]
							self._autofiring = math.round(self._w_usage_tweak.autofire_rounds[1] + self:_pseudorandom() * diff)
						end
					else
						Application:stack_dump_error("autofire_rounds is missing from weapon usage tweak data!", self._weap_tweak.usage)
					end
					self._autoshots_fired = 0
					if vis_state == 1 and not ext_anim.base_no_recoil and not ext_anim.move then
						self._ext_movement:play_redirect("recoil_auto")
					end
				else
					local spread = self._spread
					if autotarget then
						local new_target_pos = self._shoot_history and self:_get_unit_shoot_pos(t, target_pos, target_dis, self._w_usage_tweak, falloff, i_range, autotarget)
						if new_target_pos then
							target_pos = new_target_pos
						else
							spread = math.min(20, spread)
						end
					end
					local spread_pos = temp_vec2
					mvec3_rand_orth(spread_pos, target_vec)
					mvec3_set_l(spread_pos, spread)
					mvec3_add(spread_pos, target_pos)
					target_dis = mvec3_dir(target_vec, shoot_from_pos, spread_pos)
					local fired = self._weapon_base:singleshot(shoot_from_pos, target_vec, dmg_mul, self._shooting_player, nil, nil, nil, self._attention.unit)
					if fired and fired.hit_enemy and fired.hit_enemy.type == "death" and self._unit:unit_data().mission_element then
						self._unit:unit_data().mission_element:event("killshot", self._unit)
					end
					if vis_state == 1 then
						if not ext_anim.base_no_recoil and not ext_anim.move then
							self._ext_movement:play_redirect("recoil_single")
						end
						self._shoot_t = t + (self._common_data.is_suppressed and 1.5 or 1) * math.lerp(falloff.recoil[1], falloff.recoil[2], self:_pseudorandom())
					else
						self._shoot_t = t + falloff.recoil[2]
					end
				end
			end
		end
	end
	if self._ext_anim.base_need_upd then
		self._ext_movement:upd_m_head_pos()
	end
end