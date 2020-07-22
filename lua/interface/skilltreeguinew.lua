local function make_fine_text(text_gui)
	local x, y, w, h = text_gui:text_rect()

	text_gui:set_size(w, h)
	text_gui:set_position(math.round(text_gui:x()), math.round(text_gui:y()))
end
local function fit_text_height(text_gui)
	local _, y, _, h = text_gui:text_rect()

	text_gui:set_h(h)
	text_gui:set_y(math.round(text_gui:y()))
end
local massive_font = tweak_data.menu.pd2_massive_font
local large_font = tweak_data.menu.pd2_large_font
local medium_font = tweak_data.menu.pd2_medium_font
local small_font = tweak_data.menu.pd2_small_font
local massive_font_size = tweak_data.menu.pd2_massive_font_size
local large_font_size = tweak_data.menu.pd2_large_font_size
local medium_font_size = tweak_data.menu.pd2_medium_font_size
local small_font_size = tweak_data.menu.pd2_small_font_size
local IS_WIN_32 = SystemInfo:platform() == Idstring("WIN32")
local NOT_WIN_32 = not IS_WIN_32
local TOP_ADJUSTMENT = NOT_WIN_32 and 45 or 45
local BOT_ADJUSTMENT = NOT_WIN_32 and 45 or 45
local BIG_PADDING = 13.5
local PADDING = 10
local PAGE_TREE_OVERLAP = 2
local SKILLS_WIDTH_PERCENT = 0.7
local PAGE_TAB_H = medium_font_size + 10

