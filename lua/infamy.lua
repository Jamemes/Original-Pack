if string.lower(RequiredScript) == "lib/tweak_data/infamytweakdata" then
	local data = InfamyTweakData.init
	function InfamyTweakData:init(tweak_data)
		data(self, tweak_data)
		local function digest(value)
			return Application:digest_value(value, true)
		end
		local cost_root = digest(150000000)
		local cost_first_tier = digest(200000000)
		local cost_second_tier = digest(300000000)
		local cost_third_tier = digest(400000000)
		local cost_ace = digest(500000000)
		self.ranks = {
			cost_root,
			cost_first_tier,
			cost_first_tier,
			cost_first_tier,
			cost_first_tier,
			cost_second_tier,
			cost_second_tier,
			cost_second_tier,
			cost_second_tier,
			cost_third_tier,
			cost_third_tier,
			cost_third_tier,
			cost_third_tier,
			cost_ace
		}
		
		self.tree = {
			"infamy_maskpack_destroyer",
			"infamy_xp_medium_1",
			"infamy_xp_medium_2",
			"infamy_xp_medium_3",
			"infamy_maskpack_pain",
			"infamy_xp_medium_4",
			"infamy_maskpack_balaclava",
			"infamy_mastermind",
			"infamy_maskpack_hood",
			"infamy_xp_medium_5",
			"infamy_xp_medium_6",
			"infamy_ghost",
			"infamy_root",
			"infamy_enforcer",
			"infamy_xp_medium_7",
			"infamy_xp_medium_8",
			"infamy_maskpack_daft",
			"infamy_technician",
			"infamy_maskpack_ranger",
			"infamy_xp_medium_9",
			"infamy_maskpack_lurker",
			"infamy_xp_medium_10",
			"infamy_xp_medium_11",
			"infamy_xp_medium_12",
			"infamy_maskpack_punk"
		}
		self.items.infamy_mastermind.desc_params.xpboost = "1%"
		self.items.infamy_enforcer.desc_params.xpboost = "1%"
		self.items.infamy_technician.desc_params.xpboost = "1%"
		self.items.infamy_ghost.desc_params.xpboost = "1%"
		self.items.infamy_mastermind.upgrades.infamous_xp = 1.01
		self.items.infamy_enforcer.upgrades.infamous_xp = 1.01
		self.items.infamy_technician.upgrades.infamous_xp = 1.01
		self.items.infamy_ghost.upgrades.infamous_xp = 1.01
		
		self.items.infamy_maskpack_destroyer.desc_params.xpboost = "3.5%"
		self.items.infamy_maskpack_pain.desc_params.xpboost = "3.5%"
		self.items.infamy_maskpack_balaclava.desc_params.xpboost = "3.5%"
		self.items.infamy_maskpack_hood.desc_params.xpboost = "3.5%"
		self.items.infamy_maskpack_daft.desc_params.xpboost = "3.5%"
		self.items.infamy_maskpack_ranger.desc_params.xpboost = "3.5%"
		self.items.infamy_maskpack_lurker.desc_params.xpboost = "3.5%"
		self.items.infamy_maskpack_punk.desc_params.xpboost = "3.5%"
		self.items.infamy_maskpack_destroyer.upgrades.infamous_xp = 1.035
		self.items.infamy_maskpack_pain.upgrades.infamous_xp = 1.035
		self.items.infamy_maskpack_balaclava.upgrades.infamous_xp = 1.035
		self.items.infamy_maskpack_hood.upgrades.infamous_xp = 1.035
		self.items.infamy_maskpack_daft.upgrades.infamous_xp = 1.035
		self.items.infamy_maskpack_ranger.upgrades.infamous_xp = 1.035
		self.items.infamy_maskpack_lurker.upgrades.infamous_xp = 1.035
		self.items.infamy_maskpack_punk.upgrades.infamous_xp = 1.035
		
		self.items.infamy_xp_medium_1.desc_params.xpboost = "5%"
		self.items.infamy_xp_medium_2.desc_params.xpboost = "5%"
		self.items.infamy_xp_medium_3.desc_params.xpboost = "5%"
		self.items.infamy_xp_medium_4.desc_params.xpboost = "5%"
		self.items.infamy_xp_medium_5.desc_params.xpboost = "5%"
		self.items.infamy_xp_medium_6.desc_params.xpboost = "5%"
		self.items.infamy_xp_medium_7.desc_params.xpboost = "5%"
		self.items.infamy_xp_medium_8.desc_params.xpboost = "5%"
		self.items.infamy_xp_medium_9.desc_params.xpboost = "5%"
		self.items.infamy_xp_medium_10.desc_params.xpboost = "5%"
		self.items.infamy_xp_medium_11.desc_params.xpboost = "5%"
		self.items.infamy_xp_medium_12.desc_params.xpboost = "5%"
		self.items.infamy_xp_medium_1.upgrades.infamous_xp = 1.05
		self.items.infamy_xp_medium_2.upgrades.infamous_xp = 1.05
		self.items.infamy_xp_medium_3.upgrades.infamous_xp = 1.05
		self.items.infamy_xp_medium_4.upgrades.infamous_xp = 1.05
		self.items.infamy_xp_medium_5.upgrades.infamous_xp = 1.05
		self.items.infamy_xp_medium_6.upgrades.infamous_xp = 1.05
		self.items.infamy_xp_medium_7.upgrades.infamous_xp = 1.05
		self.items.infamy_xp_medium_8.upgrades.infamous_xp = 1.05
		self.items.infamy_xp_medium_9.upgrades.infamous_xp = 1.05
		self.items.infamy_xp_medium_10.upgrades.infamous_xp = 1.05
		self.items.infamy_xp_medium_11.upgrades.infamous_xp = 1.05
		self.items.infamy_xp_medium_12.upgrades.infamous_xp = 1.05
	end
