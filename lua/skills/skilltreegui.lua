local NOT_WIN_32 = SystemInfo:platform() ~= Idstring("WIN32")
local WIDTH_MULTIPLIER = NOT_WIN_32 and 0.6 or 0.6
local CONSOLE_PAGE_ADJUSTMENT = NOT_WIN_32 and 0 or 0
local TOP_ADJUSTMENT = NOT_WIN_32 and 50 or 60
local NUM_TREES_PER_PAGE = 4

local function make_fine_text(text)
	local x, y, w, h = text:text_rect()

	text:set_size(w, h)
	text:set_position(math.round(text:x()), math.round(text:y()))
end

function SkillTreeSkillItem:init(skill_id, tier_panel, num_skills, i, tree, tier, w, h, skill_refresh_skills)
	SkillTreeSkillItem.super.init(self)

	self._skill_id = skill_id
	self._tree = tree
	self._tier = tier
	local skill_panel = tier_panel:panel({
		name = skill_id,
		w = w,
		h = h
	})
	self._skill_panel = skill_panel
	self._skill_refresh_skills = skill_refresh_skills
	local skill = tweak_data.skilltree.skills[skill_id]
	self._skill_name = managers.localization:text(skill.name_id)
	local texture_rect_x = skill.icon_xy and skill.icon_xy[1] or 0
	local texture_rect_y = skill.icon_xy and skill.icon_xy[2] or 0
	self._base_size = h - 10
	local state_image = skill_panel:bitmap({
		texture = "guis/textures/pd2/skilltree/op_icons_atlas",
		name = "state_image",
		layer = 1,
		texture_rect = {
			texture_rect_x * 64,
			texture_rect_y * 64,
			64,
			64
		},
		color = tweak_data.screen_colors.item_stage_3
	})

	state_image:set_size(self._base_size, self._base_size)
	state_image:set_blend_mode("add")

	local skill_text = skill_panel:text({
		word_wrap = true,
		name = "skill_text",
		vertical = "center",
		wrap = true,
		align = "left",
		blend_mode = "add",
		text = "",
		layer = 3,
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		color = tweak_data.screen_colors.text,
		x = self._base_size + 10,
		w = skill_panel:w() - self._base_size - 10
	})

	state_image:set_x(5)
	state_image:set_center_y(skill_panel:h() / 2)

	self._inside_panel = skill_panel:panel({
		w = w - 10,
		h = h - 10
	})

	self._inside_panel:set_center(skill_panel:w() / 2, skill_panel:h() / 2)

	local cx = tier_panel:w() / num_skills
	skill_panel:set_x((i - 1) * w)

	self._box = BoxGuiObject:new(skill_panel, {
		sides = {
			2,
			2,
			2,
			2
		}
	})

	self._box:hide()

	local state_indicator = skill_panel:bitmap({
		texture = "guis/textures/pd2/skilltree/ace",
		name = "state_indicator",
		alpha = 0,
		layer = 0,
		color = Color.white:with_alpha(1)
	})

	state_indicator:set_size(state_image:w() * 2, state_image:h() * 2)
	state_indicator:set_blend_mode("add")
	state_indicator:set_rotation(360)
	state_indicator:set_center(state_image:center())
end

