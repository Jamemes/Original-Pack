local data = MissionDoorTweakData.init
function MissionDoorTweakData:init(tweak_data)
	data(self, tweak_data)
	self.train_cargo_door.devices.drill = {
 	{
 		align = "a_drill",
 		unit = Idstring("units/payday2/equipment/item_door_drill_small/item_door_drill_small"),
		can_jam = true,
		timer = 180
 	}
}	
end