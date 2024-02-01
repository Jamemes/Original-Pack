local function get_mod_info()
	local file = io.open(ModPath .. "mod.txt", "r")
	if file then
		local info = json.decode(file:read("*all"))
		file:close()
		
		return info
	end
end

local self = tweak_data
self.version = get_mod_info().version

self.hate_multipler = 1.5
self.bullet_hit_alert_radius = 300
self.footstep_alert_radius = 450
self.whisper_alert_radius = 450
self.neighbours_alert_radius_trigger = 2500
self.neighbours_trigger_delay = math.random(3, 7)
self.drill_investigate_zone_multipler = 1.25 							-- чем больше радиус проверки, тем меньше радиус шума

local pro_rank = 5
self.unlock_safehouse = pro_rank
self.unlock_crimespree = pro_rank
self.unlock_skirmish = pro_rank
self.unlock_profiles = pro_rank
self.unlock_mayhem = pro_rank
self.unlock_death_sentence = 20

self.easy_wish_drop_chance = 0.175
self.sm_wish_drop_chance = 0.15

self.max_offshore = 1000000000
self.max_spending_cash = 150000000
self.max_coins = 250000

self.killed_civs_penalty = {1, 2, 3}
self.easy_mode_exp_penalty = 50 --%
self.max_loose_money_boost = 30 --%
self.loose_money_exp_convertation_amount = 30000

self.quickplay.default_level_diff = {100, 100}
self.quickplay.max_level_diff = {100, 100}

self.infamy.infamy_icons[5].color = Color("BEAA00")
self.screen_colors.max_money = Color(255, 121, 227, 177) / 255

self.experience_manager.loot_drop_value.xp10 = 130000
self.experience_manager.loot_drop_value.xp20 = 150000
self.experience_manager.loot_drop_value.xp30 = 170000
self.experience_manager.loot_drop_value.xp40 = 200000
self.experience_manager.loot_drop_value.xp50 = 230000
self.experience_manager.loot_drop_value.xp60 = 260000
self.experience_manager.loot_drop_value.xp70 = 300000
self.experience_manager.loot_drop_value.xp80 = 350000
self.experience_manager.loot_drop_value.xp90 = 390000
self.experience_manager.loot_drop_value.xp100 = 430000
self.experience_manager.difficulty_multiplier[4] = 20
self.experience_manager.difficulty_multiplier[6] = 25

self.assets.risk_death_wish.risk_lock = 4
self.assets.risk_easy_wish.risk_lock = 5

self.preplanning.types.escape_c4_loud.budget_cost = 6
self.preplanning.types.escape_elevator_loud.budget_cost = 6
self.preplanning.types.vault_thermite.budget_cost = 8

if Global.job_manager and Global.job_manager.interupt_stage == "arm_for" then
	self.carry.lance_bag.visual_unit_name = "units/payday2/characters/npc_acc_loot_bag_1/npc_acc_loot_bag_1"
	self.carry.ammo.visual_unit_name = "units/payday2/characters/npc_acc_loot_bag_1/npc_acc_loot_bag_1"
end

if Global.game_settings and Global.game_settings.level_id == "sah" then
	self.carry.mus_artifact.bag_value = "sah_artifact_bag"
end

self.carry.diamonds_dah.bag_value = "stones"
self.carry.engine_01.type = "mega_heavy"
self.carry.engine_02.type = "mega_heavy"
self.carry.engine_03.type = "mega_heavy"
self.carry.engine_04.type = "mega_heavy"
self.carry.engine_05.type = "mega_heavy"
self.carry.engine_06.type = "mega_heavy"
self.carry.engine_07.type = "mega_heavy"
self.carry.engine_08.type = "mega_heavy"
self.carry.engine_09.type = "mega_heavy"
self.carry.engine_10.type = "mega_heavy"
self.carry.engine_11.type = "mega_heavy"
self.carry.engine_12.type = "mega_heavy"

self.carry.types.careful = {
	move_speed_modifier = 0.7,
	jump_modifier = 1,
	can_run = false,
	throw_distance_multiplier = 0.25
}
self.carry.ammo.type = "careful"

