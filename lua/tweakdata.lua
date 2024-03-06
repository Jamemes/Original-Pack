local function get_mod_info()
	local file = io.open(ModPath .. "mod.txt", "r")
	if file then
		local info = json.decode(file:read("*all"))
		file:close()
		
		return info
	end
end

local self = tweak_data
local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"

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

self.killed_civs_penalty = {1, 2, 3}
self.max_loose_money_boost = 30 --%
self.loose_money_exp_convertation_amount = 30000

self.infamy.infamy_icons[5].color = Color("BEAA00")
self.screen_colors.max_money = Color(255, 121, 227, 177) / 255

self.difficulties[6] = "overkill_290"
self.difficulties[7] = "easy_wish"
self.difficulty_level_locks[6] = 80
self.difficulty_level_locks[7] = 95
self.difficulty_level_locks[8] = 95
self.experience_manager.difficulty_multiplier[4] = 13
self.experience_manager.difficulty_multiplier[5] = 20
self.experience_manager.difficulty_multiplier[6] = 25
self.money_manager.difficulty_multiplier_payout[5] = 13
self.money_manager.difficulty_multiplier_payout[6] = 15
self.money_manager.difficulty_multiplier_payout[7] = 18
self.money_manager.difficulty_multiplier[5] = 40
self.money_manager.difficulty_multiplier[4] = 45
self.money_manager.difficulty_multiplier[6] = 50
self.money_manager.mission_asset_cost_multiplier_by_risk[5] = 8
self.money_manager.mission_asset_cost_multiplier_by_risk[6] = 12
self.money_manager.mission_asset_cost_multiplier_by_risk[7] = 16

if difficulty == "easy_wish" or difficulty == "sm_wish" then
	self.gui.blackscreen_risk_textures.overkill_290 = "guis/textures/pd2/risklevel_deathwish_easywish_blackscreen"
	self.gui.blackscreen_risk_textures.easy_wish = "guis/textures/pd2/risklevel_deathwish_blackscreen"
	self.money_manager.killing_civilian_deduction = self.money_manager._create_value_table(10000, 250000, 10, true, 2)
	
	for _, settings in pairs(self.attention.settings) do
		if settings.verification_interval then
			settings.verification_interval = 0
		end
		
		if settings.relation ~= "friend" then
			if settings.notice_delay_mul then
				settings.notice_delay_mul = settings.notice_delay_mul / 3
			end
			
			if settings.max_range then
				settings.max_range = settings.max_range * 3
			end
			
			if settings.notice_requires_FOV then
				settings.notice_requires_FOV = false
			end
		end
	end
end

self.character.gensec.weapon = self.character.security.weapon
self.money_manager.buy_premium_multiplier = {
	easy = 0.5,
	normal = 0.75,
	hard = 1.25,
	overkill = 1.5,
	overkill_145 = 2,
	overkill_290 = 7,
	easy_wish = 4,
	sm_wish = 10
}
self.money_manager.buy_premium_static_fee = {
	easy = 100000,
	normal = 100000,
	hard = 150000,
	overkill = 200000,
	overkill_145 = 300000,
	overkill_290 = 1000000,
	easy_wish = 760000,
	sm_wish = 1300000
}

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

local function btn(tbl, name, class, index)
	for id, btn in pairs(tbl) do
		if btn[class or "name_id"] == name and id > (index or 0) then
			return id
		end
	end
end

local sidebar = tweak_data.gui.crime_net.sidebar
table.remove(sidebar, btn(sidebar, "menu_cn_side_jobs"))
table.remove(sidebar, btn(sidebar, "menu_cn_gage_assignment"))
table.remove(sidebar, btn(sidebar, "menu_cn_casino"))
table.remove(sidebar, btn(sidebar, "menu_cn_contact_info"))
table.remove(sidebar, btn(sidebar, "CrimeNetSidebarSeparator", "item_class", 5))

local special = tweak_data.gui.crime_net.special_contracts
table.remove(special, btn(special, "menu_cn_short"))
table.remove(special, btn(special, "menu_mutators"))
table.remove(special, btn(special, "cn_crime_spree"))
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

for _, poison in pairs(self.dot.dot_entries.poison) do
	if poison.dot_damage then
		poison.dot_damage = poison.dot_damage * 0.1
		poison.dot_trigger_chance = 0.5
	end
end

for _, fire in pairs(self.dot.dot_entries.fire) do
	if fire.dot_damage then
		fire.dot_damage = fire.dot_damage * 0.1
	end
	
	if fire.dot_trigger_chance then
		fire.dot_trigger_chance = fire.dot_trigger_chance * 0.5
	end
end

self.blackmarket.projectiles.chico_injector.base_cooldown = nil
self.blackmarket.projectiles.smoke_screen_grenade.base_cooldown = nil
self.blackmarket.projectiles.pocket_ecm_jammer.base_cooldown = nil

self.blackmarket.projectiles.chico_injector.max_amount = 3
self.blackmarket.projectiles.smoke_screen_grenade.max_amount = 3
self.blackmarket.projectiles.pocket_ecm_jammer.max_amount = 3
self.blackmarket.projectiles.concussion.max_amount = 3