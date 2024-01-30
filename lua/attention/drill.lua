local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
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
		if difficulty_index > 5 then
			managers.groupai:state():propagate_alert(alert_event)
		end
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
				if difficulty_index > 5 then
					managers.groupai:state():propagate_alert(alert_event)
				end
			return
		end
	end
end)
