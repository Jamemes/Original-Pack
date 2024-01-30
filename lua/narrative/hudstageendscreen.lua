local data = HUDStageEndScreen.stage_experience_init
function HUDStageEndScreen:stage_experience_init(t, dt)
	if self._data.gained == 0  then
		self._lp_text:show()
		self._lp_circle:show()
		self._lp_backpanel:child("bg_progress_circle"):show()
		self._lp_forepanel:child("level_progress_text"):show()
		self._lp_text:set_text(tostring(self._data.start_t.level))
		self._lp_circle:set_color(Color(1, 1, 1))
		managers.menu_component:post_event("box_tick")
		
		self:step_stage_to_end()
		return
	end
	data(self, t, dt)
end