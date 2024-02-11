function PlayerStandard:_get_interaction_speed()
	local dt = managers.player:player_timer():delta_time()
	if PlayerManager.walking_bleedout > 0 then
		local maxed = 1 - tweak_data.upgrades.walking_bleedout_interaction_time_penalty
		local wb_ttr = managers.player:upgrade_value("player", "walking_bleedout_ticks_to_ressurection", 120)
		local pm_wb =  (wb_ttr - PlayerManager.walking_bleedout)
		local total = (maxed - (maxed / wb_ttr * pm_wb))
		dt = dt * (tweak_data.upgrades.walking_bleedout_interaction_time_penalty + total)
	end
	
	local morale_boost_bonus = self._ext_movement:morale_boost()
	if morale_boost_bonus then
		dt = dt * morale_boost_bonus.move_speed_bonus
	end
	
	return dt
end