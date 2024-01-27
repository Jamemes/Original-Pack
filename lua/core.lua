local function get_mod_info()
	local file = io.open(ModPath .. "mod.txt", "r")
	if file then
		local info = json.decode(file:read("*all"))
		file:close()
		
		return info
	end
end

if string.lower(RequiredScript) == "lib/tweak_data/tweakdata" then
	local self = tweak_data

	self.version = get_mod_info().version
	self.testing_text = ''

	self.hate_multipler = 1.5
	self.bullet_hit_alert_radius = 300
	self.footstep_alert_radius = 450
	self.whisper_alert_radius = 450
	self.neighbours_alert_radius_trigger = 2500
	self.neighbours_trigger_delay = math.random(3, 7)
	self.drill_investigate_zone_multipler = 1.25 							-- чем больше радиус проверки, тем меньше радиус шума

	local pro_rank = 5
	self.unlock_safehouse = pro_rank
	self.unlock_crimespree = pro_rank
	self.unlock_skirmish = pro_rank
	self.unlock_profiles = pro_rank
	self.unlock_mayhem = pro_rank
	self.unlock_death_sentence = 20

	self.easy_wish_drop_chance = 0.175
	self.sm_wish_drop_chance = 0.15

	self.max_offshore = 1000000000
	self.max_spending_cash = 150000000
	self.max_coins = 250000

	self.killed_civs_penalty = {1, 2, 3}
	self.easy_mode_exp_penalty = 50 --%
	self.max_loose_money_boost = 30 --%
	self.loose_money_exp_convertation_amount = 30000

	self.quickplay.default_level_diff = {100, 100}
	self.quickplay.max_level_diff = {100, 100}

	self.screen_colors.max_money = Color(255, 121, 227, 177) / 255

	self.experience_manager.loot_drop_value.xp10 = 130000
	self.experience_manager.loot_drop_value.xp20 = 150000
	self.experience_manager.loot_drop_value.xp30 = 170000
	self.experience_manager.loot_drop_value.xp40 = 200000
	self.experience_manager.loot_drop_value.xp50 = 230000
	self.experience_manager.loot_drop_value.xp60 = 260000
	self.experience_manager.loot_drop_value.xp70 = 300000
	self.experience_manager.loot_drop_value.xp80 = 350000
	self.experience_manager.loot_drop_value.xp90 = 390000
	self.experience_manager.loot_drop_value.xp100 = 430000
end
if string.lower(RequiredScript) == "lib/managers/localizationmanager" then
	_G.OriginalPackOptions = _G.OriginalPackOptions or {}
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
		string_id == "menu_test_mode" 						and "Test Mode" or
		string_id == "menu_test_mode_desc" 					and "" or
		string_id == "menu_anlways_show_accuracy_title" 	and managers.localization:to_upper_text("menu_always_show_accuracy_title") or
		string_id == "menu_anlways_show_kills_title" 		and managers.localization:to_upper_text("menu_always_show_kills_title") or
		data(self, string_id, ...)
	end
	
	Hooks:Add("MenuManagerPopulateCustomMenus", "OriginalPackOptionsOptions", function(menu_manager, nodes)
		if OriginalPackOptions.settings.Enable_Test then
			SavefileManager.PROGRESS_SLOT = 25
			SavefileManager.BACKUP_SLOT = 25
			NetworkMatchMakingSTEAM._BUILD_SEARCH_INTEREST_KEY = "Classic_Pack_" .. tweak_data.version .. "_test_mode"
			MenuNodeMainGui.version = "Version " .. tweak_data.version .. "  TEST MODE  " .. tweak_data.testing_text
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
			menu_id = "OP_interface",  
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
			menu_id = "OP_interface",  
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
			menu_id = "OP_interface",  
		})
	end)

	Hooks:Add("MenuManagerSetupCustomMenus", "OriginalPackOptionsOptions", function(menu_manager, nodes)
		MenuHelper:NewMenu("OP_options")
		MenuHelper:NewMenu("OP_interface")
	end)
	
	Hooks:Add("MenuManagerBuildCustomMenus", "OriginalPackOptionsOptions", function(menu_manager, nodes)
		nodes["OP_options"] = MenuHelper:BuildMenu("OP_options")
		nodes["OP_interface"] = MenuHelper:BuildMenu("OP_interface")

		local function menu_node(menu_item, name, clbk, pos, item_name)
			local menu_item = menu_item
			local data = {type = "CoreMenuItem.Item"}
			local params = {
				name = "menu_"..name.."_btn",
				text_id = "menu_"..name,
				help_id = "menu_"..name.."_desc",
				callback = clbk
			}
			local new_item = menu_item:create_item(data, params)
			new_item.dirty_callback = callback(menu_item, menu_item, "item_dirty")
			if menu_item.callback_handler then
				new_item:set_callback_handler(menu_item.callback_handler)
			end
			local position = pos
			for index, item in pairs(menu_item._items) do
				if item:name() == item_name then
					position = index
					break
				end
			end
			table.insert(menu_item._items, position, new_item)
		end
		
		MenuCallbackHandler.OP_changelog_callback = function(self, item)
			Steam:overlay_activate("url", "https://steamcommunity.com/sharedfiles/filedetails/?id=2062176985")
		end
		
		if OriginalPackOptions.settings.Dev then
			MenuCallbackHandler.test_mode_enable_callback = function(self, item) end
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
			menu_node(nodes["OP_options"], "test_mode", "test_mode_callback", 4, "")
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

		local progress = OriginalPackOptions.settings.Enable_Max_Progress and "normal_progress" or "max_progress"
		
		MenuHelper:AddMenuItem(nodes["OP_options"], "OP_interface", "menu_user_interface", "", 1)
		menu_node(nodes["OP_options"], "OP_changelog", "OP_changelog_callback", 1, "options")
		menu_node(nodes["OP_options"], progress, "max_progress_callback", 3, "options")
		MenuCallbackHandler.OP_discord_callback = function(self, item)
			Steam:overlay_activate("url", "https://discord.com/invite/sEEbE95")
		end
		menu_node(nodes["OP_options"], "OP_discord", "OP_discord_callback", 1, "")
	end)
