local data = HUDStageEndScreen.init
function HUDStageEndScreen:init(hud, workspace)
	data(self, hud, workspace)
	if not managers.crime_spree:is_active() and managers.job:current_difficulty_stars() < 5 then
		local pg_text = self._foreground_layer_safe:child("pg_text")
		self._paygrade_panel:child("risk_easy_wish"):set_texture_rect(0, 32, 30, 30)
		self._paygrade_panel:child("risk_murder_squad"):hide()
		self._paygrade_panel:child("risk_sm_wish"):hide()
		self._paygrade_panel:set_w(120)
		self._paygrade_panel:set_right(self._foreground_layer_safe:w())
		pg_text:set_right(self._paygrade_panel:left() - 5)
			
		if Global.game_settings.one_down then
			self._foreground_layer_safe:child("one_down_text"):set_right(pg_text:left() - 10)
		end
	end
end