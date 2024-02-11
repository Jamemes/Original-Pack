Hooks:PostHook(CrimeNetContractGui, "init", "OrPack_diff_gui_changes_crimenet", function(self)
	if self._node:item("difficulty") then
		local function name(opt)
			opt[5]._parameters.text_id = "menu_difficulty_apocalypse"
			opt[6]._parameters.text_id = "menu_difficulty_easy_wish"
		end
		name(self._node:item("difficulty")._all_options)
		name(self._node:item("difficulty")._options)
	end

	local job_data = self._node:parameters().menu_component_data
	local risk_text = self._contract_panel:child("risk_text")
	local risk_murder_squad = self._contract_panel:child("risk_murder_squad")
	local risk_easy_wish = self._contract_panel:child("risk_easy_wish")
	local risk_sm_wish = self._contract_panel:child("risk_sm_wish")
	local risk_stats_panel = self._contract_panel:child("risk_stats_panel")
	
	risk_murder_squad:hide()
	risk_sm_wish:hide()
	risk_stats_panel:child("risk_murder_squad"):hide()
	risk_stats_panel:child("risk_sm_wish"):hide()
	risk_text:set_left(risk_murder_squad:left() + 5)
	risk_easy_wish:set_texture_rect(0, 32, 30, 30)

	local job_xp = self._contract_panel:child("job_xp")
	local paygrade_title = self._contract_panel:text({
		x = 20,
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		text = managers.localization:to_upper_text("cn_menu_contract_paygrade_header"),
		color = tweak_data.screen_colors.text
	})

	self:make_fine_text(paygrade_title)
	paygrade_title:set_top(math.round(job_xp:bottom()))
	
	local stars_sx = job_xp:left()
	local stars_cy = paygrade_title:center_y()
	for i = 1, 15 do
		local x = stars_sx + (i - 1) * 18
		local star_data = { 
			name = "star" .. tostring(i),
			texture = "guis/textures/pd2/mission_briefing/difficulty_icons", 
			texture_rect = {0, 32, 32, 32}, 
			w = 18, 
			h = 18,
			alpha = 1,
			color = Color.black
		}

		local star = self._contract_panel:bitmap(star_data)
		star:set_color(managers.crimenet:stars_color(i, math.ceil(tweak_data.narrative:job_data(job_data.job_id).jc / 10), 0))
		star:set_x(x)
		star:set_center_y(math.round(stars_cy))
	end
	
	self:set_offshore_text()
end)

function CrimeNetContractGui:set_difficulty_id(difficulty_id)
	local job_data = self._node:parameters().menu_component_data
	job_data.difficulty_id = difficulty_id
	job_data.difficulty = tweak_data.difficulties[difficulty_id]
	
	local menu_risk_id = {
		normal = "menu_risk_pd",
		hard = "menu_risk_swat",
		overkill = "menu_risk_fbi",
		overkill_145 = "menu_risk_special",
		easy_wish = "menu_risk_easy_wish",
		overkill_290 = "menu_risk_elite",
		sm_wish = "menu_risk_sm_wish"
	}

	local stat = managers.statistics:completed_job(job_data.job_id, tweak_data.difficulties[difficulty_id])
	local risk_text = self._contract_panel:child("risk_text")

	risk_text:set_text(managers.localization:to_upper_text(menu_risk_id[tweak_data.difficulties[difficulty_id]]) .. " " .. managers.localization:to_upper_text("menu_stat_job_completed", {
		stat = tostring(stat)
	}) .. " ")

	local _, _, _, h = risk_text:text_rect()
	
	local risk_murder_squad = self._contract_panel:child("risk_murder_squad")
	local risk_sm_wish = self._contract_panel:child("risk_sm_wish")
	local risk_easy_wish = self._contract_panel:child("risk_easy_wish")
	local risk_stats_panel = self._contract_panel:child("risk_stats_panel")
	if difficulty_id > 6 then
		risk_murder_squad:show()
		risk_sm_wish:show()
		risk_stats_panel:child("risk_murder_squad"):show()
		risk_stats_panel:child("risk_sm_wish"):show()
		risk_text:set_left(risk_stats_panel:child("risk_sm_wish"):right() + 30)
		risk_easy_wish:set_texture_rect(90, 0, 30, 30)
	else
		risk_murder_squad:hide()
		risk_sm_wish:hide()
		risk_stats_panel:child("risk_murder_squad"):hide()
		risk_stats_panel:child("risk_sm_wish"):hide()
		risk_text:set_left(risk_murder_squad:left() + 5)
		risk_easy_wish:set_texture_rect(0, 32, 30, 30)
	end
	
	risk_text:set_h(h)
	self:set_potential_rewards(self._potential_show_max)
