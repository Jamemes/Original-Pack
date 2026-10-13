local NOT_WIN_32 = SystemInfo:platform() ~= Idstring("WIN32")
local WIDTH_MULTIPLIER = NOT_WIN_32 and 0.69 or 0.75
local BOX_GAP = 13.5
local GRID_H_MUL = (NOT_WIN_32 and 7 or 6) / 8
local massive_font = tweak_data.menu.pd2_massive_font
local large_font = tweak_data.menu.pd2_large_font
local medium_font = tweak_data.menu.pd2_medium_font
local small_font = tweak_data.menu.pd2_small_font
local massive_font_size = tweak_data.menu.pd2_massive_font_size
local large_font_size = tweak_data.menu.pd2_large_font_size
local medium_font_size = tweak_data.menu.pd2_medium_font_size
local small_font_size = tweak_data.menu.pd2_small_font_size

function BlackMarketGui:_setup(is_start_page, component_data)
	self._in_setup = true

	if alive(self._panel) then
		self._ws:panel():remove(self._panel)
	end

	MenuCallbackHandler:chk_dlc_content_updated()

	self._item_bought = nil
	self._panel = self._ws:panel():panel({})
	self._fullscreen_panel = self._fullscreen_ws:panel():panel({
		layer = 40
	})

	self:set_layer(45)

	self._disabled_panel = self._fullscreen_panel:panel({
		layer = 100
	})

	WalletGuiObject.set_wallet(self._panel)

	self._data = component_data or self:_start_page_data()
	self._node:parameters().menu_component_data = self._data
	self._requested_textures = {}

	if self._data.init_callback_name then
		local clbk_func = callback(self, self, self._data.init_callback_name, self._data.init_callback_params)

		if clbk_func then
			clbk_func()
		end

		if self._data.init_callback_params and self._data.init_callback_params.run_once then
			self._data.init_callback_name = nil
			self._data.init_callback_params = nil
		end
	end

	if not self._data.skip_blur then
		self._data.blur_fade = self._data.blur_fade or 0

		local blur = self._fullscreen_panel:bitmap({
			layer = -1,
			render_template = "VertexColorTexturedBlur3D",
			texture = "guis/textures/test_blur_df",
			w = self._fullscreen_ws:panel():w(),
			h = self._fullscreen_ws:panel():h()
		})

		local function func(o, component_data)
			local start_blur = component_data.blur_fade

			over(0.6 - 0.6 * component_data.blur_fade, function(p)
				component_data.blur_fade = math.lerp(start_blur, 1, p)

				o:set_alpha(component_data.blur_fade)
			end)
		end

		blur:animate(func, self._data)
	end

	self._panel:text({
		align = "right",
		name = "back_button",
		vertical = "bottom",
		text = utf8.to_upper(managers.localization:text("menu_back")),
		font_size = large_font_size,
		font = large_font,
		color = tweak_data.screen_colors.button_stage_3
	})
	self:make_fine_text(self._panel:child("back_button"))
	self._panel:child("back_button"):set_right(self._panel:w())
	self._panel:child("back_button"):set_bottom(self._panel:h())
	self._panel:child("back_button"):set_visible(managers.menu:is_pc_controller())

	self._pages = #self._data > 1 or self._data.show_tabs

	local grid_size = self._panel:h() - 70
	local grid_h_mul = self._data.panel_grid_h_mul or GRID_H_MUL
	local grid_panel_w = self._panel:w() * WIDTH_MULTIPLIER * (self._data.panel_grid_w_mul or 1)
	local grid_panel_h = grid_size * grid_h_mul
	local items_per_row = self._data[1] and self._data[1].override_slots and self._data[1].override_slots[1] or ITEMS_PER_ROW
	local items_per_column = self._data[1] and self._data[1].override_slots and self._data[1].override_slots[2] or ITEMS_PER_COLUMN

	grid_panel_w = math.ceil(grid_panel_w / items_per_row) * items_per_row
	grid_panel_h = math.ceil(grid_panel_h / items_per_column) * items_per_column

	local square_w = grid_panel_w / items_per_row
	local square_h = grid_panel_h / items_per_column
	local padding_w = 0
	local padding_h = 0
	local left_padding = 0
	local top_padding = 55 + (GRID_H_MUL - grid_h_mul) * grid_size
	local size_data = {}

	size_data.grid_w = math.floor(grid_panel_w)
	size_data.grid_h = math.floor(grid_panel_h)
	size_data.items_per_row = items_per_row
	size_data.items_per_column = items_per_column
	size_data.square_w = math.floor(square_w)
	size_data.square_h = math.floor(square_h)
	size_data.padding_w = math.floor(padding_w)
	size_data.padding_h = math.floor(padding_h)
	size_data.left_padding = math.floor(left_padding)
	size_data.top_padding = math.floor(top_padding)

	if grid_h_mul ~= GRID_H_MUL then
		self._no_input_panel = self._panel:panel({
			y = 60,
			w = grid_panel_w,
			h = top_padding - 60
		})
	end

	if self._data.use_bgs then
		local blur_panel = self._panel:panel({
			layer = -1,
			x = size_data.left_padding,
			y = size_data.top_padding + 33,
			w = size_data.grid_w,
			h = size_data.grid_h - 1
		})

		BlackMarketGui.blur_panel(blur_panel)
	end

	self._inception_node_name = self._node:parameters().menu_component_next_node_name or "blackmarket_node"
	self._preview_node_name = self._node:parameters().menu_component_preview_node_name or "blackmarket_preview_node"
	self._crafting_node_name = self._node:parameters().menu_component_crafting_node_name or "blackmarket_crafting_node"
	self._tabs = {}
	self._btns = {}
	self._title_text = self._panel:text({
		name = "title_text",
		text = managers.localization:to_upper_text(self._data.topic_id, self._data.topic_params),
		font_size = large_font_size,
		font = large_font,
		color = tweak_data.screen_colors.text
	})

	self:make_fine_text(self._title_text)

	if self._data.topic_colors then
		managers.menu_component:add_colors_to_text_object(self._title_text, self._data.topic_colors)
	elseif self._data.topic_color then
		managers.menu_component:make_color_text(self._title_text, self._data.topic_color)
	end

	self._tab_scroll_panel = self._panel:panel({
		w = grid_panel_w,
		y = top_padding + 1
	})
	self._tab_area_panel = self._panel:panel({
		w = grid_panel_w,
		y = top_padding + 1
	})
	self._tab_scroll_table = {
		panel = self._tab_scroll_panel
	}

	for i, data in ipairs(self._data) do
		if data.on_create_func_name then
			data.on_create_func = callback(self, self, data.on_create_func_name)
		end

		local new_tab_class = BlackMarketGuiTabItem

		if data.unique_tab_class then
			new_tab_class = _G[data.unique_tab_class]
		end

		local new_tab = new_tab_class:new(self._panel, data, self._node, size_data, not self._pages, self._tab_scroll_table, self)

		table.insert(self._tabs, new_tab)
	end

	if self._data.open_callback_name then
		local clbk_func = callback(self, self, self._data.open_callback_name, self._data.open_callback_params)

		if clbk_func then
			clbk_func()
		end
	end

	if #self._tabs > 0 then
		self._tab_area_panel:set_h(self._tabs[#self._tabs]._tab_panel:h())
	end

	self._selected = self._data.selected_tab or self._node:parameters().menu_component_selected or 1
	self._node:parameters().menu_component_selected = self._selected
	self._data.selected_tab = nil
	self._select_rect = self._panel:panel({
		layer = 8,
		name = "select_rect",
		w = square_w,
		h = square_h
	})

	if self._tabs[self._selected] then
		self._tabs[self._selected]:select(true)

		local slot_dim_x = self._tabs[self._selected].my_slots_dimensions[1]
		local slot_dim_y = self._tabs[self._selected].my_slots_dimensions[2]
		local _, any_slot = next(self._tabs[self._selected]._slots)

		if any_slot then
			self._select_rect:set_size(any_slot._panel:size())
		end

		self._select_rect_box = BoxGuiObject:new(self._select_rect, {
			sides = {
				2,
				2,
				2,
				2
			}
		})

		self._select_rect_box:set_clipping(false)

		self._box_panel = self._panel:panel()

		self._box_panel:set_shape(self._tabs[self._selected]._grid_panel:shape())

		self._box = BoxGuiObject:new(self._box_panel, {
			sides = {
				1,
				1,
				1 + (#self._tabs > 1 and 1 or 0),
				1
			}
		})

		local info_box_top = 88
		local info_box_size = self._panel:h() - 70
		local info_box_w = math.floor(self._panel:w() * (1 - WIDTH_MULTIPLIER) - BOX_GAP)
		local info_box_h = grid_panel_h

		if self._data.panel_grid_h_mul then
			info_box_h = math.floor(info_box_size * GRID_H_MUL)
		end

		self._extra_options_data = self._data.extra_options_data

		if self._data.extra_options_panel then
			self._extra_options_panel = self._panel:panel({
				name = "extra_options_panel"
			})

			self._extra_options_panel:set_size(info_box_w, self._data.extra_options_panel.height or self._data.extra_options_panel.h or 50)
			self._extra_options_panel:set_right(self._panel:w())
			self._extra_options_panel:set_top(info_box_top)

			local panel = self._extra_options_panel:panel()

			if self._data.extra_options_panel.on_create_func_name then
				if self._extra_options_data then
					self._extra_options_data.selected = math.min(self._extra_options_data.selected or 1, managers.blackmarket:num_preferred_characters() + 1, CriminalsManager.get_num_characters())
				end

				local selected = math.min(self._extra_options_data and self._extra_options_data.selected or 1, managers.blackmarket:num_preferred_characters() + 1, CriminalsManager.get_num_characters())

				self._extra_options_data = callback(self, self, self._data.extra_options_panel.on_create_func_name)(panel)
				self._extra_options_data.selected = selected

				local num_panels = 0

				for i = 1, #self._extra_options_data do
					if self._extra_options_data[i].panel then
						num_panels = num_panels + 1
					end
				end

				self._extra_options_data.num_panels = num_panels
			end

			self._extra_options_box = BoxGuiObject:new(self._extra_options_panel, {
				sides = {
					1,
					1,
					1,
					1
				}
			})

			local h = self._extra_options_panel:h() + 5

			info_box_top = info_box_top + h
			info_box_h = info_box_h - h
			self._data.extra_options_data = self._extra_options_data

			if is_win32 then
				self._ws:connect_keyboard(Input:keyboard())
				self._panel:key_press(callback(self, self, "extra_option_key_press"))

				self._keyboard_connected = true
			end
		end

		if self._data.add_market_panel then
			self._market_panel = self._panel:panel({
				h = 140,
				layer = 1,
				name = "market_panel",
				visible = true,
				y = info_box_top,
				w = info_box_w
			})

			self._market_panel:set_right(self._panel:w())
			self._market_panel:rect({
				alpha = 0.25,
				layer = -1,
				color = Color.black
			})

			self._market_border = BoxGuiObject:new(self._market_panel, {
				sides = {
					1,
					1,
					1,
					1
				}
			})

			local h = self._market_panel:h() + 5
			local market_bundles = {}

			for entry, safe in pairs(tweak_data.economy.safes) do
				if not safe.promo and not safe.ip_content then
					table.insert(market_bundles, {
						content = safe.content or "NONE",
						safe = entry,
						drill = safe.drill,
						prio = safe.prio or 0
					})
				end
			end

			local loc_sort = {}

			table.sort(market_bundles, function(x, y)
				if x.prio ~= y.prio then
					return (x.prio or 0) < (y.prio or 0)
				end

				if not loc_sort[x.safe] then
					loc_sort[x.safe] = managers.localization:text(tweak_data.economy.safes[x.safe].name_id)
				end

				if not loc_sort[y.safe] then
					loc_sort[y.safe] = managers.localization:text(tweak_data.economy.safes[y.safe].name_id)
				end

				return loc_sort[x.safe] < loc_sort[y.safe]
			end)

			local num_market_bundles = #market_bundles

			if managers.menu:is_pc_controller() and num_market_bundles > 0 then
				info_box_top = info_box_top + h
				info_box_h = info_box_h - h

				local title_text = self._panel:text({
					text = managers.localization:to_upper_text("menu_steam_market_inspect_title"),
					font = small_font,
					font_size = small_font_size,
					color = tweak_data.screen_colors.text
				})

				self:make_fine_text(title_text)
				title_text:set_left(self._market_panel:left())
				title_text:set_bottom(self._market_panel:top())

				local padding = 10
				local w = self._market_panel:w() - 2 * padding
				local h = self._market_panel:h() - 2 * padding
				local size = math.min(w / 2, h - 2 * small_font_size - padding * 0.5)
				local panel, safe_panel, drill_panel, safe_text, drill_text, safe_market_panel, drill_market_panel, title_text

				self._market_bundles = {}
				self._data.active_market_bundle = self._data.active_market_bundle or 1

				local texture, rect = tweak_data.hud_icons:get_icon_data("scrollbar_arrow")
				local select_bg = self._market_panel:rect({
					blend_mode = "add",
					layer = -2,
					color = tweak_data.screen_colors.button_stage_3:with_alpha(0.2)
				})
				local arrow_left = self._market_panel:bitmap({
					blend_mode = "add",
					texture = "guis/textures/menu_arrows",
					texture_rect = {
						24,
						0,
						24,
						24
					},
					color = tweak_data.screen_colors.button_stage_3,
					y = padding
				})
				local arrow_right = self._market_panel:bitmap({
					blend_mode = "add",
					rotation = 180,
					texture = "guis/textures/menu_arrows",
					texture_rect = {
						24,
						0,
						24,
						24
					},
					color = tweak_data.screen_colors.button_stage_3,
					y = padding
				})

				arrow_left:set_world_y(math.round(arrow_left:world_y()))
				arrow_right:set_world_y(math.round(arrow_right:world_y()) + 1)
				arrow_right:set_right(self._market_panel:w() - padding)
				arrow_left:set_left(padding)
				select_bg:set_shape(arrow_left:left(), arrow_left:top(), arrow_right:right() - arrow_left:left(), arrow_left:h())

				self._market_bundles.arrow_left = arrow_left
				self._market_bundles.arrow_right = arrow_right
				self._market_bundles.num_bundles = num_market_bundles
				self._market_bundles.market_bundles = market_bundles

				for i, bundle in ipairs(market_bundles) do
					panel = self._market_panel:panel({
						name = tostring(i),
						x = padding,
						y = padding,
						w = w,
						h = h,
						visible = i == self._data.active_market_bundle
					})
					title_text = panel:text({
						align = "center",
						h = 24,
						halign = "center",
						valign = "center",
						vertical = "center",
						text = managers.localization:to_upper_text("menu_steam_market_content_" .. bundle.content),
						font = small_font,
						font_size = small_font_size,
						color = tweak_data.screen_colors.button_stage_2
					})

					self:make_fine_text(title_text)
					title_text:set_center(panel:w() / 2, 12)

					local guis_catalog = "guis/"
					local bundle_folder = tweak_data.economy.safes[bundle.safe].texture_bundle_folder

					if bundle_folder then
						guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
					end

					local path = "safes/"
					local texture_path = guis_catalog .. path .. bundle.safe

					safe_panel = panel:panel({
						alpha = 0.9,
						name = "safe",
						y = small_font_size + padding * 0.5,
						w = size,
						h = size
					})

					safe_panel:set_center_x(w * 0.5)
					self:request_texture(texture_path, safe_panel, true, "normal")

					safe_text = panel:text({
						blend_mode = "add",
						text = managers.localization:to_upper_text("menu_steam_market_show_content"),
						font = small_font,
						font_size = small_font_size,
						x = safe_panel:x(),
						y = safe_panel:bottom() + 1,
						color = tweak_data.screen_colors.button_stage_3
					})

					self:make_fine_text(safe_text)
					safe_text:set_center_x(safe_panel:center_x())

					safe_market_panel = panel:panel({
						x = safe_panel:x(),
						y = safe_panel:y(),
						w = safe_panel:w(),
						h = safe_panel:h() + small_font_size
					})

					local guis_catalog = "guis/"
					local bundle_folder = tweak_data.economy.drills[bundle.drill].texture_bundle_folder

					if bundle_folder then
						guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
					end

					if not tweak_data.economy.safes[bundle.safe].free then
						local path = "drills/"
						local texture_path = guis_catalog .. path .. bundle.drill

						drill_panel = panel:panel({
							alpha = 0.9,
							name = "drill",
							y = small_font_size + padding * 0.5,
							w = size,
							h = size
						})

						drill_panel:set_center_x(w * 0.75)
						self:request_texture(texture_path, drill_panel, true, "normal")

						drill_text = panel:text({
							text = managers.localization:to_upper_text("menu_steam_market_buy_drill"),
							font = small_font,
							font_size = small_font_size,
							x = drill_panel:x(),
							y = drill_panel:bottom() + 1,
							color = tweak_data.screen_colors.button_stage_3
						})

						self:make_fine_text(drill_text)
						drill_text:set_center_x(drill_panel:center_x())
						drill_text:set_x(math.round(drill_text:x()))

						drill_market_panel = panel:panel({
							x = drill_panel:x(),
							y = drill_panel:y(),
							w = drill_panel:w(),
							h = drill_panel:h() + small_font_size
						})
					else
						drill_text = nil
						drill_panel = nil
						drill_market_panel = nil
					end

					self._market_bundles[i] = {
						panel = panel,
						safe = {
							entry = bundle.safe,
							image = safe_panel,
							text = safe_text,
							select = safe_market_panel
						},
						drill = {
							entry = bundle.drill,
							image = drill_panel,
							text = drill_text,
							select = drill_market_panel
						}
					}
				end
			else
				self._market_panel:hide()
				self._market_panel:set_h(0)
			end
		end

		local info_box_panel = self._panel:panel({
			name = "info_box_panel"
		})

		info_box_panel:set_size(info_box_w, info_box_h)
		info_box_panel:set_right(self._panel:w())
		info_box_panel:set_top(info_box_top)

		self._selected_slot = self._tabs[self._selected]:select_slot(nil, true)
		self._slot_data = self._selected_slot._data

		local x, y = self._tabs[self._selected]:selected_slot_center()

		self._select_rect:set_world_center(x, y)

		local BTNS = {
			w_move = {
				btn = "BTN_A",
				name = "bm_menu_btn_move_weapon",
				prio = managers.menu:is_pc_controller() and 5 or 1,
				callback = callback(self, self, "pickup_crafted_item_callback")
			},
			w_place = {
				btn = "BTN_A",
				name = "bm_menu_btn_place_weapon",
				prio = 1,
				callback = callback(self, self, "place_crafted_item_callback")
			},
			w_swap = {
				btn = "BTN_A",
				name = "bm_menu_btn_swap_weapon",
				prio = 1,
				callback = callback(self, self, "place_crafted_item_callback")
			},
			m_move = {
				btn = "BTN_A",
				name = "bm_menu_btn_move_mask",
				prio = 5,
				callback = callback(self, self, "pickup_crafted_item_callback")
			},
			m_place = {
				btn = "BTN_A",
				name = "bm_menu_btn_place_mask",
				prio = 1,
				callback = callback(self, self, "place_crafted_item_callback")
			},
			m_swap = {
				btn = "BTN_A",
				name = "bm_menu_btn_swap_mask",
				prio = 1,
				callback = callback(self, self, "place_crafted_item_callback")
			},
			i_stop_move = {
				btn = "BTN_X",
				name = "bm_menu_btn_stop_move",
				pc_btn = "menu_remove_item",
				prio = 2,
				callback = callback(self, self, "drop_hold_crafted_item_callback")
			},
			i_rename = {
				btn = "BTN_BACK",
				name = "bm_menu_btn_rename_item",
				pc_btn = "toggle_chat",
				prio = 2,
				callback = callback(self, self, "rename_item_with_gamepad_callback")
			},
			w_mod = {
				btn = "BTN_Y",
				name = "bm_menu_btn_mod",
				pc_btn = "menu_modify_item",
				prio = 2,
				callback = callback(self, self, "choose_weapon_mods_callback")
			},
			w_equip = {
				btn = "BTN_A",
				name = "bm_menu_btn_equip_weapon",
				prio = 1,
				callback = callback(self, self, "equip_weapon_callback")
			},
			w_preview = {
				btn = "BTN_STICK_R",
				name = "bm_menu_btn_preview",
				pc_btn = "menu_preview_item",
				prio = 3,
				callback = callback(self, self, "preview_weapon_callback")
			},
			w_sell = {
				btn = "BTN_X",
				name = "bm_menu_btn_sell",
				pc_btn = "menu_remove_item",
				prio = 4,
				callback = callback(self, self, "sell_item_callback")
			},
			w_skin = {
				btn = "BTN_STICK_L",
				name = "bm_menu_btn_skin",
				pc_btn = "menu_edit_skin",
				prio = 5,
				callback = callback(self, self, "edit_weapon_skin_callback")
			},
			w_unequip = {
				btn = "BTN_A",
				name = "bm_menu_btn_unequip_weapon",
				prio = 1,
				callback = function()
					return
				end
			},
			ew_unlock = {
				btn = "BTN_A",
				name = "bm_menu_btn_buy_weapon_slot",
				prio = 1,
				callback = callback(self, self, "choose_weapon_slot_unlock_callback")
			},
			ew_buy = {
				btn = "BTN_A",
				name = "bm_menu_btn_buy_new_weapon",
				prio = 1,
				callback = callback(self, self, "choose_weapon_buy_callback")
			},
			bw_buy = {
				btn = "BTN_A",
				name = "bm_menu_btn_buy_selected_weapon",
				prio = 1,
				callback = callback(self, self, "buy_weapon_callback")
			},
			bw_preview = {
				btn = "BTN_STICK_R",
				name = "bm_menu_btn_preview",
				pc_btn = "menu_preview_item",
				prio = 3,
				callback = callback(self, self, "preview_buy_weapon_callback")
			},
			bw_available_mods = {
				btn = "BTN_Y",
				name = "bm_menu_available_mods",
				pc_btn = "menu_preview_item_alt",
				prio = 2,
				callback = callback(self, self, "show_available_mods_callback")
			},
			bw_buy_dlc = {
				btn = "BTN_A",
				name = "bm_menu_buy_dlc",
				prio = 1,
				color = tweak_data.screen_colors.dlc_buy_color,
				callback = callback(self, self, "show_buy_dlc_callback")
			},
			bw_preview_mods = {
				btn = "BTN_Y",
				name = "bm_menu_preview_mods",
				pc_btn = "menu_preview_item_alt",
				prio = 2,
				callback = callback(self, self, "preview_weapon_mods_callback")
			},
			mt_choose = {
				btn = "BTN_A",
				name = "bm_menu_btn_choose",
				prio = 1,
				callback = callback(self, self, "choose_mod_callback")
			},
			wm_buy = {
				btn = "BTN_A",
				name = "bm_menu_btn_craft_mod",
				prio = 1,
				callback = callback(self, self, "buy_mod_callback")
			},
			wm_preview = {
				btn = "BTN_Y",
				name = "bm_menu_btn_preview",
				pc_btn = "menu_preview_item_alt",
				prio = 3,
				callback = callback(self, self, "preview_weapon_mod_callback")
			},
			wm_preview_mod = {
				btn = "BTN_STICK_R",
				name = "bm_menu_btn_preview_with_mod",
				pc_btn = "menu_preview_item",
				prio = 4,
				callback = callback(self, self, "preview_weapon_with_mod_callback")
			},
			wm_remove_buy = {
				btn = "BTN_X",
				name = "bm_menu_btn_remove_mod",
				pc_btn = "menu_remove_item",
				prio = 2,
				callback = callback(self, self, "remove_mod_callback")
			},
			wm_remove_preview_mod = {
				btn = "BTN_STICK_R",
				name = "bm_menu_btn_preview_with_mod",
				pc_btn = "menu_preview_item",
				prio = 4,
				callback = callback(self, self, "preview_weapon_mod_callback")
			},
			wm_remove_preview = {
				btn = "BTN_Y",
				name = "bm_menu_btn_preview_no_mod",
				pc_btn = "menu_preview_item_alt",
				prio = 3,
				callback = callback(self, self, "preview_weapon_without_mod_callback")
			},
			wm_sell = {
				btn = "BTN_X",
				name = "bm_menu_btn_sell",
				pc_btn = "menu_remove_item",
				prio = 2,
				callback = callback(self, self, "sell_weapon_mods_callback")
			},
			wm_reticle_switch_menu = {
				btn = "BTN_A",
				name = "bm_menu_btn_switch_reticle",
				prio = 1,
				callback = callback(self, self, "open_reticle_switch_menu")
			},
			wm_buy_mod = {
				btn = "BTN_START",
				name = "bm_menu_btn_buy_mod",
				pc_btn = "menu_respec_tree_all",
				prio = 4,
				callback = callback(self, self, "purchase_weapon_mod_callback")
			},
			wm_clear_mod_preview = {
				btn = "BTN_Y",
				name = "bm_menu_btn_clear_mod_preview",
				pc_btn = "menu_preview_item_alt",
				prio = 3,
				callback = callback(self, self, "clear_weapon_mod_preview_callback")
			},
			wm_customize_gadget = {
				btn = "BTN_A",
				name = "bm_menu_btn_customize_gadget",
				prio = 1,
				callback = callback(self, self, "open_customize_gadget_menu")
			},
			wcs_equip = {
				btn = "BTN_A",
				name = "bm_menu_btn_equip_weapon_cosmetic",
				prio = 1,
				callback = callback(self, self, "equip_weapon_color_callback")
			},
			wcs_customize_color = {
				btn = "BTN_A",
				name = "bm_menu_btn_customize_weapon_color",
				prio = 1,
				callback = callback(self, self, "open_customize_weapon_color_menu")
			},
			wcc_equip = {
				btn = "BTN_A",
				name = "bm_menu_btn_equip_weapon_cosmetic",
				prio = 1,
				callback = callback(self, self, "equip_weapon_cosmetics_callback")
			},
			wcc_choose = {
				btn = "BTN_A",
				name = "bm_menu_btn_choose_weapon_cosmetic",
				prio = 1,
				callback = callback(self, self, "choose_weapon_cosmetics_callback")
			},
			wcc_remove = {
				btn = "BTN_X",
				name = "bm_menu_btn_remove_weapon_cosmetic",
				pc_btn = "menu_remove_item",
				prio = 1,
				callback = callback(self, self, "remove_weapon_cosmetics_callback")
			},
			wcc_preview = {
				btn = "BTN_STICK_R",
				name = "bm_menu_btn_preview_weapon_cosmetic",
				pc_btn = "menu_preview_item",
				prio = 3,
				callback = callback(self, self, "preview_cosmetic_on_weapon_callback")
			},
			wcc_buy_equip_weapon = {
				btn = "BTN_A",
				name = "bm_menu_btn_buy_new_weapon",
				prio = 1,
				callback = callback(self, self, "buy_equip_weapon_cosmetics_callback")
			},
			wcc_cancel_preview = {
				btn = "BTN_STICK_R",
				name = "bm_menu_btn_stop_preview_weapon_cosmetic",
				pc_btn = "menu_preview_item",
				prio = 4,
				callback = callback(self, self, "cancel_preview_cosmetic_on_weapon_callback")
			},
			wcc_market = {
				btn = "BTN_X",
				name = "bm_menu_btn_buy_tradable",
				pc_btn = "menu_remove_item",
				prio = 5,
				callback = callback(self, self, "purchase_market_cosmetic_on_weapon_callback")
			},
			it_wcc_choose_equip = {
				btn = "BTN_A",
				name = "bm_menu_btn_equip_weapon_cosmetic",
				prio = 1,
				callback = callback(self, self, "choose_equip_weapon_cosmetics_callback")
			},
			it_wcc_preview = {
				btn = "BTN_STICK_R",
				name = "bm_menu_btn_preview_weapon_cosmetic",
				pc_btn = "menu_preview_item",
				prio = 3,
				callback = callback(self, self, "preview_weapon_cosmetics_callback")
			},
			it_copen = {
				btn = "BTN_A",
				name = "bm_menu_btn_open_container",
				prio = 1,
				callback = callback(self, self, "start_open_tradable_container_callback")
			},
			it_sell = {
				btn = "BTN_X",
				name = "bm_menu_btn_sell_tradable",
				pc_btn = "menu_remove_item",
				prio = 4,
				callback = callback(self, self, "sell_tradable_item")
			},
			it_wcc_armor_preview = {
				btn = "BTN_STICK_R",
				name = "bm_menu_btn_preview_armor_skin",
				pc_btn = "menu_preview_item",
				prio = 3,
				callback = callback(self, self, "preview_armor_skin_callback")
			},
			a_equip = {
				btn = "BTN_A",
				name = "bm_menu_btn_equip_armor",
				prio = 1,
				callback = callback(self, self, "equip_armor_callback")
			},
			a_mod = {
				btn = "BTN_Y",
				name = "bm_menu_btn_customize_armor",
				pc_btn = "menu_modify_item",
				prio = 2,
				callback = callback(self, self, "open_armor_skins_menu_callback")
			},
			as_equip = {
				btn = "BTN_A",
				name = "bm_menu_btn_equip_armor_skin",
				prio = 1,
				callback = callback(self, self, "equip_armor_skin_callback")
			},
			as_preview = {
				btn = "BTN_STICK_R",
				name = "bm_menu_btn_preview_armor_skin",
				pc_btn = "menu_preview_item",
				prio = 1,
				callback = callback(self, self, "preview_armor_skin_callback")
			},
			as_workshop = {
				btn = "BTN_STICK_L",
				name = "bm_menu_btn_skin",
				pc_btn = "menu_edit_skin",
				prio = 5,
				callback = callback(self, self, "edit_armor_skin_callback")
			},
			trd_equip = {
				btn = "BTN_A",
				name = "bm_menu_btn_equip_player_style",
				prio = 1,
				callback = callback(self, self, "equip_player_style_callback")
			},
			trd_customize = {
				btn = "BTN_Y",
				name = "bm_menu_btn_customize_player_style",
				pc_btn = "menu_modify_item",
				prio = 2,
				callback = callback(self, self, "customize_player_style_callback")
			},
			trd_preview = {
				btn = "BTN_STICK_R",
				name = "bm_menu_btn_preview_player_style",
				pc_btn = "menu_preview_item",
				prio = 3,
				callback = callback(self, self, "preview_player_style_callback")
			},
			trd_mod_equip = {
				btn = "BTN_A",
				name = "bm_menu_btn_equip_suit_variation",
				prio = 1,
				callback = callback(self, self, "equip_suit_variation_callback")
			},
			trd_mod_preview = {
				btn = "BTN_STICK_R",
				name = "bm_menu_btn_preview_suit_variation",
				pc_btn = "menu_preview_item",
				prio = 2,
				callback = callback(self, self, "preview_suit_variation_callback")
			},
			hnd_equip = {
				btn = "BTN_A",
				name = "bm_menu_btn_equip_gloves",
				prio = 1,
				callback = callback(self, self, "equip_gloves_callback")
			},
			hnd_preview = {
				btn = "BTN_STICK_R",
				name = "bm_menu_btn_preview_gloves",
				pc_btn = "menu_preview_item",
				prio = 3,
				callback = callback(self, self, "preview_gloves_callback")
			},
			m_equip = {
				btn = "BTN_A",
				name = "bm_menu_btn_equip_mask",
				prio = 1,
				callback = callback(self, self, "equip_mask_callback")
			},
			m_mod = {
				btn = "BTN_Y",
				name = "bm_menu_btn_mod_mask",
				pc_btn = "menu_modify_item",
				prio = 2,
				callback = callback(self, self, "mask_mods_callback")
			},
			m_preview = {
				btn = "BTN_STICK_R",
				name = "bm_menu_btn_preview_mask",
				pc_btn = "menu_preview_item",
				prio = 3,
				callback = callback(self, self, "preview_mask_callback")
			},
			m_sell = {
				btn = "BTN_X",
				name = "bm_menu_btn_sell_mask",
				pc_btn = "menu_remove_item",
				prio = 4,
				callback = callback(self, self, "sell_mask_callback")
			},
			m_remove = {
				btn = "BTN_X",
				name = "bm_menu_btn_remove_mask",
				pc_btn = "menu_remove_item",
				prio = 4,
				callback = callback(self, self, "remove_mask_callback")
			},
			em_gv = {
				btn = "BTN_A",
				name = "bm_menu_btn_buy_new_mask",
				prio = 1,
				callback = callback(self, self, "choose_mask_global_value_callback")
			},
			em_buy = {
				btn = "BTN_A",
				name = "bm_menu_btn_buy_new_mask",
				prio = 1,
				callback = callback(self, self, "choose_mask_buy_callback")
			},
			em_unlock = {
				btn = "BTN_A",
				name = "bm_menu_btn_buy_mask_slot",
				prio = 1,
				callback = callback(self, self, "choose_mask_slot_unlock_callback")
			},
			em_available_mods = {
				btn = "BTN_Y",
				name = "bm_menu_buy_mask_title",
				pc_btn = "menu_preview_item_alt",
				prio = 3,
				callback = callback(self, self, "show_available_mask_mods_callback")
			},
			mm_choose_textures = {
				btn = "BTN_A",
				name = "bm_menu_choose_pattern",
				prio = 1,
				callback = callback(self, self, "choose_mask_mod_callback", "textures")
			},
			mm_choose_materials = {
				btn = "BTN_A",
				name = "bm_menu_lic_choose_material",
				prio = 2,
				callback = callback(self, self, "choose_mask_mod_callback", "materials")
			},
			mm_choose_colors = {
				btn = "BTN_A",
				name = "bm_menu_lic_choose_color",
				prio = 3,
				callback = callback(self, self, "choose_mask_mod_callback", "colors")
			},
			mm_choose = {
				btn = "BTN_A",
				name = "bm_menu_btn_choose_mask_mod",
				prio = 1,
				callback = callback(self, self, "choose_mask_type_callback")
			},
			mm_buy = {
				btn = "BTN_Y",
				name = "bm_menu_btn_customize_mask",
				pc_btn = "menu_modify_item",
				prio = 5,
				callback = callback(self, self, "buy_customized_mask_callback")
			},
			mm_preview = {
				btn = "BTN_STICK_R",
				name = "bm_menu_btn_preview_mask",
				pc_btn = "menu_preview_item",
				prio = 4,
				callback = callback(self, self, "preview_customized_mask_callback")
			},
			mp_choose = {
				btn = "BTN_A",
				name = "bm_menu_btn_choose_mask_mod",
				prio = 1,
				callback = callback(self, self, "choose_mask_part_callback")
			},
			mp_preview = {
				btn = "BTN_STICK_R",
				name = "bm_menu_btn_preview_mask",
				pc_btn = "menu_preview_item",
				prio = 2,
				callback = callback(self, self, "preview_customized_mask_callback")
			},
			mp_preview_mod = {
				btn = "BTN_STICK_R",
				name = "bm_menu_btn_preview_mask",
				pc_btn = "menu_preview_item",
				prio = 2,
				callback = callback(self, self, "preview_customized_mask_with_mod_callback")
			},
			mp_choose_first = {
				btn = "BTN_A",
				name = "bm_menu_btn_lic_choose_color_a",
				prio = 1,
				callback = callback(self, self, "choose_mask_color_a_callback")
			},
			mp_choose_second = {
				btn = "BTN_A",
				name = "bm_menu_btn_lic_choose_color_b",
				prio = 1,
				callback = callback(self, self, "choose_mask_color_b_callback")
			},
			mp_choose_third = {
				btn = "BTN_A",
				name = "bm_menu_btn_lic_choose_color_c",
				prio = 1,
				callback = callback(self, self, "choose_mask_color_c_callback")
			},
			bm_buy = {
				btn = "BTN_A",
				name = "bm_menu_btn_buy_selected_mask",
				prio = 1,
				callback = callback(self, self, "buy_mask_callback")
			},
			bm_preview = {
				btn = "BTN_STICK_R",
				name = "bm_menu_btn_preview_mask",
				pc_btn = "menu_preview_item",
				prio = 2,
				callback = callback(self, self, "preview_buy_mask_callback")
			},
			bm_sell = {
				btn = "BTN_X",
				name = "bm_menu_btn_sell_mask",
				pc_btn = "menu_remove_item",
				prio = 4,
				callback = callback(self, self, "sell_stashed_mask_callback")
			},
			c_equip = {
				btn = "BTN_A",
				name = "bm_menu_btn_set_preferred",
				prio = 1,
				callback = callback(self, self, "set_preferred_character_callback")
			},
			c_swap_slots = {
				btn = "BTN_A",
				name = "bm_menu_btn_swap_preferred_slots",
				prio = 1,
				callback = callback(self, self, "swap_preferred_character_to_slot_callback")
			},
			c_equip_to_slot = {
				btn = "BTN_A",
				name = "bm_menu_btn_set_preferred_to_slot",
				prio = 1,
				callback = callback(self, self, "set_preferred_character_to_slot_callback")
			},
			c_clear_slots = {
				btn = "BTN_X",
				name = "bm_menu_btn_clear_preferred",
				pc_btn = "menu_remove_item",
				prio = 2,
				callback = callback(self, self, "clear_preferred_characters_callback")
			},
			lo_w_equip = {
				btn = "BTN_A",
				name = "bm_menu_btn_equip_weapon",
				prio = 1,
				callback = callback(self, self, "equip_weapon_callback")
			},
			lo_d_equip = {
				btn = "BTN_A",
				name = "bm_menu_btn_equip_deployable",
				prio = 1,
				callback = callback(self, self, "lo_equip_deployable_callback")
			},
			lo_d_equip_primary = {
				btn = "BTN_A",
				name = "bm_menu_btn_equip_primary_deployable",
				prio = 1,
				callback = callback(self, self, "lo_equip_deployable_callback")
			},
			lo_d_equip_secondary = {
				btn = "BTN_X",
				name = "bm_menu_btn_equip_secondary_deployable",
				pc_btn = "menu_remove_item",
				prio = 2,
				callback = callback(self, self, "lo_equip_deployable_callback_secondary")
			},
			lo_d_unequip = {
				btn = "BTN_X",
				name = "bm_menu_btn_unequip_deployable",
				pc_btn = "menu_remove_item",
				prio = 1,
				callback = callback(self, self, "lo_unequip_deployable_callback")
			},
			lo_d_sentry_ap_rounds = {
				btn = "BTN_Y",
				name = "bm_menu_btn_sentry_ap_rounds",
				pc_btn = "menu_modify_item",
				prio = 3,
				callback = callback(self, self, "set_sentry_ap_rounds_callback")
			},
			lo_d_sentry_default_rounds = {
				btn = "BTN_Y",
				name = "bm_menu_btn_sentry_default_rounds",
				pc_btn = "menu_modify_item",
				prio = 3,
				callback = callback(self, self, "set_sentry_default_rounds_callback")
			},
			lo_mw_equip = {
				btn = "BTN_A",
				name = "bm_menu_btn_equip_melee_weapon",
				prio = 1,
				callback = callback(self, self, "lo_equip_melee_weapon_callback")
			},
			lo_mw_preview = {
				btn = "BTN_STICK_R",
				name = "bm_menu_btn_preview_melee_weapon",
				pc_btn = "menu_preview_item",
				prio = 2,
				callback = callback(self, self, "preview_melee_weapon_callback")
			},
			lo_mw_add_favorite = {
				btn = "BTN_Y",
				name = "bm_menu_btn_add_favorite",
				pc_btn = "menu_modify_item",
				prio = 3,
				callback = callback(self, self, "add_melee_weapon_favorite")
			},
			lo_mw_remove_favorite = {
				btn = "BTN_Y",
				name = "bm_menu_btn_remove_favorite",
				pc_btn = "menu_modify_item",
				prio = 3,
				callback = callback(self, self, "remove_melee_weapon_favorite")
			},
			lo_g_equip = {
				btn = "BTN_A",
				name = "bm_menu_btn_equip_grenade",
				prio = 1,
				callback = callback(self, self, "lo_equip_grenade_callback")
			},
			lo_g_preview = {
				btn = "BTN_STICK_R",
				name = "bm_menu_btn_preview_grenade",
				pc_btn = "menu_preview_item",
				prio = 2,
				callback = callback(self, self, "preview_grenade_callback")
			},
			custom_select = {
				btn = "BTN_A",
				name = "bm_menu_btn_select",
				prio = 1,
				callback = function()
					return
				end
			},
			custom_unselect = {
				btn = "BTN_A",
				name = "bm_menu_btn_unselect",
				prio = 1,
				callback = function()
					return
				end
			},
			ci_unlock = {
				btn = "BTN_A",
				name = "bm_menu_btn_unlock_crew_item",
				prio = 1,
				callback = callback(self, self, "buy_crew_item_callback")
			}
		}

		for btn, data in pairs(BTNS) do
			data.callback = callback(self, self, "overridable_callback", {
				button = btn,
				callback = data.callback
			})
		end

		local get_real_font_sizes = false
		local real_small_font_size = small_font_size

		if get_real_font_sizes then
			local test_text = self._panel:text({
				visible = false,
				font = small_font,
				font_size = small_font_size,
				text = "TeWqjI-" .. managers.localization:get_default_macro("BTN_BOTTOM_L")
			})
			local x, y, w, h = test_text:text_rect()

			real_small_font_size = h

			self._panel:remove(test_text)

			test_text = nil
		end

		self._real_small_font_size = real_small_font_size

		local real_medium_font_size = medium_font_size

		if get_real_font_sizes then
			local test_text = self._panel:text({
				visible = false,
				font = medium_font,
				font_size = medium_font_size,
				text = "TeWqjI-" .. managers.localization:get_default_macro("BTN_BOTTOM_L")
			})
			local x, y, w, h = test_text:text_rect()

			real_medium_font_size = h
		end

		self._real_medium_font_size = real_medium_font_size
		self._info_box_panel_y = info_box_panel:y()
		self._weapon_info_panel = self._panel:panel({
			x = info_box_panel:x(),
			y = info_box_panel:y(),
			w = info_box_panel:w()
		})
		self._detection_panel = self._panel:panel({
			h = 64,
			layer = 1,
			name = "suspicion_panel",
			x = info_box_panel:x(),
			y = info_box_panel:y() + 250,
			w = info_box_panel:w()
		})
		self._btn_panel = self._panel:panel({
			h = 136,
			name = "btn_panel",
			x = info_box_panel:x(),
			w = info_box_panel:w()
		})

		self._weapon_info_panel:set_h(info_box_panel:h() - self._btn_panel:h() - 8 - self._detection_panel:h() - 8)
		self._detection_panel:set_top(self._weapon_info_panel:bottom() + 8)
		self._btn_panel:set_top(self._detection_panel:bottom() + 8)

		self._weapon_info_border = BoxGuiObject:new(self._weapon_info_panel, {
			sides = {
				1,
				1,
				1,
				1
			}
		})
		self._detection_border = BoxGuiObject:new(self._detection_panel, {
			sides = {
				1,
				1,
				1,
				1
			}
		})
		self._button_border = BoxGuiObject:new(self._btn_panel, {
			sides = {
				1,
				1,
				1,
				1
			}
		})

		if self._data.use_bgs then
			BlackMarketGui.blur_panel(self._weapon_info_panel)
			BlackMarketGui.blur_panel(self._detection_panel)
			BlackMarketGui.blur_panel(self._btn_panel)

			if alive(self._extra_options_panel) then
				BlackMarketGui.blur_panel(self._extra_options_panel)
			end
		end

		if (self._data.search_box_callback_name or self._data.search_box_disconnect_callback_name) and managers.menu:is_pc_controller() then
			self._searchbox = SearchBoxGuiObject:new(self._panel, self._ws, self._saved_search)

			self._searchbox.panel:set_right(self._box_panel:right())
			self._searchbox.panel:set_top(self._box_panel:bottom() + 5)
			self._searchbox:register_list({})

			if self._data.search_box_callback_name then
				self._searchbox:register_callback(callback(self, self, self._data.search_box_callback_name))
			end

			if self._data.search_box_disconnect_callback_name then
				self._searchbox:register_disconnect_callback(callback(self, self, self._data.search_box_disconnect_callback_name))
			end
		end

		local scale = 0.75
		local detection_ring_left_bg = self._detection_panel:bitmap({
			alpha = 0.2,
			blend_mode = "add",
			h = 64,
			layer = 1,
			name = "detection_left_bg",
			texture = "guis/textures/pd2/blackmarket/inv_detection_meter",
			w = 64,
			x = 8
		})
		local detection_ring_right_bg = self._detection_panel:bitmap({
			alpha = 0.2,
			blend_mode = "add",
			h = 64,
			layer = 1,
			name = "detection_right_bg",
			texture = "guis/textures/pd2/blackmarket/inv_detection_meter",
			w = 64,
			x = 8
		})

		detection_ring_left_bg:set_size(detection_ring_left_bg:w() * scale, detection_ring_left_bg:h() * scale)
		detection_ring_right_bg:set_size(detection_ring_right_bg:w() * scale, detection_ring_right_bg:h() * scale)
		detection_ring_right_bg:set_texture_rect(64, 0, -64, 64)
		detection_ring_left_bg:set_center_y(self._detection_panel:h() / 2)
		detection_ring_right_bg:set_center_y(self._detection_panel:h() / 2)

		local detection_ring_left = self._detection_panel:bitmap({
			blend_mode = "add",
			h = 64,
			layer = 1,
			name = "detection_left",
			render_template = "VertexColorTexturedRadial",
			texture = "guis/textures/pd2/blackmarket/inv_detection_meter",
			w = 64,
			x = 8
		})
		local detection_ring_right = self._detection_panel:bitmap({
			blend_mode = "add",
			h = 64,
			layer = 1,
			name = "detection_right",
			render_template = "VertexColorTexturedRadial",
			texture = "guis/textures/pd2/blackmarket/inv_detection_meter",
			w = 64,
			x = 8
		})

		detection_ring_left:set_size(detection_ring_left:w() * scale, detection_ring_left:h() * scale)
		detection_ring_right:set_size(detection_ring_right:w() * scale, detection_ring_right:h() * scale)
		detection_ring_right:set_texture_rect(64, 0, -64, 64)
		detection_ring_left:set_center_y(self._detection_panel:h() / 2)
		detection_ring_right:set_center_y(self._detection_panel:h() / 2)

		local detection_value = self._detection_panel:text({
			blend_mode = "add",
			layer = 1,
			name = "detection_value",
			font_size = medium_font_size,
			font = medium_font,
			color = tweak_data.screen_colors.text
		})

		detection_value:set_x(detection_ring_left_bg:x() + detection_ring_left_bg:w() / 2 - medium_font_size / 2 + 2)
		detection_value:set_y(detection_ring_left_bg:y() + detection_ring_left_bg:h() / 2 - medium_font_size / 2 + 2)

		local detection_text = self._detection_panel:text({
			blend_mode = "add",
			layer = 1,
			name = "detection_text",
			font_size = small_font_size,
			font = small_font,
			color = tweak_data.screen_colors.text,
			text = utf8.to_upper(managers.localization:text("bm_menu_stats_detection"))
		})

		detection_text:set_left(detection_ring_left:right() + 8)
		detection_text:set_y(detection_ring_left:y() + detection_ring_left_bg:h() / 2 - medium_font_size / 2 + 2)

		self._buttons = self._btn_panel:panel({
			y = 8
		})

		local btn_x = 10

		for btn, btn_data in pairs(BTNS) do
			local new_btn = BlackMarketGuiButtonItem:new(self._buttons, btn_data, btn_x)

			self._btns[btn] = new_btn
		end

		self._armor_info_panel = self._weapon_info_panel:panel({
			layer = 10,
			w = self._weapon_info_panel:w(),
			h = self._weapon_info_panel:h()
		})

		local armor_info_panel = self._armor_info_panel
		local armor_image = armor_info_panel:bitmap({
			blend_mode = "normal",
			h = 96,
			name = "armor_image",
			texture = "guis/textures/pd2/endscreen/exp_ring",
			w = 96,
			x = 10,
			y = 10
		})
		local armor_name = armor_info_panel:text({
			layer = 1,
			name = "armor_name_text",
			text = "Improved Combined Tactical Vest",
			word_wrap = true,
			wrap = true,
			y = 10,
			font_size = medium_font_size,
			font = medium_font,
			color = tweak_data.screen_colors.text,
			x = armor_image:right() + 10,
			w = armor_info_panel:w() - armor_image:right() - 20,
			h = medium_font_size * 2
		})
		local equip_text = armor_info_panel:text({
			layer = 1,
			name = "armor_equipped",
			font_size = small_font_size * 0.9,
			font = small_font,
			color = tweak_data.screen_colors.text,
			text = managers.localization:to_upper_text("bm_menu_equipped"),
			x = armor_image:right() + 10,
			y = armor_name:bottom(),
			w = armor_info_panel:w() - armor_image:right() - 20,
			h = small_font_size
		})

		self._info_texts = {}
		self._info_texts_panel = self._weapon_info_panel:panel({
			x = 10,
			y = 10,
			w = self._weapon_info_panel:w() - 20,
			h = self._weapon_info_panel:h() - 20 - real_small_font_size * 3
		})

		table.insert(self._info_texts, self._info_texts_panel:text({
			layer = 1,
			name = "info_text_1",
			text = "",
			font_size = medium_font_size,
			font = medium_font,
			color = tweak_data.screen_colors.text
		}))
		table.insert(self._info_texts, self._info_texts_panel:text({
			layer = 1,
			name = "info_text_2",
			text = "",
			word_wrap = true,
			wrap = true,
			font_size = small_font_size,
			font = small_font,
			color = tweak_data.screen_colors.text
		}))
		table.insert(self._info_texts, self._info_texts_panel:text({
			blend_mode = "add",
			layer = 1,
			name = "info_text_3",
			text = "",
			word_wrap = true,
			wrap = true,
			font_size = small_font_size,
			font = small_font,
			color = tweak_data.screen_colors.important_1
		}))
		table.insert(self._info_texts, self._info_texts_panel:text({
			layer = 1,
			name = "info_text_4",
			text = "",
			word_wrap = true,
			wrap = true,
			font_size = small_font_size,
			font = small_font,
			color = tweak_data.screen_colors.text
		}))
		table.insert(self._info_texts, self._info_texts_panel:text({
			layer = 1,
			name = "info_text_5",
			text = "",
			word_wrap = true,
			wrap = true,
			font_size = small_font_size,
			font = small_font,
			color = tweak_data.screen_colors.important_1
		}))

		self._info_texts_color = {}
		self._info_texts_bg = {}

		for i, info_text in ipairs(self._info_texts) do
			self._info_texts_color[i] = info_text:color()
			self._info_texts_bg[i] = self._info_texts_panel:rect({
				alpha = 0.2,
				layer = 0,
				visible = false,
				color = Color.black
			})

			self._info_texts_bg[i]:set_shape(info_text:shape())
		end

		local h = real_small_font_size
		local longest_text_w = 0

		if self._data.info_callback then
			self._info_panel = self._panel:panel({
				layer = 1,
				name = "info_panel",
				w = self._btn_panel:w()
			})

			local info_table = self._data.info_callback()

			for i, info in ipairs(info_table) do
				local info_name = info.name or ""
				local info_string = info.text or ""
				local info_color = info.color or tweak_data.screen_colors.text
				local category_text = self._info_panel:text({
					layer = 1,
					w = 0,
					name = "category_" .. tostring(i),
					y = (i - 1) * h,
					h = h,
					font_size = h,
					font = small_font,
					color = tweak_data.screen_colors.text,
					text = utf8.to_upper(managers.localization:text("bm_menu_" .. tostring(info_name)))
				})
				local status_text = self._info_panel:text({
					layer = 1,
					w = 0,
					name = "status_" .. tostring(i),
					y = (i - 1) * h,
					h = h,
					font_size = h,
					font = small_font,
					color = info_color,
					text = utf8.to_upper(managers.localization:text(info_string))
				})

				if info_string == "" then
					category_text:set_color(info_color)
				end

				local _, _, w, _ = category_text:text_rect()

				if longest_text_w < w then
					longest_text_w = w + 10
				end
			end

			for name, text in ipairs(self._info_panel:children()) do
				if string.split(text:name(), "_")[1] == "category" then
					text:set_w(longest_text_w)
					text:set_x(0)
				else
					local _, _, w, _ = text:text_rect()

					text:set_w(w)
					text:set_x(math.round(longest_text_w + 5))
				end
			end
		else
			self._stats_shown_old = {
				"damage",
				"spread",
				"spread_moving",
				"concealment",
				"suppression",
				"recoil"
			}
			self._comparision_bitmaps = {}
			for i, stat in ipairs(self._stats_shown_old) do
				local y = (i - 1) * h
				local stats_w = self._weapon_info_panel:w() / 2 - 16
				local text = self._weapon_info_panel:text({
					name = stat .. "_text",
					y = y,
					h = h,
					align = "right",
					vertical = "center",
					font_size = small_font_size,
					font = small_font,
					layer = 1,
					color = tweak_data.screen_colors.text,
					text = utf8.to_upper(managers.localization:text("bm_menu_" .. stat))
				})
				local bg = self._weapon_info_panel:rect({
					y = y,
					w = stats_w,
					h = h - 6,
					layer = 0,
					color = Color(0.25, 0, 0, 0),
					blend_mode = "normal"
				})
				local base = self._weapon_info_panel:rect({
					y = y,
					w = 0,
					h = h - 6,
					layer = 1,
					color = Color(1, 1, 1, 1),
					blend_mode = "normal"
				})
				local neg = self._weapon_info_panel:rect({
					y = y,
					w = 0,
					h = h - 6,
					layer = 2,
					color = Color(1, 0, 0, 0),
					blend_mode = "normal"
				})
				local pos = self._weapon_info_panel:rect({
					y = y,
					w = 0,
					h = h - 6,
					layer = 2,
					color = Color(1, 0.5, 0.5, 0.5),
					blend_mode = "normal"
				})
				local plus = self._weapon_info_panel:bitmap({
					y = y,
					w = 8,
					h = 8,
					layer = 3,
					texture = "guis/textures/pd2/blackmarket/stat_plusminus",
					texture_rect = {
						0,
						0,
						8,
						8
					}
				})
				local minus = self._weapon_info_panel:bitmap({
					y = y,
					w = 8,
					h = 8,
					layer = 3,
					texture = "guis/textures/pd2/blackmarket/stat_plusminus",
					texture_rect = {
						8,
						0,
						8,
						8
					}
				})
				local end_line = self._weapon_info_panel:rect({
					y = y,
					w = 2,
					h = h - 6,
					layer = 3,
					color = Color(1, 1, 1, 1),
					blend_mode = "normal"
				})
				local mid_line = self._weapon_info_panel:rect({
					y = y,
					w = 2,
					h = h - 6,
					layer = 3,
					color = Color(1, 1, 1, 1),
					blend_mode = "normal"
				})
				bg:set_right(self._weapon_info_panel:w() - 16)
				base:set_left(bg:left())
				neg:set_left(bg:left())
				pos:set_left(bg:left())
				text:set_right(bg:left() - 5)
				end_line:set_right(bg:right())
				local text_center_y = text:center_y()
				bg:set_center_y(text_center_y)
				base:set_center_y(text_center_y)
				neg:set_center_y(text_center_y)
				pos:set_center_y(text_center_y)
				mid_line:set_center_y(text_center_y)
				end_line:set_center_y(text_center_y)
				plus:set_center_y(text_center_y)
				minus:set_center_y(text_center_y)
				plus:set_left(math.round(bg:right() + 4))
				minus:set_left(plus:left())
				self._comparision_bitmaps[stat] = {}
				self._comparision_bitmaps[stat].bg = bg
				self._comparision_bitmaps[stat].base = base
				self._comparision_bitmaps[stat].neg = neg
				self._comparision_bitmaps[stat].pos = pos
				self._comparision_bitmaps[stat].mid_line = mid_line
				self._comparision_bitmaps[stat].plus_icon = plus
				self._comparision_bitmaps[stat].minus_icon = minus
			end
			-- self._comparision_panel:hide()
			self._stats_shown = {
				{
					name = "magazine",
					stat_name = "extra_ammo",
					round_value = true
				},
				{
					name = "totalammo",
					stat_name = "total_ammo_mod",
					round_value = true
				},
				{name = "fire_rate", round_value = true},
				{name = "damage"},
				{
					name = "spread",
					offset = true,
					revert = true,
					percent = true
				},
				{
					name = "recoil",
					offset = true,
					revert = true,
					percent = true
				},
				{
					name = "concealment",
					index = true
				},
				{
					name = "suppression",
					offset = true,
					percent = false
				}
			}
			table.insert(self._stats_shown, {name = "reload", inverted = true})
			self._stats_panel = self._weapon_info_panel:panel({
				layer = 1,
				x = 10,
				y = 58,
				w = self._weapon_info_panel:w() - 20,
				h = self._weapon_info_panel:h() - 30
			})

			local panel = self._stats_panel:panel({
				h = 20,
				layer = 1,
				w = self._stats_panel:w()
			})

			panel:rect({
				color = Color.black:with_alpha(0.5)
			})

			self._stats_titles = {}
			self._stats_titles.equip = self._stats_panel:text({
				layer = 2,
				x = 120,
				font_size = small_font_size,
				font = small_font,
				color = tweak_data.screen_colors.text
			})
			self._stats_titles.base = self._stats_panel:text({
				alpha = 0.75,
				layer = 2,
				x = 170,
				font_size = small_font_size,
				font = small_font,
				color = tweak_data.screen_colors.text,
				text = utf8.to_upper(managers.localization:text("bm_menu_stats_base"))
			})
			self._stats_titles.mod = self._stats_panel:text({
				alpha = 0.75,
				layer = 2,
				x = 215,
				font_size = small_font_size,
				font = small_font,
				color = tweak_data.screen_colors.stats_mods,
				text = utf8.to_upper(managers.localization:text("bm_menu_stats_mod"))
			})
			self._stats_titles.skill = self._stats_panel:text({
				alpha = 0.75,
				layer = 2,
				x = 260,
				font_size = small_font_size,
				font = small_font,
				color = tweak_data.screen_colors.resource,
				text = utf8.to_upper(managers.localization:text("bm_menu_stats_skill"))
			})
			self._stats_titles.total = self._stats_panel:text({
				layer = 2,
				x = 200,
				font_size = small_font_size,
				font = small_font,
				color = tweak_data.screen_colors.text,
				text = utf8.to_upper(managers.localization:text("bm_menu_chosen"))
			})

			local x = 0
			local y = 20
			local text_panel
			local text_columns = {
				{
					name = "name",
					size = 100
				},
				{
					align = "right",
					alpha = 0.75,
					blend = "add",
					name = "equip",
					size = 45
				},
				{
					align = "right",
					alpha = 0.75,
					blend = "add",
					name = "base",
					size = 45
				},
				{
					align = "right",
					alpha = 0.75,
					blend = "add",
					name = "mods",
					size = 45,
					color = tweak_data.screen_colors.stats_mods
				},
				{
					align = "right",
					alpha = 0.75,
					blend = "add",
					name = "removed",
					offset = -40,
					size = 45,
					color = tweak_data.screen_colors.important_1,
					font_size = tiny_font_size
				},
				{
					align = "right",
					alpha = 0.75,
					blend = "add",
					name = "skill",
					size = 45,
					color = tweak_data.screen_colors.resource
				},
				{
					align = "right",
					name = "total",
					size = 45
				}
			}

			self._stats_texts = {}
			self._rweapon_stats_panel = self._stats_panel:panel()

			for i, stat in ipairs(self._stats_shown) do
				panel = self._rweapon_stats_panel:panel({
					h = 20,
					layer = 1,
					name = "weapon_stats",
					x = 0,
					y = y,
					w = self._rweapon_stats_panel:w()
				})

				if math.mod(i, 2) == 0 and not panel:child(tostring(i)) then
					panel:rect({
						name = tostring(i),
						color = Color.black:with_alpha(0.3)
					})
				end

				x = 2
				y = y + 20
				self._stats_texts[stat.name] = {}

				for _, column in ipairs(text_columns) do
					text_panel = panel:panel({
						layer = 0,
						x = x + (column.offset or 0),
						w = column.size,
						h = panel:h()
					})
					self._stats_texts[stat.name][column.name] = text_panel:text({
						layer = 1,
						font_size = column.font_size or small_font_size,
						font = column.font or small_font,
						align = column.align,
						alpha = column.alpha,
						blend_mode = column.blend,
						color = column.color or tweak_data.screen_colors.text,
						y = panel:h() - (column.font_size or small_font_size)
					})
					x = x + column.size + (column.offset or 0)

					if column.name == "total" then
						text_panel:set_x(190)
					end
				end
			end

			self._armor_stats_shown = {
				{
					name = "armor"
				},
				{
					name = "health"
				},
				{
					index = true,
					name = "concealment"
				},
				{
					name = "movement"
				},
				{
					name = "dodge",
					revert = true
				},
				{
					name = "damage_shake"
				},
				{
					name = "stamina"
				}
			}

			do
				local x = 0
				local y = 20
				local text_panel

				self._armor_stats_texts = {}

				local text_columns = {
					{
						name = "name",
						size = 100
					},
					{
						align = "right",
						alpha = 0.75,
						blend = "add",
						name = "equip",
						size = 45
					},
					{
						align = "right",
						alpha = 0.75,
						blend = "add",
						name = "base",
						size = 60
					},
					{
						align = "right",
						alpha = 0.75,
						blend = "add",
						name = "skill",
						size = 60,
						color = tweak_data.screen_colors.resource
					},
					{
						align = "right",
						name = "total",
						size = 45
					}
				}

				self._armor_stats_panel = self._stats_panel:panel()

				for i, stat in ipairs(self._armor_stats_shown) do
					panel = self._armor_stats_panel:panel({
						h = 20,
						layer = 1,
						x = 0,
						y = y,
						w = self._armor_stats_panel:w()
					})

					if math.mod(i, 2) == 0 and not panel:child(tostring(i)) then
						panel:rect({
							name = tostring(i),
							color = Color.black:with_alpha(0.3)
						})
					end

					x = 2
					y = y + 20
					self._armor_stats_texts[stat.name] = {}

					for _, column in ipairs(text_columns) do
						text_panel = panel:panel({
							layer = 0,
							x = x,
							w = column.size,
							h = panel:h()
						})
						self._armor_stats_texts[stat.name][column.name] = text_panel:text({
							layer = 1,
							font_size = small_font_size,
							font = small_font,
							align = column.align,
							alpha = column.alpha,
							blend_mode = column.blend,
							color = column.color or tweak_data.screen_colors.text
						})
						x = x + column.size

						if column.name == "total" then
							text_panel:set_x(190)
						end
					end
				end
			end

			self._mweapon_stats_shown = {
				{
					name = "damage",
					range = true
				},
				{
					multiple_of = "damage",
					name = "damage_effect",
					range = true
				},
				{
					inverse = true,
					name = "charge_time",
					num_decimals = 1,
					suffix = managers.localization:text("menu_seconds_suffix_short")
				},
				{
					name = "range",
					range = true
				},
				{
					index = true,
					name = "concealment"
				}
			}

			do
				local x = 0
				local y = 20
				local text_panel

				self._mweapon_stats_texts = {}

				local text_columns = {
					{
						name = "name",
						size = 100
					},
					{
						align = "right",
						alpha = 0.75,
						blend = "add",
						name = "equip",
						size = 55
					},
					{
						align = "right",
						alpha = 0.75,
						blend = "add",
						name = "base",
						size = 60
					},
					{
						align = "right",
						alpha = 0.75,
						blend = "add",
						name = "skill",
						size = 65,
						color = tweak_data.screen_colors.resource
					},
					{
						align = "right",
						name = "total",
						size = 55
					}
				}

				self._mweapon_stats_panel = self._stats_panel:panel()

				for i, stat in ipairs(self._mweapon_stats_shown) do
					panel = self._mweapon_stats_panel:panel({
						h = 20,
						layer = 1,
						x = 0,
						y = y,
						w = self._mweapon_stats_panel:w()
					})

					if math.mod(i, 2) == 0 and not panel:child(tostring(i)) then
						panel:rect({
							name = tostring(i),
							color = Color.black:with_alpha(0.3)
						})
					end

					x = 2
					y = y + 20
					self._mweapon_stats_texts[stat.name] = {}

					for _, column in ipairs(text_columns) do
						text_panel = panel:panel({
							layer = 0,
							x = x,
							w = column.size,
							h = panel:h()
						})
						self._mweapon_stats_texts[stat.name][column.name] = text_panel:text({
							layer = 1,
							font_size = small_font_size,
							font = small_font,
							align = column.align,
							alpha = column.alpha,
							blend_mode = column.blend,
							color = column.color or tweak_data.screen_colors.text
						})
						x = x + column.size

						if column.name == "total" then
							text_panel:set_x(190)
						end
					end
				end
			end

			self._throwable_stats_shown = {
				{
					name = "damage",
					range = true
				},
				{
					name = "range",
					range = true
				},
				{
					inverse = true,
					name = "cooldown",
					num_decimals = 1,
					suffix = managers.localization:text("menu_seconds_suffix_short")
				},
				{
					index = true,
					name = "amount"
				}
			}

			do
				local x = 0
				local y = 20
				local text_panel

				self._throwable_stats_texts = {}

				local text_columns = {
					{
						name = "name",
						size = 100
					},
					{
						align = "right",
						alpha = 0.75,
						blend = "add",
						name = "equip",
						size = 55
					},
					{
						align = "right",
						alpha = 0.75,
						blend = "add",
						name = "base",
						size = 60
					},
					{
						align = "right",
						alpha = 0.75,
						blend = "add",
						name = "skill",
						size = 65,
						color = tweak_data.screen_colors.resource
					},
					{
						align = "right",
						name = "total",
						size = 55
					}
				}

				self._throwable_stats_panel = self._stats_panel:panel({
					visible = false
				})

				for i, stat in ipairs(self._throwable_stats_shown) do
					panel = self._throwable_stats_panel:panel({
						h = 20,
						layer = 1,
						name = stat.name,
						y = y,
						w = self._throwable_stats_panel:w()
					})

					if math.mod(i, 2) == 0 and not panel:child(tostring(i)) then
						panel:rect({
							name = tostring(i),
							color = Color.black:with_alpha(0.3)
						})
					end

					x = 2
					y = y + 20
					self._throwable_stats_texts[stat.name] = {}

					for _, column in ipairs(text_columns) do
						text_panel = panel:panel({
							layer = 0,
							x = x,
							w = column.size,
							h = panel:h()
						})
						self._throwable_stats_texts[stat.name][column.name] = text_panel:text({
							layer = 1,
							rotation = 360,
							font_size = small_font_size,
							font = small_font,
							align = column.align,
							alpha = column.alpha,
							blend_mode = column.blend,
							color = column.color or tweak_data.screen_colors.text
						})
						x = x + column.size

						if column.name == "total" then
							text_panel:set_x(190)
						end
					end
				end
			end

			panel = self._stats_panel:panel({
				layer = 0,
				name = "modslist_panel",
				y = y + 20,
				w = self._stats_panel:w(),
				h = self._stats_panel:h()
			})
			self._stats_text_modslist = panel:text({
				layer = 1,
				word_wrap = true,
				wrap = true,
				font_size = small_font_size,
				font = small_font,
				color = tweak_data.screen_colors.text
			})
		end

		if self._info_panel then
			self._info_panel:set_size(info_box_panel:w() - 20, self._info_panel:num_children() / 2 * h)
			self._info_panel:set_rightbottom(self._panel:w() - 10, self._btn_panel:top() - 10)
		end

		local tab_x = 0

		if (not managers.menu:is_pc_controller() or managers.menu:is_steam_controller()) and #self._tabs > 1 then
			local button = managers.menu:is_steam_controller() and managers.localization:steam_btn("bumper_l") or managers.localization:get_default_macro("BTN_BOTTOM_L")
			local prev_page = self._panel:text({
				layer = 2,
				name = "prev_page",
				y = 0,
				font_size = medium_font_size,
				font = medium_font,
				color = tweak_data.screen_colors.text,
				text = button
			})
			local _, _, w, h = prev_page:text_rect()

			prev_page:set_size(w, h)
			prev_page:set_top(top_padding)
			prev_page:set_left(tab_x)
			prev_page:set_visible(self._selected > 1)
			self._tab_scroll_panel:move(w + 15, 0)
			self._tab_scroll_panel:grow(-(w + 15), 0)
		end

		for _, tab in ipairs(self._tabs) do
			tab_x = tab:set_tab_position(tab_x)
		end

		if (not managers.menu:is_pc_controller() or managers.menu:is_steam_controller()) and #self._tabs > 1 then
			local button = managers.menu:is_steam_controller() and managers.localization:steam_btn("bumper_r") or managers.localization:get_default_macro("BTN_BOTTOM_R")
			local next_page = self._panel:text({
				layer = 2,
				name = "next_page",
				y = 0,
				font_size = medium_font_size,
				font = medium_font,
				color = tweak_data.screen_colors.text,
				text = button
			})
			local _, _, w, h = next_page:text_rect()

			next_page:set_size(w, h)
			next_page:set_top(top_padding)
			next_page:set_right(grid_panel_w)
			next_page:set_visible(self._selected < #self._tabs)
			self._tab_scroll_panel:grow(-(w + 15), 0)
		end

		if managers.menu:is_pc_controller() and not managers.menu:is_steam_controller() and self._tab_scroll_table[#self._tab_scroll_table]:right() > self._tab_scroll_table.panel:w() then
			local prev_page = self._panel:text({
				align = "center",
				layer = 2,
				name = "prev_page",
				text = "<",
				w = 0,
				y = 0,
				font_size = medium_font_size,
				font = medium_font,
				color = tweak_data.screen_colors.button_stage_3
			})
			local _, _, w, h = prev_page:text_rect()

			prev_page:set_size(w, h)
			prev_page:set_top(top_padding)
			prev_page:set_left(0)
			prev_page:set_text(" ")
			self._tab_scroll_panel:move(w + 15, 0)
			self._tab_scroll_panel:grow(-(w + 15), 0)

			local next_page = self._panel:text({
				align = "center",
				layer = 2,
				name = "next_page",
				text = ">",
				w = 0,
				y = 0,
				font_size = medium_font_size,
				font = medium_font,
				color = tweak_data.screen_colors.button_stage_3
			})
			local _, _, w, h = next_page:text_rect()

			next_page:set_size(w, h)
			next_page:set_top(top_padding)
			next_page:set_right(grid_panel_w)

			self._tab_scroll_table.left = prev_page
			self._tab_scroll_table.right = next_page
			self._tab_scroll_table.left_klick = false
			self._tab_scroll_table.right_klick = true

			if self._selected > 1 then
				self._tab_scroll_table.left_klick = true

				self._tab_scroll_table.left:set_text("<")
			else
				self._tab_scroll_table.left_klick = false

				self._tab_scroll_table.left:set_text(" ")
			end

			if self._selected < #self._tab_scroll_table then
				self._tab_scroll_table.right_klick = true

				self._tab_scroll_table.right:set_text(">")
			else
				self._tab_scroll_table.right_klick = false

				self._tab_scroll_table.right:set_text(" ")
			end

			self._tab_scroll_panel:grow(-(w + 15), 0)
		end
	else
		self._select_rect:hide()
	end

	if MenuBackdropGUI then
		local bg_text = self._fullscreen_panel:text({
			align = "left",
			alpha = 0.4,
			h = 90,
			vertical = "top",
			text = self._title_text:text(),
			font_size = massive_font_size,
			font = massive_font,
			color = tweak_data.screen_colors.button_stage_3
		})
		local x, y = managers.gui_data:safe_to_full_16_9(self._title_text:world_x(), self._title_text:world_center_y())

		bg_text:set_world_left(x)
		bg_text:set_world_center_y(y)
		bg_text:move(-13, 9)
		MenuBackdropGUI.animate_bg_text(self, bg_text)

		if managers.menu:is_pc_controller() then
			local bg_back = self._fullscreen_panel:text({
				align = "right",
				alpha = 0.4,
				h = 90,
				layer = 0,
				name = "back_button",
				vertical = "bottom",
				text = utf8.to_upper(managers.localization:text("menu_back")),
				font_size = massive_font_size,
				font = massive_font,
				color = tweak_data.screen_colors.button_stage_3
			})
			local x, y = managers.gui_data:safe_to_full_16_9(self._panel:child("back_button"):world_right(), self._panel:child("back_button"):world_center_y())

			bg_back:set_world_right(x)
			bg_back:set_world_center_y(y)
			bg_back:move(13, -9)
			MenuBackdropGUI.animate_bg_text(self, bg_back)
		end
	end

	if self._selected_slot then
		self:on_slot_selected(self._selected_slot)
	end

	if not self._data.skip_blur then
		local black_rect = self._fullscreen_panel:rect({
			layer = 1,
			color = Color(0.4, 0, 0, 0)
		})
	end

	if is_start_page then
		-- Nothing
	end

	if self._data.create_steam_inventory_extra then
		self._indicator_alpha = self._indicator_alpha or managers.network.account:inventory_is_loading() and 1 or 0
		self._indicator = self._panel:bitmap({
			layer = 1,
			name = "indicator",
			texture = "guis/textures/icon_loading",
			alpha = self._indicator_alpha
		})

		self._indicator:set_left(self._title_text:right() + 10)
		self._indicator:set_center_y(self._title_text:center_y())
		self._indicator:animate(function(o)
			local dt

			while true do
				dt = coroutine.yield()

				self._indicator:rotate(180 * dt)

				self._indicator_alpha = math.lerp(self._indicator_alpha, managers.network.account:inventory_is_loading() and 1 or 0, 15 * dt)

				self._indicator:set_alpha(self._indicator_alpha)
			end
		end)

		local info_box_panel = self._panel:child("info_box_panel")

		self._steam_inventory_extra_panel = self._panel:panel({
			h = top_padding
		})

		self._steam_inventory_extra_panel:set_width(info_box_panel:width())
		self._steam_inventory_extra_panel:set_top(info_box_panel:bottom() + 5)
		self._steam_inventory_extra_panel:set_world_right(self._tabs[self._selected]._grid_panel:world_right())

		self._steam_inventory_extra_data = {}

		local extra_data = self._steam_inventory_extra_data

		extra_data.choices = {}

		for _, name in ipairs(tweak_data.gui.tradable_inventory_sort_list) do
			table.insert(extra_data.choices, managers.localization:to_upper_text("bm_menu_ti_sort_option", {
				sort = managers.localization:text("bm_menu_ti_" .. name)
			}))
		end

		local gui_panel = self._steam_inventory_extra_panel:panel({
			h = medium_font_size + 5
		})

		extra_data.bg = gui_panel:rect({
			alpha = 0.5,
			color = Color.black:with_alpha(0.5)
		})

		BoxGuiObject:new(gui_panel, {
			sides = {
				1,
				1,
				1,
				1
			}
		})

		local choice_panel = gui_panel:panel({
			layer = 1
		})
		local choice_text = choice_panel:text({
			align = "center",
			blend_mode = "add",
			halign = "center",
			layer = 1,
			valign = "center",
			vertical = "center",
			x = 0,
			y = 0,
			font_size = small_font_size,
			font = small_font,
			color = tweak_data.screen_colors.button_stage_2,
			text = extra_data.choices[Global.blackmarket_manager.tradable_inventory_sort or 1],
			render_template = Idstring("VertexColorTextured")
		})
		local arrow_left, arrow_right

		if managers.menu:is_pc_controller() and not managers.menu:is_steam_controller() then
			local texture, rect = tweak_data.hud_icons:get_icon_data("scrollbar_arrow")

			arrow_left = gui_panel:bitmap({
				blend_mode = "add",
				layer = 1,
				texture = "guis/textures/menu_arrows",
				visible = true,
				texture_rect = {
					24,
					0,
					24,
					24
				},
				color = tweak_data.screen_colors.button_stage_3
			})
			arrow_right = gui_panel:bitmap({
				blend_mode = "add",
				layer = 1,
				rotation = 180,
				texture = "guis/textures/menu_arrows",
				visible = true,
				texture_rect = {
					24,
					0,
					24,
					24
				},
				color = tweak_data.screen_colors.button_stage_3
			})
		else
			local BTN_TOP_L = managers.menu:is_steam_controller() and managers.localization:steam_btn("trigger_l") or managers.localization:get_default_macro("BTN_TOP_L")
			local BTN_TOP_R = managers.menu:is_steam_controller() and managers.localization:steam_btn("trigger_r") or managers.localization:get_default_macro("BTN_TOP_R")

			arrow_left = gui_panel:text({
				blend_mode = "add",
				layer = 1,
				text = BTN_TOP_L,
				color = managers.menu:is_steam_controller() and tweak_data.screen_colors.button_stage_3,
				font = small_font,
				font_size = small_font_size
			})
			arrow_right = gui_panel:text({
				blend_mode = "add",
				layer = 1,
				text = BTN_TOP_R,
				color = managers.menu:is_steam_controller() and tweak_data.screen_colors.button_stage_3,
				font = small_font,
				font_size = small_font_size
			})

			self:make_fine_text(arrow_left)
			self:make_fine_text(arrow_right)
		end

		arrow_left:set_left(5)
		arrow_left:set_center_y(gui_panel:h() / 2)
		arrow_right:set_right(gui_panel:w() - 5)
		arrow_right:set_center_y(gui_panel:h() / 2)

		extra_data.gui_panel = gui_panel
		extra_data.arrow_left = arrow_left
		extra_data.arrow_right = arrow_right
		extra_data.choice_text = choice_text
		extra_data.arrow_left_highlighted = false
		extra_data.arrow_right_highlighted = false
	end

	self:set_tab_positions()
	self:_round_everything()

	self._in_setup = nil
end

function BlackMarketGui:populate_masks(data)
	local new_data = {}
	local crafted_category = managers.blackmarket:get_crafted_category("masks") or {}
	local mini_icon_helper = math.round((self._panel:h() - (tweak_data.menu.pd2_medium_font_size + 10) - 70) * GRID_H_MUL / 3) - 16
	for i = 1, 9 do
		data[i] = nil
	end
	local index = 0
	local guis_catalog = "guis/"
	for i, crafted in pairs(crafted_category) do
		local guis_mask_id = crafted.mask_id
		if tweak_data.blackmarket.masks[guis_mask_id].guis_id then
			guis_mask_id = tweak_data.blackmarket.masks[guis_mask_id].guis_id
		end
		guis_catalog = "guis/"
		local bundle_folder = tweak_data.blackmarket.masks[guis_mask_id] and tweak_data.blackmarket.masks[guis_mask_id].texture_bundle_folder
		if bundle_folder then
			guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
		end

		new_data = {}
		new_data.name = crafted.mask_id
		new_data.name_localized = managers.localization:text(tweak_data.blackmarket.masks[new_data.name].name_id)
		new_data.category = "masks"
		new_data.global_value = crafted.global_value
		new_data.slot = i
		new_data.unlocked = true
		new_data.equipped = crafted.equipped
		new_data.bitmap_texture = guis_catalog .. "textures/pd2/blackmarket/icons/masks/" .. guis_mask_id
		new_data.stream = false
		local is_locked = tweak_data.lootdrop.global_values[new_data.global_value] and tweak_data.lootdrop.global_values[new_data.global_value].dlc and not tweak_data.dlc[new_data.global_value].free and not managers.dlc:has_dlc(new_data.global_value)
		if not is_locked then
			for _, part in pairs(crafted.blueprint) do
				is_locked = tweak_data.lootdrop.global_values[part.global_value] and tweak_data.lootdrop.global_values[part.global_value].dlc and not tweak_data.dlc[part.global_value].free and not managers.dlc:has_dlc(part.global_value)
				if is_locked then
					break
				end
			end
		end
		if is_locked then
			new_data.unlocked = false
			new_data.lock_texture = "guis/textures/pd2/lock_skill"
			new_data.dlc_locked = "bm_menu_dlc_locked"
		end
		if new_data.unlocked then
			if not new_data.equipped then
				table.insert(new_data, "m_equip")
			end
			if not crafted.modded and managers.blackmarket:can_modify_mask(i) and i ~= 1 then
				table.insert(new_data, "m_mod")
			end
			if i ~= 1 then
				table.insert(new_data, "m_preview")
			end
		end
		if i ~= 1 then
			table.insert(new_data, "m_sell")
		end
		if crafted.modded then
			new_data.mini_icons = {}
			local color_1 = tweak_data.blackmarket.colors[crafted.blueprint.color.id].colors[1]
			local color_2 = tweak_data.blackmarket.colors[crafted.blueprint.color.id].colors[2]
			table.insert(new_data.mini_icons, {
				texture = false,
				w = 16,
				h = 16,
				right = 0,
				bottom = 0,
				layer = 1,
				color = color_2
			})
			table.insert(new_data.mini_icons, {
				texture = false,
				w = 16,
				h = 16,
				right = 18,
				bottom = 0,
				layer = 1,
				color = color_1
			})
			local pattern = crafted.blueprint.pattern.id
			if pattern == "solidfirst" or pattern == "solidsecond" then
			else
				table.insert(new_data.mini_icons, {
					texture = "guis/textures/pd2/blackmarket/icons/materials/" .. crafted.blueprint.material.id,
					right = -3,
					bottom = 38 - (NOT_WIN_32 and 20 or 10),
					w = 42,
					h = 42,
					layer = 1,
					stream = true
				})
			end
			table.insert(new_data.mini_icons, {
				texture = tweak_data.blackmarket.textures[pattern].texture,
				right = -3,
				bottom = math.round(mini_icon_helper - 6 - 6 - 42),
				w = 42,
				h = 42,
				layer = 1,
				stream = true,
				render_template = Idstring("VertexColorTexturedPatterns")
			})
			new_data.mini_icons.borders = true
		elseif i ~= 1 and managers.blackmarket:can_modify_mask(i) and managers.blackmarket:got_new_drop("normal", "mask_mods", crafted.mask_id) then
			new_data.mini_icons = new_data.mini_icons or {}
			table.insert(new_data.mini_icons, {
				name = "new_drop",
				texture = "guis/textures/pd2/blackmarket/inv_newdrop",
				left = 0,
				top = 0,
				layer = 1,
				w = 16,
				h = 16,
				stream = false,
				visible = true
			})
			new_data.new_drop_data = {}
		end
		data[i] = new_data
		index = i
	end
	local can_buy_masks = 0 < #managers.blackmarket:get_inventory_masks()
	for i = 1, 9 do
		if not data[i] then
			new_data = {}
			new_data.name = "bm_menu_btn_buy_new_mask"
			new_data.name_localized = managers.localization:text("bm_menu_empty_mask_slot")
			new_data.mid_text = {}
			new_data.mid_text.selected_text = can_buy_masks and managers.localization:text("bm_menu_btn_buy_new_mask") or managers.localization:text("bm_menu_empty_mask_slot")
			new_data.mid_text.selected_color = tweak_data.screen_colors.button_stage_2
			new_data.mid_text.noselected_text = new_data.name_localized
			new_data.mid_text.noselected_color = tweak_data.screen_colors.button_stage_3
			new_data.empty_slot = true
			new_data.category = "masks"
			new_data.slot = i
			new_data.unlocked = true
			new_data.equipped = false
			new_data.num_backs = 0
			new_data.cannot_buy = not can_buy_masks
			if can_buy_masks then
				table.insert(new_data, "em_buy")
				if i ~= 1 and managers.blackmarket:got_new_drop(nil, "mask_buy", nil) then
					new_data.mini_icons = new_data.mini_icons or {}
					table.insert(new_data.mini_icons, {
						name = "new_drop",
						texture = "guis/textures/pd2/blackmarket/inv_newdrop",
						left = 0,
						top = 0,
						layer = 1,
						w = 16,
						h = 16,
						stream = false,
						visible = false
					})
					new_data.new_drop_data = {}
				end
			end
			data[i] = new_data
		end
	end
end

function BlackMarketGui:_start_page_data()
	local data = {}
	table.insert(data, {
		name = "bm_menu_primaries",
		category = "primaries",
		on_create_func_name = "populate_primaries",
		override_slots = {3, 3},
		identifier = self.identifiers.weapon
	})
	table.insert(data, {
		name = "bm_menu_secondaries",
		category = "secondaries",
		on_create_func_name = "populate_secondaries",
		override_slots = {3, 3},
		identifier = self.identifiers.weapon
	})
	table.insert(data, {
		name = "bm_menu_armors",
		category = "armors",
		on_create_func_name = "populate_armors",
		override_slots = {4, 2},
		identifier = self.identifiers.armor
	})
	table.insert(data, {
		name = "bm_menu_deployables",
		category = "deployables",
		on_create_func_name = "populate_deployables",
		override_slots = {3, 3},
		identifier = Idstring("deployable")
	})
	table.insert(data, {
		name = "bm_menu_masks",
		category = "masks",
		on_create_func_name = "populate_masks",
		identifier = self.identifiers.mask
	})
	if not managers.network:session() then
		table.insert(data, {
			name = "bm_menu_characters",
			category = "characters",
			on_create_func_name = "populate_characters",
			override_slots = {2, 2},
			identifier = self.identifiers.character
		})
	end
	data.topic_id = "menu_inventory"
	self:_cleanup_blackmarket()
	return data
end