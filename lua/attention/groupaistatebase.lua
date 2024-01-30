--==Соседи будут звонить в полицию через некоторое время, после того был издан шум определенного радиуса. (Радиус по умолчанию - 2450)==--
Hooks:PreHook(GroupAIStateBase, "propagate_alert", "GroupAIStateBase_propagate_alert", function(self, alert_data)
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)
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
				if managers.groupai:state():whisper_mode() and difficulty_index > 3 then
					managers.enemy:add_delayed_clbk(nil, callback(self, self, "_on_neighbours_called"), self._t + tweak_data.neighbours_trigger_delay)
				end
			end
		end
	end
end)
