local tiny_font = tweak_data.menu.pd2_tiny_font
local large_font = tweak_data.menu.pd2_large_font
local medium_font = tweak_data.menu.pd2_medium_font
local tiny_font_size = tweak_data.menu.pd2_tiny_font_size
local small_font_size = tweak_data.menu.pd2_small_font_size
local medium_font_size = tweak_data.menu.pd2_medium_font_size
local safehouse = Global.game_settings and Global.game_settings.level_id == "safehouse"
local new_safehouse = Global.game_settings and Global.game_settings.level_id == "chill"

function HUDStatsScreen:recreate_left()
	if safehouse or new_safehouse then
		self._left:set_visible(false)
		return
	end
	self._left:set_w(417)
	self._left:clear()
	self._left:bitmap({
		texture = "guis/textures/test_blur_df",
		layer = -1,
		render_template = "VertexColorTexturedBlur3D",
		valign = "grow",
		w = self._left:w(),
		h = self._left:h()
	})

	local lb = HUDBGBox_create(self._left, {}, {
		blend_mode = "normal",
		color = Color.white
	})

	lb:child("bg"):set_color(Color(0, 0, 0):with_alpha(0.75))
	lb:child("bg"):set_alpha(1)
	
	local pad = 8
	local x, y = managers.gui_data:corner_safe_to_full(0, 0)
	local loot_wrapper_panel = self._left:panel({
		name = "loot_wrapper_panel",
		visible = true,
		x = 0,
		layer = 1,
		y = 0 + math.round(managers.gui_data:full_scaled_size().height / 1.84),
		h = math.round(managers.gui_data:full_scaled_size().height / 2),
		w = self._left:w()
	})

	loot_wrapper_panel:set_valign("center")

	local secured_loot_title = loot_wrapper_panel:text({
		valign = "center",
		name = "secured_loot_title",
		h = 32,
		w = 512,
		align = "left",
		vertical = "top",
		layer = 1,
		color = Color.white,
		font_size = tweak_data.hud_stats.loot_title_size,
		font = tweak_data.hud_stats.objectives_font,
		text = utf8.to_upper(managers.localization:text("hud_secured_loot"))
	})

	secured_loot_title:set_position(math.round(x), 0)
	managers.hud:make_fine_text(secured_loot_title)

	local mission_bags_title = loot_wrapper_panel:text({
		valign = "center",
		name = "mission_bags_title",
		h = 32,
		w = 512,
		align = "left",
		vertical = "top",
		layer = 1,
		color = Color.white,
		font_size = tweak_data.hud_stats.loot_size,
		font = tweak_data.hud_stats.objectives_font,
		text = utf8.to_upper(managers.localization:text("hud_mission_bags"))
	})

	mission_bags_title:set_position(math.round(x + pad), secured_loot_title:bottom())
	managers.hud:make_fine_text(mission_bags_title)

	local mission_bags_panel = loot_wrapper_panel:panel({
		y = 0,
		name = "mission_bags_panel",
		h = 44,
		visible = true,
		x = 0,
		w = self._left:w()
	})

	mission_bags_panel:set_lefttop(mission_bags_title:leftbottom())
	mission_bags_panel:set_position(mission_bags_panel:x(), mission_bags_panel:y())

	local mission_bags_payout = loot_wrapper_panel:text({
		valign = "center",
		name = "mission_bags_payout",
		h = 32,
		w = 512,
		align = "left",
		vertical = "top",
		text = "",
		layer = 1,
		color = Color.white,
		font_size = tweak_data.hud_stats.loot_size,
		font = tweak_data.hud_stats.objectives_font
	})

	mission_bags_payout:set_text(utf8.to_upper(managers.localization:text("hud_bonus_bags_payout", {
		MONEY = managers.experience:cash_string(0)
	})))
	mission_bags_payout:set_position(mission_bags_title:left(), mission_bags_panel:bottom())
	managers.hud:make_fine_text(mission_bags_payout)
	mission_bags_payout:set_w(loot_wrapper_panel:w())

	local bonus_bags_title = loot_wrapper_panel:text({
		valign = "center",
		name = "bonus_bags_title",
		h = 32,
		w = 512,
		align = "left",
		vertical = "top",
		layer = 1,
		color = Color.white,
		font_size = tweak_data.hud_stats.loot_size,
		font = tweak_data.hud_stats.objectives_font,
		text = utf8.to_upper(managers.localization:text("hud_bonus_bags"))
	})

	bonus_bags_title:set_position(math.round(x + pad), mission_bags_payout:bottom() + 4)
	managers.hud:make_fine_text(bonus_bags_title)

	local bonus_bags_panel = loot_wrapper_panel:panel({
		y = 0,
		name = "bonus_bags_panel",
		h = 44,
		visible = true,
		x = 0,
		w = self._left:w()
	})

	bonus_bags_panel:set_lefttop(bonus_bags_title:leftbottom())
	bonus_bags_panel:set_position(bonus_bags_panel:x(), bonus_bags_panel:y())
	bonus_bags_panel:grow(-bonus_bags_panel:x(), 0)

	local bonus_bags_payout = loot_wrapper_panel:text({
		valign = "center",
		name = "bonus_bags_payout",
		h = 32,
		w = 512,
		align = "left",
		vertical = "top",
		text = "",
		layer = 1,
		color = Color.white,
		font_size = tweak_data.hud_stats.loot_size,
		font = tweak_data.hud_stats.objectives_font
	})

	bonus_bags_payout:set_text(utf8.to_upper(managers.localization:text("hud_bonus_bags_payout", {
		MONEY = managers.experience:cash_string(0)
	})))
	bonus_bags_payout:set_position(bonus_bags_title:left(), bonus_bags_panel:bottom())
	managers.hud:make_fine_text(bonus_bags_payout)
	bonus_bags_payout:set_w(loot_wrapper_panel:w())

	local instant_cash_title = loot_wrapper_panel:text({
		valign = "center",
		name = "instant_cash_title",
		h = 32,
		w = 512,
		align = "left",
		vertical = "top",
		layer = 1,
		color = Color.white,
		font_size = tweak_data.hud_stats.loot_size,
		font = tweak_data.hud_stats.objectives_font,
		text = utf8.to_upper(managers.localization:text("hud_instant_cash"))
	})

	instant_cash_title:set_position(math.round(x + pad), bonus_bags_payout:bottom() + 4)
	managers.hud:make_fine_text(instant_cash_title)

	local instant_cash_text = loot_wrapper_panel:text({
		valign = "center",
		name = "instant_cash_text",
		h = 32,
		w = 512,
		align = "left",
		vertical = "top",
		layer = 1,
		color = Color.white,
		font_size = tweak_data.hud_stats.loot_size,
		font = tweak_data.hud_stats.objectives_font,
		text = managers.experience:cash_string(0)
	})

	instant_cash_text:set_position(instant_cash_title:left(), instant_cash_title:bottom())
	managers.hud:make_fine_text(instant_cash_text)
	instant_cash_text:set_w(loot_wrapper_panel:w())
	self:_update_stats_screen_loot(self._left:child("loot_wrapper_panel"))
	local num_forced = #managers.achievment:get_force_tracked()
	local mutators_active = managers.mutators:are_mutators_active()
	if num_forced >= 1 and not mutators_active and not Global.game_settings.one_down then
		self:_create_tracked_list(self._left)
	elseif mutators_active then
		self:_create_mutators_list(self._left)
	else
		self:_create_objectives_list(self._left)
	end
