require("lib/managers/menu/WalletGuiObject")
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
BlackMarketGuiItem = BlackMarketGuiItem or class()

function BlackMarketGuiItem:init(main_panel, data, x, y, w, h)
	self._main_panel = main_panel
	self._panel = main_panel:panel({
		name = tostring(data.name),
		x = x,
		y = y,
		w = w,
		h = h
	})
	self._data = data or {}
	self._name = data.name
	self._child_panel = nil
	self._alpha = 1
end

function BlackMarketGuiItem:inside(x, y)
	return self._panel:inside(x, y)
end

function BlackMarketGuiItem:select(instant, no_sound)
	if not self._selected then
		self._selected = true
		self:refresh()
		if not instant and not no_sound then
			managers.menu_component:post_event("highlight")
		end
	end
end

function BlackMarketGuiItem:deselect(instant)
	if self._selected then
		self._selected = false
	end
	self:refresh()
end

function BlackMarketGuiItem:set_highlight(highlight, no_sound)
	if self._highlighted ~= highlight then
		self._highlighted = highlight
		self:refresh()
		if highlight and not no_sound then
			managers.menu_component:post_event("highlight")
		end
	end
end

function BlackMarketGuiItem:refresh()
	self._alpha = self._selected and 1 or self._highlighted and 0.85 or 0.7
	for _, object in ipairs(self._panel:children()) do
		object:set_alpha(self._alpha)
	end
	if self._child_panel and alive(self._child_panel) then
		self._child_panel:set_visible(self._selected)
	end
end

function BlackMarketGuiItem:mouse_pressed(button, x, y)
	return self._panel:inside(x, y)
end

function BlackMarketGuiItem:destroy()
end

BlackMarketGuiTabItem = BlackMarketGuiTabItem or class(BlackMarketGuiItem)

function BlackMarketGuiTabItem:init(main_panel, data, node, size_data, hide_select_rect, scroll_tab_table)
	BlackMarketGuiTabItem.super.init(self, main_panel, data, 0, 0, main_panel:w(), main_panel:h())
	local grid_panel_w = size_data.grid_w
	local grid_panel_h = size_data.grid_h
	local square_w = size_data.square_w
	local square_h = size_data.square_h
	local padding_w = size_data.padding_w
	local padding_h = size_data.padding_h
	local left_padding = size_data.left_padding
	local top_padding = size_data.top_padding
	self._node = node
	local slots = data.override_slots or {3, 3}
	slots[1] = math.max(1, slots[1])
	slots[2] = math.max(1, slots[2])
	self.my_slots_dimensions = slots
	square_w = square_w * 3 / slots[1]
	square_h = square_h * 3 / slots[2]
	self._tab_panel = scroll_tab_table.panel:panel({name = "tab_panel"})
	self._tab_text_string = utf8.to_upper(data.name_localized or managers.localization:text(data.name))
	local text = self._tab_panel:text({
		name = "tab_text",
		align = "center",
		vertical = "center",
		text = self._tab_text_string,
		font_size = medium_font_size,
		font = medium_font,
		color = tweak_data.screen_colors.button_stage_3,
		blend_mode = "add",
		layer = 1,
		visible = not hide_select_rect
	})
	BlackMarketGui.make_fine_text(self, text)
	local _, _, tw, th = text:text_rect()
	self._tab_panel:set_size(tw + 15, th + 10)
	self._tab_panel:child("tab_text"):set_size(self._tab_panel:size())
	self._tab_panel:set_center_x(self._panel:w() / 2)
	self._tab_panel:set_y(0)
	self._tab_panel:bitmap({
		name = "tab_select_rect",
		texture = "guis/textures/pd2/shared_tab_box",
		w = self._tab_panel:w(),
		h = self._tab_panel:h(),
		layer = 0,
		color = tweak_data.screen_colors.text:with_alpha(hide_select_rect and 0 or 1),
		visible = false
	})
	table.insert(scroll_tab_table, self._tab_panel)
	self._child_panel = self._panel:panel()
	self._grid_panel = self._child_panel:panel({
		name = "grid_panel",
		w = grid_panel_w,
		h = grid_panel_h,
		layer = 1
	})
	self._grid_panel:set_left(0)
	self._grid_panel:set_top(self._tab_panel:bottom() - 2 + top_padding)
	self._node:parameters().menu_component_tabs = self._node:parameters().menu_component_tabs or {}
	self._node:parameters().menu_component_tabs[data.name] = self._node:parameters().menu_component_tabs[data.name] or {}
	self._my_node_data = self._node:parameters().menu_component_tabs[data.name]
	self._data.on_create_func(self._data)
	self._slots = {}
	local slot_equipped = 1
	for index, data in ipairs(self._data) do
		local new_slot_class = BlackMarketGuiSlotItem
		if data.unique_slot_class then
			new_slot_class = _G[data.unique_slot_class]
		end
		table.insert(self._slots, new_slot_class:new(self._grid_panel, data, padding_w + (index - 1) % slots[1] * (square_w + padding_w), padding_h + math.floor((index - 1) / slots[1]) * (square_h + padding_h), square_w, square_h))
		if data.equipped then
			slot_equipped = index
		end
	end
	self:check_new_drop()
	self._slot_selected = 0 < #self._slots and (self._my_node_data.selected or slot_equipped)
	self._slot_highlighted = nil
	self:deselect(true)
	self:set_highlight(false)
end

function BlackMarketGuiTabItem:destroy()
	for i, slot in ipairs(self._slots) do
		slot:destroy()
	end
end

function BlackMarketGuiTabItem:set_tab_text(new_text)
	local text = self._tab_panel:child("tab_text")
	text:set_text(new_text)
	BlackMarketGui.make_fine_text(self, text)
	local _, _, tw, th = text:text_rect()
	self._tab_panel:set_size(tw + 15, th + 10)
	text:set_size(self._tab_panel:size())
	self._tab_panel:child("tab_select_rect"):set_size(self._tab_panel:size())
end

function BlackMarketGuiTabItem:check_new_drop(first_time)
	local got_new_drop = false
	for _, slot in pairs(self._slots) do
		if slot._data.new_drop_data and slot._data.new_drop_data.icon then
			got_new_drop = true
			break
		end
	end
	local tab_text_string = self._tab_text_string
	if got_new_drop then
		tab_text_string = tab_text_string .. "" .. managers.localization:get_default_macro("BTN_INV_NEW")
	else
	end
	self:set_tab_text(tab_text_string)
end

function BlackMarketGuiTabItem:refresh()
	self._alpha = 1
	if self._selected then
		self._tab_panel:child("tab_text"):set_color(tweak_data.screen_colors.button_stage_1)
		self._tab_panel:child("tab_text"):set_blend_mode("normal")
		self._tab_panel:child("tab_select_rect"):show()
	elseif self._highlighted then
		self._tab_panel:child("tab_text"):set_color(tweak_data.screen_colors.button_stage_2)
		self._tab_panel:child("tab_text"):set_blend_mode("add")
		self._tab_panel:child("tab_select_rect"):hide()
	else
		self._tab_panel:child("tab_text"):set_color(tweak_data.screen_colors.button_stage_3)
		self._tab_panel:child("tab_text"):set_blend_mode("add")
		self._tab_panel:child("tab_select_rect"):hide()
	end
	if self._child_panel and alive(self._child_panel) then
		self._child_panel:set_visible(self._selected)
	end
end

function BlackMarketGuiTabItem:set_tab_position(x)
	self._tab_panel:set_x(x)
	local _, _, tw, th = self._tab_panel:child("tab_text"):text_rect()
	self._tab_panel:set_size(tw + 15, th + 10)
	self._tab_panel:child("tab_text"):set_size(self._tab_panel:size())
	if self._new_drop_icon then
		self._new_drop_icon:set_leftbottom(0, 0)
	end
	return math.round(x + tw + 15 + 5)
end

function BlackMarketGuiTabItem:inside(x, y)
	if self._tab_panel:inside(x, y) then
		return true
	end
	if not self._selected then
		return
	end
	local update_select = false
	if not self._slot_highlighted then
		update_select = true
	elseif self._slots[self._slot_highlighted] and not self._slots[self._slot_highlighted]:inside(x, y) then
		self._slots[self._slot_highlighted]:set_highlight(false)
		self._slot_highlighted = nil
		update_select = true
	end
	if update_select then
		for i, slot in ipairs(self._slots) do
			if slot:inside(x, y) then
				self._slot_highlighted = i
				self._slots[self._slot_highlighted]:set_highlight(true)
				return 1
			end
		end
	end
end

function BlackMarketGuiTabItem:mouse_pressed(button, x, y)
	if not self._slots[self._slot_highlighted] then
		return
	end
	if self._slots[self._slot_selected] == self._slots[self._slot_highlighted] then
		return
	end
	if self._slots[self._slot_highlighted] and self._slots[self._slot_highlighted]:inside(x, y) then
		if self._slots[self._slot_selected] then
			self._slots[self._slot_selected]:deselect(false)
		end
		return self:select_slot(self._slot_highlighted)
	end
end

function BlackMarketGuiTabItem:selected_slot_center()
	if not self._slots[self._slot_selected] then
		return 0, 0
	end
	local x = self._slots[self._slot_selected]._panel:world_center_x()
	local y = self._slots[self._slot_selected]._panel:world_center_y()
	return x, y
end

function BlackMarketGuiTabItem:select_slot(slot, instant)
	slot = not slot and self._slot_selected or self._slots[slot] and slot or 1
	local no_sound = false
	if self._slots[slot]._name == "empty" then
		slot = self._slot_selected
		no_sound = true
	end
	if self._slots[self._slot_selected] then
		self._slots[self._slot_selected]:deselect(instant)
	end
	self._slot_selected = slot
	self._my_node_data.selected = self._slot_selected
	local selected_slot = self._slots[self._slot_selected]:select(instant, no_sound)
	self:check_new_drop()
	managers.menu_component:set_blackmarket_tab_positions()
	return selected_slot
end

function BlackMarketGuiTabItem:slots()
	return self._slots
end

BlackMarketGuiSlotItem = BlackMarketGuiSlotItem or class(BlackMarketGuiItem)

function BlackMarketGuiSlotItem:init(main_panel, data, x, y, w, h)
	BlackMarketGuiSlotItem.super.init(self, main_panel, data, x, y, w, h)
	if data.hide_bg then
	end
	if data.mid_text then
		local text = self._panel:text({
			name = "text",
			text = utf8.to_upper(data.mid_text.noselected_text),
			align = data.mid_text.align or "center",
			vertical = data.mid_text.vertical or "center",
			font_size = data.mid_text.font_size or medium_font_size,
			font = data.mid_text.font or medium_font,
			color = data.mid_text.noselected_color,
			blend_mode = data.mid_text.blend_mode or "add",
			layer = 2
		})
		text:grow(-10, -10)
		text:move(5, 5)
		self._text_in_mid = true
	end
	local animate_loading_texture = function(o)
		o:set_color(o:color():with_alpha(0))
		local time = coroutine.yield()
		o:set_color(o:color():with_alpha(1))
		while true do
			o:set_rotation(time * 180)
			time = (time + coroutine.yield()) % 2
		end
	end
	self._extra_textures = {}
	if data.extra_bitmaps then
		local color
		for i, bitmap in ipairs(data.extra_bitmaps) do
			color = data.extra_bitmaps_colors and data.extra_bitmaps_colors[i] or Color.white
			table.insert(self._extra_textures, self._panel:bitmap({
				texture = bitmap,
				color = color,
				w = 32,
				h = 32,
				layer = 0
			}))
		end
	end
	local texture_loaded_clbk = callback(self, self, "texture_loaded_clbk")
	if data.mini_icons then
		local padding = data.mini_icons.borders and 14 or 5
		for k, icon_data in ipairs(data.mini_icons) do
			icon_data.padding = padding
			if not icon_data.texture then
				local new_icon
				if icon_data.text then
					new_icon = self._panel:text({
						font = tweak_data.menu.pd2_small_font,
						font_size = tweak_data.menu.pd2_font_size,
						text = icon_data.text,
						color = icon_data.color or Color.white,
						w = icon_data.w or 32,
						h = icon_data.h or 32,
						layer = icon_data.layer or 1
					})
				else
					new_icon = self._panel:rect({
						color = icon_data.color or Color.white,
						w = icon_data.w or 32,
						h = icon_data.h or 32,
						layer = icon_data.layer or 1
					})
				end
				if icon_data.visible == false then
					new_icon:set_visible(false)
				end
				if icon_data.left then
					new_icon:set_left(padding + icon_data.left)
				elseif icon_data.right then
					new_icon:set_right(self._panel:w() - padding - icon_data.right)
				end
				if icon_data.top then
					new_icon:set_top(padding + icon_data.top)
				elseif icon_data.bottom then
					new_icon:set_bottom(self._panel:h() - padding - icon_data.bottom)
				end
				if icon_data.name == "new_drop" and data.new_drop_data then
					data.new_drop_data.icon = new_icon
				end
			elseif icon_data.stream then
				if DB:has(Idstring("texture"), icon_data.texture) then
					icon_data.request_index = managers.menu_component:request_texture(icon_data.texture, callback(self, self, "icon_loaded_clbk", icon_data))
				end
			else
				local new_icon = self._panel:bitmap({
					texture = icon_data.texture,
					color = icon_data.color or Color.white,
					w = icon_data.w or 32,
					h = icon_data.h or 32,
					layer = icon_data.layer or 1
				})
				if icon_data.render_template then
					new_icon:set_render_template(icon_data.render_template)
				end
				if icon_data.visible == false then
					new_icon:set_visible(false)
				end
				if icon_data.left then
					new_icon:set_left(padding + icon_data.left)
				elseif icon_data.right then
					new_icon:set_right(self._panel:w() - padding - icon_data.right)
				end
				if icon_data.top then
					new_icon:set_top(padding + icon_data.top)
				elseif icon_data.bottom then
					new_icon:set_bottom(self._panel:h() - padding - icon_data.bottom)
				end
				if icon_data.name == "new_drop" and data.new_drop_data then
					data.new_drop_data.icon = new_icon
				end
			end
		end
		if data.mini_icons.borders then
			local tl_side = self._panel:rect({
				w = 10,
				h = 2,
				color = Color.white,
				alpha = 0.4,
				blend_mode = "add"
			})
			local tl_down = self._panel:rect({
				w = 2,
				h = 10,
				color = Color.white,
				alpha = 0.4,
				blend_mode = "add"
			})
			local tr_side = self._panel:rect({
				w = 10,
				h = 2,
				color = Color.white,
				alpha = 0.4,
				blend_mode = "add"
			})
			local tr_down = self._panel:rect({
				w = 2,
				h = 10,
				color = Color.white,
				alpha = 0.4,
				blend_mode = "add"
			})
			local bl_side = self._panel:rect({
				w = 10,
				h = 2,
				color = Color.white,
				alpha = 0.4,
				blend_mode = "add"
			})
			local bl_down = self._panel:rect({
				w = 2,
				h = 10,
				color = Color.white,
				alpha = 0.4,
				blend_mode = "add"
			})
			local br_side = self._panel:rect({
				w = 10,
				h = 2,
				color = Color.white,
				alpha = 0.4,
				blend_mode = "add"
			})
			local br_down = self._panel:rect({
				w = 2,
				h = 10,
				color = Color.white,
				alpha = 0.4,
				blend_mode = "add"
			})
			tl_side:set_lefttop(self._panel:w() - 54, 8)
			tl_down:set_lefttop(self._panel:w() - 54, 8)
			tr_side:set_righttop(self._panel:w() - 8, 8)
			tr_down:set_righttop(self._panel:w() - 8, 8)
			bl_side:set_leftbottom(self._panel:w() - 54, self._panel:h() - 8)
			bl_down:set_leftbottom(self._panel:w() - 54, self._panel:h() - 8)
			br_side:set_rightbottom(self._panel:w() - 8, self._panel:h() - 8)
			br_down:set_rightbottom(self._panel:w() - 8, self._panel:h() - 8)
		end
	end
	if data.bitmap_texture then
		if DB:has(Idstring("texture"), data.bitmap_texture) then
			self._loading_texture = true
			if data.stream then
				self._requested_texture = data.bitmap_texture
				self._request_index = managers.menu_component:request_texture(self._requested_texture, texture_loaded_clbk)
			else
				texture_loaded_clbk(data.bitmap_texture, Idstring(data.bitmap_texture))
			end
		end
		if not self._bitmap then
			self._bitmap = self._panel:bitmap({
				name = "item_texture",
				texture = "guis/textures/pd2/endscreen/exp_ring",
				color = Color(0.2, 1, 1),
				w = 32,
				h = 32,
				layer = #self._extra_textures + 1,
				render_template = "VertexColorTexturedRadial"
			})
			self._bitmap:set_center(self._panel:w() / 2, self._panel:h() / 2)
			self._bitmap:animate(animate_loading_texture)
		end
	elseif data.bg_texture then
		if DB:has(Idstring("texture"), data.bg_texture) then
			self._loading_texture = true
			if data.stream then
				self._requested_texture = data.bg_texture
				self._request_index = managers.menu_component:request_texture(self._requested_texture, texture_loaded_clbk)
			else
				texture_loaded_clbk(data.bg_texture, Idstring(data.bg_texture))
			end
		end
		if not self._bitmap then
			self._bitmap = self._panel:bitmap({
				name = "item_texture",
				texture = "guis/textures/pd2/endscreen/exp_ring",
				color = Color(0.2, 1, 1),
				w = 32,
				h = 32,
				layer = #self._extra_textures + 1,
				render_template = "VertexColorTexturedRadial"
			})
			self._bitmap:set_center(self._panel:w() / 2, self._panel:h() / 2)
			self._bitmap:animate(animate_loading_texture)
		end
	end
	if data.equipped then
		local equipped_string = data.equipped_text or managers.localization:text("bm_menu_equipped")
		local equipped_text = self._panel:text({
			name = "equipped_text",
			text = utf8.to_upper(equipped_string),
			align = "left",
			vertical = "bottom",
			font_size = small_font_size,
			font = small_font,
			color = tweak_data.screen_colors.text,
			layer = 2
		})
		equipped_text:move(5, -5)
	end
	local red_box = false
	local number_text = false
	self._conflict = data.conflict
	self._level_req = data.level
	if data.lock_texture then
		red_box = true
	end
	if type(data.unlocked) == "number" then
		number_text = math.abs(data.unlocked)
		if 0 > data.unlocked then
			red_box = true
			self._item_req = true
		end
	end
	if data.mid_text then
		if self._bitmap then
			self._bitmap:set_color(self._bitmap:color():with_alpha(0.4))
		end
		if self._loading_texture then
			self._post_load_alpha = 0.4
		end
	end
	if red_box then
		if self._bitmap then
			self._bitmap:set_color(Color.white:with_alpha(0.8))
			for _, bitmap in pairs(self._extra_textures) do
				bitmap:set_color(bitmap:color():with_alpha(0.2))
			end
			self._bitmap:set_blend_mode("sub")
		end
		if self._loading_texture then
			self._post_load_alpha = 0.2
			self._post_load_blend_mode = "sub"
		end
		if not data.unlocked or data.can_afford ~= false then
			self._lock_bitmap = self._panel:bitmap({
				name = "lock",
				texture = data.lock_texture or "guis/textures/pd2/skilltree/padlock",
				w = 32,
				h = 32,
				color = tweak_data.screen_colors.important_1,
				layer = #self._extra_textures + 2
			})
			self._lock_bitmap:set_center(self._panel:w() / 2, self._panel:h() / 2)
		end
	end
	if number_text then
	end
	self:deselect(true)
	self:set_highlight(false, true)
end

function BlackMarketGuiSlotItem:get_texure_size(debug)
	if self._bitmap then
		local texture_width = self._bitmap:texture_width()
		local texture_height = self._bitmap:texture_height()
		local panel_width, panel_height = self._panel:size()
		if texture_width == 0 or texture_height == 0 or panel_width == 0 or panel_height == 0 then
			if debug then
				Application:error("BlackMarketGuiSlotItem:get_texure_size(): " .. self._data.bitmap_texture or self._data.bg_texture or "")
				Application:debug("BlackMarketGuiSlotItem:", "texture_width " .. texture_width, "texture_height " .. texture_height, "panel_width " .. panel_width, "panel_height " .. panel_height)
			end
			return 0, 0
		end
		local aspect = panel_width / panel_height
		local sw = math.max(texture_width, texture_height * aspect)
		local sh = math.max(texture_height, texture_width / aspect)
		local dw = texture_width / sw
		local dh = texture_height / sh
		return math.round(dw * panel_width), math.round(dh * panel_height)
	end
	return 0, 0
end

function BlackMarketGuiSlotItem:icon_loaded_clbk(icon_data, texture_idstring, ...)
	if not alive(self._panel) then
		Application:error("[BlackMarketGuiSlotItem] icon_loaded_clbk(): This code should no longer occur!!")
		return
	end
	local padding = icon_data.padding or 5
	local new_icon = self._panel:bitmap({
		texture = texture_idstring,
		color = icon_data.color or Color.white,
		w = icon_data.w or 32,
		h = icon_data.h or 32,
		layer = icon_data.layer or 1
	})
	if icon_data.render_template then
		new_icon:set_render_template(icon_data.render_template)
	end
	if icon_data.visible == false then
		new_icon:set_visible(false)
	end
	if icon_data.left then
		new_icon:set_left(padding + icon_data.left)
	elseif icon_data.right then
		new_icon:set_right(self._panel:w() - padding - icon_data.right)
	end
	if icon_data.top then
		new_icon:set_top(padding + icon_data.top)
	elseif icon_data.bottom then
		new_icon:set_bottom(self._panel:h() - padding - icon_data.bottom)
	end
	if icon_data.name == "new_drop" and self._data.new_drop_data then
		self._data.new_drop_data.icon = new_icon
	end
	icon_data.request_index = false
end

function BlackMarketGuiSlotItem:destroy()
	if self._data and self._data.mini_icons then
		for i, icon_data in ipairs(self._data.mini_icons) do
			if icon_data.stream then
				managers.menu_component:unretrieve_texture(icon_data.texture, icon_data.request_index)
			end
		end
	end
	if self._requested_texture then
		managers.menu_component:unretrieve_texture(self._requested_texture, self._request_index)
	end
end