end
if string.lower(RequiredScript) == "lib/managers/menu/infamytreegui" then
	local is_win_32 = SystemInfo:platform() == Idstring("WIN32")
	local WIDTH_MULTIPLIER = is_win_32 and 0.65 or 0.5

	function InfamyTreeGui:_setup()
		if alive(self._panel) then
			self._ws:panel():remove(self._panel)
		end

		self._panel = self._ws:panel():panel({
			valign = "center",
			visible = true,
			layer = self._init_layer
		})
		self._fullscreen_panel = self._fullscreen_ws:panel():panel()
		self._requested_textures = {}

		WalletGuiObject.set_wallet(self._panel)

		local title_text = self._panel:text({
			vertical = "top",
			name = "infamytree_text",
			align = "left",
			text = utf8.to_upper(managers.localization:text("menu_infamytree")),
			h = tweak_data.menu.pd2_large_font_size,
			font_size = tweak_data.menu.pd2_large_font_size,
			font = tweak_data.menu.pd2_large_font,
			color = tweak_data.screen_colors.text
		})
		local title_bg_text = self._fullscreen_panel:text({
			name = "infamytree_text",
			vertical = "top",
			h = 90,
			alpha = 0.4,
			align = "left",
			blend_mode = "add",
			layer = 1,
			text = utf8.to_upper(managers.localization:text("menu_infamytree")),
			font_size = tweak_data.menu.pd2_massive_font_size,
			font = tweak_data.menu.pd2_massive_font,
			color = tweak_data.screen_colors.button_stage_3
		})
		local x, y = managers.gui_data:safe_to_full_16_9(title_text:world_x(), title_text:world_center_y())

		title_bg_text:set_world_left(x)
		title_bg_text:set_world_center_y(y)
		title_bg_text:move(-13, 9)
		MenuBackdropGUI.animate_bg_text(self, title_bg_text)

		self._tree_main_panel = self._panel:panel({})

		self._tree_main_panel:set_w(math.round(self._panel:w() * WIDTH_MULTIPLIER - 10))
		self._tree_main_panel:set_h(math.round(self._panel:h() - title_text:bottom() - 70 - 4))
		self._tree_main_panel:set_top(title_text:bottom() + 2)

		self._tree_panel = self._tree_main_panel:panel({
			name = "tree_panel"
		})
		local size = math.min(self._tree_main_panel:w(), self._tree_main_panel:h())

		BoxGuiObject:new(self._tree_panel, {
			sides = {
				0,
				0,
				0,
				0
			}
		})

		self._description_panel = self._panel:panel({
			name = "description_panel"
		})

		self._description_panel:set_w(math.round(self._panel:w() * (1 - WIDTH_MULTIPLIER)))
		self._description_panel:set_h(math.round(self._panel:h() - title_text:bottom() - 70 - 4))
		self._description_panel:set_top(title_text:bottom() + 2)
		self._description_panel:set_right(self._panel:w())
		self._description_panel:text({
			vertical = "top",
			name = "description_title",
			halign = "scale",
			wrap = true,
			align = "left",
			valign = "scale",
			word_wrap = true,
			text = "",
			y = 10,
			x = 10,
			layer = 1,
			font = tweak_data.menu.pd2_medium_font,
			font_size = tweak_data.menu.pd2_medium_font_size,
			color = tweak_data.screen_colors.text
		})
		self._description_panel:text({
			vertical = "top",
			name = "description_warning",
			halign = "scale",
			wrap = true,
			align = "left",
			valign = "scale",
			word_wrap = true,
			text = "",
			y = 10,
			x = 10,
			layer = 1,
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			color = tweak_data.screen_colors.important_1
		})
		self._description_panel:text({
			vertical = "top",
			name = "description_text",
			wrap = true,
			align = "left",
			valign = "scale",
			word_wrap = true,
			text = "",
			halign = "scale",
			y = 10,
			x = 10,
			layer = 1,
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			color = tweak_data.screen_colors.text,
			h = tweak_data.menu.pd2_small_font_size + 10
		})
		BoxGuiObject:new(self._description_panel, {
			sides = {
				1,
				1,
				1,
				1
			}
		})

		local tree_rows = tweak_data.infamy.tree_rows or 3
		local tree_cols = tweak_data.infamy.tree_cols or 3
		local item_width = self._tree_panel:w() / tree_cols
		local item_height = self._tree_panel:h() / tree_rows
		self._tree_items = {}
		local x = 0
		local y = 0
		local item = nil
		local fw = math.random(item_width)
		local fh = 0
		local fhs = {}

		for i = 1, tree_cols, 1 do
			fhs[i] = i
		end

		local c = 0
		local texture_rect_x, texture_rect_y = nil

		for count = 1, tree_rows * tree_cols, 1 do
			item = {
				panel = self._tree_panel:panel({
					x = x,
					y = y,
					w = item_width,
					h = item_height
				})
			}

			table.insert(self._tree_items, item)

			if c > 0 then
				item.neighbour_left = {}
				local connector = self._tree_panel:bitmap({
					blend_mode = "add",
					texture = "guis/dlcs/infamous/textures/pd2/infamous_tree/connector_df",
					h = 16,
					alpha = 0.5,
					wrap_mode = "wrap",
					w = item_width
				})

				connector:set_texture_coordinates(Vector3(0 + fw, 0, 0), Vector3(item_width + fw, 0, 0), Vector3(0 + fw, 16, 0), Vector3(item_width + fw, 16, 0))
				connector:set_right(item.panel:center_x())
				connector:set_center_y(item.panel:center_y())

				item.neighbour_left[1] = connector
				local connector = self._tree_panel:bitmap({
					blend_mode = "add",
					texture = "guis/dlcs/infamous/textures/pd2/infamous_tree/connector_df",
					h = 16,
					alpha = 0.5,
					wrap_mode = "wrap",
					w = item_width
				})

				connector:set_texture_coordinates(Vector3(0 - fw, 0, 0), Vector3(item_width - fw, 0, 0), Vector3(0 - fw, 16, 0), Vector3(item_width - fw, 16, 0))
				connector:set_right(item.panel:center_x())
				connector:set_center_y(item.panel:center_y())

				item.neighbour_left[2] = connector
				fw = fw + item_width
				item.fw = fw
			end

			if tree_cols < count then
				item.neighbour_top = {}
				fh = fhs[c + 1]
				local connector = self._tree_panel:bitmap({
					blend_mode = "add",
					texture = "guis/dlcs/infamous/textures/pd2/infamous_tree/connector_df",
					alpha = 0.5,
					w = 16,
					wrap_mode = "wrap",
					h = item_height
				})

				connector:set_texture_coordinates(Vector3(0 + fh, 16, 0), Vector3(0 + fh, 0, 0), Vector3(item_height + fh, 16, 0), Vector3(item_height + fh, 0, 0))
				connector:set_center_x(item.panel:center_x())
				connector:set_bottom(item.panel:center_y())

				item.neighbour_top[1] = connector
				local connector = self._tree_panel:bitmap({
					blend_mode = "add",
					texture = "guis/dlcs/infamous/textures/pd2/infamous_tree/connector_df",
					alpha = 0.5,
					w = 16,
					wrap_mode = "wrap",
					h = item_height
				})

				connector:set_texture_coordinates(Vector3(0 - fh, 16, 0), Vector3(0 - fh, 0, 0), Vector3(item_height - fh, 16, 0), Vector3(item_height - fh, 0, 0))
				connector:set_center_x(item.panel:center_x())
				connector:set_bottom(item.panel:center_y())

				item.neighbour_top[2] = connector
				item.fh = fh
				fhs[c + 1] = fhs[c + 1] + item_height
			end

			x = x + item_width
			c = c + 1

			if tree_cols <= c then
				c = 0
				x = 0
				y = y + item_height
				fw = math.random(item_width)
			end
		end

		x = self._tree_panel:w() / 2 - item_width / 2
		local border_size = 2
		local size = item_height - border_size * 2
		self._owned_selected_size = math.floor(size)
		self._owned_unselected_size = math.floor(size * 0.8)
		self._unlocked_selected_size = math.floor(size * 0.9)
		self._unlocked_unselected_size = math.floor(size * 0.7)
		self._locked_selected_size = math.floor(size * 0.5)
		self._locked_unselected_size = math.floor(size * 0.4)
		local pos = item_width / 2 - size / 2
		local secret_count = 1
		local start_item = 1
		local neighbour_top, neighbour_left = nil
		local neighbour_non_alpha = 0.3

		for index, item in pairs(self._tree_items) do
			if tweak_data.infamy.tree[index] then
				if tweak_data.infamy.tree[index] == "infamy_root" then
					start_item = index
				end

				local infamy_tweak = tweak_data.infamy.items[tweak_data.infamy.tree[index]]
				local texture_rect_x = infamy_tweak.icon_xy and infamy_tweak.icon_xy[1] or 0
				local texture_rect_y = infamy_tweak.icon_xy and infamy_tweak.icon_xy[2] or 0
				item.owned = managers.infamy:owned(tweak_data.infamy.tree[index])
				item.unlocked = managers.infamy:available(tweak_data.infamy.tree[index])

				if item.neighbour_left then
					neighbour_left = index - 1

					if self._tree_items[neighbour_left] then
						item.neighbour_left[1]:set_image(item.owned and "guis/dlcs/infamous/textures/pd2/infamous_tree/connector_df" or "guis/dlcs/infamous/textures/pd2/infamous_tree/connector_2_df")
						item.neighbour_left[2]:set_image(self._tree_items[neighbour_left].owned and "guis/dlcs/infamous/textures/pd2/infamous_tree/connector_df" or "guis/dlcs/infamous/textures/pd2/infamous_tree/connector_2_df")
						item.neighbour_left[1]:set_alpha((item.owned and 1 or item.unlocked and 0.7 or 0.1) * (self._tree_items[neighbour_left].owned and 1 or 0.5))
						item.neighbour_left[2]:set_alpha((self._tree_items[neighbour_left].owned and 1 or self._tree_items[neighbour_left].unlocked and 0.7 or 0.1) * (item.owned and 1 or 0.6))
					end
				end

				if item.neighbour_top then
					neighbour_top = index - tree_cols

					if self._tree_items[neighbour_top] then
						item.neighbour_top[1]:set_image(item.owned and "guis/dlcs/infamous/textures/pd2/infamous_tree/connector_df" or "guis/dlcs/infamous/textures/pd2/infamous_tree/connector_2_df")
						item.neighbour_top[2]:set_image(self._tree_items[neighbour_top].owned and "guis/dlcs/infamous/textures/pd2/infamous_tree/connector_df" or "guis/dlcs/infamous/textures/pd2/infamous_tree/connector_2_df")
						item.neighbour_top[1]:set_alpha((item.owned and 1 or item.unlocked and 0.7 or 0.1) * (self._tree_items[neighbour_top].owned and 1 or 0.5))
						item.neighbour_top[2]:set_alpha((self._tree_items[neighbour_top].owned and 1 or self._tree_items[neighbour_top].unlocked and 0.7 or 0.1) * (item.owned and 1 or 0.6))
					end
				end

				item.select_size = item.owned and self._owned_selected_size or item.unlocked and self._unlocked_selected_size or self._locked_selected_size
				item.unselect_size = item.owned and self._owned_unselected_size or item.unlocked and self._unlocked_unselected_size or self._locked_unselected_size
				local color = item.owned and tweak_data.screen_colors.item_stage_1 or item.unlocked and tweak_data.screen_colors.item_stage_2 or tweak_data.screen_colors.item_stage_3
				local image = item.panel:bitmap({
					texture = "guis/dlcs/infamous/textures/pd2/infamous_tree/infamous_tree_atlas",
					name = "image",
					layer = 1,
					blend_mode = "add",
					w = item.unselect_size,
					h = item.unselect_size,
					texture_rect = {
						texture_rect_x * 128,
						texture_rect_y * 128,
						128,
						128
					},
					color = color
				})

				image:set_center(item.panel:w() / 2, item.panel:h() / 2)
				item.panel:text({
					name = "text",
					wrap = false,
					word_wrap = false,
					align = "center",
					visible = true,
					alpha = 0,
					text = "",
					x = 0,
					layer = 1,
					y = item_height - tweak_data.menu.pd2_small_font_size - border_size,
					w = item_width,
					font = tweak_data.menu.pd2_small_font,
					font_size = tweak_data.menu.pd2_small_font_size
				})

				local glow_size = size * 1.25
				local glow = item.panel:panel({
					name = "unlock_glow",
					w = glow_size,
					h = glow_size
				})

				glow:bitmap({
					texture = "guis/dlcs/infamous/textures/pd2/infamous_tree/spinner_01_df",
					name = "glow1",
					blend_mode = "add",
					halign = "scale",
					rotation = 360,
					valign = "scale",
					w = glow_size,
					h = glow_size,
					color = tweak_data.screen_colors.text
				})
				glow:bitmap({
					texture = "guis/dlcs/infamous/textures/pd2/infamous_tree/spinner_02_df",
					name = "glow2",
					blend_mode = "add",
					halign = "scale",
					rotation = 360,
					valign = "scale",
					w = glow_size,
					h = glow_size,
					color = tweak_data.screen_colors.text
				})
				glow:set_center(item.panel:w() / 2, item.panel:h() / 2)
				glow:set_visible(item.owned)
				glow:set_alpha(item.owned and 1 or item.unlocked and 0.25 or 0.25)

				item.glow_alpha = false

				local function anim_pulse_glow(o)
					local t = 0
					local old_t = 0
					local dt = 0
					local speed = math.random() * 0.1 + 0.4
					local glow1 = o:child("glow1")
					local glow2 = o:child("glow2")
					local r1 = (0.5 + math.rand(0.3)) * 95
					local r2 = -(0.5 + math.rand(0.3)) * 95

					glow1:set_alpha(1)
					glow2:set_alpha(1)

					item.glow_alpha = item.glow_alpha or o:alpha()
					local wanted_alpha = item.glow_alpha
					local wanted_size = item.unselect_size
					local cur_size = image:w()
					local neighbour_left = neighbour_left
					local neighbour_top = neighbour_top
					local connector_speed = nil
					local speed_mul = 0.75
					local cx, cy, s = nil

					while true do
						dt = coroutine.yield()
						t = (t + dt * speed) % 1
						wanted_alpha = (math.sin(t * 180) * 0.4 + 0.6) * 1 * item.glow_alpha

						o:set_alpha(math.step(o:alpha(), wanted_alpha, dt * speed * 2))
						glow1:rotate(dt * r1)
						glow2:rotate(dt * r2)

						cx, cy = glow:center()
						s = (math.sin(t * 180) * 0.1 + 0.9) * glow_size * 1.05

						glow:set_size(s, s)
						glow:set_center(cx, cy)

						if item.neighbour_left and self._tree_items[neighbour_left] then
							connector_speed = (self._tree_items[neighbour_left].unlocked and 1 or speed_mul) * (self._tree_items[neighbour_left].owned and 1 or speed_mul) * (item.unlocked and 1 or speed_mul) * (item.unlocked and 1 or speed_mul)
							item.fw = (item.fw + dt * 10 * connector_speed) % item.neighbour_left[1]:texture_width()

							item.neighbour_left[1]:set_texture_coordinates(Vector3(0 + item.fw, 0, 0), Vector3(item_width + item.fw, 0, 0), Vector3(0 + item.fw, 16, 0), Vector3(item_width + item.fw, 16, 0))
							item.neighbour_left[2]:set_texture_coordinates(Vector3(0 - item.fw, 0, 0), Vector3(item_width - item.fw, 0, 0), Vector3(0 - item.fw, 16, 0), Vector3(item_width - item.fw, 16, 0))
						end

						if item.neighbour_top and self._tree_items[neighbour_top] then
							connector_speed = (self._tree_items[neighbour_top].unlocked and 1 or speed_mul) * (self._tree_items[neighbour_top].owned and 1 or speed_mul) * (item.unlocked and 1 or speed_mul) * (item.unlocked and 1 or speed_mul)
							item.fh = (item.fh + dt * 10 * connector_speed) % item.neighbour_top[1]:texture_width()

							item.neighbour_top[1]:set_texture_coordinates(Vector3(0 + item.fh, 16, 0), Vector3(0 + item.fh, 0, 0), Vector3(item_height + item.fh, 16, 0), Vector3(item_height + item.fh, 0, 0))
							item.neighbour_top[2]:set_texture_coordinates(Vector3(0 - item.fh, 16, 0), Vector3(0 - item.fh, 0, 0), Vector3(item_height - item.fh, 16, 0), Vector3(item_height - item.fh, 0, 0))
						end

						if self._selected_item == index and item.panel:child("text"):alpha() ~= 1 then
							item.panel:child("text"):set_alpha(math.lerp(item.panel:child("text"):alpha(), 1, dt * 10))
						end

						wanted_size = self._selected_item == index and item.select_size or item.unselect_size

						if cur_size ~= wanted_size then
							cx, cy = image:center()
							cur_size = math.lerp(cur_size, wanted_size, dt * 6)
							cur_size = math.step(cur_size, wanted_size, dt * 25)

							image:set_size(cur_size, cur_size)
							image:set_center(cx, cy)
						end

						if t < old_t then
							speed = math.random() * 0.1 + 0.4
						end

						old_t = t
					end
				end

				glow:animate(anim_pulse_glow)
			else
				item.owned = false
				item.unlocked = false

				if item.neighbour_left then
					neighbour_left = index - 1

					if self._tree_items[neighbour_left] then
						item.neighbour_left[1]:set_image("guis/dlcs/infamous/textures/pd2/infamous_tree/connector_2_df")
						item.neighbour_left[2]:set_image("guis/dlcs/infamous/textures/pd2/infamous_tree/connector_2_df")
						item.neighbour_left[1]:set_alpha(neighbour_non_alpha * neighbour_non_alpha * neighbour_non_alpha)
						item.neighbour_left[2]:set_alpha(neighbour_non_alpha * neighbour_non_alpha * neighbour_non_alpha)
					end
				end

				if item.neighbour_top then
					neighbour_top = index - tree_cols

					if self._tree_items[neighbour_top] then
						item.neighbour_top[1]:set_image("guis/dlcs/infamous/textures/pd2/infamous_tree/connector_2_df")
						item.neighbour_top[2]:set_image("guis/dlcs/infamous/textures/pd2/infamous_tree/connector_2_df")
						item.neighbour_top[1]:set_alpha(neighbour_non_alpha * neighbour_non_alpha * neighbour_non_alpha)
						item.neighbour_top[2]:set_alpha(neighbour_non_alpha * neighbour_non_alpha * neighbour_non_alpha)
					end
				end

				item.panel:rect({
					blend_mode = "add",
					name = "image",
					alpha = 0,
					x = border_size,
					y = border_size,
					w = size,
					h = size
				})
				item.panel:text({
					name = "text",
					wrap = false,
					word_wrap = false,
					align = "center",
					text = "",
					x = 0,
					layer = 1,
					y = item_height - tweak_data.menu.pd2_small_font_size - border_size,
					w = item_width,
					font = tweak_data.menu.pd2_small_font,
					font_size = tweak_data.menu.pd2_small_font_size
				})
			end

			item.border = BoxGuiObject:new(item.panel, {
				sides = {
					0,
					0,
					0,
					0
				}
			})
		end

		local points_text = self._panel:text({
			word_wrap = false,
			name = "points",
			wrap = false,
			align = "center",
			layer = 1,
			text = utf8.to_upper(managers.localization:text("st_menu_infamy_available_points", {
				points = managers.infamy:points()
			})),
			font = tweak_data.menu.pd2_medium_font,
			font_size = tweak_data.menu.pd2_medium_font_size,
			color = tweak_data.screen_colors.text
		})
		local _, _, w, h = points_text:text_rect()

		points_text:set_size(self._tree_main_panel:w(), h)
		points_text:set_top(self._tree_main_panel:bottom() + 5)
		points_text:set_center_x(self._tree_panel:center_x())

		if managers.menu:is_pc_controller() then
			local back_text = self._panel:text({
				vertical = "bottom",
				name = "back_button",
				align = "right",
				blend_mode = "add",
				text = utf8.to_upper(managers.localization:text("menu_back")),
				h = tweak_data.menu.pd2_large_font_size,
				font_size = tweak_data.menu.pd2_large_font_size,
				font = tweak_data.menu.pd2_large_font,
				color = tweak_data.screen_colors.button_stage_3
			})
			local _, _, w, h = back_text:text_rect()

			back_text:set_size(w, h)
			back_text:set_position(math.round(back_text:x()), math.round(back_text:y()))
			back_text:set_right(self._panel:w())
			back_text:set_bottom(self._panel:h())

			local bg_back = self._fullscreen_panel:text({
				name = "back_button",
				vertical = "bottom",
				h = 90,
				align = "right",
				alpha = 0.4,
				blend_mode = "add",
				layer = 1,
				text = utf8.to_upper(managers.localization:text("menu_back")),
				font_size = tweak_data.menu.pd2_massive_font_size,
				font = tweak_data.menu.pd2_massive_font,
				color = tweak_data.screen_colors.button_stage_3
			})
			local x, y = managers.gui_data:safe_to_full_16_9(self._panel:child("back_button"):world_right(), self._panel:child("back_button"):world_center_y())

			bg_back:set_world_right(x)
			bg_back:set_world_center_y(y)
			bg_back:move(13, -9)
			MenuBackdropGUI.animate_bg_text(self, bg_back)
			
			local reset_text = self._panel:text({
				vertical = "bottom",
				name = "reset_button",
				align = "center",
				blend_mode = "add",
				visible = false,
				rotation = 360,
				text = utf8.to_upper(managers.localization:text("menu_reset_infamy_tree")),
				h = tweak_data.menu.pd2_medium_font_size,
				font_size = tweak_data.menu.pd2_medium_font_size,
				font = tweak_data.menu.pd2_medium_font
			})
			local _, _, w, h = reset_text:text_rect()
			if managers.money:offshore() < 200000000 then
				reset_text:set_text(utf8.to_upper(managers.localization:text("menu_not_enough_offshore")))
				reset_text:set_color(tweak_data.screen_colors.pro_color)
				reset_text:set_alpha(0.7)
			else
				reset_text:set_text(utf8.to_upper(managers.localization:text("menu_reset_infamy_tree")))
				reset_text:set_color(tweak_data.screen_colors.button_stage_3)
			end
			reset_text:set_size(w, h)
			reset_text:set_position(math.round(reset_text:x()), math.round(reset_text:y()))
			reset_text:set_center(points_text:center())
			reset_text:set_top(points_text:bottom())
		
		end

		local black_rect = self._fullscreen_panel:rect({
			layer = 1,
			color = Color(0.4, 0, 0, 0)
		})
		local blur = self._fullscreen_panel:bitmap({
			texture = "guis/textures/test_blur_df",
			render_template = "VertexColorTexturedBlur3D",
			layer = -1,
			w = self._fullscreen_ws:panel():w(),
			h = self._fullscreen_ws:panel():h()
		})

		local function func(o)
			over(0.6, function (p)
				o:set_alpha(p)
			end)
		end

		blur:animate(func)
		self:_select_item(start_item)

		if MenuCallbackHandler:can_become_infamous() or managers.experience:current_rank() == 0 then
			managers.menu:show_infamous_message(MenuCallbackHandler:can_become_infamous() and Application:digest_value(tweak_data.infamy.ranks[managers.experience:current_rank() + 1], false) <= managers.money:offshore())
		end

		managers.features:announce_feature("infamy_2_0")
	end

	function InfamyTreeGui:mouse_moved(o, x, y)
		local used = false
		local pointer = "arrow"
		local can_reset = managers.infamy:points() <= managers.experience:current_rank() - 2

		for index, item in pairs(self._tree_items) do
			if item.panel:inside(x, y) then
				used = true
				pointer = "link"

				if self._selected_item ~= index then
					self:_select_item(index)
					managers.menu_component:post_event("highlight")
				end
			end
		end
		
		local reset_button = self._panel:child("reset_button")
		reset_button:set_visible(can_reset)
		if managers.menu:is_pc_controller() then
			local back_button = self._panel:child("back_button")
			local reset_button = self._panel:child("reset_button")

			if not used and back_button:inside(x, y) then
				used = true
				pointer = "link"

				if not self._back_highlight then
					self._back_highlight = true

					back_button:set_color(tweak_data.screen_colors.button_stage_2)
					managers.menu_component:post_event("highlight")
					self:_select_item("infamy_root")
				end
			elseif can_reset and not used and reset_button:inside(x, y) then
				used = true
				pointer = "link"

				if not self._back_highlight then
					self._back_highlight = true
					if managers.money:offshore() < 200000000 then
						reset_button:set_color(tweak_data.screen_colors.pro_color)
						reset_button:set_alpha(1)
					else
						reset_button:set_color(tweak_data.screen_colors.button_stage_2)
					end
					managers.menu_component:post_event("highlight")
					self:_select_item("infamy_root")
				end
			elseif self._back_highlight then
				self._back_highlight = false
				
				back_button:set_color(tweak_data.screen_colors.button_stage_3)
				if managers.money:offshore() < 200000000 then
					reset_button:set_color(tweak_data.screen_colors.pro_color)
					reset_button:set_alpha(0.7)
				else
					reset_button:set_color(tweak_data.screen_colors.button_stage_3)
				end
			end
		end

		used = used or self._panel:inside(x, y)

		return used, pointer
	end

	Hooks:PreHook(InfamyTreeGui, "mouse_pressed", "InfamyTreeGui_mouse_pressed", function(self, button, x, y)
		local can_reset = managers.infamy:points() <= managers.experience:current_rank() - 2
		if button == Idstring("0") then
			if can_reset and self._panel:child("reset_button"):inside(x, y) then
				self:reset_dialog()
				return
			end
		end
	end)

	function InfamyTreeGui:reset_dialog()
		local params = {
			text_string = "dialog_confirm_infamy_tree_reset",
			yes_func = callback(self, self, "confirm_reset")
		}
		if managers.money:offshore() < 200000000 then
			managers.menu:show_not_enough_money_infamy_tree_reset(params)
		else
			managers.menu:show_confirm_infamy_tree_reset(params)
		end
	end

	function InfamyTreeGui:confirm_reset(item)
		managers.money:deduct_from_offshore(200000000)
		managers.infamy:_reset_points()
		managers.menu:post_event("refund")
	end
