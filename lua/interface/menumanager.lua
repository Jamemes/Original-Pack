function MenuSkirmishContractInitiator:modify_node(original_node, data)
	local node = deep_clone(original_node)
	data = data or {}

	if Global.game_settings.single_player then
		node:item("toggle_ai"):set_value(Global.game_settings.team_ai and Global.game_settings.team_ai_option or 0)
	elseif not data.server then
		node:item("lobby_kicking_option"):set_value(Global.game_settings.kick_option)
		node:item("lobby_permission"):set_value(Global.game_settings.permission)
		node:item("lobby_reputation_permission"):set_value(Global.game_settings.reputation_permission)
		node:item("lobby_drop_in_option"):set_value(Global.game_settings.drop_in_option)
		node:item("toggle_ai"):set_value(Global.game_settings.team_ai and Global.game_settings.team_ai_option or 0)
		node:item("toggle_auto_kick"):set_value(Global.game_settings.auto_kick and "on" or "off")
		node:item("toggle_allow_modded_players"):set_value(Global.game_settings.allow_modded_players and "on" or "off")
		node:item("toggle_ai"):set_visible(false)
	end

	if data and data.back_callback then
		table.insert(node:parameters().back_callback, data.back_callback)
	end

	node:parameters().menu_component_data = data

	return node
end

function MenuCrimeNetContractInitiator:modify_node(original_node, data)
	local node = deep_clone(original_node)
	local plvl = managers.experience:current_level()
	local prank = managers.experience:current_rank()
	local sm_wish = {"menu_difficulty_sm_wish"}
	local apocalypse = {"menu_difficulty_apocalypse"}

	
	if plvl >= 80 or prank >= 1 then
		if apocalypse ~= nil then
			local diff_filter = node:item("difficulty")
			if diff_filter ~= nil then
				for k, v in ipairs(apocalypse) do
					diff_filter:add_option(CoreMenuItemOption.ItemOption:new({
						_meta = "option",
						text_id = managers.localization:text(v),
						value = 6,
						localize = false
					}))
				end
			end
		end
	end
	
	if prank >= 15 then
	elseif prank >= 11 then
		if sm_wish ~= nil then
			local diff_filter = node:item("difficulty")
			if diff_filter ~= nil then
				for k, v in ipairs(sm_wish) do
					diff_filter:add_option(CoreMenuItemOption.ItemOption:new({
						_meta = "option",
						text_id = managers.localization:text(v),
						value = 7,
						localize = false
					}))
				end
			end
		end
	end
	if Global.game_settings.single_player then
		node:item("toggle_ai"):set_value(Global.game_settings.team_ai and Global.game_settings.team_ai_option or 0)
	elseif data.smart_matchmaking then
		-- Nothing
	elseif not data.server then
		node:item("lobby_job_plan"):set_value(Global.game_settings.job_plan)
		node:item("lobby_kicking_option"):set_value(Global.game_settings.kick_option)
		node:item("lobby_permission"):set_value(Global.game_settings.permission)
		node:item("lobby_reputation_permission"):set_value(Global.game_settings.reputation_permission)
		node:item("lobby_drop_in_option"):set_value(Global.game_settings.drop_in_option)
		node:item("toggle_ai"):set_value(Global.game_settings.team_ai and Global.game_settings.team_ai_option or 0)
		node:item("toggle_auto_kick"):set_value(Global.game_settings.auto_kick and "on" or "off")
		node:item("toggle_allow_modded_players"):set_value(Global.game_settings.allow_modded_players and "on" or "off")
		node:item("toggle_allow_modded_players"):set_visible(false)
		node:item("toggle_ai"):set_visible(false)
		if tweak_data.quickplay.stealth_levels[data.job_id] then
			local job_plan_item = node:item("lobby_job_plan")
			local stealth_option = nil

			for _, option in ipairs(job_plan_item:options()) do
				if option:value() == 2 then
					stealth_option = option

					break
				end
			end

			job_plan_item:clear_options()
			job_plan_item:add_option(stealth_option)
		end
	end

	if data.customize_contract then
		node:set_default_item_name("buy_contract")

		local job_data = data

		if job_data and job_data.job_id then
			local buy_contract_item = node:item("buy_contract")

			if buy_contract_item then
				local can_afford = managers.money:can_afford_buy_premium_contract(job_data.job_id, job_data.difficulty_id or 3)
				buy_contract_item:parameters().text_id = can_afford and "menu_cn_premium_buy_accept" or "menu_cn_premium_cannot_buy"
				buy_contract_item:parameters().disabled_color = Color(1, 0.6, 0.2, 0.2)

				buy_contract_item:set_enabled(can_afford)
			end
		end

		node:item("toggle_one_down"):set_value("off")
	end

	if tweak_data.narrative:is_job_locked(data.job_id) then
		node:item("accept_contract"):set_enabled(false)
	end

	if data and data.back_callback then
		table.insert(node:parameters().back_callback, data.back_callback)
	end
	node:parameters().menu_component_data = data

	return node