function NewSkillTreeGui:_setup()
	if alive(self._panel) then
		self._ws:panel():remove(self._panel)
	end

	self._panel = self._ws:panel():panel({
		name = "SkillTreePanel",
		layer = self._init_layer
	})
	self._fullscreen_panel = self._fullscreen_ws:panel():panel()

	WalletGuiObject.set_wallet(self._panel)

	local skilltree_text = self._panel:text({
		vertical = "top",
		name = "TitleText",
		align = "left",
		text = managers.localization:to_upper_text("menu_st_skilltree"),
		font = large_font,
		font_size = large_font_size,
		color = tweak_data.screen_colors.text
	})
	local x, y, w, h = skilltree_text:text_rect()

	skilltree_text:set_size(w, h)

	local title_bg_text = self._fullscreen_panel:text({
		name = "TitleTextBg",
		vertical = "top",
		h = 90,
		alpha = 0.4,
		align = "left",
		blend_mode = "add",
		layer = 1,
		text = skilltree_text:text(),
		font = massive_font,
		font_size = massive_font_size,
		color = tweak_data.screen_colors.button_stage_3
	})
	local x, y = managers.gui_data:safe_to_full_16_9(skilltree_text:world_x(), skilltree_text:world_center_y())

	title_bg_text:set_world_left(x)
	title_bg_text:set_world_center_y(y)
	title_bg_text:move(-13, 9)
	MenuBackdropGUI.animate_bg_text(self, title_bg_text)

	if managers.menu:is_pc_controller() then
		local back_button = self._panel:text({
			name = "BackButton",
			blend_mode = "add",
			text = managers.localization:to_upper_text("menu_back"),
			font = large_font,
			font_size = large_font_size,
			color = tweak_data.screen_colors.button_stage_3
		})

		make_fine_text(back_button)
		back_button:set_right(self._panel:w())
		back_button:set_bottom(self._panel:h())

		local back_bg_text = self._fullscreen_panel:text({
			name = "TitleTextBg",
			vertical = "top",
			h = 90,
			alpha = 0.4,
			align = "right",
			blend_mode = "add",
			layer = 1,
			text = back_button:text(),
			font = massive_font,
			font_size = massive_font_size,
			color = tweak_data.screen_colors.button_stage_3
		})
		local x, y = managers.gui_data:safe_to_full_16_9(back_button:world_right(), back_button:world_center_y())

		back_bg_text:set_world_right(x)
		back_bg_text:set_world_center_y(y)
		back_bg_text:move(13, 0)
		MenuBackdropGUI.animate_bg_text(self, back_bg_text)
	end

	local skills_panel = self._panel:panel({
		name = "SkillsRootPanel",
		layer = 1,
		w = self._panel:w() * SKILLS_WIDTH_PERCENT,
		h = self._panel:h() - 63
	})

	skills_panel:set_top(TOP_ADJUSTMENT + 16)
	skills_panel:set_left(0)

	local tab_panel = skills_panel:panel({
		name = "TabPanel",
		h = PAGE_TAB_H
	})

	tab_panel:set_top(0)
	tab_panel:set_left(0)

	local page_panel = skills_panel:panel({
		name = "PagePanel",
		h = skills_panel:h() - PAGE_TAB_H + PAGE_TREE_OVERLAP
	})

	page_panel:set_top(tab_panel:bottom() - PAGE_TREE_OVERLAP)
	page_panel:set_left(0)
	page_panel:set_w(773)
	page_panel:set_h(550)
	
	local tree_title_panel = page_panel:panel({
		name = "TreeTitlePanel",
		h = large_font_size
	})

	tree_title_panel:set_bottom(page_panel:h())
	tree_title_panel:set_left(0)
	tree_title_panel:set_w(2207)

	local tree_panel = page_panel:panel({
		name = "TreePanel",
		h = tree_title_panel:top()
	})

	tree_panel:set_top(0)
	tree_panel:set_left(0)

	local info_panel = self._panel:panel({
		name = "InfoRootPanel",
		layer = 1,
		w = self._panel:w() * (1.131 - SKILLS_WIDTH_PERCENT) - BIG_PADDING,
		h = tree_panel:h()
	})

	info_panel:set_world_top(tree_panel:world_y())
	info_panel:set_left(page_panel:w())

	local skillset_panel = page_panel:panel({
		name = "SkillSetPanel"
	})
	skillset_panel:set_left(page_panel:left())
	skillset_panel:set_bottom(page_panel:bottom() * 1.7 + 5)
	skillset_panel:set_w(140)
	local skillset_text = skillset_panel:text({
		name = "SkillSetText",
		blend_mode = "add",
		layer = 1,
		text = managers.localization:text("menu_st_skill_switch_set", {
			skill_switch = managers.skilltree:get_skill_switch_name(managers.skilltree:get_selected_skill_switch(), true)
		}),
		font = medium_font,
		font_size = medium_font_size,
		color = tweak_data.screen_colors.button_stage_3
	})

	make_fine_text(skillset_text)
	skillset_panel:set_h(skillset_text:bottom())
	
	local skillset_reset_text = page_panel:text({
		name = "SkillSetResetText",
		text = managers.localization:to_upper_text("menu_st_switch_skillset", {
					BTN_SKILLSET = managers.localization:btn_macro("menu_switch_skillset")
				}),
		font = medium_font,
		font_size = medium_font_size,
		blend_mode = "add",
		layer = 1,
		color = tweak_data.screen_colors.text
	})
	skillset_reset_text:set_left(page_panel:left())
	skillset_reset_text:set_bottom(page_panel:bottom() * 1.75)
	
	self._skillset_panel = skillset_panel
	local skillpoints_panel = self._panel:panel({
		name = "SkillPointsPanel"
	})
	skillpoints_panel:set_right(self._panel:right() * 1.4 + 10)
	skillpoints_panel:set_bottom(self._panel:bottom() * 1.8 - 2)
	local skillpoints_title_text = skillpoints_panel:text({
		name = "SkillPointsTitleText",
		blend_mode = "add",
		layer = 1,
		text = managers.localization:to_upper_text("menu_skillpoints"),
		font = medium_font,
		font_size = medium_font_size,
		color = tweak_data.screen_colors.text
	})
	local skillpoints_points_text = skillpoints_panel:text({
		name = "SkillPointsPointsText",
		blend_mode = "add",
		layer = 1,
		text = tostring(self._skilltree:points()),
		font = medium_font,
		font_size = medium_font_size,
		color = tweak_data.screen_colors.text
	})

	make_fine_text(skillpoints_title_text)
	make_fine_text(skillpoints_points_text)
	skillpoints_points_text:set_left(skillpoints_panel:left() / 2.01)
	skillpoints_panel:set_h(skillpoints_title_text:bottom())

	self._skill_points_title_text = skillpoints_title_text
	self._skill_points_text = skillpoints_points_text
	local color = self._skilltree:points() > 0 and tweak_data.screen_colors.text or tweak_data.screen_colors.important_1

	self._skill_points_title_text:set_color(color)
	self._skill_points_text:set_color(color)

	local description_panel = info_panel:panel({
		name = "DescriptionPanel",
		h = 434,
		w = 425
	})
	local description_title_text = description_panel:text({
		name = "DescriptionTitleText",
		text = "",
		font = medium_font,
		font_size = medium_font_size,
		blend_mode = "add",
		wrap = true,
		word_wrap = true
	})
	local description_text = description_panel:text({
		text = "",
		name = "DescriptionText",
		wrap = true,
		blend_mode = "add",
		word_wrap = true,
		font = small_font,
		font_size = small_font_size
	})

	description_title_text:grow(1, 1)
	description_title_text:move(PADDING, PADDING)
	description_text:grow(1, 1)
	description_text:move(PADDING, 16)

	self._tab_items = {}
	self._tree_items = {}
	self._active_page = 0
	self._active_tree_item = nil
	self._active_tier_item = nil
	self._selected_item = nil
	local pages = managers.skilltree:get_pages()
	local page_data = nil
	local tab_x = 0
	local page_tree_title_panel, page_tree_panel = nil

	for index, page in ipairs(tweak_data.skilltree.skill_pages_order) do
		page_data = pages[page]

		if page_data and tweak_data.skilltree.skilltree[page] then
			page_tree_title_panel = tree_title_panel:panel()
			page_tree_panel = tree_panel:panel()
			local tree = NewSkillTreePage:new(page, page_data, page_tree_title_panel, page_tree_panel, self._fullscreen_panel, self)

			table.insert(self._tree_items, tree)

			local tab_item = NewSkillTreeTabItem:new(tab_panel, page, tab_x, index, self, tree)
			tab_x = tab_item:next_page_position()

			table.insert(self._tab_items, tab_item)
		end
	end

	self._selected_page = self._tree_items[1]
	self._legend_buttons = {}
	local legends_panel = self._panel:panel({
		name = "LegendsPanel",
		w = self._panel:w() * 0.75,
		h = tweak_data.menu.pd2_medium_font_size
	})

	legends_panel:set_righttop(self._panel:w(), 0)
	legends_panel:text({
		text = "",
		name = "LegendText",
		align = "right",
		blend_mode = "add",
		vertical = "top",
		font = small_font,
		font_size = small_font_size,
		color = tweak_data.screen_colors.text
	})

	local legend_panel_reset_skills = self._panel:panel({
		name = "LegendPanelResetSkills",
		w = self._panel:w() * 0.75,
		h = tweak_data.menu.pd2_medium_font_size
	})

	legend_panel_reset_skills:set_righttop(self._panel:w() - 2, tweak_data.menu.pd2_medium_font_size)
	legend_panel_reset_skills:text({
		text = "RESET SKILLS",
		name = "LegendTextResetSkills",
		align = "right",
		blend_mode = "add",
		vertical = "top",
		font = small_font,
		font_size = small_font_size,
		color = tweak_data.screen_colors.text
	})
	local border_panel = tree_panel:panel({
		name = "BorderPanel"
	})
	border_panel:set_size(719, 434)
	BoxGuiObject:new(border_panel, {
		sides = {
			1,
			1,
			2,
			1
		}
	})
	BoxGuiObject:new(description_panel, {
		sides = {
			1,
			1,
			1,
			1
		}
	})

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
	self:set_active_page(1)
	self:_rec_round_object(self._panel)