end
if string.lower(RequiredScript) == "lib/managers/menumanager" then
	function MenuCallbackHandler:_increase_infamous(yes_clbk)
		managers.menu_scene:destroy_infamy_card()

		if managers.experience:current_level() < 100 or managers.experience:current_rank() >= #tweak_data.infamy.ranks then
			return
		end

		local rank = managers.experience:current_rank() + 1

		managers.experience:reset()
		managers.skilltree:reset_specializations()
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
end
if string.lower(RequiredScript) == "lib/managers/menu/menuscenegui" then
	function MenuSceneGui:update(t, dt)
		if self._shown_infamy_text_t then
			if self._shown_infamy_text_t <= t then
				self._shown_infamy_text_t = nil
				local current_rank = managers.experience:current_rank()
				self._infamy_increased_text = self._panel:text({
					vertical = "top",
					align = "center",
					layer = 1,
					text = managers.localization:to_upper_text(
					current_rank == 10 and "menu_infamy_jack_reached" or
					current_rank == 11 and "menu_infamy_queen_reached" or
					current_rank == 12 and "menu_infamy_king_reached" or
					current_rank == 13 and "menu_infamy_ace_reached" or
					current_rank >= 14 and "menu_infamy_fool_reached" or
					current_rank == 0 and "menu_infamy_rank_reached" or "menu_infamy_rank_increased", {
						infamy_rank = tostring(current_rank + 1)
					}),
					font = tweak_data.menu.pd2_large_font,
					font_size = tweak_data.menu.pd2_large_font_size
				})

				self._infamy_increased_text:move(0, self._panel:h() * 0.1)
			end
		elseif managers.menu_scene:infamy_card_shown() and not alive(self._infamy_increased_text) then
			self._shown_infamy_text_t = t + 4
		end

		if alive(self._infamy_increased_text) then
			-- Nothing
		end

		if managers.menu:is_pc_controller() then
			return
		end

		if mvector3.is_zero(self._left_axis_vector) then
			managers.menu_scene:stop_controller_move()
		else
			local x = mvector3.x(self._left_axis_vector)
			local y = mvector3.y(self._left_axis_vector)

			managers.menu_scene:controller_move(x * dt, y * dt)
		end

		if mvector3.is_zero(self._right_axis_vector) then
			managers.menu_scene:stop_controller_zoom()
		else
			local x = mvector3.x(self._right_axis_vector)
			local y = mvector3.y(self._right_axis_vector)

			managers.menu_scene:controller_zoom(x * dt, y * dt)
		end
	end
