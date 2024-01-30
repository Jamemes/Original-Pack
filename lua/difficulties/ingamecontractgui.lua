function IngameContractGui:init(ws, node)
	local padding = SystemInfo:platform() == Idstring("WIN32") and 10 or 5
	self._panel = ws:panel():panel({
		w = math.round(ws:panel():w() * 0.6),
		h = math.round(ws:panel():h() * 1)
	})

	self._panel:set_y(CoreMenuRenderer.Renderer.border_height + tweak_data.menu.pd2_large_font_size - 5)
	self._panel:grow(0, -(self._panel:y() + tweak_data.menu.pd2_medium_font_size))

	self._node = node
	local job_data = managers.job:current_job_data()
	local job_chain = managers.job:current_job_chain_data()

	if job_data and managers.job:current_job_id() == "safehouse" and Global.mission_manager.saved_job_values.playedSafeHouseBefore then
		self._panel:set_visible(false)
	end

	local contract_text = self._panel:text({
		text = "",
		vertical = "bottom",
		rotation = 360,
		layer = 1,
		font = tweak_data.menu.pd2_large_font,
		font_size = tweak_data.menu.pd2_large_font_size,
		color = tweak_data.screen_colors.text
	})

	contract_text:set_text(self:get_text("cn_menu_contract_header") .. " " .. (job_data and self:get_text(job_data.name_id) or ""))
	contract_text:set_bottom(5)

	local text_panel = self._panel:panel({
		layer = 1,
		w = self._panel:w() - padding * 2,
		h = self._panel:h() - padding * 2
	})

	text_panel:set_left(padding)
	text_panel:set_top(padding)

	local briefing_title = text_panel:text({
		text = "",
		font = tweak_data.menu.pd2_medium_font,
		font_size = tweak_data.menu.pd2_medium_font_size,
		color = tweak_data.screen_colors.text
	})

	briefing_title:set_text(self:get_text("menu_briefing"))
	managers.hud:make_fine_text(briefing_title)

	local font_size = tweak_data.menu.pd2_small_font_size
	local text = job_data and managers.localization:text(job_data.briefing_id) or ""
	local briefing_description = text_panel:text({
		name = "briefing_description",
		vertical = "top",
		h = 128,
		wrap = true,
		align = "left",
		word_wrap = true,
		text = text,
		font = tweak_data.menu.pd2_small_font,
		font_size = font_size,
		color = tweak_data.screen_colors.text
	})
	local _, _, _, h = briefing_description:text_rect()

	briefing_description:set_h(h)
	briefing_description:set_top(briefing_title:bottom())

	local is_job_ghostable = managers.job:is_job_ghostable(managers.job:current_job_id())

	if is_job_ghostable then
		local min_ghost_bonus, max_ghost_bonus = managers.job:get_job_ghost_bonus(managers.job:current_job_id())
		local min_ghost = math.round(min_ghost_bonus * 100)
		local max_ghost = math.round(max_ghost_bonus * 100)
		local min_string, max_string = nil

		if min_ghost == 0 and min_ghost_bonus ~= 0 then
			min_string = string.format("%0.2f", math.abs(min_ghost_bonus * 100))
		else
			min_string = tostring(math.abs(min_ghost))
		end

		if max_ghost == 0 and max_ghost_bonus ~= 0 then
			max_string = string.format("%0.2f", math.abs(max_ghost_bonus * 100))
		else
			max_string = tostring(math.abs(max_ghost))
		end

		local ghost_bonus_string = min_ghost_bonus == max_ghost_bonus and min_string or min_string .. "-" .. max_string
		local ghostable_text = text_panel:text({
			blend_mode = "add",
			vertical = "top",
			wrap = true,
			align = "left",
			wrap_word = true,
			text = managers.localization:to_upper_text("menu_ghostable_job", {
				bonus = ghost_bonus_string
			}),
			font_size = tweak_data.menu.pd2_small_font_size,
			font = tweak_data.menu.pd2_small_font,
			color = tweak_data.screen_colors.ghost_color
		})

		ghostable_text:set_position(briefing_description:x(), briefing_description:bottom() + padding)
		managers.hud:make_fine_text(ghostable_text)
	end

	local modifiers_text = text_panel:text({
		name = "modifiers_text",
		align = "left",
		vertical = "top",
		text = managers.localization:to_upper_text("menu_cn_modifiers"),
		font = tweak_data.menu.pd2_small_font,
		font_size = font_size,
		color = tweak_data.screen_colors.text
	})

	managers.hud:make_fine_text(modifiers_text)
	modifiers_text:set_bottom(text_panel:h() * 0.5)
	
	local modifiers_amount = 0
	local next_top = modifiers_text:bottom()
	local one_down_warning_text = nil
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	local current_buff = difficulty_index > 5 and 10 or 5
	
	if Global.game_settings.one_down then
		local additional_desc = ""
		if managers.skirmish:current_wave_number() > 0 then
			additional_desc = ". " .. managers.localization:to_upper_text("menu_one_down_additional") .. " " .. managers.skirmish:current_wave_number() .. ". " .. managers.localization:to_upper_text("menu_one_down_additional_2") .. " " .. managers.skirmish:current_wave_number() * current_buff .. "%"
		end
		one_down_warning_text = text_panel:text({
			name = "one_down_warning_text",
			text = managers.localization:to_upper_text("menu_one_down") .. additional_desc,
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			color = tweak_data.screen_colors.pro_color
		})

		managers.hud:make_fine_text(one_down_warning_text)
		one_down_warning_text:set_left(10)
		modifiers_amount = modifiers_amount + 1
	end

	local job_heat_mul = managers.job:get_job_heat_multipliers(managers.job:current_job_id()) - 1
	local job_heat = math.round(job_heat_mul * 100)
	local job_heat_string = tostring(math.abs(job_heat))
	local is_job_heated = job_heat ~= 0 or job_heat_mul ~= 0

	if job_heat == 0 and job_heat_mul ~= 0 then
		job_heat_string = string.format("%0.2f", math.abs(job_heat_mul * 100))
	end

	local ghost_bonus_mul = managers.job:get_ghost_bonus()
	local job_ghost = math.round(ghost_bonus_mul * 100)
	local job_ghost_string = tostring(math.abs(job_ghost))
	local has_ghost_bonus = managers.job:has_ghost_bonus()

	if job_ghost == 0 and ghost_bonus_mul ~= 0 then
		job_ghost_string = string.format("%0.2f", math.abs(ghost_bonus_mul * 100))
	end

	local ghost_warning_text = nil

	if has_ghost_bonus then
		local ghost_color = tweak_data.screen_colors.ghost_color
		ghost_warning_text = text_panel:text({
			name = "ghost_color_warning_text",
			vertical = "top",
			word_wrap = true,
			wrap = true,
			align = "left",
			blend_mode = "normal",
			text = managers.localization:to_upper_text("menu_ghost_bonus", {
				exp_bonus = job_ghost_string
			}),
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			color = ghost_color
		})

		managers.hud:make_fine_text(ghost_warning_text)
		ghost_warning_text:set_left(10)
		modifiers_amount = modifiers_amount + 1
	end

	local heat_warning_text = nil
	local heat_color = managers.job:get_job_heat_color(managers.job:current_job_id())

	if is_job_heated then
		local job_heat_text_id = "menu_heat_" .. (job_heat_mul > 0 and "warm" or job_heat_mul < 0 and "cold" or "ok")
		heat_warning_text = text_panel:text({
			name = "heat_warning_text",
			vertical = "top",
			word_wrap = true,
			wrap = true,
			align = "left",
			text = managers.localization:to_upper_text(job_heat_text_id, {
				job_heat = job_heat_string
			}),
			font = tweak_data.menu.pd2_small_font,
			font_size = font_size,
			color = heat_color
		})

		managers.hud:make_fine_text(heat_warning_text)
		heat_warning_text:set_left(10)
		modifiers_amount = modifiers_amount + 1
	end

	local pro_warning_text = nil

	if managers.job:is_current_job_professional() then
		pro_warning_text = text_panel:text({
			name = "pro_warning_text",
			vertical = "top",
			h = 128,
			wrap = true,
			align = "left",
			word_wrap = true,
			text = self:get_text("menu_pro_warning"),
			font = tweak_data.menu.pd2_small_font,
			font_size = font_size,
			color = tweak_data.screen_colors.pro_color
		})

		managers.hud:make_fine_text(pro_warning_text)
		pro_warning_text:set_h(pro_warning_text:h())
		pro_warning_text:set_left(10)
		modifiers_amount = modifiers_amount + 1
	end
	local killed_civ_text = nil
	
	if managers.statistics:session_total_civilian_kills() > 0 then
		killed_civ_text = text_panel:text({
			name = "killed_civ_text",
			vertical = "top",
			h = 128,
			wrap = true,
			align = "left",
			word_wrap = true,
			text = self:get_text("menu_killed_civs") .. managers.experience:new_xp("killed_civs") .. "%.",
			font = tweak_data.menu.pd2_small_font,
			font_size = font_size,
			color = tweak_data.screen_colors.pro_color
		})

		managers.hud:make_fine_text(killed_civ_text)
		killed_civ_text:set_h(killed_civ_text:h())
		killed_civ_text:set_left(10)
		modifiers_amount = modifiers_amount + 1
	end

	local gage_courier_text = nil
	local collected_packages = managers.gage_assignment:count_all_units() - managers.gage_assignment:count_active_units()
	if collected_packages > 0 then
		gage_courier_text = text_panel:text({
			name = "gage_courier_text",
			vertical = "top",
			h = 128,
			wrap = true,
			align = "left",
			word_wrap = true,
			text = self:get_text("menu_collected_packages") .. math.floor(5 / managers.gage_assignment:count_all_units() * collected_packages) .. "%.",
			font = tweak_data.menu.pd2_small_font,
			font_size = font_size,
			color = tweak_data.screen_colors.button_stage_2
		})
		managers.hud:make_fine_text(gage_courier_text)
		gage_courier_text:set_h(gage_courier_text:h())
		gage_courier_text:set_left(10)
		modifiers_amount = modifiers_amount + 1
	end
	
	local loose_money_text = nil
	local loose_money_exp = managers.experience:new_xp("loose_money")
	if loose_money_exp > 0 then
		loose_money_text = text_panel:text({
			name = "loose_money_text",
			vertical = "top",
			h = 128,
			wrap = true,
			align = "left",
			word_wrap = true,
			text = self:get_text("menu_loose_money") .. loose_money_exp .. "%.",
			font = tweak_data.menu.pd2_small_font,
			font_size = font_size,
			color = tweak_data.screen_colors.friend_color
		})
		managers.hud:make_fine_text(loose_money_text)
		loose_money_text:set_h(loose_money_text:h())
		loose_money_text:set_left(10)
		modifiers_amount = modifiers_amount + 1
	end
	
	local mul = modifiers_amount < 5 and 0 or modifiers_amount < 6 and 3 or modifiers_amount < 7 and 5 or 7

	if alive(modifiers_text) then
		modifiers_text:set_font_size(modifiers_text:font_size() - (mul / 2))
	end
	if alive(one_down_warning_text) then
		one_down_warning_text:set_top(next_top)
		next_top = one_down_warning_text:bottom() - mul
		one_down_warning_text:set_font_size(one_down_warning_text:font_size() - mul)
	end
	if alive(pro_warning_text) then
		pro_warning_text:set_top(next_top)
		next_top = pro_warning_text:bottom() - mul
		pro_warning_text:set_font_size(pro_warning_text:font_size() - mul)
	end
	if alive(killed_civ_text) then
		killed_civ_text:set_top(next_top)
		next_top = killed_civ_text:bottom() - mul
		killed_civ_text:set_font_size(killed_civ_text:font_size() - mul)
	end
	if alive(heat_warning_text) then
		heat_warning_text:set_top(next_top)
		next_top = heat_warning_text:bottom() - mul
		heat_warning_text:set_font_size(heat_warning_text:font_size() - mul)
	end
	if alive(ghost_warning_text) then
		ghost_warning_text:set_top(next_top)
		next_top = ghost_warning_text:bottom() - mul
		ghost_warning_text:set_font_size(ghost_warning_text:font_size() - mul)
	end
	if alive(gage_courier_text) then
		gage_courier_text:set_top(next_top)
		next_top = gage_courier_text:bottom() - mul
		gage_courier_text:set_font_size(gage_courier_text:font_size() - mul)
	end
	if alive(loose_money_text) then
		loose_money_text:set_top(next_top)
		next_top = loose_money_text:bottom() - mul
		loose_money_text:set_font_size(loose_money_text:font_size() - mul)
	end
	self._modifiers_amount = modifiers_amount
	next_top = next_top + 5
	
	modifiers_text:set_visible(heat_warning_text or loose_money_text or gage_courier_text or killed_civ_text or pro_warning_text or ghost_warning_text or one_down_warning_text)

	local risk_color = tweak_data.screen_colors.risk
	local risk_title = text_panel:text({
		font = tweak_data.menu.pd2_small_font,
		font_size = font_size,
		text = self:get_text("menu_risk"),
		color = risk_color
	})

	managers.hud:make_fine_text(risk_title)
	risk_title:set_top(next_top)
	risk_title:set_visible(job_data and true or false)

	local menu_risk_id = "menu_risk_pd"

	if Global.game_settings.difficulty == "hard" then
		menu_risk_id = "menu_risk_swat"
	elseif Global.game_settings.difficulty == "overkill" then
		menu_risk_id = "menu_risk_fbi"
	elseif Global.game_settings.difficulty == "overkill_145" then
		menu_risk_id = "menu_risk_special"
	elseif Global.game_settings.difficulty == "easy_wish" then
		menu_risk_id = "menu_risk_easy_wish"
	elseif Global.game_settings.difficulty == "overkill_290" then
		menu_risk_id = "menu_risk_elite"
	elseif Global.game_settings.difficulty == "sm_wish" then
		menu_risk_id = "menu_risk_sm_wish"
	end

	local risk_stats_panel = text_panel:panel({
		name = "risk_stats_panel"
	})

	risk_stats_panel:set_h(risk_title:h() + 5)

	if job_data then
		local job_stars = managers.job:current_job_stars()
		local job_and_difficulty_stars = managers.job:current_job_and_difficulty_stars()
		local difficulty_stars = managers.job:current_difficulty_stars()
		local diff = difficulty_stars == 5 and difficulty_stars - 1 or difficulty_stars == 4 and difficulty_stars + 1 or difficulty_stars
		local job_id = managers.job:current_job_id()
		local rsx = 15
		local risks = {
			"risk_pd",
			"risk_swat",
			"risk_fbi",
			"risk_death_squad"
		}
		
		if not Global.SKIP_OVERKILL_290 then
			if diff == 5 or diff == 6 then
				table.insert(risks, "risk_easy_wish")
			end
			table.insert(risks, "risk_murder_squad")
			if diff == 6 then
				table.insert(risks, "risk_sm_wish")
			end
		end

		local max_y = 0
		local max_x = 0
		
		self.difficulties = {
			"easy",
			"normal",
			"hard",
			"overkill",
			"overkill_145",
			"overkill_290",
			"easy_wish",
			"sm_wish"
		}
		local function index_to_difficulty(index)
			return self.difficulties[index]
		end
		for i, name in ipairs(risks) do
			if i ~= 1 then
				local texture, rect = tweak_data.hud_icons:get_icon_data(name)
				local active = i <= diff + 1
				local color = active and i ~= 1 and risk_color or tweak_data.screen_colors.text
				local alpha = active and 1 or 0.25
				local risk = text_panel:bitmap({
					y = 0,
					x = 0,
					texture = texture,
					texture_rect = rect,
					alpha = alpha,
					color = color
				})

				risk:set_x(rsx)
				risk:set_top(math.round(risk_title:bottom()))

				rsx = rsx + risk:w() + 2
				local stat = managers.statistics:completed_job(job_id, index_to_difficulty(i + 1))
				local risk_stat = risk_stats_panel:text({
					align = "center",
					name = name,
					font = tweak_data.menu.pd2_small_font,
					font_size = font_size,
					text = tostring(stat)
				})

				managers.hud:make_fine_text(risk_stat)
				risk_stat:set_world_center_x(risk:world_center_x())

				local this_difficulty = i == diff + 1
				active = i <= diff + 1
				color = active and risk_color or Color.white

				if this_difficulty then
					alpha = 1
				elseif active then
					alpha = 0.5
				else
					alpha = 0.25
				end

				risk_stat:set_color(color)
				risk_stat:set_alpha(alpha)

				max_y = math.max(max_y, risk:bottom())
				max_x = math.max(max_x, risk:right() + 5)
				max_x = math.max(max_x, risk_stat:right() + risk_stats_panel:left() + 10)
			end
		end

		risk_stats_panel:set_top(math.round(max_y + 2))

		local stat = managers.statistics:completed_job(job_id, tweak_data:index_to_difficulty(diff + 2))
		local risk_text = text_panel:text({
			name = "risk_text",
			wrap = true,
			align = "left",
			vertical = "top",
			word_wrap = true,
			x = max_x,
			w = text_panel:w() - max_x,
			h = text_panel:h(),
			text = self:get_text(menu_risk_id) .. " " .. managers.localization:to_upper_text("menu_stat_job_completed", {
				stat = tostring(stat)
			}) .. " ",
			font = tweak_data.hud_stats.objective_desc_font,
			font_size = font_size,
			color = risk_color
		})

		risk_text:set_top(math.round(risk_title:bottom() + 4))
		risk_text:set_h(risk_stats_panel:bottom() - risk_text:top())

		local show_max = self._node and self._node:parameters().show_potential_max or false
		local potential_rewards_title = text_panel:text({
			blend_mode = "add",
			font = tweak_data.menu.pd2_small_font,
			font_size = font_size,
			text = self:get_text(show_max and "menu_potential_rewards_max" or "menu_potential_rewards_min", {
				BTN_Y = managers.localization:btn_macro("menu_modify_item")
			}),
			color = managers.menu:is_pc_controller() and tweak_data.screen_colors.button_stage_3 or tweak_data.screen_colors.text
		})

		managers.hud:make_fine_text(potential_rewards_title)
		potential_rewards_title:set_top(risk_stats_panel:bottom() + 4)
		
		local paygrade_title = text_panel:text({
			x = 10,
			font = tweak_data.menu.pd2_small_font,
			font_size = font_size,
			text = managers.localization:to_upper_text("cn_menu_contract_paygrade_header"),
			color = tweak_data.screen_colors.text
		})

		managers.hud:make_fine_text(paygrade_title)
		paygrade_title:set_top(math.round(potential_rewards_title:bottom()))
		
		local jobpay_title = text_panel:text({
			x = 10,
			font = tweak_data.menu.pd2_small_font,
			font_size = font_size,
			text = managers.localization:to_upper_text("cn_menu_contract_jobpay_header"),
			color = tweak_data.screen_colors.text
		})

		managers.hud:make_fine_text(jobpay_title)
		jobpay_title:set_top(math.round(paygrade_title:bottom()))

		local experience_title = text_panel:text({
			x = 10,
			font = tweak_data.menu.pd2_small_font,
			font_size = font_size,
			text = self:get_text("menu_experience"),
			color = tweak_data.screen_colors.text
		})

		managers.hud:make_fine_text(experience_title)
		experience_title:set_top(math.round(jobpay_title:bottom()))

		self._potential_rewards_title = potential_rewards_title
		self._jobpay_title = jobpay_title
		self._experience_title = experience_title
		self._text_panel = text_panel
		self._rewards_panel = text_panel:panel({
			name = "rewards_panel"
		})
		self._potential_show_max = show_max

		self:set_potential_rewards(show_max)
		
		-- Stars
		local filled_star_rect = {0, 32, 32, 32}
		local empty_star_rect = {32, 32, 32, 32}
		local cy = paygrade_title:center_y()
		local sx = paygrade_title:right() + 8
		local job_and_diff_stars = job_stars + diff
		local edge = 10
		local hate_risk = difficulty_stars == 6 and 3 or difficulty_stars == 5 and 1 or difficulty_stars == 4 and 2 or 0
		
		local level_data = { 
				texture="guis/textures/pd2/mission_briefing/difficulty_icons", 
				texture_rect = filled_star_rect, 
				w = 18, 
				h = 18,
				alpha = 1 
		}
		for i = 1, 15 do
			local x = sx + (i - 1) * 18
			local is_risk = i > job_stars
			local star_data = level_data

			local star = text_panel:bitmap(star_data)
			star:set_color(((i > (job_and_diff_stars > edge and job_and_diff_stars or edge)) and Color.green:with_alpha(0)) or ((i > job_and_diff_stars) and Color.black:with_alpha(0.5)) or ((i > job_and_diff_stars - hate_risk) and tweak_data.screen_colors.pro_color) or ((i > job_stars) and risk_color) or Color.white)
			star:set_x(x)
			star:set_center_y(math.round(cy))
		end
		
	end

	self:_rec_round_object(self._panel)

	self._sides = BoxGuiObject:new(self._panel, {
		sides = {
			1,
			1,
			1,
			1
		}
	})
end