end

function HUDStatsScreen:recreate_right()
	if safehouse or new_safehouse then
		self._right:set_visible(false)
		return
	end
	self._right:set_w(417)
	self._right:clear()
	local blur = self._right:bitmap({
		texture = "guis/textures/test_blur_df",
		layer = -1,
		render_template = "VertexColorTexturedBlur3D",
		valign = "grow",
		w = self._right:w(),
		h = self._right:h()
	})

	local rb = HUDBGBox_create(self._right, {}, {
		blend_mode = "normal",
		color = Color.white
	})
	rb:child("bg"):set_color(Color(0, 0, 0):with_alpha(0.75))
	rb:child("bg"):set_alpha(1)
	
	local placer = UiPlacer:new(20, 13, 0, 8)
	local job_data = managers.job:current_job_data()
	local level_data = managers.job:current_level_data()
	local stage_data = managers.job:current_stage_data()
	local job_chain = managers.job:current_job_chain_data()
	local is_whisper_mode = managers.groupai and managers.groupai:state():whisper_mode()
	local level_tweak = tweak_data.levels[managers.job:current_level_id()]
	local narrator = level_tweak.narrator or "bain"
	local briefing_id = stage_data.briefing_id or level_data.briefing_id
	
	if stage_data then
		local job_chain = managers.job:current_job_chain_data()
		local day = managers.job:current_stage()
		local days = job_chain and #job_chain or 0
		local day_title = self._right:fine_text({
			font = tweak_data.hud_stats.objectives_font,
			font_size = tweak_data.hud_stats.loot_size,
			text = managers.localization:to_upper_text("hud_days_title", {
				DAY = day,
				DAYS = days
			}),
			
			rotation = 360
		})
		placer:add_right(day_title)
		
		if managers.crime_spree:is_active() then
			day_title:set_text(managers.localization:to_upper_text("menu_es_crime_spree_summary"))
			day_title:set_color(tweak_data.screen_colors.crime_spree_risk)
		end
		if managers.job:is_level_ghostable(managers.job:current_level_id()) then
			local ghost_color = is_whisper_mode and Color.white or tweak_data.screen_colors.important_1
			local ghost = placer:add_right(self._right:bitmap({
				texture = "guis/textures/pd2/cn_minighost",
				name = "ghost_icon",
				h = 16,
				blend_mode = "add",
				w = 16,
				color = ghost_color
			}))

			if managers.crime_spree:is_active() then
				ghost:set_alpha(0)
			end
			ghost:set_center_y(day_title:center_y())
		end
		placer:new_row(8, 1)

		local level_data = managers.job:current_level_data()

		if level_data then
			placer:add_bottom(self._right:fine_text({
				font = large_font,
				font_size = tweak_data.hud_stats.objectives_title_size,
				text = managers.skirmish:is_skirmish() and managers.localization:to_upper_text("menu_cn_skirmish") or managers.localization:to_upper_text(level_data.name_id),
				color = managers.skirmish:is_skirmish() and tweak_data.screen_colors.skirmish_color or tweak_data.screen_colors.text
			}))
			if managers.job:is_current_job_professional() then
				placer:add_right(self._right:fine_text({
					font = large_font,
					font_size = tweak_data.hud_stats.loot_size + 1,
					text = managers.localization:to_upper_text("cn_menu_pro_job"),
					color = tweak_data.screen_colors.pro_color
				}), 7, 90)
			end
		end
		
		if not managers.crime_spree:is_active() then
			placer:new_row(8, 1)
			placer:add_bottom(self._right:fine_text({
				font = medium_font,
				font_size = tweak_data.hud_stats.loot_size,
				text = managers.localization:to_upper_text("cn_menu_contract_paygrade_header"),
				color = tweak_data.screen_colors.text
			}), 0)
			placer:add_right(self._right:fine_text({
				font = medium_font,
				font_size = tweak_data.hud_stats.loot_size,
				text = "",
				color = tweak_data.screen_colors.text
			}), 3)
			local filled_star_rect = {0, 32, 32, 32}
			local empty_star_rect = {32, 32, 32, 32}
			local cy = self._right:center_y() - 4
			local sx = self._right:right() + 8
			local job_stars = managers.job:current_job_stars()
			local level_data = { 
				texture = "guis/textures/pd2/mission_briefing/difficulty_icons", 
				texture_rect = filled_star_rect, 
				w = 22, 
				h = 22, 
				color = tweak_data.screen_colors.text, 
				alpha = 1
			}
			for i = 1, job_stars do
				local x = sx + (i - 1) * 26
				local is_risk = i > job_stars
				local star_data = level_data
				local star = placer:add_right(self._right:bitmap(star_data), 2)
			end
		end
		placer:new_row(8, 1)
		placer:add_bottom(self._right:fine_text({
			font = medium_font,
			font_size = tweak_data.hud_stats.loot_size,
			text = managers.skirmish:is_skirmish() and managers.localization:to_upper_text("cn_menu_skirmish_contract_waves_header") or managers.localization:to_upper_text("menu_lobby_difficulty_title"),
			color = tweak_data.screen_colors.text
		}), 0)
		if job_data then
			local str = managers.localization:text("menu_cs_level", {
				level = managers.experience:cash_string(managers.crime_spree:server_spree_level(), "")
			})
			local job_stars = managers.job:current_job_stars()
			local difficulty_stars = managers.job:current_difficulty_stars()
			local difficulty = tweak_data.difficulties[difficulty_stars + 2] or 1
			
			local difficulty_string = managers.localization:to_upper_text(tweak_data.difficulty_name_ids[difficulty])
			local difficulty_text = self._right:fine_text({
				name = "difficulty_text",
				font = medium_font,
				font_size = tweak_data.hud_stats.loot_size,
				text = difficulty_string,
				color = difficulty_stars > 0 and tweak_data.screen_colors.risk or tweak_data.screen_colors.text
			})
			if managers.crime_spree:is_active() then
				difficulty_text:set_text(str)
				difficulty_text:set_color(tweak_data.screen_colors.crime_spree_risk)
			else
				difficulty_text:set_text(difficulty_string)
				difficulty_text:set_color(difficulty_stars > 0 and tweak_data.screen_colors.risk or tweak_data.screen_colors.text)
			end
			if Global.game_settings.one_down then
				local one_down_string = difficulty_string .. "  " .. "##" .. managers.localization:to_upper_text("menu_one_down") .. "##"
				managers.menu:color_range(
					difficulty_text,
					tweak_data.screen_colors.one_down,
					one_down_string
				)
			end

			local _, _, tw, th = difficulty_text:text_rect()

			difficulty_text:set_size(tw, th)
			placer:add_right((difficulty_text), 4)
		end

		placer:new_row(8, 0)
		
		if not managers.crime_spree:is_active() then
			local payout = managers.localization:text("hud_day_payout", {
				MONEY = managers.experience:cash_string(managers.money:get_potential_payout_from_current_stage())
			})

			placer:add_bottom(self._right:fine_text({
				keep_w = true,
				font = tweak_data.hud_stats.objectives_font,
				font_size = tweak_data.hud_stats.loot_size,
				text = payout
			}), 0)
		end
		
		placer:new_row(8, 20)
		placer:add_bottom(self._right:fine_text({
			keep_w = true,
			font = tweak_data.hud_stats.objective_desc_font,
			font_size = tweak_data.hud_stats.day_description_size + 2,
			text = managers.localization:to_upper_text("menu_description_" .. narrator)
		}), 0)
		placer:new_row(8, 0)
		local desc_panel = placer:add_bottom(self._right:panel({
			y = 0,
			h = self._right:h() / 2,
			w = self._right:w() / 1.15 - 2,
			x = 0
		}))

		local text = desc_panel:text({
			wrap = true,
			text = managers.localization:text(briefing_id),
			font = tweak_data.hud_stats.objective_desc_font,
			font_size = tweak_data.hud_stats.day_description_size,
			w = 350
		})
		managers.hud:make_fine_text(text)
		local _, _, _, h = text:text_rect()

		while h > desc_panel:h() - text:top() do
			text:set_font_size(text:font_size() * 0.99)

			_, _, _, h = text:text_rect()
		end
		placer:new_row()
		self:extended_inventory()
	end
	local extended_inventory_panel = self._right:child("extended_inventory_panel")
	if not alive(extended_inventory_panel) then
		self:exp_progress()
	end
