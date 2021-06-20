if string.lower(RequiredScript) == "lib/tweak_data/playertweakdata" then
	local data = PlayerTweakData.init
	function PlayerTweakData:init(tweak_data)
		data(self, tweak_data)
		self.alarm_pager = {
			first_call_delay = {2, 4},
			call_duration = {
				{3, 6},
				{3, 6}
			},
			nr_of_calls = {2, 2},
			bluff_success_chance = {1, 1, 0},
			bluff_success_chance_w_skill = {1, 1, 1, 1, 0}
		}
		self.fall_damage_alert_size = 1000
	end
	
	function PlayerTweakData:_set_normal()
		self.damage.automatic_respawn_time = 120
		self.alarm_pager.call_duration = {
			{6, 6},
			{6, 6}
		}
		self.alarm_pager.bluff_success_chance = {1, 1, 1, 1, 0}
	end

	function PlayerTweakData:_set_hard()
		self.damage.automatic_respawn_time = 220
		self.damage.DOWNED_TIME_DEC = 7
		self.damage.DOWNED_TIME_MIN = 5
		self.damage.automatic_respawn_time = 120
		self.alarm_pager.call_duration = {
			{6, 6},
			{6, 6}
		}
		self.alarm_pager.bluff_success_chance = {1, 1, 1, 1, 0}
	end