end
if string.lower(RequiredScript) == "lib/managers/experiencemanager" then
	function ExperienceManager:rank_string(rank)
		if tweak_data.test and rank >= 14 then
			return "TESTER"
		elseif _G.OriginalPackOptions.settings.Enable_Max_Progress and rank >= 14 or rank >= 15 then
			return "MAX"
		elseif rank >= 15 then
			return "LOL NOOB"
		elseif rank == 14 then
			return "ACE"
		elseif rank == 13 then
			return "K"
		elseif rank == 12 then
			return "Q"
		elseif rank == 11 then
			return "J"
		end
		local numbers = {
			1,
			5,
			10,
			50,
			100,
			500,
			1000
		}
		local chars = {
			"I",
			"V",
			"X",
			"L",
			"C",
			"D",
			"M"
		}
		local roman = ""

		for i = #numbers, 1, -1 do
			local num = numbers[i]

			while rank - num >= 0 and rank > 0 do
				roman = roman .. chars[i]
				rank = rank - num
			end

			for j = 1, i - 1, 1 do
				local num2 = numbers[j]

				if rank - (num - num2) >= 0 and rank < num and rank > 0 and num - num2 ~= num2 then
					roman = roman .. chars[j] .. chars[i]
					rank = rank - (num - num2)

					break
				end
			end
		end

		return roman
	end
