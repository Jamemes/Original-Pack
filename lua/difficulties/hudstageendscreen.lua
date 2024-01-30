local data = HUDStageEndScreen.init
function HUDStageEndScreen:init(hud, workspace)
	data(self, hud, workspace)
	if not managers.crime_spree:is_active() then
		self._foreground_layer_safe:child("pg_text"):set_visible(false)
		self._paygrade_panel:clear()
		
		local filled_star_rect = {0, 32, 32, 32}
		local num_stars = 0
		local x = 0
		local y = 4
		local risk_color = tweak_data.screen_colors.risk
		local job_stars = managers.job:current_job_stars()
		local difficulty_stars = managers.job:current_difficulty_stars()
		local diff = difficulty_stars == 5 and difficulty_stars - 1 or difficulty_stars == 4 and difficulty_stars + 1 or difficulty_stars
		local job_and_diff_stars = job_stars + diff
		local hate_risk = difficulty_stars == 6 and 3 or difficulty_stars == 5 and 1 or difficulty_stars == 4 and 2 or 0

		local pg_text = self._foreground_layer_safe:text({
			name = "pg_text",
			vertical = "center",
			h = 32,
			align = "right",
			text = utf8.to_upper(managers.localization:text("cn_menu_contract_paygrade_header")),
			y = 60,
			font_size = tweak_data.menu.pd2_medium_font_size,
			font = tweak_data.menu.pd2_medium_font,
			color = tweak_data.screen_colors.text
		})
		
		for i = 1, job_and_diff_stars do
			local is_risk = i > job_stars
			
			local star = self._paygrade_panel:bitmap({
				texture = "guis/textures/pd2/"..(hate_risk > 1 and i == hate_risk and "risklevel_deathwish_easywish_blackscreen" or i == hate_risk - 2 and "risklevel_deathwish_sm_blackscreen" or i <= hate_risk and "risklevel_deathwish_blackscreen" or i <= diff and "risklevel_blackscreen" or "mission_briefing/difficulty_icons"),
				texture_rect = i > diff and filled_star_rect,
				w = i > diff and 23 or 32,
				h = i > diff and 23 or 32,
				color = tweak_data.screen_colors.text,
				rotation = 360,
				alpha = 1
			})
			star:set_position(x + 4 * 35, i <= diff and y - 2.5 or y + 2)
			star:set_color((i > diff) and Color.white or risk_color)
			local pos = x - star:w()
			x = i == diff and pos + 8 or i <= diff and pos + 4 or pos - 4
			num_stars = num_stars + 1
			pg_text:set_righttop(self._paygrade_panel:right() - 20 - (diff * 28) - (job_stars * 27), self._paygrade_panel:top() + 3)
		end
	end
end