end
function NewSkillTreeGui:_update_description(item)
	local desc_panel = self._panel:child("InfoRootPanel"):child("DescriptionPanel")
	local text_title = desc_panel:child("DescriptionTitleText")
	local text = desc_panel:child("DescriptionText")
	local tier = item:tier()
	local skill_id = item:skill_id()
	local tweak_data_skill = tweak_data.skilltree.skills[skill_id]
	local skill_stat_color = tweak_data.screen_colors.resource
	local color_replace_table = {}
	local points = self._skilltree:points() or 0
	local basic_cost = self._skilltree:get_skill_points(skill_id, 1) or 0
	local pro_cost = self._skilltree:get_skill_points(skill_id, 2) or 0
	local talent = tweak_data.skilltree.skills[skill_id]
	local unlocked = self._skilltree:skill_unlocked(nil, skill_id)
	local step = self._skilltree:next_skill_step(skill_id)
	local completed = self._skilltree:skill_completed(skill_id)
	local skill_descs = tweak_data.upgrades.skill_descs[skill_id] or {
		0,
		0
	}
	local spending_money = managers.money:total()
	local basic_color_index = 1
	local pro_color_index = 2 + (skill_descs[1] or 0)

	if step > 1 then
		basic_cost = utf8.to_upper(managers.localization:text("st_menu_skill_owned"))
		color_replace_table[basic_color_index] = tweak_data.screen_colors.resource
	else
		local money_cost = managers.money:get_skillpoint_cost(self._selected_item._tree, self._selected_item._tier, basic_cost)
		local can_afford = points >= basic_cost and spending_money >= money_cost
		color_replace_table[basic_color_index] = can_afford and tweak_data.screen_colors.resource or tweak_data.screen_colors.important_1
		basic_cost = managers.localization:text(basic_cost == 1 and "st_menu_point" or "st_menu_point_plural", {points = basic_cost}) .. " / " .. managers.experience:cash_string(money_cost)
	end
	if step > 2 then
		pro_cost = utf8.to_upper(managers.localization:text("st_menu_skill_owned"))
		color_replace_table[pro_color_index] = tweak_data.screen_colors.resource
	else
		local money_cost = managers.money:get_skillpoint_cost(self._selected_item._tree, self._selected_item._tier, pro_cost)
		local can_afford = points >= pro_cost and spending_money >= money_cost
		color_replace_table[pro_color_index] = can_afford and tweak_data.screen_colors.resource or tweak_data.screen_colors.important_1
		pro_cost = managers.localization:text(pro_cost == 1 and "st_menu_point" or "st_menu_point_plural", {points = pro_cost}) .. " / " .. managers.experience:cash_string(money_cost)
	end

	local macroes = {
		basic = basic_cost,
		pro = pro_cost
	}

	for i, d in pairs(skill_descs) do
		macroes[i] = d
	end

	local skill_btns = tweak_data.upgrades.skill_btns[skill_id]

	if skill_btns then
		for i, d in pairs(skill_btns) do
			macroes[i] = d()
		end
	end
	if tweak_data.skilltree.HIDE_TIER_BONUS then
		local skilltree = tweak_data.skilltree.trees[self._active_tree] and tweak_data.skilltree.trees[self._active_tree].skill or "NIL"
		local tier_descs = tweak_data.upgrades.skill_descs[tostring(skilltree) .. "_tier" .. tostring(self._selected_item._tier)]
		if tier == 1 then
			tier_bonus_text = "\n\n"
		elseif unlocked and step > 1 then
			tier_bonus_text = "\n\n" .. utf8.to_upper(managers.localization:text(unlocked and "menu_owned" or "st_menu_tier_locked")) .. "\n" .. managers.localization:text(tweak_data.skilltree.skills[tweak_data.skilltree.trees[self._selected_item._tree].skill][self._selected_item._tier].desc_id, tier_descs)
		else
			tier_bonus_text = "\n\n" .. utf8.to_upper(managers.localization:text(unlocked and "st_menu_tier_unlocked" or "st_menu_tier_locked")) .. "\n" .. managers.localization:text(tweak_data.skilltree.skills[tweak_data.skilltree.trees[self._selected_item._tree].skill][self._selected_item._tier].desc_id, tier_descs)
		end
		end
	local basic_cost = managers.skilltree:skill_cost(tier, 1)
	local aced_cost = managers.skilltree:skill_cost(tier, 2)
	local skill_string = managers.localization:to_upper_text(tweak_data_skill.name_id)
	local cost_string = managers.localization:to_upper_text(basic_cost == 1 and "st_menu_skill_cost_singular" or "st_menu_skill_cost", {
		basic = basic_cost,
		aced = aced_cost
	})
	local desc_string = managers.localization:text(tweak_data.skilltree.skills[skill_id].desc_id, macroes)
	local full_string = "\n\n" .. desc_string .. tier_bonus_text

	if (_G.IS_VR or managers.user:get_setting("show_vr_descs")) and tweak_data.vr.skill_descs_addons[skill_id] then
		local addon_data = tweak_data.vr.skill_descs_addons[skill_id]
		local vr_addon = managers.localization:text(addon_data.text_id, addon_data.macros)
		full_string = full_string .. "\n\n" .. managers.localization:text("menu_vr_skill_addon") .. "\n" .. vr_addon
	end

	text_title:set_text(skill_string)
	text:set_text(full_string)
	text:set_size(400, 400)
	managers.menu_component:make_color_text(text)
	text:set_font_size(small_font_size)

	local _, _, _, h = text:text_rect()

	while h > desc_panel:h() - text:top() do
		text:set_font_size(text:font_size() * 0.98)

		_, _, _, h = text:text_rect()
	end
end