function BlackMarketGuiSlotItem:texture_loaded_clbk(texture_idstring)
	if not alive(self._panel) then
		Application:error("[BlackMarketGuiSlotItem] texture_loaded_clbk(): This code should no longer occur!!")
		return
	end
	if self._bitmap then
		self._bitmap:stop()
		self._bitmap:set_rotation(0)
		self._bitmap:set_color(Color.white)
		self._bitmap:set_image(texture_idstring)
		self._bitmap:set_render_template(self._data.render_template or Idstring("VertexColorTextured"))
		self._bitmap:set_blend_mode("normal")
		for _, bitmap in pairs(self._extra_textures) do
			bitmap:set_color(bitmap:color():with_alpha(1))
			bitmap:set_blend_mode("normal")
		end
	else
		self._bitmap = self._panel:bitmap({
			name = "item_texture",
			texture = texture_idstring,
			blend_mode = "normal",
			layer = 1
		})
		self._bitmap:set_render_template(self._data.render_template or Idstring("VertexColorTextured"))
	end
	self._bitmap:set_size(self:get_texure_size(true))
	self._bitmap:set_center(self._panel:w() / 2, self._panel:h() / 2)
	for _, bitmap in pairs(self._extra_textures) do
		bitmap:set_size(self._bitmap:size())
		bitmap:set_center(self._bitmap:center())
	end
	if self._post_load_alpha then
		self._bitmap:set_color(Color.white:with_alpha(self._post_load_alpha))
		self._bitmap:set_blend_mode(self._post_load_blend_mode or "normal")
		for _, bitmap in pairs(self._extra_textures) do
			bitmap:set_color(bitmap:color():with_alpha(self._post_load_alpha))
			bitmap:set_blend_mode(self._post_load_blend_mode or "normal")
		end
		self._post_load_alpha = nil
		self._post_load_blend_mode = nil
	end
	self._loading_texture = nil
	self._request_index = nil
	self:set_highlight(self._highlighted, true)
	if self._selected then
		self:select(true)
	else
		self:deselect(true)
	end
	self:refresh()
end

function BlackMarketGuiSlotItem:set_btn_text(text)
end

function BlackMarketGuiSlotItem:set_highlight(highlight, instant)
	if self._bitmap and not self._loading_texture then
		if highlight then
			local animate_select = function(o, panel, instant, width, height)
				local w = o:w()
				local h = o:h()
				local end_w = width * 0.85
				local end_h = height * 0.85
				local center_x, center_y = o:center()
				if w == end_w or instant then
					o:set_size(end_w, end_h)
					o:set_center(center_x, center_y)
					return
				end
				over(math.abs(end_w - w) / end_w, function(p)
					o:set_size(math.lerp(w, end_w, p), math.lerp(h, end_h, p))
					o:set_center(center_x, center_y)
				end)
			end
			local w, h = self:get_texure_size()
			self._bitmap:stop()
			self._bitmap:animate(animate_select, self._panel, instant, w, h)
			for _, bitmap in pairs(self._extra_textures) do
				bitmap:stop()
				bitmap:animate(animate_select, self._panel, instant, w, h)
			end
		else
			local animate_deselect = function(o, panel, instant, width, height)
				local w = o:w()
				local h = o:h()
				local end_w = width * 0.65
				local end_h = height * 0.65
				local center_x, center_y = o:center()
				if w == end_w or instant then
					o:set_size(end_w, end_h)
					o:set_center(center_x, center_y)
					return
				end
				over(math.abs(end_w - w) / end_w, function(p)
					o:set_size(math.lerp(w, end_w, p), math.lerp(h, end_h, p))
					o:set_center(center_x, center_y)
				end)
			end
			local w, h = self:get_texure_size()
			self._bitmap:stop()
			self._bitmap:animate(animate_deselect, self._panel, instant, w, h)
			for _, bitmap in pairs(self._extra_textures) do
				bitmap:stop()
				bitmap:animate(animate_deselect, self._panel, instant, w, h)
			end
		end
	end
end

function BlackMarketGuiSlotItem:select(instant, no_sound)
	BlackMarketGuiSlotItem.super.select(self, instant, no_sound)
	if not managers.menu:is_pc_controller() then
		self:set_highlight(true, instant)
	end
	if self._text_in_mid and alive(self._panel:child("text")) then
		self._panel:child("text"):set_color(self._data.mid_text.selected_color or Color.white)
		self._panel:child("text"):set_text(utf8.to_upper(self._data.mid_text.selected_text or ""))
	end
	if self._data.new_drop_data then
		local newdrop = self._data.new_drop_data
		if newdrop[1] and newdrop[2] and newdrop[3] then
			managers.blackmarket:remove_new_drop(newdrop[1], newdrop[2], newdrop[3])
			if newdrop.icon then
				newdrop.icon:parent():remove(newdrop.icon)
			end
			self._data.new_drop_data = nil
		end
	end
	return self
end

function BlackMarketGuiSlotItem:deselect(instant)
	BlackMarketGuiSlotItem.super.deselect(self, instant)
	if not managers.menu:is_pc_controller() then
		self:set_highlight(false, instant)
	end
	if self._text_in_mid and alive(self._panel:child("text")) then
		self._panel:child("text"):set_color(self._data.mid_text.noselected_color or Color.white)
		self._panel:child("text"):set_text(utf8.to_upper(self._data.mid_text.noselected_text or ""))
	end
end

function BlackMarketGuiSlotItem:refresh()
	BlackMarketGuiSlotItem.super.refresh(self)
	if self._bitmap then
		self._bitmap:set_alpha(1)
		for _, bitmap in pairs(self._extra_textures) do
			bitmap:set_alpha(1)
		end
	end
end

BlackMarketGuiMaskSlotItem = BlackMarketGuiMaskSlotItem or class(BlackMarketGuiSlotItem)

function BlackMarketGuiMaskSlotItem:init(main_panel, data, x, y, w, h)
	BlackMarketGuiMaskSlotItem.super.init(self, main_panel, data, x, y, w, h)
	local cx, cy = self._panel:w() / 2, self._panel:h() / 2
	self._box_panel = self._panel:panel({
		w = self._panel:w() * 0.5,
		h = self._panel:w() * 0.5
	})
	self._box_panel:set_center(cx, cy)
	if not data.my_part_data.is_good then
		BoxGuiObject:new(self._box_panel, {
			sides = {
				1,
				1,
				1,
				1
			}
		})
	end
	self._mask_text = self._panel:text({
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size
	})
	self._mask_text:set_position(self._box_panel:left(), self._box_panel:bottom() + 10)
	self._mask_text:set_text(utf8.to_upper(data.name_localized .. ": "))
	BlackMarketGui.make_fine_text(self, self._mask_text)
	self._mask_name_text = self._panel:text({
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		wrap = true,
		word_wrap = true
	})
	self._mask_name_text:set_position(self._mask_text:right(), self._mask_text:top())
	self._mask_name_text:set_text(data.my_part_data.is_good and managers.localization:text(data.my_part_data.text) or "NOT SELECTED")
	self._mask_name_text:set_blend_mode(data.my_part_data.is_good and "normal" or "add")
	self._mask_name_text:set_color(data.my_part_data.is_good and tweak_data.screen_colors.text or tweak_data.screen_colors.important_1)
	self._mask_name_text:grow(-self._mask_name_text:x() - 5, 0)
	local _, _, _, texth = self._mask_name_text:text_rect()
	if data.my_part_data.override then
		self._mask_error_text = self._panel:text({
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			wrap = true,
			word_wrap = true,
			color = tweak_data.screen_colors.important_1,
			blend_mode = "add"
		})
		self._mask_error_text:set_position(self._mask_text:left(), self._mask_text:top() + texth)
		self._mask_error_text:set_text(managers.localization:to_upper_text("menu_bm_overwrite", {
			category = managers.localization:text("bm_menu_" .. data.my_part_data.override)
		}))
	end
	local current_match_with_true = true
	if data.my_part_data.is_good and data.my_true_part_data then
		current_match_with_true = data.my_part_data.id == data.my_true_part_data.id
	end
	if not current_match_with_true then
		if self._bitmap then
			self._bitmap:set_color(Color.white:with_alpha(0.3))
			for _, bitmap in pairs(self._extra_textures) do
				bitmap:set_color(bitmap:color():with_alpha(0.3))
			end
		end
		if self._loading_texture then
			self._post_load_alpha = 0.3
		end
		self._mask_text:set_color(self._mask_text:color():with_alpha(0.5))
		self._mask_name_text:set_color(self._mask_name_text:color():with_alpha(0.5))
		if self._mask_error_text then
			self._mask_error_text:set_color(self._mask_error_text:color():with_alpha(0.5))
		end
	end
	self:deselect(true)
	self:set_highlight(false, true)
end

function BlackMarketGuiMaskSlotItem:set_highlight(highlight, instant)
	if self._bitmap and not self._loading_texture then
		if highlight then
			local animate_select = function(o, panel, instant, width, height)
				local w = o:w()
				local h = o:h()
				local end_w = width * 0.55
				local end_h = height * 0.55
				local center_x, center_y = o:center()
				if w == end_w or instant then
					o:set_size(end_w, end_h)
					o:set_center(center_x, center_y)
					return
				end
				over(math.abs(end_w - w) / end_w, function(p)
					o:set_size(math.lerp(w, end_w, p), math.lerp(h, end_h, p))
					o:set_center(center_x, center_y)
				end)
			end
			local w, h = self:get_texure_size()
			self._bitmap:stop()
			self._bitmap:animate(animate_select, self._panel, instant, w, h)
			for _, bitmap in pairs(self._extra_textures) do
				bitmap:stop()
				bitmap:animate(animate_select, self._panel, instant, w, h)
			end
		else
			local animate_deselect = function(o, panel, instant, width, height)
				local w = o:w()
				local h = o:h()
				local end_w = width * 0.45
				local end_h = height * 0.45
				local center_x, center_y = o:center()
				if w == end_w or instant then
					o:set_size(end_w, end_h)
					o:set_center(center_x, center_y)
					return
				end
				over(math.abs(end_w - w) / end_w, function(p)
					o:set_size(math.lerp(w, end_w, p), math.lerp(h, end_h, p))
					o:set_center(center_x, center_y)
				end)
			end
			local w, h = self:get_texure_size()
			self._bitmap:stop()
			self._bitmap:animate(animate_deselect, self._panel, instant, w, h)
			for _, bitmap in pairs(self._extra_textures) do
				bitmap:stop()
				bitmap:animate(animate_deselect, self._panel, instant, w, h)
			end
		end
	end
end

BlackMarketGuiButtonItem = BlackMarketGuiButtonItem or class(BlackMarketGuiItem)

function BlackMarketGuiButtonItem:init(main_panel, data, x)
	BlackMarketGuiButtonItem.super.init(self, main_panel, data, 0, 0, 10, 10)
	local up_font_size = NOT_WIN_32 and RenderSettings.resolution.y < 720 and self._data.btn == "BTN_STICK_R" and 2 or 0
	self._btn_text = self._panel:text({
		name = "text",
		text = "",
		align = "left",
		x = 10,
		font_size = small_font_size + up_font_size,
		font = small_font,
		color = tweak_data.screen_colors.button_stage_3,
		blend_mode = "add",
		layer = 1
	})
	self._btn_text_id = data.name
	self._btn_text_legends = data.legends
	BlackMarketGui.make_fine_text(self, self._btn_text)
	self._panel:set_size(main_panel:w() - x * 2, medium_font_size)
	self._panel:rect({
		name = "select_rect",
		blend_mode = "add",
		color = tweak_data.screen_colors.button_stage_3,
		alpha = 0.3,
		valign = "scale",
		halign = "scale"
	})
	if not managers.menu:is_pc_controller() then
		self._btn_text:set_color(tweak_data.screen_colors.text)
	end
	self._panel:set_left(x)
	self._panel:hide()
	self:set_order(data.prio)
	self._btn_text:set_right(self._panel:w())
	self:deselect(true)
	self:set_highlight(false)
end

function BlackMarketGuiButtonItem:hide()
	self._panel:hide()
end

function BlackMarketGuiButtonItem:show()
	self._panel:show()
end

function BlackMarketGuiButtonItem:refresh()
	if managers.menu:is_pc_controller() then
		self._btn_text:set_color(self._highlighted and tweak_data.screen_colors.button_stage_2 or tweak_data.screen_colors.button_stage_3)
	end
	self._panel:child("select_rect"):set_visible(self._highlighted)
end

function BlackMarketGuiButtonItem:visible()
	return self._panel:visible()
end

function BlackMarketGuiButtonItem:set_order(prio)
	self._panel:set_y((prio - 1) * small_font_size)
end

function BlackMarketGuiButtonItem:set_text_btn_prefix(prefix)
	self._btn_prefix = prefix
end

function BlackMarketGuiButtonItem:set_text_params(params)
	local prefix = self._btn_prefix and managers.localization:get_default_macro(self._btn_prefix) or ""
	local btn_text = prefix
	if self._btn_text_id then
		btn_text = btn_text .. utf8.to_upper(managers.localization:text(self._btn_text_id, params))
	end
	if self._btn_text_legends then
		local legend_string = ""
		for i, legend in ipairs(self._btn_text_legends) do
			if 1 < i then
				legend_string = legend_string .. " | "
			end
			legend_string = legend_string .. managers.localization:text(legend)
		end
		btn_text = btn_text .. utf8.to_upper(legend_string)
	end
	self._btn_text:set_text(btn_text)
	BlackMarketGui.make_fine_text(self, self._btn_text)
	local _, _, w, h = self._btn_text:text_rect()
	self._panel:set_h(h)
	self._btn_text:set_size(w, h)
	self._btn_text:set_right(self._panel:w())
end

function BlackMarketGuiButtonItem:btn_text()
	return self._btn_text:text()
end

BlackMarketGui = BlackMarketGui or class()
BlackMarketGui.identifiers = {
	weapon = Idstring("weapon"),
	armor = Idstring("armor"),
	mask = Idstring("mask"),
	weapon_mod = Idstring("weapon_mod"),
	mask_mod = Idstring("mask_mod"),
	deployable = Idstring("deployable"),
	character = Idstring("character")
}

function BlackMarketGui:init(ws, fullscreen_ws, node)
	self._ws = ws
	self._fullscreen_ws = fullscreen_ws
	self._init_layer = self._ws:panel():layer()
	self._node = node
	local component_data = self._node:parameters().menu_component_data
	local do_animation = not component_data and not self._data
	local is_start_page = not component_data and true or false
	managers.menu_component:close_contract_gui()
	self:_setup(is_start_page, component_data)
	if do_animation then
		managers.menu_component:test_camera_shutter_tech()
		local fade_me_in_scotty = function(o)
			over(0.1, function(p)
				o:set_alpha(p)
			end)
		end
		self._panel:animate(fade_me_in_scotty)
		self._fullscreen_panel:animate(fade_me_in_scotty)
	end
end

function BlackMarketGui:set_layer(layer)
	self._panel:set_layer(self._init_layer + layer)
end

function BlackMarketGui:make_fine_text(text)
	local x, y, w, h = text:text_rect()
	text:set_size(w, h)
	text:set_position(math.round(text:x()), math.round(text:y()))
end

