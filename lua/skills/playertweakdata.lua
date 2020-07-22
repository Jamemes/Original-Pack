local data = PlayerTweakData.init
function PlayerTweakData:init(tweak_data)
    data(self, tweak_data)
	self.damage.MIN_DAMAGE_INTERVAL = 0.35
	self.alarm_pager = {
		first_call_delay = {2, 4},
		call_duration = {
			{3, 6},
			{3, 6}
		},
		nr_of_calls = {2, 2},
		bluff_success_chance = {
			1,
			1,
			0
		},
		bluff_success_chance_w_skill = {
			1,
			1,
			1,
			1,
			0
		}
	}
	self.fall_damage_alert_size = 1000
end


function PlayerTweakData:_set_normal()
	self.damage.automatic_respawn_time = 120
	self.alarm_pager = {
		first_call_delay = {2, 4},
		call_duration = {
			{6, 6},
			{6, 6}
		},
		nr_of_calls = {2, 2},
		bluff_success_chance = {
			1,
			1,
			1,
			1,
			0
		},
		bluff_success_chance_w_skill = {
			1,
			1,
			1,
			1,
			0
		}
	}
	self.fall_damage_alert_size = 1000
end

function PlayerTweakData:_set_hard()
	self.damage.automatic_respawn_time = 220
	self.damage.DOWNED_TIME_DEC = 7
	self.damage.DOWNED_TIME_MIN = 5
	self.damage.automatic_respawn_time = 120
	self.alarm_pager = {
		first_call_delay = {2, 4},
		call_duration = {
			{6, 6},
			{6, 6}
		},
		nr_of_calls = {2, 2},
		bluff_success_chance = {
			1,
			1,
			1,
			1,
			0
		},
		bluff_success_chance_w_skill = {
			1,
			1,
			1,
			1,
			0
		}
	}
	self.fall_damage_alert_size = 1000
end

function PlayerTweakData:_set_sm_wish()
	self.damage.DOWNED_TIME_DEC = 20
	self.damage.DOWNED_TIME_MIN = 1
	self.suspicion.max_value = 14
	self.suspicion.range_mul = 1.4
	self.suspicion.buildup_mul = 1.4
	self.damage.TASED_TIME = 7
	self.damage.DOWNED_TIME = 20
	self.damage.BLEED_OT_TIME = 10
	self.damage.LIVES_INIT = 4
	self.damage.MIN_DAMAGE_INTERVAL = 0.35
	self.damage.respawn_time_penalty = 45
	self.damage.base_respawn_time_penalty = 10
	self.damage.REVIVE_HEALTH_STEPS = {0.1}
	self.alarm_pager = {
		first_call_delay = {2, 4},
		call_duration = {
			{2, 6},
			{0, 0}
		},
		nr_of_calls = {2, 2},
		bluff_success_chance = {1, 0},
		bluff_success_chance_w_skill = {1, 1, 1, 0}
	}
	self.fall_damage_alert_size = 1500
end