end
if string.lower(RequiredScript) == "lib/units/props/securitycamera" then
	function SecurityCamera:_upd_detect_attention_objects(t)
		local detected_obj = self._detected_attention_objects
		local my_key = self._u_key
		local my_pos = self._pos
		local my_fwd = self._look_fwd
		local det_delay = self._detection_delay

		for u_key, attention_info in pairs(detected_obj) do
			if t >= attention_info.next_verify_t then
				attention_info.next_verify_t = t + (attention_info.identified and attention_info.verified and attention_info.settings.verification_interval * 1.3 or attention_info.settings.verification_interval * 0.3)

				if not attention_info.identified then
					local noticable = nil
					local angle, dis_multiplier = self:_detection_angle_and_dis_chk(my_pos, my_fwd, attention_info.handler, attention_info.settings, attention_info.handler:get_detection_m_pos())

					if angle then
						local attention_pos = attention_info.handler:get_detection_m_pos()
						local vis_ray = self._unit:raycast("ray", my_pos, attention_pos, "slot_mask", self._visibility_slotmask, "ray_type", "ai_vision")

						if not vis_ray or vis_ray.unit:key() == u_key then
							noticable = true
						end
					end

					local delta_prog = nil
					local dt = t - attention_info.prev_notice_chk_t

					if noticable then
						if angle == -1 then
							delta_prog = 1
						else
							local min_delay = det_delay[1]
							local max_delay = det_delay[2]
							local angle_mul_mod = 0.15 * math.min(angle / self._cone_angle, 1)
							local dis_mul_mod = 0.85 * dis_multiplier
							local notice_delay_mul = attention_info.settings.notice_delay_mul or 1

							if attention_info.settings.detection and attention_info.settings.detection.delay_mul then
								notice_delay_mul = notice_delay_mul * attention_info.settings.detection.delay_mul
							end

							local notice_delay_modified = math.lerp(min_delay * notice_delay_mul, max_delay, dis_mul_mod + angle_mul_mod)
							delta_prog = notice_delay_modified > 0 and dt / notice_delay_modified or 1
						end
					else
						delta_prog = det_delay[2] > 0 and -dt / det_delay[2] or -1
					end

					local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
					local hate_risk = difficulty == "easy_wish" or difficulty == "sm_wish"
					local mul = hate_risk and 3 or 1
					
					attention_info.notice_progress = attention_info.notice_progress + delta_prog * mul
					
					if attention_info.notice_progress > 1 then
						attention_info.notice_progress = nil
						attention_info.prev_notice_chk_t = nil
						attention_info.identified = true
						attention_info.release_t = t + attention_info.settings.release_delay
						attention_info.identified_t = t
						noticable = true

						if AIAttentionObject.REACT_SCARED <= attention_info.settings.reaction then
							managers.groupai:state():on_criminal_suspicion_progress(attention_info.unit, self._unit, true)
						end
					elseif attention_info.notice_progress < 0 then
						self:_destroy_detected_attention_object_data(attention_info)

						noticable = false
					else
						noticable = attention_info.notice_progress
						attention_info.prev_notice_chk_t = t

						if AIAttentionObject.REACT_SCARED <= attention_info.settings.reaction then
							managers.groupai:state():on_criminal_suspicion_progress(attention_info.unit, self._unit, noticable)
						end
					end

					if noticable ~= false and attention_info.settings.notice_clbk then
						attention_info.settings.notice_clbk(self._unit, noticable)
					end
				end

				if attention_info.identified then
					attention_info.nearly_visible = nil
					local verified, vis_ray = nil
					local attention_pos = attention_info.handler:get_detection_m_pos()
					local dis = mvector3.distance(my_pos, attention_info.m_pos)

					if dis < self._range * 1.2 then
						local detect_pos = nil

						if attention_info.is_husk_player and attention_info.unit:anim_data().crouch then
							detect_pos = self._tmp_vec1

							mvector3.set(detect_pos, attention_info.m_pos)
							mvector3.add(detect_pos, tweak_data.player.stances.default.crouched.head.translation)
						else
							detect_pos = attention_pos
						end

						local in_FOV = self:_detection_angle_chk(my_pos, my_fwd, detect_pos, 0.8)

						if in_FOV then
							vis_ray = self._unit:raycast("ray", my_pos, detect_pos, "slot_mask", self._visibility_slotmask, "ray_type", "ai_vision")

							if not vis_ray or vis_ray.unit:key() == u_key then
								verified = true
							end
						end

						attention_info.verified = verified
					end

					attention_info.dis = dis

					if verified then
						attention_info.release_t = nil
						attention_info.verified_t = t

						mvector3.set(attention_info.verified_pos, attention_pos)

						attention_info.last_verified_pos = mvector3.copy(attention_pos)
						attention_info.verified_dis = dis
					elseif attention_info.release_t and attention_info.release_t < t then
						self:_destroy_detected_attention_object_data(attention_info)
					else
						attention_info.release_t = attention_info.release_t or t + attention_info.settings.release_delay
					end
				end
			end
		end
	end


	function SecurityCamera:_detection_angle_and_dis_chk(my_pos, my_fwd, handler, settings, attention_pos)
		local dis = mvector3.direction(self._tmp_vec1, my_pos, attention_pos)
		local dis_multiplier, angle_multiplier = nil
		local max_dis = math.min(self._range, settings.max_range or self._range)
		local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
		local hate_risk = difficulty == "easy_wish" or difficulty == "sm_wish"
		local mul = hate_risk and 3 or 1
		
		if settings.detection and settings.detection.range_mul then
			max_dis = max_dis * settings.detection.range_mul * mul
		end

		dis_multiplier = dis / max_dis

		if dis_multiplier < 1 then
			local angle = mvector3.angle(my_fwd, self._tmp_vec1)
			local angle_max = self._cone_angle * 0.5
			angle_multiplier = angle / angle_max

			if angle_multiplier < 1 then
				return angle, dis_multiplier
			end
		end
	end
end
if string.lower(RequiredScript) == "lib/tweak_data/attentiontweakdata" then
	local data = AttentionTweakData.init
	function AttentionTweakData:init(tweak_data)
		data(self, tweak_data)
		local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
		if difficulty == "easy_wish" or difficulty == "sm_wish" then
			self.settings.pl_mask_off_foe_combatant.max_range = 600 * 3
			self.settings.pl_mask_off_foe_non_combatant.max_range = 600 * 3
			self.settings.pl_mask_on_foe_combatant_whisper_mode_stand.max_range = 2000 * 3
			self.settings.pl_mask_on_foe_combatant_whisper_mode_crouch.max_range = 1200 * 3
			self.settings.pl_mask_on_foe_non_combatant_whisper_mode_crouch.max_range = 1500 * 3
			self.settings.civ_all_peaceful.max_range = 2000 * 3
		end
	end
