if string.lower(RequiredScript) == "lib/states/menumainstate" then
	local data = MenuMainState.at_enter
	function MenuMainState:at_enter(old_state)
		MenuCallbackHandler.got_spooked = function(self, item)
			_G.OriginalPackOptions.settings.Spooky = true
			_G.OriginalPackOptions:Save()
		end
		local dialog_data = {
			focus_button = 1,
			title = "",
			text = "menu_spooky_text",
			texture = false
		}
		local blank = {}
		local no_button = {
			text = managers.localization:text("menu_spooky_no")
		}
		local yes_button = {
			text = managers.localization:text("menu_spooky_yes"),
			callback_func = MenuCallbackHandler.got_spooked
		}
		dialog_data.button_list = {
			blank,
			no_button,
			blank,
			blank,
			yes_button
		}
		
		dialog_data.video = "movies/177"
		dialog_data.video_loop = true
		
		if not _G.OriginalPackOptions.settings.Spooky then
			-- managers.menu:show_video_message_dialog(dialog_data)
		end
		
		data(self, old_state)
	end
end
if string.lower(RequiredScript) == "lib/managers/menu/menucomponentmanager" then
	function MenuComponentManager:create_new_heists_gui(node)
		return
	end
end
if string.lower(RequiredScript) == "lib/managers/menu/multiprofileitemgui" then
	local unlock_rank = tweak_data.unlock_profiles
	
	local data = MultiProfileItemGui.init
	function MultiProfileItemGui:init(ws, panel)
		data(self, ws, panel)
		if managers.experience:current_rank() < unlock_rank then
			self._panel:hide()
		else
			self._panel:show()
		end
	end

	local data = MultiProfileItemGui.mouse_moved
	function MultiProfileItemGui:mouse_moved(x, y)
		if managers.experience:current_rank() < unlock_rank then
			return
		end
		return data(self, x, y)
	end

	local data = MultiProfileItemGui.key_press
	function MultiProfileItemGui:key_press(o, k)
		if not self._editing and not managers.experience:current_rank() < unlock_rank then
			return
		end
		data(self, o, k)
	end

	local data = MultiProfileItemGui.key_release
	function MultiProfileItemGui:key_release(o, k)
		if not self._editing and not managers.experience:current_rank() < unlock_rank then
			return
		end
		data(self, o, k)
	end
end
if string.lower(RequiredScript) == "lib/managers/menu/walletguiobject" then
	function WalletGuiObject.set_old_position()
		local money_icon = Global.wallet_panel:child("wallet_money_icon")
		local level_icon = Global.wallet_panel:child("wallet_level_icon")
		local level_text = Global.wallet_panel:child("wallet_level_text")
		local skillpoint_icon = Global.wallet_panel:child("wallet_skillpoint_icon")
		local skillpoint_text = Global.wallet_panel:child("wallet_skillpoint_text")
		local coins_text = Global.wallet_panel:child("wallet_coins_text")
		local money_text = Global.wallet_panel:child("wallet_money_text")
		
		level_icon:set_leftbottom(2, money_icon:top() - 5)
		level_text:set_left(level_icon:right() + 2)
		level_text:set_center_y(level_icon:center_y())
		if _G.AchievementListGui.panel_crash_protection then
			skillpoint_icon:set_leftbottom(level_icon:right() + 25, level_icon:bottom())
		else
			skillpoint_icon:set_leftbottom(2, level_icon:top() - 5)
		end
		skillpoint_text:set_left(skillpoint_icon:right() + 2)
		skillpoint_text:set_center_y(skillpoint_icon:center_y())
		skillpoint_text:set_y(math.round(skillpoint_text:y()))
	end
	
	local data = WalletGuiObject.set_wallet
	function WalletGuiObject.set_wallet(panel, layer)
		data(panel, layer)
		WalletGuiObject.set_old_position()
	end
	
	local data = WalletGuiObject.refresh
	function WalletGuiObject.refresh()
		data()
		WalletGuiObject.set_old_position()
	end
end
if string.lower(RequiredScript) == "lib/managers/menu/menuscenemanager" then
	local data = MenuSceneManager.set_lobby_character_out_fit
	function MenuSceneManager:set_lobby_character_out_fit(i, outfit_string, rank)
		data(self, i, outfit_string, rank)
		local unit = self._lobby_characters[i]
		self:set_character_equipped_weapon(unit, nil, nil, "primary", nil)
	end
	
	local data = MenuSceneManager._select_henchmen_pose
	function MenuSceneManager:_select_henchmen_pose(unit, weapon_id, index)
		data(self, unit, weapon_id, index)
		self:_delete_character_weapon(unit, "all")
	end
	
	local data = MenuSceneManager._setup_bg
	function MenuSceneManager:_setup_bg()
		data(self)
		self._menu_logo:set_visible(false)
		self._menu_logo = World:spawn_unit(Idstring("units/menu/menu_scene/menu_logo"), Vector3(200, 0, -200), Rotation(180, 0, 0))
	end
end
if string.lower(RequiredScript) == "lib/managers/chatmanager" then
	ChatGui.PRESETS.inventory.chat_button_x_offset = 50
	ChatGui.PRESETS.inventory.chat_button_y_offset = 21
	ChatGui.PRESETS.lobby.chat_button_y_offset = 60
	ChatGui.PRESETS.default.chat_button_y_offset = 50