end
if string.lower(RequiredScript) == "lib/network/base/session_states/hoststateingame" then
	function HostStateInGame:on_peer_finished_loading(data, peer)
		self:_introduce_new_peer_to_old_peers(data, peer, false, peer:name(), peer:character(), "remove", peer:xuid(), peer:xnaddr())
		self:_introduce_old_peers_to_new_peer(data, peer)

		if data.game_started then
			peer:send("set_dropin")
		end

		if self._new_peers[peer:id()] then
			if peer:rank() > 25 then	
				managers.menu:post_event("player_join")
				managers.menu:post_event("goat")
			elseif peer:rank() >= 15 then
				managers.menu:post_event("player_join")
			elseif peer:rank() == 14 then
				managers.menu:post_event("infamous_ace_join_stinger")
			elseif peer:rank() > 10 then
				managers.menu:post_event("infamous_elite_join_stinger")
			elseif peer:rank() > 0 then
				managers.menu:post_event("infamous_player_join_stinger")
			else
				managers.menu:post_event("player_join")
			end

			managers.network:session():send_to_peers_except(peer:id(), "peer_joined_sound", peer:rank() > 0)
			managers.crime_spree:on_peer_finished_loading(peer)
		end
	end
end
if string.lower(RequiredScript) == "lib/network/base/session_states/hoststateinlobby" then
	function HostStateInLobby:on_join_request_received(data, peer_name, client_preferred_character, dlcs, xuid, peer_level, peer_rank, gameversion, join_attempt_identifier, auth_ticket, sender)
		print("HostStateInLobby:on_join_request_received peer_level", peer_level, join_attempt_identifier, gameversion)

		if SystemInfo:platform() == Idstring("WIN32") then
			peer_name = managers.network.account:username_by_id(sender:ip_at_index(0))
		end

		if self:_has_peer_left_PSN(peer_name) then
			print("this CLIENT has left us from PSN, ignore his request", peer_name)

			return
		end

		local my_user_id = data.local_peer:user_id() or ""

		if self:_is_banned(peer_name, sender) then
			self:_send_request_denied(sender, 9, my_user_id)

			return
		end

		local user = Steam:user(sender:ip_at_index(0))

		if not MenuCallbackHandler:is_modded_client() and not Global.game_settings.allow_modded_players and user and user:rich_presence("is_modded") == "1" then
			self:_send_request_denied(sender, 10, my_user_id)

			return
		end

		if peer_level < Global.game_settings.reputation_permission then
			self:_send_request_denied(sender, 6, my_user_id)

			return
		end

		if gameversion ~= -1 and gameversion ~= managers.network.matchmake.GAMEVERSION then
			self:_send_request_denied(sender, 7, my_user_id)

			return
		end

		if data.wants_to_load_level then
			self:_send_request_denied(sender, 0, my_user_id)

			return
		end

		if not managers.network:session():local_peer() then
			self:_send_request_denied(sender, 0, my_user_id)

			return
		end

		local old_peer = data.session:chk_peer_already_in(sender)

		if old_peer then
			if join_attempt_identifier ~= old_peer:join_attempt_identifier() then
				data.session:remove_peer(old_peer, old_peer:id(), "lost")
				self:_send_request_denied(sender, 0, my_user_id)
			end

			return
		end

		if table.size(data.peers) >= tweak_data.max_players - 1 then
			print("server is full")
			self:_send_request_denied(sender, 5, my_user_id)

			return
		end

		print("[HostStateInLobby:on_join_request_received] new peer accepted", peer_name)

		local character = managers.network:session():check_peer_preferred_character(client_preferred_character)
		local xnaddr = ""

		if SystemInfo:platform() == Idstring("X360") or SystemInfo:platform() == Idstring("XB1") then
			xnaddr = managers.network.matchmake:external_address(sender)
		end

		local new_peer_id, new_peer = nil
		new_peer_id, new_peer = data.session:add_peer(peer_name, nil, true, false, false, nil, character, sender:ip_at_index(0), xuid, xnaddr)

		if not new_peer_id then
			print("there was no clean peer_id")
			self:_send_request_denied(sender, 0, my_user_id)

			return
		end

		new_peer:set_dlcs(dlcs)
		new_peer:set_xuid(xuid)
		new_peer:set_join_attempt_identifier(join_attempt_identifier)

		local new_peer_rpc = nil

		if managers.network:protocol_type() == "TCP_IP" then
			new_peer_rpc = managers.network:session():resolve_new_peer_rpc(new_peer, sender)
		else
			new_peer_rpc = sender
		end

		new_peer:set_rpc(new_peer_rpc)
		new_peer:set_ip_verified(true)
		Network:add_client(new_peer:rpc())

		if not new_peer:begin_ticket_session(auth_ticket) then
			data.session:remove_peer(new_peer, new_peer:id(), "auth_fail")
			self:_send_request_denied(sender, 8, my_user_id)

			return
		end

		local ticket = new_peer:create_ticket()

		new_peer:set_entering_lobby(true)

		local level_index = tweak_data.levels:get_index_from_level_id(Global.game_settings.level_id)
		local difficulty_index = tweak_data:difficulty_to_index(Global.game_settings.difficulty)
		local job_id_index = 0
		local job_stage = 0
		local alternative_job_stage = 0
		local interupt_job_stage_level_index = 0

		if managers.job:has_active_job() then
			job_id_index = tweak_data.narrative:get_index_from_job_id(managers.job:current_job_id())
			job_stage = managers.job:current_stage()
			alternative_job_stage = managers.job:alternative_stage() or 0
			local interupt_stage_level = managers.job:interupt_stage()
			interupt_job_stage_level_index = interupt_stage_level and tweak_data.levels:get_index_from_level_id(interupt_stage_level) or 0
		end

		local server_xuid = (SystemInfo:platform() == Idstring("X360") or SystemInfo:platform() == Idstring("XB1")) and managers.network.account:player_id() or ""
		local params = {
			1,
			new_peer_id,
			character,
			level_index,
			difficulty_index,
			Global.game_settings.one_down,
			1,
			data.local_peer:character(),
			my_user_id,
			Global.game_settings.mission,
			job_id_index,
			job_stage,
			alternative_job_stage,
			interupt_job_stage_level_index,
			server_xuid,
			ticket
		}

		new_peer:send("join_request_reply", unpack(params))
		new_peer:send("set_loading_state", false, data.session:load_counter())

		if SystemInfo:platform() == Idstring("X360") or SystemInfo:platform() == Idstring("XB1") then
			new_peer:send("request_player_name_reply", managers.network:session():local_peer():name())
		end

		managers.vote:sync_server_kick_option(new_peer)
		self:_introduce_new_peer_to_old_peers(data, new_peer, false, peer_name, new_peer:character(), "remove", new_peer:xuid(), new_peer:xnaddr())
		self:_introduce_old_peers_to_new_peer(data, new_peer)
		self:on_handshake_confirmation(data, new_peer, 1)
		managers.network:session():local_peer():sync_lobby_data(new_peer)

		if peer_rank > 25 then
			managers.menu:post_event("player_join")
			managers.menu:post_event("goat")
		elseif peer_rank >= 15 then
			managers.menu:post_event("player_join")
		elseif peer_rank == 14 then
			managers.menu:post_event("infamous_ace_join_stinger")
		elseif peer_rank > 10 then
			managers.menu:post_event("infamous_elite_join_stinger")
		elseif peer_rank > 0 then
			managers.menu:post_event("infamous_player_join_stinger")
		else
			managers.menu:post_event("player_join")
		end

		managers.network:session():send_to_peers_except(new_peer_id, "peer_joined_sound", peer_rank > 0)
		managers.crime_spree:on_peer_finished_loading(new_peer)
	end
