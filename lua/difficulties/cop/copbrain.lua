local old_init = CopBrain.init
local old_update = CopBrain.update
local logic_variants = {
	security = {
		idle = CopLogicIdle,
		attack = CopLogicAttack,
		travel = CopLogicTravel,
		inactive = CopLogicInactive,
		intimidated = CopLogicIntimidated,
		arrest = CopLogicArrest,
		guard = CopLogicGuard,
		flee = CopLogicFlee,
		sniper = CopLogicSniper,
		trade = CopLogicTrade,
		phalanx = CopLogicPhalanxMinion
	}
}
local security_variant = logic_variants.security
function CopBrain:init(unit)
		old_init(self, unit)
		CopBrain._logic_variants.tank_city = clone(security_variant)	
		CopBrain._logic_variants.tank_city.attack = TankCopLogicAttack	
		CopBrain._logic_variants.spooc_city = clone(security_variant)
		CopBrain._logic_variants.spooc_city.idle = SpoocLogicIdle
		CopBrain._logic_variants.spooc_city.attack = SpoocLogicAttack
		CopBrain._logic_variants.taser_city = clone(security_variant)	
		CopBrain._logic_variants.secret_service = clone(security_variant)		
		CopBrain._logic_variants.zeal_light = clone(security_variant)		
		CopBrain._logic_variants.zeal_swat = clone(security_variant)		
		CopBrain._logic_variants.zeal_swat_heavy = clone(security_variant)		
		CopBrain._logic_variants.zeal_swat_heavy_op = clone(security_variant)		
end

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