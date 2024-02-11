local mvec3_set = mvector3.set
local mvec3_add = mvector3.add
local mvec3_mul = mvector3.multiply
local mvec3_norm = mvector3.normalize
local math_clamp = math.clamp
local mvec_to = Vector3()
local mvec_right_ax = Vector3()
local mvec_up_ay = Vector3()
local mvec_spread_direction = Vector3()

function RaycastWeaponBase:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul)
	if self:gadget_overrides_weapon_functions() then
		return self:gadget_function_override("_fire_raycast", self, user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul)
	end

	local result = {}
	local ray_distance = self:weapon_range()
	local spread_x, spread_y = self:_get_spread(user_unit)
	spread_y = spread_y or spread_x
	spread_mul = spread_mul or 1

	mvector3.cross(mvec_right_ax, direction, math.UP)
	mvec3_norm(mvec_right_ax)
	mvector3.cross(mvec_up_ay, direction, mvec_right_ax)
	mvec3_norm(mvec_up_ay)
	mvec3_set(mvec_spread_direction, direction)

	local theta = math.random() * 360

	mvec3_mul(mvec_right_ax, math.rad(math.sin(theta) * math.random() * spread_x * spread_mul))
	mvec3_mul(mvec_up_ay, math.rad(math.cos(theta) * math.random() * spread_y * spread_mul))
	mvec3_add(mvec_spread_direction, mvec_right_ax)
	mvec3_add(mvec_spread_direction, mvec_up_ay)
	mvec3_set(mvec_to, mvec_spread_direction)
	mvec3_mul(mvec_to, ray_distance)
	mvec3_add(mvec_to, from_pos)

	local ray_hits, hit_enemy, enemies_hit = self:_collect_hits(from_pos, mvec_to)

	if self._autoaim and self._autohit_data then
		local weight = 0.1

		if hit_enemy then
			self._autohit_current = (self._autohit_current + weight) / (1 + weight)
		else
			local auto_hit_candidate, enemies_to_suppress = self:check_autoaim(from_pos, direction, nil, nil, nil, true)
			result.enemies_in_cone = enemies_to_suppress or false

			if auto_hit_candidate then
				local autohit_chance = self:get_current_autohit_chance_for_roll()

				if autohit_mul then
					autohit_chance = autohit_chance * autohit_mul
				end

				if math.random() < autohit_chance then
					self._autohit_current = (self._autohit_current + weight) / (1 + weight)

					mvec3_set(mvec_spread_direction, auto_hit_candidate.ray)
					mvec3_set(mvec_to, mvec_spread_direction)
					mvec3_mul(mvec_to, ray_distance)
					mvec3_add(mvec_to, from_pos)

					ray_hits, hit_enemy, enemies_hit = self:_collect_hits(from_pos, mvec_to)
				end
			end

			if hit_enemy then
				self._autohit_current = (self._autohit_current + weight) / (1 + weight)
			elseif auto_hit_candidate then
				self._autohit_current = self._autohit_current / (1 + weight)
			end
		end
	end

	local hit_count = 0
	local hit_anyone = false
	local cop_kill_count = 0
	local hit_through_wall = false
	local hit_through_shield = false
	local is_civ_f = CopDamage.is_civilian
	local damage = self:_get_current_damage(dmg_mul)

	for _, hit in ipairs(ray_hits) do
		local dmg = self:get_damage_falloff(damage, hit, user_unit)

		if dmg > 0 then
			local hit_result = self:bullet_class():on_collision(hit, self._unit, user_unit, dmg)
			hit_through_wall = hit_through_wall or hit.unit:in_slot(self.wall_mask)
			hit_through_shield = hit_through_shield or hit.unit:in_slot(self.shield_mask) and alive(hit.unit:parent())
			
			if hit_through_shield then
				damage = damage * 0.25
			elseif hit_through_wall then
				damage = damage * 0.5
			end
			
			if hit_result then
				hit.damage_result = hit_result
				hit_anyone = true
				hit_count = hit_count + 1

				if hit_result.type == "death" then
					local unit_base = hit.unit:base()
					local unit_type = unit_base and unit_base._tweak_table
					local is_civilian = unit_type and is_civ_f(unit_type)

					if not is_civilian then
						cop_kill_count = cop_kill_count + 1
					end

					self:_check_kill_achievements(cop_kill_count, unit_base, unit_type, is_civilian, hit_through_wall, hit_through_shield)
				end
			end
		end
	end

	self:_check_tango_achievements(cop_kill_count)

	result.hit_enemy = hit_anyone

	if self._autoaim then
		self._shot_fired_stats_table.hit = hit_anyone
		self._shot_fired_stats_table.hit_count = hit_count

		if not self._ammo_data or not self._ammo_data.ignore_statistic then
			managers.statistics:shot_fired(self._shot_fired_stats_table)
		end
	end

	local furthest_hit = ray_hits[#ray_hits]

	if (not furthest_hit or furthest_hit.distance > 600) and alive(self._obj_fire) then
		self._obj_fire:m_position(self._trail_effect_table.position)
		mvec3_set(self._trail_effect_table.normal, mvec_spread_direction)

		local trail = World:effect_manager():spawn(self._trail_effect_table)

		if furthest_hit then
			World:effect_manager():set_remaining_lifetime(trail, math_clamp((furthest_hit.distance - 600) / 10000, 0, furthest_hit.distance))
		end
	end

	if result.enemies_in_cone == nil then
		result.enemies_in_cone = self._suppression and self:check_suppression(from_pos, direction, enemies_hit) or nil
	elseif enemies_hit and self._suppression then
		result.enemies_in_cone = result.enemies_in_cone or {}
		local all_enemies = managers.enemy:all_enemies()

		for u_key, enemy in pairs(enemies_hit) do
			if all_enemies[u_key] then
				result.enemies_in_cone[u_key] = {
					error_mul = 1,
					unit = enemy
				}
			end
		end
	end

	if self._alert_events then
		result.rays = ray_hits
	end

	return result
end