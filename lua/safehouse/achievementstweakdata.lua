local data = AchievementsTweakData.init
function AchievementsTweakData:init(tweak_data)
    data(self, tweak_data)
	local deathwish_and_above = {
		"overkill_290",
		"sm_wish"
	}
	local sm_wish_and_above = {
		"sm_wish"
	}
	self.complete_heist_achievements.trophy_friendly_car = {
			stealth = false,
			complete_job = true,
			job = "friend",
			num_players = 4,
			trophy_stat = "trophy_friendly_car",
			difficulty = deathwish_and_above
		}
		
	self.complete_heist_achievements.trophy_courtesy = {
			complete_job = true,
			job = "pbr",
			trophy_stat = "trophy_courtesy",
			difficulty = sm_wish_and_above,
			killed = {
				medic = 0
			}
		}
end