function NewSkillTreeSkillItem:init(skill_id, skill_data, skill_panel, tree_panel, tree, tier, tier_item, fullscreen_panel, gui)
	NewSkillTreeSkillItem.super.init(self)
	self._gui = gui
	self._skilltree = managers.skilltree
	self._fullscreen_panel = fullscreen_panel
	self._tree = tree
	self._tier = tier
	self._tier_item = tier_item
	self._skill_panel = skill_panel
	self._tree_panel = tree_panel
	self._skill_id = skill_id
	self._selected = false
	self._can_refund = false
	self._event_listener = gui:event_listener()
	
	self._event_listener:add(skill_id, {
		"refresh"
	}, callback(self, self, "_on_refresh_event"))
	self._box = BoxGuiObject:new(skill_panel, {
		sides = {
			2,
			2,
			2,
			2
		}
	})
	self._box:hide()
	
	local skill_text = skill_panel:text({
		name = "SkillName",
		blend_mode = "add",
		rotation = 360,
		layer = 2,
		text = "",
		font = small_font,
		font_size = small_font_size,
		color = tweak_data.screen_colors.text
	})
	local owned_text = skill_panel:text({
		name = "OwnedName",
		text = managers.localization:to_upper_text("st_menu_skill_owned"),
		font = small_font,
		font_size = small_font_size,
		layer = 2,
		color = tweak_data.screen_colors.text,
		blend_mode = "add",
		rotation = 360,
		visible = false
	})
	local aced_text = skill_panel:text({
		name = "AcedName",
		text = managers.localization:to_upper_text("st_menu_skill_maxed"),
		font = small_font,
		font_size = small_font_size,
		layer = 2,
		color = tweak_data.screen_colors.text,
		blend_mode = "add",
		rotation = 360,
		visible = false
	})
	make_fine_text(skill_text)
	make_fine_text(owned_text)
	make_fine_text(aced_text)

	local icon_panel_size = skill_panel:h() - skill_text:h() - PADDING * 2
	local skill_icon_panel = skill_panel:panel({
		name = "SkillIconPanel",
		w = icon_panel_size,
		h = icon_panel_size
	})
	if tier == 1 then
		skill_panel:set_left(skill_panel:w() / 3)
	end

	skill_icon_panel:set_left()
	skill_icon_panel:set_top(PADDING - 4)
	skill_icon_panel:set_size(240, 72)
	skill_panel:set_size(240, 72)
	local texture_rect_x = skill_data.icon_xy and skill_data.icon_xy[1] or 0
	local texture_rect_y = skill_data.icon_xy and skill_data.icon_xy[2] or 0
	self._icon = skill_icon_panel:bitmap({
		texture = "guis/textures/pd2/skilltree/icons_atlas",
		name = "Icon",
		blend_mode = "normal",
		layer = 1,
		texture_rect = {
			texture_rect_x * 64,
			texture_rect_y * 64,
			64,
			64
		},
		rotation = 360,
		color = tweak_data.screen_colors.item_stage_3,
		blend_mode = "add",
		layer = 1
	})
	local locked = skill_icon_panel:bitmap({
		texture = "guis/textures/pd2/skilltree/padlock",
		name = "Locked",
		blend_mode = "normal",
		layer = 2,
		alpha = 0,
		color = tweak_data.screen_colors.text,
	})

	locked:set_center(skill_icon_panel:w() / 2, skill_icon_panel:h() / 2)

	local maxed_indicator = skill_icon_panel:bitmap({
		name = "MaxedIndicator",
		texture = "guis/textures/pd2/skilltree/ace",
		rotation = 360,
		blend_mode = "add"
	})

	maxed_indicator:set_center(self._icon:center_y() + 5, self._icon:center_x())

	self._current_size = self._unselected_size
	self._icon:set_left(4)
	self._icon:set_top(-2)
	skill_text:set_left(self._icon:right() + 4)
	skill_text:set_top(self._icon:center_x() - 9)
	owned_text:set_left(self._icon:right() + 4)
	owned_text:set_top(self._icon:center_x() - 9)
	aced_text:set_left(self._icon:right() + 4)
	aced_text:set_top(self._icon:center_x() - 9)
	self._connection = self._connection or {}

 self._tier_points_0 = tree_panel:text({
		name = "TierPointsZeros",
		align = "right",
		vertical = "top",
		font = small_font,
		font_size = small_font_size,
		color = tweak_data.screen_colors.item_stage_2,
		alpha = 0.4,
		rotation = 360,
		blend_mode = "add",
		layer = 1
	})
	self._tier_points = tree_panel:text({
		name = "TierPoints",
		align = "right",
		vertical = "top",
		font = small_font,
		font_size = small_font_size,
		color = tweak_data.screen_colors.item_stage_2,
		alpha = 0.6,
		rotation = 360,
		blend_mode = "add",
		layer = 1
	})
	local tier_points = managers.skilltree:tier_cost(tree, tier)
	self._tier_points_0:set_text(tier_points < 1 and "00" or tier_points < 10 and "0" or tier_points < 100 and " " or "")
	self._tier_points:set_text(tier_points > 0 and tier_points or "")
	local _, _, zero_w, zero_h = self._tier_points_0:text_rect()
	self._tier_points_0:set_size(zero_w, zero_h)
	self._tier_points:set_right(tree_panel:right() + 49)
	self._tier_points_0:set_right(tree_panel:right() + 42)
	if tier == 2 then
		self._tier_points:set_y(55 + 72 * 5)
		self._tier_points_0:set_y(55 + 72 * 5)
	elseif tier == 3 then
		self._tier_points:set_y(55 + 72 * 4)
		self._tier_points_0:set_y(55 + 72 * 4)
	elseif tier == 4 then
		self._tier_points:set_y(54 + 72 * 3)
		self._tier_points_0:set_y(54 + 72 * 3)
	elseif tier == 5 then
		self._tier_points:set_y(54 + 72 * 2)
		self._tier_points_0:set_y(54 + 72 * 2)
	elseif tier == 6 then
		self._tier_points:set_y(53 + 72)
		self._tier_points_0:set_y(53 + 72)
	elseif tier == 7 then
		self._tier_points:set_y(53)
		self._tier_points_0:set_y(53)
	elseif tier == 1 then
		self._tier_points:set_visible(false)
		self._tier_points_0:set_visible(false)
	end
	self._tier_points_needed_tier = tree_panel:text({
		name = "TierPointsNeededTier",
		align = "left",
		vertical = "top",
		font = small_font,
		font_size = small_font_size,
		color = tweak_data.screen_colors.item_stage_2,
		alpha = 0.6,
		blend_mode = "add",
		rotation = 360,
		layer = 1
	})
	self._tier_points_needed_tier:set_text(managers.localization:to_upper_text("menu_tier", {tier = tier - 1}))
	local _, _, tw, th = self._tier_points_needed_tier:text_rect()
	self._tier_points_needed_tier:set_size(tw, th)
	self._tier_points_needed_tier:set_right(tree_panel:right() + 14)
	if tier == 2 then
		self._tier_points_needed_tier:set_y(55 + 72 * 5)
	elseif tier == 3 then
		self._tier_points_needed_tier:set_y(55 + 72 * 4)
	elseif tier == 4 then
		self._tier_points_needed_tier:set_y(54 + 72 * 3)
	elseif tier == 5 then
		self._tier_points_needed_tier:set_y(54 + 72 * 2)
	elseif tier == 6 then
		self._tier_points_needed_tier:set_y(53 + 72)
	elseif tier == 7 then
		self._tier_points_needed_tier:set_y(53)
	elseif tier == 1 then
		self._tier_points_needed_tier:set_visible(false)
	end
	local add_infamy_glow = false
		if 0 < managers.experience:current_rank() then
			local tree_name = tweak_data.skilltree.trees[tree].skill
			for infamy, item in pairs(tweak_data.infamy.items) do
				if managers.infamy:owned(infamy) then
					local skilltree = item.upgrades and item.upgrades.skilltree
					if skilltree then
						local tree = skilltree.tree
						local trees = skilltree.trees
						if tree and tree == tree_name or trees and table.contains(trees, tree_name) then
							add_infamy_glow = true
						end
					end
				else
				end
			end
		end
		if add_infamy_glow then
			local glow = tree_panel:bitmap({
				name = "cost_glow",
				w = 56,
				h = 56,
				texture = "guis/textures/pd2/crimenet_marker_glow",
				blend_mode = "add",
				color = tweak_data.screen_colors.button_stage_3,
				rotation = 360,
				y = 1
			})
			local anim_pulse_glow = function(o)
				local t = 0
				local dt = 0
				while true do
					dt = coroutine.yield()
					t = (t + dt * 0.5) % 1
					o:set_alpha((math.sin(t * 180) * 0.5 + 0.5) * 0.18)
					
				end
			end
			if tier == 1 then
				glow:set_visible(false)
			end
			glow:set_center(self._tier_points_needed_tier:center())
			glow:set_center_x(self._tier_points_needed_tier:center() + 32)
			glow:animate(anim_pulse_glow)
		end
	self:refresh()
