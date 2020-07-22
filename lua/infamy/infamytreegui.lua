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

function InfamyTreeGui:mouse_pressed(button, x, y)
	local can_reset = managers.infamy:points() <= managers.experience:current_rank() - 2
	if button == Idstring("0") then
		if self._panel:child("back_button"):inside(x, y)then
			managers.menu:back()
			return
		end
	
		if can_reset and self._panel:child("reset_button"):inside(x, y) then
			self:reset_dialog()
			return
		end

		if self._selected_item then
			local infamy_item = self._tree_items[self._selected_item]

			if infamy_item and infamy_item.panel:inside(x, y) then
				self:_unlock_item(self._selected_item)
			end
		end
	end
end

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