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