function QuickFlashGrenade:_beep()
	self._beep_t = self:_get_next_beep_time()
	self._light_multiplier = 0
end