self.mission_door.train_cargo_door.devices.drill = {
	{
		align = "a_drill",
		unit = Idstring("units/payday2/equipment/item_door_drill_small/item_door_drill_small"),
		can_jam = true,
		timer = 180
	}
}
self.mission_door.reinforced_door_single.devices.c4[1].unit = Idstring("units/payday2/equipment/gen_equipment_shape_charge/gen_equipment_shape_charge")
self.mission_door.keycard_door_single.devices.c4[1].unit = Idstring("units/payday2/equipment/gen_equipment_shape_charge/gen_equipment_shape_charge")
self.mission_door.keycard_door_single.devices.c4[2].unit = Idstring("units/payday2/equipment/gen_equipment_shape_charge/gen_equipment_shape_charge")
self.mission_door.cage_door_deluxe.devices.c4[1].unit = Idstring("units/payday2/equipment/gen_equipment_shape_charge/gen_equipment_shape_charge")
self.mission_door.cage_door_deluxe_non_jamming.devices.c4[1].unit = Idstring("units/payday2/equipment/gen_equipment_shape_charge/gen_equipment_shape_charge")

self.safehouse.prices = {
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
self.safehouse.rewards = {
	initial = self.safehouse.prices.rooms[2] * 1,
	challenge = 1,
	daily_complete = 1,
	raid = 2,
	experience_ratio = 3900000
}

local function btn(tbl, name)
	for id, btn in pairs(tbl) do
		if btn.name_id == name then
			return id
		end
	end
end

local sidebar = tweak_data.gui.crime_net.sidebar
table.remove(sidebar, btn(sidebar, "menu_cn_side_jobs"))
table.remove(sidebar, btn(sidebar, "menu_cn_gage_assignment"))
table.remove(sidebar, btn(sidebar, "menu_cn_casino"))
table.remove(sidebar, btn(sidebar, "menu_cn_contact_info"))

local special = tweak_data.gui.crime_net.special_contracts
table.remove(special, btn(special, "menu_cn_short"))
table.remove(special, btn(special, "menu_mutators"))
table.remove(special, btn(special, "cn_crime_spree"))
table.remove(special, btn(special, "menu_cn_challenge"))

special[btn(special, "menu_cn_casino")].x = 347
special[btn(special, "menu_cn_casino")].y = 716
special[btn(special, "menu_cn_premium_buy")].menu_node = "crimenet_contract_special"

for id, _ in pairs(tweak_data.projectiles) do
	local projectile = tweak_data.projectiles[id]
	if projectile.damage then
	
		if projectile.damage >= 500 then
			projectile.damage = math.round(projectile.damage / 1.25)
		elseif projectile.damage >= 200 then
			projectile.damage = math.round(projectile.damage * 0.325)
		elseif projectile.damage >= 140 then
			projectile.damage = math.round(projectile.damage * 0.1875)
		elseif projectile.damage >= 48 then
			projectile.damage = math.round(projectile.damage * 0.2615)
		elseif projectile.damage >= 30 then
			projectile.damage = math.round(projectile.damage * 0.285)
		end
		
		if projectile.bullet_class == "InstantExplosiveBulletBase" then
			if projectile.damage >= 26 then
				projectile.damage = math.round(projectile.damage * 3.269)
			elseif projectile.damage >= 20 then
				projectile.damage = math.round(projectile.damage * 1.575)
			else
				projectile.damage = math.round(projectile.damage * 1.153)
			end
		end
	end
	
	-- if projectile.fire_dot_data then
		-- projectile.fire_dot_data.dot_damage = 1
		-- projectile.fire_dot_data.dot_length = 3
	-- end
	
	if projectile.range then
		if projectile.range >= 50 then
			projectile.range = projectile.range * 2
		end
	end
end

self.projectiles.launcher_frag_china.damage = 34
self.projectiles.launcher_frag_arbiter.damage = 17
self.projectiles.west_arrow.damage = 19.5
self.projectiles.west_arrow_exp.damage = 26
self.projectiles.bow_poison_arrow.damage = 6.5
self.projectiles.crossbow_poison_arrow.damage = 3.2
self.projectiles.wpn_prj_jav.damage = 110
self.projectiles.arblast_arrow.damage = 52.5
self.projectiles.arblast_poison_arrow.damage = 19.6
self.projectiles.arblast_arrow_exp.damage = 70
self.projectiles.frankish_arrow.damage = 24
self.projectiles.frankish_poison_arrow.damage = 9
self.projectiles.frankish_arrow_exp.damage = 31.5
self.projectiles.long_poison_arrow.damage = 30
self.projectiles.wpn_prj_hur.damage = 10
self.projectiles.wpn_prj_target.damage = 10
self.projectiles.frag_com.damage = 30
self.projectiles.rocket_ray_frag.damage = 500
self.projectiles.ecp_arrow.damage = 24
self.projectiles.ecp_arrow_poison.damage = 9
self.projectiles.ecp_arrow_exp.damage = 31.5
self.projectiles.elastic_arrow_poison.damage = 30
-- self.dot_types.poison.dot_length = 10
-- self.dot_types.poison.dot_damage = 2
-- self.dot_types.poison.hurt_animation_chance = 0.5