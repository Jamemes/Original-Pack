local padding = 10
function HUDStatsScreen:init()
	self._full_hud_panel = managers.hud:script(managers.hud.STATS_SCREEN_FULLSCREEN).panel
	self._full_hud_panel:clear()
	local x_margine = 10
	local y_margine = 10
	local left_panel = self._full_hud_panel:panel({
		name = "left_panel",
		valign = "scale",
		w = self._full_hud_panel:w() / 3
	})
	left_panel:set_x(-left_panel:w())
	local blur_bg = left_panel:bitmap({
		name = "blur_bg",
		texture = "guis/textures/test_blur_df",
		w = left_panel:w(),
		h = left_panel:h(),
		valign = "scale",
		render_template = "VertexColorTexturedBlur3D",
		layer = -1,
		x = x_margine,
		y = y_margine,
		w = left_panel:w() - x_margine,
		h = left_panel:h() - y_margine * 2
	})
	local leftbox = HUDBGBox_create(left_panel, {
		valign = "scale",
		x = x_margine,
		y = y_margine,
		w = left_panel:w() - x_margine,
		h = left_panel:h() - y_margine * 2
	}, {
		color = Color.white,
		blend_mode = "normal"
	})
	leftbox:child("bg"):set_color(Color(0, 0, 0):with_alpha(0.75))
	leftbox:child("bg"):set_alpha(1)
	local objectives_title = left_panel:text({
		layer = 1,
		name = "objectives_title",
		color = Color.white,
		font_size = tweak_data.hud_stats.objectives_title_size,
		font = tweak_data.hud_stats.objectives_font,
		text = utf8.to_upper(managers.localization:text("hud_objective")),
		align = "left",
		vertical = "top",
		w = 512,
		h = 32
	})
	local x, y = managers.gui_data:corner_safe_to_full(0, 0)
	objectives_title:set_position(math.round(x), math.round(y))
	objectives_title:set_valign({
		math.round(y) / managers.gui_data:full_scaled_size().h,
		0
	})
	managers.hud:make_fine_text(objectives_title)
	local pad = 8
	local objectives_panel = left_panel:panel({
		layer = 1,
		name = "objectives_panel",
		x = math.round(objectives_title:x() + pad),
		y = math.round(objectives_title:bottom()),
		w = left_panel:w() - (objectives_title:x() + pad)
	})
	objectives_panel:set_valign({
		math.round(y) / managers.gui_data:full_scaled_size().h,
		0
	})
	local loot_wrapper_panel = left_panel:panel({
		visible = true,
		layer = 1,
		name = "loot_wrapper_panel",
		x = 0,
		y = 0 + math.round(managers.gui_data:full_scaled_size().height / 2),
		h = math.round(managers.gui_data:full_scaled_size().height / 2),
		w = left_panel:w()
	})
	loot_wrapper_panel:set_valign("center")
	local secured_loot_title = loot_wrapper_panel:text({
		layer = 1,
		valign = "center",
		name = "secured_loot_title",
		color = Color.white,
		font_size = tweak_data.hud_stats.loot_title_size,
		font = tweak_data.hud_stats.objectives_font,
		text = utf8.to_upper(managers.localization:text("hud_secured_loot")),
		align = "left",
		vertical = "top",
		w = 512,
		h = 32
	})
	secured_loot_title:set_position(math.round(x), 0)
	managers.hud:make_fine_text(secured_loot_title)
	local mission_bags_title = loot_wrapper_panel:text({
		layer = 1,
		valign = "center",
		name = "mission_bags_title",
		color = Color.white,
		font_size = tweak_data.hud_stats.loot_size,
		font = tweak_data.hud_stats.objectives_font,
		text = utf8.to_upper(managers.localization:text("hud_mission_bags")),
		align = "left",
		vertical = "top",
		w = 512,
		h = 32
	})
	mission_bags_title:set_position(math.round(x + pad), secured_loot_title:bottom())
	managers.hud:make_fine_text(mission_bags_title)
	local mission_bags_panel = loot_wrapper_panel:panel({
		visible = true,
		name = "mission_bags_panel",
		x = 0,
		y = 0,
		h = 44,
		w = left_panel:w()
	})
	mission_bags_panel:set_lefttop(mission_bags_title:leftbottom())
	mission_bags_panel:set_position(mission_bags_panel:x(), mission_bags_panel:y())
	local mission_bags_payout = loot_wrapper_panel:text({
		layer = 1,
		valign = "center",
		name = "mission_bags_payout",
		color = Color.white,
		font_size = tweak_data.hud_stats.loot_size,
		font = tweak_data.hud_stats.objectives_font,
		text = "",
		align = "left",
		vertical = "top",
		w = 512,
		h = 32
	})
	mission_bags_payout:set_text(utf8.to_upper(managers.localization:text("hud_bonus_bags_payout", {
		MONEY = managers.experience:cash_string(0)
	})))
	mission_bags_payout:set_position(mission_bags_title:left(), mission_bags_panel:bottom())
	managers.hud:make_fine_text(mission_bags_payout)
	mission_bags_payout:set_w(loot_wrapper_panel:w())
	local bonus_bags_title = loot_wrapper_panel:text({
		layer = 1,
		valign = "center",
		name = "bonus_bags_title",
		color = Color.white,
		font_size = tweak_data.hud_stats.loot_size,
		font = tweak_data.hud_stats.objectives_font,
		text = utf8.to_upper(managers.localization:text("hud_bonus_bags")),
		align = "left",
		vertical = "top",
		w = 512,
		h = 32
	})
	bonus_bags_title:set_position(math.round(x + pad), mission_bags_payout:bottom() + 4)
	managers.hud:make_fine_text(bonus_bags_title)
	local bonus_bags_panel = loot_wrapper_panel:panel({
		visible = true,
		name = "bonus_bags_panel",
		x = 0,
		y = 0,
		h = 44,
		w = left_panel:w()
	})
	bonus_bags_panel:set_lefttop(bonus_bags_title:leftbottom())
	bonus_bags_panel:set_position(bonus_bags_panel:x(), bonus_bags_panel:y())
	bonus_bags_panel:grow(-bonus_bags_panel:x(), 0)
	local bonus_bags_payout = loot_wrapper_panel:text({
		layer = 1,
		valign = "center",
		name = "bonus_bags_payout",
		color = Color.white,
		font_size = tweak_data.hud_stats.loot_size,
		font = tweak_data.hud_stats.objectives_font,
		text = "",
		align = "left",
		vertical = "top",
		w = 512,
		h = 32
	})
	bonus_bags_payout:set_text(utf8.to_upper(managers.localization:text("hud_bonus_bags_payout", {
		MONEY = managers.experience:cash_string(0)
	})))
	bonus_bags_payout:set_position(bonus_bags_title:left(), bonus_bags_panel:bottom())
	managers.hud:make_fine_text(bonus_bags_payout)
	bonus_bags_payout:set_w(loot_wrapper_panel:w())
	local instant_cash_title = loot_wrapper_panel:text({
		layer = 1,
		valign = "center",
		name = "instant_cash_title",
		color = Color.white,
		font_size = tweak_data.hud_stats.loot_size,
		font = tweak_data.hud_stats.objectives_font,
		text = utf8.to_upper(managers.localization:text("hud_instant_cash")),
		align = "left",
		vertical = "top",
		w = 512,
		h = 32
	})
	instant_cash_title:set_position(math.round(x + pad), bonus_bags_payout:bottom() + 4)
	managers.hud:make_fine_text(instant_cash_title)
	local instant_cash_text = loot_wrapper_panel:text({
		layer = 1,
		valign = "center",
		name = "instant_cash_text",
		color = Color.white,
		font_size = tweak_data.hud_stats.loot_size,
		font = tweak_data.hud_stats.objectives_font,
		text = managers.experience:cash_string(0),
		align = "left",
		vertical = "top",
		w = 512,
		h = 32
	})
	instant_cash_text:set_position(instant_cash_title:left(), instant_cash_title:bottom())
	managers.hud:make_fine_text(instant_cash_text)
	instant_cash_text:set_w(loot_wrapper_panel:w())
	local challenges_wrapper_panel = left_panel:panel({
		visible = false,
		layer = 1,
		valign = {0.5, 0.5},
		name = "challenges_wrapper_panel",
		x = 0,
		y = y + math.round(managers.gui_data:scaled_size().height / 2),
		h = math.round(managers.gui_data:scaled_size().height / 2),
		w = left_panel:w()
	})
	local _, by = managers.gui_data:corner_safe_to_full(0, managers.gui_data:corner_scaled_size().height)
	challenges_wrapper_panel:set_bottom(by)
	challenges_wrapper_panel:set_valign({
		by / managers.gui_data:full_scaled_size().h,
		0
	})
	local last_completed_challenge_title = challenges_wrapper_panel:text({
		layer = 1,
		valign = "center",
		name = "last_completed_challenge_title",
		color = Color.white,
		font_size = tweak_data.hud_stats.objectives_title_size,
		font = tweak_data.hud_stats.objectives_font,
		text_id = "victory_last_completed_challenge",
		align = "left",
		vertical = "top",
		w = 512,
		h = 32
	})
	last_completed_challenge_title:set_position(math.round(x), 0)
	managers.hud:make_fine_text(last_completed_challenge_title)
	local challenges_panel = challenges_wrapper_panel:panel({
		layer = 1,
		valign = "center",
		name = "challenges_panel",
		x = math.round(objectives_title:x() + pad),
		y = last_completed_challenge_title:bottom(),
		w = left_panel:w() - (last_completed_challenge_title:x() + pad)
	})
	local near_completion_title = challenges_wrapper_panel:text({
		layer = 1,
		valign = "center",
		name = "near_completion_title",
		color = Color.white,
		font_size = tweak_data.hud_stats.objectives_title_size,
		font = tweak_data.hud_stats.objectives_font,
		text_id = "menu_near_completion_challenges",
		align = "left",
		vertical = "top",
		w = 512,
		h = 32
	})
	near_completion_title:set_position(math.round(x), math.round(challenges_wrapper_panel:h() / 3))
	managers.hud:make_fine_text(near_completion_title)
	local near_completion_panel = challenges_wrapper_panel:panel({
		layer = 1,
		valign = "center",
		name = "near_completion_panel",
		x = math.round(objectives_title:x() + pad),
		y = near_completion_title:bottom(),
		w = left_panel:w() - (near_completion_title:x() + pad)
	})
	local bottom_panel = self._full_hud_panel:panel({
		name = "bottom_panel",
		h = y + 90 + 24,
		w = self._full_hud_panel:w() / 3 - x_margine * 2
	})
	bottom_panel:set_y(self._full_hud_panel:h())
	bottom_panel:set_x(self._full_hud_panel:w() / 3 + x_margine)
	local blur_bg = bottom_panel:bitmap({
		name = "blur_bg",
		texture = "guis/textures/test_blur_df",
		w = bottom_panel:w(),
		h = bottom_panel:h(),
		valign = "scale",
		render_template = "VertexColorTexturedBlur3D",
		layer = -1,
		h = bottom_panel:h() - y_margine
	})
	local bottombox = HUDBGBox_create(bottom_panel, {
		valign = "scale",
		h = bottom_panel:h() - y_margine
	}, {
		color = Color.white,
		blend_mode = "normal"
	})
	bottombox:child("bg"):set_color(Color(0, 0, 0):with_alpha(0.6))
	bottombox:child("bg"):set_alpha(1)
	local right_panel = self._full_hud_panel:panel({
		name = "right_panel",
		valign = "scale",
		w = self._full_hud_panel:w() / 3
	})
	right_panel:set_x(self._full_hud_panel:w())
	local blur_bg = right_panel:bitmap({
		name = "blur_bg",
		texture = "guis/textures/test_blur_df",
		w = right_panel:w(),
		h = right_panel:h(),
		valign = "scale",
		render_template = "VertexColorTexturedBlur3D",
		layer = -1,
		y = y_margine,
		h = right_panel:h() - y_margine * 2,
		w = right_panel:w() - x_margine
	})
	local rightbox = HUDBGBox_create(right_panel, {
		valign = "scale",
		y = y_margine,
		h = right_panel:h() - y_margine * 2,
		w = right_panel:w() - x_margine
	}, {
		color = Color.white,
		blend_mode = "normal"
	})
	rightbox:child("bg"):set_color(Color(0, 0, 0):with_alpha(0.75))
	rightbox:child("bg"):set_alpha(1)
	local days_title = right_panel:text({
		layer = 1,
		x = 20,
		y = y,
		name = "days_title",
		color = Color.white,
		font_size = tweak_data.hud_stats.loot_size,
		font = tweak_data.hud_stats.objectives_font,
		text = "DAY 1 OF 3",
		align = "left",
		vertical = "top",
		w = 512,
		h = 32
	})
	managers.hud:make_fine_text(days_title)
	days_title:set_w(right_panel:w())
	local day_wrapper_panel = right_panel:panel({
		visible = true,
		layer = 1,
		name = "day_wrapper_panel",
		x = 0,
		y = y + math.round(managers.gui_data:scaled_size().height / 2),
		h = math.round(managers.gui_data:scaled_size().height),
		w = right_panel:w()
	})
	day_wrapper_panel:set_position(days_title:x() + pad, days_title:bottom())
	day_wrapper_panel:set_w(right_panel:w() - x - day_wrapper_panel:x())
	local day_title = day_wrapper_panel:text({
		layer = 0,
		x = 0,
		y = 0,
		name = "day_title",
		color = Color.white,
		font_size = tweak_data.hud_stats.objectives_title_size,
		font = tweak_data.hud_stats.objectives_font,
		text = "BLUH!",
		align = "left",
		vertical = "top",
		w = 512,
		h = 32
	})
	if managers.job:is_current_job_professional() then
		day_title:set_color(Color.red)
	end
	managers.hud:make_fine_text(day_title)
	day_title:set_w(day_wrapper_panel:w())
	local pay_grade_title = day_wrapper_panel:text({ 
		name = "pay_grade_title", 
		font = tweak_data.menu.pd2_medium_font, 
		font_size = tweak_data.hud_stats.loot_size, 
		text = managers.localization:to_upper_text("cn_menu_contract_paygrade_header"), 
		color = Color.white
	})
	managers.hud:make_fine_text(pay_grade_title)
	pay_grade_title:set_top(math.round(day_title:bottom()))
	local paygrade_title = day_wrapper_panel:text({
		name = "paygrade_title",
		font = tweak_data.menu.pd2_medium_font,
		font_size = tweak_data.hud_stats.loot_size,
		text = managers.localization:to_upper_text("menu_lobby_difficulty_title"),
		color = tweak_data.screen_colors.text
	})
	managers.hud:make_fine_text(paygrade_title)
	paygrade_title:set_top(math.round(pay_grade_title:bottom()))
	local job_data = managers.job:current_job_data()
	if job_data then
		local job_stars = managers.job:current_job_stars()
		local job_and_difficulty_stars = managers.job:current_job_and_difficulty_stars()
		local difficulty_stars = managers.job:current_difficulty_stars()
		local difficulty = tweak_data.difficulties[difficulty_stars + 2] or 1
		local difficulty_string_id = tweak_data.difficulty_name_ids[difficulty]
		local difficulty_string = managers.localization:to_upper_text(difficulty_string_id)
		local difficulty_color = tweak_data.screen_colors.risk
		if managers.crime_spree:is_active() then
			difficulty_string = managers.localization:text("menu_cs_level", {
				level = managers.experience:cash_string(managers.crime_spree:server_spree_level(), "")
			})
			difficulty_color = tweak_data.screen_colors.crime_spree_risk
		end
		local risk_text = day_wrapper_panel:text({
			name = "risk_text",
			font = tweak_data.menu.pd2_medium_font,
			font_size = tweak_data.hud_stats.loot_size,
			text = difficulty_string,
			color = tweak_data.screen_colors.text
		})
		managers.hud:make_fine_text(risk_text)
		risk_text:set_top(math.round(paygrade_title:top()))
		risk_text:set_left(paygrade_title:right() + 8)
		if difficulty_stars > 0 then
			risk_text:set_color(difficulty_color)
		end
		local risk_color = tweak_data.screen_colors.risk
		local filled_star_rect = { 0, 32, 32, 32 }
		local empty_star_rect = { 32, 32, 32, 32 }
		local cy = pay_grade_title:center_y() - 4
		local sx = pay_grade_title:right() + 8
		local level_data = { 
			texture = "guis/textures/pd2/mission_briefing/difficulty_icons", 
			texture_rect = filled_star_rect, 
			w = 24, 
			h = 24, 
			color = tweak_data.screen_colors.text, 
			alpha = 1
		}
		for i = 1, job_stars do -- job_and_difficulty_stars do
			local x = sx + (i-1) * 26
			local is_risk = i>job_stars
			local star_data = level_data
			
			local star = day_wrapper_panel:bitmap( star_data )
			star:set_x(x)
			star:set_center_y( math.round(cy))
		end
	end
	local day_payout = day_wrapper_panel:text({
		layer = 0,
		x = 0,
		y = 0,
		name = "day_payout",
		color = Color.white,
		font_size = tweak_data.hud_stats.loot_size,
		font = tweak_data.hud_stats.objectives_font,
		text = "BLUH!",
		align = "left",
		vertical = "top",
		w = 512,
		h = 32
	})
	day_payout:set_text(utf8.to_upper(managers.localization:text("hud_day_payout", {
		MONEY = managers.experience:cash_string(0)
	})))
	managers.hud:make_fine_text(day_payout)
	day_payout:set_w(day_wrapper_panel:w())
	day_payout:set_y(math.round(paygrade_title:bottom()))
	local bains_plan = day_wrapper_panel:text({
		name = "bains_plan",
		text = managers.localization:to_upper_text("menu_description"),
		font = tweak_data.hud_stats.objective_desc_font,
		font_size = tweak_data.hud_stats.day_description_size + 2,
		color = Color(1, 1, 1, 1),
		align = "left",
		vertical = "top",
		wrap = true,
		word_wrap = true,
		h = 128
	})
	managers.hud:make_fine_text(bains_plan)
	bains_plan:set_y(math.round(day_payout:bottom() + 20))
	local day_description = day_wrapper_panel:text({
		name = "day_description",
		text = "sdsd",
		font = tweak_data.hud_stats.objective_desc_font,
		font_size = tweak_data.hud_stats.day_description_size,
		color = Color(1, 1, 1, 1),
		align = "left",
		vertical = "top",
		wrap = true,
		word_wrap = true,
		h = 128
	})
	day_description:set_y(math.round(bains_plan:bottom()))
	day_description:set_h(day_wrapper_panel:h())
	do
		local is_level_ghostable = managers.job:is_level_ghostable(managers.job:current_level_id())
		local is_whisper_mode = managers.groupai and managers.groupai:state():whisper_mode()
		local ghost_icon = right_panel:bitmap({
			name = "ghost_icon",
			texture = "guis/textures/pd2/cn_minighost",
			w = 16,
			h = 16,
			blend_mode = "add"
		})
		local ghost_string = managers.localization:text("menu_ghostable_stage")
		if managers.job:is_level_ghostable_required(managers.job:current_level_id()) then
			ghost_string = managers.localization:text("menu_ghostable_stage_required")
		end
		local ghostable_text = day_wrapper_panel:text({
			name = "ghostable_text",
			text = ghost_string,
			align = "left",
			vertical = "top",
			blend_mode = "add",
			font_size = tweak_data.menu.pd2_small_font_size,
			font = tweak_data.menu.pd2_small_font,
			color = tweak_data.screen_colors.text
		})
		local x, y, w, h = ghostable_text:text_rect()
		ghostable_text:set_size(w, h)
		ghost_icon:set_left(days_title:right())
		ghost_icon:set_center_y(days_title:center_y())
		ghostable_text:set_y(day_description:top() + 10)
		ghostable_text:set_left(day_description:left())
		ghost_icon:set_visible(is_level_ghostable)
		ghost_icon:set_color(is_whisper_mode and Color.white or tweak_data.screen_colors.important_1)
		ghostable_text:set_visible(is_level_ghostable and is_whisper_mode)
	end
	local ext_inventory_panel = right_panel:panel({
		layer = 1,
		valign = {0.5, 0.5},
		name = "ext_inventory_panel",
		x = 20,
		y = y + math.round(managers.gui_data:scaled_size().height / 2),
		h = math.round(managers.gui_data:scaled_size().height / 2),
		w = left_panel:w()
	})
	ext_inventory_panel:set_w(right_panel:w() - x - ext_inventory_panel:x())
	local _, by = managers.gui_data:corner_safe_to_full(0, managers.gui_data:corner_scaled_size().height)
	ext_inventory_panel:set_bottom(by)
	ext_inventory_panel:set_valign({
		by / managers.gui_data:full_scaled_size().h,
		0
	})
	local mutators_panel = right_panel:panel({
		layer = 1,
		valign = {0.5, 0.5},
		name = "mutators_panel",
		x = 20,
		y = y + math.round(managers.gui_data:scaled_size().height / 2),
		h = 0,
		w = left_panel:w()
	})
	mutators_panel:set_w(right_panel:w() - x - mutators_panel:x())
	mutators_panel:set_bottom(ext_inventory_panel:top())
	mutators_panel:set_valign({
		by / managers.gui_data:full_scaled_size().h,
		0
	})
	local profile_wrapper_panel = bottom_panel:panel({
		layer = 1,
		valign = {0.5, 0.5},
		name = "profile_wrapper_panel",
		x = x_margine,
		y = y_margine,
		h = math.round(bottom_panel:h() - y - y_margine),
		w = bottom_panel:w() - x_margine * 2
	})
	self:_rec_round_object(left_panel)
	self:_rec_round_object(right_panel)
	self:_rec_round_object(bottom_panel)
end