end

function LobbyOptionInitiator:modify_node(node)
	MenuManager.refresh_level_select(node, Network:is_server())

	local item_permission_campaign = node:item("lobby_permission")

	if item_permission_campaign then
		item_permission_campaign:set_value(Global.game_settings.permission)
	end

	local item_lobby_drop_in_option = node:item("lobby_drop_in_option")

	if item_lobby_drop_in_option then
		item_lobby_drop_in_option:set_value(Global.game_settings.drop_in_option)
	end

	local item_lobby_toggle_ai = node:item("toggle_ai")

	if item_lobby_toggle_ai then
		item_lobby_toggle_ai:set_value(Global.game_settings.team_ai and Global.game_settings.team_ai_option or 0)
	end

	local item_lobby_toggle_auto_kick = node:item("toggle_auto_kick")

	if item_lobby_toggle_auto_kick then
		item_lobby_toggle_auto_kick:set_value(Global.game_settings.auto_kick and "on" or "off")
	end

	local item_lobby_toggle_modded_players = node:item("toggle_allow_modded_players")

	if item_lobby_toggle_modded_players then
		item_lobby_toggle_modded_players:set_value(Global.game_settings.allow_modded_players and "on" or "off")
		item_lobby_toggle_modded_players:set_visible(false)
	end

	local character_item = node:item("choose_character")

	if character_item then
		local value = managers.network:session() and managers.network:session():local_peer():character() or "random"

		character_item:set_value(value)
	end

	local reputation_permission_item = node:item("lobby_reputation_permission")

	if reputation_permission_item then
		reputation_permission_item:set_value(Global.game_settings.reputation_permission)
	end

	local item_lobby_job_plan = node:item("lobby_job_plan")

	if item_lobby_job_plan then
		item_lobby_job_plan:set_value(Global.game_settings.job_plan or -1)

		if tweak_data.quickplay.stealth_levels[managers.job:current_real_job_id()] then
			local stealth_option = nil

			for _, option in ipairs(item_lobby_job_plan:options()) do
				if option:value() == 2 then
					stealth_option = option

					break
				end
			end

			item_lobby_job_plan:clear_options()
			item_lobby_job_plan:add_option(stealth_option)
		end

		item_lobby_job_plan:set_visible(not managers.skirmish:is_skirmish())
	end
	return node
end

function MenuCrimeNetFiltersInitiator:update_node(node)
	if MenuCallbackHandler:is_win32() then
		local not_friends_only = not Global.game_settings.search_friends_only
	
		node:item("toggle_new_servers_only"):set_enabled(not_friends_only)
		node:item("toggle_server_state_lobby"):set_enabled(not_friends_only)
		node:item("toggle_job_appropriate_lobby"):set_enabled(not_friends_only)
		node:item("toggle_mutated_lobby"):set_enabled(not_friends_only)
		node:item("max_lobbies_filter"):set_enabled(not_friends_only)
		node:item("server_filter"):set_enabled(not_friends_only)
		node:item("kick_option_filter"):set_enabled(not_friends_only)
		node:item("job_id_filter"):set_enabled(not_friends_only)
		node:item("job_plan_filter"):set_enabled(not_friends_only)
		node:item("toggle_job_appropriate_lobby"):set_visible(self:is_standard())
		node:item("toggle_allow_safehouses"):set_visible(self:is_standard())
		node:item("toggle_mutated_lobby"):set_visible(self:is_standard())
		node:item("toggle_one_down_lobby"):set_visible(self:is_standard())
		node:item("difficulty_filter"):set_visible(false)
		node:item("difficulty"):set_visible(self:is_standard())
		node:item("job_id_filter"):set_visible(self:is_standard())
		node:item("max_spree_difference_filter"):set_visible(self:is_crime_spree())
		node:item("toggle_weekly_skirmish_filter"):set_visible(self:is_skirmish())
		node:item("skirmish_wave_filter"):set_visible(self:is_skirmish())
		node:item("job_plan_filter"):set_visible(not self:is_skirmish())
	elseif MenuCallbackHandler:is_xb1() then
		if Global.game_settings.search_crimespree_lobbies then
			print("GN: CS lobby set to true")
			node:item("difficulty_filter"):set_enabled(false)
			node:item("max_spree_difference_filter"):set_enabled(true)
		else
			print("GN: CS lobby set to false")
			node:item("difficulty_filter"):set_enabled(true)
			node:item("max_spree_difference_filter"):set_enabled(false)
		end

		if Global.game_settings.search_crimespree_lobbies then
			node:item("toggle_mutated_lobby"):set_enabled(false)
		elseif Global.game_settings.search_mutated_lobbies then
			node:item("toggle_crimespree_lobby"):set_enabled(false)
		else
			node:item("toggle_mutated_lobby"):set_enabled(true)
			node:item("toggle_crimespree_lobby"):set_enabled(true)
		end
	end