elseif string.lower(RequiredScript) == "lib/units/beings/player/states/playerstandard" then
	--==Реплики издают шум==--
	function PlayerStandard:say_line(sound_name, skip_alert)
		self._unit:sound():say(sound_name, true, false)
		skip_alert = skip_alert or managers.groupai:state():whisper_mode()
		local alert_rad = tweak_data.whisper_alert_radius
		local new_alert = {
			"vo_cbt",
			self._unit:movement():m_head_pos(),
			alert_rad,
			self._unit:movement():SO_access(),
			self._unit
		}
		managers.groupai:state():propagate_alert(new_alert)
	end
	--==Бег в определенном радиусе будет тревожить гражданских/охранников, но не камеры.==--
	Hooks:PreHook(PlayerStandard, "_update_movement", "PlayerStandard_update_movement", function(self, t)
		local cur_pos = pos_new or self._pos
		local move_dis = mvector3.distance_sq(cur_pos, self._last_sent_pos)
		if not self:_on_zipline() and (move_dis > 22500 or move_dis > 400 and (t - self._last_sent_pos_t > 1.5 or not pos_new)) then
			self._ext_network:send("action_walk_nav_point", cur_pos)
			mvector3.set(self._last_sent_pos, cur_pos)
			self._last_sent_pos_t = t
			if self._move_dir and self._running and not self._state_data.ducking and not managers.groupai:state():enemy_weapons_hot() then
				local alert_epicenter = mvector3.copy(self._last_sent_pos)
				mvector3.set_z(alert_epicenter, alert_epicenter.z + 150)
				local alert_rad = (tweak_data.footstep_alert_radius) * mvector3.length(self._move_dir)
				local footstep_alert = {
					"footstep",
					alert_epicenter,
					alert_rad,
					managers.groupai:state():get_unit_type_filter("civilians_enemies"),
					self._unit
				}
				managers.groupai:state():propagate_alert(footstep_alert)
			end
		end
	end)
elseif string.lower(RequiredScript) == "lib/managers/group_ai_states/groupaistatebase" then
	--==Соседи будут звонить в полицию через некоторое время, после того был издан шум определенного радиуса. (Радиус по умолчанию - 2450)==--
	Hooks:PreHook(GroupAIStateBase, "propagate_alert", "GroupAIStateBase_propagate_alert", function(self, alert_data)
		local alert_type = alert_data[1]
		local alert_epicenter = alert_data[2]
		local alert_radius = alert_data[3]
		local listeners_by_type = self._alert_listeners[alert_type]
		local live_neighbourhood = Global.game_settings.level_id == "welcome_to_the_jungle_1" or Global.game_settings.level_id == "welcome_to_the_jungle_1_night" or Global.game_settings.difficulty == "easy_wish" or Global.game_settings.difficulty == "sm_wish"
		local neighbour_ear = tweak_data.neighbours_alert_radius_trigger
		if live_neighbourhood then
			if listeners_by_type and alert_epicenter then
				if alert_radius > neighbour_ear then
					function GroupAIStateBase:_on_neighbours_called()
						managers.groupai:state():on_police_called("sys_csgo_gunfire")
					end
					if managers.groupai:state():whisper_mode() then
						managers.enemy:add_delayed_clbk(nil, callback(self, self, "_on_neighbours_called"), self._t + tweak_data.neighbours_trigger_delay)
					end
				end
			end
		end
	end)
elseif string.lower(RequiredScript) == "lib/managers/gameplaycentralmanager" then
	--==Тревога нпс от хлопков пуль прилетевшей в стену\поверхность==--
	Hooks:PreHook(GamePlayCentralManager, "_play_bullet_hit", "GamePlayCentralManager_play_bullet_hit", function(self, params)
		local hit_pos = params.col_ray.position
		local need_sound = not params.no_sound and World:in_view_with_options(hit_pos, 4000, 0, 0)
		local need_effect = World:in_view_with_options(hit_pos, 20, 100, 5000)
		local need_decal = not self._block_bullet_decals and not params.no_decal and need_effect and World:in_view_with_options(hit_pos, 3000, 0, 0)
		if need_sound and need_effect and need_decal and alive(params.col_ray.unit) then
			local alert_event = {
				"aggression",
				hit_pos,
				tweak_data.bullet_hit_alert_radius,
				managers.groupai:state():get_unit_type_filter("civilians_enemies"),
				params.col_ray.unit
			}
			managers.groupai:state():propagate_alert(alert_event)
		end
	end)
