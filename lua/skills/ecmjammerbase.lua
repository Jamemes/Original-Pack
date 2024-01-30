local tmp_vec1 = Vector3()
function ECMJammerBase._detect_and_give_dmg(hit_pos, device_unit, user_unit, range)
	local mvec3_dis_sq = mvector3.distance_sq
	local slotmask = managers.slot:get_mask("bullet_impact_targets")
	local splinters = {
		mvector3.copy(hit_pos)
	}
	local dirs = {
		Vector3(range, 0, 0),
		Vector3(-range, 0, 0),
		Vector3(0, range, 0),
		Vector3(0, -range, 0),
		Vector3(0, 0, range),
		Vector3(0, 0, -range)
	}
	local pos = tmp_vec1
	for _, dir in ipairs(dirs) do
		mvector3.set(pos, dir)
		mvector3.add(pos, hit_pos)
		local splinter_ray = World:raycast("ray", hit_pos, pos, "slot_mask", slotmask)
		pos = (splinter_ray and splinter_ray.position or pos) - dir:normalized() * math.min(splinter_ray and splinter_ray.distance or 0, 10)
		local near_splinter = false
		for _, s_pos in ipairs(splinters) do
			if mvector3.distance_sq(pos, s_pos) < 300 then
				near_splinter = true

				break
			end
		end
		if not near_splinter then
			table.insert(splinters, mvector3.copy(pos))
		end
	end
	local range_sq = range * range
	local half_range_sq = range * 0.5
	half_range_sq = half_range_sq * half_range_sq
	local function _chk_apply_dmg_to_char(u_data)
		if not u_data.char_tweak.ecm_vulnerability then
			return
		end
		if u_data.unit.brain and u_data.unit:brain().is_hostage and u_data.unit:brain():is_hostage() then
			return
		end
		if u_data.unit:anim_data() and u_data.unit:anim_data().act then
			return
		end
		if u_data.char_tweak.ecm_vulnerability <= math.random() then
			return
		end
		local head_pos = u_data.unit:movement():m_head_pos()
		local dis_sq = mvec3_dis_sq(head_pos, hit_pos)
		if range_sq < dis_sq then
			return
		end
		for i_splinter, s_pos in ipairs(splinters) do
			if i_splinter == 1 or dis_sq < half_range_sq then
				local attack_data = {
					damage = 0,
					variant = "stun",
					attacker_unit = alive(user_unit) and user_unit or nil,
					weapon_unit = device_unit,
					col_ray = {
						position = mvector3.copy(head_pos),
						ray = (head_pos - s_pos):normalized()
					}
				}

				u_data.unit:character_damage():damage_explosion(attack_data)
				break
			end
		end
	end
	for u_key, u_data in pairs(managers.enemy:all_enemies()) do
		_chk_apply_dmg_to_char(u_data)
	end
	for u_key, u_data in pairs(managers.enemy:all_civilians()) do
		_chk_apply_dmg_to_char(u_data)
	end
end