function BlackMarketGui:_setup(is_start_page, component_data)
	if alive(self._panel) then
		self._ws:panel():remove(self._panel)
	end
	self._panel = self._ws:panel():panel({})
	self._fullscreen_panel = self._fullscreen_ws:panel():panel({layer = 40})
	self:set_layer(45)
	WalletGuiObject.set_wallet(self._panel)
	self._data = component_data or self:_start_page_data()
	self._node:parameters().menu_component_data = self._data
	self._data.blur_fade = self._data.blur_fade or 0
	local blur = self._fullscreen_panel:bitmap({
		texture = "guis/textures/test_blur_df",
		w = self._fullscreen_ws:panel():w(),
		h = self._fullscreen_ws:panel():h(),
		render_template = "VertexColorTexturedBlur3D",
		layer = -1
	})
	local func = function(o, component_data)
		local start_blur = component_data.blur_fade
		over(0.6 - 0.6 * component_data.blur_fade, function(p)
			component_data.blur_fade = math.lerp(start_blur, 1, p)
			o:set_alpha(component_data.blur_fade)
		end)
	end
	blur:animate(func, self._data)
	self._panel:text({
		name = "back_button",
		text = utf8.to_upper(managers.localization:text("menu_back")),
		align = "right",
		vertical = "bottom",
		font_size = large_font_size,
		font = large_font,
		color = tweak_data.screen_colors.button_stage_3
	})
	self:make_fine_text(self._panel:child("back_button"))
	self._panel:child("back_button"):set_right(self._panel:w())
	self._panel:child("back_button"):set_bottom(self._panel:h())
	self._panel:child("back_button"):set_visible(managers.menu:is_pc_controller())
	self._pages = #self._data > 1 or self._data.show_tabs
	local grid_panel_w = self._panel:w() * WIDTH_MULTIPLIER
	local grid_panel_h = (self._panel:h() - (medium_font_size + 10) - 70) * GRID_H_MUL
	local square_w = grid_panel_w / 3
	local square_h = grid_panel_h / 3
	local padding_w = 0
	local padding_h = 0
	local left_padding = 0
	local top_padding = 70
	local size_data = {}
	size_data.grid_w = grid_panel_w
	size_data.grid_h = grid_panel_h
	size_data.square_w = square_w
	size_data.square_h = square_h
	size_data.padding_w = padding_w
	size_data.padding_h = padding_h
	size_data.left_padding = left_padding
	size_data.top_padding = top_padding
	self._inception_node_name = self._node:parameters().menu_component_next_node_name or "blackmarket_node"
	self._preview_node_name = self._node:parameters().menu_component_preview_node_name or "blackmarket_preview_node"
	self._tabs = {}
	self._btns = {}
	self._title_text = self._panel:text({
		name = "title_text",
		text = utf8.to_upper(managers.localization:text(self._data.topic_id, self._data.topic_params)),
		font_size = large_font_size,
		font = large_font,
		color = tweak_data.screen_colors.text
	})
	self:make_fine_text(self._title_text)
	self._tab_scroll_panel = self._panel:panel({w = grid_panel_w, y = top_padding})
	self._tab_scroll_table = {
		panel = self._tab_scroll_panel
	}
	for i, data in ipairs(self._data) do
		if data.on_create_func_name then
			data.on_create_func = callback(self, self, data.on_create_func_name)
		end
		local new_tab = BlackMarketGuiTabItem:new(self._panel, data, self._node, size_data, not self._pages, self._tab_scroll_table)
		table.insert(self._tabs, new_tab)
	end
	if self._data.open_callback_name then
		local clbk_func = callback(self, self, self._data.open_callback_name, self._data.open_callback_params)
		if clbk_func then
			clbk_func()
		end
	end
	self._selected = self._node:parameters().menu_component_selected or 1
	self._select_rect = self._panel:panel({
		name = "select_rect",
		w = square_w,
		h = square_h,
		layer = 8
	})
	if self._tabs[self._selected] then
		self._tabs[self._selected]:select(true)
		local slot_dim_x = self._tabs[self._selected].my_slots_dimensions[1]
		local slot_dim_y = self._tabs[self._selected].my_slots_dimensions[2]
		self._select_rect:set_size(square_w * 3 / slot_dim_x, square_h * 3 / slot_dim_y)
		self._select_rect_box = BoxGuiObject:new(self._select_rect, {
			sides = {
				2,
				2,
				2,
				2
			}
		})
		self._box_panel = self._panel:panel()
		self._box_panel:set_shape(self._tabs[self._selected]._grid_panel:shape())
		self._box = BoxGuiObject:new(self._box_panel, {
			sides = {
				1,
				1,
				1 + (1 < #self._tabs and 1 or 0),
				1
			}
		})
		local info_box_panel = self._panel:panel({
			name = "info_box_panel"
		})
		info_box_panel:set_size(self._panel:w() * (1 - WIDTH_MULTIPLIER) - BOX_GAP, self._box_panel:h())
		info_box_panel:set_right(self._panel:w())
		info_box_panel:set_top(self._box_panel:top())
		self._info_box = BoxGuiObject:new(info_box_panel, {
			sides = {
				1,
				1,
				1,
				1
			}
		})
		self._selected_slot = self._tabs[self._selected]:select_slot(nil, true)
		self._slot_data = self._selected_slot._data
		local x, y = self._tabs[self._selected]:selected_slot_center()
		self._select_rect:set_world_center(x, y)
		local BTNS = {
			w_mod = {
				prio = 2,
				btn = "BTN_Y",
				pc_btn = Idstring("menu_modify_item"),
				name = "bm_menu_btn_mod",
				callback = callback(self, self, "choose_weapon_mods_callback")
			},
			w_equip = {
				prio = 1,
				btn = "BTN_A",
				pc_btn = nil,
				name = "bm_menu_btn_equip_weapon",
				callback = callback(self, self, "equip_weapon_callback")
			},
			w_preview = {
				prio = 3,
				btn = "BTN_STICK_R",
				pc_btn = Idstring("menu_preview_item"),
				name = "bm_menu_btn_preview",
				callback = callback(self, self, "preview_weapon_callback")
			},
			w_sell = {
				prio = 4,
				btn = "BTN_X",
				pc_btn = Idstring("menu_remove_item"),
				name = "bm_menu_btn_sell",
				callback = callback(self, self, "sell_item_callback")
			},
			ew_buy = {
				prio = 1,
				btn = "BTN_A",
				pc_btn = nil,
				name = "bm_menu_btn_buy_new_weapon",
				callback = callback(self, self, "choose_weapon_buy_callback")
			},
			bw_buy = {
				prio = 1,
				btn = "BTN_A",
				pc_btn = nil,
				name = "bm_menu_btn_buy_selected_weapon",
				callback = callback(self, self, "buy_weapon_callback")
			},
			bw_preview = {
				prio = 3,
				btn = "BTN_STICK_R",
				pc_btn = Idstring("menu_preview_item"),
				name = "bm_menu_btn_preview",
				callback = callback(self, self, "preview_buy_weapon_callback")
			},
			bw_available_mods = {
				prio = 2,
				btn = "BTN_Y",
				pc_btn = Idstring("menu_preview_item_alt"),
				name = "bm_menu_available_mods",
				callback = callback(self, self, "show_available_mods_callback")
			},
			mt_choose = {
				prio = 1,
				btn = "BTN_A",
				pc_btn = nil,
				name = "bm_menu_btn_choose",
				callback = callback(self, self, "choose_mod_callback")
			},
			wm_buy = {
				prio = 1,
				btn = "BTN_A",
				pc_btn = nil,
				name = "bm_menu_btn_craft_mod",
				callback = callback(self, self, "buy_mod_callback")
			},
			wm_preview = {
				prio = 3,
				btn = "BTN_STICK_R",
				pc_btn = Idstring("menu_preview_item"),
				name = "bm_menu_btn_preview",
				callback = callback(self, self, "preview_weapon_callback")
			},
			wm_preview_mod = {
				prio = 2,
				btn = "BTN_Y",
				pc_btn = Idstring("menu_preview_item_alt"),
				name = "bm_menu_btn_preview_with_mod",
				callback = callback(self, self, "preview_weapon_with_mod_callback")
			},
			wm_remove_buy = {
				prio = 1,
				btn = "BTN_X",
				pc_btn = Idstring("menu_remove_item"),
				name = "bm_menu_btn_remove_mod",
				callback = callback(self, self, "remove_mod_callback")
			},
			wm_remove_preview_mod = {
				prio = 2,
				btn = "BTN_Y",
				pc_btn = Idstring("menu_preview_item_alt"),
				name = "bm_menu_btn_preview_with_mod",
				callback = callback(self, self, "preview_weapon_callback")
			},
			wm_remove_preview = {
				prio = 3,
				btn = "BTN_STICK_R",
				pc_btn = Idstring("menu_preview_item"),
				name = "bm_menu_btn_preview_no_mod",
				callback = callback(self, self, "preview_weapon_without_mod_callback")
			},
			a_equip = {
				prio = 1,
				btn = "BTN_A",
				pc_btn = nil,
				name = "bm_menu_btn_equip_armor",
				callback = callback(self, self, "equip_armor_callback")
			},
			m_equip = {
				prio = 1,
				btn = "BTN_A",
				pc_btn = nil,
				name = "bm_menu_btn_equip_mask",
				callback = callback(self, self, "equip_mask_callback")
			},
			m_mod = {
				prio = 2,
				btn = "BTN_Y",
				pc_btn = Idstring("menu_modify_item"),
				name = "bm_menu_btn_mod_mask",
				callback = callback(self, self, "mask_mods_callback")
			},
			m_preview = {
				prio = 3,
				btn = "BTN_STICK_R",
				pc_btn = Idstring("menu_preview_item"),
				name = "bm_menu_btn_preview_mask",
				callback = callback(self, self, "preview_mask_callback")
			},
			m_sell = {
				prio = 4,
				btn = "BTN_X",
				pc_btn = Idstring("menu_remove_item"),
				name = "bm_menu_btn_sell_mask",
				callback = callback(self, self, "sell_mask_callback")
			},
			em_gv = {
				prio = 1,
				btn = "BTN_A",
				pc_btn = nil,
				name = "bm_menu_btn_buy_new_mask",
				callback = callback(self, self, "choose_mask_global_value_callback")
			},
			em_buy = {
				prio = 1,
				btn = "BTN_A",
				pc_btn = nil,
				name = "bm_menu_btn_buy_new_mask",
				callback = callback(self, self, "choose_mask_buy_callback")
			},
			em_available_mods = {
				prio = 3,
				btn = "BTN_Y",
				pc_btn = Idstring("menu_preview_item_alt"),
				name = "bm_menu_buy_mask_title",
				callback = callback(self, self, "show_available_mask_mods_callback")
			},
			mm_choose_textures = {
				prio = 1,
				btn = "BTN_A",
				pc_btn = "",
				name = "bm_menu_choose_pattern",
				callback = callback(self, self, "choose_mask_mod_callback", "textures")
			},
			mm_choose_materials = {
				prio = 2,
				btn = "BTN_A",
				pc_btn = "",
				name = "bm_menu_choose_material",
				callback = callback(self, self, "choose_mask_mod_callback", "materials")
			},
			mm_choose_colors = {
				prio = 3,
				btn = "BTN_A",
				pc_btn = "",
				name = "bm_menu_choose_color",
				callback = callback(self, self, "choose_mask_mod_callback", "colors")
			},
			mm_choose = {
				prio = 1,
				btn = "BTN_A",
				pc_btn = nil,
				name = "bm_menu_btn_choose_mask_mod",
				callback = callback(self, self, "choose_mask_type_callback")
			},
			mm_buy = {
				prio = 5,
				btn = "BTN_Y",
				pc_btn = Idstring("menu_modify_item"),
				name = "bm_menu_btn_customize_mask",
				callback = callback(self, self, "buy_customized_mask_callback")
			},
			mm_preview = {
				prio = 4,
				btn = "BTN_STICK_R",
				pc_btn = Idstring("menu_preview_item"),
				name = "bm_menu_btn_preview_mask",
				callback = callback(self, self, "preview_customized_mask_callback")
			},
			mp_choose = {
				prio = 1,
				btn = "BTN_A",
				pc_btn = nil,
				name = "bm_menu_btn_choose_mask_mod",
				callback = callback(self, self, "choose_mask_part_callback")
			},
			mp_preview = {
				prio = 2,
				btn = "BTN_STICK_R",
				pc_btn = Idstring("menu_preview_item"),
				name = "bm_menu_btn_preview_mask",
				callback = callback(self, self, "preview_customized_mask_callback")
			},
			mp_preview_mod = {
				prio = 2,
				btn = "BTN_STICK_R",
				pc_btn = Idstring("menu_preview_item"),
				name = "bm_menu_btn_preview_mask",
				callback = callback(self, self, "preview_customized_mask_with_mod_callback")
			},
			bm_buy = {
				prio = 1,
				btn = "BTN_A",
				pc_btn = nil,
				name = "bm_menu_btn_buy_selected_mask",
				callback = callback(self, self, "buy_mask_callback")
			},
			bm_preview = {
				prio = 2,
				btn = "BTN_STICK_R",
				pc_btn = Idstring("menu_preview_item"),
				name = "bm_menu_btn_preview_mask",
				callback = callback(self, self, "preview_buy_mask_callback")
			},
			bm_sell = {
				prio = 4,
				btn = "BTN_X",
				pc_btn = Idstring("menu_remove_item"),
				name = "bm_menu_btn_sell_mask",
				callback = callback(self, self, "sell_stashed_mask_callback")
			},
			c_equip = {
				prio = 1,
				btn = "BTN_A",
				pc_btn = nil,
				name = "bm_menu_btn_set_preferred",
				callback = callback(self, self, "set_preferred_character_callback")
			},
			lo_w_equip = {
				prio = 1,
				btn = "BTN_A",
				pc_btn = nil,
				name = "bm_menu_btn_equip_weapon",
				callback = callback(self, self, "equip_weapon_callback")
			},
			lo_d_equip = {
				prio = 1,
				btn = "BTN_A",
				pc_btn = nil,
				name = "bm_menu_btn_equip_deployable",
				callback = callback(self, self, "lo_equip_deployable_callback")
			},
			back_btn = {
				prio = 99,
				btn = "BTN_B",
				no_btn = true,
				legends = {
					"menu_legend_preview_move",
					"menu_legend_back"
				}
			}
		}
		local get_real_font_sizes = false
		local real_small_font_size = small_font_size
		if get_real_font_sizes then
			local test_text = self._panel:text({
				font = small_font,
				font_size = small_font_size,
				text = "TeWqjI-" .. managers.localization:get_default_macro("BTN_BOTTOM_L"),
				visible = false
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
				font = medium_font,
				font_size = medium_font_size,
				text = "TeWqjI-" .. managers.localization:get_default_macro("BTN_BOTTOM_L"),
				visible = false
			})
			local x, y, w, h = test_text:text_rect()
			real_medium_font_size = h
			Global.test_text = test_text
		end
		self._real_medium_font_size = real_medium_font_size
		self._visibility_panel = self._panel:panel({
			name = "visibility_panel"
		})
		self._visibility_panel:set_w(info_box_panel:w())
		self._visibility_panel:set_h(self._real_small_font_size * 2)
		self._visibility_panel:set_leftbottom(info_box_panel:position())
		local custom_data = {}
		if self._data.open_callback_params then
			custom_data[self._data.open_callback_params.category] = managers.blackmarket:get_crafted_category_slot(self._data.open_callback_params.category, self._data.open_callback_params.slot)
		end
		local suspicion_index = managers.blackmarket:get_real_concealment_index_from_custom_data(custom_data)
		suspicion_index = math.clamp(suspicion_index, 1, #tweak_data.weapon.stats.concealment)
		local visibility_index = 1
		local visibility_id = ""
		local visibility_position = 0
		local min_index = 0
		for i, visibility in ipairs(tweak_data.gui.suspicion_to_visibility) do
			if suspicion_index <= visibility.max_index then
				visibility_index = i
				visibility_id = visibility.name_id
				local a = visibility.max_index - min_index
				local b = suspicion_index - min_index
				visibility_position = b / a
				break
			end
			min_index = visibility.max_index - 1
		end
		local visibility_text = self._visibility_panel:text({
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			text = managers.localization:to_upper_text("bm_menu_concealment")
		})
		self:make_fine_text(visibility_text)
		visibility_text:set_left(0)
		visibility_text:set_bottom(self._visibility_panel:h())
		local profile_text
		local largest_profile_w = 0
		for i, visibility in ipairs(tweak_data.gui.suspicion_to_visibility) do
			local new_profile_text = self._visibility_panel:text({
				font = tweak_data.menu.pd2_small_font,
				font_size = tweak_data.menu.pd2_small_font_size,
				text = managers.localization:to_upper_text(visibility.name_id),
				visible = false
			})
			self:make_fine_text(new_profile_text)
			new_profile_text:set_right(self._visibility_panel:w())
			new_profile_text:set_bottom(visibility_text:bottom())
			largest_profile_w = math.max(largest_profile_w, new_profile_text:w())
			if i == visibility_index then
				profile_text = new_profile_text
				profile_text:show()
			end
		end
		local visibility_desc_text = self._visibility_panel:text({
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			text = managers.localization:text("bm_menu_concealment_desc"),
			rotation = 360
		})
		self:make_fine_text(visibility_desc_text)
		visibility_desc_text:set_top(0)
		visibility_desc_text:set_right(self._visibility_panel:w())
		visibility_desc_text:hide()
		local visibility_bar_panel = self._visibility_panel:panel({name = "bar"})
		visibility_bar_panel:grow(-(visibility_text:w() + largest_profile_w + 8), -(visibility_desc_text:h() + 4))
		visibility_bar_panel:set_left(visibility_text:right() + 4)
		visibility_bar_panel:set_bottom(visibility_text:bottom() - 3)
		local num_bars = #tweak_data.gui.suspicion_to_visibility
		local bar_w = (visibility_bar_panel:w() - (num_bars - 1) * 2) / num_bars
		local visibility_white_color = Color(255, 134, 155, 179) / 255
		local visibility_black_color = Color(255, 40, 43, 49) / 255
		for i = 1, num_bars do
			local color = visibility_black_color
			if visibility_index >= i then
				color = visibility_white_color
			end
			local bar = visibility_bar_panel:gradient({
				name = tostring(i),
				color = color,
				blend_mode = "add",
				alpha = 0.5,
				layer = 1,
				w = bar_w,
				x = (i - 1) * (bar_w + 2)
			})
			bar:set_gradient_points({
				0,
				color,
				1,
				color
			})
			bar:grow(-2, -2)
			bar:move(1, 1)
			visibility_bar_panel:rect({
				color = color,
				blend_mode = "add",
				alpha = 1,
				layer = 0,
				w = bar_w,
				h = 1,
				x = (i - 1) * (bar_w + 2)
			})
			visibility_bar_panel:rect({
				color = color,
				blend_mode = "add",
				alpha = 1,
				layer = 0,
				w = bar_w,
				h = 1,
				x = (i - 1) * (bar_w + 2),
				y = visibility_bar_panel:h() - 1
			})
			visibility_bar_panel:rect({
				color = color,
				blend_mode = "add",
				alpha = 1,
				layer = 0,
				w = 1,
				h = visibility_bar_panel:h() - 2,
				x = (i - 1) * (bar_w + 2),
				y = 1
			})
			visibility_bar_panel:rect({
				color = color,
				blend_mode = "add",
				alpha = 1,
				layer = 0,
				w = 1,
				h = visibility_bar_panel:h() - 2,
				x = (i - 1) * (bar_w + 2) + bar_w - 1,
				y = 1
			})
		end
		local current_visibility_bar = visibility_bar_panel:child(tostring(visibility_index))
		local visiblity_line = visibility_bar_panel:rect({
			name = "line",
			color = Color.white,
			alpha = 1,
			w = 2,
			h = visibility_bar_panel:h(),
			y = 0,
			blend_mode = "add",
			layer = 2
		})
		visiblity_line:set_center_x(current_visibility_bar:left() + current_visibility_bar:w() * visibility_position)
		current_visibility_bar:set_gradient_points({
			0,
			visibility_white_color,
			visibility_position,
			visibility_white_color,
			visibility_position,
			visibility_black_color,
			1,
			visibility_black_color
		})
		self._visibility_diff_bar = visibility_bar_panel:panel({w = 0})
		self._visibility_diff_bar:rect({
			color = Color.white,
			blend_mode = "add",
			alpha = 0.25,
			layer = 2,
			halign = "grow",
			valign = "grow"
		})
		self._visibility_diff_bar:set_right(visiblity_line:center_x())
		self._btn_panel = self._panel:panel({
			name = "btn_panel",
			w = info_box_panel:w() - 4,
			h = 100
		})
		self._btn_panel:set_rightbottom(self._panel:w() - 2, info_box_panel:bottom() - 2)
		local btn_x = 10
		for btn, btn_data in pairs(BTNS) do
			local new_btn = BlackMarketGuiButtonItem:new(self._btn_panel, btn_data, btn_x)
			self._btns[btn] = new_btn
		end
		local h = real_small_font_size
		local longest_text_w = 0
		if self._data.info_callback then
			self._info_panel = self._panel:panel({
				name = "info_panel",
				layer = 1,
				w = self._btn_panel:w()
			})
			local info_table = self._data.info_callback()
			for i, info in ipairs(info_table) do
				local info_name = info.name or ""
				local info_string = info.text or ""
				local info_color = info.color or tweak_data.screen_colors.text
				local category_text = self._info_panel:text({
					name = "category_" .. tostring(i),
					y = (i - 1) * h,
					w = 0,
					h = h,
					font_size = h,
					font = small_font,
					layer = 1,
					color = tweak_data.screen_colors.text,
					text = utf8.to_upper(managers.localization:text("bm_menu_" .. tostring(info_name)))
				})
				local status_text = self._info_panel:text({
					name = "status_" .. tostring(i),
					y = (i - 1) * h,
					w = 0,
					h = h,
					font_size = h,
					font = small_font,
					layer = 1,
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
			self._comparision_panel = self._panel:panel({
				name = "compariaion_panel",
				layer = 1,
				w = self._btn_panel:w()
			})
			self._stats_shown = {
				"damage",
				"spread",
				"spread_moving",
				"concealment",
				"suppression",
				"recoil"
			}
			self._comparision_bitmaps = {}
			for i, stat in ipairs(self._stats_shown) do
				local y = (i - 1) * h
				local stats_w = self._comparision_panel:w() / 2 - 16
				local text = self._comparision_panel:text({
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
				local bg = self._comparision_panel:rect({
					y = y,
					w = stats_w,
					h = h - 6,
					layer = 0,
					color = Color(0.25, 0, 0, 0),
					blend_mode = "normal"
				})
				local base = self._comparision_panel:rect({
					y = y,
					w = 0,
					h = h - 6,
					layer = 1,
					color = Color(1, 1, 1, 1),
					blend_mode = "normal"
				})
				local neg = self._comparision_panel:rect({
					y = y,
					w = 0,
					h = h - 6,
					layer = 2,
					color = Color(1, 0, 0, 0),
					blend_mode = "normal"
				})
				local pos = self._comparision_panel:rect({
					y = y,
					w = 0,
					h = h - 6,
					layer = 2,
					color = Color(1, 0.5, 0.5, 0.5),
					blend_mode = "normal"
				})
				local plus = self._comparision_panel:bitmap({
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
				local minus = self._comparision_panel:bitmap({
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
				local end_line = self._comparision_panel:rect({
					y = y,
					w = 2,
					h = h - 6,
					layer = 3,
					color = Color(1, 1, 1, 1),
					blend_mode = "normal"
				})
				local mid_line = self._comparision_panel:rect({
					y = y,
					w = 2,
					h = h - 6,
					layer = 3,
					color = Color(1, 1, 1, 1),
					blend_mode = "normal"
				})
				bg:set_right(self._comparision_panel:w() - 16)
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
			self._comparision_panel:hide()
		end
		self._info_texts = {}
		self._info_texts_panel = self._panel:panel({
			x = info_box_panel:x() + 10,
			y = info_box_panel:y() + 10,
			w = info_box_panel:w() - 20,
			h = info_box_panel:h() - 20 - real_small_font_size * 3
		})
		table.insert(self._info_texts, self._info_texts_panel:text({
			name = "info_text_1",
			font_size = small_font_size,
			font = small_font,
			layer = 1,
			color = tweak_data.screen_colors.text,
			text = "",
			wrap = true,
			word_wrap = true
		}))
		table.insert(self._info_texts, self._info_texts_panel:text({
			name = "info_text_2",
			font_size = small_font_size,
			font = small_font,
			layer = 1,
			color = tweak_data.screen_colors.important_1,
			text = "",
			wrap = true,
			word_wrap = true,
			blend_mode = "add"
		}))
		table.insert(self._info_texts, self._info_texts_panel:text({
			name = "info_text_3",
			font_size = small_font_size,
			font = small_font,
			layer = 1,
			color = tweak_data.screen_colors.text,
			text = "",
			wrap = true,
			word_wrap = true
		}))
		if self._comparision_panel then
			self._comparision_panel:set_h((self._stats_shown and #self._stats_shown or 4) * h)
			self._comparision_panel:set_rightbottom(self._panel:w() - 2, info_box_panel:bottom() - 10 - real_small_font_size * 5 - 5)
		end
		if self._info_panel then
			self._info_panel:set_size(info_box_panel:w() - 20, self._info_panel:num_children() / 2 * h)
			self._info_panel:set_rightbottom(self._panel:w() - 10, self._btn_panel:top() - 10)
		end
		local tab_x = 0
		if not managers.menu:is_pc_controller() and #self._tabs > 1 then
			local prev_page = self._panel:text({
				name = "prev_page",
				y = 0,
				font_size = medium_font_size,
				font = medium_font,
				layer = 2,
				color = tweak_data.screen_colors.text,
				text = managers.localization:get_default_macro("BTN_BOTTOM_L")
			})
			local _, _, w, h = prev_page:text_rect()
			prev_page:set_w(w)
			prev_page:set_top(top_padding)
			prev_page:set_left(tab_x)
			prev_page:set_visible(self._selected > 1)
			self._tab_scroll_panel:move(w + 15, 0)
			self._tab_scroll_panel:grow(-(w + 15), 0)
		end
		for _, tab in ipairs(self._tabs) do
			tab_x = tab:set_tab_position(tab_x)
		end
		if not managers.menu:is_pc_controller() and #self._tabs > 1 then
			local next_page = self._panel:text({
				name = "next_page",
				y = 0,
				font_size = medium_font_size,
				font = medium_font,
				layer = 2,
				color = tweak_data.screen_colors.text,
				text = managers.localization:get_default_macro("BTN_BOTTOM_R")
			})
			local _, _, w, h = next_page:text_rect()
			next_page:set_size(w, h)
			next_page:set_top(top_padding)
			next_page:set_right(grid_panel_w)
			next_page:set_visible(self._selected < #self._tabs)
			self._tab_scroll_panel:grow(-(w + 15), 0)
		end
		if managers.menu:is_pc_controller() and self._tab_scroll_table[#self._tab_scroll_table]:right() > self._tab_scroll_table.panel:w() then
			local prev_page = self._panel:text({
				name = "prev_page",
				y = 0,
				w = 0,
				font_size = medium_font_size,
				font = medium_font,
				layer = 2,
				color = tweak_data.screen_colors.button_stage_3,
				text = "<",
				align = "center"
			})
			local _, _, w, h = prev_page:text_rect()
			prev_page:set_size(w, h)
			prev_page:set_top(top_padding)
			prev_page:set_left(0)
			prev_page:set_text(" ")
			self._tab_scroll_panel:move(w + 15, 0)
			self._tab_scroll_panel:grow(-(w + 15), 0)
			local next_page = self._panel:text({
				name = "next_page",
				y = 0,
				w = 0,
				font_size = medium_font_size,
				font = medium_font,
				layer = 2,
				color = tweak_data.screen_colors.button_stage_3,
				text = ">",
				align = "center"
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
			text = self._title_text:text(),
			h = 90,
			align = "left",
			vertical = "top",
			font_size = massive_font_size,
			font = massive_font,
			color = tweak_data.screen_colors.button_stage_3,
			alpha = 0.4
		})
		local x, y = managers.gui_data:safe_to_full_16_9(self._title_text:world_x(), self._title_text:world_center_y())
		bg_text:set_world_left(x)
		bg_text:set_world_center_y(y)
		bg_text:move(-13, 9)
		MenuBackdropGUI.animate_bg_text(self, bg_text)
		if managers.menu:is_pc_controller() then
			local bg_back = self._fullscreen_panel:text({
				name = "back_button",
				text = utf8.to_upper(managers.localization:text("menu_back")),
				h = 90,
				align = "right",
				vertical = "bottom",
				font_size = massive_font_size,
				font = massive_font,
				color = tweak_data.screen_colors.button_stage_3,
				alpha = 0.4,
				layer = 0
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
	local black_rect = self._fullscreen_panel:rect({
		color = Color(0.4, 0, 0, 0),
		layer = 1
	})
	if is_start_page then
		local new_givens = managers.blackmarket:fetch_new_items_unlocked()
		local params = {}
		params.sound_event = "stinger_new_weapon"
		for _, unlocked_item in ipairs(new_givens) do
			params.category = unlocked_item[1]
			if params.category == "primaries" or params.category == "secondaries" then
				params.value = managers.weapon_factory:get_weapon_name_by_factory_id(unlocked_item[2])
			else
				params.value = unlocked_item[2]
			end
			params.data = unlocked_item
			managers.menu:show_new_item_gained(params)
		end
	end
	self:set_tab_positions()
	self:_round_everything()
end

function BlackMarketGui:get_weapon_ammo_info(weapon_id, comparision_data)
	local weapon_tweak_data = tweak_data.weapon[weapon_id]
	local ammo_max_multiplier = managers.player:upgrade_value("player", "extra_ammo_multiplier", 1)
	ammo_max_multiplier = ammo_max_multiplier * managers.player:upgrade_value(weapon_tweak_data.category, "extra_ammo_multiplier", 1)
	
	local function get_ammo_max_per_clip(weapon_id)
		local function upgrade_blocked(category, upgrade)
			if not weapon_tweak_data.upgrade_blocks then
				return false
			end
			if not weapon_tweak_data.upgrade_blocks[category] then
				return false
			end
			return table.contains(weapon_tweak_data.upgrade_blocks[category], upgrade)
		end
		
		local ammo = weapon_tweak_data.CLIP_AMMO_MAX
		ammo = ammo + managers.player:upgrade_value(weapon_id, "clip_ammo_increase")
		if not upgrade_blocked("weapon", "clip_ammo_increase") then
			ammo = ammo + managers.player:upgrade_value("weapon", "clip_ammo_increase", 0)
		end
		ammo = ammo + (comparision_data and comparision_data.extra_ammo and tweak_data.weapon.stats.extra_ammo[comparision_data.extra_ammo] or 0)
		return ammo
	end
	
	local ammo_max_per_clip = get_ammo_max_per_clip(weapon_id)
	local ammo_max = math.round((tweak_data.weapon[weapon_id].AMMO_MAX + managers.player:upgrade_value(weapon_id, "clip_amount_increase") * ammo_max_per_clip) * ammo_max_multiplier)
	return ammo_max_per_clip, ammo_max
end

function BlackMarketGui:update_info_text()
	local slot_data = self._slot_data
	local tab_data = self._tabs[self._selected]._data
	local prev_data = tab_data.prev_node_data
	local ids_category = Idstring(slot_data.category)
	local identifier = tab_data.identifier
	local updated_texts = {
		{text = ""},
		{text = ""},
		{text = ""}
	}
	if identifier == self.identifiers.weapon then
		local price = slot_data.price or 0
		if not slot_data.empty_slot then
			updated_texts[1].text = slot_data.name_localized
			if 0 < price then
				updated_texts[1].text = updated_texts[1].text .. "\n" .. "##" .. managers.localization:to_upper_text(slot_data.not_moddable and "st_menu_cost" or "st_menu_value") .. " " .. managers.experience:cash_string(price) .. "##"
				updated_texts[1].resource_color = slot_data.can_afford and tweak_data.screen_colors.resource or tweak_data.screen_colors.important_1
			end
			local clip_ammo, max_ammo = self:get_weapon_ammo_info(slot_data.name, slot_data.comparision_data)
			local ammo_id = "bm_menu_ammo_capacity"
			if slot_data.name == "saw" then
				ammo_id = "bm_menu_saw_ammo_capacity"
				max_ammo = math.max(math.floor(max_ammo / clip_ammo), 0)
			end
			updated_texts[3].text = managers.localization:text(ammo_id, {clip = clip_ammo, max = max_ammo})
			updated_texts[3].resource_color = tweak_data.screen_colors.text
			updated_texts[3].text = updated_texts[3].text .. " " .. managers.localization:text(tweak_data.weapon[slot_data.name].desc_id)
			if not self._slot_data.unlocked then
				updated_texts[2].text = utf8.to_upper(managers.localization:text(slot_data.level == 0 and (slot_data.skill_name or "bm_menu_skilltree_locked") or "bm_menu_level_req", {
					level = slot_data.level,
					SKILL = slot_data.name_localized
				}))
				updated_texts[2].text = updated_texts[2].text .. "\n"
			elseif self._slot_data.can_afford == false then
			end
			if slot_data.last_weapon then
				updated_texts[2].text = updated_texts[2].text .. managers.localization:text("bm_menu_last_weapon_warning")
			end
			if not slot_data.not_moddable then
				local equipped_mods = deep_clone(managers.blackmarket:get_weapon_blueprint(slot_data.category, slot_data.slot))
				local factory_id = managers.weapon_factory:get_factory_id_by_weapon_id(slot_data.name)
				local default_blueprint = managers.weapon_factory:get_default_blueprint_by_factory_id(factory_id)
				for _, default_part in ipairs(default_blueprint) do
					table.delete(equipped_mods, default_part)
				end
				local weapon_factory_tweak_data = tweak_data.weapon.factory.parts
				local mods = {}
				local gadget
				for _, mod in ipairs(equipped_mods) do
					if weapon_factory_tweak_data[mod] then
						if weapon_factory_tweak_data[mod].type == "gadget" then
							gadget = weapon_factory_tweak_data[mod].name_id
						else
							table.insert(mods, "bm_menu_" .. weapon_factory_tweak_data[mod].type)
						end
					end
				end
				if gadget then
					table.insert(mods, gadget)
				end
				local list_of_mods = ""
				local modded = true
				if 1 < #mods then
					for i = 1, #mods do
						list_of_mods = list_of_mods .. utf8.to_lower(managers.localization:text(mods[i]))
						if i < #mods - 1 then
							list_of_mods = list_of_mods .. ", "
						elseif i == #mods - 1 then
							list_of_mods = list_of_mods .. " " .. managers.localization:text("bm_menu_last_of_kind") .. " "
						end
					end
				elseif #mods == 1 then
					list_of_mods = string.lower(managers.localization:text(mods[1]))
				else
					modded = false
				end
				if modded then
					updated_texts[3].text = updated_texts[3].text .. " " .. managers.localization:text("bm_menu_weapon_info_modded", {list_of_mods = list_of_mods})
				end
			end
		elseif not slot_data.is_loadout then
			local prefix = ""
			if not managers.menu:is_pc_controller() then
				prefix = managers.localization:get_default_macro("BTN_A")
			end
			updated_texts[1].text = prefix .. managers.localization:to_upper_text("bm_menu_btn_buy_new_weapon")
			updated_texts[3].text = managers.localization:text("bm_menu_empty_weapon_slot_buy_info")
		end
		if slot_data.unlocked and not slot_data.empty_slot then
			local weapon
			if slot_data.not_moddable then
				local weapon_id = slot_data.name
				local factory_id = managers.weapon_factory:get_factory_id_by_weapon_id(weapon_id)
				local blueprint = managers.weapon_factory:get_default_blueprint_by_factory_id(factory_id)
				weapon = {
					weapon_id = weapon_id,
					factory_id = factory_id,
					blueprint = blueprint
				}
			else
				weapon = managers.blackmarket:get_crafted_category_slot(slot_data.category, slot_data.slot)
			end
			local suspicion_index = managers.blackmarket:get_real_concealment_index_of_local_player()
			local new_suspicion_index = suspicion_index - (managers.blackmarket:calculate_weapon_concealment(slot_data.category) - managers.blackmarket:calculate_weapon_concealment(weapon))
			new_suspicion_index = math.clamp(new_suspicion_index, 1, #tweak_data.weapon.stats.concealment)
			local visibility_index = 1
			local visibility_id = ""
			local visibility_position = 0
			local min_index = 0
			for i, visibility in ipairs(tweak_data.gui.suspicion_to_visibility) do
				if new_suspicion_index <= visibility.max_index then
					visibility_index = i
					visibility_id = visibility.name_id
					local a = visibility.max_index - min_index
					local b = new_suspicion_index - min_index
					visibility_position = b / a
					break
				end
				min_index = visibility.max_index - 1
			end
			local visiblity_line = self._visibility_panel:child("bar"):child("line")
			local current_visibility_bar = self._visibility_panel:child("bar"):child(tostring(visibility_index))
			self._visibility_diff_bar:set_w(math.round(visiblity_line:center_x() - (current_visibility_bar:left() + current_visibility_bar:w() * visibility_position)))
			self._visibility_diff_bar:set_right(visiblity_line:center_x())
		else
			local visiblity_line = self._visibility_panel:child("bar"):child("line")
			self._visibility_diff_bar:set_w(0)
			self._visibility_diff_bar:set_right(visiblity_line:center_x())
		end
	elseif identifier == self.identifiers.armor then
		updated_texts[1].text = self._slot_data.name_localized
		updated_texts[3].text = managers.localization:text(tweak_data.blackmarket.armors[slot_data.name].desc_id)
		if not self._slot_data.unlocked then
			updated_texts[2].text = utf8.to_upper(managers.localization:text(slot_data.level == 0 and (slot_data.skill_name or "bm_menu_skilltree_locked") or "bm_menu_level_req", {
				level = slot_data.level,
				SKILL = slot_data.name
			}))
			local visiblity_line = self._visibility_panel:child("bar"):child("line")
			self._visibility_diff_bar:set_w(0)
			self._visibility_diff_bar:set_right(visiblity_line:center_x())
		else
			local suspicion_index = managers.blackmarket:get_real_concealment_index_of_local_player()
			local new_suspicion_index = suspicion_index - (managers.blackmarket:calculate_armor_concealment() - managers.blackmarket:calculate_armor_concealment(slot_data.name))
			new_suspicion_index = math.clamp(new_suspicion_index, 1, #tweak_data.weapon.stats.concealment)
			local visibility_index = 1
			local visibility_id = ""
			local visibility_position = 0
			local min_index = 0
			for i, visibility in ipairs(tweak_data.gui.suspicion_to_visibility) do
				if new_suspicion_index <= visibility.max_index then
					visibility_index = i
					visibility_id = visibility.name_id
					local a = visibility.max_index - min_index
					local b = new_suspicion_index - min_index
					visibility_position = b / a
					break
				end
				min_index = visibility.max_index - 1
			end
			local visiblity_line = self._visibility_panel:child("bar"):child("line")
			local current_visibility_bar = self._visibility_panel:child("bar"):child(tostring(visibility_index))
			self._visibility_diff_bar:set_w(math.round(visiblity_line:center_x() - (current_visibility_bar:left() + current_visibility_bar:w() * visibility_position)))
			self._visibility_diff_bar:set_right(visiblity_line:center_x())
		end
	elseif identifier == self.identifiers.mask then
		local price = slot_data.price
		if not price then
			if type(slot_data.unlocked) ~= "number" then
				price = managers.money:get_mask_slot_sell_value(slot_data.slot)
			else
				price = managers.money:get_mask_sell_value(slot_data.name, slot_data.global_value)
			end
		end
		if not slot_data.empty_slot then
			updated_texts[1].text = slot_data.name_localized
			local resource_colors = {}
			if 0 <= price and slot_data.slot ~= 1 then
				updated_texts[1].text = updated_texts[1].text .. "\n" .. "##" .. managers.localization:to_upper_text("st_menu_value") .. " " .. managers.experience:cash_string(price) .. "##"
				table.insert(resource_colors, slot_data.can_afford ~= false and tweak_data.screen_colors.resource or tweak_data.screen_colors.important_1)
			end
			if slot_data.num_backs then
				updated_texts[1].text = updated_texts[1].text .. "   " .. "##" .. managers.localization:to_upper_text("bm_menu_item_amount", {
					amount = math.abs(slot_data.unlocked)
				}) .. "##"
				table.insert(resource_colors, math.abs(slot_data.unlocked) >= 5 and tweak_data.screen_colors.resource or 0 < math.abs(slot_data.unlocked) and Color(1, 0.9, 0.9, 0.3) or tweak_data.screen_colors.important_1)
			end
			if #resource_colors == 1 then
				updated_texts[1].resource_color = resource_colors[1]
			else
				updated_texts[1].resource_color = resource_colors
			end
			if slot_data.dlc_locked then
				updated_texts[2].text = managers.localization:to_upper_text(slot_data.dlc_locked)
			end
			local mask_id = slot_data.name
			if mask_id then
				local desc_id = tweak_data.blackmarket.masks[mask_id].desc_id
				updated_texts[3].text = desc_id and managers.localization:text(desc_id) or Application:production_build() and "Add ##desc_id## to ##" .. mask_id .. "## in tweak_data.blackmarket.masks" or ""
				if slot_data.global_value and slot_data.global_value ~= "normal" then
					updated_texts[3].text = updated_texts[3].text .. [[

##]] .. managers.localization:to_upper_text(tweak_data.lootdrop.global_values[slot_data.global_value].desc_id) .. "##"
					updated_texts[3].resource_color = tweak_data.lootdrop.global_values[slot_data.global_value].color
				end
				if Application:production_build() and not desc_id then
					updated_texts[3].resource_color = Color.red
				end
			end
		else
			if slot_data.cannot_buy then
				updated_texts[1].text = managers.localization:to_upper_text("bm_menu_empty_mask_slot")
				updated_texts[2].text = managers.localization:to_upper_text("bm_menu_no_masks_in_stash_varning")
			else
				local prefix = ""
				if not managers.menu:is_pc_controller() then
					prefix = managers.localization:get_default_macro("BTN_A")
				end
				updated_texts[1].text = prefix .. managers.localization:to_upper_text("bm_menu_btn_buy_new_mask")
			end
			updated_texts[3].text = managers.localization:text("bm_menu_empty_mask_slot_buy_info")
		end
	elseif identifier == self.identifiers.weapon_mod then
		local price = slot_data.price or managers.money:get_weapon_modify_price(prev_data.name, slot_data.name, slot_data.global_value)
		updated_texts[1].text = slot_data.name_localized
		local resource_colors = {}
		if 0 < price then
			updated_texts[1].text = updated_texts[1].text .. "\n" .. "##" .. managers.localization:to_upper_text("st_menu_cost") .. " " .. managers.experience:cash_string(price) .. "##"
			table.insert(resource_colors, slot_data.can_afford and tweak_data.screen_colors.resource or tweak_data.screen_colors.important_1)
		else
			updated_texts[1].text = updated_texts[1].text .. "\n"
		end
		local unlocked = slot_data.unlocked and slot_data.unlocked ~= true and slot_data.unlocked or 0
		updated_texts[1].text = updated_texts[1].text .. (0 < price and "   " or "") .. "##" .. managers.localization:to_upper_text("bm_menu_item_amount", {
			amount = tostring(math.abs(unlocked))
		}) .. "##"
		table.insert(resource_colors, math.abs(unlocked) >= 5 and tweak_data.screen_colors.resource or 0 < math.abs(unlocked) and Color(1, 0.9, 0.9, 0.3) or tweak_data.screen_colors.important_1)
		if #resource_colors == 1 then
			updated_texts[1].resource_color = resource_colors[1]
		else
			updated_texts[1].resource_color = resource_colors
		end
		local can_not_afford = slot_data.can_afford == false
		local conflicted = unlocked < 0 and slot_data.conflict
		local out_of_item = slot_data.unlocked and slot_data.unlocked ~= true and slot_data.unlocked == 0
		if slot_data.dlc_locked then
			updated_texts[2].text = managers.localization:to_upper_text(slot_data.dlc_locked)
		elseif conflicted then
			updated_texts[2].text = managers.localization:text("bm_menu_conflict", {
				conflict = slot_data.conflict
			})
		end
		local part_id = slot_data.name
		if part_id then
			local desc_id = tweak_data.blackmarket.weapon_mods[part_id].desc_id
			updated_texts[3].text = desc_id and managers.localization:text(desc_id, {
				BTN_GADGET = managers.localization:btn_macro("weapon_gadget", true)
			}) or Application:production_build() and "Add ##desc_id## to ##" .. part_id .. "## in tweak_data.blackmarket.weapon_mods" or ""
		end
		if slot_data.global_value and slot_data.global_value ~= "normal" then
			updated_texts[3].text = updated_texts[3].text .. [[

##]] .. managers.localization:to_upper_text(tweak_data.lootdrop.global_values[slot_data.global_value].desc_id) .. "##"
			updated_texts[3].resource_color = tweak_data.lootdrop.global_values[slot_data.global_value].color
		end
		if (slot_data.equipped or slot_data.unlocked == true or slot_data.unlocked and slot_data.unlocked ~= 0) and not slot_data.empty_slot then
			local weapon = deep_clone(managers.blackmarket:get_crafted_category_slot(slot_data.category, slot_data.slot))
			if slot_data.equipped then
				if slot_data.default_mod then
					managers.weapon_factory:change_part_blueprint_only(weapon.factory_id, slot_data.default_mod, weapon.blueprint)
				else
					managers.weapon_factory:remove_part_from_blueprint(part_id, weapon.blueprint)
				end
			else
				managers.weapon_factory:change_part_blueprint_only(weapon.factory_id, part_id, weapon.blueprint)
			end
			local custom_data = {}
			custom_data[slot_data.category] = managers.blackmarket:get_crafted_category_slot(slot_data.category, slot_data.slot)
			local suspicion_index = managers.blackmarket:get_real_concealment_index_from_custom_data(custom_data)
			local new_suspicion_index = suspicion_index - (managers.blackmarket:calculate_weapon_concealment(custom_data[slot_data.category]) - managers.blackmarket:calculate_weapon_concealment(weapon))
			new_suspicion_index = math.clamp(new_suspicion_index, 1, #tweak_data.weapon.stats.concealment)
			local visibility_index = 1
			local visibility_id = ""
			local visibility_position = 0
			local min_index = 0
			for i, visibility in ipairs(tweak_data.gui.suspicion_to_visibility) do
				if new_suspicion_index <= visibility.max_index then
					visibility_index = i
					visibility_id = visibility.name_id
					local a = visibility.max_index - min_index
					local b = new_suspicion_index - min_index
					visibility_position = b / a
					break
				end
				min_index = visibility.max_index - 1
			end
			local visiblity_line = self._visibility_panel:child("bar"):child("line")
			local current_visibility_bar = self._visibility_panel:child("bar"):child(tostring(visibility_index))
			self._visibility_diff_bar:set_w(math.round(visiblity_line:center_x() - (current_visibility_bar:left() + current_visibility_bar:w() * visibility_position)))
			self._visibility_diff_bar:set_right(visiblity_line:center_x())
		else
			local visiblity_line = self._visibility_panel:child("bar"):child("line")
			self._visibility_diff_bar:set_w(0)
			self._visibility_diff_bar:set_right(visiblity_line:center_x())
		end
	elseif identifier == self.identifiers.mask_mod then
		if not managers.blackmarket:currently_customizing_mask() then
			return
		end
		local mask_mod_info = managers.blackmarket:info_customize_mask()
		updated_texts[1].text = "MASK CUSTOMIZATION" .. "\n"
		local material_text = managers.localization:to_upper_text("bm_menu_materials")
		local pattern_text = managers.localization:to_upper_text("bm_menu_textures")
		local colors_text = managers.localization:to_upper_text("bm_menu_colors")
		if mask_mod_info[1].overwritten then
			updated_texts[1].text = updated_texts[1].text .. material_text .. ": " .. "##" .. managers.localization:to_upper_text("menu_bm_overwritten") .. "##" .. "\n"
		elseif mask_mod_info[1].is_good then
			updated_texts[1].text = updated_texts[1].text .. material_text .. ": " .. managers.localization:text(mask_mod_info[1].text)
			if mask_mod_info[1].price and 0 < mask_mod_info[1].price then
				updated_texts[1].text = updated_texts[1].text .. " " .. managers.experience:cash_string(mask_mod_info[1].price)
			end
			updated_texts[1].text = updated_texts[1].text .. "\n"
		else
			updated_texts[1].text = updated_texts[1].text .. material_text .. ": " .. "##" .. managers.localization:to_upper_text("menu_bm_not_selected") .. "##" .. "\n"
		end
		if mask_mod_info[2].overwritten then
			updated_texts[1].text = updated_texts[1].text .. pattern_text .. ": " .. "##" .. managers.localization:to_upper_text("menu_bm_overwritten") .. "##" .. "\n"
		elseif mask_mod_info[2].is_good then
			updated_texts[1].text = updated_texts[1].text .. pattern_text .. ": " .. managers.localization:text(mask_mod_info[2].text)
			if mask_mod_info[2].price and 0 < mask_mod_info[2].price then
				updated_texts[1].text = updated_texts[1].text .. " " .. managers.experience:cash_string(mask_mod_info[2].price)
			end
			updated_texts[1].text = updated_texts[1].text .. "\n"
		else
			updated_texts[1].text = updated_texts[1].text .. pattern_text .. ": " .. "##" .. managers.localization:to_upper_text("menu_bm_not_selected") .. "##" .. "\n"
		end
		if mask_mod_info[3].overwritten then
			updated_texts[1].text = updated_texts[1].text .. colors_text .. ": " .. "##" .. managers.localization:to_upper_text("menu_bm_overwritten") .. "##" .. "\n"
		elseif mask_mod_info[3].is_good then
			updated_texts[1].text = updated_texts[1].text .. colors_text .. ": " .. managers.localization:text(mask_mod_info[3].text)
			if mask_mod_info[3].price and 0 < mask_mod_info[3].price then
				updated_texts[1].text = updated_texts[1].text .. " " .. managers.experience:cash_string(mask_mod_info[3].price)
			end
			updated_texts[1].text = updated_texts[1].text .. "\n"
		else
			updated_texts[1].text = updated_texts[1].text .. colors_text .. ": " .. "##" .. managers.localization:to_upper_text("menu_bm_not_selected") .. "##" .. "\n"
		end
		updated_texts[1].text = updated_texts[1].text .. "\n"
		local price, can_afford = managers.blackmarket:get_customize_mask_value()
		if slot_data.global_value then
			updated_texts[3].text = [[


]] .. managers.localization:to_upper_text("menu_bm_highlighted") .. "\n" .. slot_data.name_localized .. " " .. managers.experience:cash_string(managers.money:get_mask_part_price_modified(slot_data.category, slot_data.name, slot_data.global_value)) .. "\n"
			if slot_data.unlocked and slot_data.unlocked ~= true and slot_data.unlocked ~= 0 then
				updated_texts[3].text = updated_texts[3].text .. managers.localization:to_upper_text("bm_menu_item_amount", {
					amount = math.abs(slot_data.unlocked)
				}) .. "\n"
			end
			if slot_data.global_value and slot_data.global_value ~= "normal" then
				updated_texts[3].text = updated_texts[3].text .. [[

##]] .. managers.localization:to_upper_text(tweak_data.lootdrop.global_values[slot_data.global_value].desc_id) .. "##"
				updated_texts[3].resource_color = tweak_data.lootdrop.global_values[slot_data.global_value].color
			end
			if slot_data.dlc_locked then
				updated_texts[2].text = managers.localization:to_upper_text(slot_data.dlc_locked)
			end
		end
		if price and 0 < price then
			updated_texts[1].text = updated_texts[1].text .. managers.localization:to_upper_text("menu_bm_total_cost", {
				cost = (not can_afford and "##" or "") .. managers.experience:cash_string(price) .. (not can_afford and "##" or "")
			})
		end
		updated_texts[1].resource_color = tweak_data.screen_colors.important_1
		if not managers.blackmarket:can_finish_customize_mask() then
			local list_of_mods = ""
			local missed_mods = {}
			for _, data in ipairs(mask_mod_info) do
				if not data.is_good and not data.overwritten then
					table.insert(missed_mods, managers.localization:text(data.text))
				end
			end
			if 1 < #missed_mods then
				for i = 1, #missed_mods do
					list_of_mods = list_of_mods .. missed_mods[i]
					if i < #missed_mods - 1 then
						list_of_mods = list_of_mods .. ", "
					elseif i == #missed_mods - 1 then
						list_of_mods = list_of_mods .. managers.localization:text("bm_menu_last_of_kind")
					end
				end
			elseif #missed_mods == 1 then
				list_of_mods = missed_mods[1]
			end
			updated_texts[2].text = managers.localization:to_upper_text("bm_menu_missing_to_finalize_mask", {missed_mods = list_of_mods}) .. "\n"
		end
	elseif identifier == self.identifiers.deployable then
		updated_texts[1].text = slot_data.name_localized
		if not self._slot_data.unlocked then
			updated_texts[2].text = managers.localization:to_upper_text(slot_data.level == 0 and (slot_data.skill_name or "bm_menu_skilltree_locked") or "bm_menu_level_req", {
				level = slot_data.level,
				SKILL = slot_data.name
			})
			updated_texts[2].text = updated_texts[2].text .. "\n"
		end
		updated_texts[3].text = managers.localization:text(tweak_data.blackmarket.deployables[slot_data.name].desc_id, {
			BTN_INTERACT = managers.localization:btn_macro("interact", true),
			BTN_USE_ITEM = managers.localization:btn_macro("use_item", true)
		})
	elseif identifier == self.identifiers.character then
		updated_texts[1].text = slot_data.name_localized
		updated_texts[3].text = managers.localization:text(slot_data.name .. "_desc")
	end
	if self._desc_mini_icons then
		for _, gui_object in pairs(self._desc_mini_icons) do
			self._panel:remove(gui_object[1])
		end
	end
	self._desc_mini_icons = {}
	local desc_mini_icons = self._slot_data.desc_mini_icons
	local info_box_panel = self._panel:child("info_box_panel")
	if desc_mini_icons and 0 < table.size(desc_mini_icons) then
		for _, mini_icon in pairs(desc_mini_icons) do
			local new_icon = self._panel:bitmap({
				texture = mini_icon.texture,
				x = info_box_panel:left() + 10 + mini_icon.right,
				w = mini_icon.w or 32,
				h = mini_icon.h or 32
			})
			table.insert(self._desc_mini_icons, {new_icon, 1})
		end
		updated_texts[1].text = string.rep("     ", table.size(desc_mini_icons)) .. updated_texts[1].text
	else
	end
	if slot_data.lock_texture then
		local new_icon = self._panel:bitmap({
			texture = slot_data.lock_texture,
			x = info_box_panel:left() + 10,
			w = 20,
			h = 20,
			color = self._info_texts[2]:color(),
			blend_mode = "add"
		})
		updated_texts[2].text = "     " .. updated_texts[2].text
		table.insert(self._desc_mini_icons, {new_icon, 2})
	else
	end
	for id, _ in ipairs(self._info_texts) do
		self:set_info_text(id, updated_texts[id].text, updated_texts[id].resource_color)
	end
	local _, _, _, th = self._info_texts[1]:text_rect()
	self._info_texts[1]:set_h(th)
	local y = self._info_texts[1]:bottom()
	for i = 2, #self._info_texts do
		local info_text = self._info_texts[i]
		info_text:set_font_size(small_font_size)
		_, _, _, th = info_text:text_rect()
		info_text:set_y(y)
		info_text:set_h(th)
		local scale = 1
		if info_text:h() + y > self._info_texts_panel:h() then
			scale = self._info_texts_panel:h() / (info_text:h() + info_text:y())
		end
		info_text:set_font_size(small_font_size * scale)
		_, _, _, th = info_text:text_rect()
		info_text:set_h(th)
		y = info_text:bottom()
	end
	for _, desc_mini_icon in ipairs(self._desc_mini_icons) do
		desc_mini_icon[1]:set_world_top(self._info_texts[desc_mini_icon[2]]:world_top() + (1 - (desc_mini_icon[2] - 1) * 3))
	end
end

function BlackMarketGui:animate_text_bounce(bounce_panel)
	local dt = 0
	local bounce_dir_up = true
	local top = bounce_panel:top()
	local move = 0
	while true do
		dt = coroutine.yield()
		if bounce_dir_up then
		else
		end
		bounce_panel:move(0, move)
		if move == 0 then
			bounce_dir_up = not bounce_dir_up
		end
	end
end

function BlackMarketGui:set_info_text(id, new_string, resource_color)
	local info_text = self._info_texts[id]
	local text = new_string
	local start_ci, end_ci, first_ci
	if resource_color then
		local text_dissected = utf8.characters(text)
		local idsp = Idstring("#")
		start_ci = {}
		end_ci = {}
		first_ci = true
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
		if #start_ci ~= #end_ci then
		else
			for i = 1, #start_ci do
				start_ci[i] = start_ci[i] - ((i - 1) * 4 + 1)
				end_ci[i] = end_ci[i] - (i * 4 - 1)
			end
		end
		text = string.gsub(text, "##", "")
	end
	info_text:set_text(text)
	if resource_color then
		info_text:clear_range_color(1, utf8.len(text))
		if #start_ci ~= #end_ci then
			Application:error("BlackMarketGui: Not even amount of ##'s in :set_info_text() string!", id, #start_ci, #end_ci)
		else
			for i = 1, #start_ci do
				info_text:set_range_color(start_ci[i], end_ci[i], type(resource_color) == "table" and resource_color[i] or resource_color)
			end
		end
	end
end

function BlackMarketGui:_round_everything()
	if alive(self._panel) then
		for i, d in ipairs(self._panel:children()) do
			self:_rec_round_object(d)
		end
	end
	if alive(self._fullscreen_panel) then
		for i, d in ipairs(self._fullscreen_panel:children()) do
			self:_rec_round_object(d)
		end
	end
end

function BlackMarketGui:_rec_round_object(object)
	local x, y, w, h = object:shape()
	object:set_shape(math.round(x), math.round(y), math.round(w), math.round(h))
	if object.children then
		for i, d in ipairs(object:children()) do
			self:_rec_round_object(d)
		end
	end
end

function BlackMarketGui:mouse_moved(o, x, y)
	local inside_tab_scroll = self._tab_scroll_panel:inside(x, y)
	local update_select = false
	if not self._highlighted then
		update_select = true
	elseif not (not self._tabs[self._highlighted] or self._tabs[self._highlighted]:inside(x, y)) or not inside_tab_scroll then
		self._tabs[self._highlighted]:set_highlight(not self._pages, not self._pages)
		self._highlighted = nil
		update_select = true
	end
	if update_select then
		for i, tab in ipairs(self._tabs) do
			update_select = inside_tab_scroll and tab:inside(x, y)
			if update_select then
				self._highlighted = i
				self._tabs[self._highlighted]:set_highlight(self._selected ~= self._highlighted)
			end
		end
	end
	if self._panel:child("back_button"):inside(x, y) then
		if not self._back_button_highlighted then
			self._back_button_highlighted = true
			self._panel:child("back_button"):set_color(tweak_data.screen_colors.button_stage_2)
			managers.menu_component:post_event("highlight")
			return
		end
	elseif self._back_button_highlighted then
		self._back_button_highlighted = false
		self._panel:child("back_button"):set_color(tweak_data.screen_colors.button_stage_3)
	end
	update_select = false
	if not self._button_highlighted then
		update_select = true
	elseif self._btns[self._button_highlighted] and not self._btns[self._button_highlighted]:inside(x, y) then
		self._btns[self._button_highlighted]:set_highlight(false)
		self._button_highlighted = nil
		update_select = true
	end
	if update_select then
		for i, btn in pairs(self._btns) do
			if btn:visible() and btn:inside(x, y) then
				self._button_highlighted = i
				self._btns[self._button_highlighted]:set_highlight(true)
			end
		end
	end
	if self._tab_scroll_table.left and self._tab_scroll_table.left_klick then
		local color
		if self._tab_scroll_table.left:inside(x, y) then
			color = tweak_data.screen_colors.button_stage_2
		else
			color = tweak_data.screen_colors.button_stage_3
		end
		self._tab_scroll_table.left:set_color(color)
	end
	if self._tab_scroll_table.right and self._tab_scroll_table.right_klick then
		local color
		if self._tab_scroll_table.right:inside(x, y) then
			color = tweak_data.screen_colors.button_stage_2
		else
			color = tweak_data.screen_colors.button_stage_3
		end
		self._tab_scroll_table.right:set_color(color)
	end
end

function BlackMarketGui:mouse_pressed(button, x, y)
	if button == Idstring("mouse wheel down") then
		self:next_page(true)
		return
	elseif button == Idstring("mouse wheel up") then
		self:previous_page(true)
		return
	end
	if button ~= Idstring("0") then
		return
	end
	if self._panel:child("back_button"):inside(x, y) then
		managers.menu:back(true)
		return
	end
	if self._tab_scroll_table.left_klick and self._tab_scroll_table.left:inside(x, y) then
		self:previous_page()
		return
	end
	if self._tab_scroll_table.right_klick and self._tab_scroll_table.right:inside(x, y) then
		self:next_page()
		return
	end
	if self._selected_slot and self._selected_slot._equipped_rect then
		self._selected_slot._equipped_rect:set_alpha(1)
	end
	if self._tab_scroll_panel:inside(x, y) and self._tabs[self._highlighted] and self._tabs[self._highlighted]:inside(x, y) then
		if self._selected ~= self._highlighted then
			self:set_selected_tab(self._highlighted)
		end
		return
	elseif self._tabs[self._selected] then
		local selected_slot = self._tabs[self._selected]:mouse_pressed(button, x, y)
		self:on_slot_selected(selected_slot)
		if selected_slot then
			return
		end
	end
	if self._btns[self._button_highlighted] and self._btns[self._button_highlighted]:inside(x, y) then
		local data = self._btns[self._button_highlighted]._data
		if data.callback and (not self._button_press_delay or self._button_press_delay < TimerManager:main():time()) then
			managers.menu_component:post_event("menu_enter")
			data.callback(self._slot_data, self._data.topic_params)
			self._button_press_delay = TimerManager:main():time() + 0.2
		end
	end
	if self._selected_slot and self._selected_slot._equipped_rect then
		self._selected_slot._equipped_rect:set_alpha(0.6)
	end
end

function BlackMarketGui:mouse_released(o, button, x, y)
end

function BlackMarketGui:mouse_clicked(o, button, x, y)
	self._mouse_click_index = ((self._mouse_click_index or 0) + 1) % 2
	self._mouse_click = self._mouse_click or {}
	self._mouse_click[self._mouse_click_index] = {}
	self._mouse_click[self._mouse_click_index].button = button
	self._mouse_click[self._mouse_click_index].x = x
	self._mouse_click[self._mouse_click_index].y = y
	self._mouse_click[self._mouse_click_index].selected_slot = self._selected_slot
end

function BlackMarketGui:mouse_double_click(o, button, x, y)
	if not (self._mouse_click and self._mouse_click[0]) or not self._mouse_click[1] then
		return
	end
	if not self._slot_data or self._mouse_click[0].selected_slot ~= self._mouse_click[1].selected_slot then
		return
	end
	if not self._selected_slot._panel:inside(x, y) then
		return
	end
	if managers.system_menu and managers.system_menu:is_active() and not managers.system_menu:is_closing() then
		return
	end
	self:press_first_btn(button)
end

function BlackMarketGui:press_first_btn(button)
	local first_btn_callback
	local first_btn_prio = 999
	local first_btn_visible = false
	if button == Idstring("0") then
		if self._slot_data.double_click_btn then
			local btn = self._btns[self._slot_data.double_click_btn]
			if btn then
				first_btn_prio = btn._data.prio
				first_btn_callback = btn._data.callback
				first_btn_visible = btn:visible()
			end
		else
			for _, btn in pairs(self._btns) do
				if btn:visible() and first_btn_prio > btn._data.prio then
					first_btn_prio = btn._data.prio
					first_btn_callback = btn._data.callback
					first_btn_visible = btn:visible()
				end
				if btn:visible() and btn._data.prio == first_btn_prio then
					first_btn_prio = btn._data.prio
					first_btn_callback = btn._data.callback
					first_btn_visible = btn:visible()
				end
			end
		end
		if first_btn_visible and first_btn_callback then
			managers.menu_component:post_event("menu_enter")
			first_btn_callback(self._slot_data, self._data.topic_params)
			return true
		else
			self:flash()
		end
	elseif button == Idstring("1") then
	end
	return false
end

function BlackMarketGui:set_selected_tab(tab, no_sound)
	local selected_slot
	if self._tabs[self._selected] then
		selected_slot = self._tabs[self._selected]._slot_selected
		self._tabs[self._selected]:deselect(false)
	end
	if self._selected_slot then
		self._selected_slot:set_btn_text()
	end
	self._selected = tab
	self._node:parameters().menu_component_selected = self._selected
	self._tabs[self._selected]:select(false, no_sound)
	self._selected_slot = self._tabs[self._selected]:select_slot(selected_slot, true)
	self._slot_data = self._selected_slot._data
	local x, y = self._tabs[self._selected]:selected_slot_center()
	local grid_panel_w = self._panel:w() * WIDTH_MULTIPLIER
	local grid_panel_h = (self._panel:h() - (self._real_medium_font_size + 10) - 70) * GRID_H_MUL
	local square_w = grid_panel_w / 3
	local square_h = grid_panel_h / 3
	local slot_dim_x = self._tabs[self._selected].my_slots_dimensions[1]
	local slot_dim_y = self._tabs[self._selected].my_slots_dimensions[2]
	self._select_rect:set_size(square_w * 3 / slot_dim_x, square_h * 3 / slot_dim_y)
	self._select_rect_box:create_sides(self._select_rect, {
		sides = {
			2,
			2,
			2,
			2
		}
	})
	self._select_rect:set_world_center(x, y)
	self._select_rect:stop()
	self._select_rect_box:set_color(Color.white)
	self:show_btns(self._selected_slot)
	self:update_info_text()
	self:set_tab_positions()
	local visibility_visible = false
	if self._selected_slot then
		if self._selected_slot._equipped_rect then
			self._selected_slot._equipped_rect:set_alpha(0.6)
		end
		local slot_category = self._selected_slot._data.category
		visibility_visible = slot_category == "primaries" or slot_category == "secondaries" or slot_category == "armors"
	end
	self._visibility_panel:set_visible(visibility_visible)
	self:show_comparision()
end

function BlackMarketGui:set_tab_positions()
	local first_x = self._tab_scroll_table[1]:left()
	local diff_x = self._tab_scroll_table[self._selected]:left()
	if diff_x < 0 then
		local tab_x = first_x - diff_x
		for _, tab in ipairs(self._tabs) do
			tab_x = tab:set_tab_position(tab_x)
		end
	end
	diff_x = self._tab_scroll_table[self._selected]:right() - self._tab_scroll_table.panel:w()
	if 0 < diff_x then
		local tab_x = -(diff_x - first_x)
		for _, tab in ipairs(self._tabs) do
			tab_x = tab:set_tab_position(tab_x)
		end
	end
	if managers.menu:is_pc_controller() then
		if self._tab_scroll_table.left then
			if 1 < self._selected then
				self._tab_scroll_table.left_klick = true
				self._tab_scroll_table.left:set_text("<")
			else
				self._tab_scroll_table.left_klick = false
				self._tab_scroll_table.left:set_text(" ")
			end
		end
		if self._tab_scroll_table.right then
			if self._selected < #self._tab_scroll_table then
				self._tab_scroll_table.right_klick = true
				self._tab_scroll_table.right:set_text(">")
			else
				self._tab_scroll_table.right_klick = false
				self._tab_scroll_table.right:set_text(" ")
			end
		end
	else
		if alive(self._panel:child("prev_page")) then
			self._panel:child("prev_page"):set_visible(1 < self._selected)
		end
		if alive(self._panel:child("next_page")) then
			self._panel:child("next_page"):set_visible(self._selected < #self._tabs)
		end
	end
end

function BlackMarketGui:on_slot_selected(selected_slot)
	if selected_slot then
		local x, y = self._tabs[self._selected]:selected_slot_center()
		self._select_rect:set_world_center(x, y)
		self._select_rect:stop()
		self._select_rect_box:set_color(Color.white)
		if self._selected_slot then
			self._selected_slot:set_btn_text()
		end
		self._selected_slot = selected_slot
		self._slot_data = self._selected_slot._data
		self:show_btns(self._selected_slot)
	end
	self:update_info_text()
	local visibility_visible = false
	if self._selected_slot then
		if self._selected_slot._equipped_rect then
			self._selected_slot._equipped_rect:set_alpha(0.6)
		end
		local slot_category = self._selected_slot._data.category
		visibility_visible = slot_category == "primaries" or slot_category == "secondaries" or slot_category == "armors"
	end
	self._visibility_panel:set_visible(visibility_visible)
	self:show_comparision()
end

function BlackMarketGui:move(mx, my)
	if not self._tabs[self._selected] then
		return
	end
	local slot = self._tabs[self._selected]._slot_selected
	if not slot then
		return
	end
	local dim_x = self._tabs[self._selected].my_slots_dimensions[1]
	local dim_y = self._tabs[self._selected].my_slots_dimensions[2]
	local x = (slot - 1) % dim_x + 1
	local y = math.ceil(slot / dim_x)
	x = math.clamp(x + mx, 1, dim_x)
	y = math.clamp(y + my, 1, dim_y)
	local new_selected = x + (y - 1) * dim_x
	local slot = self._tabs[self._selected]:select_slot(new_selected, new_selected == slot)
	self:on_slot_selected(slot)
end

function BlackMarketGui:move_up()
	self:move(0, -1)
end

function BlackMarketGui:move_down()
	self:move(0, 1)
end

function BlackMarketGui:move_left()
	self:move(-1, 0)
end

function BlackMarketGui:move_right()
	self:move(1, 0)
end

function BlackMarketGui:next_page(no_sound)
	if self._pages then
		local old_selected = self._selected
		local s = math.min(self._selected + 1, #self._tabs)
		if old_selected == s then
			return
		end
		self:set_selected_tab(s, no_sound)
	else
		self:move(1, 0)
	end
end

function BlackMarketGui:previous_page(no_sound)
	if self._pages then
		local old_selected = self._selected
		local s = math.max(self._selected - 1, 1)
		if old_selected == s then
			return
		end
		self:set_selected_tab(s, no_sound)
	else
		self:move(-1, 0)
	end
end

function BlackMarketGui:press_pc_button(button)
	local btn = self._controllers_pc_mapping and self._controllers_pc_mapping[button:key()]
	if btn and btn._data and btn._data.callback and (not self._button_press_delay or self._button_press_delay < TimerManager:main():time()) then
		managers.menu_component:post_event("menu_enter")
		btn._data.callback(self._slot_data, self._data.topic_params)
		self._button_press_delay = TimerManager:main():time() + 0.2
		return true
	end
	return false
end

function BlackMarketGui:press_button(button)
	local btn = self._controllers_mapping and self._controllers_mapping[button:key()]
	if btn and btn._data and btn._data.callback then
		if not self._button_press_delay or self._button_press_delay < TimerManager:main():time() then
			managers.menu_component:post_event("menu_enter")
			btn._data.callback(self._slot_data, self._data.topic_params)
			self._button_press_delay = TimerManager:main():time() + 0.2
			return true
		end
	elseif self._select_rect_box then
		self:flash()
	end
	return false
end

function BlackMarketGui:flash()
	local box = self._select_rect_box
	
	local function flash_anim(panel)
		local b_color = Color.white
		local s = 0
		over(0.5, function(t)
			s = math.min(1, math.sin(t * 180) * 2)
			box:set_color(math.lerp(b_color, tweak_data.screen_colors.important_1, s))
		end)
		box:set_color(b_color)
	end
	
	managers.menu_component:post_event("selection_next", true)
	self._select_rect:animate(flash_anim)
end

function BlackMarketGui:confirm_pressed()
	if managers.menu:is_pc_controller() then
		return self:press_first_btn(Idstring("0"))
	else
		return self:press_button("BTN_A")
	end
end

function BlackMarketGui:special_btn_pressed(button)
	return self:press_pc_button(button)
end

function BlackMarketGui:input_focus()
	return #self._data > -1 and 1 or true
end

function BlackMarketGui:visible()
	return self._visible
end

function BlackMarketGui:show_comparision()
	if not self._comparision_panel then
		return
	end
	self._comparision_panel:hide()
	if not self._slot_data then
		return
	end
	if not self._slot_data.comparision_data then
		return
	end
	self._equipped_comparision_data = self._equipped_comparision_data or {}
	if not self._equipped_comparision_data[self._slot_data.category] then
		self._no_compare = true
		if self._tabs[self._selected] then
			for i, slot in ipairs(self._tabs[self._selected]:slots()) do
				if slot._data.equipped then
					self._equipped_comparision_data[slot._data.category] = slot._data.comparision_data
					self._no_compare = false
					break
				end
			end
		end
	end
	if self._no_compare then
		self._equipped_comparision_data[self._slot_data.category] = self._slot_data.comparision_data
	end
	if not self._equipped_comparision_data[self._slot_data.category] then
		return
	end
	if not self._comparision_bitmaps then
		return
	end
	self._comparision_panel:show()
	local diff = {}
	local resolution = 100
	local total_stats, old_stat, new_stat, text_w
	local comp_panel = self._comparision_panel
	local comp_bitmap_stat, comp_bitmap_stat_x
	local negative_stats = {
		"recoil",
		"suppression",
		"concealment"
	}
	local is_negative = false
	for _, stat in pairs(self._stats_shown) do
		is_negative = table.contains(negative_stats, stat)
		total_stats = math.max(#tweak_data.weapon.stats[stat], 1)
		old_stat = math.clamp(self._equipped_comparision_data[self._slot_data.category][stat] or 0, 1, total_stats)
		new_stat = math.clamp(self._slot_data.comparision_data[stat] or 0, 1, total_stats)
		text_w = comp_panel:child(stat .. "_text"):w()
		if is_negative then
			old_stat = total_stats - (old_stat - 1)
			new_stat = total_stats - (new_stat - 1)
		end
		old_stat = math.ceil(old_stat / total_stats * resolution)
		new_stat = math.ceil(new_stat / total_stats * resolution)
		diff[stat] = new_stat - old_stat
		comp_bitmap_stat = self._comparision_bitmaps[stat]
		if diff[stat] == 0 then
			comp_bitmap_stat.neg:set_visible(false)
			comp_bitmap_stat.pos:set_visible(false)
			comp_bitmap_stat.plus_icon:set_visible(false)
			comp_bitmap_stat.minus_icon:set_visible(false)
			comp_bitmap_stat.mid_line:set_visible(false)
			comp_bitmap_stat.base:set_w(math.round(old_stat / resolution * comp_bitmap_stat.bg:w()))
		elseif diff[stat] < 0 then
			comp_bitmap_stat.neg:set_visible(true)
			comp_bitmap_stat.minus_icon:set_visible(true)
			comp_bitmap_stat.pos:set_visible(false)
			comp_bitmap_stat.plus_icon:set_visible(false)
			comp_bitmap_stat.mid_line:set_visible(true)
			comp_bitmap_stat.base:set_w(math.round(old_stat / resolution * comp_bitmap_stat.bg:w()))
			comp_bitmap_stat.neg:set_w(math.round(diff[stat] / resolution * comp_bitmap_stat.bg:w()))
			comp_bitmap_stat.mid_line:set_right(comp_bitmap_stat.base:right())
			comp_bitmap_stat.neg:set_left(comp_bitmap_stat.base:right())
		else
			comp_bitmap_stat.neg:set_visible(false)
			comp_bitmap_stat.minus_icon:set_visible(false)
			comp_bitmap_stat.pos:set_visible(true)
			comp_bitmap_stat.plus_icon:set_visible(true)
			comp_bitmap_stat.mid_line:set_visible(false)
			comp_bitmap_stat.base:set_w(math.round(old_stat / resolution * comp_bitmap_stat.bg:w()))
			comp_bitmap_stat.pos:set_w(math.round(diff[stat] / resolution * comp_bitmap_stat.bg:w()))
			comp_bitmap_stat.pos:set_left(comp_bitmap_stat.base:right())
		end
	end
end

function BlackMarketGui:show_btns(slot)
	local data = slot._data
	for _, btn in pairs(self._btns) do
		btn:hide()
	end
	local btns = {}
	for i, btn in ipairs(data) do
		if self._btns[btn] then
			self._btns[btn]:show()
			table.insert(btns, self._btns[btn])
		end
	end
	if not managers.menu:is_pc_controller() then
		local back_btn = self._btns.back_btn
		if back_btn then
			back_btn:show()
			table.insert(btns, back_btn)
		end
	end
	table.sort(btns, function(x, y)
		return x._data.prio < y._data.prio
	end)
	self._controllers_mapping = {}
	self._controllers_pc_mapping = {}
	for i, btn in ipairs(btns) do
		if not managers.menu:is_pc_controller() and not btn._data.no_btn then
			btn:set_text_btn_prefix(btn._data.btn)
		end
		if btn._data.pc_btn then
			self._controllers_pc_mapping[btn._data.pc_btn:key()] = btn
		end
		self._controllers_mapping[btn._data.btn:key()] = btn
		btn:set_text_params(data.btn_text_params)
		btn:set_order(i)
	end
	local num_btns = #btns
	local h = self._real_small_font_size or small_font_size
	local info_box_panel = self._panel:child("info_box_panel")
	self._btn_panel:set_h(num_btns * h)
	self._btn_panel:set_rightbottom(self._panel:w() - 2, info_box_panel:bottom() - 2)
	if self._comparision_panel then
		self._comparision_panel:set_h((self._stats_shown and #self._stats_shown or 4) * h)
		self._comparision_panel:set_rightbottom(self._panel:w() - 2, info_box_panel:bottom() - 10 - h * 5 - 5)
	end
	if self._info_panel then
		self._info_panel:set_size(info_box_panel:w() - 20, self._info_panel:num_children() / 2 * h)
		self._info_panel:set_rightbottom(self._panel:w() - 10, self._btn_panel:top() - 10)
	end
	if managers.menu:is_pc_controller() and 0 < #btns then
		slot:set_btn_text(btns[1]:btn_text())
	else
		slot:set_btn_text("")
	end
end

function BlackMarketGui:populate_weapon_category(category, data)
	local crafted_category = managers.blackmarket:get_crafted_category(category) or {}
	local last_weapon = table.size(crafted_category) == 1
	local last_unlocked_weapon
	if not last_weapon then
		local category_size = table.size(crafted_category)
		for i, crafted in pairs(crafted_category) do
			if not managers.blackmarket:weapon_unlocked(crafted.weapon_id) then
				category_size = category_size - 1
			end
		end
		last_unlocked_weapon = category_size == 1
	end
	for i = 1, 9 do
		data[i] = nil
	end
	local new_data = {}
	local index = 0
	for i, crafted in pairs(crafted_category) do
		new_data = {}
		new_data.name = crafted.weapon_id
		new_data.name_localized = managers.weapon_factory:get_weapon_name_by_factory_id(crafted.factory_id)
		new_data.category = category
		new_data.slot = i
		new_data.unlocked = managers.blackmarket:weapon_unlocked(crafted.weapon_id)
		new_data.level = managers.blackmarket:weapon_level(crafted.weapon_id)
		new_data.lock_texture = not new_data.unlocked and (new_data.level == 0 and "guis/textures/pd2/lock_skill" or "guis/textures/pd2/lock_level")
		new_data.can_afford = true
		new_data.equipped = crafted.equipped
		new_data.skill_name = new_data.level == 0 and "bm_menu_skill_locked_" .. new_data.name
		new_data.price = managers.money:get_weapon_slot_sell_value(category, i)
		new_data.bitmap_texture = "guis/textures/pd2/blackmarket/icons/weapons/" .. tostring(crafted.weapon_id)
		new_data.comparision_data = managers.blackmarket:get_weapon_stats(category, i)
		if not new_data.unlocked then
			new_data.last_weapon = last_weapon
		else
			new_data.last_weapon = last_weapon or last_unlocked_weapon
		end
		local perks = managers.blackmarket:get_perks_from_weapon_blueprint(crafted.factory_id, crafted.blueprint)
		if table.size(perks) > 0 then
			new_data.mini_icons = {}
			local perk_index = 1
			for perk in pairs(perks) do
				table.insert(new_data.mini_icons, {
					texture = "guis/textures/pd2/blackmarket/inv_mod_" .. perk,
					right = (perk_index - 1) * 18,
					bottom = 0,
					layer = 1,
					w = 16,
					h = 16,
					stream = false
				})
				perk_index = perk_index + 1
			end
		end
		if managers.blackmarket:got_new_drop("normal", new_data.category, crafted.factory_id) then
			new_data.mini_icons = new_data.mini_icons or {}
			table.insert(new_data.mini_icons, {
				name = "new_drop",
				texture = "guis/textures/pd2/blackmarket/inv_newdrop",
				left = 0,
				top = 0,
				layer = 1,
				w = 16,
				h = 16,
				stream = false
			})
			new_data.new_drop_data = {}
		end
		if new_data.equipped then
			self._equipped_comparision_data = self._equipped_comparision_data or {}
			self._equipped_comparision_data[category] = new_data.comparision_data
		end
		if new_data.name ~= "saw" and new_data.unlocked then
			table.insert(new_data, "w_mod")
		end
		if not new_data.last_weapon then
			table.insert(new_data, "w_sell")
		end
		if not new_data.equipped and new_data.unlocked then
			table.insert(new_data, "w_equip")
		end
		table.insert(new_data, "w_preview")
		data[i] = new_data
		index = i
	end
	for i = 1, 9 do
		if not data[i] then
			new_data = {}
			new_data.name = "bm_menu_btn_buy_new_weapon"
			new_data.name_localized = managers.localization:text("bm_menu_empty_weapon_slot")
			new_data.mid_text = {}
			new_data.mid_text.selected_text = managers.localization:text("bm_menu_btn_buy_new_weapon")
			new_data.mid_text.selected_color = tweak_data.screen_colors.button_stage_2
			new_data.mid_text.noselected_text = new_data.name_localized
			new_data.mid_text.noselected_color = tweak_data.screen_colors.button_stage_3
			new_data.empty_slot = true
			new_data.category = category
			new_data.slot = i
			new_data.unlocked = true
			new_data.can_afford = true
			new_data.equipped = false
			table.insert(new_data, "ew_buy")
			if managers.blackmarket:got_new_drop(new_data.category, "weapon_buy_empty", nil) then
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
			data[i] = new_data
		end
	end
end

function BlackMarketGui:populate_primaries(data)
	self:populate_weapon_category("primaries", data)
end

function BlackMarketGui:populate_secondaries(data)
	self:populate_weapon_category("secondaries", data)
end

function BlackMarketGui:populate_characters(data)
	local new_data = {}
	for i = 1, 4 do
		local character = CriminalsManager.character_workname_by_peer_id(i)
		new_data = {}
		new_data.name = character
		new_data.name_localized = managers.localization:text("menu_" .. new_data.name)
		new_data.category = "characters"
		new_data.slot = i
		new_data.unlocked = true
		new_data.equipped = managers.blackmarket:get_preferred_character() == character
		new_data.equipped_text = managers.localization:text("bm_menu_preferred")
		new_data.bitmap_texture = "guis/textures/pd2/blackmarket/icons/characters/" .. CriminalsManager.convert_old_to_new_character_workname(new_data.name)
		new_data.stream = false
		if not new_data.equipped then
			table.insert(new_data, "c_equip")
		end
		data[i] = new_data
	end
end

function BlackMarketGui:populate_deployables(data)
	local new_data = {}
	local sort_data = {}
	for id, d in pairs(tweak_data.blackmarket.deployables) do
		table.insert(sort_data, {id, d})
	end
	table.sort(sort_data, function(x, y)
		return x[1] < y[1]
	end)
	for i = 1, 9 do
		data[i] = nil
	end
	local index = 0
	for i, deployable_data in ipairs(sort_data) do
		new_data = {}
		new_data.name = deployable_data[1]
		new_data.name_localized = managers.localization:text(tweak_data.blackmarket.deployables[new_data.name].name_id)
		new_data.category = "deployables"
		new_data.bitmap_texture = "guis/textures/pd2/blackmarket/icons/deployables/" .. tostring(new_data.name)
		new_data.slot = i
		new_data.unlocked = table.contains(managers.player:availible_equipment(1), new_data.name)
		new_data.level = 0
		new_data.lock_texture = not new_data.unlocked and (new_data.level == 0 and "guis/textures/pd2/lock_skill" or "guis/textures/pd2/lock_level")
		new_data.equipped = managers.player:equipment_in_slot(1) == new_data.name
		new_data.stream = false
		new_data.skill_name = "bm_menu_skill_locked_" .. new_data.name
		if new_data.unlocked and not new_data.equipped then
			table.insert(new_data, "lo_d_equip")
		end
		data[i] = new_data
		index = i
	end
	for i = 1, 9 do
		if not data[i] then
			new_data = {}
			new_data.name = "empty"
			new_data.name_localized = ""
			new_data.category = "deployables"
			new_data.slot = i
			new_data.unlocked = true
			new_data.equipped = false
			data[i] = new_data
		end
	end
end

function BlackMarketGui:populate_masks(data)
	local new_data = {}
	local crafted_category = managers.blackmarket:get_crafted_category("masks") or {}
	local mini_icon_helper = math.round((self._panel:h() - (tweak_data.menu.pd2_medium_font_size + 10) - 70) * GRID_H_MUL / 3) - 16
	for i = 1, 9 do
		data[i] = nil
	end
	local index = 0
	for i, crafted in pairs(crafted_category) do
		new_data = {}
		new_data.name = crafted.mask_id
		new_data.name_localized = managers.localization:text(tweak_data.blackmarket.masks[new_data.name].name_id)
		new_data.category = "masks"
		new_data.global_value = crafted.global_value
		new_data.slot = i
		new_data.unlocked = true
		new_data.equipped = crafted.equipped
		new_data.bitmap_texture = "guis/textures/pd2/blackmarket/icons/masks/" .. new_data.name
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

function BlackMarketGui:populate_armors(data)
	local new_data = {}
	local sort_data = {}
	for i, d in pairs(tweak_data.blackmarket.armors) do
		table.insert(sort_data, {
			i,
			d.name_id
		})
	end
	local armor_level_data = {}
	for level, data in pairs(tweak_data.upgrades.level_tree) do
		if data.upgrades then
			for _, upgrade in ipairs(data.upgrades) do
				local def = tweak_data.upgrades.definitions[upgrade]
				if def.armor_id then
					armor_level_data[def.armor_id] = level
				end
			end
		end
	end
	table.sort(sort_data, function(x, y)
		local x_level = x[1] == "level_1" and 0 or armor_level_data[x[1]] or 100
		local y_level = y[1] == "level_1" and 0 or armor_level_data[y[1]] or 100
		return x_level < y_level
	end)
	local index = 0
	for i, armor_data in ipairs(sort_data) do
		local armor_id = armor_data[1]
		local name_id = armor_data[2]
		local bm_data = Global.blackmarket_manager.armors[armor_id]
		index = index + 1
		new_data = {}
		new_data.name = armor_id
		new_data.name_localized = managers.localization:text(name_id)
		new_data.category = "armors"
		new_data.slot = index
		new_data.unlocked = bm_data.unlocked
		new_data.level = armor_level_data[armor_id] or 0
		new_data.lock_texture = not new_data.unlocked and (new_data.level == 0 and "guis/textures/pd2/lock_skill" or "guis/textures/pd2/lock_level")
		new_data.equipped = bm_data.equipped
		new_data.skill_name = new_data.level == 0 and "bm_menu_skill_locked_" .. new_data.name
		new_data.bitmap_texture = "guis/textures/pd2/blackmarket/icons/armors/" .. new_data.name
		if i ~= 1 and managers.blackmarket:got_new_drop("normal", "armors", armor_id) then
			new_data.mini_icons = new_data.mini_icons or {}
			table.insert(new_data.mini_icons, {
				name = "new_drop",
				texture = "guis/textures/pd2/blackmarket/inv_newdrop",
				left = 0,
				top = 0,
				layer = 1,
				w = 16,
				h = 16,
				stream = false
			})
			new_data.new_drop_data = {
				"normal",
				"armors",
				armor_id
			}
		end
		if new_data.unlocked and not new_data.equipped then
			table.insert(new_data, "a_equip")
		end
		data[index] = new_data
	end
	local max_armors = data.override_slots[1] * data.override_slots[2]
	for i = 1, max_armors do
		if not data[i] then
			new_data = {}
			new_data.name = "empty"
			new_data.name_localized = ""
			new_data.category = "armors"
			new_data.slot = i
			new_data.unlocked = true
			new_data.equipped = false
			data[i] = new_data
		end
	end
end

function BlackMarketGui:populate_mod_types(data)
	local new_data = {}
	local index = 1
	for type, mods in pairs(data.on_create_data) do
		new_data = {}
		new_data.name = type
		new_data.name_localized = managers.localization:text("bm_menu_" .. tostring(type))
		new_data.bitmap_texture = "guis/textures/pd2/blackmarket/icons/mods/" .. new_data.name
		new_data.category = data.category
		new_data.slot = data.prev_node_data and data.prev_node_data.slot or 1
		new_data.unlocked = true
		new_data.equipped = false
		new_data.mods = mods
		table.insert(new_data, "mt_choose")
		data[index] = new_data
		index = index + 1
	end
	for i = 1, 9 do
		if not data[i] then
			new_data = {}
			new_data.name = "empty"
			new_data.name_localized = ""
			new_data.category = data.category
			new_data.slot = i
			new_data.unlocked = true
			new_data.equipped = false
			data[i] = new_data
		end
	end
end

function BlackMarketGui:populate_mods(data)
	local new_data = {}
	local default_mod = data.on_create_data.default_mod
	local global_values = managers.blackmarket:get_crafted_category(data.prev_node_data.category)[data.prev_node_data.slot].global_values or {}
	local gvs = {}
	local mod_t = {}
	local num_steps = #data.on_create_data
	for index, mod_t in ipairs(data.on_create_data) do
		local mod_name = mod_t[1]
		local mod_default = mod_t[2]
		local mod_global_value = mod_t[3] or "normal"
		new_data = {}
		new_data.name = mod_name or data.prev_node_data.name
		new_data.name_localized = mod_name and managers.weapon_factory:get_part_name_by_part_id(mod_name) or managers.localization:text("bm_menu_no_mod")
		new_data.category = not data.category and data.prev_node_data and data.prev_node_data.category
		new_data.bitmap_texture = "guis/textures/pd2/blackmarket/icons/mods/" .. new_data.name
		new_data.slot = not data.slot and data.prev_node_data and data.prev_node_data.slot
		new_data.global_value = mod_global_value
		new_data.unlocked = mod_default or managers.blackmarket:get_item_amount(new_data.global_value, "weapon_mods", new_data.name)
		new_data.equipped = false
		new_data.stream = true
		new_data.default_mod = default_mod
		if tweak_data.lootdrop.global_values[mod_global_value] and tweak_data.lootdrop.global_values[mod_global_value].dlc and not tweak_data.dlc[mod_global_value].free and not managers.dlc:has_dlc(mod_global_value) then
			new_data.unlocked = -math.abs(new_data.unlocked)
			new_data.lock_texture = "guis/textures/pd2/lock_skill"
			new_data.dlc_locked = "bm_menu_dlc_locked"
		end
		local weapon_id = managers.blackmarket:get_crafted_category(new_data.category)[new_data.slot].weapon_id
		new_data.price = managers.money:get_weapon_modify_price(weapon_id, new_data.name, new_data.global_value)
		new_data.can_afford = managers.money:can_afford_weapon_modification(weapon_id, new_data.name, new_data.global_value)
		if not new_data.unlocked or new_data.unlocked == 0 then
			new_data.mid_text = {}
			new_data.mid_text.selected_text = managers.localization:text("bm_menu_no_items")
			new_data.mid_text.selected_color = tweak_data.screen_colors.text
			new_data.mid_text.noselected_text = new_data.mid_text.selected_text
			new_data.mid_text.noselected_color = tweak_data.screen_colors.text
			new_data.mid_text.vertical = "center"
		end
		if mod_name then
			local forbids = managers.blackmarket:can_modify_weapon(new_data.category, new_data.slot, new_data.name)
			if forbids and 0 < #forbids then
				if type(new_data.unlocked) == "number" then
					new_data.unlocked = -new_data.unlocked
				else
					new_data.unlocked = false
				end
				new_data.lock_texture = new_data.unlocked and new_data.unlocked ~= 0 and "guis/textures/pd2/lock_incompatible"
				new_data.conflict = managers.localization:text("bm_menu_" .. tostring(tweak_data.weapon.factory.parts[forbids[1]].type))
			end
			local perks = managers.blackmarket:get_perks_from_part(new_data.name)
			if 0 < table.size(perks) then
				new_data.desc_mini_icons = {}
				local perk_index = 1
				for perk in pairs(perks) do
					table.insert(new_data.desc_mini_icons, {
						texture = "guis/textures/pd2/blackmarket/inv_mod_" .. perk,
						right = (perk_index - 1) * 18,
						bottom = 0,
						w = 16,
						h = 16
					})
					perk_index = perk_index + 1
				end
			end
			if not new_data.conflict and new_data.unlocked then
				new_data.comparision_data = managers.blackmarket:get_weapon_stats_with_mod(new_data.category, new_data.slot, mod_name)
			end
			if managers.blackmarket:got_new_drop(mod_global_value, "weapon_mods", mod_name) then
				new_data.mini_icons = new_data.mini_icons or {}
				table.insert(new_data.mini_icons, {
					name = "new_drop",
					texture = "guis/textures/pd2/blackmarket/inv_newdrop",
					left = 0,
					top = 0,
					layer = 1,
					w = 16,
					h = 16,
					stream = false
				})
				new_data.new_drop_data = {
					new_data.global_value or "normal",
					"weapon_mods",
					mod_name
				}
			end
		end
		if mod_name and new_data.unlocked then
			if type(new_data.unlocked) ~= "number" or new_data.unlocked > 0 then
				if new_data.can_afford then
					table.insert(new_data, "wm_buy")
				end
				table.insert(new_data, "wm_preview")
				table.insert(new_data, "wm_preview_mod")
			else
				table.insert(new_data, "wm_remove_preview")
			end
		end
		data[index] = new_data
	end
	for i = 1, 9 do
		if not data[i] then
			new_data = {}
			new_data.name = "empty"
			new_data.name_localized = ""
			new_data.category = data.category
			new_data.slot = i
			new_data.unlocked = true
			new_data.equipped = false
			data[i] = new_data
		end
	end
	local weapon_blueprint = managers.blackmarket:get_weapon_blueprint(data.prev_node_data.category, data.prev_node_data.slot) or {}
	local equipped
	for i, mod in ipairs(data) do
		for _, weapon_mod in ipairs(weapon_blueprint) do
			if mod.name == weapon_mod and (not global_values[weapon_mod] or global_values[weapon_mod] == data[i].global_value) then
				equipped = i
				break
			end
		end
	end
	if equipped then
		data[equipped].equipped = true
		data[equipped].unlocked = data[equipped].unlocked or true
		data[equipped].mid_text = nil
		for i = 1, #data[equipped] do
			table.remove(data[equipped], 1)
		end
		data[equipped].price = 0
		data[equipped].can_afford = true
		table.insert(data[equipped], "wm_remove_buy")
		table.insert(data[equipped], "wm_remove_preview_mod")
		table.insert(data[equipped], "wm_remove_preview")
		if not data[equipped].conflict then
			if data[equipped].default_mod then
				data[equipped].comparision_data = managers.blackmarket:get_weapon_stats_with_mod(data[equipped].category, data[equipped].slot, data[equipped].default_mod)
			else
				data[equipped].comparision_data = managers.blackmarket:get_weapon_stats_without_mod(data[equipped].category, data[equipped].slot, data[equipped].name)
			end
		end
	end
end

function BlackMarketGui:set_equipped_comparision(data)
	local category = data.category
	local slot = data.slot
	self._equipped_comparision_data = {}
	self._equipped_comparision_data[category] = managers.blackmarket:get_weapon_stats(category, slot) or {}
end

function BlackMarketGui:populate_buy_weapon(data)
	local new_data = {}
	for i = 1, #data.on_create_data do
		new_data = {}
		new_data.name = data.on_create_data[i].weapon_id
		new_data.name_localized = managers.weapon_factory:get_weapon_name_by_factory_id(data.on_create_data[i].factory_id)
		new_data.category = data.category
		new_data.slot = data.prev_node_data and data.prev_node_data.slot
		new_data.unlocked = data.on_create_data[i].unlocked
		new_data.level = not new_data.unlocked and data.on_create_data[i].level
		new_data.lock_texture = not new_data.unlocked and (new_data.level == 0 and "guis/textures/pd2/lock_skill" or "guis/textures/pd2/lock_level")
		new_data.equipped = false
		new_data.bitmap_texture = "guis/textures/pd2/blackmarket/icons/weapons/" .. new_data.name
		new_data.comparision_data = new_data.unlocked and deep_clone(tweak_data.weapon[new_data.name].stats)
		new_data.skill_name = new_data.level == 0 and "bm_menu_skill_locked_" .. new_data.name
		new_data.can_afford = managers.money:can_afford_weapon(new_data.name)
		new_data.price = managers.money:get_weapon_price_modified(new_data.name)
		new_data.not_moddable = true
		if new_data.unlocked and not new_data.can_afford then
			new_data.mid_text = {}
			new_data.mid_text.selected_text = managers.localization:text("bm_menu_not_enough_cash")
			new_data.mid_text.selected_color = tweak_data.screen_colors.text
			new_data.mid_text.noselected_text = new_data.mid_text.selected_text
			new_data.mid_text.noselected_color = tweak_data.screen_colors.text
			new_data.mid_text.vertical = "center"
		end
		if new_data.unlocked then
			if new_data.can_afford then
				table.insert(new_data, "bw_buy")
			end
			table.insert(new_data, "bw_preview")
		end
		table.insert(new_data, "bw_available_mods")
		local new_weapon = managers.blackmarket:got_new_drop(data.category, "weapon_buy", new_data.name)
		local got_mods = managers.blackmarket:got_new_drop("normal", new_data.category, data.on_create_data[i].factory_id)
		if new_weapon or got_mods then
			new_data.mini_icons = new_data.mini_icons or {}
			table.insert(new_data.mini_icons, {
				name = "new_drop",
				texture = "guis/textures/pd2/blackmarket/inv_newdrop",
				left = 0,
				top = 0,
				layer = 1,
				w = 16,
				h = 16,
				stream = false
			})
			new_data.new_drop_data = {
				"normal",
				data.category,
				new_data.name
			}
			if got_mods then
				new_data.new_drop_data = {}
			end
		end
		data[i] = new_data
	end
	for i = 1, 9 do
		if not data[i] then
			new_data = {}
			new_data.name = "empty"
			new_data.name_localized = ""
			new_data.category = data.category
			new_data.slot = i
			new_data.unlocked = true
			new_data.equipped = false
			data[i] = new_data
		end
	end
end

function BlackMarketGui:populate_mask_global_value(data)
	local new_data = {}
	if not managers.blackmarket:currently_customizing_mask() then
		return
	end
	for i = 1, #data.on_create_data do
		new_data = {}
		new_data.name = data.on_create_data[i]
		new_data.name_localized = data.on_create_data[i]
		new_data.category = data.category
		new_data.slot = data.prev_node_data and data.prev_node_data.slot
		new_data.unlocked = true
		new_data.equipped = false
		new_data.num_backs = data.prev_node_data.num_backs + 1
		new_data.bitmap_texture = "guis/textures/pd2/blackmarket/icons/global_value/" .. new_data.name
		new_data.stream = true
		if new_data.unlocked and #managers.blackmarket:get_inventory_masks() > 0 then
			table.insert(new_data, "em_buy")
		end
		data[i] = new_data
	end
	for i = 1, 9 do
		if not data[i] then
			new_data = {}
			new_data.name = "empty"
			new_data.name_localized = ""
			new_data.category = data.category
			new_data.slot = i
			new_data.unlocked = true
			new_data.equipped = false
			data[i] = new_data
		end
	end
end

function BlackMarketGui:populate_buy_mask(data)
	local new_data = {}
	local max_masks = data.override_slots[1] * data.override_slots[2]
	for i = 1, max_masks do
		data[i] = nil
	end
	for i = 1, #data.on_create_data do
		new_data = {}
		new_data.name = data.on_create_data[i].mask_id
		new_data.name_localized = managers.localization:text(tweak_data.blackmarket.masks[new_data.name].name_id)
		new_data.category = data.category
		new_data.slot = data.prev_node_data and data.prev_node_data.slot
		new_data.global_value = data.on_create_data[i].global_value
		new_data.unlocked = managers.blackmarket:get_item_amount(new_data.global_value, "masks", new_data.name)
		new_data.equipped = false
		new_data.num_backs = data.prev_node_data.num_backs + 1
		new_data.bitmap_texture = "guis/textures/pd2/blackmarket/icons/masks/" .. new_data.name
		new_data.stream = true
		if tweak_data.lootdrop.global_values[new_data.global_value] and tweak_data.lootdrop.global_values[new_data.global_value].dlc and not tweak_data.dlc[new_data.global_value].free and not managers.dlc:has_dlc(new_data.global_value) then
			new_data.unlocked = -math.abs(new_data.unlocked)
			new_data.lock_texture = "guis/textures/pd2/lock_skill"
			new_data.dlc_locked = "bm_menu_dlc_locked"
		end
		if new_data.unlocked and new_data.unlocked > 0 then
			table.insert(new_data, "bm_buy")
			table.insert(new_data, "bm_preview")
			table.insert(new_data, "bm_sell")
		end
		if managers.blackmarket:got_new_drop(new_data.global_value or "normal", "masks", new_data.name) then
			new_data.mini_icons = new_data.mini_icons or {}
			table.insert(new_data.mini_icons, {
				name = "new_drop",
				texture = "guis/textures/pd2/blackmarket/inv_newdrop",
				left = 0,
				top = 0,
				layer = 1,
				w = 16,
				h = 16,
				stream = false
			})
			new_data.new_drop_data = {
				new_data.global_value or "normal",
				"masks",
				new_data.name
			}
		end
		data[i] = new_data
	end
	for i = 1, max_masks do
		if not data[i] then
			new_data = {}
			new_data.name = "empty"
			new_data.name_localized = ""
			new_data.category = data.category
			new_data.slot = i
			new_data.unlocked = true
			new_data.equipped = false
			data[i] = new_data
		end
	end
end

function BlackMarketGui:populate_mask_mod_types(data)
	local new_data = {}
	local max_page = data.override_slots[1] * data.override_slots[2]
	for i = 1, max_page do
		data[i] = nil
	end
	local all_mods_by_type = {}
	local full_customization = true
	for type, mods in pairs(data.on_create_data) do
		all_mods_by_type[type] = mods
		full_customization = full_customization and (type == "materials" or mods and 0 < #mods)
	end
	local mask_blueprint = managers.blackmarket:info_customize_mask()
	local mask_true_blueprint = managers.blackmarket:get_customized_mask_blueprint()
	local name_converter = {
		materials = "material",
		textures = "pattern",
		colors = "color"
	}
	local index = 1
	for type, mods in pairs(data.on_create_data) do
		new_data = {}
		new_data.name = type
		new_data.name_localized = managers.localization:text("bm_menu_" .. tostring(type))
		new_data.category = type
		new_data.slot = data.prev_node_data and data.prev_node_data.slot
		new_data.unlocked = type == "materials" or 0 < #mods
		new_data.equipped = false
		new_data.mods = mods
		new_data.equipped_text = managers.localization:text("bm_menu_chosen")
		new_data.all_mods_by_type = all_mods_by_type
		new_data.my_part_data = nil
		new_data.my_true_part_data = mask_true_blueprint[name_converter[type]]
		for i, data in ipairs(mask_blueprint) do
			if data.name == type then
				new_data.my_part_data = data
				break
			end
		end
		new_data.stream = type ~= "colors"
		if not new_data.my_part_data.is_good then
		elseif type == "colors" then
			new_data.bitmap_texture = "guis/textures/pd2/blackmarket/icons/colors/color_bg"
			new_data.extra_bitmaps = {}
			table.insert(new_data.extra_bitmaps, "guis/textures/pd2/blackmarket/icons/colors/color_02")
			table.insert(new_data.extra_bitmaps, "guis/textures/pd2/blackmarket/icons/colors/color_01")
			new_data.extra_bitmaps_colors = {}
			table.insert(new_data.extra_bitmaps_colors, tweak_data.blackmarket.colors[new_data.my_part_data.id].colors[2])
			table.insert(new_data.extra_bitmaps_colors, tweak_data.blackmarket.colors[new_data.my_part_data.id].colors[1])
		elseif type == "textures" then
			new_data.bitmap_texture = tweak_data.blackmarket.textures[new_data.my_part_data.id].texture
			new_data.render_template = Idstring("VertexColorTexturedPatterns")
		else
			new_data.bitmap_texture = "guis/textures/pd2/blackmarket/icons/materials/" .. new_data.my_part_data.id
		end
		new_data.unique_slot_class = "BlackMarketGuiMaskSlotItem"
		new_data.btn_text_params = {
			type = managers.localization:text("bm_menu_" .. tostring(type))
		}
		if managers.menu:is_pc_controller() then
			table.insert(new_data, "mm_choose_materials")
			table.insert(new_data, "mm_choose_textures")
			if data.on_create_data.colors and 0 < #data.on_create_data.colors then
				table.insert(new_data, "mm_choose_colors")
			end
		elseif new_data.unlocked then
			table.insert(new_data, "mm_choose_" .. tostring(type))
		end
		if not new_data.unlocked or new_data.unlocked == 0 then
			new_data.mid_text = {}
			new_data.mid_text.selected_text = managers.localization:text("bm_menu_no_items")
			new_data.mid_text.selected_color = tweak_data.screen_colors.text
			new_data.mid_text.noselected_text = new_data.mid_text.selected_text
			new_data.mid_text.noselected_color = tweak_data.screen_colors.text
			new_data.mid_text.vertical = "center"
		end
		if managers.menu:is_pc_controller() then
			new_data.double_click_btn = "mm_choose_" .. tostring(type)
		end
		table.insert(new_data, "mm_preview")
		if managers.blackmarket:can_finish_customize_mask() and managers.blackmarket:can_afford_customize_mask() then
			table.insert(new_data, "mm_buy")
		end
		if managers.blackmarket:got_new_drop(nil, new_data.category, nil) then
			new_data.mini_icons = new_data.mini_icons or {}
			table.insert(new_data.mini_icons, {
				name = "new_drop",
				texture = "guis/textures/pd2/blackmarket/inv_newdrop",
				left = 0,
				top = 0,
				layer = 1,
				w = 16,
				h = 16,
				stream = false
			})
			new_data.new_drop_data = {}
		end
		data[index] = new_data
		index = index + 1
	end
	local name_values = {
		materials = 1,
		textures = 2,
		colors = 3
	}
	table.sort(data, function(x, y)
		return name_values[x.name] < name_values[y.name]
	end)
	for i = 1, max_page do
		if not data[i] then
			new_data = {}
			new_data.name = "empty"
			new_data.name_localized = ""
			new_data.category = data.category
			new_data.slot = i
			new_data.unlocked = true
			new_data.equipped = false
			data[i] = new_data
		end
	end
end

function BlackMarketGui:populate_choose_mask_mod(data)
	local new_data = {}
	local index = 1
	local equipped_mod = managers.blackmarket:customize_mask_category_id(data.category)
	for type, mods in pairs(data.on_create_data) do
		new_data = {}
		new_data.name = mods.id
		new_data.name_localized = managers.localization:text(tweak_data.blackmarket[data.category][new_data.name].name_id)
		new_data.category = data.category
		new_data.slot = index
		new_data.unlocked = mods.default or mods.amount
		new_data.equipped = equipped_mod == mods.id
		new_data.equipped_text = managers.localization:text("bm_menu_chosen")
		new_data.mods = mods
		new_data.stream = data.category ~= "colors"
		new_data.global_value = mods.global_value
		local is_locked = false
		if tweak_data.lootdrop.global_values[new_data.global_value] and tweak_data.lootdrop.global_values[new_data.global_value].dlc and not tweak_data.dlc[new_data.global_value].free and not managers.dlc:has_dlc(new_data.global_value) then
			new_data.unlocked = -math.abs(new_data.unlocked)
			new_data.lock_texture = "guis/textures/pd2/lock_skill"
			new_data.dlc_locked = "bm_menu_dlc_locked"
			is_locked = true
		end
		if data.category == "colors" then
			new_data.bitmap_texture = "guis/textures/pd2/blackmarket/icons/colors/color_bg"
			new_data.extra_bitmaps = {}
			table.insert(new_data.extra_bitmaps, "guis/textures/pd2/blackmarket/icons/colors/color_02")
			table.insert(new_data.extra_bitmaps, "guis/textures/pd2/blackmarket/icons/colors/color_01")
			new_data.extra_bitmaps_colors = {}
			table.insert(new_data.extra_bitmaps_colors, tweak_data.blackmarket.colors[new_data.name].colors[2])
			table.insert(new_data.extra_bitmaps_colors, tweak_data.blackmarket.colors[new_data.name].colors[1])
		elseif data.category == "textures" then
			new_data.bitmap_texture = tweak_data.blackmarket[data.category][mods.id].texture
			new_data.render_template = Idstring("VertexColorTexturedPatterns")
		else
			new_data.bitmap_texture = "guis/textures/pd2/blackmarket/icons/" .. tostring(data.category) .. "/" .. new_data.name
		end
		if managers.blackmarket:got_new_drop(new_data.global_value or "normal", new_data.category, new_data.name) then
			new_data.mini_icons = new_data.mini_icons or {}
			table.insert(new_data.mini_icons, {
				name = "new_drop",
				texture = "guis/textures/pd2/blackmarket/inv_newdrop",
				left = 0,
				top = 0,
				layer = 1,
				w = 16,
				h = 16,
				stream = false
			})
			new_data.new_drop_data = {
				new_data.global_value or "normal",
				new_data.category,
				new_data.name
			}
		end
		new_data.btn_text_params = {
			type = managers.localization:text("bm_menu_" .. data.category)
		}
		if not is_locked then
			table.insert(new_data, "mp_choose")
			table.insert(new_data, "mp_preview")
		end
		data[index] = new_data
		index = index + 1
	end
	local max_mask_mods = 9
	if data.override_slots then
		max_mask_mods = data.override_slots[1] * data.override_slots[2]
	end
	for i = 1, max_mask_mods do
		if not data[i] then
			new_data = {}
			new_data.name = "empty"
			new_data.name_localized = ""
			new_data.category = data.category
			new_data.slot = i
			new_data.unlocked = true
			new_data.equipped = false
			data[i] = new_data
		end
	end
end

function BlackMarketGui:_cleanup_blackmarket()
	local blackmarket_tweak_data = tweak_data.blackmarket
	local blackmarket_inventory = Global.blackmarket_manager.inventory
	for global_value, gv_table in pairs(blackmarket_inventory) do
		for type_id, type_table in pairs(gv_table) do
			if type_id ~= "weapon_mods" then
				local item_data = blackmarket_tweak_data[type_id]
				if item_data then
					for item_id, item_amount in pairs(type_table) do
						if not item_data[item_id] then
							print("BlackMarketGui:_cleanup_blackmarket: Missing '" .. item_id .. "' in BlackMarketTweakData. Removing it from stash!")
							type_table[item_id] = nil
						end
					end
				end
			else
			end
		end
	end
end

function BlackMarketGui:_start_page_data()
	local data = {}
	table.insert(data, {
		name = "bm_menu_primaries",
		category = "primaries",
		on_create_func_name = "populate_primaries",
		identifier = self.identifiers.weapon
	})
	table.insert(data, {
		name = "bm_menu_secondaries",
		category = "secondaries",
		on_create_func_name = "populate_secondaries",
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

function BlackMarketGui:choose_weapon_mods_callback(data)
	local dropable_mods = managers.blackmarket:get_dropable_mods_by_weapon_id(data.name)
	local factory_id = managers.weapon_factory:get_factory_id_by_weapon_id(data.name)
	local default_blueprint = managers.weapon_factory:get_default_blueprint_by_factory_id(factory_id)
	for _, default_part in ipairs(default_blueprint) do
		for i, mod_category in pairs(dropable_mods) do
		end
	end
	local mods = {}
	for i, d in pairs(dropable_mods) do
		mods[i] = d
	end
	local new_node_data = {}
	local sort_mods = {}
	for id, _ in pairs(mods) do
		table.insert(sort_mods, id)
	end
	table.sort(sort_mods, function(x, y)
		return x < y
	end)
	for i, id in ipairs(sort_mods) do
		local my_mods = deep_clone(mods[id])
		local factory_id = managers.blackmarket:get_crafted_category(data.category)[data.slot].factory_id
		local default_blueprint = managers.weapon_factory:get_default_blueprint_by_factory_id(factory_id)
		local default_mod
		local ids_id = Idstring(id)
		for i, d_mod in ipairs(default_blueprint) do
			if Idstring(tweak_data.weapon.factory.parts[d_mod].type) == ids_id then
				default_mod = d_mod
				break
			end
		end
		local sort_td = tweak_data.blackmarket.weapon_mods
		local x_td, y_td, x_pc, y_pc
		table.sort(my_mods, function(x, y)
			x_td = sort_td[x[1]]
			y_td = sort_td[y[1]]
			x_pc = x_td.value or x_td.pcs and x_td.pcs[1] or 0
			y_pc = y_td.value or y_td.pcs and y_td.pcs[1] or 0
			if x_td.infamous then
				x_pc = x_pc + 100
			end
			if y_td.infamous then
				y_pc = y_pc + 100
			end
			return x_pc < y_pc or x_pc == y_pc and x[1] < y[1]
		end)
		local mod_data = {}
		for a = 1, math.min(#my_mods, 9) do
			table.insert(mod_data, {
				my_mods[a][1],
				false,
				my_mods[a][2]
			})
		end
		mod_data.default_mod = default_mod
		table.insert(new_node_data, {
			name = id,
			category = data.category,
			prev_node_data = data,
			name_localized = managers.localization:text("bm_menu_" .. id),
			on_create_func_name = "populate_mods",
			on_create_data = mod_data,
			identifier = self.identifiers.weapon_mod
		})
	end
	new_node_data.topic_id = "bm_menu_blackmarket_title"
	new_node_data.topic_params = {
		item = data.name_localized
	}
	new_node_data.show_tabs = true
	new_node_data.open_callback_name = "set_equipped_comparision"
	new_node_data.open_callback_params = {
		category = data.category,
		slot = data.slot
	}
	new_node_data.blur_fade = self._data.blur_fade
	managers.menu:open_node(self._inception_node_name, {new_node_data})
end

function BlackMarketGui:choose_mod_type_callback(data)
	local mods = managers.blackmarket:get_dropable_mods_by_weapon_id(data.name)
	local new_node_data = {}
	local mods_list = {}
	for id, data in pairs(mods) do
		table.insert(mods_list, id)
	end
	local mod_data = {}
	for i = 1, math.max(1, math.ceil(#mods_list / 9)) do
		mod_data = {}
		for id = (i - 1) * 9 + 1, math.min(i * 9, #mods_list) do
			mod_data[mods_list[id]] = mods[mods_list[id]]
		end
		table.insert(new_node_data, {
			name = tostring(i),
			category = data.category,
			prev_node_data = data,
			name_localized = tostring(i),
			on_create_func_name = "populate_mod_types",
			on_create_data = mod_data,
			identifier = self.identifiers.weapon_mod
		})
	end
	new_node_data.topic_id = "bm_menu_blackmarket_title"
	new_node_data.topic_params = {
		item = data.name_localized
	}
	new_node_data.blur_fade = self._data.blur_fade
	managers.menu:open_node(self._inception_node_name, {new_node_data})
end

function BlackMarketGui:set_preferred_character_callback(data)
	managers.blackmarket:set_preferred_character(data.name)
	self:reload()
end

function BlackMarketGui:equip_weapon_callback(data)
	managers.blackmarket:equip_weapon(data.category, data.slot)
	self:reload()
end

function BlackMarketGui:equip_armor_callback(data)
	managers.blackmarket:equip_armor(data.name)
	self:reload()
end

function BlackMarketGui:equip_mask_callback(data)
	managers.blackmarket:equip_mask(data.slot)
	self:reload()
end

function BlackMarketGui:_open_preview_node()
	managers.menu:open_node(self._preview_node_name, {})
end

function BlackMarketGui:_preview_weapon(data)
	managers.blackmarket:view_weapon(data.category, data.slot, callback(self, self, "_open_preview_node"))
end

function BlackMarketGui:preview_weapon_callback(data)
	self:_preview_weapon(data)
end

function BlackMarketGui:_preview_mask(data)
	managers.blackmarket:view_mask(data.slot)
	managers.menu:open_node("blackmarket_preview_mask_node", {})
end

function BlackMarketGui:preview_mask_callback(data)
	self:_preview_mask(data)
end

function BlackMarketGui:sell_item_callback(data)
	print("sell_item_callback", inspect(data))
	local params = {}
	params.name = data.name_localized or data.name
	params.category = data.category
	params.slot = data.slot
	params.money = managers.experience:cash_string(managers.money:get_weapon_slot_sell_value(params.category, params.slot))
	params.yes_func = callback(self, self, "_dialog_yes", callback(self, self, "_sell_weapon_callback", data))
	params.no_func = callback(self, self, "_dialog_no")
	managers.menu:show_confirm_blackmarket_sell(params)
end

function BlackMarketGui:sell_stashed_mask_callback(data)
	local blueprint = {}
	blueprint.color = {id = "nothing", global_value = "normal"}
	blueprint.pattern = {
		id = "no_color_no_material",
		global_value = "normal"
	}
	blueprint.material = {id = "plastic", global_value = "normal"}
	local params = {}
	params.name = data.name_localized or data.name
	params.global_value = data.global_value
	params.money = managers.experience:cash_string(managers.money:get_mask_sell_value(data.name, data.global_value, blueprint))
	params.yes_func = callback(self, self, "_dialog_yes", callback(self, self, "_sell_inventory_mask_callback", data))
	params.no_func = callback(self, self, "_dialog_no")
	managers.menu:show_confirm_blackmarket_sell_no_slot(params)
end

function BlackMarketGui:_sell_inventory_mask_callback(data)
	managers.menu_component:post_event("item_sell")
	managers.blackmarket:on_sell_inventory_mask(data.name, data.global_value)
	self:reload()
end

function BlackMarketGui:sell_mask_callback(data)
	local params = {}
	params.name = data.name_localized or data.name
	params.category = data.category
	params.slot = data.slot
	params.money = managers.experience:cash_string(managers.money:get_mask_slot_sell_value(data.slot))
	params.yes_func = callback(self, self, "_dialog_yes", callback(self, self, "_sell_mask_callback", data))
	params.no_func = callback(self, self, "_dialog_no")
	managers.menu:show_confirm_blackmarket_sell(params)
end

function BlackMarketGui:_sell_weapon_callback(data)
	managers.menu_component:post_event("item_sell")
	managers.blackmarket:on_sell_weapon(data.category, data.slot)
	self:reload()
end

function BlackMarketGui:_sell_mask_callback(data)
	managers.menu_component:post_event("item_sell")
	managers.blackmarket:on_sell_mask(data.slot)
	self:reload()
end

function BlackMarketGui:choose_weapon_buy_callback(data)
	local items = managers.blackmarket:get_weapon_category(data.category) or {}
	local new_node_data = {}
	for _, item in ipairs(items) do
		item.level = 0
		for level, level_data in pairs(tweak_data.upgrades.level_tree) do
			for _, upgrade in ipairs(level_data.upgrades) do
				if upgrade == item.weapon_id then
					item.level = level
					break
				end
			end
			if item.level ~= 0 then
				break
			end
		end
	end
	table.sort(items, function(x, y)
		if x.weapon_id == "saw" then
			return false
		end
		if y.weapon_id == "saw" then
			return true
		end
		if x.level and y.level then
			return x.level < y.level
		end
	end)
	local item_data = {}
	for i = 1, math.ceil(#items / 9) do
		item_data = {}
		for id = (i - 1) * 9 + 1, math.min(i * 9, #items) do
			table.insert(item_data, items[id])
		end
		table.insert(new_node_data, {
			name = tostring(i),
			category = data.category,
			prev_node_data = data,
			name_localized = tostring(i),
			on_create_func_name = "populate_buy_weapon",
			on_create_data = item_data,
			identifier = self.identifiers.weapon
		})
	end
	new_node_data.topic_id = "bm_menu_buy_weapon_title"
	new_node_data.topic_params = {
		weapon_category = managers.localization:text("bm_menu_" .. data.category)
	}
	new_node_data.blur_fade = self._data.blur_fade
	managers.menu:open_node(self._inception_node_name, {new_node_data})
end

function BlackMarketGui:choose_mask_global_value_callback(data)
	local masks = managers.blackmarket:get_inventory_masks() or {}
	local new_node_data = {}
	local items = {}
	for _, mask in pairs(masks) do
		local new_global_value = true
		for _, global_value in ipairs(items) do
			if global_value == mask.global_value then
				new_global_value = false
			end
		end
		if new_global_value then
			table.insert(items, mask.global_value)
		end
	end
	table.sort(items, function(x, y)
		local global_values = {
			normal = 1,
			superior = 2,
			exceptional = 3,
			infamous = 4
		}
		if global_values[x] and global_values[y] then
			return global_values[x] < global_values[y]
		end
	end)
	local item_data = {}
	for i = 1, math.ceil(#items / 9) do
		item_data = {}
		for id = (i - 1) * 9 + 1, math.min(i * 9, #items) do
			table.insert(item_data, items[id])
		end
		table.insert(new_node_data, {
			name = tostring(i),
			category = data.category,
			prev_node_data = data,
			name_localized = tostring(i),
			on_create_func_name = "populate_mask_global_value",
			on_create_data = item_data,
			identifier = self.identifiers.mask
		})
	end
	new_node_data.topic_id = "bm_menu_choose_global_value_title"
	new_node_data.topic_params = {
		category = managers.localization:text("bm_menu_buy_mask_title")
	}
	new_node_data.blur_fade = self._data.blur_fade
	managers.menu:open_node(self._inception_node_name, {new_node_data})
end

function BlackMarketGui:choose_mask_buy_callback(data)
	local masks = managers.blackmarket:get_inventory_masks() or {}
	local new_node_data = {}
	local items = {}
	for _, mask in pairs(masks) do
		if data.name == "bm_menu_btn_buy_new_mask" or mask.global_value == data.name then
			table.insert(items, mask)
		end
	end
	local sort_td = tweak_data.blackmarket.masks
	local x_td, y_td, x_pc, y_pc
	table.sort(items, function(x, y)
		x_td = sort_td[x.mask_id]
		y_td = sort_td[y.mask_id]
		x_pc = x_td.pc or x_td.pcs and x_td.pcs[1] or 0
		y_pc = y_td.pc or y_td.pcs and y_td.pcs[1] or 0
		x_pc = x_pc + (x.global_value and tweak_data.lootdrop.global_values[x.global_value].sort_number or 0)
		y_pc = y_pc + (y.global_value and tweak_data.lootdrop.global_values[y.global_value].sort_number or 0)
		return x_pc < y_pc or x_pc == y_pc and x.mask_id < y.mask_id
	end)
	local max_x = math.clamp(math.round(#items / 6), 3, 6)
	local max_y = 3
	local item_data = {}
	for i = 1, math.ceil(#items / (max_x * max_y)) do
		item_data = {}
		for id = (i - 1) * (max_x * max_y) + 1, math.min(i * (max_x * max_y), #items) do
			table.insert(item_data, items[id])
		end
		table.insert(new_node_data, {
			name = tostring(i),
			category = data.category,
			prev_node_data = data,
			name_localized = tostring(i),
			on_create_func_name = "populate_buy_mask",
			on_create_data = item_data,
			override_slots = {max_x, max_y},
			identifier = self.identifiers.mask
		})
	end
	new_node_data.topic_id = "bm_menu_buy_mask_title"
	new_node_data.topic_params = {}
	new_node_data.blur_fade = self._data.blur_fade
	managers.menu:open_node(self._inception_node_name, {new_node_data})
end

function BlackMarketGui:buy_mask_callback(data)
	local params = {}
	params.name = data.name_localized or data.name
	params.category = data.category
	params.slot = data.slot
	params.weapon = data.name
	params.yes_func = callback(self, self, "_dialog_yes", callback(self, self, "_buy_mask_callback", data))
	params.no_func = callback(self, self, "_dialog_no")
	managers.menu:show_confirm_blackmarket_assemble(params)
end

function BlackMarketGui:mask_mods_callback(data)
	local mods = {
		materials = managers.blackmarket:get_inventory_category("materials"),
		textures = managers.blackmarket:get_inventory_category("textures"),
		colors = managers.blackmarket:get_inventory_category("colors")
	}
	local new_node_data = {}
	local mods_list = {}
	for id, data in pairs(mods) do
		table.insert(mods_list, id)
	end
	local max_x = 3
	local max_y = 1
	local mod_data = {}
	for i = 1, math.max(1, math.ceil(#mods_list / (max_x * max_y))) do
		mod_data = {}
		for id = (i - 1) * (max_x * max_y) + 1, math.min(i * (max_x * max_y), #mods_list) do
			mod_data[mods_list[id]] = mods[mods_list[id]]
		end
		table.insert(new_node_data, {
			name = tostring(i),
			category = data.category,
			prev_node_data = data,
			name_localized = tostring(i),
			on_create_func_name = "populate_mask_mod_types",
			on_create_data = mod_data,
			override_slots = {max_x, max_y},
			identifier = self.identifiers.mask_mod
		})
	end
	new_node_data.topic_id = "bm_menu_customize_mask_title"
	new_node_data.topic_params = {
		mask_name = data.name_localized
	}
	local params = {}
	params.yes_func = callback(self, self, "_dialog_yes", callback(self, self, "_abort_customized_mask_callback"))
	params.no_func = callback(self, self, "_dialog_no")
	new_node_data.back_callback = callback(self, self, "_warn_abort_customized_mask_callback", params)
	managers.blackmarket:start_customize_mask(data.slot)
	new_node_data.blur_fade = self._data.blur_fade
	managers.menu:open_node("blackmarket_mask_node", {new_node_data})
end

function BlackMarketGui:choose_mask_mod_callback(type_category, data, prev_node_params)
	self:choose_mask_type_callback(data, prev_node_params, type_category)
end

function BlackMarketGui:choose_mask_type_callback(data, prev_node_params, type_category)
	if not managers.blackmarket:currently_customizing_mask() then
		return
	end
	local items = deep_clone(data.all_mods_by_type[type_category]) or {}
	local new_node_data = {}
	local category = type_category or data.category
	local default = managers.blackmarket:customize_mask_category_default(category)
	local mods = {}
	if default then
		table.insert(mods, default)
		mods[#mods].pcs = {0}
		mods[#mods].default = true
	end
	local td
	for i = 1, #items do
		td = tweak_data.blackmarket[category][items[i].id]
		if td.texture or td.colors then
			table.insert(mods, items[i])
			mods[#mods].pc = td.pc or td.pcs and td.pcs[1] or 0
			mods[#mods].colors = td.colors
		end
	end
	local sort_td = tweak_data.blackmarket[category]
	local x_pc, y_pc
	table.sort(mods, function(x, y)
		if x.colors and y.colors then
			for i = 1, 2 do
				local x_color = x.colors[i]
				local x_max = math.max(x_color.r, x_color.g, x_color.b)
				local x_min = math.min(x_color.r, x_color.g, x_color.b)
				local x_diff = x_max - x_min
				local x_wl
				if x_max == x_min then
					x_wl = 10 - x_color.r
				elseif x_max == x_color.r then
					x_wl = (x_color.g - x_color.b) / x_diff % 6
				elseif x_max == x_color.g then
					x_wl = (x_color.b - x_color.r) / x_diff + 2
				elseif x_max == x_color.b then
					x_wl = (x_color.r - x_color.g) / x_diff + 4
				end
				local y_color = y.colors[i]
				local y_max = math.max(y_color.r, y_color.g, y_color.b)
				local y_min = math.min(y_color.r, y_color.g, y_color.b)
				local y_diff = y_max - y_min
				local y_wl
				if y_max == y_min then
					y_wl = 10 - y_color.r
				elseif y_max == y_color.r then
					y_wl = (y_color.g - y_color.b) / y_diff % 6
				elseif y_max == y_color.g then
					y_wl = (y_color.b - y_color.r) / y_diff + 2
				elseif y_max == y_color.b then
					y_wl = (y_color.r - y_color.g) / y_diff + 4
				end
				if x_wl ~= y_wl then
					return x_wl < y_wl
				end
			end
		end
		x_pc = x.pc or x.pcs and x.pcs[1] or 1001
		y_pc = y.pc or y.pcs and y.pcs[1] or 1001
		x_pc = x_pc + (x.global_value and tweak_data.lootdrop.global_values[x.global_value].sort_number or 0)
		y_pc = y_pc + (y.global_value and tweak_data.lootdrop.global_values[y.global_value].sort_number or 0)
		return x_pc < y_pc
	end)
	local max_x = 6
	local max_y = 3
	local mod_data = {}
	for i = 1, math.ceil(#mods / (max_x * max_y)) do
		mod_data = {}
		for id = (i - 1) * (max_x * max_y) + 1, math.min(i * (max_x * max_y), #mods) do
			table.insert(mod_data, mods[id])
		end
		table.insert(new_node_data, {
			name = tostring(i),
			category = category,
			prev_node_data = data,
			name_localized = tostring(i),
			on_create_func_name = "populate_choose_mask_mod",
			on_create_data = mod_data,
			override_slots = {max_x, max_y},
			identifier = self.identifiers.mask_mod
		})
	end
	new_node_data.topic_id = "bm_menu_customize_mask_title"
	new_node_data.topic_params = {
		mask_name = prev_node_params.mask_name
	}
	new_node_data.open_callback_name = "update_mod_mask"
	new_node_data.blur_fade = self._data.blur_fade
	managers.menu:open_node("blackmarket_mask_node", {new_node_data})
end

function BlackMarketGui:preview_customized_mask_callback(data)
	if not managers.blackmarket:can_view_customized_mask() then
	end
	managers.menu:open_node("blackmarket_preview_mask_node", {})
	managers.blackmarket:view_customized_mask()
end

function BlackMarketGui:preview_customized_mask_with_mod_callback(data)
	if not managers.blackmarket:can_view_customized_mask_with_mod(data.category, data.name, data.global_value) then
		return
	end
	managers.menu:open_node("blackmarket_preview_mask_node", {})
	managers.blackmarket:view_customized_mask_with_mod(data.category, data.name)
end

function BlackMarketGui:_warn_abort_customized_mask_callback(params)
	return managers.blackmarket:warn_abort_customize_mask(params)
end

function BlackMarketGui:_abort_customized_mask_callback()
	managers.blackmarket:abort_customize_mask()
	managers.menu:back(true)
end

function BlackMarketGui:buy_customized_mask_callback(data)
	local params = {}
	params.name = managers.localization:text(tweak_data.blackmarket.masks[managers.blackmarket:get_customize_mask_id()].name_id)
	params.category = data.category
	params.slot = data.slot
	params.money = managers.experience:cash_string(managers.blackmarket:get_customize_mask_value())
	params.yes_func = callback(self, self, "_dialog_yes", callback(self, self, "_buy_customized_mask_callback", data))
	params.no_func = callback(self, self, "_dialog_no")
	managers.menu:show_confirm_blackmarket_finalize(params)
end

function BlackMarketGui:_buy_customized_mask_callback(data)
	managers.menu_component:post_event("item_buy")
	managers.blackmarket:finish_customize_mask()
	managers.menu:back(true)
end

function BlackMarketGui:choose_mask_part_callback(data)
	managers.blackmarket:select_customize_mask(data.category, data.name, data.global_value)
	self:reload()
end

function BlackMarketGui:buy_weapon_callback(data)
	local params = {}
	params.name = data.name_localized or data.name
	params.category = data.category
	params.slot = data.slot
	params.weapon = data.name
	params.money = managers.experience:cash_string(managers.money:get_weapon_price_modified(data.name))
	params.yes_func = callback(self, self, "_dialog_yes", callback(self, self, "_buy_weapon_callback", data))
	params.no_func = callback(self, self, "_dialog_no")
	managers.menu:show_confirm_blackmarket_buy(params)
end

function BlackMarketGui:show_available_mask_mods_callback(data)
	local mask_components = {}
	local masks = deep_clone(managers.blackmarket:get_inventory_masks() or {})
	for i, data in pairs(masks) do
		data.name_id = managers.localization:text(tweak_data.blackmarket.masks[data.mask_id].name_id)
	end
	local sort_td = tweak_data.blackmarket.masks
	local x_td, y_td, x_pc, y_pc
	table.sort(masks, function(x, y)
		return x.name_id < y.name_id
	end)
	mask_components.masks = masks
	local all_mods = {
		materials = managers.blackmarket:get_inventory_category("materials"),
		textures = managers.blackmarket:get_inventory_category("textures"),
		colors = managers.blackmarket:get_inventory_category("colors")
	}
	for _, type_category in ipairs({
		"materials",
		"textures",
		"colors"
	}) do
		local items = deep_clone(all_mods[type_category]) or {}
		local new_node_data = {}
		local category = type_category or data.category
		local default = managers.blackmarket:customize_mask_category_default(category)
		local mods = {}
		if default then
			table.insert(mods, default)
		end
		local td
		for i = 1, #items do
			td = tweak_data.blackmarket[category][items[i].id]
			if td.texture or td.colors then
				table.insert(mods, items[i])
			end
		end
		for i, data in pairs(mods) do
			data.name_id = managers.localization:text(tweak_data.blackmarket[type_category][data.id].name_id)
		end
		local sort_td = tweak_data.blackmarket[category]
		local x_pc, y_pc
		table.sort(mods, function(x, y)
			return x.name_id < y.name_id
		end)
		mask_components[type_category] = mods
	end
	local reload_gui = false
	local text_block = ""
	local color_table = {}
	local i = 1
	for _, category in ipairs({
		"masks",
		"materials",
		"textures",
		"colors"
	}) do
		local mods = mask_components[category]
		text_block = text_block .. "--- " .. managers.localization:to_upper_text("bm_menu_" .. category) .. " ---"
		for _, part_data in ipairs(mods) do
			local part_id = part_data.id or part_data.mask_id
			local global_value = part_data.global_value
			text_block = text_block .. [[

 ]]
			color_table[i] = tweak_data.lootdrop.global_values[global_value].color
			text_block = text_block .. "##" .. tostring(part_data.name_id) .. "##"
			if managers.blackmarket:check_new_drop(global_value, category, part_id) then
				text_block = text_block .. managers.localization:get_default_macro("BTN_INV_NEW")
				managers.blackmarket:remove_new_drop(global_value, category, part_id)
				reload_gui = true
			end
			i = i + 1
		end
		if category ~= "colors" then
			text_block = text_block .. [[


]]
		end
	end
	local params = {}
	params.color_table = color_table
	params.weapon_id = data.name
	params.text_block = text_block
	managers.menu:show_mask_mods_available(params)
	if reload_gui then
		self:reload()
	end
end

function BlackMarketGui:show_available_mods_callback(data)
	local dropable_mods = managers.blackmarket:get_dropable_mods_by_weapon_id(data.name)
	local text_block = ""
	local color_table = {}
	local index = table.size(dropable_mods)
	local sort_data = {}
	for category, mods in pairs(dropable_mods) do
		table.insert(sort_data, category)
	end
	table.sort(sort_data, function(x, y)
		return x < y
	end)
	local sort_td = tweak_data.blackmarket.weapon_mods
	local x_td, y_td, x_pc, y_pc
	
	local function sort_func(x, y)
		x_td = sort_td[x[1]]
		y_td = sort_td[y[1]]
		x_pc = x_td.value or x_td.pcs and x_td.pcs[1] or 0
		y_pc = y_td.value or y_td.pcs and y_td.pcs[1] or 0
		if x_td.infamous then
			x_pc = x_pc + 100
		end
		if y_td.infamous then
			y_pc = y_pc + 100
		end
		return x_pc < y_pc or x_pc == y_pc and x[1] < y[1]
	end
	
	for category, mods in pairs(dropable_mods) do
		table.sort(mods, sort_func)
	end
	local reload_gui = false
	local i = 1
	for _, category in ipairs(sort_data) do
		local mods = dropable_mods[category]
		text_block = text_block .. "--- " .. managers.localization:to_upper_text("bm_menu_" .. category) .. " ---"
		for _, part_data in ipairs(mods) do
			local part_id = part_data[1]
			local global_value = part_data[2]
			local got_part = managers.blackmarket:get_item_amount(global_value, "weapon_mods", part_id, true) > 0
			text_block = text_block .. [[

 ]]
			if got_part then
				color_table[i] = tweak_data.lootdrop.global_values[global_value].color
			else
				color_table[i] = Color(0.5, 0.5, 0.5)
			end
			text_block = text_block .. "##" .. managers.localization:text(tweak_data.weapon.factory.parts[part_id].name_id) .. "##"
			if managers.blackmarket:check_new_drop(global_value, "weapon_mods", part_id) then
				text_block = text_block .. managers.localization:get_default_macro("BTN_INV_NEW")
				managers.blackmarket:remove_new_drop(global_value, "weapon_mods", part_id)
				reload_gui = true
			end
			i = i + 1
		end
		index = index - 1
		if 0 < index then
			text_block = text_block .. [[


]]
		end
	end
	local params = {}
	params.color_table = color_table
	params.weapon_id = data.name
	params.text_block = text_block
	managers.menu:show_weapon_mods_available(params)
	if reload_gui then
		self:reload()
	end
end

function BlackMarketGui:_buy_mask_callback(data)
	managers.menu_component:post_event("item_buy")
	managers.blackmarket:on_buy_mask_to_inventory(data.name, data.global_value, data.slot)
	managers.menu:back(true, math.max(data.num_backs - 1, 0))
end

function BlackMarketGui:_buy_weapon_callback(data)
	managers.menu_component:post_event("item_buy")
	managers.blackmarket:on_buy_weapon_platform(data.category, data.name, data.slot)
	managers.menu:back(true)
end

function BlackMarketGui:preview_buy_weapon_callback(data)
	managers.blackmarket:view_weapon_platform(data.name, callback(self, self, "_open_preview_node"))
end

function BlackMarketGui:preview_buy_mask_callback(data)
	managers.menu:open_node("blackmarket_preview_mask_node", {})
	managers.blackmarket:view_mask_with_mask_id(data.name)
end

function BlackMarketGui:choose_mod_callback(data, prev_node_params)
	local mods = deep_clone(data.mods) or {}
	local new_node_data = {}
	local factory_id = managers.blackmarket:get_crafted_category(data.category)[data.slot].factory_id
	local mod_data = {}
	for i = 1, math.ceil(#mods / 9) do
		mod_data = {}
		for id = (i - 1) * 9 + 1, math.min(i * 9, #mods) do
			table.insert(mod_data, {
				mods[id],
				false
			})
		end
		table.insert(new_node_data, {
			name = tostring(i),
			category = data.category,
			prev_node_data = data,
			name_localized = tostring(i),
			on_create_func_name = "populate_mods",
			on_create_data = mod_data,
			identifier = self.identifiers.weapon_mod
		})
	end
	new_node_data.topic_id = "bm_menu_blackmarket_title"
	new_node_data.topic_params = {
		item = prev_node_params.weapon_name
	}
	new_node_data.show_tabs = true
	managers.menu:open_node(self._inception_node_name, {new_node_data})
end

function BlackMarketGui:buy_mod_callback(data)
	local params = {}
	params.name = data.name_localized or data.name
	params.category = data.category
	params.slot = data.slot
	params.weapon_name = managers.weapon_factory:get_weapon_name_by_factory_id(managers.blackmarket:get_crafted_category(data.category)[data.slot].factory_id)
	params.add = true
	local weapon_id = managers.blackmarket:get_crafted_category(data.category)[data.slot].weapon_id
	params.money = managers.experience:cash_string(managers.money:get_weapon_modify_price(weapon_id, data.name, data.global_value))
	local replaces, removes = managers.blackmarket:get_modify_weapon_consequence(data.category, data.slot, data.name)
	params.replaces = replaces or {}
	params.removes = removes or {}
	if data.default_mod then
		table.delete(replaces, data.default_mod)
		table.delete(removes, data.default_mod)
	end
	params.yes_func = callback(self, self, "_dialog_yes", callback(self, self, "_buy_mod_callback", data))
	params.no_func = callback(self, self, "_dialog_no")
	managers.menu:show_confirm_blackmarket_mod(params)
end

function BlackMarketGui:_buy_mod_callback(data)
	managers.menu_component:post_event("item_buy")
	managers.blackmarket:buy_and_modify_weapon(data.category, data.slot, data.global_value, data.name)
	self:reload()
end

function BlackMarketGui:preview_weapon_with_mod_callback(data)
	managers.blackmarket:view_weapon_with_mod(data.category, data.slot, data.name, callback(self, self, "_open_preview_node"))
end

function BlackMarketGui:remove_mod_callback(data)
	local params = {}
	params.name = managers.localization:text(tweak_data.weapon.factory.parts[data.name].name_id)
	params.category = data.category
	params.slot = data.slot
	params.weapon_name = managers.weapon_factory:get_weapon_name_by_factory_id(managers.blackmarket:get_crafted_category(data.category)[data.slot].factory_id)
	params.add = false
	local replaces, removes = managers.blackmarket:get_modify_weapon_consequence(data.category, data.slot, data.default_mod or data.name)
	local weapon_id = managers.blackmarket:get_crafted_category(data.category)[data.slot].weapon_id
	params.money = managers.experience:cash_string(managers.money:get_weapon_modify_price(weapon_id, data.name, data.global_value))
	params.replaces = replaces
	params.removes = removes
	params.yes_func = callback(self, self, "_dialog_yes", callback(self, self, "_remove_mod_callback", data))
	params.no_func = callback(self, self, "_dialog_no")
	managers.menu:show_confirm_blackmarket_mod(params)
end

function BlackMarketGui:_remove_mod_callback(data)
	managers.menu_component:post_event("item_sell")
	if data.default_mod then
		managers.blackmarket:buy_and_modify_weapon(data.category, data.slot, data.global_value, data.default_mod, true)
	else
		managers.blackmarket:on_sell_weapon_part(data.category, data.slot, data.global_value, data.name)
	end
	self:reload()
end

function BlackMarketGui:preview_weapon_without_mod_callback(data)
	if data.default_mod then
		managers.blackmarket:view_weapon_with_mod(data.category, data.slot, data.default_mod, callback(self, self, "_open_preview_node"))
	else
		managers.blackmarket:view_weapon_without_mod(data.category, data.slot, data.name, callback(self, self, "_open_preview_node"))
	end
end

function BlackMarketGui:lo_equip_deployable_callback(data)
	managers.blackmarket:equip_deployable(data.name)
	self:reload()
end

function BlackMarketGui:update_mod_mask()
	if not managers.blackmarket:currently_customizing_mask() then
		managers.menu:back(true)
	else
		managers.blackmarket:view_customized_mask()
	end
end

function BlackMarketGui:_dialog_yes(clbk)
	if clbk and type(clbk) == "function" then
		clbk()
	end
end

function BlackMarketGui:_dialog_no(clbk)
	if clbk and type(clbk) == "function" then
		clbk()
	end
end

function BlackMarketGui:destroy()
	for i, tab in pairs(self._tabs) do
		tab:destroy()
	end
end

function BlackMarketGui:close()
	WalletGuiObject.close_wallet(self._panel)
	self:destroy()
	self._ws:panel():remove(self._panel)
	self._fullscreen_ws:panel():remove(self._fullscreen_panel)
	if not managers.menu_component._menuscene_info_gui then
		managers.menu:active_menu().renderer.ws:show()
	end
end

function BlackMarketGui:_pre_reload()
	self._temp_panel = self._panel
	self._temp_fullscreen_panel = self._fullscreen_panel
	WalletGuiObject.close_wallet(self._panel)
	self:destroy()
	self._panel = nil
	self._fullscreen_panel = nil
	self._temp_panel:hide()
	self._temp_fullscreen_panel:hide()
end

function BlackMarketGui:_post_reload()
	self._ws:panel():remove(self._temp_panel)
	self._fullscreen_ws:panel():remove(self._temp_fullscreen_panel)
	self._temp_panel = nil
	self._temp_fullscreen_panel = nil
end

function BlackMarketGui:reload()
	self:_pre_reload()
	self._tabs = {}
	self._btns = {}
	self._equipped_comparision_data = {}
	BlackMarketGui._setup(self, false, self._data)
	self:_post_reload()
end
