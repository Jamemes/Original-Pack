local data = AssetsTweakData.init
function AssetsTweakData:init(tweak_data)
    data(self, tweak_data)
	self.risk_sm_wish.risk_lock = 5
	self.risk_death_wish.risk_lock = 6
end