local _upd_criminal_suspicion_progress_original = GroupAIStateBase._upd_criminal_suspicion_progress

function GroupAIStateBase:_upd_criminal_suspicion_progress(...)
	if self._ai_enabled then
		for obs_key, obs_susp_data in pairs(self._suspicion_hud_data or {}) do
			local unit = obs_susp_data.u_observer
			
			if managers.enemy:is_civilian(unit) then
				local waypoint = managers.hud._hud.waypoints["susp1" .. tostring(obs_key)]
				
				if waypoint then
					if unit:anim_data().drop then
						if not obs_susp_data._subdued_civ then
							obs_susp_data._alerted_civ = nil
							obs_susp_data._subdued_civ = true
							if managers.player:has_category_upgrade("player", "civs_show_markers") then
								waypoint.bitmap:set_color(Color())
								waypoint.arrow:set_color(Color())
							else
								obs_susp_data.expire_t = self._t + 8
								waypoint.arrow:set_color(Color(0, 0.3, 0.5))
								waypoint.bitmap:set_image("guis/textures/pd2/hud_stealth_eye")
							end
						end
					elseif obs_susp_data.alerted then
						if not obs_susp_data._alerted_civ then
							obs_susp_data._subdued_civ = nil
							obs_susp_data._alerted_civ = true
							waypoint.bitmap:set_color(Color.white)
							waypoint.arrow:set_color(tweak_data.hud.detected_color:with_alpha(0.75))
						end
					end
				end
			end
		end
	end
	
	return _upd_criminal_suspicion_progress_original(self, ...)
end

function GroupAIStateBase:has_room_for_police_hostage()
	local nr_hostages_allowed = 0
	local difficulty = Global.game_settings and Global.game_settings.difficulty
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	for u_key, u_data in pairs(self._player_criminals) do
		if u_data.unit:base().is_local_player then
			if difficulty_index <= 3 or managers.player:has_category_upgrade("player", "intimidate_enemies") then
				nr_hostages_allowed = nr_hostages_allowed + 1
			end
		elseif difficulty_index <= 3 or u_data.unit:base():upgrade_value("player", "intimidate_enemies") then
			nr_hostages_allowed = nr_hostages_allowed + 1
		end
	end

	return nr_hostages_allowed > self._police_hostage_headcount + table.size(self._converted_police)
end