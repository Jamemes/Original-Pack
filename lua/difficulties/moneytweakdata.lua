local data = MoneyTweakData.init
function MoneyTweakData:init(tweak_data)
	data(self, tweak_data)

	self.mission_asset_cost_multiplier_by_risk[5] = 10
	self.mission_asset_cost_multiplier_by_risk[7] = 12
	self.difficulty_multiplier[5] = 45
	self.difficulty_multiplier[7] = 50
	self.difficulty_multiplier_payout[5] = 20
	self.difficulty_multiplier_payout[7] = 25
end