end
function NewSkillTreeSkillItem:refresh()
	if not alive(self._skill_panel) then
		return
	end

	local skill_id = self._skill_id
	local selected = self._selected
	local step = self._skilltree:next_skill_step(skill_id)
	local unlocked = managers.skilltree:skill_unlocked(self._tree, skill_id)
	local unlocked_tier = managers.skilltree:tier_unlocked(self._tree, self._tier)
	local completed = self._skilltree:skill_completed(skill_id)
	local skill_data = tweak_data.skilltree.skills[skill_id]
	local skill_panel = self._skill_panel
	local skill_icon_panel = self._skill_panel:child("SkillIconPanel")
	local skill_text = self._skill_panel:child("SkillName")
	local owned_text = self._skill_panel:child("OwnedName")
	local aced_text = self._skill_panel:child("AcedName")
	local icon = skill_icon_panel:child("Icon")
	local locked = skill_icon_panel:child("Locked")
	local maxed_indicator = skill_icon_panel:child("MaxedIndicator")
	if step > 2 and selected or step > 1 and selected then
		owned_text:set_visible(false)
		aced_text:set_visible(false)
	elseif step > 2 then
		owned_text:set_visible(false)
		aced_text:set_visible(true)
	elseif step > 1 then
		owned_text:set_visible(true)
		aced_text:set_visible(false)
	else
		owned_text:set_visible(false)
		aced_text:set_visible(false)
	end
	if selected then
		if not self._tier then
			if step == 1 then
				skill_text:set_text(managers.localization:text("st_menu_unlock_profession", {
					profession = managers.localization:to_upper_text(tweak_data.skilltree.trees[self._tree].name_id),
					points = managers.skilltree:get_skill_points(self._skill_id, 1)
				}))
			else
				skill_text:set_text(managers.localization:text("st_menu_profession_unlocked", {
					profession = managers.localization:to_upper_text(tweak_data.skilltree.trees[self._tree].name_id)
				}))
			end
		elseif completed then
			skill_text:set_text(managers.localization:to_upper_text(""))
			aced_text:set_visible(true)
		elseif step == 2 then
			local points = managers.skilltree:get_skill_points(self._skill_id, 2)
			local cost = managers.money:get_skillpoint_cost(self._tree, self._tier, points)
			skill_text:set_text(managers.localization:to_upper_text("st_menu_buy_skill_pro" .. (points > 1 and "_plural" or ""), {
				cost = managers.experience:cash_string(cost),
				points = points
			}))
			skill_text:set_center_y(skill_panel:center_y() - 20)
		elseif not unlocked then
			skill_text:set_text(managers.localization:to_upper_text("st_menu_skill_locked"))
			skill_text:set_center_y(skill_panel:center_y() - 9)
		elseif step == 1 then
			local points = managers.skilltree:get_skill_points(self._skill_id, 1)
			local cost = managers.money:get_skillpoint_cost(self._tree, self._tier, points)
			skill_text:set_text(managers.localization:to_upper_text("st_menu_buy_skill_basic" .. (points > 1 and "_plural" or ""), {
				cost = managers.experience:cash_string(cost),
				points = points
			}))
			skill_text:set_center_y(skill_panel:center_y() - 20)
		else
			skill_text:set_text("MISSING")
		end
	elseif self._tier then
		if completed then
			skill_text_string = managers.localization:text("st_menu_skill_maxed")
		elseif step == 2 then
			skill_text_string = managers.localization:text("st_menu_skill_owned")
		end
	end
	if not unlocked then
		icon:set_color(tweak_data.screen_colors.item_stage_3)
		icon:set_alpha(0.6)
	elseif step == 1 or step == 0 then
		icon:set_color(tweak_data.screen_colors.item_stage_2)
		icon:set_alpha(1)
	else
		icon:set_color(tweak_data.screen_colors.text)
		icon:set_alpha(1)
	end
	if self._tier == 1 then
		maxed_indicator:set_visible(false)
	else
		maxed_indicator:set_visible(completed)
	end
	if self._tier == 1 then
		aced_text:set_text(managers.localization:to_upper_text("st_menu_skill_owned"))
	end
	if unlocked_tier then
		self._tier_points_needed_tier:set_color(tweak_data.screen_colors.text)
		self._tier_points_0:set_color(tweak_data.screen_colors.text)
		self._tier_points:set_color(tweak_data.screen_colors.text)
	else
		self._tier_points_needed_tier:set_color(tweak_data.screen_colors.item_stage_2)
		self._tier_points_0:set_color(tweak_data.screen_colors.item_stage_2)
		self._tier_points:set_color(tweak_data.screen_colors.item_stage_2)
	end
	skill_text:set_visible(self._selected)
	self._box:set_visible(self._selected)
	locked:set_visible(not unlocked)
	self:_update_can_refund()
end

function NewSkillTreeTreeItem:init(tree, tree_data, tree_panel, fullscreen_panel, gui, page)
	NewSkillTreeTreeItem.super.init(self)

	self._gui = gui
	self._selected = false
	self._tiers = {}
	self._tree_panel = tree_panel
	self._tree = tree
	self._page = page
	self._event_listener = gui:event_listener()

	self._event_listener:add(tree_data, {
		"refresh"
	}, callback(self, self, "_on_refresh_event"))

	local num_tiers = #tree_data.tiers
	local tier_height = tree_panel:h() / num_tiers
	local tier_panel, tier_item = nil

	for tier, tier_data in ipairs(tree_data.tiers) do
		tier_panel = tree_panel:panel({
			name = "Tier" .. tostring(tier),
			h = tier_height,
			y = (num_tiers - tier) * tier_height
		})
		tier_item = NewSkillTreeTierItem:new(tier, tier_data, tier_panel, tree_panel, tree, self, fullscreen_panel, gui)
		self._tiers[tier] = tier_item
	end

	for tier, tier_item in ipairs(self._tiers) do
		tier_item:link(self._tiers[tier + 1], self._tiers[tier - 1])
		tier_item:connect(self._tiers[tier + 1])
	end

	local tier, points_spent, points_max = self:_tree_points()
	local tier_height = self._tree_panel:h() / num_tiers
	tree_panel:set_w(775)
	local progress_panel = tree_panel:panel({
		name = "ProgressPanel",
		w = 4,
		h = 365
	})
	progress_panel:set_right(745)
	progress_panel:set_y(70)
	self._progress_start = self._tree_panel:h()
	self._progress_tier_height = tier_height
	self._progress_pos_current = math.max(0, self._progress_start - self._progress_tier_height * tier - self._progress_tier_height * points_spent / points_max)
	self._progress_pos_wanted = self._progress_pos_current
	self._progress = progress_panel:panel({
		name = "ProgressBox"
	})
	self._points_spent_line = BoxGuiObject:new(self._progress, {
		sides = {
			2,
			2,
			2,
			2
		}
	})
	self._progress:set_y(self._progress_pos_current)