end
if string.lower(RequiredScript) == "lib/network/matchmaking/networkmatchmakingsteam" then
	NetworkMatchMakingSTEAM._BUILD_SEARCH_INTEREST_KEY = "Classic_Pack_" .. tweak_data.version
end
if string.lower(RequiredScript) == "lib/network/matchmaking/networkmatchmakingepic" then
	NetworkMatchMakingEPIC._BUILD_SEARCH_INTEREST_KEY = "Classic_Pack_" .. tweak_data.version
end
if string.lower(RequiredScript) == "lib/managers/savefilemanager" then
	SavefileManager.PROGRESS_SLOT = 24
	SavefileManager.BACKUP_SLOT = 24
end
if string.lower(RequiredScript) == "lib/managers/menu/menunodegui" then
	MenuNodeMainGui.version = "Version " .. tweak_data.version
	function MenuNodeMainGui:_add_version_string()
		if alive(self._version_string) then
			self._version_string:parent():remove(self._version_string)

			self._version_string = nil
		end
		
		if alive(self._vanilla_version_string) then
			self._vanilla_version_string:parent():remove(self._vanilla_version_string)

			self._vanilla_version_string = nil
		end

		if Application:debug_enabled() or SystemInfo:platform() == Idstring("WIN32") then
			local vanilla_version = Application:version()
			self._vanilla_version_string = self.ws:panel():text({
				name = "vanilla_version_string",
				vertical = "bottom",
				align = "right",
				alpha = 0.5,
				text = vanilla_version,
				font = tweak_data.menu.pd2_small_font,
				font_size = tweak_data.menu.pd2_small_font_size
			})
			self._version_string = self.ws:panel():text({
				name = "version_string",
				vertical = "bottom",
				align = "left",
				alpha = 1,
				text = MenuNodeMainGui.version,
				font = tweak_data.menu.pd2_large_font,
				font_size = 26
			})
			self._original_pack_logo = self.ws:panel():bitmap({
				texture = "guis/textures/menu_original_pack_logo",
				w = 504 / 2.1,
				h = 177 / 2.1,
				y = 102 * 6,
				rotation = 360
			})
			local function fade_in(o)
				local from = Color(0, 1, 1, 1)
				local to = Color(1, 1, 1, 1)
				local t = 0

				o:set_color(from)

				while t < 3 do
					local dt = coroutine.yield()
					t = t + dt
				end

				t = 0

				while t < 1 do
					local dt = coroutine.yield()
					t = t + dt

					o:set_color(from * (1 - t) + to * t)
				end

				o:set_color(to)
			end
			local function fade_out(o)
				local from = Color(1, 1, 1, 1)
				local to = Color(0, 1, 1, 1)
				local t = 0

				o:set_color(from)

				while t < 3 do
					local dt = coroutine.yield()
					t = t + dt
				end

				t = 0

				while t < 1 do
					local dt = coroutine.yield()
					t = t + dt

					o:set_color(from * (1 - t) + to * t)
				end

				o:set_color(to)
			end

			self._original_pack_logo:animate(fade_out)
			self._version_string:animate(fade_in)
			self._vanilla_version_string:animate(fade_in)
		end
	end
