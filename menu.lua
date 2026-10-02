Hooks:Add("LocalizationManagerPostInit", "Update_2.LocalizationManagerPostInit", function(self, ...)
	LocalizationManager:add_localized_strings({
		menu_friends_only_game = "FRIENDS-ONLY",
		menu_cash = "Cash: $money;",
		menu_spendable_skill_points = "Unspent skill points: $points;",
		menu_lby_crimenet = "Choose New Contract",
		menu_lby_job_crimenet = "Choose New Contract",
		menu_crimenet = "CRIME.NET",
		menu_crimenet_offline = "CRIME.NET Offline",
		menu_skilltree = "Skills",
		menu_visit_community = "Gamehub",
		menu_quit = "Quit",
	})

	if Idstring("russian"):key() == SystemInfo:language():key() then
		LocalizationManager:add_localized_strings({
			menu_friends_only_game = "ТОЛЬКО ДЛЯ ДРУЗЕЙ",
			menu_cash = "Наличные: $money;",
			menu_spendable_skill_points =  "Непотраченные очки навыков: $points;",
			menu_lby_crimenet = "Выбрать контракт",
			menu_lby_job_crimenet = "Выбрать контракт",
			menu_crimenet = "CRIME.NET",
			menu_crimenet_offline = "CRIME.NET Офлайн",
			menu_skilltree = "Навыки",
		})
	end
end)

-- local function SaveTableHard(tbl, cmp, fileName, fileIsOpen, preText)
-- 	local file = nil
-- 	if fileIsOpen == nil then
-- 		file = io.open(fileName, "w")
-- 	else
-- 		file = fileIsOpen
-- 	end

-- 	cmp = cmp or {}
-- 	if tbl and type(tbl) == "table" then
-- 		for k, v in pairs(tbl) do
-- 			if type(v) == "table" then
-- 				cmp[v] = true
                
--                 local real_key = k
--                 if type(k) == "number" then
--                     real_key = preText == '' and 'menu[' .. tostring(k) .. '] = ' or ''
-- 				else
--                     real_key = tostring(k) .. ' = '
--                 end

-- 				file:write(preText .. string.format("%s{", tostring(real_key)) .. "\n")
-- 				SaveTableHard(v, cmp, fileName, file, preText .. "\t")
-- 				file:write(preText .. "}," .. "\n")
-- 			else
--                 local real_val = v
--                 if type(v) == "string" then
--                     real_val = '"' .. tostring(v) .. '"'
--                 end

--                 local real_key = k
--                 if type(k) == "number" then
--                     real_key = ''
-- 				else
--                     real_key = tostring(k) .. ' = '
--                 end
                
-- 				file:write(preText .. string.format("%s%s", tostring(real_key), tostring(real_val)) .. ",\n")
-- 			end
-- 		end
-- 	else
-- 		file:write(preText .. tostring(tbl) .. "\n")
-- 	end

-- 	if fileIsOpen == nil then
-- 		file:close()
-- 	end
-- end
-- SaveTableHard(menu, {}, menu_id .. ".txt", nil, "")