end

function MenuCrimeNetFiltersInitiator:add_filters(node)
	if node:item("divider_end") then
		return
	end
	
	local params = {
		callback = "choice_difficulty_filter",
		name = "difficulty",
		text_id = "menu_diff_filter",
		help_id = "menu_diff_help",
		filter = true
	}
	local data_node
	local prank = managers.experience:current_rank()
	if prank >= 15 then
		data_node = {
				{
				value = -1,
				text_id = "menu_any",
				_meta = "option"
			},
			{
				value = 2,
				text_id = "menu_difficulty_normal",
				_meta = "option"
			},
			{
				value = 3,
				text_id = "menu_difficulty_hard",
				_meta = "option"
			},
			{
				value = 4,
				text_id = "menu_difficulty_very_hard",
				_meta = "option"
			},
			{
				value = 5,
				text_id = "menu_difficulty_overkill",
				_meta = "option"
			},
			{
				value = 6,
				text_id = "menu_difficulty_apocalypse",
				_meta = "option"
			},
			type = "MenuItemMultiChoice"
		}
	elseif prank >= 11 then
		data_node = {
				{
				value = -1,
				text_id = "menu_any",
				_meta = "option"
			},
			{
				value = 2,
				text_id = "menu_difficulty_normal",
				_meta = "option"
			},
			{
				value = 3,
				text_id = "menu_difficulty_hard",
				_meta = "option"
			},
			{
				value = 4,
				text_id = "menu_difficulty_very_hard",
				_meta = "option"
			},
			{
				value = 5,
				text_id = "menu_difficulty_overkill",
				_meta = "option"
			},
			{
				value = 6,
				text_id = "menu_difficulty_apocalypse",
				_meta = "option"
			},
			{
				value = 7,
				text_id = "menu_difficulty_sm_wish",
				_meta = "option"
			},
			type = "MenuItemMultiChoice"
		}
	else
		data_node = {
				{
				value = -1,
				text_id = "menu_any",
				_meta = "option"
			},
			{
				value = 2,
				text_id = "menu_difficulty_normal",
				_meta = "option"
			},
			{
				value = 3,
				text_id = "menu_difficulty_hard",
				_meta = "option"
			},
			{
				value = 4,
				text_id = "menu_difficulty_very_hard",
				_meta = "option"
			},
			{
				value = 5,
				text_id = "menu_difficulty_overkill",
				_meta = "option"
			},
			{
				value = 6,
				text_id = "menu_difficulty_apocalypse",
				_meta = "option"
			},
			type = "MenuItemMultiChoice"
		}
	end
	local new_item = node:create_item(data_node, params)

	new_item:set_value(managers.network.matchmake:difficulty_filter())
	node:add_item(new_item)

	local params = {
		visible_callback = "is_multiplayer is_win32",
		name = "job_id_filter",
		callback = "choice_job_id_filter",
		text_id = "menu_job_id_filter",
		filter = true
	}
	local data_node = {
		{
			value = -1,
			text_id = "menu_any",
			_meta = "option"
		},
		type = "MenuItemMultiChoice"
	}

	for index, job_id in ipairs(tweak_data.narrative:get_jobs_index()) do
		local job_tweak = tweak_data.narrative.jobs[job_id]
		local contact = job_tweak.contact
		local contact_tweak = tweak_data.narrative.contacts[contact]
		local allow = not job_tweak.wrapped_to_job and contact ~= "tests" and (not job_tweak or not job_tweak.hidden)

		if allow then
			local text_id, color_data = tweak_data.narrative:create_job_name(job_id)
			local params = {
				localize = false,
				_meta = "option",
				text_id = text_id,
				value = index
			}

			for count, color in ipairs(color_data) do
				params["color" .. count] = color.color
				params["color_start" .. count] = color.start
				params["color_stop" .. count] = color.stop
			end

			table.insert(data_node, params)
		end
	end

	local new_item = node:create_item(data_node, params)

	new_item:set_value(managers.network.matchmake:get_lobby_filter("job_id") or -1)
	node:add_item(new_item)

	local params = {
		visible_callback = "is_multiplayer is_win32",
		name = "kick_option_filter",
		callback = "choice_kick_option",
		text_id = "menu_kicking_allowed_filter",
		filter = true
	}
	local data_node = {
		{
			value = -1,
			text_id = "menu_any",
			_meta = "option"
		},
		type = "MenuItemMultiChoice"
	}
	local kick_filters = {
		{
			value = 1,
			text_id = "menu_kick_server"
		},
		{
			value = 2,
			text_id = "menu_kick_vote"
		},
		{
			value = 0,
			text_id = "menu_kick_disabled"
		}
	}

	for index, filter in ipairs(kick_filters) do
		table.insert(data_node, {
			_meta = "option",
			text_id = filter.text_id,
			value = filter.value
		})
	end

	local new_item = node:create_item(data_node, params)

	new_item:set_value(managers.network.matchmake:get_lobby_filter("kick_option") or -1)
	node:add_item(new_item)

	local params = {
		size = 8,
		name = "divider_end",
		no_text = true
	}
	local data_node = {type = "MenuItemDivider"}
	local new_item = node:create_item(data_node, params)

	node:add_item(new_item)

	local params = {
		callback = "_reset_filters",
		name = "reset_filters",
		align = "right",
		text_id = "dialog_reset_filters"
	}
	local data_node = {}
	local new_item = node:create_item(data_node, params)

	node:add_item(new_item)
	self:modify_node(node, {})