end

function NewSkillTreeTierItem:refresh_points(selected)
end
function NewSkillTreeTierItem:_refresh_tier_text()
end
function NewSkillTreeTierItem:init(tier, tier_data, tier_panel, tree_panel, tree, tree_item, fullscreen_panel, gui)
	NewSkillTreeTierItem.super.init(self)

	local skilltrees_tweak = tweak_data.skilltree.skills
	self._gui = gui
	self._tree = tree
	self._tree_item = tree_item
	self._tier = tier
	self._tier_panel = tier_panel
	self._skills = {}
	self._skills_ordered = {}
	local num_skills = #tier_data
	local skill_width = tier_panel:w() / num_skills
	local skill_x = 0
	local skill_data, skill_panel, skill_item = nil

	for index, skill_id in ipairs(tier_data) do
		skill_data = skilltrees_tweak[skill_id]

		if skill_data then
			skill_panel = tier_panel:panel({
				name = "Skill" .. string.capitalize(skill_id),
				x = skill_x,
				w = skill_width
			})
			skill_x = skill_panel:right()
			skill_item = NewSkillTreeSkillItem:new(skill_id, skill_data, skill_panel, tree_panel, tree, tier, self, fullscreen_panel, gui)
			self._skills[skill_id] = skill_item

			table.insert(self._skills_ordered, skill_id)
		end
	end

	for index, skill_id in ipairs(self._skills_ordered) do
		local left_item = self._skills[self._skills_ordered[index - 1]]
		local right_item = self._skills[self._skills_ordered[index + 1]]

		self._skills[skill_id]:link(left_item, right_item, nil, nil)
		self._skills[skill_id]:connect(right_item)
	end

	self:refresh()
end

function NewSkillTreeGui:_update_legends(item)
	local legend_panel = self._panel:child("LegendsPanel")
	local text = legend_panel:child("LegendText")
	local skill_id = item:skill_id()
	local tier = item:tier()
	local tree = item:tree()
	local step = self._skilltree:next_skill_step(skill_id)
	local unlocked = self._skilltree:skill_unlocked(tree, skill_id)
	local completed = self._skilltree:skill_completed(skill_id)
	local skill_data = tweak_data.skilltree.skills[skill_id]
	local can_invest = unlocked and not completed
	local can_refund = step > 1
	local legends = {}

	if managers.menu:is_pc_controller() then
		if can_refund then
			table.insert(legends, {
				string_id = "menu_mouse_refund",
				texture = "guis/textures/pd2/mouse_buttons",
				texture_rect = {
					35,
					1,
					17,
					23
				},
				w = 17,
				h = 23
			})
		end
		if can_invest then
			table.insert(legends, {
				string_id = "menu_mouse_invest_fast",
				texture = "guis/textures/pd2/mouse_buttons",
				texture_rect = {
					18,
					1,
					17,
					23
				},
				w = 17,
				h = 23
			})
			table.insert(legends, {
				string_id = "menu_mouse_invest",
				texture = "guis/textures/pd2/mouse_buttons",
				texture_rect = {
					1,
					1,
					17,
					23
				},
				w = 17,
				h = 23
			})
		end
	else
		if can_refund then
			table.insert(legends, {
				string_id = "menu_controller_refund"
			})
		end
		if can_invest then
			table.insert(legends, {
				string_id = "menu_controller_invest_fast"
			})
			table.insert(legends, {
				string_id = "menu_controller_invest"
			})
		end

	end

	legend_panel:clear()

	local text, icon = nil
	local right = legend_panel:w()

	for _, legend in ipairs(legends) do
		text, icon = nil

		if legend.string_id then
			text = legend_panel:text({
				blend_mode = "add",
				text = managers.localization:to_upper_text(legend.string_id, {
					BTN_SKILLSET = managers.localization:btn_macro("menu_switch_skillset")
				}),
				font = small_font,
				font_size = small_font_size
			})

			make_fine_text(text)
			text:set_right(right)

			right = text:left()
		end

		if legend.texture then
			icon = legend_panel:bitmap({
				texture = legend.texture,
				texture_rect = legend.texture_rect,
				w = legend.w,
				h = legend.h
			})

			icon:set_right(right)

			right = icon:left()
		end

		if text and legend.is_button then
			text:set_color(managers.menu:is_pc_controller() and tweak_data.screen_colors.button_stage_3 or Color.white)
			table.insert(self._legend_buttons, {
				text = text,
				callback = legend.callback
			})
		end

		right = right - 10
	end
end
function NewSkillTreeGui:refresh_reset_skills_legends(trees_idx)
	local legend_panel_reset_skills = self._panel:child("LegendPanelResetSkills")

	legend_panel_reset_skills:clear()
	legend_panel_reset_skills:set_size(1000, 1000)

	local localization = managers.localization
	local right = legend_panel_reset_skills:w()


	if self:has_tree_spent_points(trees_idx) then
		local text = legend_panel_reset_skills:text({
			blend_mode = "add",
			text = localization:to_upper_text("skill_tree_reset_skills_button", {
				BTN_RESET_SKILLS = localization:btn_macro("menu_respec_tree_all")
			}),
			font = medium_font,
			font_size = medium_font_size,
			color = managers.menu:is_pc_controller() and tweak_data.screen_colors.button_stage_3 or Color.white
		})

		make_fine_text(text)
		text:set_position(legend_panel_reset_skills:center_x() / 4.2 + 1, legend_panel_reset_skills:center_y() + 14)
		table.insert(self._legend_buttons, {
			text = text,
			callback = function ()
				self:respec_page(self._tree_items[self._active_page])
			end
		})
	end
end

