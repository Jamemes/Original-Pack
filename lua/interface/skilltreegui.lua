local NUM_TREES_PER_PAGE = 4

local function make_fine_text(text)
	local x, y, w, h = text:text_rect()

	text:set_size(w, h)
	text:set_position(math.round(text:x()), math.round(text:y()))
end

Hooks:PreHook(SkillTreeGui, "_update_borders", "perks", function(self)
	local spec_tabs_panel = self._specialization_panel:child("spec_tabs_panel")
	local spec_box_panel = self._specialization_panel:child("spec_box_panel")
	self._specialization_panel:set_y(28)
	spec_tabs_panel:set_y(32)
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

	local icon_atlas_texture = "guis/textures/pd2/specialization/icons_atlas"
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