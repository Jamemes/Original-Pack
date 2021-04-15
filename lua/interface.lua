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
if string.lower(RequiredScript) == "lib/managers/menu/playerprofileguiobject" then
	function PlayerProfileGuiObject:init(ws)
		local panel = ws:panel():panel()
		local next_level_data = managers.experience:next_level_data() or {}
		local max_left_len = 0
		local max_right_len = 0
		local font = tweak_data.menu.pd2_small_font
		local font_size = tweak_data.menu.pd2_small_font_size
		local bg_ring = panel:bitmap({
			texture = "guis/textures/pd2/level_ring_small",
			y = 10,
			alpha = 0.4,
			x = 10,
			w = font_size * 4,
			h = font_size * 4,
			color = Color.black
		})
		local exp_ring = panel:bitmap({
			texture = "guis/textures/pd2/level_ring_small",
			render_template = "VertexColorTexturedRadial",
			blend_mode = "add",
			y = 10,
			x = 10,
			layer = 1,
			w = font_size * 4,
			h = font_size * 4,
			color = Color((next_level_data.current_points or 1) / (next_level_data.points or 1), 1, 1)
		})
		local player_level = managers.experience:current_level()
		local player_rank = managers.experience:current_rank()
		local is_infamous = player_rank > 0
		local level_string = (is_infamous and managers.experience:rank_string(player_rank) .. "-" or "") .. tostring(player_level)
		local level_text = panel:text({
			vertical = "center",
			align = "center",
			font = tweak_data.menu.pd2_medium_font,
			font_size = tweak_data.menu.pd2_medium_font_size + (is_infamous and -5 or 0),
			text = level_string,
			color = tweak_data.screen_colors.text
		})

		self:_make_fine_text(level_text)
		level_text:set_font_size(level_text:font_size() * math.min(font_size * 2 / level_text:w(), 1))
		level_text:set_center(exp_ring:center())

		max_left_len = math.max(max_left_len, level_text:w())
		local player_text = panel:text({
			y = 10,
			font = font,
			font_size = font_size,
			text = tostring(managers.network.account:username() or managers.blackmarket:get_preferred_character_real_name()),
			color = tweak_data.screen_colors.text
		})

		self:_make_fine_text(player_text)
		player_text:set_left(math.round(exp_ring:right()))

		max_left_len = math.max(max_left_len, player_text:w())
		
		local money_text_string = self:get_text("menu_cash", {money = "##" .. managers.money:total_string() .. "##"})
		local money_text = panel:text({
			text = money_text_string,
			font_size = font_size,
			font = font,
			color = tweak_data.screen_colors.text
		})

		self:_make_fine_text(money_text)
		money_text:set_left(math.round(exp_ring:right()))
		money_text:set_top(math.round(player_text:bottom()))
		max_left_len = math.max(max_left_len, money_text:w())
		
		local total_money_text_string = self:get_text("hud_offshore_account") .. ": " .. "##" .. managers.experience:cash_string(managers.money:offshore()) .. "##"
		local total_money_text = panel:text({
			text = total_money_text_string,
			font_size = font_size,
			font = font,
			color = tweak_data.screen_colors.text
		})

		self:_make_fine_text(total_money_text)
		total_money_text:set_left(math.round(exp_ring:right()))
		total_money_text:set_top(math.round(money_text:bottom()))
		
		max_left_len = math.max(max_left_len, total_money_text:w())
		local skillpoint_top = math.round(total_money_text:bottom())
		local unlocked = false
		local coins = 0
		coins = managers.custom_safehouse:coins()
		local coin_string_text = self:get_text("menu_es_coins_progress") .. ": " .. "##" .. managers.experience:cash_string(math.floor(coins), "") .. "##"
		local coin_text = panel:text({
			text = coin_string_text,
			font_size = font_size,
			font = font,
			color = tweak_data.screen_colors.text
		})

		self:_make_fine_text(coin_text)
		coin_text:set_left(math.round(exp_ring:right()))
		coin_text:set_top(skillpoint_top)
		
		max_left_len = math.max(max_left_len, coin_text:w())
		skillpoint_top = math.round(coin_text:bottom())		
		
		managers.menu:color_range(
			money_text,
			managers.money:total() >= tweak_data.max_spending_cash and tweak_data.screen_colors.max_money or tweak_data.screen_colors.text,
			money_text_string
		)
		managers.menu:color_range(
			total_money_text,
			managers.money:offshore() >= tweak_data.max_offshore and tweak_data.screen_colors.max_money or tweak_data.screen_colors.text,
			total_money_text_string
		)
		managers.menu:color_range(
			coin_text,
			managers.custom_safehouse:coins() >= tweak_data.max_coins and tweak_data.screen_colors.max_money or tweak_data.screen_colors.text,
			coin_string_text
		)
					
		local skillpoints = managers.skilltree:points()
		local skill_text, skill_glow = nil

		if skillpoints > 0 then
			skill_text = panel:text({
				layer = 1,
				text = self:get_text("menu_spendable_skill_points", {
					points = tostring(skillpoints)
				}),
				font_size = font_size,
				font = font,
				color = tweak_data.screen_colors.text
			})

			self:_make_fine_text(skill_text)
			skill_text:set_left(math.round(exp_ring:right()))
			skill_text:set_top(skillpoint_top)

			max_left_len = math.max(max_left_len, skill_text:w())
			local skill_icon = panel:bitmap({
				w = 16,
				texture = "guis/textures/pd2/shared_skillpoint_symbol",
				h = 16,
				layer = 1
			})

			skill_icon:set_right(skill_text:left())
			skill_icon:set_center_y(skill_text:center_y() + 1)

			skill_glow = panel:bitmap({
				texture = "guis/textures/pd2/crimenet_marker_glow",
				blend_mode = "add",
				layer = 0,
				w = panel:w(),
				h = skill_text:h() * 2,
				color = tweak_data.screen_colors.button_stage_3
			})

			skill_glow:set_center_y(skill_icon:center_y())
		end

		local font_scale = 1
		local mastermind_ponts, num_skills = managers.skilltree:get_tree_progress_2("mastermind")
		mastermind_ponts = string.format("%02d", mastermind_ponts)
		local mastermind_text = panel:text({
			y = 10,
			text = self:get_text("menu_profession_progress", {
				profession = self:get_text("st_menu_mastermind"),
				progress = mastermind_ponts,
				num_skills = num_skills
			}),
			font_size = font_size * font_scale,
			font = font,
			color = tweak_data.screen_colors.text
		})

		self:_make_fine_text(mastermind_text)

		max_right_len = math.max(max_right_len, mastermind_text:w())
		local enforcer_ponts, num_skills = managers.skilltree:get_tree_progress_2("enforcer")
		enforcer_ponts = string.format("%02d", enforcer_ponts)
		local enforcer_text = panel:text({
			text = self:get_text("menu_profession_progress", {
				profession = self:get_text("st_menu_enforcer"),
				progress = enforcer_ponts,
				num_skills = num_skills
			}),
			font_size = font_size * font_scale,
			font = font,
			color = tweak_data.screen_colors.text
		})

		self:_make_fine_text(enforcer_text)
		enforcer_text:set_top(math.round(mastermind_text:bottom()))

		max_right_len = math.max(max_right_len, enforcer_text:w())
		local technician_ponts, num_skills = managers.skilltree:get_tree_progress_2("technician")
		technician_ponts = string.format("%02d", technician_ponts)
		local technician_text = panel:text({
			text = self:get_text("menu_profession_progress", {
				profession = self:get_text("st_menu_technician"),
				progress = technician_ponts,
				num_skills = num_skills
			}),
			font_size = font_size * font_scale,
			font = font,
			color = tweak_data.screen_colors.text
		})

		self:_make_fine_text(technician_text)
		technician_text:set_top(math.round(enforcer_text:bottom()))

		max_right_len = math.max(max_right_len, technician_text:w())
		local ghost_ponts, num_skills = managers.skilltree:get_tree_progress_2("ghost")
		ghost_ponts = string.format("%02d", ghost_ponts)
		local ghost_text = panel:text({
			text = self:get_text("menu_profession_progress", {
				profession = self:get_text("st_menu_ghost"),
				progress = ghost_ponts,
				num_skills = num_skills
			}),
			font_size = font_size * font_scale,
			font = font,
			color = tweak_data.screen_colors.text
		})

		self:_make_fine_text(ghost_text)
		ghost_text:set_top(math.round(technician_text:bottom()))

		max_right_len = math.max(max_right_len, ghost_text:w())
		local hoxton_ponts, num_skills = managers.skilltree:get_tree_progress_2("hoxton")
		hoxton_ponts = string.format("%02d", hoxton_ponts)
		local hoxton_text = panel:text({
			text = self:get_text("menu_profession_progress", {
				profession = self:get_text("st_menu_hoxton_pack"),
				progress = hoxton_ponts,
				num_skills = num_skills
			}),
			font_size = font_size * font_scale,
			font = font,
			color = tweak_data.screen_colors.text
		})

		self:_make_fine_text(hoxton_text)
		hoxton_text:set_top(math.round(ghost_text:bottom()))

		max_right_len = math.max(max_right_len, hoxton_text:w())
		self._panel = panel

		self._panel:set_size(exp_ring:w() + max_left_len + 15 + max_right_len + 10, math.max(skill_text and skill_text:bottom() or total_money_text:bottom(), hoxton_text:bottom()) + 8)
		self._panel:set_bottom(self._panel:parent():h() - 60)
		BoxGuiObject:new(self._panel, {
			sides = {
				1,
				1,
				1,
				1
			}
		})
		mastermind_text:set_right(self._panel:w() - 10)
		enforcer_text:set_right(self._panel:w() - 10)
		technician_text:set_right(self._panel:w() - 10)
		ghost_text:set_right(self._panel:w() - 10)
		hoxton_text:set_right(self._panel:w() - 10)
		bg_ring:move(-5, 0)
		exp_ring:move(-5, 0)
		level_text:set_center(exp_ring:center())

		if skill_glow then
			local function animate_new_skillpoints(o)
				while true do
					over(1, function (p)
						o:set_alpha(math.lerp(0.4, 0.85, math.sin(p * 180)))
					end)
				end
			end

			skill_glow:set_w(self._panel:w())
			skill_glow:set_center_x(skill_text and skill_text:center_x() or 0)
			skill_glow:animate(animate_new_skillpoints)
		end

		self:_rec_round_object(panel)
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
		
		local unlocked = managers.custom_safehouse:unlocked()
		if unlocked then
			coins_text:set_color(managers.custom_safehouse:coins() >= tweak_data.max_coins and tweak_data.screen_colors.max_money or tweak_data.screen_colors.text)
		end
		money_text:set_color(managers.money:total() >= tweak_data.max_spending_cash and tweak_data.screen_colors.max_money or tweak_data.screen_colors.text)
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