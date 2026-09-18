PrePlanningTweakData_37 = PrePlanningTweakData_37 or class()

function PrePlanningTweakData_37:get_custom_texture_rect(num)
	if not num then
		return
	end
	local x = math.floor(num / 10) - 1
	local y = num % 10 - 1
	return {
		x * 48,
		y * 48,
		48,
		48
	}
end

function PrePlanningTweakData_37:get_category_texture_rect(num)
	if not num then
		return
	end
	local x = math.floor(num / 10) - 1
	local y = num % 10 - 1
	return {
		x * 64,
		y * 64,
		64,
		64
	}
end

function PrePlanningTweakData_37:get_type_texture_rect(num)
	if not num then
		return
	end
	local x = math.floor(num / 10) - 1
	local y = num % 10 - 1
	return {
		x * 48,
		y * 48,
		48,
		48
	}
end

function PrePlanningTweakData_37:init(tweak_data)
	self:_create_locations(tweak_data)
	self.plans = {}
	self.plans.escape_plan = {}
	self.plans.escape_plan.category = "escape_plan"
	self.plans.vault_plan = {}
	self.plans.vault_plan.category = "vault_plan"
	self.gui = {}
	self.gui.custom_icons_path = "guis/dlcs/big_bank/textures/pd2/pre_planning/preplan_icon_types"
	self.gui.type_icons_path = "guis/dlcs/big_bank/textures/pd2/pre_planning/preplan_icon_types"
	self.gui.category_icons_path = "guis/dlcs/big_bank/textures/pd2/pre_planning/preplan_icon_frames"
	self.gui.category_icons_bg = 42
	self.gui.MAX_DRAW_POINTS = 1000
	self.categories = {}
	self.categories.default = {}
	self.categories.default.name_id = "menu_pp_cat_default"
	self.categories.default.desc_id = "menu_pp_cat_default_desc"
	self.categories.default.icon = 32
	self.categories.default.prio = 0
	self.categories.dead_drop = {}
	self.categories.dead_drop.name_id = "menu_pp_cat_dead_drop"
	self.categories.dead_drop.desc_id = "menu_pp_cat_dead_drop_desc"
	self.categories.dead_drop.icon = 22
	self.categories.dead_drop.prio = 5
	self.categories.mission_equipment = {}
	self.categories.mission_equipment.name_id = "menu_pp_cat_mission_equipment"
	self.categories.mission_equipment.desc_id = "menu_pp_cat_mission_equipment_desc"
	self.categories.mission_equipment.icon = 11
	self.categories.mission_equipment.prio = 0
	self.categories.insider_help = {}
	self.categories.insider_help.name_id = "menu_pp_cat_insider_help"
	self.categories.insider_help.desc_id = "menu_pp_cat_insider_help_desc"
	self.categories.insider_help.upgrade_lock = {
		category = "player",
		upgrade = "additional_assets"
	}
	self.categories.insider_help.icon = 21
	self.categories.insider_help.prio = 2
	self.categories.data_hacking = {}
	self.categories.data_hacking.name_id = "menu_pp_cat_data_hacking"
	self.categories.data_hacking.desc_id = "menu_pp_cat_data_hacking_desc"
	self.categories.data_hacking.icon = 31
	self.categories.data_hacking.prio = 3
	self.categories.hired_help = {}
	self.categories.hired_help.name_id = "menu_pp_cat_hired_help"
	self.categories.hired_help.desc_id = "menu_pp_cat_hired_help_desc"
	self.categories.hired_help.icon = 41
	self.categories.hired_help.prio = 1
	self.categories.surveillance = {}
	self.categories.surveillance.name_id = "menu_pp_cat_surveillance"
	self.categories.surveillance.desc_id = "menu_pp_cat_surveillance_desc"
	self.categories.surveillance.icon = 41
	self.categories.surveillance.prio = 4
	self.categories.vault_plan = {}
	self.categories.vault_plan.name_id = "menu_pp_cat_vault_plan"
	self.categories.vault_plan.desc_id = "menu_pp_cat_vault_plan_desc"
	self.categories.vault_plan.plan = "vault_plan"
	self.categories.vault_plan.icon = 11
	self.categories.vault_plan.prio = 2
	self.categories.escape_plan = {}
	self.categories.escape_plan.name_id = "menu_pp_cat_escape_plan"
	self.categories.escape_plan.desc_id = "menu_pp_cat_escape_plan_desc"
	self.categories.escape_plan.plan = "escape_plan"
	self.categories.escape_plan.icon = 12
	self.categories.escape_plan.total = 1
	self.categories.escape_plan.prio = 1
	self.types = {}
	self.types.ammo_bag = {}
	self.types.ammo_bag.name_id = "menu_pp_asset_ammo"
	self.types.ammo_bag.desc_id = "menu_pp_asset_ammo_desc"
	self.types.ammo_bag.deployable_id = "ammo_bag"
	self.types.ammo_bag.icon = 52
	self.types.ammo_bag.category = "dead_drop"
	self.types.ammo_bag.total = 2
	self.types.ammo_bag.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_deaddropbag")
	self.types.ammo_bag.budget_cost = 2
	self.types.ammo_bag.post_event = "gus_preplan_05"
	self.types.ammo_bag.prio = 5
	self.types.health_bag = {}
	self.types.health_bag.name_id = "menu_pp_asset_health"
	self.types.health_bag.desc_id = "menu_pp_asset_health_desc"
	self.types.health_bag.deployable_id = "doctor_bag"
	self.types.health_bag.icon = 31
	self.types.health_bag.category = "dead_drop"
	self.types.health_bag.total = 2
	self.types.health_bag.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_deaddropbag")
	self.types.health_bag.budget_cost = 2
	self.types.health_bag.post_event = "gus_preplan_06"
	self.types.health_bag.prio = 6
	self.types.bodybags_bag = {}
	self.types.bodybags_bag.name_id = "menu_pp_asset_bodybags_bag"
	self.types.bodybags_bag.desc_id = "menu_pp_asset_bodybags_bag_desc"
	self.types.bodybags_bag.deployable_id = "bodybags_bag"
	self.types.bodybags_bag.icon = 13
	self.types.bodybags_bag.category = "dead_drop"
	self.types.bodybags_bag.upgrade_lock = {
		category = "player",
		upgrade = "buy_bodybags_asset"
	}
	self.types.bodybags_bag.total = 2
	self.types.bodybags_bag.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_deaddropbag")
	self.types.bodybags_bag.budget_cost = 2
	self.types.bodybags_bag.post_event = "gus_preplan_15"
	self.types.bodybags_bag.prio = 3
	self.types.grenade_crate = {}
	self.types.grenade_crate.name_id = "menu_pp_asset_grenade_crate"
	self.types.grenade_crate.desc_id = "menu_pp_asset_grenade_crate_desc"
	self.types.grenade_crate.deployable_id = "grenade_crate"
	self.types.grenade_crate.icon = 21
	self.types.grenade_crate.category = "dead_drop"
	self.types.grenade_crate.dlc_lock = "gage_pack"
	self.types.grenade_crate.total = 2
	self.types.grenade_crate.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_deaddropbag")
	self.types.grenade_crate.budget_cost = 2
	self.types.grenade_crate.post_event = "gus_preplan_15"
	self.types.grenade_crate.prio = 4
	self.types.grenade_crate.progress_stat = "gage_10_stats"
	self.types.car = {}
	self.types.car.name_id = "menu_asset_car"
	self.types.car.total = 1
	self.types.drill_parts = {}
	self.types.drill_parts.name_id = "menu_pp_asset_drill_parts"
	self.types.drill_parts.desc_id = "menu_pp_asset_drill_parts_desc"
	self.types.drill_parts.category = "dead_drop"
	self.types.drill_parts.icon = 12
	self.types.drill_parts.total = 1
	self.types.drill_parts.post_event = "gus_preplan_16"
	self.types.drill_parts.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_drillparts")
	self.types.drill_parts.budget_cost = 3
	self.types.drill_parts.prio = 2
	self.types.zipline = {}
	self.types.zipline.name_id = "menu_pp_asset_zipline"
	self.types.zipline.desc_id = "menu_pp_asset_zipline_desc"
	self.types.zipline.category = "mission_equipment"
	self.types.zipline.icon = 23
	self.types.zipline.total = 1
	self.types.zipline.post_event = "gus_preplan_07"
	self.types.zipline.prio = 1
	self.types.zipline.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_zipline")
	self.types.zipline.budget_cost = 2
	self.types.unlocked_door = {}
	self.types.unlocked_door.name_id = "menu_pp_asset_unlocked_door"
	self.types.unlocked_door.desc_id = "menu_pp_asset_unlocked_door_desc"
	self.types.unlocked_door.category = "mission_equipment"
	self.types.unlocked_door.icon = 41
	self.types.unlocked_door.total = 1
	self.types.unlocked_door.post_event = "gus_preplan_07"
	self.types.unlocked_door.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_unlocked_door")
	self.types.unlocked_door.budget_cost = 1
	self.types.unlocked_door.prio = 2
	self.types.unlocked_window = {}
	self.types.unlocked_window.name_id = "menu_pp_asset_unlocked_window"
	self.types.unlocked_window.desc_id = "menu_pp_asset_unlocked_window_desc"
	self.types.unlocked_window.category = "mission_equipment"
	self.types.unlocked_window.icon = 41
	self.types.unlocked_window.total = 5
	self.types.unlocked_window.post_event = "gus_preplan_07"
	self.types.unlocked_window.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_unlocked_window")
	self.types.unlocked_window.budget_cost = 1
	self.types.unlocked_window.prio = 2
	self.types.highlight_keybox = {}
	self.types.highlight_keybox.name_id = "menu_pp_asset_highlight_keybox"
	self.types.highlight_keybox.desc_id = "menu_pp_asset_highlight_keybox_desc"
	self.types.highlight_keybox.category = "mission_equipment"
	self.types.highlight_keybox.icon = 43
	self.types.highlight_keybox.total = 1
	self.types.highlight_keybox.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_highlight_keybox")
	self.types.highlight_keybox.budget_cost = 2
	self.types.highlight_keybox.post_event = "gus_preplan_16"
	self.types.highlight_keybox.prio = 2
	self.types.ladder = {}
	self.types.ladder.name_id = "menu_pp_asset_ladder"
	self.types.ladder.category = "mission_equipment"
	self.types.ladder.total = 1
	self.types.ladder.post_event = "gus_preplan_07"
	self.types.ladder.prio = 2
	self.types.disable_camera = {}
	self.types.disable_camera.name_id = "menu_pp_asset_disable_camera"
	self.types.disable_camera.category = "surveillance"
	self.types.disable_camera.total = 1
	self.types.disable_camera.post_event = "gus_preplan_08"
	self.types.disable_camera.prio = 2
	self.types.disable_metal_detector = {}
	self.types.disable_metal_detector.name_id = "menu_pp_asset_disable_metal_detector"
	self.types.disable_metal_detector.category = "insider_help"
	self.types.disable_metal_detector.upgrade_lock = {
		category = "player",
		upgrade = "additional_assets"
	}
	self.types.disable_metal_detector.total = 1
	self.types.disable_metal_detector.post_event = "gus_preplan_10"
	self.types.disable_metal_detector.prio = 3
	self.types.disable_guards_cake = {}
	self.types.disable_guards_cake.name_id = "menu_pp_asset_disable_guards_cake"
	self.types.disable_guards_cake.desc_id = "menu_pp_asset_disable_guards_cake_desc"
	self.types.disable_guards_cake.category = "insider_help"
	self.types.disable_guards_cake.upgrade_lock = {
		category = "player",
		upgrade = "additional_assets"
	}
	self.types.disable_guards_cake.icon = 25
	self.types.disable_guards_cake.total = 1
	self.types.disable_guards_cake.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_cake")
	self.types.disable_guards_cake.budget_cost = 3
	self.types.disable_guards_cake.post_event = "gus_preplan_09"
	self.types.disable_guards_cake.prio = 1
	self.types.extra_cameras = {}
	self.types.extra_cameras.name_id = "menu_pp_asset_extra_cameras"
	self.types.extra_cameras.desc_id = "menu_pp_asset_extra_cameras_desc"
	self.types.extra_cameras.category = "surveillance"
	self.types.extra_cameras.look_angle = {
		angle = 80,
		color = Color(192, 255, 170, 0) / 255,
		length = 0.3
	}
	self.types.extra_cameras.icon = 11
	self.types.extra_cameras.total = 9
	self.types.extra_cameras.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_extracameras")
	self.types.extra_cameras.budget_cost = 1
	self.types.extra_cameras.post_event = "gus_preplan_16"
	self.types.extra_cameras.prio = 2
	self.types.keycard = {}
	self.types.keycard.name_id = "menu_pp_asset_keycard"
	self.types.keycard.desc_id = "menu_pp_asset_keycard_desc"
	self.types.keycard.category = "insider_help"
	self.types.keycard.upgrade_lock = {
		category = "player",
		upgrade = "additional_assets"
	}
	self.types.keycard.icon = 53
	self.types.keycard.total = 1
	self.types.keycard.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_keycard")
	self.types.keycard.budget_cost = 2
	self.types.keycard.post_event = "gus_preplan_16"
	self.types.keycard.prio = 2
	self.types.camera_access = {}
	self.types.camera_access.name_id = "menu_pp_camera_access"
	self.types.camera_access.desc_id = "menu_pp_camera_access_desc"
	self.types.camera_access.category = "surveillance"
	self.types.camera_access.icon = 24
	self.types.camera_access.total = 1
	self.types.camera_access.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_accesscameras")
	self.types.camera_access.budget_cost = 2
	self.types.camera_access.post_event = "gus_preplan_16"
	self.types.camera_access.prio = 8
	self.types.delay_police_10 = {}
	self.types.delay_police_10.name_id = "menu_pp_asset_delay_police_10"
	self.types.delay_police_10.desc_id = "menu_pp_asset_delay_police_10_desc"
	self.types.delay_police_10.delay_weapons_hot_t = 10
	self.types.delay_police_10.icon = 42
	self.types.delay_police_10.category = "data_hacking"
	self.types.delay_police_10.total = 1
	self.types.delay_police_10.post_event = "gus_preplan_04"
	self.types.delay_police_10.prio = 7
	self.types.delay_police_20 = {}
	self.types.delay_police_20.name_id = "menu_pp_asset_delay_police_20"
	self.types.delay_police_20.desc_id = "menu_pp_asset_delay_police_20_desc"
	self.types.delay_police_20.delay_weapons_hot_t = 20
	self.types.delay_police_20.icon = 42
	self.types.delay_police_20.category = "data_hacking"
	self.types.delay_police_20.total = 1
	self.types.delay_police_20.post_event = "gus_preplan_04"
	self.types.delay_police_20.prio = 6
	self.types.delay_police_30 = {}
	self.types.delay_police_30.name_id = "menu_pp_asset_delay_police_30"
	self.types.delay_police_30.desc_id = "menu_pp_asset_delay_police_30_desc"
	self.types.delay_police_30.delay_weapons_hot_t = 30
	self.types.delay_police_30.icon = 42
	self.types.delay_police_30.category = "data_hacking"
	self.types.delay_police_30.total = 1
	self.types.delay_police_30.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_delay30")
	self.types.delay_police_30.budget_cost = 2
	self.types.delay_police_30.post_event = "gus_preplan_10"
	self.types.delay_police_30.prio = 5
	self.types.delay_police_60 = {}
	self.types.delay_police_60.name_id = "menu_pp_asset_delay_police_60"
	self.types.delay_police_60.desc_id = "menu_pp_asset_delay_police_60_desc"
	self.types.delay_police_60.delay_weapons_hot_t = 60
	self.types.delay_police_60.icon = 42
	self.types.delay_police_60.category = "data_hacking"
	self.types.delay_police_60.total = 1
	self.types.delay_police_60.budget_cost = 4
	self.types.delay_police_60.post_event = "gus_preplan_04"
	self.types.delay_police_60.prio = 4
	self.types.reduce_timelock_60 = {}
	self.types.reduce_timelock_60.name_id = "menu_pp_asset_reduce_timelock_60"
	self.types.reduce_timelock_60.desc_id = "menu_pp_asset_reduce_timelock_60_desc"
	self.types.reduce_timelock_60.reduce_timelock_t = 60
	self.types.reduce_timelock_60.icon = 15
	self.types.reduce_timelock_60.category = "data_hacking"
	self.types.reduce_timelock_60.total = 1
	self.types.reduce_timelock_60.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_timelock60")
	self.types.reduce_timelock_60.budget_cost = 2
	self.types.reduce_timelock_60.post_event = "gus_preplan_10"
	self.types.reduce_timelock_60.prio = 3
	self.types.reduce_timelock_120 = {}
	self.types.reduce_timelock_120.name_id = "menu_pp_asset_reduce_timelock_120"
	self.types.reduce_timelock_120.desc_id = "menu_pp_asset_reduce_timelock_120_desc"
	self.types.reduce_timelock_120.reduce_timelock_t = 120
	self.types.reduce_timelock_120.icon = 15
	self.types.reduce_timelock_120.category = "data_hacking"
	self.types.reduce_timelock_120.total = 1
	self.types.reduce_timelock_120.budget_cost = 4
	self.types.reduce_timelock_120.post_event = "gus_preplan_10"
	self.types.reduce_timelock_120.prio = 2
	self.types.reduce_timelock_240 = {}
	self.types.reduce_timelock_240.name_id = "menu_pp_asset_reduce_timelock_240"
	self.types.reduce_timelock_240.desc_id = "menu_pp_asset_reduce_timelock_240_desc"
	self.types.reduce_timelock_240.reduce_timelock_t = 240
	self.types.reduce_timelock_240.icon = 15
	self.types.reduce_timelock_240.category = "data_hacking"
	self.types.reduce_timelock_240.total = 1
	self.types.reduce_timelock_240.budget_cost = 6
	self.types.reduce_timelock_240.post_event = "gus_preplan_10"
	self.types.reduce_timelock_240.prio = 1
	self.types.spycam = {}
	self.types.spycam.name_id = "menu_asset_spycam"
	self.types.spycam.desc_id = "menu_asset_spycam_desc"
	self.types.spycam.category = "surveillance"
	self.types.spycam.upgrade_lock = {
		category = "player",
		upgrade = "buy_spotter_asset"
	}
	self.types.spycam.look_angle = {
		angle = 80,
		color = Color(192, 255, 51, 51) / 255,
		length = 0.5
	}
	self.types.spycam.icon = 35
	self.types.spycam.total = 3
	self.types.spycam.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_spycam")
	self.types.spycam.budget_cost = 2
	self.types.spycam.post_event = "gus_preplan_14"
	self.types.spycam.prio = 3
	self.types.spotter = {}
	self.types.spotter.name_id = "menu_asset_spotter"
	self.types.spotter.category = "hired_help"
	self.types.spotter.upgrade_lock = {
		category = "player",
		upgrade = "buy_spotter_asset"
	}
	self.types.spotter.look_angle = {
		angle = 80,
		color = Color(192, 255, 51, 51) / 255,
		length = 0.5
	}
	self.types.spotter.icon = 33
	self.types.spotter.total = 1
	self.types.spotter.budget_cost = 2
	self.types.spotter.post_event = "gus_preplan_13"
	self.types.spotter.prio = 4
	self.types.sniper = {}
	self.types.sniper.name_id = "menu_pp_asset_sniper"
	self.types.sniper.desc_id = "menu_pp_asset_sniper_desc"
	self.types.sniper.category = "hired_help"
	self.types.sniper.icon = 55
	self.types.sniper.total = 1
	self.types.sniper.post_event = "gus_preplan_13"
	self.types.sniper.prio = 1
	self.types.sniper.cost = tweak_data:get_value("money_manager", "preplaning_mia_cost_sniper")
	self.types.sniper.budget_cost = 1
	self.types.delayed_police = {}
	self.types.delayed_police.name_id = "menu_pp_asset_delayed_police"
	self.types.delayed_police.desc_id = "menu_pp_asset_delayed_police_desc"
	self.types.delayed_police.category = "hired_help"
	self.types.delayed_police.icon = 15
	self.types.delayed_police.total = 1
	self.types.delayed_police.post_event = "gus_preplan_13"
	self.types.delayed_police.prio = 1
	self.types.delayed_police.cost = tweak_data:get_value("money_manager", "preplaning_mia_cost_delayed_police")
	self.types.delayed_police.budget_cost = 1
	self.types.reduce_mobsters = {}
	self.types.reduce_mobsters.name_id = "menu_pp_asset_reduce_mobsters"
	self.types.reduce_mobsters.desc_id = "menu_pp_asset_reduce_mobsters_desc"
	self.types.reduce_mobsters.category = "hired_help"
	self.types.reduce_mobsters.icon = 61
	self.types.reduce_mobsters.total = 1
	self.types.reduce_mobsters.post_event = "gus_preplan_13"
	self.types.reduce_mobsters.prio = 1
	self.types.reduce_mobsters.cost = tweak_data:get_value("money_manager", "preplaning_mia_cost_reduce_mobsters")
	self.types.reduce_mobsters.budget_cost = 1
	self.types.escape_van_loud = {}
	self.types.escape_van_loud.name_id = "menu_pp_escape_van_loud"
	self.types.escape_van_loud.desc_id = "menu_pp_escape_van_loud_desc"
	self.types.escape_van_loud.plan = "escape_plan"
	self.types.escape_van_loud.pos_not_important = false
	self.types.escape_van_loud.category = "escape_plan"
	self.types.escape_van_loud.total = 1
	self.types.escape_van_loud.cost = 0
	self.types.escape_van_loud.budget_cost = 0
	self.types.escape_van_loud.post_event = "gus_preplan_17"
	self.types.escape_van_loud.prio = 6
	self.types.escape_bus_loud = {}
	self.types.escape_bus_loud.name_id = "menu_pp_escape_bus_loud"
	self.types.escape_bus_loud.desc_id = "menu_pp_escape_bus_loud_desc"
	self.types.escape_bus_loud.plan = "escape_plan"
	self.types.escape_bus_loud.pos_not_important = false
	self.types.escape_bus_loud.category = "escape_plan"
	self.types.escape_bus_loud.icon = 54
	self.types.escape_bus_loud.total = 1
	self.types.escape_bus_loud.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_escapebig")
	self.types.escape_bus_loud.budget_cost = 6
	self.types.escape_bus_loud.post_event = "gus_preplan_17"
	self.types.escape_bus_loud.prio = 1
	self.types.escape_c4_loud = {}
	self.types.escape_c4_loud.name_id = "menu_pp_escape_c4_loud"
	self.types.escape_c4_loud.desc_id = "menu_pp_escape_c4_loud_desc"
	self.types.escape_c4_loud.plan = "escape_plan"
	self.types.escape_c4_loud.pos_not_important = false
	self.types.escape_c4_loud.category = "escape_plan"
	self.types.escape_c4_loud.icon = 54
	self.types.escape_c4_loud.total = 1
	self.types.escape_c4_loud.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_escapebig")
	self.types.escape_c4_loud.budget_cost = 6
	self.types.escape_c4_loud.post_event = "gus_preplan_17"
	self.types.escape_c4_loud.prio = 2
	self.types.escape_elevator_loud = {}
	self.types.escape_elevator_loud.name_id = "menu_pp_escape_elevator_loud"
	self.types.escape_elevator_loud.desc_id = "menu_pp_escape_elevator_loud_desc"
	self.types.escape_elevator_loud.plan = "escape_plan"
	self.types.escape_elevator_loud.pos_not_important = false
	self.types.escape_elevator_loud.category = "escape_plan"
	self.types.escape_elevator_loud.icon = 54
	self.types.escape_elevator_loud.total = 1
	self.types.escape_elevator_loud.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_escapebig")
	self.types.escape_elevator_loud.budget_cost = 6
	self.types.escape_elevator_loud.post_event = "gus_preplan_17"
	self.types.escape_elevator_loud.prio = 3
	self.types.escape_zipline_loud = {}
	self.types.escape_zipline_loud.name_id = "menu_pp_escape_zipline_loud"
	self.types.escape_zipline_loud.desc_id = "menu_pp_escape_zipline_loud_desc"
	self.types.escape_zipline_loud.plan = "escape_plan"
	self.types.escape_zipline_loud.pos_not_important = false
	self.types.escape_zipline_loud.category = "escape_plan"
	self.types.escape_zipline_loud.icon = 54
	self.types.escape_zipline_loud.total = 1
	self.types.escape_zipline_loud.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_zipline")
	self.types.escape_zipline_loud.budget_cost = 3
	self.types.escape_zipline_loud.post_event = "gus_preplan_17"
	self.types.escape_zipline_loud.prio = 2
	self.types.escape_helicopter_loud = {}
	self.types.escape_helicopter_loud.name_id = "menu_pp_escape_helicopter_loud"
	self.types.escape_helicopter_loud.desc_id = "menu_pp_escape_helicopter_loud_desc"
	self.types.escape_helicopter_loud.plan = "escape_plan"
	self.types.escape_helicopter_loud.pos_not_important = false
	self.types.escape_helicopter_loud.category = "escape_plan"
	self.types.escape_helicopter_loud.icon = 54
	self.types.escape_helicopter_loud.total = 1
	self.types.escape_helicopter_loud.cost = 0
	self.types.escape_helicopter_loud.budget_cost = 0
	self.types.escape_helicopter_loud.post_event = "gus_preplan_17"
	self.types.escape_helicopter_loud.prio = 3
	self.types.escape_aliens_loud = {}
	self.types.escape_aliens_loud.name_id = "menu_pp_escape_aliens_loud"
	self.types.escape_aliens_loud.desc_id = "menu_pp_escape_aliens_loud_desc"
	self.types.escape_aliens_loud.plan = "escape_plan"
	self.types.escape_aliens_loud.pos_not_important = false
	self.types.escape_aliens_loud.deployable_id = "ammo_bag"
	self.types.escape_aliens_loud.category = "escape_plan"
	self.types.escape_aliens_loud.total = 1
	self.types.escape_aliens_loud.cost = tweak_data:get_value("money_manager", "mission_asset_cost_large", 10)
	self.types.escape_aliens_loud.budget_cost = 10
	self.types.escape_aliens_loud.post_event = "gus_preplan_17"
	self.types.escape_aliens_loud.prio = 99
	self.types.vault_drill = {}
	self.types.vault_drill.name_id = "menu_pp_vault_drill"
	self.types.vault_drill.plan = "vault_plan"
	self.types.vault_drill.pos_not_important = false
	self.types.vault_drill.category = "vault_plan"
	self.types.vault_drill.total = 1
	self.types.vault_drill.cost = 0
	self.types.vault_drill.budget_cost = 0
	self.types.vault_drill.post_event = "gus_preplan_17"
	self.types.vault_drill.prio = 2
	self.types.vault_drill.prio = 5
	self.types.vault_c4 = {}
	self.types.vault_c4.name_id = "menu_pp_vault_c4"
	self.types.vault_c4.plan = "vault_plan"
	self.types.vault_c4.pos_not_important = false
	self.types.vault_c4.category = "vault_plan"
	self.types.vault_c4.total = 1
	self.types.vault_c4.cost = tweak_data:get_value("money_manager", "mission_asset_cost_large", 1)
	self.types.vault_c4.budget_cost = 4
	self.types.vault_c4.post_event = "gus_preplan_17"
	self.types.vault_c4.prio = 2
	self.types.vault_lance = {}
	self.types.vault_lance.name_id = "menu_pp_vault_lance"
	self.types.vault_lance.plan = "vault_plan"
	self.types.vault_lance.pos_not_important = false
	self.types.vault_lance.category = "vault_plan"
	self.types.vault_lance.icon = 12
	self.types.vault_lance.total = 1
	self.types.vault_lance.cost = 0
	self.types.vault_lance.budget_cost = 0
	self.types.vault_lance.post_event = "gus_preplan_17"
	self.types.vault_lance.prio = 5
	self.types.vault_big_drill = {}
	self.types.vault_big_drill.name_id = "menu_pp_vault_big_drill"
	self.types.vault_big_drill.desc_id = "menu_pp_vault_big_drill_desc"
	self.types.vault_big_drill.plan = "vault_plan"
	self.types.vault_big_drill.pos_not_important = false
	self.types.vault_big_drill.category = "vault_plan"
	self.types.vault_big_drill.icon = 12
	self.types.vault_big_drill.total = 1
	self.types.vault_big_drill.cost = 0
	self.types.vault_big_drill.budget_cost = 0
	self.types.vault_big_drill.post_event = "gus_preplan_17"
	self.types.vault_big_drill.prio = 5
	self.types.vault_thermite = {}
	self.types.vault_thermite.name_id = "menu_pp_vault_thermite"
	self.types.vault_thermite.desc_id = "menu_pp_vault_thermite_desc"
	self.types.vault_thermite.plan = "vault_plan"
	self.types.vault_thermite.pos_not_important = false
	self.types.vault_thermite.category = "vault_plan"
	self.types.vault_thermite.icon = 51
	self.types.vault_thermite.total = 1
	self.types.vault_thermite.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_thermite")
	self.types.vault_thermite.budget_cost = 8
	self.types.vault_thermite.post_event = "gus_preplan_02"
	self.types.vault_thermite.prio = 1
	self.types.vault_singularity = {}
	self.types.vault_singularity.name_id = "menu_pp_vault_singularity"
	self.types.vault_singularity.plan = "vault_plan"
	self.types.vault_singularity.pos_not_important = false
	self.types.vault_singularity.category = "vault_plan"
	self.types.vault_singularity.total = 1
	self.types.vault_singularity.cost = tweak_data:get_value("money_manager", "mission_asset_cost_large", 10)
	self.types.vault_singularity.budget_cost = 10
	self.types.vault_singularity.post_event = "gus_preplan_17"
	self.types.vault_singularity.prio = 99
	self.types.disable_alarm_button = {}
	self.types.disable_alarm_button.name_id = "menu_pp_asset_disable_alarm_button"
	self.types.disable_alarm_button.desc_id = "menu_pp_asset_disable_alarm_button_desc"
	self.types.disable_alarm_button.category = "data_hacking"
	self.types.disable_alarm_button.icon = 42
	self.types.disable_alarm_button.total = 1
	self.types.disable_alarm_button.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_disable_alarm_button")
	self.types.disable_alarm_button.budget_cost = 3
	self.types.disable_alarm_button.post_event = "gus_preplan_09"
	self.types.disable_alarm_button.prio = 1
	self.types.safe_escape = {}
	self.types.safe_escape.name_id = "menu_pp_asset_safe_escape"
	self.types.safe_escape.desc_id = "menu_pp_asset_safe_escape_desc"
	self.types.safe_escape.category = "insider_help"
	self.types.safe_escape.upgrade_lock = {
		category = "player",
		upgrade = "additional_assets"
	}
	self.types.safe_escape.icon = 54
	self.types.safe_escape.total = 1
	self.types.safe_escape.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_safe_escape")
	self.types.safe_escape.budget_cost = 3
	self.types.safe_escape.post_event = "gus_preplan_09"
	self.types.safe_escape.prio = 1
	self.types.sniper_spot = {}
	self.types.sniper_spot.name_id = "menu_pp_asset_sniper_spot"
	self.types.sniper_spot.desc_id = "menu_pp_asset_sniper_spot_desc"
	self.types.sniper_spot.category = "insider_help"
	self.types.sniper_spot.upgrade_lock = {
		category = "player",
		upgrade = "additional_assets"
	}
	self.types.sniper_spot.icon = 35
	self.types.sniper_spot.total = 1
	self.types.sniper_spot.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_sniper_spot")
	self.types.sniper_spot.budget_cost = 3
	self.types.sniper_spot.post_event = "gus_preplan_09"
	self.types.sniper_spot.prio = 1
	self.types.bag_shortcut = {}
	self.types.bag_shortcut.name_id = "menu_pp_asset_bag_shortcut"
	self.types.bag_shortcut.desc_id = "menu_pp_asset_bag_shortcut_desc"
	self.types.bag_shortcut.category = "mission_equipment"
	self.types.bag_shortcut.icon = 23
	self.types.bag_shortcut.total = 1
	self.types.bag_shortcut.post_event = "gus_preplan_07"
	self.types.bag_shortcut.prio = 1
	self.types.bag_shortcut.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_bag_shortcut")
	self.types.bag_shortcut.budget_cost = 2
	self.types.bag_zipline = {}
	self.types.bag_zipline.name_id = "menu_pp_asset_bag_zipline"
	self.types.bag_zipline.desc_id = "menu_pp_asset_bag_zipline_desc"
	self.types.bag_zipline.category = "mission_equipment"
	self.types.bag_zipline.icon = 23
	self.types.bag_zipline.total = 1
	self.types.bag_zipline.post_event = "gus_preplan_07"
	self.types.bag_zipline.prio = 1
	self.types.bag_zipline.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_bag_zipline")
	self.types.bag_zipline.budget_cost = 2
	self.types.loot_drop_off = {}
	self.types.loot_drop_off.name_id = "menu_pp_asset_loot_drop_off"
	self.types.loot_drop_off.desc_id = "menu_pp_asset_loot_drop_off_desc"
	self.types.loot_drop_off.category = "hired_help"
	self.types.loot_drop_off.icon = 23
	self.types.loot_drop_off.total = 1
	self.types.loot_drop_off.post_event = "gus_preplan_07"
	self.types.loot_drop_off.prio = 1
	self.types.loot_drop_off.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_loot_drop_off")
	self.types.loot_drop_off.budget_cost = 3
	self.types.thermal_paste = {}
	self.types.thermal_paste.name_id = "menu_pp_asset_thermal_paste"
	self.types.thermal_paste.desc_id = "menu_pp_asset_thermal_paste_desc"
	self.types.thermal_paste.category = "dead_drop"
	self.types.thermal_paste.icon = 51
	self.types.thermal_paste.total = 1
	self.types.thermal_paste.post_event = "gus_preplan_07"
	self.types.thermal_paste.prio = 1
	self.types.thermal_paste.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_thermal_paste")
	self.types.thermal_paste.budget_cost = 3
	self.types.thermal_paste.spawn_unit = "units/payday2/equipment/gen_equipment_thermal_paste_crate/gen_equipment_thermal_paste_crate"
