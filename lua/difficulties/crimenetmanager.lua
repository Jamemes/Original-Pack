function CrimeNetManager:get_jobs_by_player_stars(span)
	local t = {}
	local pstars = managers.experience:level_to_stars() * 10
	span = span or 20

	for _, job_id in ipairs(tweak_data.narrative:get_jobs_index()) do
		local pass_all_tests = true
		pass_all_tests = pass_all_tests and not tweak_data.narrative:is_job_locked(job_id)

		if pass_all_tests then
			local job_data = tweak_data.narrative:job_data(job_id)
			local start_difficulty = job_data.professional and 1 or 0
			local num_difficulties = Global.SKIP_OVERKILL_290 and 5 or job_data.professional and 6 or 6

			for i = start_difficulty, num_difficulties, 1 do
				local job_jc = math.clamp(job_data.jc + i * 10, 0, 100)
				local difficulty_id = 2 + i
				local difficulty = tweak_data:index_to_difficulty(difficulty_id)

				local list = {
					{2, "normal"},
					{3, "hard"},
					{4, "overkill"},
					{5, "overkill_145"},
					{7, "overkill_290"},
					{6, "easy_wish"},
					{8, "sm_wish"}
				}
				
				local diff_id = difficulty_id
				local diff = difficulty
				local prank = managers.experience:current_rank()
				local csrank = managers.crime_spree:highest_level()
				
				local first = job_data.professional and 2 or 1
				local easy_chance = math.random() > tweak_data.easy_wish_drop_chance and math.random(first, 4) or 6
				local sm_chance = math.random() > tweak_data.sm_wish_drop_chance and math.random(first, 5) or 7
				local easy_wish = list[tweak_data.unlock_mayhem > prank and math.random(first, 4) or easy_chance]
				local sm_wish = list[tweak_data.unlock_death_sentence > csrank and math.random(first, 5) or sm_chance]
				
				if difficulty_id == 8 then
					diff_id = sm_wish[1]
					diff = sm_wish[2]
				elseif difficulty_id == 6 then
					diff_id = easy_wish[1]
					diff = easy_wish[2]
				end
				
				if job_jc <= pstars + span and job_jc >= pstars - span then
					table.insert(t, {
						job_jc = job_jc,
						job_id = job_id,
						difficulty_id = diff_id,
						difficulty = diff,
						marker_dot_color = job_data.marker_dot_color or nil,
						color_lerp = job_data.color_lerp or nil
					})
				end
			end
		else
			print("SKIP DUE TO COOLDOWN OR THE JOB IS WRAPPED INSIDE AN OTHER JOB", job_id)
		end
	end

	return t
end

function CrimeNetManager:_get_jobs_by_jc()
	local t = {}
	local plvl = managers.experience:current_level()
	local prank = managers.experience:current_rank()

	for _, job_id in ipairs(tweak_data.narrative:get_jobs_index()) do
		local is_cooldown_ok = managers.job:check_ok_with_cooldown(job_id)
		local is_not_wrapped = not tweak_data.narrative.jobs[job_id].wrapped_to_job
		local dlc = tweak_data.narrative:job_data(job_id).dlc
		local is_not_dlc_or_got = not dlc or managers.dlc:is_dlc_unlocked(dlc)
		local pass_all_tests = is_cooldown_ok and is_not_wrapped and is_not_dlc_or_got
		pass_all_tests = pass_all_tests and not tweak_data.narrative:is_job_locked(job_id)

		if pass_all_tests then
			local job_data = tweak_data.narrative:job_data(job_id)
			local start_difficulty = job_data.professional and 1 or 0
			local num_difficulties = Global.SKIP_OVERKILL_290 and 5 or job_data.professional and 6 or 6

			for i = start_difficulty, num_difficulties, 1 do
				local job_jc = math.clamp(job_data.jc + i * 10, 0, 100)
				local difficulty_id = 2 + i
				local difficulty = tweak_data:index_to_difficulty(difficulty_id)
				local level_lock = tweak_data.difficulty_level_locks[difficulty_id] or 0
				local is_not_level_locked = prank >= 1 or level_lock <= plvl
				
				local list = {
					{2, "normal"},
					{3, "hard"},
					{4, "overkill"},
					{5, "overkill_145"},
					{7, "overkill_290"},
					{6, "easy_wish"},
					{8, "sm_wish"}
				}
				
				local diff_id = difficulty_id
				local diff = difficulty
				local prank = managers.experience:current_rank()
				local csrank = managers.crime_spree:highest_level()
				
				local first = job_data.professional and 2 or 1
				local easy_chance = math.random() > tweak_data.easy_wish_drop_chance and math.random(first, 4) or 6
				local sm_chance = math.random() > tweak_data.sm_wish_drop_chance and math.random(first, 5) or 7
				local easy_wish = list[tweak_data.unlock_mayhem > prank and math.random(first, 4) or easy_chance]
				local sm_wish = list[tweak_data.unlock_death_sentence > csrank and math.random(first, 5) or sm_chance]
				
				if difficulty_id == 8 then
					diff_id = sm_wish[1]
					diff = sm_wish[2]
				elseif difficulty_id == 6 then
					diff_id = easy_wish[1]
					diff = easy_wish[2]
				end
				
				if is_not_level_locked then
					t[job_jc] = t[job_jc] or {}

					table.insert(t[job_jc], {
						job_id = job_id,
						difficulty_id = diff_id,
						difficulty = diff,
						marker_dot_color = job_data.marker_dot_color or nil,
						color_lerp = job_data.color_lerp or nil
					})
				end
			end
		else
			print("SKIP DUE TO COOLDOWN OR THE JOB IS WRAPPED INSIDE AN OTHER JOB", job_id)
		end
	end

	return t
end

