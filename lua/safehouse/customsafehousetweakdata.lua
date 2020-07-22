local data = CustomSafehouseTweakData.init
function CustomSafehouseTweakData:init(tweak_data)
    data(self, tweak_data)
	self.prices = {
		rooms = {
			0,
			1,
			3
		},
		weapon_mod = 12,
		event_weapon_mod = 18,
		crew_boost = 1337,
		crew_ability = 1337
	}
	self.rewards = {
		initial = self.prices.rooms[2] * 1,
		challenge = 1,
		daily_complete = 1,
		raid = 2,
		experience_ratio = 3900000
	}
	self.rank_limit = 2
end