end

function HUDStatsScreen:recreate_bottom()
	self._bottom:clear()
	self._bottom:bitmap({
		texture = "guis/textures/test_blur_df",
		layer = -1,
		render_template = "VertexColorTexturedBlur3D",
		valign = "grow",
		w = self._bottom:w(),
		h = self._bottom:h()
	})

	local rb = HUDBGBox_create(self._bottom, {}, {
		blend_mode = "normal",
		color = Color.white
	})

	rb:child("bg"):set_color(Color(0, 0, 0):with_alpha(0.75))
	rb:child("bg"):set_alpha(1)
	local extended_inventory_panel = self._right:child("extended_inventory_panel")
	if alive(extended_inventory_panel) then
		self:exp_progress()
	end
end
	
function HUDStatsScreen:update(t, dt)
	local difficulty_text = self._right:child("difficulty_text")
	local job_data = managers.job:current_job_data()
	if managers.skirmish:is_skirmish() then
		difficulty_text:set_text(managers.skirmish:is_skirmish() and tostring(managers.skirmish:current_wave_number()))
		difficulty_text:set_color(managers.skirmish:current_wave_number() >= 7 and tweak_data.screen_colors.skirmish_color or managers.skirmish:current_wave_number() >= 5 and tweak_data.screen_colors.heat_warm_color or managers.skirmish:current_wave_number() >= 3 and tweak_data.screen_colors.risk or tweak_data.screen_colors.text)
	end
			
	local is_whisper_mode = managers.groupai and managers.groupai:state():whisper_mode()
	for _, v in pairs(self._tracked_items or {}) do
		v:update_progress()
	end
	local extended_inventory_panel = self._right:child("extended_inventory_panel")
	local side = alive(extended_inventory_panel) and self._bottom or self._right
	if not alive(extended_inventory_panel) then
		self._bottom:hide()
	else
		self._bottom:show()
	end
	
	local lvl = Global.game_settings and Global.game_settings.level_id
	local halloween = lvl == "nail" or lvl == "help" or lvl == "haunted" or lvl == "hvh"
	local m = math.random
	local c = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"}
	local word = c[m(26)]..c[m(26)]..c[m(26)]..c[m(26)]..c[m(26)]..c[m(26)]..c[m(26)]..c[m(26)]..c[m(26)].." "..c[m(26)]..c[m(26)]..c[m(26)]..c[m(26)].." "..c[m(26)]..c[m(26)]..c[m(26)]..c[m(26)]..c[m(26)]..c[m(26)]..c[m(26)]..c[m(26)]..c[m(26)]
	local profile_wrapper_panel = side:child("profile_wrapper_panel")
	if alive(profile_wrapper_panel) then
		local gain_xp_text = profile_wrapper_panel:child("gain_xp_text")
		local at_max_level_text = profile_wrapper_panel:child("at_max_level_text")
		if alive(gain_xp_text) then
			local gain_xp = managers.experience:get_xp_dissected(true, 0, true)
			local text = managers.localization:to_upper_text("hud_potential_xp", {
				XP = managers.money:add_decimal_marks_to_string(tostring(gain_xp))
			})
			gain_xp_text:set_text(text)
		end
		if halloween and alive(at_max_level_text) then
			at_max_level_text:set_text(word)
		end
	end
	
	local accuracy_panel = self._right:child("accuracy_panel")
	if alive(accuracy_panel) then
		accuracy_panel:child("accuracy_counter"):set_text(managers.statistics:session_hit_accuracy() .. "%")
	end
	
	local kill_panel = self._right:child("kill_panel")
	if alive(kill_panel) then
		local kill_counter = kill_panel:child("kill_counter")
		kill_counter:set_text(managers.statistics:session_total_kills() < 10 and "00" .. managers.statistics:session_total_kills() or managers.statistics:session_total_kills() < 100 and "0" .. managers.statistics:session_total_kills() or managers.statistics:session_total_kills())
		kill_counter:set_range_color(0, managers.statistics:session_total_kills() <= 0 and 3 or managers.statistics:session_total_kills() < 10 and 2 or managers.statistics:session_total_kills() < 100 and 1 or 0, tweak_data.screen_colors.text:with_alpha(0.6))
	end
	
	local pager_panel = self._right:child("pager_panel")
	if alive(pager_panel) and  managers.job:is_level_ghostable(managers.job:current_level_id()) and is_whisper_mode or lvl == "welcome_to_the_jungle_2" and is_whisper_mode then
		local pager_counter = pager_panel:child("pager_counter")
		local pagers_used = managers.groupai:state():get_nr_successful_alarm_pager_bluffs()
		local max_pagers_data = managers.player:has_category_upgrade("player", "corpse_alarm_pager_bluff") and tweak_data.player.alarm_pager.bluff_success_chance_w_skill or tweak_data.player.alarm_pager.bluff_success_chance
		local max_num_pagers = #max_pagers_data

		for i, chance in ipairs(max_pagers_data) do
			if chance == 0 then
				max_num_pagers = i - 1

				break
			end
		end
		pager_counter:set_text(pagers_used .. "/" .. max_num_pagers)
		pager_counter:set_range_color(0, 1, pagers_used >= max_num_pagers and tweak_data.screen_colors.pro_color or pagers_used == 0 and tweak_data.screen_colors.text:with_alpha(0.6) or tweak_data.screen_colors.text)
	end
