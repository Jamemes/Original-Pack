_G.OriginalPackOptions = _G.OriginalPackOptions or {}
OriginalPackOptions.options_menu = "OriginalPackOptions_menu"
OriginalPackOptions.interface_menu = "OriginalPackOptions_interface_menu"
OriginalPackOptions.ModPath = ModPath
OriginalPackOptions.SaveFile = OriginalPackOptions.SaveFile or SavePath .. "OriginalPackOptions.txt"
OriginalPackOptions.ModOptions = OriginalPackOptions.ModPath .. "menus/modoptions.txt"
OriginalPackOptions.settings = OriginalPackOptions.settings or {}

function OriginalPackOptions:Reset()
	self.settings = {
		Spooky = true,
		Enable_Max_Progress = false,
		Enable_Test = false,
		Anlways_Show_Body_Bags = false,
		Anlways_Show_Accuracy = false,
		Anlways_Show_Kills = false
	}
	self:Save()
end

function OriginalPackOptions:Load()
	local file = io.open(self.SaveFile, "r")
	if file then
		for key, value in pairs(json.decode(file:read("*all"))) do
			self.settings[key] = value
		end
		file:close()
	else
		self:Reset()
	end
end

function OriginalPackOptions:Save()
	local file = io.open(self.SaveFile, "w+")
	if file then
		file:write(json.encode(self.settings))
		file:close()
	end
end

OriginalPackOptions:Load()

local data = LocalizationManager.text
function LocalizationManager:text(string_id, ...)
	return
	
	string_id == "menu_OP_title" 						and "Original Pack" or
	string_id == "menu_enable_test_title" 				and "Test Mode" or
	string_id == "menu_anlways_show_accuracy_title" 	and managers.localization:to_upper_text("menu_always_show_accuracy_title") or
	string_id == "menu_anlways_show_kills_title" 		and managers.localization:to_upper_text("menu_always_show_kills_title") or
	
	data(self, string_id, ...)
end

Hooks:Add("MenuManagerSetupCustomMenus", "OriginalPackOptionsOptions", function(menu_manager, nodes)
	MenuHelper:NewMenu(OriginalPackOptions.options_menu)
	MenuHelper:NewMenu(OriginalPackOptions.interface_menu)
end)
Hooks:Add("MenuManagerPopulateCustomMenus", "OriginalPackOptionsOptions", function(menu_manager, nodes)
	if OriginalPackOptions.settings.Enable_Test then
		SavefileManager.PROGRESS_SLOT = 25
		SavefileManager.BACKUP_SLOT = 25
		NetworkMatchMakingSTEAM._BUILD_SEARCH_INTEREST_KEY = "Classic_Pack_" .. tweak_data.version .. "_test_mode"
		MenuNodeMainGui.version = "Version " .. tweak_data.version .. "  TEST MODE  " .. tweak_data.testing_text
		CustomAchiHandler.allowed_to_save = false
	elseif OriginalPackOptions.settings.Enable_Max_Progress then
		SavefileManager.PROGRESS_SLOT = 69
		SavefileManager.BACKUP_SLOT = 69
		NetworkMatchMakingSTEAM._BUILD_SEARCH_INTEREST_KEY = "Classic_Pack_" .. tweak_data.version .. "_max_mode"
		MenuNodeMainGui.version = "Version " .. tweak_data.version .. "  MAX PROGRESS MODE"
	end
	
	if OriginalPackOptions.settings.Enable_Max_Progress then
		tweak_data.narrative.contacts.classic.name_id = "heist_contact_classic"
		tweak_data.narrative.contacts.classic.hidden = false
		tweak_data.narrative.contacts.events.hidden = false
		tweak_data.narrative.jobs.kenaz.contact = "the_dentist"
		tweak_data.narrative.jobs.rat.contact = "bain"
		tweak_data.narrative.jobs.gallery.contact = "bain"
		tweak_data.narrative.jobs.arm_for.contact = "bain"
		tweak_data.narrative.jobs.arm_fac.contact = "bain"
		tweak_data.narrative.jobs.arm_par.contact = "bain"
		tweak_data.narrative.jobs.arm_hcm.contact = "bain"
		tweak_data.narrative.jobs.arm_und.contact = "bain"
		tweak_data.narrative.jobs.arm_cro.contact = "bain"
		tweak_data.narrative.jobs.branchbank_deposit.contact = "bain"
		tweak_data.narrative.jobs.branchbank_cash.contact = "bain"
		tweak_data.narrative.jobs.branchbank_gold_prof.contact = "bain"
		tweak_data.narrative.jobs.branchbank_prof.contact = "bain"
		tweak_data.narrative.jobs.kosugi_pro.contact = "bain"
	end
	
	MenuCallbackHandler.OriginalPackOptions_menu_Anlways_Show_Body_Bags_callback = function(self, item)
		OriginalPackOptions.settings.Anlways_Show_Body_Bags = item:value() == "on" and true or false
		OriginalPackOptions:Save()
	end
	MenuHelper:AddToggle({
		id = "OriginalPackOptions_menu_Anlways_Show_Body_Bags_callback",
		title = "menu_always_show_body_bags_title",
		callback = "OriginalPackOptions_menu_Anlways_Show_Body_Bags_callback",
		value = OriginalPackOptions.settings.Anlways_Show_Body_Bags,
		menu_id = OriginalPackOptions.interface_menu,  
	})
	
	MenuCallbackHandler.OriginalPackOptions_menu_Anlways_Show_Accuracy_callback = function(self, item)
		OriginalPackOptions.settings.Anlways_Show_Accuracy = item:value() == "on" and true or false
		OriginalPackOptions:Save()
	end
	MenuHelper:AddToggle({
		id = "OriginalPackOptions_menu_Anlways_Show_Accuracy_callback",
		title = "menu_anlways_show_accuracy_title",
		callback = "OriginalPackOptions_menu_Anlways_Show_Accuracy_callback",
		value = OriginalPackOptions.settings.Anlways_Show_Accuracy,
		menu_id = OriginalPackOptions.interface_menu,  
	})
	
	MenuCallbackHandler.OriginalPackOptions_menu_Anlways_Show_Kills_callback = function(self, item)
		OriginalPackOptions.settings.Anlways_Show_Kills = item:value() == "on" and true or false
		OriginalPackOptions:Save()
	end
	MenuHelper:AddToggle({
		id = "OriginalPackOptions_menu_Anlways_Show_Kills_callback",
		title = "menu_anlways_show_kills_title",
		callback = "OriginalPackOptions_menu_Anlways_Show_Kills_callback",
		value = OriginalPackOptions.settings.Anlways_Show_Kills,
		menu_id = OriginalPackOptions.interface_menu,  
	})
end)


