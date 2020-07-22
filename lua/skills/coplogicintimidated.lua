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

function CopLogicIntimidated._chk_begin_alarm_pager(data)
	-- if managers.groupai:state():whisper_mode() and data.unit:unit_data().has_alarm_pager then
		-- data.brain:begin_alarm_pager()
	-- end
end