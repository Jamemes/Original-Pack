function MenuCallbackHandler:_increase_infamous(yes_clbk)
	managers.menu_scene:destroy_infamy_card()

	if managers.experience:current_level() < 100 or managers.experience:current_rank() >= #tweak_data.infamy.ranks then
		return
	end

	local rank = managers.experience:current_rank() + 1

	managers.experience:reset()
	managers.skilltree:reset()
	managers.experience:set_current_rank(rank)

	local offshore_cost = Application:digest_value(tweak_data.infamy.ranks[rank], false)

	if offshore_cost > 0 then
		managers.money:deduct_from_total(managers.money:total())
		managers.money:deduct_from_offshore(offshore_cost)
	end

	managers.skilltree:infamy_reset()
	managers.blackmarket:reset_equipped()

	if managers.menu_component then
		managers.menu_component:refresh_player_profile_gui()
	end

	local logic = managers.menu:active_menu().logic

	if logic then
		logic:refresh_node()
		logic:select_item("crimenet")
	end

	managers.savefile:save_progress()
	managers.savefile:save_setting(true)
	if managers.experience:current_rank() >= 15 then
		managers.menu:post_event("infamous_ace_join_stinger")
	elseif managers.experience:current_rank() == 14 then
		managers.menu:post_event("infamous_ace_join_stinger")
	elseif managers.experience:current_rank() > 10 then
		managers.menu:post_event("infamous_elite_join_stinger")
	else
		managers.menu:post_event("infamous_player_join_stinger")
	end
	if yes_clbk then
		yes_clbk()
	end

	if SystemInfo:distribution() == Idstring("STEAM") then
		managers.statistics:publish_level_to_steam()
	end
end