end

function HUDStatsScreen:_create_objectives_list()
	local placer = UiPlacer:new(31, 0, 0, 8)
	
	placer:add_bottom(self._left:fine_text({
		vertical = "top",
		align = "left",
		font_size = tweak_data.hud_stats.objectives_title_size,
		font = tweak_data.hud_stats.objectives_font,
		text = managers.localization:to_upper_text("hud_objective")
	}), 13)
	placer:new_row(8, -1)

	local row_w = self._left:w() - placer:current_left() * 2

	for i, data in pairs(managers.objectives:get_active_objectives()) do
		placer:add_bottom(self._left:fine_text({
			word_wrap = true,
			wrap = true,
			align = "left",
			text = utf8.to_upper(data.text),
			font = tweak_data.hud.medium_font,
			font_size = tweak_data.hud.active_objective_title_font_size,
			w = row_w
		}))
		local objective_desc = self._left:fine_text({
			name = "objective_desc",
			word_wrap = true,
			wrap = true,
			font_size = 24,
			align = "left",
			text = "",
			font = tweak_data.hud_stats.objective_desc_font,
			w = row_w
		})
		placer:add_bottom(objective_desc)
	end
end

function HUDStatsScreen:_create_tracked_list(panel)
	local placer = UiPlacer:new(10, 10, 0, 8)
	local tracked = managers.achievment:get_tracked_fill()
	self._tracked_items = {}
	local placer = UiPlacer:new(0, placer:most().bottom, 0, 0)
	local with_bg = true

	for _, id in pairs(tracked) do
		local t = placer:add_row(HudTrackedAchievement:new(self._left, id, with_bg), 0, 0)

		if t._progress and t._progress.update and table.contains({
			"realtime",
			"second"
		}, t._progress.update) then
			table.insert(self._tracked_items, t)
		end

		with_bg = not with_bg
	end
