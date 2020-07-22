local data = CarryTweakData.init
function CarryTweakData:init(tweak_data)
    data(self, tweak_data)
	self.engine_01.type = "mega_heavy"
	self.engine_02.type = "mega_heavy"
	self.engine_03.type = "mega_heavy"
	self.engine_04.type = "mega_heavy"
	self.engine_05.type = "mega_heavy"
	self.engine_06.type = "mega_heavy"
	self.engine_07.type = "mega_heavy"
	self.engine_08.type = "mega_heavy"
	self.engine_09.type = "mega_heavy"
	self.engine_10.type = "mega_heavy"
	self.engine_11.type = "mega_heavy"
	self.engine_12.type = "mega_heavy"

	self.types.careful = {
		move_speed_modifier = 0.7,
		jump_modifier = 1,
		can_run = false,
		throw_distance_multiplier = 0.25
	}
	self.ammo.type = "careful"
end