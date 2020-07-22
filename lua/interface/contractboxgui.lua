function ContractBoxGui:create_contract_box()
	if not managers.network:session() then
		return
	end

	if self._contract_panel and alive(self._contract_panel) then
		self._panel:remove(self._contract_panel)
	end

	if self._contract_text_header and alive(self._contract_text_header) then
		self._panel:remove(self._contract_text_header)
	end

	if alive(self._panel:child("pro_text")) then
		self._panel:remove(self._panel:child("pro_text"))
	end

	self._contract_panel = nil
	self._contract_text_header = nil
	local contact_data = managers.job:current_contact_data()
	local job_data = managers.job:current_job_data()
	local job_chain = managers.job:current_job_chain_data()
	local job_id = managers.job:current_job_id()
	local job_tweak = tweak_data.levels[job_id]
	self._contract_panel = self._panel:panel({
		name = "contract_box_panel",
		h = 100,
		layer = 0,
		w = self._panel:w() * 0.35
	})

	self._contract_panel:rect({
		halign = "grow",
		valign = "grow",
		layer = -1,
		color = Color(0.5, 0, 0, 0)
	})

	local font = tweak_data.menu.pd2_small_font
	local font_size = tweak_data.menu.pd2_small_font_size

	if contact_data then
		self._contract_text_header = self._panel:text({
			blend_mode = "add",
			text = utf8.to_upper(managers.localization:text(contact_data.name_id) .. ": " .. managers.localization:text(job_data.name_id)),
			h = tweak_data.menu.pd2_medium_font_size,
			font_size = tweak_data.menu.pd2_medium_font_size,
			font = tweak_data.menu.pd2_medium_font,
			color = tweak_data.screen_colors.text
		})
		local length_text_header = self._contract_panel:text({
			text = managers.localization:to_upper_text("cn_menu_contract_length_header"),
			font_size = font_size,
			font = font,
			color = tweak_data.screen_colors.text
		})
		local risk_text_header = self._contract_panel:text({
			text = managers.localization:to_upper_text("menu_lobby_difficulty_title"),
			font_size = font_size,
			font = font,
			color = tweak_data.screen_colors.text
		})
		local exp_text_header = self._contract_panel:text({
			text = managers.localization:to_upper_text("menu_experience"),
			font_size = font_size,
			font = font,
			color = tweak_data.screen_colors.text
		})
		local payout_text_header = self._contract_panel:text({
			text = managers.localization:to_upper_text("cn_menu_contract_jobpay_header"),
			font_size = font_size,
			font = font,
			color = tweak_data.screen_colors.text
		})
		local paygrade_text_header = self._contract_panel:text({
			text = managers.localization:to_upper_text("cn_menu_contract_paygrade_header"),
			font_size = font_size,
			font = font,
			color = tweak_data.screen_colors.text
		})
		local _, _, tw, th = self._contract_text_header:text_rect()

		self._contract_text_header:set_size(tw, th)

		local w = 0
		local _, _, tw, th = length_text_header:text_rect()
		w = math.max(w, tw)

		length_text_header:set_size(tw, th)

		local _, _, tw, th = risk_text_header:text_rect()
		w = math.max(w, tw)

		risk_text_header:set_size(tw, th)

		local _, _, tw, th = exp_text_header:text_rect()
		w = math.max(w, tw)

		exp_text_header:set_size(tw, th)

		local _, _, tw, th = payout_text_header:text_rect()
		w = math.max(w, tw)

		payout_text_header:set_size(tw, th)
	
		local _, _, tw, th = paygrade_text_header:text_rect()
		w = math.max(w, tw)
		
		paygrade_text_header:set_size(tw, th)
			
		w = w + 10

		length_text_header:set_right(w)
		paygrade_text_header:set_right(w)
		risk_text_header:set_right(w)
		exp_text_header:set_right(w)
		payout_text_header:set_right(w)
		paygrade_text_header:set_top(10)
		risk_text_header:set_top(paygrade_text_header:bottom())
		length_text_header:set_top(risk_text_header:bottom())
		exp_text_header:set_top(length_text_header:bottom())
		payout_text_header:set_top(exp_text_header:bottom())

		local length_text = self._contract_panel:text({
			vertical = "top",
			align = "left",
			text = managers.localization:to_upper_text("cn_menu_contract_length", {
				stages = #job_chain
			}),
			font_size = font_size,
			font = font,
			color = tweak_data.screen_colors.text
		})

		length_text:set_position(length_text_header:right() + 5, length_text_header:top())

		local _, _, tw, th = length_text:text_rect()
		w = math.max(w, tw)

		length_text:set_size(tw, th)

		if managers.job:is_job_ghostable(managers.job:current_job_id()) then
			local ghost_icon = self._contract_panel:bitmap({
				blend_mode = "add",
				texture = "guis/textures/pd2/cn_minighost",
				h = 18,
				w = 18,
				color = tweak_data.screen_colors.ghost_color
			})

			ghost_icon:set_center_y(length_text:center_y())
			ghost_icon:set_left(length_text:right())
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
		local job_stars = managers.job:current_job_stars()
		local job_and_difficulty_stars = managers.job:current_job_and_difficulty_stars()
		local difficulty_stars = managers.job:current_difficulty_stars()
		local risk_color = tweak_data.screen_colors.risk
		local cy = paygrade_text_header:center_y()
		local sx = paygrade_text_header:right() + 5
		local level_data = { 
				texture="guis/textures/pd2/mission_briefing/difficulty_icons", 
				texture_rect = filled_star_rect, 
				w = 16, 
				h = 16, 
				color = tweak_data.screen_colors.text, 
				alpha = 1 
		}
		for i = 1, job_stars do
			local x = sx + (i - 1) * 18
			local star_data = level_data

			local star = self._contract_panel:bitmap(star_data)
			star:set_x(x)
			star:set_center_y(math.round(cy))
		end
		local cy = risk_text_header:center_y()
		local sx = risk_text_header:right() + 5
		local difficulty = tweak_data.difficulties[difficulty_stars + 2] or 1
		local difficulty_string_id = tweak_data.difficulty_name_ids[difficulty]
		local difficulty_string = managers.localization:to_upper_text(difficulty_string_id)
		local difficulty_text = self._contract_panel:text({
			font = font,
			font_size = font_size,
			text = difficulty_string,
			color = tweak_data.screen_colors.text
		})

		if Global.game_settings.one_down then
			local one_down_string = managers.localization:to_upper_text("menu_one_down")
			local text_string = difficulty_string .. " " .. one_down_string

			difficulty_text:set_text(text_string)
			difficulty_text:set_range_color(utf8.len(difficulty_string) + 1, utf8.len(text_string), tweak_data.screen_colors.one_down)
		end

		local _, _, tw, th = difficulty_text:text_rect()

		difficulty_text:set_size(tw, th)
		difficulty_text:set_x(math.round(sx))
		difficulty_text:set_center_y(cy)
		difficulty_text:set_y(math.round(difficulty_text:y()))

		if difficulty_stars > 0 then
			difficulty_text:set_color(risk_color)
		end
		local plvl = managers.experience:current_level()
		local player_stars = math.max(math.ceil(plvl / 10), 1)
		local contract_visuals = job_data.contract_visuals or {}
		local xp_min = contract_visuals.min_mission_xp and (type(contract_visuals.min_mission_xp) == "table" and contract_visuals.min_mission_xp[difficulty_stars + 1] or contract_visuals.min_mission_xp) or 0
		local total_xp_min, _ = managers.experience:get_contract_xp_by_stars(job_id, job_stars, difficulty_stars, job_data.professional, #job_chain, {
			mission_xp = xp_min
		})
		local xp_text_min = managers.money:add_decimal_marks_to_string(tostring(math.round(total_xp_min)))
		local lvl = Global.game_settings.level_id
		local halloween = lvl == "nail" or lvl == "help" or lvl == "haunted" or lvl == "hvh"
		local job_xp_text = halloween and (#xp_text_min == 1 and "?" or #xp_text_min == 2 and "??" or #xp_text_min == 3 and "???" or #xp_text_min == 5 and (difficulty_stars > 2 and "109 x 24 = ?,???" or "?,???") or #xp_text_min == 6 and "??,???" or #xp_text_min == 7 and "???,???") or xp_text_min
		local job_xp = self._contract_panel:text({
			font = font,
			font_size = font_size,
			text = job_xp_text,
			color = tweak_data.screen_colors.text
		})
		local _, _, tw, th = job_xp:text_rect()

		job_xp:set_size(tw, th)
		job_xp:set_position(math.round(exp_text_header:right() + 5), math.round(exp_text_header:top()))

		local risk_xp = self._contract_panel:text({
			font = font,
			font_size = font_size,
			text = " +" .. tostring(math.round(0)),
			color = risk_color
		})
		local _, _, tw, th = risk_xp:text_rect()

		risk_xp:set_size(tw, th)
		risk_xp:set_position(math.round(job_xp:right()), job_xp:top())
		risk_xp:hide()

		local job_ghost_mul = managers.job:get_ghost_bonus() or 0
		local ghost_xp_text = nil

		if job_ghost_mul ~= 0 then
			local job_ghost = math.round(job_ghost_mul * 100)
			local job_ghost_string = tostring(math.abs(job_ghost))
			local ghost_color = tweak_data.screen_colors.ghost_color

			if job_ghost == 0 and job_ghost_mul ~= 0 then
				job_ghost_string = string.format("%0.2f", math.abs(job_ghost_mul * 100))
			end

			local text_prefix = job_ghost_mul < 0 and "-" or "+"
			local text_string = " (" .. text_prefix .. job_ghost_string .. "%)"
			ghost_xp_text = self._contract_panel:text({
				blend_mode = "add",
				font = font,
				font_size = font_size,
				text = text_string,
				color = ghost_color
			})
			local _, _, tw, th = ghost_xp_text:text_rect()

			ghost_xp_text:set_size(tw, th)
			ghost_xp_text:set_position(math.round(risk_xp:visible() and risk_xp:right() or job_xp:right()), job_xp:top())
		end

		local job_heat = managers.job:current_job_heat() or 0
		local job_heat_mul = managers.job:heat_to_experience_multiplier(job_heat) - 1
		local heat_xp_text = nil

		if job_heat_mul ~= 0 then
			job_heat = math.round(job_heat_mul * 100)
			local job_heat_string = tostring(math.abs(job_heat))
			local heat_color = managers.job:current_job_heat_color()

			if job_heat == 0 and job_heat_mul ~= 0 then
				job_heat_string = string.format("%0.2f", math.abs(job_heat_mul * 100))
			end

			local text_prefix = job_heat_mul < 0 and "-" or "+"
			local text_string = " (" .. text_prefix .. job_heat_string .. "%)"
			heat_xp_text = self._contract_panel:text({
				blend_mode = "add",
				font = font,
				font_size = font_size,
				text = text_string,
				color = heat_color
			})
			local _, _, tw, th = heat_xp_text:text_rect()

			heat_xp_text:set_size(tw, th)
			heat_xp_text:set_position(math.round(ghost_xp_text and ghost_xp_text:right() or risk_xp:visible() and risk_xp:right() or job_xp:right()), job_xp:top())
		end

		local total_payout_min, base_payout_min, risk_payout_min = managers.money:get_contract_money_by_stars(job_stars, difficulty_stars, #job_chain, managers.job:current_job_id(), managers.job:current_level_id())
		local total_payout_max, base_payout_max, risk_payout_max = managers.money:get_contract_money_by_stars(job_stars, difficulty_stars, #job_chain, managers.job:current_job_id(), managers.job:current_level_id(), {
			mandatory_bags_value = contract_visuals.mandatory_bags_value and contract_visuals.mandatory_bags_value[difficulty_stars + 1],
			bonus_bags_value = contract_visuals.bonus_bags_value and contract_visuals.bonus_bags_value[difficulty_stars + 1],
			small_value = contract_visuals.small_value and contract_visuals.small_value[difficulty_stars + 1],
			vehicle_value = contract_visuals.vehicle_value and contract_visuals.vehicle_value[difficulty_stars + 1]
		})
		local payout_text_min = managers.experience:cash_string(math.round(total_payout_min))
		local payout_text_max = managers.experience:cash_string(math.round(total_payout_max))
		local total_payout_text = total_payout_min < total_payout_max and managers.localization:text("menu_number_range", {
			min = payout_text_min,
			max = payout_text_max
		}) or payout_text_min
		local job_money = self._contract_panel:text({
			font = font,
			font_size = font_size,
			text = total_payout_text,
			color = tweak_data.screen_colors.text
		})
		local _, _, tw, th = job_money:text_rect()

		job_money:set_size(tw, th)
		job_money:set_position(math.round(payout_text_header:right() + 5), math.round(payout_text_header:top()))

		local risk_money = self._contract_panel:text({
			font = font,
			font_size = font_size,
			text = " +" .. managers.experience:cash_string(math.round(risk_payout_min)),
			color = risk_color
		})
		local _, _, tw, th = risk_money:text_rect()

		risk_money:set_size(tw, th)
		risk_money:set_position(math.round(job_money:right()), job_money:top())
		risk_money:hide()
		self._contract_panel:set_h(payout_text_header:bottom() + 10)

		if managers.mutators:are_mutators_enabled() and managers.mutators:allow_mutators_in_level(job_chain and job_chain[1] and job_chain[1].level_id) then
			local mutators_text_header = self._contract_panel:text({
				name = "mutators_text_header",
				text = managers.localization:to_upper_text("cn_menu_contract_mutators_header"),
				font_size = font_size,
				font = font,
				color = tweak_data.screen_colors.text
			})
			local _, _, tw, th = mutators_text_header:text_rect()
			w = math.max(w, tw)

			mutators_text_header:set_size(tw, th)
			mutators_text_header:set_right(w)
			mutators_text_header:set_top(payout_text_header:bottom())

			local mutators_text = self._contract_panel:text({
				name = "mutators_text",
				font = font,
				font_size = font_size,
				text = managers.localization:to_upper_text("cn_menu_contract_mutators_active"),
				color = tweak_data.screen_colors.mutators_color_text
			})
			local _, _, tw, th = mutators_text:text_rect()

			mutators_text:set_size(tw, th)
			mutators_text:set_position(math.round(mutators_text_header:right() + 5), math.round(mutators_text_header:top()))
			self._contract_panel:set_h(mutators_text:bottom() + 10)
		end
	elseif managers.menu:debug_menu_enabled() then
		local debug_start = self._contract_panel:text({
			text = "Use DEBUG START to start your level",
			y = 10,
			wrap = true,
			x = 10,
			word_wrap = true,
			font_size = font_size,
			font = font,
			color = tweak_data.screen_colors.text
		})

		debug_start:grow(-debug_start:x() - 10, debug_start:y() - 10)
	end

	self._contract_panel:set_rightbottom(self._panel:w() - 0, self._panel:h() - 60)

	if self._contract_text_header then
		self._contract_text_header:set_bottom(self._contract_panel:top())
		self._contract_text_header:set_left(self._contract_panel:left())

		local wfs_text = self._panel:child("wfs")

		if wfs_text and not managers.menu:is_pc_controller() then
			wfs_text:set_rightbottom(self._panel:w() - 20, self._contract_text_header:top())
		end
	end

	local wfs = self._panel:child("wfs")

	if wfs then
		self._contract_panel:grow(0, wfs:h() + 5)
		self._contract_panel:move(0, -(wfs:h() + 5))

		if self._contract_text_header then
			self._contract_text_header:move(0, -(wfs:h() + 5))
		end

		wfs:set_world_rightbottom(self._contract_panel:world_right() - 5, self._contract_panel:world_bottom())
	end
	if self._contract_text_header and managers.job:is_current_job_professional() then
		local pro_text = self._panel:text({
			name = "pro_text",
			text = managers.localization:to_upper_text("cn_menu_pro_job"),
			font_size = tweak_data.menu.pd2_medium_font_size,
			font = tweak_data.menu.pd2_medium_font,
			color = tweak_data.screen_colors.pro_color,
			blend_mode = "add"
		})
		local x, y, w, h = pro_text:text_rect()
		pro_text:set_size(w, h)
		pro_text:set_position(self._contract_text_header:right() + 10, self._contract_text_header:y())
	end

	if job_tweak and job_tweak.is_safehouse and not job_tweak.is_safehouse_combat then
		self._contract_text_header:set_bottom(self._contract_panel:bottom())
		self._contract_panel:set_h(0)
	end

	BoxGuiObject:new(self._contract_panel, {
		sides = {
			1,
			1,
			1,
			1
		}
	})

	for i = 1, tweak_data.max_players, 1 do
		local peer = managers.network:session():peer(i)

		if peer then
			local peer_pos = managers.menu_scene:character_screen_position(i)
			local peer_name = peer:name()

			if peer_pos then
				self:create_character_text(i, peer_pos.x, peer_pos.y, peer_name)
			end
		end
	end

	self._enabled = true
end