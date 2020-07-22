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
function GroupAIStateBase:set_reason_called(called_reason)
local id = Global.game_settings.level_id
	self._called_reason = self._called_reason or called_reason
	if Global.game_settings.job_plan == 2 then
		if id == "kosugi" then
		elseif id == "cage" then
		elseif id == "dark" then
		elseif id == "fish" then
		elseif id == "tag" then
		elseif id == "election_day_3" then
		elseif id == "election_day_3_skip1" then
		elseif id == "election_day_3_skip2" then
		elseif id == "welcome_to_the_jungle_2" then
		elseif id == "watchdogs_1" then
		elseif id == "watchdogs_2" then
		elseif id == "watchdogs_1_night" then
		elseif id == "watchdogs_2_day" then
		elseif id == "alex_1" then
		elseif id == "alex_2" then
		elseif id == "alex_3" then
		elseif id == "escape_cafe" then
		elseif id == "escape_park" then
		elseif id == "escape_cafe_day" then
		elseif id == "escape_park_day" then
		elseif id == "escape_street" then
		elseif id == "escape_overpass" then
		elseif id == "escape_garage" then
		elseif id == "escape_overpass_night" then
		elseif id == "arm_fac" then
		elseif id == "arm_par" then
		elseif id == "arm_hcm" then
		elseif id == "arm_cro" then
		elseif id == "arm_und" then
		elseif id == "mia_1" then
		elseif id == "mia_2" then
		elseif id == "mia2_new" then
		elseif id == "hox_1" then
		elseif id == "hox_2" then
		elseif id == "pines" then
		elseif id == "crojob3" then
		elseif id == "crojob3_night" then
		elseif id == "rat" then
		elseif id == "shoutout_raid" then
		elseif id == "driving_escapes_industry_day" then
		elseif id == "driving_escapes_city_day" then
		elseif id == "jolly" then
		elseif id == "cane" then
		elseif id == "dinner" then
		elseif id == "pbr" then
		elseif id == "pbr2" then
		elseif id == "peta" then
		elseif id == "peta2" then
		elseif id == "pal" then
		elseif id == "nail" then
		elseif id == "man" then
		elseif id == "mad" then
		elseif id == "born" then
		elseif id == "chew" then
		elseif id == "flat" then
		elseif id == "help" then
		elseif id == "haunted" then
		elseif id == "moon" then
		elseif id == "spa" then
		elseif id == "run" then
		elseif id == "glace" then
		elseif id == "rvd1" then
		elseif id == "rvd2" then
		elseif id == "hvh" then
		elseif id == "wwh" then
		elseif id == "brb" then
		elseif id == "des" then
		elseif id == "nmh" then
		elseif id == "bph" then
		elseif id == "mex_cooking" then
		else
			managers.vote:_restart_counter()
		end
	end
end