end

function PrePlanningTweakData_37:_create_locations(tweak_data)
	self.upgrade_locks = {
		"none",
		"additional_assets"
	}
	self.dlc_locks = {"none", "big_bank"}
	self.location_groups = {
		"a",
		"b",
		"c",
		"d",
		"e",
		"f"
	}
	self.locations = {}
	self.locations.big = {
		default_plans = {
			escape_plan = "escape_helicopter_loud",
			vault_plan = "vault_big_drill"
		},
		total_budget = 10,
		mission_briefing_texture = "guis/textures/pd2/pre_planning/mission_briefing_big",
		start_location = {
			group = "a",
			x = 1500,
			y = 1025,
			zoom = 1.5
		},
		{
			name_id = "menu_pp_big_loc_a",
			texture = "guis/dlcs/big_bank/textures/pd2/pre_planning/big_lobby",
			map_x = -1.1,
			map_y = 0.5,
			map_size = 1,
			x1 = -250,
			y1 = -3000,
			x2 = 5750,
			y2 = 3000,
			rotation = 90,
			custom_points = {
				{
					x = 1500,
					y = 1025,
					text_id = "menu_pp_info_frontdoor",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "pln_pp_bb1_a"
				},
				{
					x = 800,
					y = 480,
					text_id = "menu_pp_info_backoffices",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "pln_pp_bb1_c"
				},
				{
					x = 1300,
					y = 1690,
					text_id = "menu_pp_info_garage",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "pln_pp_bb1_l"
				},
				{
					x = 1000,
					y = 1025,
					text_id = "menu_pp_info_mainhall",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "pln_pp_bb1_n"
				},
				{
					x = 1950,
					y = 350,
					text_id = "menu_pp_info_entrypoint",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "pln_pp_bb1_o"
				},
				{
					x = 90,
					y = 1024,
					text_id = "menu_pp_info_timelock",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "pln_pp_bb1_d"
				},
				{
					x = 348,
					y = 590,
					text_id = "menu_pp_info_securityroom",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "pln_pp_bb1_i"
				},
				{
					x = 574,
					y = 1742,
					text_id = "menu_pp_info_securityroom",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "pln_pp_bb1_i"
				}
			}
		},
		{
			name_id = "menu_pp_big_loc_b",
			texture = "guis/dlcs/big_bank/textures/pd2/pre_planning/big_level_2",
			map_x = 0,
			map_y = 0.5,
			map_size = 1,
			x1 = -250,
			y1 = -3000,
			x2 = 5750,
			y2 = 3000,
			rotation = 90,
			custom_points = {
				{
					x = 190,
					y = 1700,
					text_id = "menu_pp_info_mgroffices",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "pln_pp_bb1_k"
				},
				{
					x = 800,
					y = 480,
					text_id = "menu_pp_info_backoffices",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "pln_pp_bb1_c"
				},
				{
					x = 90,
					y = 1024,
					text_id = "menu_pp_info_timelock",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "pln_pp_bb1_d"
				},
				{
					x = 870,
					y = 1625,
					text_id = "menu_pp_info_ladder",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "pln_pp_bb1_b"
				},
				{
					x = 164,
					y = 1437,
					text_id = "menu_pp_info_securityroom",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "pln_pp_bb1_i"
				}
			}
		},
		{
			name_id = "menu_pp_big_loc_c",
			texture = "guis/dlcs/big_bank/textures/pd2/pre_planning/big_roof",
			map_x = 1.1,
			map_y = 0.5,
			map_size = 1,
			x1 = -250,
			y1 = -3000,
			x2 = 5750,
			y2 = 3000,
			rotation = 90,
			custom_points = {
				{
					x = 869,
					y = 1629,
					text_id = "menu_pp_info_ladder",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "pln_pp_bb1_b"
				},
				{
					x = 1356,
					y = 1164,
					text_id = "menu_pp_info_zipline",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "pln_pp_bb1_m"
				},
				{
					x = 782,
					y = 1458,
					text_id = "menu_pp_info_roof",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "pln_pp_bb1_h"
				}
			}
		},
		{
			name_id = "menu_pp_big_loc_d",
			texture = "guis/dlcs/big_bank/textures/pd2/pre_planning/big_level_vault_2",
			map_x = 0,
			map_y = -0.6,
			map_size = 1,
			x1 = -5771,
			y1 = -3000,
			x2 = 229,
			y2 = 3000,
			rotation = 90,
			custom_points = {
				{
					x = 1152,
					y = 1298,
					text_id = "menu_pp_info_vaultsecurity1",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "pln_pp_bb1_g"
				},
				{
					x = 1152,
					y = 746,
					text_id = "menu_pp_info_vaultsecurity2",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "pln_pp_bb1_g"
				},
				{
					x = 465,
					y = 1365,
					text_id = "menu_pp_info_vault",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "pln_pp_bb1_f"
				}
			}
		},
		{
			name_id = "menu_pp_big_loc_e",
			texture = "guis/dlcs/big_bank/textures/pd2/pre_planning/big_level_vault",
			map_x = -1.1,
			map_y = -0.6,
			map_size = 1,
			x1 = -5771,
			y1 = -3000,
			x2 = 229,
			y2 = 3000,
			rotation = 90,
			custom_points = {
				{
					x = 1154,
					y = 1015,
					text_id = "menu_pp_info_moneycounting",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "pln_pp_bb1_e"
				},
				{
					x = 465,
					y = 1365,
					text_id = "menu_pp_info_vault",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "pln_pp_bb1_f"
				}
			}
		}
	}
	self.locations.mia_1 = {
		default_plans = {},
		total_budget = 6,
		mission_briefing_texture = "guis/textures/pd2/pre_planning/mission_briefing_hlm1",
		start_location = {
			group = "a",
			x = 1024,
			y = 512,
			zoom = 1
		},
		grid_width_mul = 0.5,
		grid_height_mul = 1.4,
		{
			name_id = "menu_pp_mia_1_loc_a",
			texture = "guis/textures/pd2/pre_planning/hlm_01",
			map_x = -0.55,
			map_y = 0,
			map_width = 2,
			map_height = 1,
			x1 = -5524,
			y1 = -5358,
			x2 = 7476,
			y2 = 1142,
			rotation = 0,
			custom_points = {}
		},
		{
			name_id = "menu_pp_mia_1_loc_b",
			texture = "guis/textures/pd2/pre_planning/hlm_02",
			map_x = 1.05,
			map_y = -0.25,
			map_width = 1,
			map_height = 0.5,
			x1 = -1018,
			y1 = -4672,
			x2 = 7782,
			y2 = -272,
			rotation = 0,
			custom_points = {}
		},
		{
			name_id = "menu_pp_mia_1_loc_c",
			texture = "guis/textures/pd2/pre_planning/hlm_03",
			map_x = 1.05,
			map_y = 0.25,
			map_width = 1,
			map_height = 0.5,
			x1 = -1018,
			y1 = -4672,
			x2 = 7782,
			y2 = -272,
			rotation = 0,
			custom_points = {}
		}
	}
	self.locations.mia_2 = {
		default_plans = {},
		total_budget = 6,
		mission_briefing_texture = "guis/textures/pd2/pre_planning/mission_briefing_hlm2",
		grid_width_mul = 0.5,
		grid_height_mul = 0.5,
		start_location = {
			group = "a",
			x = 290,
			y = 835,
			zoom = 1.25
		},
		{
			name_id = "menu_pp_mia_2_loc_a",
			texture = "guis/textures/pd2/pre_planning/hlm2_01",
			map_x = 0,
			map_y = 1,
			map_width = 1,
			map_height = 1,
			x1 = -3050,
			y1 = -3275,
			x2 = 3850,
			y2 = 3625,
			rotation = 0,
			custom_points = {
				{
					x = 290,
					y = 840,
					text_id = "menu_pp_info_the_box",
					to_upper = true,
					icon = 45,
					rotation = 0,
					post_event = "Play_pln_pp_hm2_01"
				},
				{
					x = 423,
					y = 507,
					text_id = "menu_pp_info_bombstrapped",
					to_upper = true,
					icon = 45,
					rotation = 0,
					post_event = "Play_pln_pp_hm2_04"
				}
			}
		},
		{
			name_id = "menu_pp_mia_2_loc_b",
			texture = "guis/textures/pd2/pre_planning/hlm2_02",
			map_x = -1,
			map_y = 0,
			map_width = 1,
			map_height = 1,
			x1 = -3050,
			y1 = -3275,
			x2 = 3850,
			y2 = 3625,
			rotation = 0,
			custom_points = {}
		},
		{
			name_id = "menu_pp_mia_2_loc_c",
			texture = "guis/textures/pd2/pre_planning/hlm2_03",
			map_x = 0,
			map_y = 0,
			map_width = 1,
			map_height = 1,
			x1 = -3050,
			y1 = -3275,
			x2 = 3850,
			y2 = 3625,
			rotation = 0,
			custom_points = {}
		},
		{
			name_id = "menu_pp_mia_2_loc_d",
			texture = "guis/textures/pd2/pre_planning/hlm2_04",
			map_x = 1,
			map_y = 0,
			map_width = 1,
			map_height = 1,
			x1 = -3050,
			y1 = -3275,
			x2 = 3850,
			y2 = 3625,
			rotation = 0,
			custom_points = {}
		},
		{
			name_id = "menu_pp_mia_2_loc_e",
			texture = "guis/textures/pd2/pre_planning/hlm2_05",
			map_x = 0,
			map_y = -1,
			map_width = 1,
			map_height = 1,
			x1 = -3050,
			y1 = -3275,
			x2 = 3850,
			y2 = 3625,
			rotation = 0,
			custom_points = {
				{
					x = 300,
					y = 143,
					text_id = "menu_pp_info_vault_comm",
					to_upper = true,
					icon = 45,
					rotation = 0,
					post_event = "Play_pln_pp_hm2_02"
				},
				{
					x = 546,
					y = 143,
					text_id = "menu_pp_info_cocaine_mountain",
					to_upper = true,
					icon = 45,
					rotation = 0,
					post_event = "Play_pln_pp_hm2_03"
				}
			}
		}
	}
end

function PrePlanningTweakData_37:get_level_data(level_id)
	return self.locations[level_id] or {}
end