end
if string.lower(RequiredScript) == "lib/managers/blackmarketmanager" then
	function BlackMarketManager:max_progress()
		if _G.OriginalPackOptions.settings.Enable_Max_Progress then
			local xp = 23400000
			managers.experience:add_points(xp, false, true)
			managers.skilltree:give_specialization_points(xp)
			for rank = managers.experience:current_rank() + 1, #tweak_data.infamy.tree + 1 do
				managers.experience:set_current_rank(tweak_data.testers_infamy or 5)
			end
			local max_points = managers.skilltree:digest_value(Global.skilltree_manager.specializations.max_points, false)
			Global.skilltree_manager.specializations.total_points = managers.skilltree:digest_value(max_points, true)
			Global.skilltree_manager.specializations.points = managers.skilltree:digest_value(max_points, true)
			local specialization_tweak = tweak_data.skilltree.specializations
			for tree, data in ipairs(managers.skilltree._global.specializations) do
				local total_points = 0
				for tier, spec_data in ipairs(specialization_tweak[tree]) do
					total_points = total_points + spec_data.cost
				end
				if specialization_tweak[tree] then
					local points_left = total_points - managers.skilltree:digest_value(data.points_spent, false)
					managers.skilltree:spend_specialization_points(points_left, tree)
				end
			end
			Global.skilltree_manager.specializations.points = managers.skilltree:digest_value(0, true)
			Global.skilltree_manager.specializations.points_present = managers.skilltree:digest_value(0, true)
			Global.skilltree_manager.specializations.xp_leftover = managers.skilltree:digest_value(0, true)
			Global.skilltree_manager.specializations.xp_present = managers.skilltree:digest_value(0, true)
			for _, infamy in pairs(tweak_data.infamy.tree) do
				managers.infamy:unlock_item(infamy)
			end
			managers.money:_set_offshore(tweak_data.max_offshore)
			managers.money:_set_total(tweak_data.max_spending_cash)
			managers.custom_safehouse:set_coins(tweak_data.max_coins)
			for name, item in pairs(tweak_data.blackmarket.weapon_mods) do
				if not item.dlc or managers.dlc:is_dlc_unlocked(item.dlc) then
					for i = 100, 100 do
						managers.blackmarket:add_to_inventory(item.dlc or "normal", "weapon_mods", name)
					end
				end
			end
			for name, item in pairs(tweak_data.blackmarket.masks) do
				if name ~= "character_locked" then
					if item.dlc and managers.dlc:is_dlc_unlocked(item.dlc) then
						managers.blackmarket:add_to_inventory(item.dlc, "masks", name)
					else
						local global_value = item.infamous and "infamous" or item.global_value or "normal"
						managers.blackmarket:add_to_inventory(global_value, "masks", name)
					end
				end
			end
			for name, item in pairs(tweak_data.blackmarket.materials) do
				if name ~= "plastic" then
					if item.dlc and managers.dlc:is_dlc_unlocked(item.dlc) then
						local global_value = item.infamous and "infamous" or item.global_value or item.dlc
						managers.blackmarket:add_to_inventory(global_value, "materials", name)
					else
						local global_value = item.infamous and "infamous" or item.global_value or "normal"
						managers.blackmarket:add_to_inventory(global_value, "materials", name)
					end
				end
			end
			for name, item in pairs(tweak_data.blackmarket.textures) do
				if name ~= "no_color_no_material" and name ~= "no_color_full_material" then
					if item.dlc and managers.dlc:is_dlc_unlocked(item.dlc) then
						local global_value = item.infamous and "infamous" or item.global_value or item.dlc
						managers.blackmarket:add_to_inventory(global_value, "textures", name)
					else
						local global_value = item.infamous and "infamous" or item.global_value or "normal"
						managers.blackmarket:add_to_inventory(global_value, "textures", name)
					end
				end
			end
			for name, item in pairs(tweak_data.blackmarket.colors) do
				if item.dlc and managers.dlc:is_dlc_unlocked(item.dlc) then
					local global_value = item.infamous and "infamous" or item.global_value or item.dlc
					managers.blackmarket:add_to_inventory(global_value, "colors", name)
				else
					local global_value = item.infamous and "infamous" or item.global_value or "normal"
					managers.blackmarket:add_to_inventory(global_value, "colors", name)
				end
			end
		end
	end
