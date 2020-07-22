local unlock_rank = tweak_data.unlock_profiles
function MultiProfileItemGui:init(ws, panel)
	self._ws = ws
	local panel_w = self.profile_panel_w
	local panel_h = self.profile_panel_h
	local mcm = managers.menu_component

	if managers.menu:is_pc_controller() then
		panel_w = self.quick_panel_w + self.padding + self.profile_panel_w
		panel_h = math.max(self.quick_panel_h, self.profile_panel_h)
	end

	self._panel = self._panel or panel:panel({
		w = panel_w,
		h = panel_h
	})

	self._panel:set_bottom(panel:bottom() - 4)
	self._panel:set_center_x(panel:w() / 2)
	if managers.experience:current_rank() < unlock_rank then
		self._panel:hide()
	else
		self._panel:show()
	end
	self._profile_panel = self._profile_panel or self._panel:panel({
		w = self.profile_panel_w,
		h = self.profile_panel_h
	})

	self._profile_panel:set_center_y(self._panel:h() / 2)
	self._profile_panel:set_top(math.round(self._profile_panel:top()))

	local box_panel_w = self._profile_panel:w()

	if managers.menu:is_pc_controller() then
		self._quick_select_panel = self._quick_select_panel or self._panel:panel({
			w = self.quick_panel_w,
			h = self.quick_panel_h
		})

		self._quick_select_panel:set_left(self._profile_panel:right() + self.padding)
		self._quick_select_panel:set_center_y(self._panel:h() / 2)
		self._quick_select_panel:set_top(math.round(self._quick_select_panel:top()))

		if not self._quick_select_panel_elements then
			self._quick_select_panel_elements = {}

			table.insert(self._quick_select_panel_elements, self._quick_select_panel:rect({
				h = 3,
				y = 7,
				w = 5,
				x = 5,
				color = tweak_data.screen_colors.button_stage_3
			}))
			table.insert(self._quick_select_panel_elements, self._quick_select_panel:rect({
				h = 3,
				y = 7,
				w = 16,
				x = 12,
				color = tweak_data.screen_colors.button_stage_3
			}))
			table.insert(self._quick_select_panel_elements, self._quick_select_panel:rect({
				h = 3,
				y = 13,
				w = 5,
				x = 5,
				color = tweak_data.screen_colors.button_stage_3
			}))
			table.insert(self._quick_select_panel_elements, self._quick_select_panel:rect({
				h = 3,
				y = 13,
				w = 16,
				x = 12,
				color = tweak_data.screen_colors.button_stage_3
			}))
			table.insert(self._quick_select_panel_elements, self._quick_select_panel:rect({
				h = 3,
				y = 19,
				w = 5,
				x = 5,
				color = tweak_data.screen_colors.button_stage_3
			}))
			table.insert(self._quick_select_panel_elements, self._quick_select_panel:rect({
				h = 3,
				y = 19,
				w = 16,
				x = 12,
				color = tweak_data.screen_colors.button_stage_3
			}))
			table.insert(self._quick_select_panel_elements, self._quick_select_panel:rect({
				h = 3,
				y = 25,
				w = 5,
				x = 5,
				color = tweak_data.screen_colors.button_stage_3
			}))
			table.insert(self._quick_select_panel_elements, self._quick_select_panel:rect({
				h = 3,
				y = 25,
				w = 16,
				x = 12,
				color = tweak_data.screen_colors.button_stage_3
			}))
		end

		box_panel_w = box_panel_w + self.quick_panel_w + self.padding
	end

	self._box_panel = self._panel:panel()

	self._box_panel:rect({
		alpha = 0.4,
		layer = -100,
		color = Color.black
	})

	self._box = BoxGuiObject:new(self._box_panel, {
		sides = {
			1,
			1,
			1,
			1
		}
	})
	self._caret = self._profile_panel:rect({
		blend_mode = "add",
		name = "caret",
		h = 0,
		y = 0,
		w = 0,
		x = 0,
		color = Color(0.1, 1, 1, 1)
	})
	self._max_length = 15
	self._name_editing_enabled = true

	self:update()
