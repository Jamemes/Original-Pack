function GroupAIStateBase:has_room_for_police_hostage()
	local nr_hostages_allowed = 0
	for u_key, u_data in pairs(self._player_criminals) do
		if u_data.unit:base().is_local_player then
			if not managers.groupai:state():whisper_mode() and not managers.groupai:state():get_assault_mode() or managers.player:has_category_upgrade("player", "intimidate_enemies") then
				if managers.player:has_category_upgrade("player", "intimidate_aura") then
					nr_hostages_allowed = nr_hostages_allowed + 2
				else
					nr_hostages_allowed = nr_hostages_allowed + 1
				end
			end
		elseif not managers.groupai:state():whisper_mode() and not managers.groupai:state():get_assault_mode() or u_data.unit:base():upgrade_value("player", "intimidate_enemies") then
			if u_data.unit:base():upgrade_value("player", "intimidate_aura") then
				nr_hostages_allowed = nr_hostages_allowed + 2
			else
				nr_hostages_allowed = nr_hostages_allowed + 1
			end
		end
	end

	return nr_hostages_allowed > self._police_hostage_headcount + table.size(self._converted_police)
end

local _upd_criminal_suspicion_progress_original = GroupAIStateBase._upd_criminal_suspicion_progress
function GroupAIStateBase:_upd_criminal_suspicion_progress(...)
	if self._ai_enabled and managers.groupai:state():whisper_mode() then
		for obs_key, obs_susp_data in pairs(self._suspicion_hud_data or {}) do
			local unit = obs_susp_data.u_observer
			local function _sync_status(sync_status_code)
				if Network:is_server() and managers.network:session() then
					managers.network:session():send_to_peers_synched("suspicion_hud", unit, sync_status_code)
				end
			end
			
			if managers.enemy:is_civilian(unit) then
				local waypoint = managers.hud._hud.waypoints["susp1" .. tostring(obs_key)]
				
				
				if waypoint then
					if unit:anim_data().drop then
						if not obs_susp_data._subdued_civ then
							obs_susp_data._alerted_civ = nil
							obs_susp_data._subdued_civ = true
								waypoint.arrow:set_color(Color(0, 0.3, 0.5))
								waypoint.bitmap:set_image("guis/textures/pd2/hud_stealth_eye")
								obs_susp_data.expire_time = self._t + 8
							_sync_status(1)
						end
					elseif obs_susp_data.alerted then
						if not obs_susp_data._alerted_civ then
							obs_susp_data._subdued_civ = nil
							obs_susp_data._alerted_civ = true
							if managers.player:has_category_upgrade("player", "civs_show_markers") then
								waypoint.arrow:set_alpha(1)
								waypoint.bitmap:set_alpha(1)
							end
							_sync_status(2)
						end
					end
					if obs_susp_data._subdued_civ then
						if obs_susp_data.expire_time < self._t then
							waypoint.arrow:set_alpha(0)
							waypoint.bitmap:set_alpha(0)
						end
					elseif obs_susp_data.status == "calling" then
						waypoint.arrow:set_alpha(1)
						waypoint.bitmap:set_alpha(1)
						_sync_status(3)
					end
				end
			end
		end
	end
	
	return _upd_criminal_suspicion_progress_original(self, ...)
end