Hooks:Add("MenuManagerBuildCustomMenus", "OriginalPackOptionsOptions", function(menu_manager, nodes)
	nodes[OriginalPackOptions.options_menu] = MenuHelper:BuildMenu(OriginalPackOptions.options_menu)
	nodes[OriginalPackOptions.interface_menu] = MenuHelper:BuildMenu(OriginalPackOptions.interface_menu)
	MenuHelper:AddMenuItem(nodes["main"], OriginalPackOptions.options_menu, "menu_OP_title", "", 17)
	MenuHelper:AddMenuItem(nodes[OriginalPackOptions.options_menu], OriginalPackOptions.interface_menu, "menu_user_interface", "", 1)

	local menu_item = nodes.main
	local data = {type = "CoreMenuItem.Item"}
	local params = {
		name = "quickplay_btn",
		text_id = "menu_find_game",
		help_id = "menu_find_game_desc",
		callback = "start_quickplay_game"
	}
	local new_item = menu_item:create_item(data, params)
	new_item.dirty_callback = callback(menu_item, menu_item, "item_dirty")
	if menu_item.callback_handler then
		new_item:set_callback_handler(menu_item.callback_handler)
	end
	local position = 1
	for index, item in pairs(menu_item._items) do
		if item:name() == "crimenet" then
			position = index
			break
		end
	end
	table.insert(menu_item._items, position, new_item)
	
	MenuCallbackHandler.OP_changelog_callback = function(self, item)
		Steam:overlay_activate("url", "https://steamcommunity.com/sharedfiles/filedetails/?id=2062176985")
	end
	local menu_item = nodes[OriginalPackOptions.options_menu]
	local data = {type = "CoreMenuItem.Item"}
	local params = {
		name = "OP_changelog_btn",
		text_id = "menu_OP_changelog",
		help_id = "menu_OP_changelog_desc",
		callback = "OP_changelog_callback"
	}
	local new_item = menu_item:create_item(data, params)
	new_item.dirty_callback = callback(menu_item, menu_item, "item_dirty")
	if menu_item.callback_handler then
		new_item:set_callback_handler(menu_item.callback_handler)
	end
	local position = 1
	for index, item in pairs(menu_item._items) do
		if item:name() == "options" then
			position = index
			break
		end
	end
	table.insert(menu_item._items, position, new_item)
	
	if OriginalPackOptions.settings.Enable_Test or OriginalPackOptions.settings.Dev then
		MenuCallbackHandler.test_mode_enable_callback = function(self, item)
			if OriginalPackOptions.settings.Enable_Test then
				OriginalPackOptions.settings.Enable_Test = false
				OriginalPackOptions:Save()
			elseif not OriginalPackOptions.settings.Enable_Test then
				OriginalPackOptions.settings.Enable_Test = true
				OriginalPackOptions:Save()
			end
			os.execute("start steam://rungameid/218620")
			os.exit()
		end
		MenuCallbackHandler.test_mode_callback = function(self, item)
			local blank = ""
			local menu_options = {
				[1] = {
					text = managers.localization:text("dialog_yes"),
					callback = MenuCallbackHandler.test_mode_enable_callback,
				},
				[2] = {
					text = managers.localization:text("dialog_no"),
					is_cancel_button = true,
				},
			}
			local menu = QuickMenu:new(blank, blank, menu_options)
			menu:Show()
		end
		local menu_item = nodes.options
		local data = {type = "CoreMenuItem.Item"}
		local params = {
			name = "test_mode_btn",
			text_id = "menu_enable_test_title",
			callback = "test_mode_callback"
		}
		local new_item = menu_item:create_item(data, params)
		new_item.dirty_callback = callback(menu_item, menu_item, "item_dirty")
		if menu_item.callback_handler then
			new_item:set_callback_handler(menu_item.callback_handler)
		end
		local position = 8
		for index, item in pairs(menu_item._items) do
			if item:name() == "" then
				position = index
				break
			end
		end
		table.insert(menu_item._items, position, new_item)
	end
	
	MenuCallbackHandler.max_progress_enable_callback = function(self, item)
		if OriginalPackOptions.settings.Enable_Max_Progress then
			OriginalPackOptions.settings.Enable_Max_Progress = false
			OriginalPackOptions:Save()
		elseif not OriginalPackOptions.settings.Enable_Max_Progress then
			OriginalPackOptions.settings.Enable_Max_Progress = true
			OriginalPackOptions:Save()
		end
		if not OriginalPackOptions.settings.Enable_Test then
			os.execute("start steam://rungameid/218620")
			os.exit()
		end
	end
	MenuCallbackHandler.what_is_max_progress_callback = function(self, item)
		local dialog_data = {
			focus_button = 1,
			title = "",
			text = "dialog_what_is_max_progress_text",
			texture = false
		}
		local yes_button = {
			text = managers.localization:text("dialog_yes"),
			callback_func = MenuCallbackHandler.max_progress_enable_callback
		}
		local no_button = {
			text = managers.localization:text("dialog_no")
		}
		dialog_data.button_list = {
			yes_button,
			no_button
		}
		dialog_data.video = "movies/lootdrop" .. math.random(8)
		dialog_data.video_loop = true
		managers.menu:show_video_message_dialog(dialog_data)
	end
	MenuCallbackHandler.max_progress_callback = function(self, item)
		local menu_title = OriginalPackOptions.settings.Enable_Max_Progress and managers.localization:text("menu_normal_progress_dialog_title") or managers.localization:text("menu_max_progress_dialog_title") 
		local menu_message = OriginalPackOptions.settings.Enable_Max_Progress and managers.localization:text("menu_normal_progress_dialog_message") or managers.localization:text("menu_max_progress_dialog_message")
		local menu_options = {
			[1] = {
				text = managers.localization:text("dialog_yes"),
				callback = MenuCallbackHandler.max_progress_enable_callback,
			},
			[2] = {
				text = managers.localization:text("dialog_no"),
				is_cancel_button = true,
			},
		}
		if not OriginalPackOptions.settings.Enable_Max_Progress then
			menu_options[3] = {}
			menu_options[4] = {
				text = managers.localization:text("dialog_what_is_max_progress"),
				callback = MenuCallbackHandler.what_is_max_progress_callback,
			}
		end
		local menu = QuickMenu:new( menu_title, menu_message, menu_options )
		menu:Show()
	end
	local menu_item = nodes[OriginalPackOptions.options_menu]
	local data = {type = "CoreMenuItem.Item"}
	local params = {
		name = "max_progress_btn",
		text_id = OriginalPackOptions.settings.Enable_Max_Progress and "menu_normal_progress_title" or "menu_max_progress_title",
		help_id = OriginalPackOptions.settings.Enable_Max_Progress and "menu_normal_progress_desc" or "menu_max_progress_desc",
		callback = "max_progress_callback"
	}
	local new_item = menu_item:create_item(data, params)
	new_item.dirty_callback = callback(menu_item, menu_item, "item_dirty")
	if menu_item.callback_handler then
		new_item:set_callback_handler(menu_item.callback_handler)
	end
	local position = 3
	for index, item in pairs(menu_item._items) do
		if item:name() == "options" then
			position = index
			break
		end
	end
	table.insert(menu_item._items, position, new_item)
end)