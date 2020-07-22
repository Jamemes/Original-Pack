if string.lower(RequiredScript) == "lib/units/enemies/cop/logics/coplogicidle" then
	function CopLogicIdle.on_intimidated(data, amount, aggressor_unit)
		local surrender = false
		local my_data = data.internal_data
		data.t = TimerManager:game():time()

		if not aggressor_unit:movement():team().foes[data.unit:movement():team().id] then
			return
		end

		if managers.groupai:state():has_room_for_police_hostage() then
			local i_am_special = managers.groupai:state():is_enemy_special(data.unit)
			local required_skill = i_am_special and "intimidate_specials" or "intimidate_enemies"
			local aggressor_can_intimidate = nil
			local aggressor_intimidation_mul = 1

			if aggressor_unit:base().is_local_player then
				aggressor_can_intimidate = managers.player:has_category_upgrade("player", required_skill)
				aggressor_intimidation_mul = aggressor_intimidation_mul * managers.player:upgrade_value("player", "empowered_intimidation_mul", 1) * managers.player:upgrade_value("player", "intimidation_multiplier", 1)
			else
				aggressor_can_intimidate = aggressor_unit:base():upgrade_value("player", required_skill)
				aggressor_intimidation_mul = aggressor_intimidation_mul * (aggressor_unit:base():upgrade_value("player", "empowered_intimidation_mul") or 1) * (aggressor_unit:base():upgrade_value("player", "intimidation_multiplier") or 1)
			end

			if not managers.groupai:state():whisper_mode() and not managers.groupai:state():get_assault_mode() or aggressor_can_intimidate then
				local hold_chance = CopLogicBase._evaluate_reason_to_surrender(data, my_data, aggressor_unit)

				if hold_chance then
					hold_chance = hold_chance^aggressor_intimidation_mul

					if hold_chance >= 1 then
						-- Nothing
					else
						local rand_nr = math.random()

						print("and the winner is: hold_chance", hold_chance, "rand_nr", rand_nr, "rand_nr > hold_chance", hold_chance < rand_nr)

						if hold_chance < rand_nr then
							surrender = true
						end
					end
				end
			end

			if surrender then
				CopLogicIdle._surrender(data, amount, aggressor_unit)
			else
				data.unit:brain():on_surrender_chance()
			end
		end

		CopLogicBase.identify_attention_obj_instant(data, aggressor_unit:key())
		managers.groupai:state():criminal_spotted(aggressor_unit)

		return surrender
	end
end
if string.lower(RequiredScript) == "lib/managers/group_ai_states/groupaistatebase" then
	function GroupAIStateBase:has_room_for_police_hostage()
		local nr_hostages_allowed = 0
		for u_key, u_data in pairs(self._player_criminals) do
			if u_data.unit:base().is_local_player then
				if not managers.groupai:state():whisper_mode() and not managers.groupai:state():get_assault_mode() or managers.player:has_category_upgrade("player", "intimidate_enemies") then
					nr_hostages_allowed = nr_hostages_allowed + 1
				end
			elseif not managers.groupai:state():whisper_mode() and not managers.groupai:state():get_assault_mode() or u_data.unit:base():upgrade_value("player", "intimidate_enemies") then
				nr_hostages_allowed = nr_hostages_allowed + 1
			end
		end

		return nr_hostages_allowed > self._police_hostage_headcount + table.size(self._converted_police)
	end
end
if string.lower(RequiredScript) == "lib/units/enemies/cop/logics/coplogicintimidated" then
	function CopLogicIntimidated._start_action_hands_up(data)
		local my_data = data.internal_data
		local anim_name = "hands_up"
		local action_data = {
			type = "act",
			body_part = 1,
			variant = anim_name,
			clamp_to_graph = true,
			blocks = {
				light_hurt = -1,
				hurt = -1,
				heavy_hurt = -1,
				walk = -1
			}
		}
		my_data.act_action = data.unit:brain():action_request(action_data)
		if my_data.act_action and data.unit:anim_data().hands_tied then
			CopLogicIntimidated._do_tied(data, my_data.aggressor_unit)
		end
	end
	function CopLogicIntimidated._chk_begin_alarm_pager(data) end
end