end

function HUDStatsScreen:_create_mutators_list(panel)
	local placer = UiPlacer:new(10, 10)

	placer:add_bottom(self._left:fine_text({
		text = managers.localization:to_upper_text("menu_mutators"),
		font = large_font,
		font_size = tweak_data.hud_stats.objectives_title_size
	}))

	for i, active_mutator in ipairs(managers.mutators:active_mutators()) do
		placer:add_row(self._left:fine_text({
			text = active_mutator.mutator:name(),
			font = tweak_data.hud_stats.objectives_font,
			font_size = tweak_data.hud_stats.day_description_size
		}), 8, 2)
	end
end

function HUDStatsScreen:_update_stats_screen_loot(loot_wrapper_panel)
	local mandatory_bags_data = managers.loot:get_mandatory_bags_data()
	local secured_amount = managers.loot:get_secured_mandatory_bags_amount()
	local x = nil
	local bag_texture, bag_rect = tweak_data.hud_icons:get_icon_data("bag_icon")
	local mission_amount = managers.loot:get_secured_mandatory_bags_amount()
	local mission_vis = mission_amount > 0 or secured_amount > 0
	local mission_bags_panel = loot_wrapper_panel:child("mission_bags_panel")

	mission_bags_panel:clear()

	if mandatory_bags_data and mandatory_bags_data.amount then
		if mandatory_bags_data.amount > 18 then
			local x = 0
			local bag = mission_bags_panel:bitmap({
				name = "bag1",
				alpha = 0.25,
				texture = bag_texture,
				texture_rect = bag_rect,
				x = x
			})
			local bag_text = mission_bags_panel:text({
				name = "bag_amount",
				text = " x" .. tostring(mandatory_bags_data.amount - mission_amount),
				font_size = tweak_data.menu.pd2_small_font_size,
				font = tweak_data.menu.pd2_small_font
			})

			managers.hud:make_fine_text(bag_text)
			bag_text:set_left(bag:right())
			bag_text:set_center_y(math.round(bag:center_y()))

			local bag_gotten = mission_bags_panel:bitmap({
				name = "bag1",
				texture = bag_texture,
				texture_rect = bag_rect,
				x = x
			})
			local bag_text_gotten = mission_bags_panel:text({
				name = "bag_amount",
				text = " x" .. tostring(mission_amount),
				font_size = tweak_data.menu.pd2_small_font_size,
				font = tweak_data.menu.pd2_small_font
			})

			managers.hud:make_fine_text(bag_text_gotten)
			bag_gotten:set_left(bag_text:right() + 10)
			bag_text_gotten:set_left(bag_gotten:right())
			bag_text_gotten:set_center_y(math.round(bag_gotten:center_y()))
		else
			local x = 0
			local y = 0

			for i = 1, mandatory_bags_data.amount, 1 do
				local alpha = i <= secured_amount and 1 or 0.25

				mission_bags_panel:bitmap({
					name = "bag" .. i,
					texture = bag_texture,
					texture_rect = bag_rect,
					x = x,
					y = y,
					alpha = alpha
				})

				x = x + 32

				if x >= 288 then
					x = 0
					y = 22
				end
			end
		end
	end

	local bonus_amount = managers.loot:get_secured_bonus_bags_amount()
	local bonus_vis = bonus_amount > 0 or secured_amount > 0 or managers.loot:get_secured_bonus_bags_amount(true) > 0
	local bonus_bags_title = loot_wrapper_panel:child("bonus_bags_title")

	bonus_bags_title:set_alpha(bonus_vis and 1 or 0.5)

	local bonus_bags_panel = loot_wrapper_panel:child("bonus_bags_panel")

	bonus_bags_panel:clear()

	if bonus_amount >= 10 then
		local x = 0
		local bag = bonus_bags_panel:bitmap({
			name = "bag1",
			texture = bag_texture,
			texture_rect = bag_rect,
			x = x
		})
		local bag_text = bonus_bags_panel:text({
			name = "bag_amount",
			text = " x" .. tostring(bonus_amount),
			font_size = tweak_data.menu.pd2_small_font_size,
			font = tweak_data.menu.pd2_small_font
		})

		managers.hud:make_fine_text(bag_text)
		bag_text:set_left(bag:right())
		bag_text:set_center_y(math.round(bag:center_y()))
	else
		for i = 1, bonus_amount, 1 do
			local x = (i - 1) * 32

			bonus_bags_panel:bitmap({
				name = "bag" .. i,
				texture = bag_texture,
				texture_rect = bag_rect,
				x = x
			})
		end
	end

	local mandatory_cash = managers.money:get_secured_mandatory_bags_money()
	local mission_bags_payout = loot_wrapper_panel:child("mission_bags_payout")

	mission_bags_payout:set_visible(mission_vis)
	mission_bags_payout:set_text(utf8.to_upper(managers.localization:text("hud_bonus_bags_payout", {
		MONEY = managers.experience:cash_string(mandatory_cash)
	})))

	local bonus_cash = managers.money:get_secured_bonus_bags_money()
	local bonus_bags_payout = loot_wrapper_panel:child("bonus_bags_payout")

	bonus_bags_payout:set_visible(bonus_vis)
	bonus_bags_payout:set_text(utf8.to_upper(managers.localization:text("hud_bonus_bags_payout", {
		MONEY = managers.experience:cash_string(bonus_cash)
	})))

	local instant_cash = managers.loot:get_real_total_small_loot_value()
	local instant_vis = instant_cash > 0
	local instant_cash_title = loot_wrapper_panel:child("instant_cash_title")

	instant_cash_title:set_alpha(instant_vis and 1 or 0.5)

	local instant_cash_text = loot_wrapper_panel:child("instant_cash_text")

	instant_cash_text:set_text(utf8.to_upper(managers.experience:cash_string(instant_cash)))
	instant_cash_text:set_alpha(instant_vis and 1 or 0.5)