Hooks:Add("CoreMenuData.LoadDataMenu", "Update_2.CoreMenuData.LoadDataMenu", function(menu_id, menu)
	if menu_id == "pause_menu" then
		for index, node in pairs(menu) do
			if node.name == "options" then
				menu[index] = {
					{
						name = "menu_legend_select",
						_meta = "legend",
					},
					{
						name = "menu_legend_back",
						_meta = "legend",
					},
					{
						name = "controls",
						_meta = "default_item",
					},
					{
						help_id = "menu_controls_help",
						name = "controls",
						next_node = "controls",
						_meta = "item",
						text_id = "menu_controls",
					},
					{
						help_id = "menu_video_help",
						name = "video",
						next_node = "video",
						_meta = "item",
						text_id = "menu_video",
					},
					{
						help_id = "menu_sound_help",
						name = "sound",
						next_node = "sound",
						_meta = "item",
						text_id = "menu_sound",
					},
					{
						previous_node = true,
						name = "back",
						text_id = "menu_back",
						_meta = "item",
						visible_callback = "is_pc_controller",
						back = true,
					},
					{
						type = "MenuItemDivider",
						name = "blt_divider",
						_meta = "item",
						no_text = true,
						size = 8,
					},
					{
						help_id = "blt_options_menu_lua_mod_options_desc",
						name = "blt_options",
						text_id = "blt_options_menu_lua_mod_options",
						_meta = "item",
						next_node = "blt_options",
					},
					{
						help_id = "blt_options_menu_keybinds_desc",
						name = "blt_keybinds",
						text_id = "blt_options_menu_keybinds",
						_meta = "item",
						next_node = "blt_keybinds",
						visible_callback = "blt_show_keybinds_item",
					},
					name = "options",
					back_callback = "save_settings",
					item = {
						help_id = "menu_controls_help",
						name = "controls",
						next_node = "controls",
						_meta = "item",
						text_id = "menu_controls",
					},
					legend = {
						name = "menu_legend_select",
						_meta = "legend",
					},
					_meta = "node",
					topic_id = "menu_options",
					default_item = {
						name = "controls",
						_meta = "default_item",
					},
				}
			elseif node.name == "pause" and node[1] then
				menu[index] = {
					{
						name = "menu_legend_select",
						_meta = "legend",
					},
					{
						name = "menu_legend_back",
						_meta = "legend",
					},
					{
						name = "resume_game",
						_meta = "default_item",
					},
					{
						name = "resume_game",
						_meta = "item",
						callback = "resume_game",
						text_id = "menu_resume_game",
					},
					{
						name = "restart_game",
						text_id = "menu_restart_game",
						_meta = "item",
						callback = "restart_game",
						visible_callback = "singleplayer_restart",
					},
					{
						text_id = "menu_options",
						_meta = "item",
						name = "options",
						next_node = "options",
					},
					{
						name = "edit_game_settings",
						next_node = "edit_game_settings",
						_meta = "item",
						visible_callback = "is_server is_multiplayer",
						text_id = "menu_edit_game_settings",
					},
					{
						name = "kick_player",
						next_node = "kick_player",
						_meta = "item",
						visible_callback = "kick_player_visible",
						text_id = "menu_kick_player",
					},
					{
						name = "mute_player",
						next_node = "mute_player",
						_meta = "item",
						visible_callback = "is_multiplayer voice_enabled is_win32",
						text_id = "menu_mute_players",
					},
					{
						name = "invite_friends_STEAM",
						text_id = "menu_invite_friends",
						_meta = "item",
						callback = "invite_friends_STEAM",
						visible_callback = "is_win32_not_lan is_multiplayer has_dropin",
					},
					{
						name = "abort_mission",
						text_id = "menu_abort_mission",
						visible_callback = "is_not_editor is_server is_multiplayer",
						_meta = "item",
						callback = "abort_mission",
						sound = false,
					},
					{
						name = "end_game",
						text_id = "menu_end_game",
						visible_callback = "is_not_editor",
						_meta = "item",
						callback = "end_game",
						sound = false,
					},
					back_callback = "resume_game",
					menu_components = "ingame_contract",
					legend = {
						name = "menu_legend_select",
						_meta = "legend",
					},
					_meta = "node",
					topic_id = "menu_ingame_menu",
					align_line = 0.75,
					item = {
						name = "resume_game",
						_meta = "item",
						callback = "resume_game",
						text_id = "menu_resume_game",
					},
					default_item = {
						name = "resume_game",
						_meta = "default_item",
					},
					name = "pause",
				}
			end
		end
	elseif menu_id == "start_menu" then
		for index, node in pairs(menu) do
			if node.name == "inventory" then
				menu[index] = {
					{
						name = "back",
						_meta = "default_item",
					},
					no_item_parent = true,
					back_callback = "save_progress leave_blackmarket",
					menu_components = "blackmarket",
					_meta = "node",
					no_menu_wrapper = true,
					sync_state = "inventory",
					name = "inventory",
					modifier = "MenuComponentInitiator",
					default_item = {
						name = "back",
						_meta = "default_item",
					},
					topic_id = "menu_inventory",
					scene_state = "lobby",
				}
			elseif node.name == "options" then
				menu[index] = {
					{
						name = "menu_legend_select",
						_meta = "legend",
					},
					{
						name = "menu_legend_back",
						_meta = "legend",
					},
					{
						name = "controls",
						_meta = "default_item",
					},
					{
						help_id = "menu_controls_help",
						name = "controls",
						next_node = "controls",
						_meta = "item",
						text_id = "menu_controls",
					},
					{
						help_id = "menu_video_help",
						name = "video",
						next_node = "video",
						_meta = "item",
						text_id = "menu_video",
					},
					{
						help_id = "menu_sound_help",
						name = "sound",
						next_node = "sound",
						_meta = "item",
						text_id = "menu_sound",
					},
					{
						help_id = "menu_option_default_help",
						name = "option_default",
						text_id = "menu_option_default",
						_meta = "item",
						callback = "set_default_options",
					},
					{
						help_id = "menu_clear_progress_help",
						name = "clear_progress",
						text_id = "menu_clear_progress",
						_meta = "item",
						callback = "clear_progress",
						visible_callback = "is_not_multiplayer",
					},
					{
						previous_node = true,
						name = "back",
						text_id = "menu_back",
						_meta = "item",
						visible_callback = "is_pc_controller",
						back = true,
					},
					{
						type = "MenuItemDivider",
						name = "blt_divider",
						_meta = "item",
						no_text = true,
						size = 8,
					},
					{
						help_id = "blt_options_menu_blt_mods_desc",
						name = "blt_mods_new",
						text_id = "blt_options_menu_blt_mods",
						_meta = "item",
						next_node = "blt_mods",
					},
					{
						help_id = "blt_options_menu_lua_mod_options_desc",
						name = "blt_options",
						text_id = "blt_options_menu_lua_mod_options",
						_meta = "item",
						next_node = "blt_options",
					},
					{
						help_id = "blt_options_menu_keybinds_desc",
						name = "blt_keybinds",
						text_id = "blt_options_menu_keybinds",
						_meta = "item",
						next_node = "blt_keybinds",
						visible_callback = "blt_show_keybinds_item",
					},
					back_callback = "save_settings",
					legend = {
						name = "menu_legend_select",
						_meta = "legend",
					},
					_meta = "node",
					stencil_align = "center",
					stencil_image = "bg_options",
					sync_state = "options",
					name = "options",
					modifier = "MenuOptionInitiator",
					default_item = {
						name = "controls",
						_meta = "default_item",
					},
					topic_id = "menu_options",
					item = {
						help_id = "menu_controls_help",
						name = "controls",
						next_node = "controls",
						_meta = "item",
						text_id = "menu_controls",
					},
				}
			elseif node.name == "edit_game_settings" then
				menu[index] = {
					{
						name = "menu_legend_select",
						_meta = "legend",
					},
					{
						name = "menu_legend_back",
						_meta = "legend",
					},
					{
						name = "lobby_permission",
						_meta = "default_item",
					},
					{
						{
							value = "public",
							_meta = "option",
							text_id = "menu_public_game",
						},
						{
							value = "friends_only",
							_meta = "option",
							text_id = "menu_friends_only_game",
						},
						{
							value = "private",
							_meta = "option",
							text_id = "menu_private_game",
						},
						help_id = "menu_permission_help",
						type = "MenuItemMultiChoice",
						name = "lobby_permission",
						text_id = "menu_permission",
						option = {
							value = "public",
							_meta = "option",
							text_id = "menu_public_game",
						},
						_meta = "item",
						callback = "choice_lobby_permission",
						visible_callback = "is_multiplayer",
					},
					{
						{
							localize = false,
							_meta = "option",
							value = 0,
							text_id = 0,
						},
						{
							localize = false,
							text_id = 10,
							value = 10,
							_meta = "option",
							visible_callback = "reputation_check",
						},
						{
							localize = false,
							text_id = 20,
							value = 20,
							_meta = "option",
							visible_callback = "reputation_check",
						},
						{
							localize = false,
							text_id = 30,
							value = 30,
							_meta = "option",
							visible_callback = "reputation_check",
						},
						{
							localize = false,
							text_id = 40,
							value = 40,
							_meta = "option",
							visible_callback = "reputation_check",
						},
						{
							localize = false,
							text_id = 50,
							value = 50,
							_meta = "option",
							visible_callback = "reputation_check",
						},
						{
							localize = false,
							text_id = 60,
							value = 60,
							_meta = "option",
							visible_callback = "reputation_check",
						},
						{
							localize = false,
							text_id = 70,
							value = 70,
							_meta = "option",
							visible_callback = "reputation_check",
						},
						{
							localize = false,
							text_id = 80,
							value = 80,
							_meta = "option",
							visible_callback = "reputation_check",
						},
						{
							localize = false,
							text_id = 90,
							value = 90,
							_meta = "option",
							visible_callback = "reputation_check",
						},
						{
							localize = false,
							text_id = 100,
							value = 100,
							_meta = "option",
							visible_callback = "reputation_check",
						},
						help_id = "menu_reputation_permission_help",
						type = "MenuItemMultiChoice",
						name = "lobby_reputation_permission",
						text_id = "menu_reputation_permission",
						option = {
							localize = false,
							_meta = "option",
							value = 0,
							text_id = 0,
						},
						_meta = "item",
						callback = "choice_lobby_reputation_permission",
						visible_callback = "is_multiplayer",
					},
					{
						{
							s_x = 24,
							s_icon = "guis/textures/menu_tickbox",
							_meta = "option",
							w = 24,
							y = 0,
							s_y = 24,
							x = 24,
							s_h = 24,
							value = 1,
							h = 24,
							icon = "guis/textures/menu_tickbox",
							s_w = 24,
						},
						{
							s_x = 0,
							s_icon = "guis/textures/menu_tickbox",
							_meta = "option",
							w = 24,
							y = 0,
							s_y = 24,
							x = 0,
							s_h = 24,
							value = 0,
							h = 24,
							icon = "guis/textures/menu_tickbox",
							s_w = 24,
						},
						help_id = "menu_toggle_drop_in_help",
						type = "CoreMenuItemToggle.ItemToggle",
						name = "toggle_drop_in",
						text_id = "menu_toggle_drop_in",
						option = {
							s_x = 24,
							s_icon = "guis/textures/menu_tickbox",
							_meta = "option",
							w = 24,
							y = 0,
							s_y = 24,
							x = 24,
							s_h = 24,
							value = 1,
							h = 24,
							icon = "guis/textures/menu_tickbox",
							s_w = 24,
						},
						_meta = "item",
						callback = "choice_drop_in",
						visible_callback = "is_multiplayer",
					},
					{
						{
							s_x = 24,
							s_icon = "guis/textures/menu_tickbox",
							_meta = "option",
							w = 24,
							y = 0,
							s_y = 24,
							x = 24,
							s_h = 24,
							value = 1,
							h = 24,
							icon = "guis/textures/menu_tickbox",
							s_w = 24,
						},
						{
							s_x = 0,
							s_icon = "guis/textures/menu_tickbox",
							_meta = "option",
							w = 24,
							y = 0,
							s_y = 24,
							x = 0,
							s_h = 24,
							value = 0,
							h = 24,
							icon = "guis/textures/menu_tickbox",
							s_w = 24,
						},
						help_id = "menu_toggle_ai_help",
						type = "CoreMenuItemToggle.ItemToggle",
						name = "toggle_ai",
						text_id = "menu_toggle_ai",
						option = {
							s_x = 24,
							s_icon = "guis/textures/menu_tickbox",
							_meta = "option",
							w = 24,
							y = 0,
							s_y = 24,
							x = 24,
							s_h = 24,
							value = 1,
							h = 24,
							icon = "guis/textures/menu_tickbox",
							s_w = 24,
						},
						_meta = "item",
						callback = "choice_crimenet_team_ai",
					},
					{
						previous_node = true,
						name = "back",
						text_id = "menu_back",
						_meta = "item",
						visible_callback = "is_pc_controller",
						back = true,
					},
					use_info_rect = false,
					legend = {
						name = "menu_legend_select",
						_meta = "legend",
					},
					_meta = "node",
					stencil_align = "manual",
					align_line = 0.75,
					topic_id = "menu_edit_game_settings",
					sync_state = "options",
					item = {
						{
							value = "public",
							_meta = "option",
							text_id = "menu_public_game",
						},
						{
							value = "friends_only",
							_meta = "option",
							text_id = "menu_friends_only_game",
						},
						{
							value = "private",
							_meta = "option",
							text_id = "menu_private_game",
						},
						help_id = "menu_permission_help",
						type = "MenuItemMultiChoice",
						name = "lobby_permission",
						text_id = "menu_permission",
						option = {
							value = "public",
							_meta = "option",
							text_id = "menu_public_game",
						},
						_meta = "item",
						callback = "choice_lobby_permission",
						visible_callback = "is_multiplayer",
					},
					modifier = "LobbyOptionInitiator GlobalSuccessRateInitiator",
					stencil_image = "guis/textures/bg_lobby_fullteam",
					default_item = {
						name = "lobby_permission",
						_meta = "default_item",
					},
					stencil_align_percent = 65,
					name = "edit_game_settings",
				}
			elseif node.name == "crimenet_contract_singleplayer" then
				menu[index] = {
					{
						name = "menu_legend_select",
						_meta = "legend",
					},
					{
						name = "menu_legend_back",
						_meta = "legend",
					},
					{
						name = "accept_contract",
						_meta = "default_item",
					},
					{
						{
							s_x = 24,
							s_icon = "guis/textures/menu_tickbox",
							_meta = "option",
							w = 24,
							y = 0,
							s_y = 24,
							x = 24,
							s_h = 24,
							value = 1,
							h = 24,
							icon = "guis/textures/menu_tickbox",
							s_w = 24,
						},
						{
							s_x = 0,
							s_icon = "guis/textures/menu_tickbox",
							_meta = "option",
							w = 24,
							y = 0,
							s_y = 24,
							x = 0,
							s_h = 24,
							value = 0,
							h = 24,
							icon = "guis/textures/menu_tickbox",
							s_w = 24,
						},
						help_id = "menu_toggle_ai_help",
						type = "CoreMenuItemToggle.ItemToggle",
						name = "toggle_ai",
						text_id = "menu_toggle_ai",
						option = {
							s_x = 24,
							s_icon = "guis/textures/menu_tickbox",
							_meta = "option",
							w = 24,
							y = 0,
							s_y = 24,
							x = 24,
							s_h = 24,
							value = 1,
							h = 24,
							icon = "guis/textures/menu_tickbox",
							s_w = 24,
						},
						_meta = "item",
						callback = "choice_crimenet_team_ai",
					},
					{
						name = "accept_contract",
						text_id = "cn_menu_accept_contract",
						align = "right",
						_meta = "item",
						callback = "accept_crimenet_contract",
					},
					{
						previous_node = true,
						name = "decline_contract",
						text_id = "cn_menu_decline_contract",
						align = "right",
						_meta = "item",
					},
					align_line_proportions = 0.69999998807907,
					menu_components = "crimenet crimenet_contract",
					legend = {
						name = "menu_legend_select",
						_meta = "legend",
					},
					_meta = "node",
					topic_id = "menu_crimenet",
					item = {
						{
							s_x = 24,
							s_icon = "guis/textures/menu_tickbox",
							_meta = "option",
							w = 24,
							y = 0,
							s_y = 24,
							x = 24,
							s_h = 24,
							value = 1,
							h = 24,
							icon = "guis/textures/menu_tickbox",
							s_w = 24,
						},
						{
							s_x = 0,
							s_icon = "guis/textures/menu_tickbox",
							_meta = "option",
							w = 24,
							y = 0,
							s_y = 24,
							x = 0,
							s_h = 24,
							value = 0,
							h = 24,
							icon = "guis/textures/menu_tickbox",
							s_w = 24,
						},
						help_id = "menu_toggle_ai_help",
						type = "CoreMenuItemToggle.ItemToggle",
						name = "toggle_ai",
						text_id = "menu_toggle_ai",
						option = {
							s_x = 24,
							s_icon = "guis/textures/menu_tickbox",
							_meta = "option",
							w = 24,
							y = 0,
							s_y = 24,
							x = 24,
							s_h = 24,
							value = 1,
							h = 24,
							icon = "guis/textures/menu_tickbox",
							s_w = 24,
						},
						_meta = "item",
						callback = "choice_crimenet_team_ai",
					},
					modifier = "MenuCrimeNetContractInitiator",
					scene_state = "lobby",
					default_item = {
						name = "accept_contract",
						_meta = "default_item",
					},
					name = "crimenet_contract_singleplayer",
					gui_class = "MenuNodeCrimenetGui",
				}
			elseif node.name == "crimenet_contract_host" then
				menu[index] = {
					{
						name = "menu_legend_select",
						_meta = "legend",
					},
					{
						name = "menu_legend_back",
						_meta = "legend",
					},
					{
						name = "accept_contract",
						_meta = "default_item",
					},
					{
						{
							value = "public",
							_meta = "option",
							text_id = "menu_public_game",
						},
						{
							value = "friends_only",
							_meta = "option",
							text_id = "menu_friends_only_game",
						},
						{
							value = "private",
							_meta = "option",
							text_id = "menu_private_game",
						},
						help_id = "menu_permission_help",
						type = "MenuItemMultiChoice",
						name = "lobby_permission",
						text_id = "menu_permission",
						option = {
							value = "public",
							_meta = "option",
							text_id = "menu_public_game",
						},
						_meta = "item",
						callback = "choice_crimenet_lobby_permission",
						visible_callback = "is_not_server is_multiplayer",
					},
					{
						{
							localize = false,
							_meta = "option",
							value = 0,
							text_id = 0,
						},
						{
							localize = false,
							text_id = 10,
							value = 10,
							_meta = "option",
							visible_callback = "reputation_check",
						},
						{
							localize = false,
							text_id = 20,
							value = 20,
							_meta = "option",
							visible_callback = "reputation_check",
						},
						{
							localize = false,
							text_id = 30,
							value = 30,
							_meta = "option",
							visible_callback = "reputation_check",
						},
						{
							localize = false,
							text_id = 40,
							value = 40,
							_meta = "option",
							visible_callback = "reputation_check",
						},
						{
							localize = false,
							text_id = 50,
							value = 50,
							_meta = "option",
							visible_callback = "reputation_check",
						},
						{
							localize = false,
							text_id = 60,
							value = 60,
							_meta = "option",
							visible_callback = "reputation_check",
						},
						{
							localize = false,
							text_id = 70,
							value = 70,
							_meta = "option",
							visible_callback = "reputation_check",
						},
						{
							localize = false,
							text_id = 80,
							value = 80,
							_meta = "option",
							visible_callback = "reputation_check",
						},
						{
							localize = false,
							text_id = 90,
							value = 90,
							_meta = "option",
							visible_callback = "reputation_check",
						},
						{
							localize = false,
							text_id = 100,
							value = 100,
							_meta = "option",
							visible_callback = "reputation_check",
						},
						help_id = "menu_reputation_permission_help",
						type = "MenuItemMultiChoice",
						name = "lobby_reputation_permission",
						text_id = "menu_reputation_permission",
						option = {
							localize = false,
							_meta = "option",
							value = 0,
							text_id = 0,
						},
						_meta = "item",
						callback = "choice_crimenet_lobby_reputation_permission",
						visible_callback = "is_not_server is_multiplayer",
					},
					{
						{
							s_x = 24,
							s_icon = "guis/textures/menu_tickbox",
							_meta = "option",
							w = 24,
							y = 0,
							s_y = 24,
							x = 24,
							s_h = 24,
							value = "on",
							h = 24,
							icon = "guis/textures/menu_tickbox",
							s_w = 24,
						},
						{
							s_x = 0,
							s_icon = "guis/textures/menu_tickbox",
							_meta = "option",
							w = 24,
							y = 0,
							s_y = 24,
							x = 0,
							s_h = 24,
							value = "off",
							h = 24,
							icon = "guis/textures/menu_tickbox",
							s_w = 24,
						},
						help_id = "menu_toggle_drop_in_help",
						type = "CoreMenuItemToggle.ItemToggle",
						name = "toggle_drop_in",
						text_id = "menu_toggle_drop_in",
						option = {
							s_x = 24,
							s_icon = "guis/textures/menu_tickbox",
							_meta = "option",
							w = 24,
							y = 0,
							s_y = 24,
							x = 24,
							s_h = 24,
							value = "on",
							h = 24,
							icon = "guis/textures/menu_tickbox",
							s_w = 24,
						},
						_meta = "item",
						callback = "choice_crimenet_drop_in",
						visible_callback = "is_not_server is_multiplayer",
					},
					{
						{
							s_x = 24,
							s_icon = "guis/textures/menu_tickbox",
							_meta = "option",
							w = 24,
							y = 0,
							s_y = 24,
							x = 24,
							s_h = 24,
							value = "on",
							h = 24,
							icon = "guis/textures/menu_tickbox",
							s_w = 24,
						},
						{
							s_x = 0,
							s_icon = "guis/textures/menu_tickbox",
							_meta = "option",
							w = 24,
							y = 0,
							s_y = 24,
							x = 0,
							s_h = 24,
							value = "off",
							h = 24,
							icon = "guis/textures/menu_tickbox",
							s_w = 24,
						},
						help_id = "menu_toggle_ai_help",
						type = "CoreMenuItemToggle.ItemToggle",
						name = "toggle_ai",
						text_id = "menu_toggle_ai",
						option = {
							s_x = 24,
							s_icon = "guis/textures/menu_tickbox",
							_meta = "option",
							w = 24,
							y = 0,
							s_y = 24,
							x = 24,
							s_h = 24,
							value = "on",
							h = 24,
							icon = "guis/textures/menu_tickbox",
							s_w = 24,
						},
						_meta = "item",
						callback = "choice_crimenet_team_ai",
						visible_callback = "is_not_server",
					},
					{
						name = "accept_contract",
						text_id = "cn_menu_accept_contract",
						align = "right",
						_meta = "item",
						callback = "accept_crimenet_contract",
					},
					{
						previous_node = true,
						name = "decline_contract",
						text_id = "cn_menu_decline_contract",
						align = "right",
						_meta = "item",
					},
					align_line_proportions = 0.69999998807907,
					menu_components = "crimenet crimenet_contract",
					legend = {
						name = "menu_legend_select",
						_meta = "legend",
					},
					_meta = "node",
					topic_id = "menu_crimenet",
					item = {
						{
							value = "public",
							_meta = "option",
							text_id = "menu_public_game",
						},
						{
							value = "friends_only",
							_meta = "option",
							text_id = "menu_friends_only_game",
						},
						{
							value = "private",
							_meta = "option",
							text_id = "menu_private_game",
						},
						help_id = "menu_permission_help",
						type = "MenuItemMultiChoice",
						name = "lobby_permission",
						text_id = "menu_permission",
						option = {
							value = "public",
							_meta = "option",
							text_id = "menu_public_game",
						},
						_meta = "item",
						callback = "choice_crimenet_lobby_permission",
						visible_callback = "is_not_server is_multiplayer",
					},
					modifier = "MenuCrimeNetContractInitiator",
					scene_state = "lobby",
					default_item = {
						name = "accept_contract",
						_meta = "default_item",
					},
					name = "crimenet_contract_host",
					gui_class = "MenuNodeCrimenetGui",
				}
			elseif node.name == "lobby" then
				menu[index] = {
					{
						name = "menu_legend_select",
						_meta = "legend",
					},
					{
						name = "start_the_game",
						_meta = "default_item",
					},
					{
						sign_in = false,
						name = "crimenet",
						next_node = "crimenet_no_servers",
						visible_callback = "is_server",
						_meta = "item",
						callback = "play_online_game",
						text_id = "menu_choose_contract",
					},
					{
						name = "edit_game_settings",
						next_node = "edit_game_settings",
						_meta = "item",
						visible_callback = "is_server",
						text_id = "menu_edit_game_settings",
					},
					{
						icon_visible_callback = "got_new_lootdrop",
						name = "inventory",
						next_node = "inventory",
						_meta = "item",
						icon = "guis/textures/pd2/blackmarket/inv_newdrop",
						text_id = "menu_inventory",
					},
					{
						icon_visible_callback = "got_skillpoint_to_spend",
						name = "skilltree",
						next_node = "skilltree",
						_meta = "item",
						icon = "guis/textures/pd2/shared_skillpoint_symbol",
						text_id = "menu_skilltree",
					},
					{
						text_id = "menu_options",
						_meta = "item",
						name = "options",
						next_node = "options",
					},
					{
						no_text = true,
						name = "divider_test2",
						_meta = "item",
						type = "MenuItemDivider",
						size = 8,
					},
					{
						name = "kick_player",
						next_node = "kick_player",
						_meta = "item",
						visible_callback = "is_server is_multiplayer",
						text_id = "menu_kick_player",
					},
					{
						name = "mute_player",
						next_node = "mute_player",
						_meta = "item",
						visible_callback = "is_multiplayer voice_enabled is_win32",
						text_id = "menu_mute_players",
					},
					{
						name = "invite_friends_STEAM",
						text_id = "menu_invite_friends",
						_meta = "item",
						callback = "invite_friends_STEAM",
						visible_callback = "is_win32_not_lan is_multiplayer",
					},
					{
						no_text = true,
						name = "divider_test2",
						_meta = "item",
						type = "MenuItemDivider",
						size = 8,
					},
					{
						name = "leave_lobby",
						_meta = "item",
						callback = "leave_lobby",
						text_id = "menu_leave_lobby",
					},
					{
						name = "start_the_game",
						text_id = "menu_start_the_game",
						visible_callback = "is_server got_job",
						_meta = "item",
						callback = "lobby_start_the_game",
						pd2_corner = true,
					},
					use_info_rect = false,
					topic_id = "menu_lobby",
					stencil_image = "guis/textures/bg_lobby_fullteam",
					menu_components = "contract lobby_chats",
					legend = {
						name = "menu_legend_select",
						_meta = "legend",
					},
					_meta = "node",
					stencil_align = "manual",
					align_line = 0.75,
					block_back = true,
					sync_state = "lobby",
					item = {
						sign_in = false,
						name = "crimenet",
						next_node = "crimenet_no_servers",
						visible_callback = "is_server",
						_meta = "item",
						callback = "play_online_game",
						text_id = "menu_choose_contract",
					},
					modifier = "LobbyOptionInitiator MenuSoundCreator",
					stencil_align_percent = 65,
					default_item = {
						name = "start_the_game",
						_meta = "default_item",
					},
					name = "lobby",
					scene_state = "lobby",
				}
			elseif node.name == "crimenet_filters" then
				menu[index] = {
					{
						name = "menu_legend_select",
						_meta = "legend",
					},
					{
						name = "menu_legend_back",
						_meta = "legend",
					},
					{
						name = "apply",
						_meta = "default_item",
					},
					{
						{
							s_x = 24,
							s_icon = "guis/textures/menu_tickbox",
							_meta = "option",
							w = 24,
							y = 0,
							s_y = 24,
							x = 24,
							s_h = 24,
							value = "on",
							h = 24,
							icon = "guis/textures/menu_tickbox",
							s_w = 24,
						},
						{
							s_x = 0,
							s_icon = "guis/textures/menu_tickbox",
							_meta = "option",
							w = 24,
							y = 0,
							s_y = 24,
							x = 0,
							s_h = 24,
							value = "off",
							h = 24,
							icon = "guis/textures/menu_tickbox",
							s_w = 24,
						},
						type = "CoreMenuItemToggle.ItemToggle",
						name = "toggle_friends_only",
						text_id = "menu_toggle_friends_only",
						option = {
							s_x = 24,
							s_icon = "guis/textures/menu_tickbox",
							_meta = "option",
							w = 24,
							y = 0,
							s_y = 24,
							x = 24,
							s_h = 24,
							value = "on",
							h = 24,
							icon = "guis/textures/menu_tickbox",
							s_w = 24,
						},
						_meta = "item",
						callback = "choice_friends_only",
						visible_callback = "is_multiplayer",
					},
					{
						{
							value = 1,
							_meta = "option",
							text_id = "menu_dist_filter_close",
						},
						{
							value = 2,
							_meta = "option",
							text_id = "menu_dist_filter_far",
						},
						{
							value = 3,
							_meta = "option",
							text_id = "menu_dist_filter_worldwide",
						},
						visible_callback = "is_win32",
						type = "MenuItemMultiChoice",
						name = "server_filter",
						filter = true,
						option = {
							value = 1,
							_meta = "option",
							text_id = "menu_dist_filter_close",
						},
						_meta = "item",
						callback = "choice_distance_filter",
						text_id = "menu_dist_filter",
					},
					{
						previous_node = true,
						name = "apply",
						text_id = "menu_apply_settings",
						align = "right",
						_meta = "item",
					},
					align_line_proportions = 0.69999998807907,
					menu_components = "crimenet crimenet_filters",
					legend = {
						name = "menu_legend_select",
						_meta = "legend",
					},
					_meta = "node",
					topic_id = "menu_crimenet",
					item = {
						{
							s_x = 24,
							s_icon = "guis/textures/menu_tickbox",
							_meta = "option",
							w = 24,
							y = 0,
							s_y = 24,
							x = 24,
							s_h = 24,
							value = "on",
							h = 24,
							icon = "guis/textures/menu_tickbox",
							s_w = 24,
						},
						{
							s_x = 0,
							s_icon = "guis/textures/menu_tickbox",
							_meta = "option",
							w = 24,
							y = 0,
							s_y = 24,
							x = 0,
							s_h = 24,
							value = "off",
							h = 24,
							icon = "guis/textures/menu_tickbox",
							s_w = 24,
						},
						type = "CoreMenuItemToggle.ItemToggle",
						name = "toggle_friends_only",
						text_id = "menu_toggle_friends_only",
						option = {
							s_x = 24,
							s_icon = "guis/textures/menu_tickbox",
							_meta = "option",
							w = 24,
							y = 0,
							s_y = 24,
							x = 24,
							s_h = 24,
							value = "on",
							h = 24,
							icon = "guis/textures/menu_tickbox",
							s_w = 24,
						},
						_meta = "item",
						callback = "choice_friends_only",
						visible_callback = "is_multiplayer",
					},
					modifier = "MenuCrimeNetFiltersInitiator",
					scene_state = "lobby",
					default_item = {
						name = "apply",
						_meta = "default_item",
					},
					name = "crimenet_filters",
					gui_class = "MenuNodeCrimenetFiltersGui",
				}
			elseif node.name == "main" and node[1] then
				menu[index] = {
					{
						name = "menu_legend_select",
						_meta = "legend",
					},
					{
						name = "dlc_buy_pc",
						_meta = "default_item",
					},
					{
						help_id = "menu_crimenet_help",
						sign_in = true,
						name = "crimenet",
						next_node = "crimenet",
						_meta = "item",
						callback = "play_online_game",
						text_id = "menu_crimenet",
					},
					{
						help_id = "menu_crimenet_offline_help",
						sign_in = false,
						name = "crimenet_offline",
						next_node = "crimenet_single_player",
						_meta = "item",
						callback = "play_single_player",
						text_id = "menu_crimenet_offline",
					},
					{
						icon_visible_callback = "got_new_lootdrop",
						name = "inventory",
						next_node = "inventory",
						text_id = "menu_inventory",
						_meta = "item",
						icon = "guis/textures/pd2/blackmarket/inv_newdrop",
						help_id = "menu_inventory_help",
					},
					{
						icon_visible_callback = "got_skillpoint_to_spend",
						name = "skilltree",
						next_node = "skilltree",
						text_id = "menu_skilltree",
						_meta = "item",
						icon = "guis/textures/pd2/shared_skillpoint_symbol",
						help_id = "menu_skilltree_help",
					},
					{
						help_id = "menu_safehouse_help",
						name = "safehouse",
						text_id = "menu_safehouse",
						_meta = "item",
						callback = "play_safehouse",
					},
					{
						no_text = true,
						name = "divider_test2",
						_meta = "item",
						type = "MenuItemDivider",
						size = 8,
					},
					{
						help_id = "menu_visit_gamehub_help",
						name = "gamehub",
						text_id = "menu_visit_gamehub",
						_meta = "item",
						callback = "on_visit_gamehub",
						visible_callback = "is_win32",
					},
					{
						help_id = "menu_options_help",
						name = "options",
						next_node = "options",
						_meta = "item",
						text_id = "menu_options",
					},
					{
						help_id = "menu_credits_help",
						name = "credits",
						next_node = "credits",
						_meta = "item",
						text_id = "menu_credits",
					},
					{
						no_text = true,
						name = "divider_test2",
						_meta = "item",
						type = "MenuItemDivider",
						size = 8,
					},
					{
						help_id = "menu_quit_help",
						name = "quit",
						text_id = "menu_quit",
						_meta = "item",
						callback = "quit_game",
						visible_callback = "is_win32",
					},
					use_info_rect = false,
					menu_components = "player_profile menuscene_info news blt_notifications",
					legend = {
						name = "menu_legend_select",
						_meta = "legend",
					},
					_meta = "node",
					stencil_align = "center",
					align_line = 0.75,
					topic_id = "menu_main_menu",
					sync_state = "main_menu",
					item = {
						help_id = "menu_dlc_buy_help",
						visible_callback = "is_win32 has_full_game not_has_all_dlcs",
						name = "dlc_buy_pc",
						text_id = "menu_dlc_buy",
						trial_buy = true,
						_meta = "item",
						callback = "dlc_buy_pc",
						stencil_image = "bg_dlc",
					},
					modifier = "MenuPSNPlayerProfileInitiator",
					stencil_image = "bg_startscreen",
					default_item = {
						name = "dlc_buy_pc",
						_meta = "default_item",
					},
					name = "main",
					scene_state = "standard",
				}
			end
		end
	end
end)