end
if string.lower(RequiredScript) == "lib/managers/dlcmanager" then
	function GenericDLCManager:give_dlc_and_verify_blackmarket()
		self:give_dlc_package()
		if managers.blackmarket then
			managers.blackmarket:tradable_dlcs()
			managers.blackmarket:verify_dlc_items()
			if not Global.blackmarket_manager.max_progress and _G.OriginalPackOptions.settings.Enable_Max_Progress then
				Global.blackmarket_manager.max_progress = true
				managers.blackmarket:max_progress()
			end
		else
			Application:error("[GenericDLCManager] _load_done(): BlackMarketManager not yet initialized!")
		end
	end
end
if string.lower(RequiredScript) == "lib/managers/menumanager" then
	function MenuManager:color_range(text, color, string_text)
		local modifier_string = string_text
		local text_dissected = utf8.characters(modifier_string)
		local idsp = Idstring("#")
		local start_ci = {}
		local end_ci = {}
		local first_ci = true
		for i, c in ipairs(text_dissected) do
			if Idstring(c) == idsp then
				local next_c = text_dissected[i + 1]

				if next_c and Idstring(next_c) == idsp then
					if first_ci then
						table.insert(start_ci, i)
					else
						table.insert(end_ci, i)
					end

					first_ci = not first_ci
				end
			end
		end

		if #start_ci == #end_ci then
			for i = 1, #start_ci, 1 do
				start_ci[i] = start_ci[i] - ((i - 1) * 4 + 1)
				end_ci[i] = end_ci[i] - (i * 4 - 1)
			end
		end

		modifier_string = string.gsub(modifier_string, "##", "")
		if alive(text) then
			text:set_text(modifier_string)
			text:clear_range_color(1, utf8.len(modifier_string))

			if #start_ci ~= #end_ci then
				Application:error("CrimeNetContractGui: Not even amount of ##'s in skill description string!", #start_ci, #end_ci)
			else
				for i = 1, #start_ci, 1 do
					text:set_range_color(start_ci[i], end_ci[i], i == 1 and color)
				end
			end
		end
	end
	
	local data = MenuManager.show_question_new_safehouse
	function MenuManager:show_question_new_safehouse(params)
		if not _G.OriginalPackOptions.settings.Enable_Test then
			data(self, params)
		end
	end
	
	local data = MenuManager.show_question_new_safehouse_new_player
	function MenuManager:show_question_new_safehouse_new_player(params)
		if not _G.OriginalPackOptions.settings.Enable_Test then
			data(self, params)
		end
	end
	function MenuCallbackHandler:_dialog_clear_progress_yes()
		managers.menu:do_clear_progress()
		if _G.OriginalPackOptions.settings.Enable_Max_Progress then
			managers.blackmarket:max_progress()
		end
		if managers.menu_component then
			managers.menu_component:refresh_player_profile_gui()
		end
		managers.savefile:save_progress()
		managers.savefile:save_setting(true)
		Global.achievment_manager.reset_milestones = true
	end
end
if string.lower(RequiredScript) == "core/lib/managers/coresequencemanager" then
	local mod_path = tostring(OriginalPackCore._mod_path)
	Hooks:Add("BeardLibCreateScriptDataMods", "OriginalPackCore", function()
		BeardLib:ReplaceScriptData(mod_path .. "assets/OrPack.credits", "custom_xml", "gamedata/OP", "credits", true)
	end)
end
if string.lower(RequiredScript) == "lib/managers/menu/renderers/menunodecreditsgui" then
	function MenuNodeCreditsGui:init(node, layer, parameters)
		MenuNodeCreditsGui.super.init(self, node, layer, parameters)
		self:_build_credits_panel(node._parameters.credits_file)
		if node._parameters.credits_file == "OP" then
			managers.music:post_event("pth_i_will_give_you_my_all")
		else
			managers.music:post_event(managers.music:jukebox_menu_track("credits"))
		end
	end
end
