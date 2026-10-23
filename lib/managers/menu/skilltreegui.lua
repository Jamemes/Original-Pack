local function fix_tier_line(points_spent_line, points_spent_panel, tier_panels)
	local fix = points_spent_panel:h() - 72
	local dh = fix > 0 and fix or 0
	points_spent_panel:set_h(dh)
	points_spent_line:create_sides(points_spent_panel, {
		sides = {
			2,
			2,
			2,
			2
		}
	})
	points_spent_line:set_clipping(dh == 0)
	points_spent_panel:set_world_center_x(tier_panels:child("tier_panel1"):child("lock"):world_center())
	points_spent_panel:set_world_bottom(tier_panels:child("tier_panel1"):world_bottom())
end

local data = SkillTreeSkillItem.init
function SkillTreeSkillItem:init(skill_id, tier_panel, num_skills, i, tree, tier, w, h, skill_refresh_skills)
	w = tier_panel:w() / 3
	data(self, skill_id, tier_panel, num_skills, i, tree, tier, w, h, skill_refresh_skills)

	local skill_panel = tier_panel:child(skill_id)
	local cx = tier_panel:w() / num_skills
	skill_panel:set_x((i - 1) * w)
end

local init = SkillTreePage.init
function SkillTreePage:init(tree, data, parent_panel, fullscreen_panel, tree_tab_h, skill_prerequisites)
	parent_panel:set_h(600)
	init(self, tree, data, parent_panel, fullscreen_panel, tree_tab_h, skill_prerequisites)

	local tier_panels = self._tree_panel:child("tier_panels")
	local h = tier_panels:child("tier_panel1"):h()
	
	if data.skill then
		local tier_panel = tier_panels:panel({
			name = "tier_panel0",
			h = h
		})
		tier_panel:set_top(self._tree_panel:child("rect1"):bottom())
		local item = SkillTreeUnlockItem:new(data.skill, tier_panel, tree, tier_panel:w() / 3, h)
		table.insert(self._items, 1, item)
		item:refresh(false)
	end

	fix_tier_line(self._points_spent_line, self._tree_panel:child("points_spent_panel"), self._tree_panel:child("tier_panels"))
end

local data = SkillTreePage.on_points_spent
function SkillTreePage:on_points_spent()
	data(self)
	
	fix_tier_line(self._points_spent_line, self._tree_panel:child("points_spent_panel"), self._tree_panel:child("tier_panels"))
end

Hooks:PostHook(SkillTreeGui, "init", "Update_2.SkillTreeGui.init", function(self)
	for _, item in pairs(self._panel:children()) do
		if item.type_name == "Text" and (item:text() == "|" or item:name() == "specialization_text") then
			item:hide()
		end
	end

	for _, item in pairs(self._skill_tree_panel:children()) do
		if item.type_name == "Text" and (item:name() == "skill_set_text" or item:name() == "switch_skills_button") then
			item:hide()
		end
	end
end)

function SkillTreeGui:mouse_moved(o, x, y)
	self:check_respec_button(x, y)
	if self._active_page then
		for _, item in ipairs(self._active_page._items) do
			if item:inside(x, y) then
				self:set_selected_item(item)
				return true
			end
		end
	end
	for _, tab_item in ipairs(self._tab_items) do
		if tab_item:inside(x, y) then
			self:set_selected_item(tab_item, true)
			return true
		end
	end
	if managers.menu:is_pc_controller() then
		if self._panel:child("back_button"):inside(x, y) then
			if not self._back_highlight then
				self._back_highlight = true
				self._panel:child("back_button"):set_color(tweak_data.screen_colors.button_stage_2)
				managers.menu_component:post_event("highlight")
			end
		else
			self._back_highlight = false
			self._panel:child("back_button"):set_color(tweak_data.screen_colors.button_stage_3)
		end
	end
	if self._panel:inside(x, y) then
		return true
	end
end

function SkillTreeGui:mouse_moved(o, x, y)
	self:check_respec_button(x, y)
	if self._active_page then
		for _, item in ipairs(self._active_page._items) do
			if item:inside(x, y) then
				self:set_selected_item(item)
				return true
			end
		end
	end
	for _, tab_item in ipairs(self._tab_items) do
		if tab_item:inside(x, y) then
			self:set_selected_item(tab_item, true)
			return true
		end
	end
	if managers.menu:is_pc_controller() then
		if self._panel:child("back_button"):inside(x, y) then
			if not self._back_highlight then
				self._back_highlight = true
				self._panel:child("back_button"):set_color(tweak_data.screen_colors.button_stage_2)
				managers.menu_component:post_event("highlight")
			end
		else
			self._back_highlight = false
			self._panel:child("back_button"):set_color(tweak_data.screen_colors.button_stage_3)
		end
	end
	if self._panel:inside(x, y) then
		return true
	end
end

function SkillTreeGui:mouse_released(button, x, y)
end

function SkillTreeGui:mouse_pressed(button, x, y)
	if self._renaming_skill_switch then
		self:_stop_rename_skill_switch()

		return
	end

	if not self._enabled then
		return
	end

	if self._spec_placing_points then
		return
	end

	if button == Idstring("mouse wheel down") then
		if self._is_skilltree_page_active then
			self:activate_next_tree_panel()
		end

		return
	elseif button == Idstring("mouse wheel up") then
		if self._is_skilltree_page_active then
			self:activate_prev_tree_panel()
		end

		return
	end

	if button == Idstring("0") then
		if self._panel:child("back_button"):inside(x, y) then
			managers.menu:back()

			return
		end

		if self._skill_tree_panel:child("respec_tree_button"):inside(x, y) then
			self:respec_active_tree()

			return
		end

		if self._active_page then
			for _, item in ipairs(self._active_page._items) do
				if item:inside(x, y) then
					self:place_point(item)

					return true
				end
			end
		end

		for _, tab_item in ipairs(self._tab_items) do
			if tab_item:inside(x, y) then
				if self._active_tree ~= tab_item:tree() then
					self:set_active_page(tab_item:tree(), true)
				end

				return true
			end
		end
	end
end