MenuCrimeNetFiltersInitiator = MenuCrimeNetFiltersInitiator or class()

function MenuCrimeNetFiltersInitiator:modify_node(original_node, data)
	local node = deep_clone(original_node)
	node:item("toggle_friends_only"):set_value(Global.game_settings.search_friends_only and "on" or "off")
	if MenuCallbackHandler:is_win32() then
		node:item("server_filter"):set_value(managers.network.matchmake:distance_filter())
	end
	if data and data.back_callback then
		table.insert(node:parameters().back_callback, data.back_callback)
	end
	node:parameters().menu_component_data = data
	return node
end

function MenuCrimeNetContractInitiator:modify_node(original_node, data)
	local node = deep_clone(original_node)
	if Global.game_settings.single_player then
		node:item("toggle_ai"):set_value(Global.game_settings.team_ai)
	elseif not data.server then
		node:item("lobby_permission"):set_value(Global.game_settings.permission)
		node:item("lobby_reputation_permission"):set_value(Global.game_settings.reputation_permission)
		node:item("toggle_drop_in"):set_value(Global.game_settings.drop_in_allowed)
		node:item("toggle_ai"):set_value(Global.game_settings.team_ai)
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
	local item_lobby_toggle_drop_in = node:item("toggle_drop_in")
	if item_lobby_toggle_drop_in then
		item_lobby_toggle_drop_in:set_value(Global.game_settings.drop_in_allowed)
	end
	local item_lobby_toggle_ai = node:item("toggle_ai")
	if item_lobby_toggle_ai then
		item_lobby_toggle_ai:set_value(Global.game_settings.team_ai)
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
	return node
end