end
if string.lower(RequiredScript) == "lib/managers/menumanagerdialogs" then
	function MenuManager:show_confirm_infamy_tree_reset(params)
		local dialog_data = {}
		dialog_data.title = managers.localization:text("menu_reset_infamy_tree")
		dialog_data.text = managers.localization:text("menu_reset_infamy_tree_desc")
		dialog_data.focus_button = 2
		local yes_button = {
			managers.menu:open_node("infamytree"),
			managers.menu:back()
		}
		yes_button.text = managers.localization:text("dialog_yes")
		yes_button.callback_func = params.yes_func
		local no_button = {}
		no_button.text = managers.localization:text("dialog_no")
		no_button.callback_func = params.no_func
		no_button.cancel_button = true
		dialog_data.button_list = {yes_button, no_button}
		dialog_data.no_upper = true
		managers.system_menu:show(dialog_data)
	end

	function MenuManager:show_not_enough_money_infamy_tree_reset(params)
		local dialog_data = {}
		dialog_data.title = managers.localization:text("menu_not_enough_offshore")
		dialog_data.text = managers.localization:text("menu_not_enough_offshore_desc")
		dialog_data.focus_button = 1
		local no_button = {}
		no_button.text = managers.localization:text("dialog_ok")
		no_button.callback_func = params.no_func
		no_button.cancel_button = true
		dialog_data.button_list = {no_button}
		dialog_data.no_upper = true
		managers.system_menu:show(dialog_data)
	end
end