if Global.game_settings.one_down then
	return
end

function QuickFlashGrenade:init(unit)
	self._unit = unit
	self._state = 0
	self._armed = false

	for i, state in ipairs(QuickFlashGrenade.States) do
		if state[2] == nil then
			QuickFlashGrenade.States[i][2] = managers.job:is_current_job_professional() and 0 or tweak_data.group_ai.flash_grenade.timer
		end
	end

	if Network:is_client() then
		self:activate(self._unit:position(), tweak_data.group_ai.flash_grenade_lifetime)
	end
end

function QuickFlashGrenade:_beep()
end