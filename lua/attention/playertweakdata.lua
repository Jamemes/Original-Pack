local data = PlayerTweakData.init
function PlayerTweakData:init(tweak_data)
	data(self, tweak_data)
	self.alarm_pager = {
		first_call_delay = {2, 4},
		call_duration = {
			{3, 6},
			{3, 6}
		},
		nr_of_calls = {2, 2},
		bluff_success_chance = {1, 1, 0},
		bluff_success_chance_w_skill = {1, 1, 1, 1, 0}
	}
	self.fall_damage_alert_size = 1000
end

function PlayerTweakData:_set_normal()
	self.damage.automatic_respawn_time = 120
	self.alarm_pager.call_duration = {
		{6, 6},
		{6, 6}
	}
	self.alarm_pager.bluff_success_chance = {1, 1, 1, 1, 0}
	self.fall_damage_alert_size = 0
end

function PlayerTweakData:_set_hard()
	self.damage.automatic_respawn_time = 220
	self.damage.DOWNED_TIME_DEC = 7
	self.damage.DOWNED_TIME_MIN = 5
	self.damage.automatic_respawn_time = 120
	self.alarm_pager.call_duration = {
		{6, 6},
		{6, 6}
	}
	self.alarm_pager.bluff_success_chance = {1, 1, 1, 1, 0}
	self.fall_damage_alert_size = 0
end

local data = PlayerTweakData._set_overkill
function PlayerTweakData:_set_overkill()
	data(self)
	self.fall_damage_alert_size = 0
end

local data = PlayerTweakData._set_overkill_145
function PlayerTweakData:_set_overkill_145()
	data(self)
	self.fall_damage_alert_size = 0
end