elseif string.lower(RequiredScript) == "lib/units/props/drill" then
	--==Зона тревоги нпс от дрели==--
	local investigate_zone = tweak_data.drill_investigate_zone_multipler -- Множитель зоны "проверки" шума дрели, чтобы охранник шел к источнику звука.
	Hooks:PreHook(Drill, "_set_alert_state", "Drill_set_alert_state", function(self, state)
		if state then
			local alert_event = {
				"aggression",
				self._unit:position(),
				(self._alert_radius or 0) / investigate_zone,
				managers.groupai:state():get_unit_type_filter("civilians_enemies"),
				self._unit
			}
			managers.groupai:state():propagate_alert(alert_event)
		end
	end)
	--==Удержание зоны тревоги нпс во время работы дрели через "проверку" охранников==--
	Hooks:PreHook(Drill, "clbk_investigate_SO_verification", "Drill_clbk_investigate_SO_verification", function(self, candidate_unit)
		local candidate_listen_pos = candidate_unit:movement():m_head_pos()
		local sound_source_pos = self._unit:position()
		local ray = self._unit:raycast("ray", candidate_listen_pos, sound_source_pos, "slot_mask", managers.slot:get_mask("AI_visibility"), "ray_type", "ai_vision", "report")

		if ray then
			local my_dis = mvector3.distance(candidate_listen_pos, sound_source_pos)
			if my_dis > (self._alert_radius or 900) * 0.5 then
					local alert_event = {
						"aggression",
						self._unit:position(),
						(self._alert_radius or 0) / investigate_zone,
						managers.groupai:state():get_unit_type_filter("civilians_enemies"),
						self._unit
					}
					managers.groupai:state():propagate_alert(alert_event)
				return
			end
		end
	end)
elseif string.lower(RequiredScript) == "lib/units/weapons/weaponlaser" then
	local mvec1 = Vector3()
	local mvec2 = Vector3()
	local mvec_l_dir = Vector3()
	function WeaponLaser:update(unit, t, dt)
		local rotation = self._custom_rotation or self._laser_obj:rotation()
		mrotation.y(rotation, mvec_l_dir)
		local from = mvec1
		if self._custom_position then
			mvector3.set(from, self._laser_obj:local_position())
			mvector3.rotate_with(from, rotation)
			mvector3.add(from, self._custom_position)
		else
			mvector3.set(from, self._laser_obj:position())
		end
		local to = mvec2
		mvector3.set(to, mvec_l_dir)
		mvector3.multiply(to, self._max_distance)
		mvector3.add(to, from)
		local ray = self._unit:raycast("ray", from, to, "slot_mask", self._slotmask, self._ray_ignore_units and "ignore_unit" or nil, self._ray_ignore_units)
		if ray then
			if not self._is_npc then
				self._light:set_spot_angle_end(self._spot_angle_end)
				self._spot_angle_end = math.lerp(1, 18, ray.distance / self._max_distance)
				self._light_glow:set_spot_angle_end(math.lerp(8, 80, ray.distance / self._max_distance))
				local scale = (math.clamp(ray.distance, self._max_distance - self._scale_distance, self._max_distance) - (self._max_distance - self._scale_distance)) / self._scale_distance
				scale = 1 - scale
				self._light:set_multiplier(scale)
				self._light_glow:set_multiplier(scale * 0.1)
			end
			self._brush:cylinder(ray.position, from, self._is_npc and 0.5 or 0.25)
			local pos = mvec1
			mvector3.set(pos, mvec_l_dir)
			mvector3.multiply(pos, 50)
			mvector3.negate(pos)
			mvector3.add(pos, ray.position)
			self._light:set_final_position(pos)
			self._light_glow:set_final_position(pos)
		else
			self._light:set_final_position(to)
			self._light_glow:set_final_position(to)
			self._brush:cylinder(from, to, self._is_npc and 0.5 or 0.25)
		end
		if ray then
			local pos = mvec1
			--==Лазерный целеуказатель может потревожить нпс если светить им в глаза или рядом с головой==--
			local alert_event = {
				"aggression",
				pos,
				75,
				managers.groupai:state():get_unit_type_filter("civilians_enemies"),
				unit
			}
			managers.groupai:state():propagate_alert(alert_event)
		end
		self._custom_position = nil
		self._custom_rotation = nil
	end
end