end

function HUDStatsScreen:extended_inventory()
	local lvl = Global.game_settings and Global.game_settings.level_id
	local ach = managers.achievment.achievments
	local accuracy_requirements = ach.flat_5.forced and lvl == "flat" or ach.ovk_7.forced or ach.gage4_5.forced
	local kill_requirements = ach.ovk_7.forced or ach.gage4_5.forced
	local is_whisper_mode = managers.groupai and managers.groupai:state():whisper_mode()
	local extended = UiPlacer:new(36, (self._right:h() / 1.05) + 19, 0, 8)
	extended:new_row(0, 0)
	
	local extended_inventory_panel
	local accuracy_panel
	local kill_panel
	local pager_panel
	local body_bags_panel
	
	if _G.OriginalPackOptions.settings.Anlways_Show_Body_Bags or is_whisper_mode then
		body_bags_panel = extended:add_top(self._right:panel({name = "body_bags_panel", h = 19, w = self._right:w() / 1.2}))
	end
	
	if managers.job:is_level_ghostable(managers.job:current_level_id()) and is_whisper_mode or lvl == "welcome_to_the_jungle_2" and is_whisper_mode then
		pager_panel = extended:add_top(self._right:panel({name = "pager_panel", h = 19, w = self._right:w() / 1.2}), 5)
	end
	
	if _G.OriginalPackOptions.settings.Anlways_Show_Kills or kill_requirements then
		kill_panel = extended:add_top(self._right:panel({name = "kill_panel", h = 19, w = self._right:w() / 1.2}), 5)
	end
	
	if _G.OriginalPackOptions.settings.Anlways_Show_Accuracy or accuracy_requirements then
		accuracy_panel = extended:add_top(self._right:panel({name = "accuracy_panel", h = 19, w = self._right:w() / 1.2}), 5)
	end
	
	if alive(body_bags_panel) or alive(pager_panel) or alive(kill_panel) or alive(accuracy_panel) then
		extended_inventory_panel = extended:add_top(self._right:panel({name = "extended_inventory_panel", h = 26, w = self._right:w() / 1.2}))
		extended_inventory_panel:text({
			x = -1,
			align = "right",
			text = managers.localization:to_upper_text("hud_extended_inventory"),
			font_size = tweak_data.hud_stats.loot_title_size,
			font = tweak_data.hud_stats.objectives_font
		})
	end
	
	if alive(accuracy_panel) then
		local accuracy_title = accuracy_panel:text({
			align = "right",
			x = -53,
			text = managers.localization:to_upper_text("menu_accuracy"),
			font_size = tweak_data.hud_stats.loot_title_size - 6,
			font = tweak_data.hud_stats.objectives_font
		})
		accuracy_panel:bitmap({
			rotation = 360,
			x = accuracy_panel:w() - 44,
			w = 19,
			h = 19,
			texture = "guis/textures/pd2/skilltree/op_icons_atlas",
			texture_rect = {
				424,
				356,
				20,
				20
			}
		})
		local accuracy_counter = accuracy_panel:text({
			rotation = 360,
			align = "center",
			x = (accuracy_panel:w() / 2) - 6,
			text = "",
			name = "accuracy_counter",
			font_size = 20,
			alpha = 1,
			font = "fonts/font_medium_mf",
			color = tweak_data.screen_colors.text
		})
	end
	
	if alive(kill_panel) then
		local kill_title = kill_panel:text({
			align = "right",
			x = -53,
			text = managers.localization:to_upper_text("menu_kills"),
			font_size = tweak_data.hud_stats.loot_title_size - 6,
			font = tweak_data.hud_stats.objectives_font
		})
		kill_panel:bitmap({
			rotation = 360,
			x = kill_panel:w() - 44,
			w = 21,
			h = 21,
			texture = "guis/textures/pd2/hud_difficultymarkers",
			texture_rect = {
				0,
				0,
				32,
				32
			}
		})
		local kill_counter = kill_panel:text({
			rotation = 360,
			align = "center",
			x = (kill_panel:w() / 2) - 9,
			text = "",
			name = "kill_counter",
			font_size = 20,
			alpha = 1,
			font = "fonts/font_medium_mf",
			color = tweak_data.screen_colors.text
		})
	end
	
	if alive(pager_panel) then
		local pagers_texture, pagers_rect = tweak_data.hud_icons:get_icon_data("pagers_used")
		local pager_title = pager_panel:text({
			align = "right",
			x = -53,
			text = managers.localization:to_upper_text("hud_stats_pagers_used"),
			font_size = tweak_data.hud_stats.loot_title_size - 6,
			font = tweak_data.hud_stats.objectives_font
		})
		local pager_icon = pager_panel:bitmap({
			rotation = 360,
			x = pager_panel:w() - 44,
			w = 21,
			h = 20,
			texture = pagers_texture,
			texture_rect = pagers_rect
		})
		if managers.player:has_category_upgrade("player", "corpse_alarm_pager_bluff") then
			pager_icon:set_color(tweak_data.screen_colors.skill_color)
		end
		local pager_counter = pager_panel:text({
			x = 2,
			rotation = 360,
			align = "right",
			text = "",
			name = "pager_counter",
			font_size = 22,
			alpha = 1,
			font = "fonts/font_medium_mf",
			color = tweak_data.screen_colors.text
		})
	end
	
	if alive(body_bags_panel) then
		local body_texture, body_rect = tweak_data.hud_icons:get_icon_data("equipment_body_bag")
		local body_bags = managers.player:get_body_bags_amount()
		local body_bags_title = body_bags_panel:text({
			align = "right",
			x = -53,
			text = managers.localization:to_upper_text("hud_body_bags"),
			font_size = tweak_data.hud_stats.loot_title_size - 6,
			font = tweak_data.hud_stats.objectives_font
		})
		body_bags_panel:bitmap({
			rotation = 360,
			x = body_bags_panel:w() - 44,
			w = 21,
			h = 20,
			texture = body_texture,
			texture_rect = body_rect
		})
		local body_bags_count = body_bags_panel:text({
			align = "right",
			text = 10 >= body_bags and "0" .. body_bags,
			name = "body_bags_count",
			font_size = 22,
			alpha = 1,
			font = "fonts/font_medium_mf",
			color = tweak_data.screen_colors.text
		})
		body_bags_count:set_range_color(0, body_bags >= 1 and 1 or 2, body_bags < 10 and tweak_data.screen_colors.text:with_alpha(0.6) or tweak_data.screen_colors.text:with_alpha(0))
	end