end

local data = CrimeNetContractGui.count_difficulty_stars
function CrimeNetContractGui:count_difficulty_stars(t, dt)
	data(self, t, dt)
	
	local risk_text = self._contract_panel:child("risk_text")
	local risk_murder_squad = self._contract_panel:child("risk_murder_squad")
	local risk_sm_wish = self._contract_panel:child("risk_sm_wish")
	local risk_easy_wish = self._contract_panel:child("risk_easy_wish")
	local risk_stats_panel = self._contract_panel:child("risk_stats_panel")
	if self._current_difficulty_star > 4 then
		risk_murder_squad:show()
		risk_sm_wish:show()
		risk_stats_panel:child("risk_murder_squad"):show()
		risk_stats_panel:child("risk_sm_wish"):show()
		risk_text:set_left(risk_stats_panel:child("risk_sm_wish"):right() + 30)
		risk_easy_wish:set_texture_rect(90, 0, 30, 30)
	else
		risk_murder_squad:hide()
		risk_sm_wish:hide()
		risk_stats_panel:child("risk_murder_squad"):hide()
		risk_stats_panel:child("risk_sm_wish"):hide()
		risk_text:set_left(risk_murder_squad:left() + 5)
		risk_easy_wish:set_texture_rect(0, 32, 30, 30)
	end

	for i = 1, 15 do
		self._contract_panel:child("star"..i):set_color(managers.crimenet:stars_color(i, self._data.stars.job_stars, self._current_difficulty_star))
	end
end

local data = CrimeNetContractGui.set_potential_rewards
function CrimeNetContractGui:set_potential_rewards(show_max)
	data(self, show_max)
	local job_data = self._node:parameters().menu_component_data
	for i = 1, 15 do
		self._contract_panel:child("star"..i):set_color(managers.crimenet:stars_color(i, math.ceil(tweak_data.narrative:job_data(job_data.job_id).jc / 10), job_data.difficulty_id - 2))
	end
	
	self:set_offshore_account()
end

local data = CrimeNetContractGui.set_all
function CrimeNetContractGui:set_all(t, dt)
	data(self, t, dt)
	local job_data = self._node:parameters().menu_component_data
	for i = 1, 15 do
		self._contract_panel:child("star"..i):set_color(managers.crimenet:stars_color(i, math.ceil(tweak_data.narrative:job_data(job_data.job_id).jc / 10), job_data.difficulty_id - 2))
	end

	self:set_offshore_account()
end

function CrimeNetContractGui:set_offshore_text()
	local premium_text = self._contract_panel:child("premium_text")
	if alive(premium_text) then
		local offshore_text = self._contract_panel:text({
			text = "",
			name = "offshore_text",
			wrap = true,
			blend_mode = "add",
			word_wrap = true,
			font_size = tweak_data.menu.pd2_small_font_size,
			font = tweak_data.menu.pd2_small_font,
			color = tweak_data.screen_colors.button_stage_3
		})
		offshore_text:set_left(premium_text:left())offshore_text:set_bottom(premium_text:bottom() + 20)
	end
end

function CrimeNetContractGui:set_offshore_account()
	local job_data = self._node:parameters().menu_component_data
	local gui_panel = self._contract_panel
	local can_afford = managers.money:can_afford_buy_premium_contract(job_data.job_id, job_data.difficulty_id)
	local offshore_text = gui_panel:child("offshore_text")
	local offshore = managers.money:offshore()
	local contract_cost = managers.money:get_cost_of_premium_contract(job_data.job_id, job_data.difficulty_id)
	local remains = not can_afford and "$0" or managers.experience:cash_string(offshore - contract_cost)
	local offshore_string = managers.localization:to_upper_text("menu_offshore_remains") .. ": " .. "##" .. remains .. "##"	

	managers.menu:color_range(
		offshore_text,
		not can_afford and tweak_data.screen_colors.pro_color or tweak_data.screen_colors.friend_color,
		offshore_string
	)
end