function NewSkillTreeGui:mouse_pressed(button, x, y)
	if self._renaming_skill_switch then
		self:_stop_rename_skill_switch()

		return
	end

	if not self._enabled then
		return
	end

	if button == Idstring("0") and self._skillset_panel:inside(x, y) then
		self:_start_rename_skill_switch()

		return
	end

	if button == Idstring("mouse wheel down") then
		self:next_page()

		return
	elseif button == Idstring("mouse wheel up") then
		self:previous_page()

		return
	end

	local invest_button_pressed = button == Idstring("0")
	local fast_invest_button_pressed = button == Idstring("1")
	local refund_button_pressed = button == Idstring("2")
	local fast_refund_button_pressed = button == Idstring("3")

	if self._selected_item and self._selected_item:inside(x, y) then
		if invest_button_pressed then
			self:invest_point(self._selected_item)
			return
		elseif fast_invest_button_pressed then
			self:fast_invest_point(self._selected_item)
			return
		elseif fast_refund_button_pressed then
			self:fast_refund_point(self._selected_item)
			return
		elseif refund_button_pressed then
			self:refund_point(self._selected_item)
			return
		end
	end

	if invest_button_pressed and self._selected_tab and self._selected_tab:inside(x, y) then
		self:set_active_page(self._selected_tab:index())

		return
	end

	if managers.menu:is_pc_controller() then
		if self._back_highlight and self._panel:child("BackButton"):inside(x, y) then
			managers.menu:back()

			return
		end

		for _, legend in ipairs(self._legend_buttons) do
			if alive(legend.text) and legend.text:inside(x, y) then
				if legend.callback then
					legend.callback()
				end

				return
			end
		end
	end
end

function NewSkillTreeGui:invest_point(item)
	local skill_id = item:skill_id()
	local step = self._skilltree:next_skill_step(skill_id)
	local unlocked = self._skilltree:skill_unlocked(nil, skill_id)
	local completed = self._skilltree:skill_completed(skill_id)
	local skill_data = tweak_data.skilltree.skills[skill_id]
	
	if step == 1 then
		self._points = managers.skilltree:get_skill_points(skill_id, 1) or 0
	elseif step == 2 then
		self._points = managers.skilltree:get_skill_points(skill_id, 2) or 0	
	end
	
	if not unlocked then
		item:flash()

		return
	end

	if completed then
		item:flash()

		return
	end
	
	if managers.money:total() < managers.money:get_skillpoint_cost(self._selected_item._tree, self._selected_item._tier, self._points) then
		item:flash()
		return
	end
	
	managers.menu:show_confirm_invest({
				yes_func=callback(self, self, "invest_confirm", self._selected_item),
				no_func=callback(self, self, "_dialog_confirm_no")
	})
end
function NewSkillTreeGui:invest_confirm(item)
	if item:invest() then
		local panel = item:panel()
		if step == 1 then
			self._points = managers.skilltree:get_skill_points(skill_id, 1) or 0
		elseif step == 2 then
			self._points = managers.skilltree:get_skill_points(skill_id, 2) or 0	
		end		
		managers.money:on_skillpoint_spent(self._selected_item._tree, self._selected_item._tier, self._points)
		SimpleGUIEffectSpewer.infamous_up(panel:left() + 32, panel:world_center_y(), self._fullscreen_panel)
		self:on_notify(item:tree(), {
			label = "refresh"
		})
		managers.menu_component:post_event("menu_skill_investment")
		self:update_item()
		self:reload_connections()
		WalletGuiObject.refresh()
		self:refresh_reset_skills_legends(self._selected_page:trees_idx())
	end
end
function NewSkillTreeGui:fast_invest_point(item)
	local skill_id = item:skill_id()
	local step = self._skilltree:next_skill_step(skill_id)
	local unlocked = self._skilltree:skill_unlocked(nil, skill_id)
	local completed = self._skilltree:skill_completed(skill_id)
	local skill_data = tweak_data.skilltree.skills[skill_id]
	if step == 1 then
			self._points = managers.skilltree:get_skill_points(skill_id, 1) or 0
	elseif step == 2 then
			self._points = managers.skilltree:get_skill_points(skill_id, 2) or 0	
	end	

	if not unlocked then
		item:flash()

		return
	end

	if completed then
		item:flash()

		return
	end
	
	if managers.money:total() < managers.money:get_skillpoint_cost(self._selected_item._tree, self._selected_item._tier, self._points) then
		item:flash()
		return
	end

	if item:invest() then	
		local panel = item:panel()
		managers.money:on_skillpoint_spent(self._selected_item._tree, self._selected_item._tier, self._points)
		SimpleGUIEffectSpewer.infamous_up(panel:left() + 32, panel:world_center_y(), self._fullscreen_panel)
		self:on_notify(item:tree(), {
			label = "refresh"
		})
		managers.menu_component:post_event("menu_skill_investment")
		self:update_item()
		self:reload_connections()
		WalletGuiObject.refresh()
		self:refresh_reset_skills_legends(self._selected_page:trees_idx())
	end
end
function NewSkillTreeGui:refund_point(item)
	local skill_id = item:skill_id()
	local step = self._skilltree:next_skill_step(skill_id)
	local completed = self._skilltree:skill_completed(skill_id)
	local skill_data = tweak_data.skilltree.skills[skill_id]
	local can_refund = item:can_refund()
	local cost = managers.money:get_skilltree_tree_respec_cost(self._selected_item._tree)

	if not can_refund then
		item:flash()

		return
	end
	managers.menu:show_confirm_refund({
				yes_func=callback(self, self, "refund_confirm", self._selected_item),
				no_func=callback(self, self, "_dialog_confirm_no")
	})
end
function NewSkillTreeGui:refund_confirm(item)
	local cost = managers.money:get_skilltree_tree_respec_cost(self._selected_item._tree)
	if item:refund() then
		self:on_notify(item:tree(), {
			label = "refresh"
		})
		managers.money:_add_to_total(cost / 10, {no_offshore = true})
		managers.menu_component:post_event("menu_skill_investment")
		self:update_item()
		self:reload_connections()
		WalletGuiObject.refresh()
		self:refresh_reset_skills_legends(self._selected_page:trees_idx())
	else
		item:flash()
	end
