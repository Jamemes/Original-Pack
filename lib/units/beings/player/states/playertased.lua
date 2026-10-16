local function get_contour_for_marked_enemy(enemy_type)
	local contour_type = "mark_enemy"

	if enemy_type == "swat_turret" or enemy_type == "sentry_gun" then
		contour_type = "mark_unit_dangerous"

		if managers.player:has_category_upgrade("player", "marked_enemy_extra_damage") then
			contour_type = "mark_unit_dangerous_damage_bonus"
		end

		if managers.player:has_category_upgrade("player", "marked_inc_dmg_distance") then
			contour_type = "mark_unit_dangerous_damage_bonus_distance"
		end
	else
		if managers.player:has_category_upgrade("player", "marked_enemy_extra_damage") then
			contour_type = "mark_enemy_damage_bonus"
		end

		if managers.player:has_category_upgrade("player", "marked_inc_dmg_distance") then
			contour_type = "mark_enemy_damage_bonus_distance"
		end
	end

	return contour_type
end

function PlayerTased:call_teammate(line, t, no_gesture, skip_alert)
	local voice_type, plural, prime_target = self:_get_unit_intimidation_action(true, false, false, true, false)
	local interact_type, queue_name = nil

	if voice_type == "stop_cop" or voice_type == "mark_cop" then
		local prime_target_tweak = tweak_data.character[prime_target.unit:base()._tweak_table]
		local shout_sound = prime_target_tweak.priority_shout

		if managers.groupai:state():whisper_mode() then
			shout_sound = prime_target_tweak.silent_priority_shout or shout_sound
		end

		if shout_sound then
			interact_type = "cmd_point"
			queue_name = "s07x_sin"

			if managers.player:has_category_upgrade("player", "special_enemy_highlight") then
				prime_target.unit:contour():add(get_contour_for_marked_enemy(), true, managers.player:upgrade_value("player", "mark_enemy_time_multiplier", 1))
			end
			if not self._tase_ended and managers.player:has_category_upgrade("player", "taser_self_shock") and prime_target.unit:key() == self._unit:character_damage():tase_data().attacker_unit:key() then
				self:_start_action_counter_tase(t, prime_target)
			end
		end
	end

	if interact_type then
		self:_do_action_intimidate(t, not no_gesture and interact_type or nil, queue_name, skip_alert)
	end
end

function PlayerTased:give_shock_to_taser()
	if not alive(self._counter_taser_unit) then
		return
	end

	self:_give_shock_to_taser(self._counter_taser_unit)
end

function PlayerTased:_give_shock_to_taser(taser_unit)
	local action_data = {
		variant = "counter_tased",
		damage = taser_unit:character_damage()._HEALTH_INIT * (tweak_data.upgrades.counter_taser_damage or 0.2),
		damage_effect = taser_unit:character_damage()._HEALTH_INIT * 2,
		attacker_unit = self._unit,
		attack_dir = -taser_unit:movement()._action_common_data.fwd,
		col_ray = {
			position = mvector3.copy(taser_unit:movement():m_head_pos()),
			body = taser_unit:body("body")
		}
	}

	taser_unit:character_damage():damage_melee(action_data)
end
