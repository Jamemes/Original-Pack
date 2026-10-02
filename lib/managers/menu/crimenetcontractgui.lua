CrimeNetContractGui = CrimeNetContractGui or class()

function CrimeNetContractGui:init(ws, fullscreen_ws, node)
	self._ws = ws
	self._fullscreen_ws = fullscreen_ws
	self._panel = self._ws:panel():panel({layer = 51})
	self._fullscreen_panel = self._fullscreen_ws:panel():panel({layer = 50})
	self._fullscreen_panel:rect({
		color = Color.black,
		alpha = 0.75,
		layer = 0
	})
	self._node = node
	local job_data = self._node:parameters().menu_component_data
	local width = 760
	local height = 540
	if SystemInfo:platform() ~= Idstring("WIN32") then
		width = 800
		height = 500
	end
	local blur = self._fullscreen_panel:bitmap({
		texture = "guis/textures/test_blur_df",
		w = self._fullscreen_ws:panel():w(),
		h = self._fullscreen_ws:panel():h(),
		render_template = "VertexColorTexturedBlur3D"
	})
	local func = function(o)
		local start_blur = 0
		over(0.6, function(p)
			o:set_alpha(math.lerp(start_blur, 1, p))
		end)
	end
	blur:animate(func)
	self._contact_text_header = self._panel:text({
		text = " ",
		align = "left",
		vertical = "top",
		font_size = tweak_data.menu.pd2_large_font_size,
		font = tweak_data.menu.pd2_large_font,
		color = tweak_data.screen_colors.text
	})
	do
		local x, y, w, h = self._contact_text_header:text_rect()
		self._contact_text_header:set_size(width, h)
		self._contact_text_header:set_center_x(self._panel:w() * 0.5)
	end
	self._contract_panel = self._panel:panel({
		h = height,
		w = width,
		layer = 1,
		x = self._contact_text_header:x(),
		y = self._contact_text_header:bottom()
	})
	self._contract_panel:set_center_y(self._panel:h() * 0.5)
	self._contact_text_header:set_bottom(self._contract_panel:top())
	if not job_data.job_id then
		local bottom = self._contract_panel:bottom()
		self._contract_panel:set_h(160)
		self._contract_panel:set_bottom(bottom)
		self._contact_text_header:set_bottom(self._contract_panel:top())
		Global.a = job_data
		local host_name = job_data.host_name or ""
		local num_players = job_data.num_plrs or 1
		local server_text = managers.localization:to_upper_text("menu_lobby_server_title") .. " " .. host_name
		local players_text = managers.localization:to_upper_text("menu_players_online", {
			COUNT = tostring(num_players)
		})
		self._contact_text_header:set_text(server_text .. "\n" .. players_text)
		self._contact_text_header:set_font(tweak_data.menu.pd2_medium_font_id)
		self._contact_text_header:set_font_size(tweak_data.menu.pd2_medium_font_size)
		local x, y, w, h = self._contact_text_header:text_rect()
		self._contact_text_header:set_size(width, h)
		self._contact_text_header:set_top(self._contract_panel:top())
		self._contact_text_header:move(10, 10)
		BoxGuiObject:new(self._contract_panel, {
			sides = {
				1,
				1,
				1,
				1
			}
		})
		self._step = 1
		self._steps = {}
		return
	end
	BoxGuiObject:new(self._contract_panel, {
		sides = {
			1,
			1,
			1,
			1
		}
	})
	job_data.job_id = job_data.job_id or "ukrainian_job"
	local narrative = tweak_data.narrative.jobs[job_data.job_id]
	local text_w = width - 360
	local font_size = tweak_data.menu.pd2_small_font_size
	local font = tweak_data.menu.pd2_small_font
	local risk_color = tweak_data.screen_colors.risk
	self._contact_text_header:set_text(managers.localization:to_upper_text("menu_cn_contract_title", {
		job = managers.localization:text(narrative.name_id)
	}))
	local contract_text = self._contract_panel:text({
		text = managers.localization:text(narrative.briefing_id),
		align = "left",
		vertical = "top",
		w = text_w,
		font_size = font_size,
		font = font,
		color = tweak_data.screen_colors.text,
		wrap = true,
		wrap_word = true,
		x = 10,
		y = 10
	})
	do
		local _, _, _, h = contract_text:text_rect()
		local scale = 1
		if h + contract_text:top() > math.round(self._contract_panel:h() * 0.5) - font_size then
			scale = (math.round(self._contract_panel:h() * 0.5) - font_size) / (h + contract_text:top())
		end
		contract_text:set_font_size(font_size * scale)
	end
	local contact_w = width - (text_w + 20) - 10
	local contact_h = contact_w / 1.7777778
	local contact_panel = self._contract_panel:panel({
		w = contact_w,
		h = contact_h,
		x = text_w + 20,
		y = 10
	})
	local contact_image = contact_panel:rect({
		color = Color(0.3, 0, 0, 0)
	})
	local crimenet_videos = narrative.crimenet_videos
	if crimenet_videos then
		local variant = math.random(#crimenet_videos)
		contact_panel:video({
			video = "movies/" .. crimenet_videos[variant],
			width = contact_panel:w(),
			height = contact_panel:h(),
			blend_mode = "add",
			loop = true,
			color = tweak_data.screen_colors.button_stage_2
		})
	end
	local contact_text = self._contract_panel:text({
		text = managers.localization:to_upper_text(tweak_data.narrative.contacts[narrative.contact].name_id),
		font_size = font_size,
		font = font,
		color = tweak_data.screen_colors.text
	})
	do
		local x, y, w, h = contact_text:text_rect()
		contact_text:set_size(w, h)
	end
	contact_text:set_position(contact_panel:left(), contact_panel:bottom() + 5)
	BoxGuiObject:new(contact_panel, {
		sides = {
			1,
			1,
			1,
			1
		}
	})
	if narrative.professional then
		local pro_warning_text = self._contract_panel:text({
			name = "pro_warning_text",
			text = managers.localization:to_upper_text("menu_pro_warning"),
			font = font,
			font_size = font_size,
			color = tweak_data.screen_colors.pro_color,
			align = "left",
			vertical = "top",
			wrap = true,
			word_wrap = true,
			h = 128,
			x = 10,
			w = text_w
		})
		self:make_fine_text(pro_warning_text)
		pro_warning_text:set_h(pro_warning_text:h() + 10)
		pro_warning_text:set_bottom(math.round(self._contract_panel:h() * 0.5))
	end
	local risk_title = self._contract_panel:text({
		font = font,
		font_size = font_size,
		text = managers.localization:to_upper_text("menu_risk"),
		color = risk_color,
		x = 10
	})
	self:make_fine_text(risk_title)
	risk_title:set_top(math.round(self._contract_panel:h() * 0.5))
	local menu_risk_id = "menu_risk_pd"
	if job_data.difficulty == "hard" then
		menu_risk_id = "menu_risk_swat"
	elseif job_data.difficulty == "overkill" then
		menu_risk_id = "menu_risk_fbi"
	elseif job_data.difficulty == "overkill_145" then
		menu_risk_id = "menu_risk_special"
	end
	local risk_text = self._contract_panel:text({
		name = "risk_text",
		w = text_w,
		text = managers.localization:to_upper_text(menu_risk_id) .. " ",
		font = font,
		font_size = font_size,
		color = risk_color,
		align = "left",
		vertical = "top",
		wrap = true,
		word_wrap = true,
		x = 10
	})
	self:make_fine_text(risk_text)
	risk_text:set_h(risk_text:h() + 10)
	risk_text:set_top(math.round(risk_title:bottom() + 10))
	risk_text:hide()
	local potential_rewards_title = self._contract_panel:text({
		font = font,
		font_size = font_size,
		text = managers.localization:to_upper_text("menu_potential_rewards"),
		color = tweak_data.screen_colors.text,
		x = 10
	})
	self:make_fine_text(potential_rewards_title)
	potential_rewards_title:set_top(math.round(risk_text:bottom() + 4))
	local paygrade_title = self._contract_panel:text({
		font = font,
		font_size = font_size,
		text = managers.localization:to_upper_text("cn_menu_contract_paygrade_header"),
		color = tweak_data.screen_colors.text,
		x = 10
	})
	self:make_fine_text(paygrade_title)
	paygrade_title:set_top(math.round(potential_rewards_title:bottom() + 4))
	local experience_title = self._contract_panel:text({
		font = font,
		font_size = font_size,
		text = managers.localization:to_upper_text("menu_experience"),
		color = tweak_data.screen_colors.text,
		x = 10
	})
	self:make_fine_text(experience_title)
	experience_title:set_top(math.round(paygrade_title:bottom()))
	local stage_cash_title
	stage_cash_title = self._contract_panel:text({
		font = font,
		font_size = font_size,
		text = managers.localization:to_upper_text("menu_cash_stage", {money = ""}),
		color = tweak_data.screen_colors.text,
		x = 10
	})
	self:make_fine_text(stage_cash_title)
	stage_cash_title:set_top(math.round(experience_title:bottom()))
	local cash_title = self._contract_panel:text({
		font = font,
		font_size = font_size,
		text = managers.localization:to_upper_text("menu_cash_job", {money = ""}),
		color = tweak_data.screen_colors.text,
		x = 10
	})
	self:make_fine_text(cash_title)
	cash_title:set_top(math.round(stage_cash_title:bottom()))
	local sx = math.max(paygrade_title:w(), experience_title:w())
	sx = math.max(sx, stage_cash_title:w())
	sx = math.max(sx, cash_title:w()) + 24
	local plvl = managers.experience:current_level()
	local player_stars = math.max(math.ceil(plvl / 10), 1)
	local job_stars = math.ceil(narrative.jc / 10)
	local difficulty_stars = job_data.difficulty_id - 2
	local job_and_difficulty_stars = job_stars + difficulty_stars
	local rsx = risk_title:right() + 12
	for i, name in ipairs({
		"risk_pd",
		"risk_swat",
		"risk_fbi",
		"risk_death_squad"
	}) do
		if i ~= 1 then
			local texture, rect = tweak_data.hud_icons:get_icon_data(name)
			local active = false
			local color = active and i ~= 1 and risk_color or Color.white
			local alpha = active and 1 or 0.25
			local risk = self._contract_panel:bitmap({
				name = name,
				texture = texture,
				texture_rect = rect,
				x = 0,
				y = 0,
				alpha = alpha,
				color = color
			})
			risk:set_x(rsx)
			risk:set_center_y(math.round(risk_title:center_y()))
			rsx = rsx + risk:w() + 12
		end
	end
	local filled_star_rect = {
		0,
		32,
		32,
		32
	}
	local empty_star_rect = {
		32,
		32,
		32,
		32
	}
	local cy = paygrade_title:center_y()
	local level_data = {
		texture = "guis/textures/pd2/mission_briefing/difficulty_icons",
		texture_rect = filled_star_rect,
		w = 20,
		h = 20,
		color = tweak_data.screen_colors.text,
		alpha = 0
	}
	local risk_data = {
		texture = "guis/textures/pd2/crimenet_skull",
		w = 20,
		h = 20,
		color = tweak_data.screen_colors.text,
		alpha = 0
	}
	for i = 1, job_and_difficulty_stars do
		local is_risk = job_stars < i
		local star_data = is_risk and risk_data or level_data
		star_data.name = "star" .. tostring(i)
		local star = self._contract_panel:bitmap(star_data)
		star:set_x(math.round(sx + (i - 1) * 22))
		star:set_center_y(math.round(cy))
	end
	local cy = experience_title:center_y()
	local xp_stage_stars = managers.experience:get_stage_xp_by_stars(job_stars)
	local xp_job_stars = managers.experience:get_job_xp_by_stars(job_stars)
	local xp_multiplier = managers.experience:get_contract_difficulty_multiplier(difficulty_stars)
	local xp_multiplier = managers.experience:get_contract_difficulty_multiplier(difficulty_stars)
	local experience_manager = tweak_data.experience_manager.level_limit
	if player_stars <= job_and_difficulty_stars + tweak_data:get_value("experience_manager", "level_limit", "low_cap_level") then
		local diff_stars = math.clamp(job_and_difficulty_stars - player_stars, 1, #experience_manager.pc_difference_multipliers)
		local level_limit_mul = tweak_data:get_value("experience_manager", "level_limit", "pc_difference_multipliers", diff_stars)
		local plr_difficulty_stars = math.max(difficulty_stars - diff_stars, 0)
		local plr_xp_multiplier = managers.experience:get_contract_difficulty_multiplier(plr_difficulty_stars) or 0
		local white_player_stars = player_stars - plr_difficulty_stars
		local xp_plr_stage_stars = managers.experience:get_stage_xp_by_stars(white_player_stars)
		xp_plr_stage_stars = xp_plr_stage_stars + xp_plr_stage_stars * plr_xp_multiplier
		local xp_stage = xp_stage_stars + xp_stage_stars * xp_multiplier
		local diff_stage = xp_stage - xp_plr_stage_stars
		local new_xp_stage = xp_plr_stage_stars + diff_stage * level_limit_mul
		xp_stage_stars = xp_stage_stars * (new_xp_stage / xp_stage)
		local xp_plr_job_stars = managers.experience:get_job_xp_by_stars(white_player_stars)
		xp_plr_job_stars = xp_plr_job_stars + xp_plr_job_stars * plr_xp_multiplier
		local xp_job = xp_job_stars + xp_job_stars * xp_multiplier
		local diff_job = xp_job - xp_plr_job_stars
		local new_xp_job = xp_plr_job_stars + diff_job * level_limit_mul
		xp_job_stars = xp_job_stars * (new_xp_job / xp_job)
	end
	local job_xp = self._contract_panel:text({
		font = font,
		font_size = font_size,
		text = "0",
		color = tweak_data.screen_colors.text
	})
	self:make_fine_text(job_xp)
	job_xp:set_x(sx)
	job_xp:set_center_y(math.round(cy))
	local add_xp = self._contract_panel:text({
		font = font,
		font_size = font_size,
		text = "",
		color = risk_color
	})
	add_xp:set_text(" +" .. math.round(0))
	self:make_fine_text(add_xp)
	add_xp:set_x(math.round(job_xp:right()))
	add_xp:set_center_y(math.round(cy))
	local money_stage_stars = 0
	local money_multiplier = managers.money:get_contract_difficulty_multiplier(difficulty_stars)
	local cy = stage_cash_title:center_y()
	money_stage_stars = managers.money:get_stage_payout_by_stars(job_stars)
	local stage_cash = self._contract_panel:text({
		font = font,
		font_size = font_size,
		text = tostring(#narrative.chain) .. " x " .. managers.experience:cash_string(0),
		color = tweak_data.screen_colors.text
	})
	self:make_fine_text(stage_cash)
	stage_cash:set_x(sx)
	stage_cash:set_center_y(math.round(cy))
	local stage_add_cash = self._contract_panel:text({
		font = font,
		font_size = font_size,
		text = "",
		color = risk_color
	})
	stage_add_cash:set_text(" +" .. tostring(#narrative.chain) .. " x " .. managers.experience:cash_string(math.round(0)))
	self:make_fine_text(stage_add_cash)
	stage_add_cash:set_x(math.round(stage_cash:right()))
	stage_add_cash:set_center_y(math.round(cy))
	cy = cash_title:center_y()
	local money_job_stars = managers.money:get_job_payout_by_stars(job_stars)
	local money_manager = tweak_data.money_manager.level_limit
	if player_stars <= job_and_difficulty_stars + tweak_data:get_value("money_manager", "level_limit", "low_cap_level") then
		local diff_stars = math.clamp(job_and_difficulty_stars - player_stars, 1, #money_manager.pc_difference_multipliers)
		local level_limit_mul = tweak_data:get_value("money_manager", "level_limit", "pc_difference_multipliers", diff_stars)
		local plr_difficulty_stars = math.max(difficulty_stars - diff_stars, 0)
		local plr_money_multiplier = managers.money:get_contract_difficulty_multiplier(plr_difficulty_stars) or 0
		local white_player_stars = player_stars - plr_difficulty_stars
		local cash_plr_stage_stars = managers.money:get_stage_payout_by_stars(white_player_stars, true)
		cash_plr_stage_stars = cash_plr_stage_stars + cash_plr_stage_stars * plr_money_multiplier
		local cash_stage = money_stage_stars + money_stage_stars * money_multiplier
		local diff_stage = cash_stage - cash_plr_stage_stars
		local new_cash_stage = cash_plr_stage_stars + diff_stage * level_limit_mul
		money_stage_stars = money_stage_stars * (new_cash_stage / cash_stage)
		local cash_plr_job_stars = managers.money:get_job_payout_by_stars(white_player_stars, true)
		cash_plr_job_stars = cash_plr_job_stars + cash_plr_job_stars * plr_money_multiplier
		local cash_job = money_job_stars + money_job_stars * money_multiplier
		local diff_job = cash_job - cash_plr_job_stars
		local new_cash_job = cash_plr_job_stars + diff_job * level_limit_mul
		money_job_stars = money_job_stars * (new_cash_job / cash_job)
	end
	local job_cash = self._contract_panel:text({
		font = font,
		font_size = font_size,
		text = managers.experience:cash_string(0),
		color = tweak_data.screen_colors.text
	})
	self:make_fine_text(job_cash)
	job_cash:set_x(sx)
	job_cash:set_center_y(math.round(cy))
	local add_cash = self._contract_panel:text({
		font = font,
		font_size = font_size,
		text = "",
		color = risk_color
	})
	add_cash:set_text(" +" .. managers.experience:cash_string(math.round(0)))
	self:make_fine_text(add_cash)
	add_cash:set_x(math.round(job_cash:right()))
	add_cash:set_center_y(math.round(cy))
	local payday_money = math.round(money_job_stars + tweak_data:get_value("money_manager", "flat_job_completion") + money_job_stars * money_multiplier + (money_stage_stars + tweak_data:get_value("money_manager", "flat_stage_completion") + money_stage_stars * money_multiplier) * #narrative.chain)
	local payday_text = self._contract_panel:text({
		font = tweak_data.menu.pd2_large_font,
		font_size = tweak_data.menu.pd2_large_font_size,
		text = managers.localization:to_upper_text("menu_payday", {
			MONEY = managers.experience:cash_string(0)
		}),
		color = tweak_data.screen_colors.text,
		x = 10
	})
	self:make_fine_text(payday_text)
	payday_text:set_bottom(self._contract_panel:h() - 10)
	self._briefing_event = narrative.briefing_event
	if self._briefing_event then
		self._briefing_len_panel = self._contract_panel:panel({
			w = contact_image:w(),
			h = font_size * 2 + 20
		})
		self._briefing_len_panel:rect({
			name = "duration",
			w = 0,
			color = tweak_data.screen_colors.button_stage_3:with_alpha(0.2),
			alpha = 0.6,
			blend_mode = "add",
			halign = "grow",
			valign = "grow"
		})
		self._briefing_len_panel:text({
			name = "text",
			font = font,
			font_size = font_size,
			text = "",
			color = tweak_data.screen_colors.text,
			x = 10,
			y = 10,
			layer = 1,
			blend_mode = "add"
		})
		local button_text = self._briefing_len_panel:text({
			name = "button_text",
			font = font,
			font_size = font_size,
			text = " ",
			color = tweak_data.screen_colors.text,
			x = 10,
			y = 10,
			layer = 1,
			blend_mode = "add"
		})
		local _, _, _, h = button_text:text_rect()
		self._briefing_len_panel:set_h(h * 2 + 20)
		if managers.menu:is_pc_controller() then
			button_text:set_color(tweak_data.screen_colors.button_stage_3)
		end
		BoxGuiObject:new(self._briefing_len_panel, {
			sides = {
				1,
				1,
				1,
				1
			}
		})
		self._briefing_len_panel:set_position(contact_text:left(), contact_text:bottom() + 10)
	end
	local days_multiplier = 0
	for i = 1, #narrative.chain do
		local day_mul = narrative.professional and tweak_data:get_value("experience_manager", "pro_day_multiplier", i) or tweak_data:get_value("experience_manager", "day_multiplier", i)
		days_multiplier = days_multiplier + (day_mul - 1)
	end
	days_multiplier = 1 + days_multiplier / #narrative.chain
	local last_day_mul = narrative.professional and tweak_data:get_value("experience_manager", "pro_day_multiplier", #narrative.chain) or tweak_data:get_value("experience_manager", "day_multiplier", #narrative.chain)
	self._data = {}
	self._data.job_cash = money_job_stars + tweak_data:get_value("money_manager", "flat_job_completion")
	self._data.add_job_cash = money_job_stars * money_multiplier
	self._data.stage_cash = money_stage_stars + tweak_data:get_value("money_manager", "flat_stage_completion")
	self._data.add_stage_cash = money_stage_stars * money_multiplier
	self._data.experience = xp_job_stars * last_day_mul + xp_stage_stars + xp_stage_stars * (#narrative.chain - 1) * days_multiplier
	self._data.add_experience = self._data.experience * xp_multiplier
	self._data.num_stages_string = tostring(#narrative.chain) .. " x "
	self._data.payday_money = payday_money
	self._data.counted_payday_money = 0
	self._data.stars = {
		job_and_difficulty_stars = job_and_difficulty_stars,
		job_stars = job_stars,
		difficulty_stars = difficulty_stars
	}
	self._data.gui_objects = {}
	self._data.gui_objects.risk_text = risk_text
	self._data.gui_objects.payday_text = payday_text
	self._data.gui_objects.job_cash = job_cash
	self._data.gui_objects.job_add_cash = add_cash
	self._data.gui_objects.stage_cash = stage_cash
	self._data.gui_objects.stage_add_cash = stage_add_cash
	self._data.gui_objects.add_xp = add_xp
	self._data.gui_objects.job_xp = job_xp
	self._data.gui_objects.risks = {
		"risk_pd",
		"risk_swat",
		"risk_fbi",
		"risk_death_squad"
	}
	self._data.gui_objects.num_stars = 10
	self._wait_t = 0
	local next_level_data = managers.experience:next_level_data() or {}
	local gain_xp = self._data.experience + self._data.add_experience
	local at_max_level = managers.experience:current_level() == managers.experience:level_cap()
	local can_lvl_up = not at_max_level and gain_xp >= next_level_data.points - next_level_data.current_points
	if not at_max_level and can_lvl_up then
		local text = managers.localization:to_upper_text("hud_potential_level_up")
		local potential_level_up_text = self._contract_panel:text({
			layer = 3,
			name = "potential_level_up_text",
			blend_mode = "normal",
			visible = false,
			text = text,
			font_size = tweak_data.menu.pd2_small_font_size,
			font = tweak_data.menu.pd2_small_font,
			color = tweak_data.hud_stats.potential_xp_color
		})
		self:make_fine_text(potential_level_up_text)
		potential_level_up_text:set_left(math.round(add_xp:right() + 4))
		potential_level_up_text:set_top(math.round(add_xp:top()))
		self._data.gui_objects.potential_level_up_text = potential_level_up_text
		self._data.gui_objects.when_to_level_up = next_level_data.points - next_level_data.current_points
	end
	self._step = 1
	self._steps = {
		"set_time",
		"start_sound",
		"count_job_stars",
		"count_difficulty_stars",
		"start_count_payday",
		"count_payday",
		"end_count_payday",
		"free_memory"
	}
	self._current_job_star = 0
	self._current_difficulty_star = 0
	self._post_event_params = {
		show_subtitle = false,
		listener = {
			clbk = callback(self, self, "sound_event_callback"),
			duration = true,
			end_of_event = true
		}
	}
	managers.menu:active_menu().input:deactivate_controller_mouse()
	self:_rec_round_object(self._panel)
end

function CrimeNetContractGui:_rec_round_object(object)
	if object.children then
		for i, d in ipairs(object:children()) do
			self:_rec_round_object(d)
		end
	end
	local x, y = object:position()
	object:set_position(math.round(x), math.round(y))
end

function CrimeNetContractGui:set_time(t, dt)
	self._wait_t = t + 1
	self._step = self._step + 1
end

function CrimeNetContractGui:start_sound(t, dt)
	self:toggle_post_event()
	self._step = self._step + 1
end

function CrimeNetContractGui:count_job_stars(t, dt)
	if self._data.stars.job_stars == 0 then
		self._step = self._step + 1
		return
	end
	self._current_job_star = self._current_job_star + 1
	local stars = self._data.stars.job_stars
	local gui_panel = self._contract_panel
	local xp = math.round(self._data.experience * (self._current_job_star / stars))
	local gui_xp = self._data.gui_objects.job_xp
	local gui_add_xp = self._data.gui_objects.add_xp
	gui_xp:set_text(managers.money:add_decimal_marks_to_string(tostring(xp)))
	self:make_fine_text(gui_xp)
	gui_add_xp:set_x(math.round(gui_xp:right()))
	if self._data.gui_objects.potential_level_up_text then
		self._data.gui_objects.potential_level_up_text:set_left(math.round(gui_add_xp:right() + 4))
		self._data.gui_objects.potential_level_up_text:set_visible(xp > self._data.gui_objects.when_to_level_up)
	end
	local stage_cash = math.round(self._data.stage_cash * (self._current_job_star / stars))
	local gui_stage_cash = self._data.gui_objects.stage_cash
	local gui_stage_add_cash = self._data.gui_objects.stage_add_cash
	gui_stage_cash:set_text(self._data.num_stages_string .. managers.experience:cash_string(stage_cash))
	self:make_fine_text(gui_stage_cash)
	gui_stage_add_cash:set_x(math.round(gui_stage_cash:right()))
	local job_cash = math.round(self._data.job_cash * (self._current_job_star / stars))
	local gui_job_cash = self._data.gui_objects.job_cash
	local gui_job_add_cash = self._data.gui_objects.job_add_cash
	gui_job_cash:set_text(managers.experience:cash_string(job_cash))
	self:make_fine_text(gui_job_cash)
	gui_job_add_cash:set_x(math.round(gui_job_cash:right()))
	gui_panel:child("star" .. self._current_job_star):set_alpha(1)
	gui_panel:child("star" .. self._current_job_star):set_color(Color.white)
	managers.menu_component:post_event("count_1_finished")
	self._counting_sound = false
	self._wait_t = t + 0.5
	if self._current_job_star == self._data.stars.job_stars then
		self._wait_t = t + 1
		self._step = self._step + 1
	end
end

function CrimeNetContractGui:count_difficulty_stars(t, dt)
	if self._data.stars.difficulty_stars == 0 then
		self._data.gui_objects.risk_text:show()
		self._step = self._step + 1
		self._wait_t = t + 0.5
		return
	end
	self._current_difficulty_star = self._current_difficulty_star + 1
	local stars = self._data.stars.difficulty_stars
	local gui_panel = self._contract_panel
	local xp = math.round(self._data.add_experience * (self._current_difficulty_star / stars))
	local gui_add_xp = self._data.gui_objects.add_xp
	gui_add_xp:set_text(" +" .. managers.money:add_decimal_marks_to_string(tostring(xp)))
	self:make_fine_text(gui_add_xp)
	if self._data.gui_objects.potential_level_up_text then
		self._data.gui_objects.potential_level_up_text:set_left(math.round(gui_add_xp:right() + 4))
		self._data.gui_objects.potential_level_up_text:set_visible(self._data.experience + xp > self._data.gui_objects.when_to_level_up)
	end
	local stage_cash = math.round(self._data.add_stage_cash * (self._current_difficulty_star / stars))
	local gui_stage_add_cash = self._data.gui_objects.stage_add_cash
	gui_stage_add_cash:set_text(" +" .. self._data.num_stages_string .. managers.experience:cash_string(stage_cash))
	self:make_fine_text(gui_stage_add_cash)
	local job_cash = math.round(self._data.add_job_cash * (self._current_difficulty_star / stars))
	local gui_job_add_cash = self._data.gui_objects.job_add_cash
	gui_job_add_cash:set_text(" +" .. managers.experience:cash_string(job_cash))
	self:make_fine_text(gui_job_add_cash)
	gui_panel:child("star" .. self._current_job_star + self._current_difficulty_star):set_alpha(1)
	gui_panel:child("star" .. self._current_job_star + self._current_difficulty_star):set_color(tweak_data.screen_colors.risk)
	gui_panel:child(self._data.gui_objects.risks[self._current_difficulty_star + 1]):set_alpha(1)
	gui_panel:child(self._data.gui_objects.risks[self._current_difficulty_star + 1]):set_color(tweak_data.screen_colors.risk)
	managers.menu_component:post_event("count_1_finished")
	self._counting_sound = false
	self._wait_t = t + 0.5
	if self._current_difficulty_star == self._data.stars.difficulty_stars then
		self._wait_t = t + 1
		self._step = self._step + 1
		self._data.gui_objects.risk_text:show()
	end
end

function CrimeNetContractGui:start_count_payday(t, dt)
	managers.menu_component:post_event("count_1")
	self._counting_sound = true
	self._step = self._step + 1
end

function CrimeNetContractGui:count_payday(t, dt)
	self._data.counted_payday_money = math.round(math.step(self._data.counted_payday_money, self._data.payday_money, dt * math.max(self._data.payday_money / (math.rand(1) + 3.5), 40000)))
	self._data.gui_objects.payday_text:set_text(managers.localization:to_upper_text("menu_payday", {
		MONEY = managers.experience:cash_string(self._data.counted_payday_money)
	}))
	self:make_fine_text(self._data.gui_objects.payday_text)
	if self._data.counted_payday_money == self._data.payday_money then
		self._step = self._step + 1
	end
end

function CrimeNetContractGui:end_count_payday(t, dt)
	managers.menu_component:post_event("count_1_finished")
	self._counting_sound = false
	self._wait_t = t + 1.5
	self._step = self._step + 1
end

function CrimeNetContractGui:free_memory(t, dt)
	self._data = nil
	self._step = self._step + 1
	if self._counting_sound then
		managers.menu_component:post_event("count_1_finished")
		self._counting_sound = false
	end
end

function CrimeNetContractGui:sound_event_callback(event_type, duration)
	if event_type == "end_of_event" then
		self._briefing_duration = nil
		self._briefing_remaining = nil
		self._briefing_len_panel:child("duration"):set_w(0)
		self._briefing_len_panel:child("text"):set_text(managers.localization:to_upper_text("menu_cn_message_stopped"))
		self._briefing_len_panel:child("button_text"):set_text(managers.localization:to_upper_text("menu_play_sound", {
			BTN_X = managers.localization:btn_macro("menu_toggle_voice_message")
		}))
		self:make_fine_text(self._briefing_len_panel:child("text"))
		self:make_fine_text(self._briefing_len_panel:child("button_text"))
		self._briefing_len_panel:child("button_text"):set_position(self._briefing_len_panel:child("text"):left(), self._briefing_len_panel:child("text"):bottom())
	elseif event_type == "duration" and 6 < duration then
		self._briefing_duration = duration
		self._briefing_remaining = self._briefing_duration
	end
end

function CrimeNetContractGui:toggle_post_event()
	if not self._briefing_event then
		return
	end
	if managers.briefing:event_playing() then
		managers.briefing:stop_event()
	else
		managers.briefing:post_event(self._briefing_event, self._post_event_params)
		self._briefing_len_panel:child("text"):set_text(managers.localization:to_upper_text("menu_cn_message_playing"))
		self._briefing_len_panel:child("button_text"):set_text(managers.localization:to_upper_text("menu_stop_sound", {
			BTN_X = managers.localization:btn_macro("menu_toggle_voice_message")
		}))
		self:make_fine_text(self._briefing_len_panel:child("text"))
		self:make_fine_text(self._briefing_len_panel:child("button_text"))
		self._briefing_len_panel:child("button_text"):set_position(self._briefing_len_panel:child("text"):left(), self._briefing_len_panel:child("text"):bottom())
	end
end

function CrimeNetContractGui:update(t, dt)
	if self._wait_t then
		if t > self._wait_t then
			self._wait_t = nil
		end
	else
		local current_step = self._steps[self._step]
		if current_step then
			self[current_step](self, t, dt)
		end
	end
	if self._briefing_duration and self._briefing_remaining then
		self._briefing_remaining = math.max(self._briefing_remaining - dt, 0)
		if self._briefing_remaining > 0 then
			self._briefing_len_panel:child("duration"):set_w(self._briefing_len_panel:w() * (1 - self._briefing_remaining / self._briefing_duration))
		else
			self._briefing_len_panel:child("duration"):set_w(self._briefing_len_panel:w())
			self._briefing_duration = nil
			self._briefing_remaining = nil
		end
	end
end

function CrimeNetContractGui:mouse_moved(o, x, y)
	if alive(self._briefing_len_panel) then
		if self._briefing_len_panel:child("button_text"):inside(x, y) then
			if not self._button_highlight then
				self._button_highlight = true
				self._briefing_len_panel:child("button_text"):set_color(tweak_data.screen_colors.button_stage_2)
			end
			return true, "arrow"
		elseif self._button_highlight then
			self._briefing_len_panel:child("button_text"):set_color(tweak_data.screen_colors.button_stage_3)
			self._button_highlight = false
		end
	end
	if x > self._contract_panel:left() + 270 and y > self._contract_panel:bottom() - 140 and x < self._contract_panel:right() and y < self._contract_panel:bottom() then
		return false, "arrow"
	end
	return false, "hand"
end

function CrimeNetContractGui:mouse_pressed(o, button, x, y)
	if alive(self._briefing_len_panel) and self._step > 2 and self._briefing_len_panel:child("button_text"):inside(x, y) then
		self:toggle_post_event()
	end
end

function CrimeNetContractGui:make_fine_text(text)
	local x, y, w, h = text:text_rect()
	text:set_size(w, h)
	text:set_position(math.round(text:x()), math.round(text:y()))
end

function CrimeNetContractGui:special_btn_pressed(button)
	if button == Idstring("voice_message") then
		self:toggle_post_event()
		return true
	end
	return false
end

function CrimeNetContractGui:close()
	if not managers.menu:is_pc_controller() then
		managers.menu:active_menu().input:activate_controller_mouse()
	end
	self._ws:panel():remove(self._panel)
	self._fullscreen_ws:panel():remove(self._fullscreen_panel)
	if self._counting_sound then
		managers.menu_component:post_event("count_1_finished")
		self._counting_sound = false
	end
	managers.briefing:stop_event(true)
end