end
function NewSkillTreeGui:fast_refund_point(item)
	local skill_id = item:skill_id()
	local step = self._skilltree:next_skill_step(skill_id)
	local completed = self._skilltree:skill_completed(skill_id)
	local skill_data = tweak_data.skilltree.skills[skill_id]
	local can_refund = item:can_refund()
	local cost = managers.money:get_skilltree_tree_respec_cost(self._selected_item._tree)

	if not can_refund then
		item:flash()

		return
	end

	if item:refund() then
		self:on_notify(item:tree(), {
			label = "refresh"
		})
		managers.money:_add_to_total(cost / 10, {no_offshore = true})
		managers.menu_component:post_event("menu_skill_investment")
		self:update_item()
		self:reload_connections()
		WalletGuiObject.refresh()
		self:refresh_reset_skills_legends(self._selected_page:trees_idx())
	else
		item:flash()
	end
end
function NewSkillTreeGui:_dialog_respec_trees_yes(trees_idx)
	for i = 1, #trees_idx, 1 do
		local tree_idx = trees_idx[i]

		if self._skilltree:points_spent(tree_idx) > 0 then
			local cost = managers.money:get_skilltree_tree_respec_cost(self._selected_item._tree)
			self._skilltree:on_respec_tree(tree_idx)
			managers.money:_add_to_total(cost, {no_offshore = true})
		end
	end

	self._event_listener:call("refresh")
end
function NewSkillTreeGui:special_btn_pressed(button)
	if not self._enabled then
		return
	end

	if button == Idstring("menu_remove_skill") then
		self:refund_point(self._selected_item)

		return true
	elseif button == Idstring("menu_switch_skillset") then
		managers.menu:open_node("skill_switch", {})

		return
	elseif button == Idstring("menu_respec_tree_all") and self:has_tree_spent_points(self._selected_page:trees_idx()) then
		self:respec_page(self._tree_items[self._active_page])
		
		return
	end

	return false
end


--[[
IMAGE TRANSPARENCY
This value sets how see-through the background images are.
0 (minimum value) is invisible. 1 (maximum value) is very visible.

default: 0.6
--]]
local image_transparency = 0.6
--[[
ASPECT RATIO ADJUSTMENT METHOD
PAYDAY 2 normally scales background images to your game's resolution,
not the resolution the main menu is actually being displayed at. This
means using any aspect ratio except 16:9 could be cutting off portions
of the image. I've attempted to fix this so that the images are scaled
to the menu's actual rendered resolution.

For people who see black bars at their main menu, this should make
images fit a little better.

If it's causing problems, your menu doesn't render at 16:9 for some
reason, or you just want the old scaling method back, set
adjust_aspect_ratio = false.
--]]
local adjust_aspect_ratio = true
function NewSkillTreeGui:setbgimg(page, init)
	local bgpanels = { "_bg_image1", "_bg_image2", "_bg_image3", "_bg_image4", "_bg_image5" }

	if init then
		if self._fullscreen_ws then
			managers.gui_data:destroy_workspace(self._fullscreen_ws)
		end
		self._fullscreen_ws = nil
		self._fullscreen_panel = nil
		self._bg_image1 = nil
		self._bg_image2 = nil
		self._bg_image3 = nil
		self._bg_image4 = nil
		self._bg_image5 = nil

		self._fullscreen_ws = managers.gui_data:create_fullscreen_workspace()
		self._fullscreen_panel = self._fullscreen_ws:panel():panel({name = "fullscreen"})

		self._bg_image1 = self._fullscreen_panel:bitmap({
			name = "bg_image1",
			texture = "guis/textures/pd2/skilltree/bg_mastermind",
			w = self._fullscreen_panel:w(),
			h = self._fullscreen_panel:h(),
			layer = 1,
			blend_mode = "add"
		})

		self._bg_image2 = self._fullscreen_panel:bitmap({
			name = "bg_image2",
			texture = "guis/textures/pd2/skilltree/bg_enforcer",
			w = self._fullscreen_panel:w(),
			h = self._fullscreen_panel:h(),
			layer = 1,
			blend_mode = "add"
		})

		self._bg_image3 = self._fullscreen_panel:bitmap({
			name = "bg_image3",
			texture = "guis/textures/pd2/skilltree/bg_technician",
			w = self._fullscreen_panel:w(),
			h = self._fullscreen_panel:h(),
			layer = 1,
			blend_mode = "add"
		})

		self._bg_image4 = self._fullscreen_panel:bitmap({
			name = "bg_image4",
			texture = "guis/textures/pd2/skilltree/bg_ghost",
			w = self._fullscreen_panel:w(),
			h = self._fullscreen_panel:h(),
			layer = 1,
			blend_mode = "add"
		})

		self._bg_image5 = self._fullscreen_panel:bitmap({
			name = "bg_image5",
			texture = "guis/textures/pd2/skilltree/bg_fugitive",
			w = self._fullscreen_panel:w(),
			h = self._fullscreen_panel:h(),
			layer = 1,
			blend_mode = "add"
		})
	end


	for i, panel in ipairs(bgpanels) do
		self[panel]:set_alpha(image_transparency)
		local aspect = self._fullscreen_panel:w() / self._fullscreen_panel:h()
		local texture_width = self[panel]:texture_width()
		local texture_height = self[panel]:texture_height()

	if adjust_aspect_ratio == true then
		local correct_height = self._fullscreen_panel:w() / (16/9) -- actual menu aspect ratio
		self[panel]:set_size(correct_height, correct_height)
	else
		local sw = math.max(texture_width, texture_height * aspect)
		local sh = math.max(texture_height, texture_width / aspect)
		local dw = texture_width / sw
		local dh = texture_height / sh
		self[panel]:set_size(dw * self._fullscreen_panel:w(), dh * self._fullscreen_panel:h())
	end

		self[panel]:set_right(self._fullscreen_panel:w())
		self[panel]:set_center_y(self._fullscreen_panel:h() / 2)
	end

	for i, panel in ipairs(bgpanels) do
		self[panel]:set_visible(false)
	end

	if page == 1 then
		self._bg_image1:set_visible(true)
	elseif page == 2 then
		self._bg_image2:set_visible(true)
	elseif page == 3 then
		self._bg_image3:set_visible(true)
	elseif page == 4 then
		self._bg_image4:set_visible(true)
	elseif page == 5 then
		self._bg_image5:set_visible(true)
	end
end
Hooks:PreHook( NewSkillTreeGui , "init" , "gibskillbg_init" , function( self , params )
	NewSkillTreeGui:setbgimg(1, true)
end)
Hooks:PostHook( NewSkillTreeGui , "set_active_page" , "gibskillbg_setpage" , function( self , params )
	NewSkillTreeGui:setbgimg(self._active_page, false)
end)
Hooks:PostHook( NewSkillTreeGui , "close" , "gibtest2" , function( self , params )
	NewSkillTreeGui:setbgimg(0, false)
end)

