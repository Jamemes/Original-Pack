local function get_skull_index(panel, id)
	for i = 0, panel:num_children() - 1 do
		if panel:child(i) and panel:child(i):name() == id then
			return i
		end
	end
end

Hooks:PostHook(IngameContractGui, "init", "OrPack_diff_gui_changes_ingame", function(self)
	local text_panel = self._text_panel
	local id = get_skull_index(text_panel, "risk_stats_panel")
	local risk_swat = text_panel:child(id + 1)
	local risk_fbi = text_panel:child(id + 2)
	local risk_death_squad = text_panel:child(id + 3)
	local risk_easy_wish = text_panel:child(id + 4)
	local risk_murder_squad = text_panel:child(id + 5)
	local risk_sm_wish = text_panel:child(id + 6)
	local risk_text = text_panel:child("risk_text")
	local risk_stats_panel = text_panel:child("risk_stats_panel")

	if managers.job:current_difficulty_stars() > 4 then
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

	local paygrade_title = text_panel:text({
		x = 10,
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		text = managers.localization:to_upper_text("cn_menu_contract_paygrade_header"),
		color = tweak_data.screen_colors.text
	})

	managers.hud:make_fine_text(paygrade_title)
	paygrade_title:set_top(math.round(self._experience_title:bottom()))
	
	local stars_sx = self._rewards_panel:child(0):left()
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

		local star = text_panel:bitmap(star_data)
		star:set_color(managers.crimenet:stars_color(i, math.ceil(tweak_data.narrative:job_data(managers.job:current_job_id()).jc / 10), managers.job:current_difficulty_stars()))
		star:set_x(x)
		star:set_center_y(math.round(stars_cy))
	end
end)