function SkillTreePage:init(tree, data, parent_panel, fullscreen_panel, tree_tab_h, skill_prerequisites)
	self._items = {}
	self._selected_item = nil
	self._tree = tree
	local tree_panel = parent_panel:panel({
		y = 0,
		visible = false,
		name = tostring(tree),
		w = math.round(parent_panel:w() * WIDTH_MULTIPLIER)
	})
	self._tree_panel = tree_panel
	self._bg_image = fullscreen_panel:bitmap({
		name = "bg_image",
		blend_mode = "add",
		layer = 1,
		texture = data.background_texture,
		w = fullscreen_panel:w(),
		h = fullscreen_panel:h()
	})

	self._bg_image:set_alpha(0.6)

	local aspect = fullscreen_panel:w() / fullscreen_panel:h()
	local texture_width = self._bg_image:texture_width()
	local texture_height = self._bg_image:texture_height()
	local sw = math.max(texture_width, texture_height * aspect)
	local sh = math.max(texture_height, texture_width / aspect)
	local dw = texture_width / sw
	local dh = texture_height / sh

	self._bg_image:set_size(dw * fullscreen_panel:w(), dh * fullscreen_panel:h())
	self._bg_image:set_right(fullscreen_panel:w())
	self._bg_image:set_center_y(fullscreen_panel:h() / 2)

	local panel_h = 0
	local h = (parent_panel:h() - tree_tab_h - TOP_ADJUSTMENT) / (8 - CONSOLE_PAGE_ADJUSTMENT)
	for i = 1, 7 do
		local color = Color.black
		local rect = tree_panel:rect({
			h = 2,
			blend_mode = "add",
			name = "rect" .. i,
			color = color
		})

		rect:set_bottom(tree_panel:h() - (i - CONSOLE_PAGE_ADJUSTMENT) * h)

		if true or i == 1 then
			rect:set_alpha(0)
			rect:hide()
		end
	end

	local tier_panels = tree_panel:panel({
		name = "tier_panels"
	})
	if data.skill then
		local tier_panel = tier_panels:panel({
			name = "tier_panel0",
			h = h
		})
		tier_panel:set_bottom(tree_panel:child("rect1"):top())
		local item = SkillTreeUnlockItem:new(data.skill, tier_panel, tree, tier_panel:w() / 3, h)
		table.insert(self._items, item)
		item:refresh(false)
	end
	for tier, tier_data in ipairs(data.tiers) do
		local unlocked = managers.skilltree:tier_unlocked(tree, tier)
		local tier_panel = tier_panels:panel({
			name = "tier_panel" .. tier,
			h = h
		})
		local num_skills = #tier_data

		tier_panel:set_bottom(tree_panel:child("rect" .. tostring(tier + 1)):top())

		local base_size = h
		local base_w = tier_panel:w() / math.max(#tier_data, 1)

		for i, skill_id in ipairs(tier_data) do
			local item = SkillTreeSkillItem:new(skill_id, tier_panel, num_skills, i, tree, tier, base_w, base_size, skill_prerequisites[skill_id])

			table.insert(self._items, item)
			item:refresh(not unlocked)
		end

		local tier_string = tostring(tier)
		local debug_text = tier_panel:text({
			word_wrap = false,
			name = "debug_text",
			wrap = false,
			align = "right",
			vertical = "bottom",
			blend_mode = "add",
			rotation = 360,
			layer = 2,
			text = tier_string,
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			h = tweak_data.menu.pd2_small_font_size,
			color = tweak_data.screen_colors.item_stage_3
		})

		debug_text:set_world_bottom(tree_panel:child("rect" .. tostring(tier + 1)):world_top() + 2)

		local _, _, tw, _ = debug_text:text_rect()

		debug_text:move(tw * 2, 0)

		local lock_image = tier_panel:bitmap({
			texture = "guis/textures/pd2/skilltree/padlock",
			name = "lock",
			layer = 3,
			w = tweak_data.menu.pd2_small_font_size,
			h = tweak_data.menu.pd2_small_font_size,
			color = tweak_data.screen_colors.item_stage_3
		})

		lock_image:set_blend_mode("add")
		lock_image:set_rotation(360)
		lock_image:set_world_position(debug_text:world_right(), debug_text:world_y() - 2)
		lock_image:set_visible(false)

		local add_infamy_glow = false

		if managers.experience:current_rank() > 0 then
			local tree_name = tweak_data.skilltree.trees[tree].skill

			for infamy, item in pairs(tweak_data.infamy.items) do
				if managers.infamy:owned(infamy) then
					local skilltree = item.upgrades and item.upgrades.skilltree

					if skilltree then
						local tree = skilltree.tree
						local trees = skilltree.trees

						if tree and tree == tree_name or trees and table.contains(trees, tree_name) then
							add_infamy_glow = true

							break
						end
					end
				end
			end
		end

		local cost_string = (managers.skilltree:tier_cost(tree, tier) < 10 and "0" or "") .. tostring(managers.skilltree:tier_cost(tree, tier))
		local cost_text = tier_panel:text({
			word_wrap = false,
			name = "cost_text",
			wrap = false,
			align = "left",
			vertical = "bottom",
			blend_mode = "add",
			rotation = 360,
			layer = 2,
			text = cost_string,
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			h = tweak_data.menu.pd2_small_font_size,
			color = tweak_data.screen_colors.item_stage_3
		})
		local x, y, w, h = cost_text:text_rect()

		cost_text:set_size(w, h)
		cost_text:set_world_bottom(tree_panel:child("rect" .. tostring(tier + 1)):world_top() + 2)
		cost_text:set_x(debug_text:right() + tw * 3)

		if add_infamy_glow then
			local glow = tier_panel:bitmap({
				texture = "guis/textures/pd2/crimenet_marker_glow",
				name = "cost_glow",
				h = 56,
				blend_mode = "add",
				w = 56,
				rotation = 360,
				color = tweak_data.screen_colors.button_stage_3
			})

			local function anim_pulse_glow(o)
				local t = 0
				local dt = 0

				while true do
					dt = coroutine.yield()
					t = (t + dt * 0.5) % 1

					o:set_alpha((math.sin(t * 180) * 0.5 + 0.5) * 0.8)
				end
			end

			glow:set_center(cost_text:center())
			glow:animate(anim_pulse_glow)
		end

		local color = unlocked and tweak_data.screen_colors.item_stage_1 or tweak_data.screen_colors.item_stage_2

		debug_text:set_color(color)
		cost_text:set_color(color)

		if not unlocked then
			-- Nothing
		end
	end

	local ps = managers.skilltree:points_spent(self._tree)
	local max_points = 1

	for _, tier in ipairs(tweak_data.skilltree.trees[self._tree].tiers) do
		for _, skill in ipairs(tier) do
			for to_unlock, _ in ipairs(tweak_data.skilltree.skills[skill]) do
				max_points = max_points + managers.skilltree:get_skill_points(skill, to_unlock)
			end
		end
	end

	local prev_tier_p = 0
	local next_tier_p = max_points
	local ct = 0

	for i = 1, 6 do
		local tier_unlocks = managers.skilltree:tier_cost(self._tree, i)

		if ps < tier_unlocks then
			next_tier_p = tier_unlocks

			break
		end

		ct = i
		prev_tier_p = tier_unlocks
	end

	local diff_p = next_tier_p - prev_tier_p
	local diff_ps = ps - prev_tier_p
	local dh = self._tree_panel:child("rect2"):bottom()
	local prev_tier_object = self._tree_panel:child("rect" .. tostring(ct + 1))
	local next_tier_object = self._tree_panel:child("rect" .. tostring(ct + 2))
	local prev_tier_y = prev_tier_object and prev_tier_object:top() or 0
	local next_tier_y = next_tier_object and next_tier_object:top() or 0

	if not next_tier_object then
		next_tier_object = self._tree_panel:child("rect" .. tostring(ct))
		next_tier_y = next_tier_object and next_tier_object:top() or 0
		next_tier_y = 2 * prev_tier_y - next_tier_y
	end

	if ct > 0 then
		dh = math.max(2, tier_panels:child("tier_panel1"):world_bottom() - math.lerp(prev_tier_y, next_tier_y, diff_ps / diff_p))
	else
		dh = 0
	end

	local points_spent_panel = tree_panel:panel({
		w = 4,
		name = "points_spent_panel",
		h = dh
	})
	self._points_spent_line = BoxGuiObject:new(points_spent_panel, {
		sides = {
			2,
			2,
			0,
			0
		}
	})

	self._points_spent_line:set_clipping(dh == 0)
	points_spent_panel:set_world_center_x(tier_panels:child("tier_panel1"):child("lock"):world_center())
	points_spent_panel:set_world_bottom(tier_panels:child("tier_panel1"):world_bottom())

	for i, item in ipairs(self._items) do
		item:link(i, self._items)
	end
end

function SkillTreePage:on_points_spent()
	local points_spent_panel = self._tree_panel:child("points_spent_panel")
	local tier_panels = self._tree_panel:child("tier_panels")
	local ps = managers.skilltree:points_spent(self._tree)
	local max_points = 1

	for _, tier in ipairs(tweak_data.skilltree.trees[self._tree].tiers) do
		for _, skill in ipairs(tier) do
			for to_unlock, _ in ipairs(tweak_data.skilltree.skills[skill]) do
				max_points = max_points + managers.skilltree:get_skill_points(skill, to_unlock)
			end
		end
	end

	local prev_tier_p = 0
	local next_tier_p = max_points
	local ct = 0

	for i = 1, 6 do
		local tier_unlocks = managers.skilltree:tier_cost(self._tree, i)

		if ps < tier_unlocks then
			next_tier_p = tier_unlocks

			break
		end

		ct = i
		prev_tier_p = tier_unlocks
	end

	local diff_p = next_tier_p - prev_tier_p
	local diff_ps = ps - prev_tier_p
	local dh = self._tree_panel:child("rect2"):bottom()
	local prev_tier_object = self._tree_panel:child("rect" .. tostring(ct + 1))
	local next_tier_object = self._tree_panel:child("rect" .. tostring(ct + 2))
	local prev_tier_y = prev_tier_object and prev_tier_object:top() or 0
	local next_tier_y = next_tier_object and next_tier_object:top() or 0

	if not next_tier_object then
		next_tier_object = self._tree_panel:child("rect" .. tostring(ct))
		next_tier_y = next_tier_object and next_tier_object:top() or 0
		next_tier_y = 2 * prev_tier_y - next_tier_y
	end

	if ct > 0 then
		dh = math.max(2, tier_panels:child("tier_panel1"):world_bottom() - math.lerp(prev_tier_y, next_tier_y, diff_ps / diff_p))
	else
		dh = 0
	end

	points_spent_panel:set_h(dh)
	self._points_spent_line:create_sides(points_spent_panel, {
		sides = {
			2,
			2,
			2,
			2
		}
	})
	self._points_spent_line:set_clipping(dh == 0)
	points_spent_panel:set_world_center_x(tier_panels:child("tier_panel1"):child("lock"):world_center())
	points_spent_panel:set_world_bottom(tier_panels:child("tier_panel1"):world_bottom())
end

Hooks:PreHook(SkillTreeGui, "_update_borders", "perks", function(self)
	local tree_tabs_panel = self._skill_tree_panel:child("tree_tabs_panel")
	local spec_tabs_panel = self._specialization_panel:child("spec_tabs_panel")
	tree_tabs_panel:set_y(TOP_ADJUSTMENT + 1)
	spec_tabs_panel:set_y(TOP_ADJUSTMENT + 1)
end)

function SpecializationTierItem:init(tier_data, tree_panel, tree, tier, x, y, w, h)
	SpecializationTierItem.super.init(self)

	self._locked = false
	self._tree = tree
	self._tier = tier
	local specialization_descs = tweak_data.upgrades.specialization_descs[tree]
	specialization_descs = specialization_descs and specialization_descs[tier] or {}
	local macroes = {}

	for i, d in pairs(specialization_descs) do
		macroes[i] = d
	end

	self._tier_data = tier_data
	self._name_string = tier_data.name_id and managers.localization:text(tier_data.name_id) or "NO_NAME_" .. tostring(tree) .. "_" .. tostring(tier)
	self._desc_string = tier_data.desc_id and managers.localization:text(tier_data.desc_id, macroes) or "NO_DESC_" .. tostring(tree) .. "_" .. tostring(tier)

	if _G.IS_VR or managers.user:get_setting("show_vr_descs") then
		local vr_desc_data = tweak_data:get_raw_value("vr", "specialization_descs_addons", self._tree, self._tier)

		if vr_desc_data then
			local vr_string = managers.localization:text("menu_vr_skill_addon") .. " " .. managers.localization:text(vr_desc_data.desc_id, vr_desc_data.macros)
			self._desc_string = self._desc_string .. "\n\n" .. vr_string
		end
	end

	local tier_panel = tree_panel:panel({
		halign = "scale",
		valign = "scale",
		name = tostring(tier),
		x = x,
		y = y,
		w = w,
		h = h
	})
	self._tier_panel = tier_panel
	self._basic_size = {
		w + 46,
		h + 46
	}
	self._selected_size = {
		w + 46,
		h + 46
	}
	local texture = "guis/textures/pd2/specialization/perk_icon_card"
	local texture_rect = {
		0,
		0,
		64,
		92
	}
	local unlocked_bg = tier_panel:bitmap({
		name = "unlocked_bg",
		layer = 0,
		visible = false,
		valign = "scale",
		halign = "scale",
		w = 80,
		h = 80,
		rotation = 360,
		alpha = 2,
		texture = texture,
		texture_rect = texture_rect,
		color = Color.white
	})
	

	unlocked_bg:set_center_x(tier_panel:center() - 1)
	unlocked_bg:set_center_y(tier_panel:center() - 1)

	local texture_rect_x = tier_data.icon_xy and tier_data.icon_xy[1] or 0
	local texture_rect_y = tier_data.icon_xy and tier_data.icon_xy[2] or 0
	local guis_catalog = "guis/"

	if tier_data.texture_bundle_folder then
		guis_catalog = guis_catalog .. "dlcs/" .. tostring(tier_data.texture_bundle_folder) .. "/"
	end

	local icon_atlas_texture = "guis/textures/pd2/skilltree/op_icons_atlas"
	local tier_icon = tier_panel:bitmap({
		layer = 1,
		halign = "scale",
		valign = "scale",
		blend_mode = "add",
		name = tostring(math.random(1000000)),
		rotation = 360,
		alpha = 2,
		texture = icon_atlas_texture,
		texture_rect = {
			texture_rect_x * 64,
			texture_rect_y * 64,
			64,
			64
		},
		color = Color.white
	})

	tier_icon:grow(-5, -5)
	tier_icon:set_center(unlocked_bg:center())

	self._tier_icon = tier_icon
	local progress_circle = tier_panel:bitmap({
		texture = "guis/textures/pd2/specialization/progress_ring",
		name = "progress_circle_current",
		valign = "scale",
		visible = false,
		alpha = 0.5,
		halign = "scale",
		render_template = "VertexColorTexturedRadial",
		layer = 1,
		color = Color(0, 1, 1)
	})

	progress_circle:set_size(95, 95)
	progress_circle:set_blend_mode("add")
	progress_circle:set_center(unlocked_bg:center())

	local progress_circle = tier_panel:bitmap({
		texture = "guis/textures/pd2/specialization/progress_ring",
		name = "progress_circle",
		valign = "scale",
		visible = false,
		rotation = 360,
		alpha = 0.5,
		halign = "scale",
		render_template = "VertexColorTexturedRadial",
		layer = 1,
		color = Color(0, 1, 1)
	})

	progress_circle:set_size(95, 95)
	progress_circle:set_blend_mode("add")
	progress_circle:set_center(unlocked_bg:center())

	local progress_circle_bg = tier_panel:bitmap({
		texture = "guis/textures/pd2/specialization/progress_ring",
		name = "progress_circle_bg",
		valign = "scale",
		visible = false,
		rotation = 360,
		halign = "scale",
		alpha = 0.1,
		layer = 0,
		color = Color.white
	})

	progress_circle_bg:set_size(95, 95)
	progress_circle_bg:set_center(unlocked_bg:center())

	self._select_box_panel = self._tier_panel:panel({})
	self._select_box_panel:set_size(90, 90)
	
	self._inside_panel = self._select_box_panel:panel({})

	self._inside_panel:set_shape(6, 6, w + 730, h - 12)
	
	local tier_box_panel = tree_panel:panel({
		name = "tier_box_panel"
	})
	self._tier_box = BoxGuiObject:new(self._select_box_panel, {
		sides = {
			1,
			1,
			1,
			1
		}
	})
	
	self._tier_rect = self._select_box_panel:rect({
		alpha = 0.3,
		layer = -1,
		color = Color.black
	})
	
	self._select_box = BoxGuiObject:new(tier_box_panel, {
		sides = {
			1,
			1,
			1,
			1
		}
	})
	self._tier_rect = tier_box_panel:rect({
		alpha = 0.3,
		layer = -1,
		color = Color.black
	})
	self._select_box:hide()
	self._select_box:set_clipping(false)
	self:refresh()
end

Hooks:PreHook(SpecializationTierItem, "refresh", "perksrefresh", function(self)
	self._tier_rect:set_visible(self._selected)
end)

function SpecializationTreeItem:init(tree, parent_panel, tab_iem)
	self._items = {}
	self._parent_panel = parent_panel
	self._tree = tree
	self._tab_item = tab_iem
	local tree_panel = parent_panel:panel({
		alpha = 1,
		visible = true,
		name = tostring(tree)
	})
	self._tree_panel = tree_panel
	local max_tier = managers.skilltree:get_specialization_value(tree, "tiers", "max_tier")
	local num_trees_per_page = NUM_TREES_PER_PAGE
	local parent_h = parent_panel:h() - 24
	local x = 0
	local y = 0
	local w = math.round(100)
	local h = math.round(parent_h / num_trees_per_page)
	local size = math.min(w, h)
	h = math.round((parent_h - size) / (num_trees_per_page - 1))

	tree_panel:set_h(size)
	tree_panel:set_y(h * (tree - 1) + 24)

	if num_trees_per_page <= tree then
		tree_panel:move(0, -2)
	end

	local data = tweak_data.skilltree.specializations[tree]
	self._data = data
	local new_item = nil

	for tier, tier_data in ipairs(data) do
		x = math.round(w * (tier - 1) + (w - size) / 2 + 1)
		new_item = SpecializationTierItem:new(tier_data, tree_panel, tree, tier, x, y, size, size)

		table.insert(self._items, new_item)
	end

	local active_text = parent_panel:text({
		alpha = 0,
		blend_mode = "add",
		visible = true,
		x = 4,
		name = "active_text" .. tostring(self._tree),
		text = utf8.to_upper(tab_iem:name_string()),
		font = tweak_data.menu.pd2_medium_font,
		font_size = tweak_data.menu.pd2_medium_size,
		color = tweak_data.screen_colors.text
	})

	make_fine_text(active_text)
	active_text:set_left(tree_panel:left() + 120)
	active_text:set_center_y(tree_panel:center_y() - 10)
	
	local active_desc = parent_panel:text({
		alpha = 0,
		blend_mode = "add",
		visible = true,
		name = "active_desc" .. tostring(self._tree),
		text = utf8.to_upper(tab_iem:desc_string()),
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_size,
		color = tweak_data.screen_colors.text
	})
	
	make_fine_text(active_desc)
	active_desc:set_left(tree_panel:left() + 120)
	active_desc:set_center_y(tree_panel:center_y() + 20)

	local selected_text = parent_panel:text({
		alpha = 0,
		blend_mode = "add",
		visible = true,
		x = 4,
		name = "selected_text" .. tostring(self._tree),
		text = utf8.to_upper(tab_iem:name_string()),
		font = tweak_data.menu.pd2_medium_font,
		font_size = tweak_data.menu.pd2_medium_size,
		color = tweak_data.screen_colors.text
	})

	make_fine_text(selected_text)
	selected_text:set_left(tree_panel:left() + 120)
	selected_text:set_center_y(tree_panel:center_y())

	self._active_box_panel = parent_panel:panel({
		visible = false,
		name = "active_box_panel" .. tostring(self._tree)
	})

	self._active_box_panel:set_shape(tree_panel:shape())

	self._active_box = BoxGuiObject:new(self._active_box_panel, {
		sides = {
			1,
			1,
			2,
			2
		}
	})
	self._active_rect = self._active_box_panel:rect({
		alpha = 0.5,
		layer = -1,
		color = Color.black
	})
	local point_btns_panel = parent_panel:panel({
		alpha = 0,
		visible = true,
		name = "point_btns_panel" .. tostring(self._tree)
	})
	local reduce_points = point_btns_panel:bitmap({
		texture = "guis/textures/pd2/specialization/points_reduce",
		name = "reduce_points",
		h = 24,
		w = 24,
		visible = true,
		x = -45,
		y = -45,
		blend_mode = "add",
		rotation = 360,
		layer = 0
	})
	local increase_points = point_btns_panel:bitmap({
		texture = "guis/textures/pd2/specialization/points_add",
		name = "increase_points",
		h = 24,
		w = 24,
		rotation = 360,
		blend_mode = "add",
		visible = true,
		x = -45,
		y = -80,
		layer = 0
	})

	point_btns_panel:set_size(36, 16)
	point_btns_panel:set_top(tree_panel:bottom())

	local current_tier = managers.skilltree:get_specialization_value(self._tree, "tiers", "current_tier")
	local max_tier = managers.skilltree:get_specialization_value(self._tree, "tiers", "max_tier")

	self:refresh()
end

function SpecializationTreeItem:refresh()
	local current_specialization = managers.skilltree:get_specialization_value("current_specialization")
	self._active = self._tree == current_specialization

	local function anim_refresh(o)
		local start_alpha = self._tree_panel:alpha()
		local end_alpha = (self._active and 1 or 1) * (self._selected and 1 or 1)
		local alpha = start_alpha
		local is_done = false
		local dt = 0

		while not is_done do
			dt = coroutine.yield()
			alpha = math.step(alpha, end_alpha, dt)

			self._tree_panel:set_alpha(alpha)

			is_done = alpha == end_alpha

			for _, item in ipairs(self._items) do
				if not alive(item) then
					return
				end

				if not item:update_size(dt, self._selected) then
					is_done = false
				end
			end
		end
	end

	local current_tier = managers.skilltree:get_specialization_value(self._tree, "tiers", "current_tier")
	local max_tier = managers.skilltree:get_specialization_value(self._tree, "tiers", "max_tier")
	local point_btns_panel = self._parent_panel:child("point_btns_panel" .. tostring(self._tree))
	local reduce_points = point_btns_panel:child("reduce_points")
	local increase_points = point_btns_panel:child("increase_points")

	reduce_points:set_alpha(self._selected and 1 or 0)
	increase_points:set_alpha(self._selected and 1 or 0)

	local dlc = tweak_data:get_raw_value("skilltree", "specializations", self._tree, "dlc")
	local can_place_points = current_tier < max_tier and (not dlc or managers.dlc:is_dlc_unlocked(dlc))

	point_btns_panel:set_alpha(can_place_points and 1 or 0)

	if can_place_points then
		point_btns_panel:set_center_x(math.round(self._items[current_tier + 1]:panel():center_x()))
	end

	self._place_points_item = can_place_points and current_tier + 1 or false
	local active_text = self._parent_panel:child("active_text" .. tostring(self._tree))
	
	active_text:set_alpha(self._active and 1 or 0)

	local active_desc = self._parent_panel:child("active_desc" .. tostring(self._tree))
	
	active_desc:set_alpha(self._active and 1 or 0)

	local selected_text = self._parent_panel:child("selected_text" .. tostring(self._tree))

	selected_text:set_alpha(not self._active and self._selected and 1 or self._active and 0 or 1)
	self._active_box_panel:set_visible(self._active)
	self._tree_panel:stop()
	self._tree_panel:animate(anim_refresh)
end

function SpecializationTabItem:init(spec_tabs_panel, tree, data, w, x)
	SpecializationTabItem.super.init(self)

	self._data = data
	self._tree = tree
	self._spec_tab = spec_tabs_panel:panel({
		name = tostring(tree),
		w = w,
		x = x
	})
	self._name_string = data.name_id and managers.localization:text(data.name_id) or "NO_NAME_" .. tostring(tree)
	self._desc_string = data.desc_id and managers.localization:text(data.desc_id) or "NO_DESC_" .. tostring(tree)

	if data and data.dlc and tweak_data.lootdrop.global_values[data.dlc] then
		self._desc_string = self._desc_string
		self._desc_custom_color = tweak_data.lootdrop.global_values[data.dlc].color
	end

	self._spec_tab:text({
		word_wrap = false,
		name = "spec_tab_name",
		vertical = "center",
		wrap = false,
		align = "center",
		layer = 1,
		text = utf8.to_upper(self._name_string),
		font = tweak_data.menu.pd2_medium_font,
		font_size = tweak_data.menu.pd2_medium_font_size,
		color = tweak_data.screen_colors.button_stage_3
	})

	local _, _, tw, th = self._spec_tab:child("spec_tab_name"):text_rect()

	self._spec_tab:set_size(tw + 15, th + 10)
	self._spec_tab:child("spec_tab_name"):set_size(self._spec_tab:size())
	self._spec_tab:bitmap({
		texture = "guis/textures/pd2/shared_tab_box",
		name = "spec_tab_select_rect",
		visible = false,
		layer = 0,
		w = self._spec_tab:w(),
		h = self._spec_tab:h(),
		color = tweak_data.screen_colors.text
	})
	self._spec_tab:move(0, 0)
end