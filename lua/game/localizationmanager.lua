_G.OriginalPackOptions = _G.OriginalPackOptions or {}
OriginalPackOptions.options_menu = "OriginalPackOptions_menu"
OriginalPackOptions.interface_menu = "OriginalPackOptions_interface_menu"
OriginalPackOptions.ModPath = ModPath
OriginalPackOptions.SaveFile = OriginalPackOptions.SaveFile or SavePath .. "OriginalPackOptions.txt"
OriginalPackOptions.ModOptions = OriginalPackOptions.ModPath .. "menus/modoptions.txt"
OriginalPackOptions.settings = OriginalPackOptions.settings or {}

function OriginalPackOptions:Reset()
	self.settings = {
		Enable_Max_Progress = false,
		Enable_Test = false,
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
	
	string_id == "OriginalPackOptions_menu_title" 							and "Original Pack" or
	string_id == "OriginalPackOptions_menu_Enable_Test_title" 				and "Test Mode" or
	string_id == "OriginalPackOptions_menu_Anlways_Show_Accuracy_title" 	and managers.localization:to_upper_text("menu_always_show_accuracy_title") or
	string_id == "OriginalPackOptions_menu_Anlways_Show_Kills_title" 		and managers.localization:to_upper_text("menu_always_show_kills_title") or
	string_id == "OriginalPackOptions_menu_Enable_Max_Progress_title" 		and managers.localization:to_upper_text("menu_enable_max_progress_title") or
	string_id == "OriginalPackOptions_menu_Enable_Max_Progress_desc" 		and managers.localization:to_upper_text("menu_enable_max_progress_desc") or
	
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
		CustomAchiHandler.allowed_to_save = true
	elseif OriginalPackOptions.settings.Enable_Max_Progress then
		SavefileManager.PROGRESS_SLOT = 69
		SavefileManager.BACKUP_SLOT = 69
		NetworkMatchMakingSTEAM._BUILD_SEARCH_INTEREST_KEY = "Classic_Pack_" .. tweak_data.version .. "_max_mode"
		MenuNodeMainGui.version = "Version " .. tweak_data.version .. "  MAX PROGRESS MODE"
	end
	MenuCallbackHandler.OriginalPackOptions_menu_Anlways_Show_Accuracy_callback = function(self, item)
		OriginalPackOptions.settings.Anlways_Show_Accuracy = item:value() == "on" and true or false
		OriginalPackOptions:Save()
	end
	MenuCallbackHandler.OriginalPackOptions_menu_Anlways_Show_Kills_callback = function(self, item)
		OriginalPackOptions.settings.Anlways_Show_Kills = item:value() == "on" and true or false
		OriginalPackOptions:Save()
	end
	MenuCallbackHandler.OriginalPackOptions_menu_Enable_Max_Progress_callback = function(self, item)
		OriginalPackOptions.settings.Enable_Max_Progress = item:value() == "on" and true or false
		OriginalPackOptions:Save()
		if not OriginalPackOptions.settings.Enable_Test then
			os.execute("start steam://rungameid/218620")
			os.exit()
		end
	end
	MenuHelper:AddToggle({
		id = "OriginalPackOptions_menu_Enable_Max_Progress_callback",
		title = "OriginalPackOptions_menu_Enable_Max_Progress_title",
		desc = "OriginalPackOptions_menu_Enable_Max_Progress_desc",
		callback = "OriginalPackOptions_menu_Enable_Max_Progress_callback",
		value = OriginalPackOptions.settings.Enable_Max_Progress,
		menu_id = OriginalPackOptions.options_menu,  
	})
	if OriginalPackOptions.settings.Enable_Test or OriginalPackOptions.settings.Dev then
		MenuCallbackHandler.OriginalPackOptions_menu_Enable_Test_callback = function(self, item)
			OriginalPackOptions.settings.Enable_Test = item:value() == "on" and true or false
			OriginalPackOptions:Save()
			os.execute("start steam://rungameid/218620")
			os.exit()
		end
		MenuHelper:AddToggle({
			id = "OriginalPackOptions_menu_Enable_Test_callback",
			title = "OriginalPackOptions_menu_Enable_Test_title",
			callback = "OriginalPackOptions_menu_Enable_Test_callback",
			value = OriginalPackOptions.settings.Enable_Test,
			menu_id = OriginalPackOptions.options_menu,  
		})
	end
	MenuHelper:AddToggle({
		id = "OriginalPackOptions_menu_Anlways_Show_Accuracy_callback",
		title = "OriginalPackOptions_menu_Anlways_Show_Accuracy_title",
		callback = "OriginalPackOptions_menu_Anlways_Show_Accuracy_callback",
		value = OriginalPackOptions.settings.Anlways_Show_Accuracy,
		menu_id = OriginalPackOptions.interface_menu,  
	})
	MenuHelper:AddToggle({
		id = "OriginalPackOptions_menu_Anlways_Show_Kills_callback",
		title = "OriginalPackOptions_menu_Anlways_Show_Kills_title",
		callback = "OriginalPackOptions_menu_Anlways_Show_Kills_callback",
		value = OriginalPackOptions.settings.Anlways_Show_Kills,
		menu_id = OriginalPackOptions.interface_menu,  
	})
	
end)

Hooks:Add("MenuManagerBuildCustomMenus", "OriginalPackOptionsOptions", function(menu_manager, nodes)
	nodes[OriginalPackOptions.options_menu] = MenuHelper:BuildMenu(OriginalPackOptions.options_menu)
	nodes[OriginalPackOptions.interface_menu] = MenuHelper:BuildMenu(OriginalPackOptions.interface_menu)
	MenuHelper:AddMenuItem(nodes["blt_options"], OriginalPackOptions.options_menu, "OriginalPackOptions_menu_title", "")
	MenuHelper:AddMenuItem(nodes["user_interface_options"], OriginalPackOptions.interface_menu, "OriginalPackOptions_menu_title", "empty")
end)