end

function MenuCallbackHandler:is_contract_difficulty_allowed(item)
	if not managers.menu:active_menu() then
		return false
	end

	if not managers.menu:active_menu().logic then
		return false
	end

	if not managers.menu:active_menu().logic:selected_node() then
		return false
	end

	if not managers.menu:active_menu().logic:selected_node():parameters().menu_component_data then
		return false
	end

	local job_data = managers.menu:active_menu().logic:selected_node():parameters().menu_component_data

	if not job_data.job_id then
		return false
	end

	if job_data.professional and item:value() < 3 then
		return false
	end	
	if item:value() == 7 then
		return false
	end	
	if item:value() == 6 then
		return false
	end	

	if not job_data.professional and item:value() > 2 then
		-- Nothing
	end

	local job_jc = tweak_data.narrative:job_data(job_data.job_id).jc
	local difficulty_jc = (item:value() - 2) * 10
	local plvl = managers.experience:current_level()
	local prank = managers.experience:current_rank()
	if prank >= 15 then
		self._level_lock = tweak_data.difficulty_level_locks_infamy[item:value()] or 0
	elseif prank >= 11 then
		self._level_lock = tweak_data.difficulty_level_locks_infamy_elite[item:value()] or 0
	elseif prank >= 1 then
		self._level_lock = tweak_data.difficulty_level_locks_infamy[item:value()] or 0
	else
		self._level_lock = tweak_data.difficulty_level_locks[item:value()] or 0
	end
	local is_not_level_locked = self._level_lock <= plvl

	return is_not_level_locked and math.clamp(job_jc + difficulty_jc, 0, 100) <= managers.job:get_max_jc_for_player()
end

