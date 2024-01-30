local data = EquipmentsTweakData.init
function EquipmentsTweakData:init()
	data(self, tweak_data)
	self.trip_mine.quantity = {2}
	self.trip_mine.upgrade_name = {"trip_mine"}
	self.doctor_bag.upgrade_deploy_time_multiplier = {
		category = "doctor_bag",
		upgrade = "deploy_time_multiplier"
	}
	self.sentry_gun_silent = {
		deploy_time = 1,
		dummy_unit = "units/payday2/equipment/gen_equipment_sentry/gen_equipment_sentry_dummy",
		text_id = "debug_sentry_gun",
		use_function_name = "use_sentry_gun",
		unit = 2,
		min_ammo_cost = 0.33,
		ammo_cost = 0.46,
		visual_object = "g_sentrybag",
		icon = "equipment_sentry_silent",
		description_id = "des_sentry_gun",
		quantity = {
			1
		},
		upgrade_deploy_time_multiplier = {
			upgrade = "sentry_gun_deploy_time_multiplier",
			category = "player"
		}
	}
end