end

function HUDStatsScreen:exp_progress()
	local extended_inventory_panel = self._right:child("extended_inventory_panel")
	local side = alive(extended_inventory_panel) and self._bottom or self._right
	
	local offset = alive(extended_inventory_panel) and 10 or 20
	local profile_wrapper_panel = side:panel({name = "profile_wrapper_panel", x = offset, y = -14})
	
	local next_level_data = managers.experience:next_level_data() or {}
	local bg_ring = profile_wrapper_panel:bitmap({
		texture = "guis/textures/pd2/level_ring_small",
		w = 64,
		h = 64,
		alpha = 0.4,
		color = Color.black
	})
	local exp_ring = profile_wrapper_panel:bitmap({
		texture = "guis/textures/pd2/level_ring_small",
		h = 64,
		render_template = "VertexColorTexturedRadial",
		w = 64,
		blend_mode = "add",
		rotation = 360,
		layer = 1,
		color = Color((next_level_data.current_points or 1) / (next_level_data.points or 1), 1, 1)
	})

	bg_ring:set_bottom(profile_wrapper_panel:h())
	exp_ring:set_bottom(profile_wrapper_panel:h())

	local gain_xp = managers.experience:get_xp_dissected(true, 0, true)
	local at_max_level = managers.experience:current_level() == managers.experience:level_cap()
	local can_lvl_up = not at_max_level and gain_xp >= next_level_data.points - next_level_data.current_points
	local progress = (next_level_data.current_points or 1) / (next_level_data.points or 1)
	local gain_progress = (gain_xp or 1) / (next_level_data.points or 1)
	local exp_gain_ring = profile_wrapper_panel:bitmap({
		texture = "guis/textures/pd2/level_ring_potential_small",
		h = 64,
		render_template = "VertexColorTexturedRadial",
		w = 64,
		blend_mode = "normal",
		rotation = 360,
		layer = 2,
		color = Color(gain_progress, 1, 0)
	})

	exp_gain_ring:rotate(360 * progress)
	exp_gain_ring:set_center(exp_ring:center())

	local level_text = profile_wrapper_panel:text({
		name = "level_text",
		font = tweak_data.menu.pd2_medium_font,
		font_size = tweak_data.hud_stats.day_description_size,
		text = tostring(managers.experience:current_level()),
		color = tweak_data.screen_colors.text
	})

	managers.hud:make_fine_text(level_text)
	level_text:set_center(exp_ring:center())

	if at_max_level then
		local text = managers.localization:to_upper_text("hud_at_max_level")
		local at_max_level_text = profile_wrapper_panel:text({
			name = "at_max_level_text",
			text = text,
			font_size = tweak_data.menu.pd2_small_font_size,
			font = tweak_data.menu.pd2_small_font,
			color = tweak_data.hud_stats.potential_xp_color
		})

		managers.hud:make_fine_text(at_max_level_text)
		at_max_level_text:set_left(math.round(exp_ring:right() + 4))
		at_max_level_text:set_center_y(math.round(exp_ring:center_y()) + 0)
	else
		local next_level_in = profile_wrapper_panel:text({
			text = "",
			name = "next_level_in",
			font_size = tweak_data.menu.pd2_small_font_size,
			font = tweak_data.menu.pd2_small_font,
			color = tweak_data.screen_colors.text
		})
		local points = next_level_data.points - next_level_data.current_points

		next_level_in:set_text(utf8.to_upper(managers.localization:text("menu_es_next_level") .. " " .. managers.money:add_decimal_marks_to_string(tostring(points))))
		managers.hud:make_fine_text(next_level_in)
		next_level_in:set_left(math.round(exp_ring:right() + 4))
		next_level_in:set_center_y(math.round(exp_ring:center_y()) - 20)
		local text = managers.localization:to_upper_text("hud_potential_xp", {
			XP = managers.money:add_decimal_marks_to_string(tostring(gain_xp))
		})
		local gain_xp_text = profile_wrapper_panel:text({
			name = "gain_xp_text",
			text = text .. "								",
			font_size = tweak_data.menu.pd2_small_font_size,
			font = tweak_data.menu.pd2_small_font,
			color = tweak_data.hud_stats.potential_xp_color
		})

		managers.hud:make_fine_text(gain_xp_text)
		gain_xp_text:set_left(math.round(exp_ring:right() + 4))
		gain_xp_text:set_center_y(math.round(exp_ring:center_y()) + 0)

		if can_lvl_up then
			local text = managers.localization:to_upper_text("hud_potential_level_up")
			local potential_level_up_text = profile_wrapper_panel:text({
				vertical = "center",
				name = "potential_level_up_text",
				blend_mode = "normal",
				align = "left",
				layer = 3,
				visible = can_lvl_up,
				text = text,
				font_size = tweak_data.menu.pd2_small_font_size,
				font = tweak_data.menu.pd2_small_font,
				color = tweak_data.hud_stats.potential_xp_color
			})

			managers.hud:make_fine_text(potential_level_up_text)
			potential_level_up_text:set_left(math.round(exp_ring:right() + 4))
			potential_level_up_text:set_center_y(math.round(exp_ring:center_y()) + 20)
			potential_level_up_text:animate(callback(self, self, "_animate_text_pulse"), exp_gain_ring, exp_ring, bg_ring)
		end
	end

	local track_text = side:fine_text({
		text = managers.localization:to_upper_text("menu_es_playing_track") .. " " .. managers.music:current_track_string(),
		font_size = tweak_data.menu.pd2_small_font_size,
		font = tweak_data.menu.pd2_small_font,
		color = tweak_data.screen_colors.text
	})
	track_text:set_leftbottom(offset + 4, exp_ring:top() - 28)