elseif string.lower(RequiredScript) == "lib/managers/menu/playerinventorygui" then
	Hooks:PreHook(PlayerInventoryGui, "_update_player_stats", "PlayerInventoryGui_update_player_stats", function(self)
		local player_panel = self._panel:child("player_panel")
		local info_panel = self._panel:child("info_panel")
		player_panel:set_h(285)
		self._player_box_panel:set_h(285)
		info_panel:set_y(player_panel:bottom() + 5)
	end)
end
if string.lower(RequiredScript) == "lib/managers/crimenetmanager" then
	function CrimeNetGui:add_special_contracts(no_casino, no_quickplay)
		-- return --включение старых меток на карте для покупки контрактов, казино, гейдж и базы данных

		for index, special_contract in ipairs(tweak_data.gui.crime_net.special_contracts) do
			local skip = false

			if managers.custom_safehouse:unlocked() and special_contract.id == "challenge" or not managers.custom_safehouse:unlocked() and special_contract.id == "safehouse" then
				skip = true
			end
			skip = skip or special_contract.sp_only and not Global.game_settings.single_player
			skip = skip or special_contract.mp_only and Global.game_settings.single_player
			skip = skip or special_contract.no_session_only and managers.network:session()
			if not skip then
				self:add_special_contract(special_contract, no_casino, no_quickplay)
			end
		end
	end
end
if string.lower(RequiredScript) == "lib/tweak_data/guitweakdata" then
	local data = GuiTweakData.init
	function GuiTweakData:init(...)
		data(self, ...)
		table.remove(self.crime_net.sidebar, 10)
		table.remove(self.crime_net.sidebar, 10)
		table.remove(self.crime_net.sidebar, 10)
		table.remove(self.crime_net.sidebar, 8)
		table.remove(self.crime_net.special_contracts, 5)
		table.remove(self.crime_net.special_contracts, 5)
		table.remove(self.crime_net.special_contracts, 5)
		table.remove(self.crime_net.special_contracts, 5)
		table.remove(self.crime_net.special_contracts, 5)
		self.crime_net.special_contracts[3].x = 347
		self.crime_net.special_contracts[3].y = 716
		self.crime_net.special_contracts[4].menu_node = "crimenet_contract_special"
	end
end
if string.lower(RequiredScript) == "core/lib/managers/coreenvironmentcontrollermanager" then
	function CoreEnvironmentControllerManager:set_chromatic_enabled(enabled)
		self._chromatic_enabled = enabled
		self._base_chromatic_amount = 0.2

		if self._material then
			if self._chromatic_enabled then
				self._material:set_variable(Idstring("chromatic_amount"), self._base_chromatic_amount)
			else
				self._material:set_variable(Idstring("chromatic_amount"), 0)
			end
		end
	end
end
if string.lower(RequiredScript) == "lib/tweak_data/blackmarket/playerstyletweakdata" then
	local data = BlackMarketTweakData._init_player_styles
	function BlackMarketTweakData:_init_player_styles(tweak_data)
		data(self, tweak_data)
		local body_replacement_with_armour = {
			head = false,
			armor = false,
			body = true,
			hands = true,
			vest = true
		}
		local wild_body_replacement_with_armour = {
			head = false,
			armor = false,
			body = true,
			hands = false,
			vest = true
		}
		self.player_styles.tux.body_replacement = body_replacement_with_armour
		self.player_styles.tux.characters.wild.third_body_replacement = wild_body_replacement_with_armour
		self.player_styles.tux.third_body_replacement = self.player_styles.tux.body_replacement
		self.player_styles.poolrepair.body_replacement = body_replacement_with_armour
		self.player_styles.poolrepair.third_body_replacement = body_replacement_with_armour
		self.player_styles.xmas_tuxedo.characters.wild.third_body_replacement = wild_body_replacement_with_armour
		self.player_styles.xmas_tuxedo.body_replacement = body_replacement_with_armour
		self.player_styles.xmas_tuxedo.third_body_replacement = body_replacement_with_armour
		self.player_styles.punk.body_replacement = body_replacement_with_armour
		self.player_styles.punk.third_body_replacement = body_replacement_with_armour
		self.player_styles.sneak_suit.body_replacement = body_replacement_with_armour
		self.player_styles.sneak_suit.third_body_replacement = body_replacement_with_armour
		self.player_styles.slaughterhouse.body_replacement = body_replacement_with_armour
		self.player_styles.slaughterhouse.third_body_replacement = body_replacement_with_armour
		self.player_styles.hippie.body_replacement = body_replacement_with_armour
		self.player_styles.hippie.third_body_replacement = body_replacement_with_armour
	end
end
if string.lower(RequiredScript) == "lib/managers/menu/crewmanagementgui" then
	function CrewManagementGui:populate_skill(params, data, gui)end
	function CrewManagementGui:populate_ability(henchman_index, data, gui)end
	function CrewManagementGui:create_ability_button(panel, index)end
	function CrewManagementGui:create_skill_button(panel, index)end
	function CrewManagementGui:create_weapon_button(panel, index)end
elseif string.lower(RequiredScript) == "lib/managers/blackmarketmanager" then
	function BlackMarketManager:is_weapon_category_allowed_for_crew(weapon_category)
		return
	end
end
if string.lower(RequiredScript) == "lib/states/bootupstate" then
	local data = BootupState.setup_intro_videos
	function BootupState:setup_intro_videos()
		data(self)
		table.remove(self._play_data_list, 3)
	end
end