function MenuCrimeNetContactChillInitiator:modify_node(original_node, data)
	local node = original_node

	node:clean_items()

	local prank = managers.experience:current_rank()
	local params = {
		callback = "_on_chill_change_difficulty",
		name = "difficulty",
		text_id = "menu_lobby_difficulty_title",
		help_id = "menu_diff_help",
		filter = true
	}
	local data_node
	if prank >= 15 then
		data_node = {
			{
				value = "normal",
				text_id = "menu_difficulty_normal",
				_meta = "option"
			},
			{
				value = "hard",
				text_id = "menu_difficulty_hard",
				_meta = "option"
			},
			{
				value = "overkill",
				text_id = "menu_difficulty_very_hard",
				_meta = "option"
			},
			{
				value = "overkill_145",
				text_id = "menu_difficulty_overkill",
				_meta = "option"
			},
			{
				value = "overkill_290",
				text_id = "menu_difficulty_apocalypse",
				_meta = "option"
			},
			type = "MenuItemMultiChoice"
		}
	elseif prank >= 11 then
		data_node = {
			{
				value = "normal",
				text_id = "menu_difficulty_normal",
				_meta = "option"
			},
			{
				value = "hard",
				text_id = "menu_difficulty_hard",
				_meta = "option"
			},
			{
				value = "overkill",
				text_id = "menu_difficulty_very_hard",
				_meta = "option"
			},
			{
				value = "overkill_145",
				text_id = "menu_difficulty_overkill",
				_meta = "option"
			},
			{
				value = "overkill_290",
				text_id = "menu_difficulty_apocalypse",
				_meta = "option"
			},
			{
				value = "sm_wish",
				text_id = "menu_difficulty_sm_wish",
				_meta = "option"
			},
			type = "MenuItemMultiChoice"
		}
	else
		data_node = {
			{
				value = "normal",
				text_id = "menu_difficulty_normal",
				_meta = "option"
			},
			{
				value = "hard",
				text_id = "menu_difficulty_hard",
				_meta = "option"
			},
			{
				value = "overkill",
				text_id = "menu_difficulty_very_hard",
				_meta = "option"
			},
			{
				value = "overkill_145",
				text_id = "menu_difficulty_overkill",
				_meta = "option"
			},
			{
				value = "overkill_290",
				text_id = "menu_difficulty_apocalypse",
				_meta = "option"
			},
			type = "MenuItemMultiChoice"
		}
	end
	local new_item = node:create_item(data_node, params)

	new_item:set_enabled(true)
	node:add_item(new_item)

	params = {
		callback = "_on_chill_change_one_down",
		name = "toggle_one_down",
		text_id = "menu_toggle_one_down"
	}
	data_node = {
		{
			w = "24",
			y = "0",
			h = "24",
			s_y = "24",
			value = "on",
			s_w = "24",
			s_h = "24",
			s_x = "24",
			_meta = "option",
			icon = "guis/textures/menu_tickbox",
			x = "24",
			s_icon = "guis/textures/menu_tickbox"
		},
		{
			w = "24",
			y = "0",
			h = "24",
			s_y = "24",
			value = "off",
			s_w = "24",
			s_h = "24",
			s_x = "0",
			_meta = "option",
			icon = "guis/textures/menu_tickbox",
			x = "0",
			s_icon = "guis/textures/menu_tickbox"
		},
		type = "CoreMenuItemToggle.ItemToggle"
	}
	new_item = node:create_item(data_node, params)

	new_item:set_value("off")
	new_item:set_enabled(true)
	node:add_item(new_item)

	params = {
		callback = "play_chill_combat",
		name = "CustomSafeHouseDefendBtn",
		align = "left",
		text_id = "menu_cn_chill_combat_defend"
	}
	data_node = {}
	new_item = node:create_item(data_node, params)

	new_item:set_enabled(true)
	node:add_item(new_item)

	params = {
		callback = "ignore_chill_combat",
		name = "CustomSafeHouseIgnoreBtn",
		align = "left",
		text_id = "menu_cn_chill_combat_ignore_defend"
	}
	data_node = {}
	new_item = node:create_item(data_node, params)

	new_item:set_enabled(true)
	node:add_item(new_item)

	params = {
		visible_callback = "is_pc_controller",
		name = "back",
		last_item = "true",
		text_id = "menu_back",
		align = "left",
		previous_node = "true"
	}
	data_node = {}
	new_item = node:create_item(data_node, params)

	node:add_item(new_item)
	node:set_default_item_name(self.DEFAULT_ITEM)
	node:select_item(self.DEFAULT_ITEM)

	return node
end

function MenuCallbackHandler:restart_level_visible() end
function MenuCallbackHandler:restart_vote_visible() end