end

local original_init = HUDStatsScreen.init
function HUDStatsScreen:init(...)
	original_init(self, ...)
	self._full_hud_panel = managers.hud:script(managers.hud.STATS_SCREEN_FULLSCREEN).panel
	self._bottom = ExtendedPanel:new(self, {
		w = 407,
		h = 127
	})
	self._bottom:set_center_x(self._full_hud_panel:center_x())
	self._bottom:set_bottom(self._full_hud_panel:bottom() - 10)
	self:recreate_bottom()
end

function HUDStatsScreen:show()
	self:recreate_left()
	self:recreate_right()
	self:recreate_bottom()

	local safe = managers.hud.STATS_SCREEN_SAFERECT
	local full = managers.hud.STATS_SCREEN_FULLSCREEN

	managers.hud:show(full)

	local left_panel = self._left
	local right_panel = self._right
	local bottom_panel = self._bottom

	left_panel:stop()

	local teammates_panel = managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2).panel:child("teammates_panel")
	local objectives_panel = managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2).panel:child("objectives_panel")
	local chat_panel = managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2).panel:child("chat_panel")

	left_panel:animate(callback(self, self, "_animate_show_stats_left_panel"), right_panel, bottom_panel, teammates_panel, objectives_panel, chat_panel)
end

local original_init = HUDStatsScreen._animate_show_stats_left_panel
function HUDStatsScreen:_animate_show_stats_left_panel(...)
	original_init(self, ...)
	self._full_hud_panel = managers.hud:script(managers.hud.STATS_SCREEN_FULLSCREEN).panel
	self._bottom:set_center_x(self._full_hud_panel:center_x())
	self._bottom:set_bottom(self._full_hud_panel:bottom() - 10)
end

function HUDStatsScreen:bottom()
	self._full_hud_panel = managers.hud:script(managers.hud.STATS_SCREEN_FULLSCREEN).panel
	self._bottom:set_center_x(self._full_hud_panel:center_x())
	self._bottom:set_bottom(self._full_hud_panel:bottom() - 10)
end

function HUDStatsScreen:_animate_text_pulse(text, exp_gain_ring, exp_ring, bg_ring)
	local t = 0
	local c = text:color()
	local w, h = text:size()
	local cx, cy = text:center()
	local ecx, ecy = exp_gain_ring:center()

	while true do
		local dt = coroutine.yield()
		t = t + dt
		local alpha = math.abs(math.sin(t * 180 * 1))

		text:set_size(math.lerp(w * 2, w, alpha), math.lerp(h * 2, h, alpha))
		text:set_font_size(math.lerp(25, tweak_data.menu.pd2_small_font_size, alpha * alpha))
		text:set_center_y(cy)
		exp_gain_ring:set_size(math.lerp(72, 64, alpha * alpha), math.lerp(72, 64, alpha * alpha))
		exp_gain_ring:set_center(ecx, ecy)
		exp_ring:set_size(exp_gain_ring:size())
		exp_ring:set_center(exp_gain_ring:center())
		bg_ring:set_size(exp_gain_ring:size())
		bg_ring:set_center(exp_gain_ring:center())
	end
end

function HUDStatsScreen:on_ext_inventory_changed()
	self:recreate_left()
	self:recreate_right()
	self:recreate_bottom()
end