function CrimeNetManager:_setup()
	if self._presets then
		return
	end

	self._presets = {}
	local plvl = managers.experience:current_level()
	local player_stars = math.clamp(math.ceil((plvl + 1) / 10), 1, 10)
	local stars = player_stars
	local jc = math.lerp(0, 100, stars / 10)
	local jcs = tweak_data.narrative.STARS[stars].jcs
	local no_jcs = #jcs
	local chance_curve = tweak_data.narrative.STARS_CURVES[player_stars]
	local start_chance = tweak_data.narrative.JC_CHANCE
	local jobs_by_jc = self:_get_jobs_by_jc()
	local no_picks = self:_number_of_jobs(jcs, jobs_by_jc)
	local j = 0
	local tests = 0

	while j < no_picks do
		for i = 1, no_jcs, 1 do
			local chance = nil

			if no_jcs - 1 == 0 then
				chance = 1
			else
				chance = math.lerp(start_chance, 1, math.pow((i - 1) / (no_jcs - 1), chance_curve))
			end

			if not jobs_by_jc[jcs[i]] then
			elseif #jobs_by_jc[jcs[i]] ~= 0 then
				local job_data = nil

				if self._debug_mass_spawning then
					job_data = jobs_by_jc[jcs[i]][math.random(#jobs_by_jc[jcs[i]])]
				else
					job_data = table.remove(jobs_by_jc[jcs[i]], math.random(#jobs_by_jc[jcs[i]]))
				end

				local job_tweak = tweak_data.narrative:job_data(job_data.job_id)
				local chance_multiplier = job_tweak and job_tweak.spawn_chance_multiplier or 1
				job_data.chance = chance * chance_multiplier

				table.insert(self._presets, job_data)

				j = j + 1

				break
			end
		end

		tests = tests + 1

		if self._debug_mass_spawning then
			if tweak_data.gui.crime_net.debug_options.mass_spawn_limit <= tests then
				break
			end
		elseif no_picks <= tests then
			break
		end
	end

	local old_presets = self._presets
	self._presets = {}

	while #old_presets > 0 do
		table.insert(self._presets, table.remove(old_presets, math.random(#old_presets)))
	end
end

-- function CrimeNetManager:update_difficulty_filter()
	-- if self._presets then
		-- self._presets = nil
		-- self:_setup()
	-- end
-- end

function CrimeNetGui:_create_job_gui(data, type, fixed_x, fixed_y, fixed_location)
	local level_id = data.level_id
	local level_data = tweak_data.levels[level_id]
	local narrative_data = data.job_id and tweak_data.narrative:job_data(data.job_id)
	local is_special = type == "special" or type == "crime_spree"
	local is_server = type == "server"
	local is_crime_spree = type == "crime_spree"
	local is_professional = narrative_data and narrative_data.professional
	local got_job = data.job_id and true or false
	local x = fixed_x
	local y = fixed_y
	local location = fixed_location

	if is_special then
		x = data.x
		y = data.y

		if x and y then
			local tw = math.max(self._map_panel:child("map"):texture_width(), 1)
			local th = math.max(self._map_panel:child("map"):texture_height(), 1)
			x = math.round(x / tw * self._map_size_w)
			y = math.round(y / th * self._map_size_h)
		end
	end

	if not x and not y then
		x, y, location = self:_get_job_location(data)
	end

	if location and location[3] then
		Application:error("[CrimeNetGui:_create_job_gui] Location already taken!", x, y)
	end

	local color = Color.white
	local friend_color = tweak_data.screen_colors.friend_color
	local regular_color = tweak_data.screen_colors.regular_color
	local pro_color = tweak_data.screen_colors.pro_color
	local side_panel = self._pan_panel:panel({
		alpha = 0,
		layer = 26
	})
	local heat_glow = nil
	local stars_panel = side_panel:panel({
		w = 100,
		name = "stars_panel",
		visible = true,
		layer = -1
	})
	local num_stars = 0
	local star_size = 8
	local job_num = 0
	local job_cash = 0
	local one_down_active = data.one_down == 1
	local difficulty_name = side_panel:text({
		text = "",
		name = "difficulty_name",
		vertical = "center",
		blend_mode = "add",
		layer = 0,
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		color = color
	})
	local one_down_label = one_down_active and side_panel:text({
		name = "one_down_label",
		vertical = "center",
		blend_mode = "add",
		layer = 0,
		text = managers.localization:to_upper_text("menu_one_down"),
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		color = tweak_data.screen_colors.one_down
	})
	local heat_name = side_panel:text({
		text = "",
		name = "heat_name",
		vertical = "center",
		blend_mode = "add",
		layer = 0,
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		color = color
	})
	local got_heat = false
	local range_colors = {}
	local text_string = managers.localization:to_upper_text("menu_exp_short")

	local function mul_to_procent_string(multiplier)
		local pro = math.round(multiplier * 100)
		local procent_string = nil

		if pro == 0 and multiplier ~= 0 then
			procent_string = string.format("%0.2f", math.abs(multiplier * 100))
		else
			procent_string = tostring(math.abs(pro))
		end

		return (multiplier < 0 and " -" or " +") .. procent_string .. "%"
	end

	local got_heat_text = false
	local has_ghost_bonus = managers.job:has_ghost_bonus()

	if has_ghost_bonus then
		local ghost_bonus_mul = managers.job:get_ghost_bonus()
		local job_ghost_string = mul_to_procent_string(ghost_bonus_mul)
		local s = utf8.len(text_string)
		text_string = text_string .. job_ghost_string

		table.insert(range_colors, {
			s,
			utf8.len(text_string),
			tweak_data.screen_colors.ghost_color
		})

		got_heat_text = true
	end

	if false then
		local skill_bonus = managers.player:get_skill_exp_multiplier()
		skill_bonus = skill_bonus - 1

		if skill_bonus > 0 then
			local s = utf8.len(text_string)
			local skill_string = mul_to_procent_string(skill_bonus)
			text_string = text_string .. skill_string

			table.insert(range_colors, {
				s,
				utf8.len(text_string),
				tweak_data.screen_colors.skill_color
			})

			got_heat_text = true
		end

		local infamy_bonus = managers.player:get_infamy_exp_multiplier()
		infamy_bonus = infamy_bonus - 1

		if infamy_bonus > 0 then
			local s = utf8.len(text_string)
			local infamy_string = mul_to_procent_string(infamy_bonus)
			text_string = text_string .. infamy_string

			table.insert(range_colors, {
				s,
				utf8.len(text_string),
				tweak_data.lootdrop.global_values.infamy.color
			})

			got_heat_text = true
		end

		local limited_bonus = managers.player:get_limited_exp_multiplier(data.job_id, data.level_id)
		limited_bonus = limited_bonus - 1

		if limited_bonus > 0 then
			local s = utf8.len(text_string)
			local limited_string = mul_to_procent_string(limited_bonus)
			text_string = text_string .. limited_string

			table.insert(range_colors, {
				s,
				utf8.len(text_string),
				tweak_data.screen_colors.button_stage_2
			})

			got_heat_text = true
		end
	end

	local job_heat = managers.job:get_job_heat(data.job_id) or 0
	local job_heat_mul = managers.job:heat_to_experience_multiplier(job_heat) - 1

	if data.job_id then
		local x = 0
		local y = 0
		local job_stars = math.ceil(tweak_data.narrative.jobs[data.job_id].jc / 10)
		local diff = data.difficulty_id
		local difficulty_stars = diff - (diff == 6 and 1 or diff == 7 and 3 or 2)
		local job_and_difficulty_stars = job_stars + difficulty_stars
		local risk_color = tweak_data.screen_colors.risk
		local hate_risk = diff == 8 and 3 or diff == 7 and 1 or diff == 6 and 2 or 0
		local edge = 10
		for i = 1, 15 do
			stars_panel:bitmap({
				texture = "guis/textures/pd2/crimenet_paygrade_marker",
				x = x,
				y = y,
				blend_mode = "normal",
				layer = 0,
				rotation = 360,
				color = ((i > (job_and_difficulty_stars > edge and job_and_difficulty_stars or edge)) and Color.green:with_alpha(0)) or ((i > job_and_difficulty_stars) and Color.black) or ((i > job_and_difficulty_stars - hate_risk) and Color.red) or ((i > job_stars) and risk_color) or color
			})
			
			x = x + star_size
			
			num_stars = num_stars + 1
		end

		job_num = #tweak_data.narrative:job_chain(data.job_id)
		local total_payout, base_payout, risk_payout = managers.money:get_contract_money_by_stars(job_stars, difficulty_stars, job_num, data.job_id)
		job_cash = managers.experience:cash_string(math.round(total_payout))
		local difficulty_string = managers.localization:to_upper_text(tweak_data.difficulty_name_ids[tweak_data.difficulties[data.difficulty_id]])

		difficulty_name:set_text(difficulty_string)

		local hate_difficulties = data.difficulty_id >= 6
		difficulty_name:set_color(hate_difficulties and Color(255, 255, 104, 0) / 255 or difficulty_stars > 0 and tweak_data.screen_colors.risk or tweak_data.screen_colors.text)

		local heat_alpha = math.abs(job_heat) / 100
		local heat_size = 1
		local heat_color = managers.job:get_job_heat_color(data.job_id)
		heat_glow = self._pan_panel:bitmap({
			texture = "guis/textures/pd2/hot_cold_glow",
			blend_mode = "add",
			alpha = 0,
			layer = 11,
			w = 256 * heat_size,
			h = 256 * heat_size,
			color = heat_color
		})

		if job_heat_mul ~= 0 then
			local s = utf8.len(text_string)
			local heat_string = mul_to_procent_string(job_heat_mul)
			text_string = text_string .. heat_string

			table.insert(range_colors, {
				s,
				utf8.len(text_string),
				heat_color
			})

			got_heat = true
			got_heat_text = true

			heat_glow:set_alpha(heat_alpha)
		end
	end

	heat_name:set_text(text_string)

	for i, range in ipairs(range_colors) do
		if i == 1 then
			local s, e, c = unpack(range)

			heat_name:set_range_color(0, e, c)
		else
			heat_name:set_range_color(unpack(range))
		end
	end

	local job_tweak = tweak_data.narrative:job_data(data.job_id)
	local host_string = data.host_name or is_professional and managers.localization:to_upper_text("cn_menu_pro_job") or " "
	local job_string = data.job_id and managers.localization:to_upper_text(job_tweak.name_id) or data.level_name or "NO JOB"
	local contact_string = utf8.to_upper(data.job_id and managers.localization:text(tweak_data.narrative.contacts[job_tweak.contact].name_id)) or "BAIN"
	contact_string = contact_string .. ": "
	local info_string = managers.localization:to_upper_text("cn_menu_contract_short_" .. (job_num > 1 and "plural" or "singular"), {
		days = job_num,
		money = job_cash
	})
	info_string = info_string .. (data.state_name and " / " .. data.state_name or "")

	if is_special then
		job_string = data.name_id and managers.localization:to_upper_text(data.name_id) or ""
		info_string = data.desc_id and managers.localization:to_upper_text(data.desc_id) or ""

		if is_crime_spree then
			if managers.crime_spree:in_progress() then
				info_string = "cn_crime_spree_help_continue"
			else
				info_string = "cn_crime_spree_help_start"
			end

			info_string = managers.localization:to_upper_text(info_string) or ""
		end
	end

	local job_plan_icon = nil

	if is_server and data.job_plan and data.job_plan ~= -1 then
		local texture = data.job_plan == 1 and "guis/textures/pd2/cn_playstyle_loud" or "guis/textures/pd2/cn_playstyle_stealth"
		job_plan_icon = side_panel:bitmap({
			name = "job_plan_icon",
			h = 16,
			w = 16,
			alpha = 1,
			blend_mode = "normal",
			y = 2,
			x = 0,
			layer = 0,
			texture = texture,
			color = Color.white
		})
	end

	local host_name = side_panel:text({
		name = "host_name",
		vertical = "center",
		blend_mode = "add",
		text = host_string,
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		color = data.is_friend and friend_color or is_server and regular_color or pro_color
	})
	local job_name = side_panel:text({
		name = "job_name",
		vertical = "center",
		blend_mode = "normal",
		layer = 0,
		text = job_string,
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		color = color
	})
	local contact_name = side_panel:text({
		name = "contact_name",
		vertical = "center",
		blend_mode = "normal",
		layer = 0,
		text = contact_string,
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		color = color
	})
	local info_name = side_panel:text({
		name = "info_name",
		vertical = "center",
		blend_mode = "normal",
		layer = 0,
		text = info_string,
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		color = color
	})

	if data.mutators then
		job_name:set_color(tweak_data.screen_colors.mutators_color_text)
		contact_name:set_color(tweak_data.screen_colors.mutators_color_text)
		info_name:set_color(tweak_data.screen_colors.mutators_color_text)
	end

	if is_crime_spree or data.is_crime_spree then
		job_name:set_color(tweak_data.screen_colors.crime_spree_risk)
		contact_name:set_color(tweak_data.screen_colors.crime_spree_risk)
		info_name:set_color(tweak_data.screen_colors.crime_spree_risk)

		if is_crime_spree then
			stars_panel:text({
				name = "spree_level",
				vertical = "center",
				blend_mode = "normal",
				layer = 0,
				text = managers.localization:to_upper_text("menu_cs_level", {
					level = managers.experience:cash_string(managers.crime_spree:spree_level(), "")
				}),
				font = tweak_data.menu.pd2_small_font,
				font_size = tweak_data.menu.pd2_small_font_size,
				color = tweak_data.screen_colors.crime_spree_risk
			})
		end
	end

	if data.is_skirmish then
		contact_name:set_color(tweak_data.screen_colors.skirmish_color)
		job_name:set_color(tweak_data.screen_colors.skirmish_color)
	end

	stars_panel:set_w(star_size * math.min(11, #stars_panel:children()))
	stars_panel:set_h(star_size)

	local focus = self._pan_panel:bitmap({
		texture = "guis/textures/crimenet_map_circle",
		name = "focus",
		blend_mode = "add",
		layer = 10,
		color = color:with_alpha(0.6)
	})
	
	local name_x = job_plan_icon and job_plan_icon:right() + 2 or 0
	local _, _, w, h = host_name:text_rect()

	host_name:set_size(w, h)
	host_name:set_position(name_x, 0)

	if not is_server then
	end

	local _, _, w, h = job_name:text_rect()

	job_name:set_size(w, h)
	job_name:set_position(0, host_name:bottom() - 2)

	local _, _, w, h = contact_name:text_rect()

	contact_name:set_size(w, h)
	contact_name:set_top(job_name:top())
	contact_name:set_right(0)

	local _, _, w, h = info_name:text_rect()

	info_name:set_size(w, h - 3)
	info_name:set_top(contact_name:bottom() - 3)
	info_name:set_right(0)

	local _, _, w, h = difficulty_name:text_rect()

	difficulty_name:set_size(w, h)
	difficulty_name:set_top(info_name:bottom() - 3)
	difficulty_name:set_right(0)

	if one_down_active then
		local _, _, w, h = one_down_label:text_rect()

		one_down_label:set_size(w, h - 4)
		one_down_label:set_top(difficulty_name:bottom() - 3)
		one_down_label:set_right(0)
	end

	local _, _, w, h = heat_name:text_rect()

	heat_name:set_size(w, h - 4)
	heat_name:set_top(one_down_active and one_down_label:bottom() - 3 or difficulty_name:bottom() - 3)
	heat_name:set_right(0)

	if not got_heat_text then
		heat_name:set_text(" ")
		heat_name:set_w(1)
		heat_name:set_position(0, host_name:bottom() - 3)
	end

	if is_special then
		contact_name:set_text(" ")
		contact_name:set_size(0, 0)
		contact_name:set_position(0, host_name:bottom())
		difficulty_name:set_text(" ")
		difficulty_name:set_w(0, 0)
		difficulty_name:set_position(0, host_name:bottom())
		heat_name:set_text(" ")
		heat_name:set_w(0, 0)
		heat_name:set_position(0, host_name:bottom())
	elseif data.is_crime_spree then
		local text = ""

		if tweak_data:server_state_to_index("in_lobby") < data.state then
			local mission_data = managers.crime_spree:get_mission(data.crime_spree_mission)

			if mission_data then
				local tweak = tweak_data.levels[mission_data.level.level_id]
				text = managers.localization:text(tweak and tweak.name_id or "No level")
			else
				text = "No mission ID"
			end
		else
			text = managers.localization:text("menu_lobby_server_state_in_lobby")
		end

		job_name:set_text(utf8.to_upper(text))

		local _, _, w, h = job_name:text_rect()

		job_name:set_size(w, h)
		job_name:set_position(0, host_name:bottom())
		contact_name:set_text(" ")
		contact_name:set_w(0, 0)
		contact_name:set_position(0, host_name:bottom())
		info_name:set_text(" ")
		info_name:set_size(0, 0)
		info_name:set_position(0, host_name:bottom())
		difficulty_name:set_text(" ")
		difficulty_name:set_w(0, 0)
		difficulty_name:set_position(0, host_name:bottom())
		heat_name:set_text(" ")
		heat_name:set_w(0, 0)
		heat_name:set_position(0, host_name:bottom())
	elseif data.is_skirmish then
		local is_weekly = data.skirmish == SkirmishManager.LOBBY_WEEKLY
		local text = managers.localization:text(is_weekly and "menu_weekly_skirmish" or "menu_skirmish") .. ": "

		contact_name:set_text(utf8.to_upper(text))

		local _, _, w, h = contact_name:text_rect()

		contact_name:set_size(w, h)
		contact_name:set_top(job_name:top())
		contact_name:set_right(0)
		info_name:set_text(" ")
		info_name:set_size(0, 0)
		info_name:set_position(0, host_name:bottom())
		difficulty_name:set_text(" ")
		difficulty_name:set_w(0, 0)
		difficulty_name:set_position(0, host_name:bottom())
		heat_name:set_text(" ")
		heat_name:set_w(0, 0)
		heat_name:set_position(0, host_name:bottom())
	elseif not got_job then
		job_name:set_text(data.state_name or managers.localization:to_upper_text("menu_lobby_server_state_in_lobby"))

		local _, _, w, h = job_name:text_rect()

		job_name:set_size(w, h)
		job_name:set_position(0, host_name:bottom())
		contact_name:set_text(" ")
		contact_name:set_w(0, 0)
		contact_name:set_position(0, host_name:bottom())
		info_name:set_text(" ")
		info_name:set_size(0, 0)
		info_name:set_position(0, host_name:bottom())
		difficulty_name:set_text(" ")
		difficulty_name:set_w(0, 0)
		difficulty_name:set_position(0, host_name:bottom())
		heat_name:set_text(" ")
		heat_name:set_w(0, 0)
		heat_name:set_position(0, host_name:bottom())
	end

	stars_panel:set_position(0, job_name:bottom())
	side_panel:set_h(math.round(host_name:h() + job_name:h() + stars_panel:h()))
	side_panel:set_w(300)

	self._num_layer_jobs = (self._num_layer_jobs + 1) % 1
	local marker_panel = self._pan_panel:panel({
		w = 36,
		alpha = 0,
		h = 66,
		layer = 11 + self._num_layer_jobs * 3
	})
	local select_panel = marker_panel:panel({
		name = "select_panel",
		h = 38,
		y = 0,
		w = 36,
		x = -2
	})
	local glow_panel = self._pan_panel:panel({
		w = 960,
		alpha = 0,
		h = 192,
		layer = 10
	})
	local glow_center = glow_panel:bitmap({
		texture = "guis/textures/pd2/crimenet_marker_glow",
		name = "glow_center",
		h = 192,
		blend_mode = "add",
		w = 192,
		alpha = 0.55,
		color = data.pulse_color or is_professional and pro_color or regular_color
	})
	local glow_stretch = glow_panel:bitmap({
		texture = "guis/textures/pd2/crimenet_marker_glow",
		name = "glow_stretch",
		h = 75,
		blend_mode = "add",
		w = 960,
		alpha = 0.55,
		color = data.pulse_color or is_professional and pro_color or regular_color
	})
	local glow_center_dark = glow_panel:bitmap({
		texture = "guis/textures/pd2/crimenet_marker_glow",
		name = "glow_center_dark",
		h = 175,
		blend_mode = "normal",
		w = 175,
		alpha = 0.7,
		layer = -1,
		color = Color.black
	})
	local glow_stretch_dark = glow_panel:bitmap({
		texture = "guis/textures/pd2/crimenet_marker_glow",
		name = "glow_stretch_dark",
		h = 75,
		blend_mode = "normal",
		w = 990,
		alpha = 0.75,
		layer = -1,
		color = Color.black
	})

	glow_center:set_center(glow_panel:w() / 2, glow_panel:h() / 2)
	glow_stretch:set_center(glow_panel:w() / 2, glow_panel:h() / 2)
	glow_center_dark:set_center(glow_panel:w() / 2, glow_panel:h() / 2)
	glow_stretch_dark:set_center(glow_panel:w() / 2, glow_panel:h() / 2)

	local is_hidden_job = not is_special and tweak_data.narrative.contacts[job_tweak.contact].hidden
	local show_marker = is_hidden_job or is_professional

	local marker_dot_texture = (is_special and data.icon or "guis/textures/pd2/crimenet_marker_" .. (is_server and "join" or "host")) .. (show_marker and "_pro" or "")
	local marker_dot = marker_panel:bitmap({
		name = "marker_dot",
		h = 64,
		y = 2,
		w = 32,
		x = 2,
		layer = 1,
		texture = marker_dot_texture,
		color = data.marker_dot_color or color
	})
	
	local function marker(color, alpha)
		marker_panel:bitmap({
			texture = "guis/textures/pd2/crimenet_marker_pro_outline",
			name = "marker_pro_outline",
			h = 64,
			rotation = 0,
			w = 64,
			alpha = alpha or 1,
			color = color,
			blend_mode = "add",
			y = 0,
			x = 0,
			layer = 0
		})
	end
	
	if is_professional then
		marker(tweak_data.screen_colors.pro_color)
	end
	
	if is_hidden_job then
		marker(tweak_data.screen_colors.ghost_color, 0.6)
	end
	
	if data.mutators then
		marker_dot:set_color(tweak_data.screen_colors.mutators_color)
	end

	if data.is_crime_spree then
		marker_dot:set_color(tweak_data.screen_colors.crime_spree_risk)
	end

	if data.is_skirmish then
		marker_dot:set_color(tweak_data.screen_colors.skirmish_color)
	end

	local timer_rect, peers_panel = nil
	local icon_panel = self._pan_panel:panel({
		alpha = 1,
		w = 18,
		h = 64,
		layer = 26
	})
	local next_icon_right = 16
	local side_icons_top = 0

	for child in ipairs(icon_panel:children()) do
		side_icons_top = math.max(side_icons_top, child:bottom())
	end

	local ghost_icon = nil

	if data.job_id and managers.job:is_job_ghostable(data.job_id) then
		ghost_icon = icon_panel:bitmap({
			texture = "guis/textures/pd2/cn_minighost",
			name = "ghost_icon",
			blend_mode = "add",
			color = tweak_data.screen_colors.ghost_color
		})

		ghost_icon:set_top(side_icons_top)
		ghost_icon:set_right(next_icon_right)

		next_icon_right = next_icon_right - 12
	end

	if one_down_active then
		local one_down_icon = icon_panel:bitmap({
			blend_mode = "add",
			name = "one_down_icon",
			texture = "guis/textures/pd2/cn_mini_onedown",
			rotation = 360,
			color = tweak_data.screen_colors.one_down
		})

		one_down_icon:set_top(side_icons_top)
		one_down_icon:set_right(next_icon_right)

		next_icon_right = next_icon_right - 12
	end

	if is_server then
		peers_panel = self._pan_panel:panel({
			alpha = 0,
			h = 62,
			visible = true,
			w = 32,
			layer = 11 + self._num_layer_jobs * 3
		})
		local cx = 0
		local cy = 0

		for i = 1, 4, 1 do
			cx = 3 + 6 * (i - 1)
			cy = 8
			local player_marker = peers_panel:bitmap({
				texture = "guis/textures/pd2/crimenet_marker_peerflag",
				h = 16,
				w = 8,
				blend_mode = "normal",
				layer = 2,
				name = tostring(i),
				color = color,
				visible = i <= data.num_plrs
			})

			player_marker:set_position(cx, cy)

			if data.mutators then
				player_marker:set_color(tweak_data.screen_colors.mutators_color)
			end

			if data.is_crime_spree then
				player_marker:set_color(tweak_data.screen_colors.crime_spree_risk)
			end

			if data.is_skirmish then
				player_marker:set_color(tweak_data.screen_colors.skirmish_color)
			end
		end

		local kick_none_icon = icon_panel:bitmap({
			texture = "guis/textures/pd2/cn_kick_marker",
			name = "kick_none_icon",
			blend_mode = "add",
			alpha = 0
		})
		local kick_vote_icon = icon_panel:bitmap({
			texture = "guis/textures/pd2/cn_votekick_marker",
			name = "kick_vote_icon",
			blend_mode = "add",
			alpha = 0
		})
		local y = 0

		for i = 1, #icon_panel:children() - 1, 1 do
			y = math.max(y, icon_panel:children()[i]:bottom())
		end

		kick_none_icon:set_y(y)
		kick_vote_icon:set_y(y)
	elseif not is_special then
		timer_rect = marker_panel:bitmap({
			texture = "guis/textures/pd2/crimenet_timer",
			name = "timer_rect",
			h = 32,
			x = 1,
			w = 32,
			y = 2,
			render_template = "VertexColorTexturedRadial",
			layer = 2,
			color = Color.white
		})

		timer_rect:set_texture_rect(32, 0, -32, 32)
	end

	marker_panel:set_center(x * self._zoom, y * self._zoom)
	focus:set_center(marker_panel:center())
	glow_panel:set_world_center(marker_panel:child("select_panel"):world_center())

	if heat_glow then
		heat_glow:set_world_center(marker_panel:child("select_panel"):world_center())
	end

	local num_containers = managers.job:get_num_containers()
	local middle_container = math.ceil(num_containers / 2)
	local job_container_index = managers.job:get_job_container_index(data.job_id) or middle_container
	local diff_containers = job_container_index - middle_container

	if diff_containers == 0 then
		if job_heat_mul < 0 then
			diff_containers = -1
		elseif job_heat_mul > 0 then
			diff_containers = 1
		end
	end

	local container_panel = nil

	if diff_containers ~= 0 and job_heat_mul ~= 0 then
		container_panel = self._pan_panel:panel({
			alpha = 0,
			layer = 11 + self._num_layer_jobs * 3
		})

		container_panel:set_w(math.abs(num_containers - middle_container) * 10 + 6)
		container_panel:set_h(8)
		container_panel:set_center_x(marker_panel:center_x())
		container_panel:set_bottom(marker_panel:top())
		container_panel:set_x(math.round(container_panel:x()))

		local texture = "guis/textures/pd2/blackmarket/stat_plusminus"
		local texture_rect = diff_containers > 0 and {
			0,
			0,
			8,
			8
		} or {
			8,
			0,
			8,
			8
		}

		for i = 1, math.abs(diff_containers), 1 do
			container_panel:bitmap({
				texture = texture,
				texture_rect = texture_rect,
				x = (i - 1) * 10 + 3
			})
		end
	end

	local text_on_right = x < self._map_size_w - 200

	if text_on_right then
		side_panel:set_left(marker_panel:right())
	else
		job_name:set_text(contact_name:text() .. job_name:text())
		contact_name:set_text("")
		contact_name:set_w(0)

		local _, _, w, h = job_name:text_rect()

		job_name:set_size(w, h)
		host_name:set_right(side_panel:w())
		job_name:set_right(side_panel:w())
		contact_name:set_left(side_panel:w())
		info_name:set_left(side_panel:w())
		difficulty_name:set_left(side_panel:w())
		heat_name:set_left(side_panel:w())
		stars_panel:set_right(side_panel:w())
		side_panel:set_right(marker_panel:left())
	end

	side_panel:set_top(marker_panel:top() - job_name:top() + 1)

	if icon_panel then
		if text_on_right then
			icon_panel:set_right(marker_panel:left() + 2)
		else
			icon_panel:set_left(marker_panel:right() - 2)
		end

		icon_panel:set_top(math.round(marker_panel:top() + 1))
	end

	if peers_panel then
		peers_panel:set_center_x(marker_panel:center_x())
		peers_panel:set_center_y(marker_panel:center_y())
	end

	local callout = nil

	if narrative_data and narrative_data.crimenet_callouts and #narrative_data.crimenet_callouts > 0 then
		local variant = math.random(#narrative_data.crimenet_callouts)
		callout = narrative_data.crimenet_callouts[variant]
	end

	if location then
		location[3] = true
	end

	managers.menu:post_event("job_appear")

	local job = {
		room_id = data.room_id,
		info = data.info,
		job_id = data.job_id,
		host_id = data.host_id,
		level_id = level_id,
		level_data = level_data,
		marker_panel = marker_panel,
		peers_panel = peers_panel,
		kick_option = data.kick_option,
		job_plan = data.job_plan,
		container_panel = container_panel,
		is_friend = data.is_friend,
		marker_dot = marker_dot,
		timer_rect = timer_rect,
		side_panel = side_panel,
		icon_panel = icon_panel,
		focus = focus,
		difficulty = data.difficulty,
		difficulty_id = data.difficulty_id,
		one_down = data.one_down,
		num_plrs = data.num_plrs,
		job_x = x,
		job_y = y,
		state = data.state,
		layer = 11 + self._num_layer_jobs * 3,
		glow_panel = glow_panel,
		callout = callout,
		text_on_right = text_on_right,
		location = location,
		heat_glow = heat_glow,
		mutators = data.mutators,
		is_crime_spree = data.crime_spree and data.crime_spree >= 0,
		crime_spree = data.crime_spree,
		crime_spree_mission = data.crime_spree_mission,
		color_lerp = data.color_lerp,
		server_data = data,
		mods = data.mods,
		is_skirmish = data.skirmish and data.skirmish > 0,
		skirmish = data.skirmish,
		skirmish_wave = data.skirmish_wave,
		skirmish_weekly_modifiers = data.skirmish_weekly_modifiers
	}

	if is_crime_spree or data.is_crime_spree then
		stars_panel:set_visible(false)

		local spree_panel = side_panel:panel({
			visible = true,
			name = "spree_panel",
			layer = -1,
			h = tweak_data.menu.pd2_small_font_size
		})

		spree_panel:set_bottom(side_panel:h())

		local level = is_crime_spree and managers.crime_spree:spree_level() or tonumber(data.crime_spree)

		if level >= 0 then
			local spree_level = spree_panel:text({
				halign = "left",
				vertical = "center",
				layer = 1,
				align = "left",
				y = 0,
				x = 0,
				valign = "center",
				text = managers.experience:cash_string(level or 0, "") .. managers.localization:get_default_macro("BTN_SPREE_TICKET"),
				color = tweak_data.screen_colors.crime_spree_risk,
				font = tweak_data.menu.pd2_small_font,
				font_size = tweak_data.menu.pd2_small_font_size
			})
		end
	end

	if data.is_skirmish then
		stars_panel:set_visible(false)

		local skirmish_panel = side_panel:panel({
			visible = true,
			name = "skirmish_panel",
			layer = -1,
			h = tweak_data.menu.pd2_small_font_size
		})

		skirmish_panel:set_bottom(side_panel:h())

		local wave = data.skirmish_wave
		local text = nil

		if data.state == tweak_data:server_state_to_index("in_game") then
			text = managers.localization:to_upper_text("menu_skirmish_wave_number", {
				wave = wave
			})
		else
			text = managers.localization:to_upper_text("menu_lobby_server_state_" .. tweak_data:index_to_server_state(data.state))
		end

		local skirmish_wave = skirmish_panel:text({
			layer = 1,
			vertical = "center",
			blend_mode = "add",
			align = "left",
			halign = "left",
			valign = "center",
			text = text,
			color = tweak_data.screen_colors.skirmish_color,
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size
		})
	end

	self:update_job_gui(job, 3)

	return job
end

local data = CrimeNetGui.init
function CrimeNetGui:init(ws, fullscreeen_ws, node)
	data(self, ws, fullscreeen_ws, node)
	local legend_panel = self._panel:child("legend_panel")
	legend_panel:clear()

	local w, h = nil
	local mw = 0
	local mh = nil
	local host_icon = legend_panel:bitmap({
		texture = "guis/textures/pd2/crimenet_legend_host",
		x = 10,
		y = 10
	})
	local host_text = legend_panel:text({
		blend_mode = "add",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		x = host_icon:right() + 2,
		y = host_icon:top(),
		text = managers.localization:to_upper_text("menu_cn_legend_host")
	})
	mw = math.max(mw, self:make_fine_text(host_text))
	local next_y = host_text:bottom()
	local join_icon = legend_panel:bitmap({
		texture = "guis/textures/pd2/crimenet_legend_join",
		x = 10,
		y = next_y
	})
	local join_text = legend_panel:text({
		blend_mode = "add",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		x = host_text:left(),
		y = next_y,
		text = managers.localization:to_upper_text("menu_cn_legend_join")
	})
	mw = math.max(mw, self:make_fine_text(join_text))

	self:make_color_text(join_text, tweak_data.screen_colors.regular_color)

	next_y = join_text:bottom()
	local friends_icon = legend_panel:bitmap({
		texture = "guis/textures/pd2/crimenet_legend_join",
		x = 10,
		y = next_y,
		color = tweak_data.screen_colors.friend_color
	})
	local friends_text = legend_panel:text({
		blend_mode = "add",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		x = host_text:left(),
		y = next_y,
		text = managers.localization:to_upper_text("menu_cn_legend_friends")
	})
	mw = math.max(mw, self:make_fine_text(friends_text))

	self:make_color_text(friends_text, tweak_data.screen_colors.friend_color)

	next_y = friends_text:bottom()

	if managers.crimenet:no_servers() or is_xb1 then
		next_y = host_text:bottom()

		join_icon:hide()
		join_text:hide()
		friends_icon:hide()
		friends_text:hide()
		friends_text:set_bottom(next_y)
	end

	local hidden_icon = legend_panel:bitmap({
		texture = "guis/textures/pd2/crimenet_legend_join",
		x = 10,
		y = next_y,
		color = tweak_data.screen_colors.ghost_color
	})
	local hidden_text = legend_panel:text({
		blend_mode = "add",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		x = host_text:left(),
		y = next_y,
		text = managers.localization:to_upper_text("menu_cn_legend_hidden")
	})
	mw = math.max(mw, self:make_fine_text(hidden_text))
	self:make_color_text(hidden_text, tweak_data.screen_colors.ghost_color)
	next_y = hidden_text:bottom()
	
	local pro_icon = legend_panel:bitmap({
		texture = "guis/textures/pd2/crimenet_legend_join",
		x = 10,
		y = next_y,
		color = tweak_data.screen_colors.pro_color
	})
	local pro_text = legend_panel:text({
		blend_mode = "add",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		x = host_text:left(),
		y = next_y,
		text = managers.localization:to_upper_text("menu_cn_legend_pro"),
		color = tweak_data.screen_colors.pro_color
	})
	mw = math.max(mw, self:make_fine_text(pro_text))
	next_y = pro_text:bottom()
	
	local mutated_icon = legend_panel:bitmap({
		texture = "guis/textures/pd2/crimenet_legend_join",
		x = 10,
		y = next_y,
		color = tweak_data.screen_colors.mutators_color_text
	})
	local mutated_text = legend_panel:text({
		blend_mode = "add",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		x = host_text:left(),
		y = next_y,
		text = managers.localization:to_upper_text("menu_cn_legend_mutated"),
		color = tweak_data.screen_colors.mutators_color_text
	})
	mw = math.max(mw, self:make_fine_text(mutated_text))
	next_y = mutated_text:bottom()
	local spree_icon = legend_panel:bitmap({
		texture = "guis/textures/pd2/crimenet_legend_join",
		x = 10,
		y = next_y,
		color = tweak_data.screen_colors.crime_spree_risk
	})
	local spree_text = legend_panel:text({
		blend_mode = "add",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		x = host_text:left(),
		y = next_y,
		text = managers.localization:to_upper_text("cn_crime_spree"),
		color = tweak_data.screen_colors.crime_spree_risk
	})
	mw = math.max(mw, self:make_fine_text(spree_text))
	next_y = spree_text:bottom()
	local skirmish_icon = legend_panel:bitmap({
		texture = "guis/textures/pd2/crimenet_legend_join",
		x = 10,
		y = next_y,
		color = tweak_data.screen_colors.skirmish_color
	})
	local skirmish_text = legend_panel:text({
		blend_mode = "add",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		x = host_text:left(),
		y = next_y,
		text = managers.localization:to_upper_text("menu_cn_skirmish"),
		color = tweak_data.screen_colors.skirmish_color
	})
	mw = math.max(mw, self:make_fine_text(skirmish_text))
	next_y = skirmish_text:bottom()
	local paygrade_icon = legend_panel:bitmap({
		texture = "guis/textures/pd2/crimenet_legend_payclass",
		x = 10,
		y = next_y
	})
	local paygrade_text = legend_panel:text({
		blend_mode = "add",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		x = host_text:left(),
		y = next_y,
		text = managers.localization:to_upper_text("menu_pay_grade"),
		color = tweak_data.screen_colors.text
	})
	mw = math.max(mw, self:make_fine_text(paygrade_text))
	next_y = paygrade_text:bottom()
	local risk_icon = legend_panel:bitmap({
		texture = "guis/textures/pd2/crimenet_legend_payclass",
		x = 10,
		y = next_y,
		color = tweak_data.screen_colors.risk
	})
	local risk_text = legend_panel:text({
		blend_mode = "add",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		x = host_text:left(),
		y = next_y,
		text = managers.localization:to_upper_text("menu_cn_legend_risk"),
		color = tweak_data.screen_colors.risk
	})
	mw = math.max(mw, self:make_fine_text(risk_text))
	next_y = risk_text:bottom()
	
	local plvl = managers.experience:current_level()
	local prank = managers.experience:current_rank()
	local dw = tweak_data.difficulty_level_locks[7]
	if plvl >= dw or prank > 0 then
		local hate_icon = legend_panel:bitmap({
			texture = "guis/textures/pd2/crimenet_legend_payclass",
			x = 10,
			y = next_y,
			color = Color.red
		})
		local hate_text = legend_panel:text({
			blend_mode = "add",
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			x = host_text:left(),
			y = next_y,
			text = managers.localization:to_upper_text("menu_cn_legend_hate"),
			color = tweak_data.screen_colors.pro_color
		})
		mw = math.max(mw, self:make_fine_text(hate_text))
		next_y = hate_text:bottom()
	end
	
	local ghost_icon = legend_panel:bitmap({
		texture = "guis/textures/pd2/cn_minighost",
		x = 7,
		y = next_y + 4,
		color = tweak_data.screen_colors.ghost_color
	})
	local ghost_text = legend_panel:text({
		blend_mode = "add",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		x = host_text:left(),
		y = next_y,
		text = managers.localization:to_upper_text("menu_cn_legend_ghostable"),
		color = tweak_data.screen_colors.ghost_color
	})
	mw = math.max(mw, self:make_fine_text(ghost_text))
	next_y = ghost_text:bottom()
	local kick_none_icon = legend_panel:bitmap({
		texture = "guis/textures/pd2/cn_kick_marker",
		x = 10,
		y = next_y + 2
	})
	local kick_none_text = legend_panel:text({
		blend_mode = "add",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		x = host_text:left(),
		y = next_y,
		text = managers.localization:to_upper_text("menu_cn_kick_disabled")
	})
	mw = math.max(mw, self:make_fine_text(kick_none_text))
	local kick_vote_icon = legend_panel:bitmap({
		texture = "guis/textures/pd2/cn_votekick_marker",
		x = 10,
		y = kick_none_text:bottom() + 2
	})
	local kick_vote_text = legend_panel:text({
		blend_mode = "add",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		x = host_text:left(),
		y = kick_none_text:bottom(),
		text = managers.localization:to_upper_text("menu_kick_vote")
	})
	mw = math.max(mw, self:make_fine_text(kick_vote_text))
	local last_text = kick_vote_text
	local job_plan_loud_icon, job_plan_loud_text, job_plan_stealth_icon, job_plan_stealth_text = nil

	if MenuCallbackHandler:bang_active() then
		job_plan_loud_icon = legend_panel:bitmap({
			texture = "guis/textures/pd2/cn_playstyle_loud",
			x = 10,
			y = kick_vote_text:bottom() + 2
		})
		job_plan_loud_text = legend_panel:text({
			blend_mode = "add",
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			x = host_text:left(),
			y = kick_vote_text:bottom(),
			text = managers.localization:to_upper_text("menu_plan_loud")
		})
		mw = math.max(mw, self:make_fine_text(job_plan_loud_text))
		job_plan_stealth_icon = legend_panel:bitmap({
			texture = "guis/textures/pd2/cn_playstyle_stealth",
			x = 10,
			y = job_plan_loud_text:bottom() + 2
		})
		job_plan_stealth_text = legend_panel:text({
			blend_mode = "add",
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			x = host_text:left(),
			y = job_plan_loud_text:bottom(),
			text = managers.localization:to_upper_text("menu_plan_stealth")
		})
		mw = math.max(mw, self:make_fine_text(job_plan_stealth_text))
		last_text = job_plan_stealth_text
	end

	if managers.crimenet:no_servers() or is_xb1 then
		kick_none_icon:hide()
		kick_none_text:hide()
		kick_vote_icon:hide()
		kick_vote_text:hide()
		kick_vote_text:set_bottom(ghost_text:bottom())

		if MenuCallbackHandler:bang_active() then
			job_plan_loud_icon:hide()
			job_plan_loud_text:hide()
			job_plan_stealth_icon:hide()
			job_plan_stealth_text:hide()
		end
	end

	legend_panel:set_size(host_text:left() + mw + 10, last_text:bottom() + 10)
	legend_panel:rect({
		alpha = 0.4,
		layer = -1,
		color = Color.black
	})
	BoxGuiObject:new(legend_panel, {
		sides = {1, 1, 1, 1}
	})
	legend_panel:bitmap({
		texture = "guis/textures/test_blur_df",
		render_template = "VertexColorTexturedBlur3D",
		layer = -1,
		w = legend_panel:w(),
		h = legend_panel:h()
	})
	legend_panel:set_right(self._panel:w() - 10)
end

function CrimeNetGui:toggle_legend()
	managers.menu_component:post_event("menu_enter")
	self._panel:child("legend_panel"):set_visible(not self._panel:child("legend_panel"):visible())
	self._panel:child("legends_button"):set_text(managers.localization:to_upper_text(self._panel:child("legend_panel"):visible() and "menu_cn_legend_hide" or "menu_cn_legend_show", {
		BTN_X = managers.localization:btn_macro("menu_toggle_legends")
	}))
end