end

function MultiProfileItemGui:mouse_moved(x, y)
	if managers.experience:current_rank() >= unlock_rank then
		local function anim_func(o, large)
			local current_width = o:w()
			local current_height = o:h()
			local end_width = large and 32 or 24
			local end_height = end_width
			local cx, cy = o:center()

			over(0.2, function (p)
				o:set_size(math.lerp(current_width, end_width, p), math.lerp(current_height, end_height, p))
				o:set_center(cx, cy)
			end)
		end

		local mult = managers.multi_profile
		local pointer, used = nil
		local arrow_left = self._profile_panel:child("arrow_left")
		self._arrow_selection = nil

		if arrow_left and mult:has_previous() then
			if arrow_left:inside(x, y) then
				if self._is_left_selected ~= true then
					arrow_left:set_color(tweak_data.screen_colors.button_stage_2)
					arrow_left:animate(anim_func, true)
					managers.menu_component:post_event("highlight")

					self._is_left_selected = true
				end

				self._arrow_selection = "left"
				pointer = "link"
				used = true
			elseif self._is_left_selected == true then
				arrow_left:set_color(tweak_data.screen_colors.button_stage_3)
				arrow_left:animate(anim_func, false)

				self._is_left_selected = false
			end
		end

		local arrow_right = self._profile_panel:child("arrow_right")

		if arrow_right and mult:has_next() then
			if arrow_right:inside(x, y) then
				if self._is_right_selected ~= true then
					arrow_right:set_color(tweak_data.screen_colors.button_stage_2)
					arrow_right:animate(anim_func, true)
					managers.menu_component:post_event("highlight")

					self._is_right_selected = true
				end

				self._arrow_selection = "right"
				pointer = "link"
				used = true
			elseif self._is_right_selected == true then
				arrow_right:set_color(tweak_data.screen_colors.button_stage_3)
				arrow_right:animate(anim_func, false)

				self._is_right_selected = false
			end
		end

		if alive(self._quick_select_panel) then
			if self._quick_select_panel:inside(x, y) then
				if self._is_quick_selected ~= true then
					for _, element in ipairs(self._quick_select_panel_elements) do
						element:set_color(tweak_data.screen_colors.button_stage_2)
					end

					managers.menu_component:post_event("highlight")

					self._is_quick_selected = true
				end

				self._arrow_selection = "quick"
				pointer = "link"
				used = true
			elseif self._is_quick_selected == true then
				for _, element in ipairs(self._quick_select_panel_elements) do
					element:set_color(tweak_data.screen_colors.button_stage_3)
				end

				self._is_quick_selected = false
			end
		end

		if self._name_text:inside(x, y) then
			if not self._name_selection then
				self._name_text:set_color(tweak_data.screen_colors.button_stage_2)
				managers.menu_component:post_event("highlight")
			end

			self._name_selection = true
			pointer = "link"
			used = true
		elseif self._name_selection then
			self._name_text:set_color(tweak_data.screen_colors.button_stage_3)

			self._name_selection = false
		end

	end
		return used, pointer
end

function MultiProfileItemGui:key_press(o, k)
	if not self._editing and not managers.experience:current_rank() < unlock_rank then
		return
	end

	local text = self._name_text
	self._key_pressed = k

	text:stop()
	text:animate(callback(self, self, "update_key_down"), k)
	self:handle_key(k, true)
	self:_update_caret()
end

function MultiProfileItemGui:key_release(o, k)
	if not self._editing and not managers.experience:current_rank() < unlock_rank then
		return
	end

	if self._key_pressed == k then
		self._key_pressed = nil
	end

	self:handle_key(k, false)
	self:_update_caret()
end
