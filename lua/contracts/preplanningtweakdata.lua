local data = PrePlanningTweakData.init
function PrePlanningTweakData:init(tweak_data)
    data(self, tweak_data)
	self.types.escape_c4_loud.budget_cost = 6
	self.types.escape_elevator_loud.budget_cost = 6
	self.types.vault_thermite.budget_cost = 8
end