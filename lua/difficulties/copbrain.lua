local reload
if CopBrain._reload_clbks then
	reload = true
else
	CopBrain._reload_clbks = {}
end

function CopBrain:on_suppressed(state)
	self._logic_data.is_suppressed = state or nil

	if self._current_logic.on_suppressed_state then
		self._current_logic.on_suppressed_state(self._logic_data)

		if self._logic_data.char_tweak.chatter.suppress then 
			if managers.groupai:state():chk_assault_active_atm()then
			local roll = math.rand(1, 100)
			local chance_heeeeelpp = 50
				if roll <= chance_heeeeelpp then
					self._unit:sound():say("hlp", true) 
					--log(" assault panic works")
				else --hopefully some variety here now
					self._unit:sound():say("lk3a", true) 
					--log(" assault panic works")
				end	
			else		
			   self._unit:sound():say("lk3b", true) --calmer lines for when the assault is off
			   --log("between assault panic works")
			end
		end
	end
end	
