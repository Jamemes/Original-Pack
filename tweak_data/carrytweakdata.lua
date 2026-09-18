CarryTweakData_37 = CarryTweakData_37 or class()

function CarryTweakData_37:init(tweak_data)
	self.value_multiplier = tweak_data.money_manager.bag_value_multiplier
	self.dye = {}
	self.dye.chance = 0.5
	self.dye.value_multiplier = 60
	self.types = {}
	self.types.being = {}
	self.types.being.move_speed_modifier = 0.5
	self.types.being.jump_modifier = 0.5
	self.types.being.can_run = false
	self.types.being.throw_distance_multiplier = 0.5
	self.types.mega_heavy = {}
	self.types.mega_heavy.move_speed_modifier = 0.25
	self.types.mega_heavy.jump_modifier = 0.25
	self.types.mega_heavy.can_run = false
	self.types.mega_heavy.throw_distance_multiplier = 0.125
	self.types.very_heavy = {}
	self.types.very_heavy.move_speed_modifier = 0.25
	self.types.very_heavy.jump_modifier = 0.25
	self.types.very_heavy.can_run = false
	self.types.very_heavy.throw_distance_multiplier = 0.3
	self.types.heavy = {}
	self.types.heavy.move_speed_modifier = 0.5
	self.types.heavy.jump_modifier = 0.5
	self.types.heavy.can_run = false
	self.types.heavy.throw_distance_multiplier = 0.5
	self.types.medium = {}
	self.types.medium.move_speed_modifier = 0.75
	self.types.medium.jump_modifier = 1
	self.types.medium.can_run = false
	self.types.medium.throw_distance_multiplier = 1
	self.types.light = {}
	self.types.light.move_speed_modifier = 1
	self.types.light.jump_modifier = 1
	self.types.light.can_run = true
	self.types.light.throw_distance_multiplier = 1
	self.types.coke_light = {}
	self.types.coke_light.move_speed_modifier = self.types.light.move_speed_modifier
	self.types.coke_light.jump_modifier = self.types.light.jump_modifier
	self.types.coke_light.can_run = self.types.light.can_run
	self.types.coke_light.throw_distance_multiplier = self.types.light.throw_distance_multiplier
	self.types.explosives = deep_clone(self.types.medium)
	self.types.explosives.can_explode = true
	self.small_loot = {}
	self.small_loot.money_bundle = tweak_data:get_value("money_manager", "small_loot", "money_bundle")
	self.small_loot.diamondheist_vault_bust = tweak_data:get_value("money_manager", "small_loot", "diamondheist_vault_bust")
	self.small_loot.diamondheist_vault_diamond = tweak_data:get_value("money_manager", "small_loot", "diamondheist_vault_diamond")
	self.small_loot.diamondheist_big_diamond = tweak_data:get_value("money_manager", "small_loot", "diamondheist_big_diamond")
	self.small_loot.value_gold = tweak_data:get_value("money_manager", "small_loot", "value_gold")
	self.small_loot.gen_atm = tweak_data:get_value("money_manager", "small_loot", "gen_atm")
	self.small_loot.special_deposit_box = tweak_data:get_value("money_manager", "small_loot", "special_deposit_box")
	self.small_loot.vault_loot_chest = tweak_data:get_value("money_manager", "small_loot", "vault_loot_chest")
	self.small_loot.vault_loot_diamond_chest = tweak_data:get_value("money_manager", "small_loot", "vault_loot_diamond_chest")
	self.small_loot.vault_loot_banknotes = tweak_data:get_value("money_manager", "small_loot", "vault_loot_banknotes")
	self.small_loot.vault_loot_silver = tweak_data:get_value("money_manager", "small_loot", "vault_loot_silver")
	self.small_loot.vault_loot_diamond_collection = tweak_data:get_value("money_manager", "small_loot", "vault_loot_diamond_collection")
	self.small_loot.vault_loot_trophy = tweak_data:get_value("money_manager", "small_loot", "vault_loot_trophy")
	self.small_loot.money_wrap_single_bundle_vscaled = tweak_data:get_value("money_manager", "small_loot", "money_wrap_single_bundle_vscaled")
	self.small_loot.spawn_bucket_of_money = tweak_data:get_value("money_manager", "small_loot", "spawn_bucket_of_money")
	self.small_loot.vault_loot_gold = tweak_data:get_value("money_manager", "small_loot", "vault_loot_gold")
	self.small_loot.vault_loot_cash = tweak_data:get_value("money_manager", "small_loot", "vault_loot_cash")
	self.small_loot.vault_loot_coins = tweak_data:get_value("money_manager", "small_loot", "vault_loot_coins")
	self.small_loot.vault_loot_ring = tweak_data:get_value("money_manager", "small_loot", "vault_loot_ring")
	self.small_loot.vault_loot_jewels = tweak_data:get_value("money_manager", "small_loot", "vault_loot_jewels")
	self.small_loot.vault_loot_macka = tweak_data:get_value("money_manager", "small_loot", "vault_loot_macka")
	self.gold = {}
	self.gold.type = "heavy"
	self.gold.name_id = "hud_carry_gold"
	self.gold.bag_value = "gold"
	self.gold.AI_carry = {SO_category = "enemies"}
	self.money = {}
	self.money.type = "medium"
	self.money.name_id = "hud_carry_money"
	self.money.bag_value = "money"
	self.money.dye = true
	self.money.AI_carry = {SO_category = "enemies"}
	self.diamonds = {}
	self.diamonds.type = "light"
	self.diamonds.name_id = "hud_carry_diamonds"
	self.diamonds.bag_value = "diamonds"
	self.diamonds.AI_carry = {SO_category = "enemies"}
	self.painting = {}
	self.painting.type = "light"
	self.painting.name_id = "hud_carry_painting"
	self.painting.bag_value = "painting"
	self.painting.visual_object = "g_canvas_bag"
	self.painting.unit = "units/payday2/pickups/gen_pku_canvasbag/gen_pku_canvasbag"
	self.painting.AI_carry = {SO_category = "enemies"}
	self.coke = {}
	self.coke.type = "coke_light"
	self.coke.name_id = "hud_carry_coke"
	self.coke.bag_value = "coke"
	self.coke.AI_carry = {SO_category = "enemies"}
	self.meth = {}
	self.meth.type = "coke_light"
	self.meth.name_id = "hud_carry_meth"
	self.meth.bag_value = "meth"
	self.meth.AI_carry = {SO_category = "enemies"}
	self.lance_bag = {}
	self.lance_bag.type = "medium"
	self.lance_bag.name_id = "hud_carry_lance_bag"
	self.lance_bag.skip_exit_secure = true
	self.lance_bag.visual_object = "g_toolsbag"
	self.lance_bag.unit = "units/payday2/pickups/gen_pku_toolbag/gen_pku_toolbag"
	self.lance_bag_large = {}
	self.lance_bag_large.type = "heavy"
	self.lance_bag_large.name_id = "hud_carry_huge_bag"
	self.lance_bag_large.skip_exit_secure = true
	self.lance_bag_large.visual_object = "g_toolsbag_large"
	self.lance_bag_large.unit = "units/payday2/pickups/gen_pku_toolbag_large/gen_pku_toolbag_large"
	self.cage_bag = {}
	self.cage_bag.type = "medium"
	self.cage_bag.name_id = "hud_carry_cage_bag"
	self.cage_bag.skip_exit_secure = true
	self.cage_bag.visual_object = "g_cagebag"
	self.cage_bag.unit = "units/payday2/pickups/gen_pku_cage_bag/gen_pku_cage_bag"
	self.weapon = {}
	self.weapon.type = "heavy"
	self.weapon.name_id = "hud_carry_weapon"
	self.weapon.bag_value = "weapons"
	self.weapons = {}
	self.weapons.type = "heavy"
	self.weapons.bag_value = "weapons"
	self.weapons.name_id = "hud_carry_weapons"
	self.grenades = {}
	self.grenades.type = "explosives"
	self.grenades.name_id = "hud_carry_grenades"
	self.grenades.bag_value = "weapons"
	self.grenades.visual_object = "g_explosives_bag"
	self.grenades.unit = "units/pd2_dlc1/pickups/gen_pku_explosivesbag/gen_pku_explosivesbag"
	self.grenades.AI_carry = {SO_category = "enemies"}
	self.person = {}
	self.person.type = "being"
	self.person.name_id = "hud_carry_person"
	self.person.unit = "units/payday2/pickups/gen_pku_bodybag/gen_pku_bodybag"
	self.person.visual_object = "g_body_bag"
	self.person.default_value = 1
	self.person.is_unique_loot = true
	self.person.skip_exit_secure = true
	self.special_person = {}
	self.special_person.type = "being"
	self.special_person.name_id = "hud_carry_special_person"
	self.special_person.unit = "units/payday2/pickups/gen_pku_bodybag/gen_pku_bodybag"
	self.special_person.default_value = 1
	self.special_person.is_unique_loot = true
	self.special_person.skip_exit_secure = true
	self.circuit = {}
	self.circuit.type = "heavy"
	self.circuit.name_id = "hud_carry_circuit"
	self.circuit.bag_value = "circuit"
	self.engine_01 = {}
	self.engine_01.type = "mega_heavy"
	self.engine_01.name_id = "hud_carry_engine_1"
	self.engine_01.skip_exit_secure = true
	self.engine_01.AI_carry = {SO_category = "enemies"}
	self.engine_02 = {}
	self.engine_02.type = "mega_heavy"
	self.engine_02.name_id = "hud_carry_engine_2"
	self.engine_02.skip_exit_secure = true
	self.engine_02.AI_carry = {SO_category = "enemies"}
	self.engine_03 = {}
	self.engine_03.type = "mega_heavy"
	self.engine_03.name_id = "hud_carry_engine_3"
	self.engine_03.skip_exit_secure = true
	self.engine_03.AI_carry = {SO_category = "enemies"}
	self.engine_04 = {}
	self.engine_04.type = "mega_heavy"
	self.engine_04.name_id = "hud_carry_engine_4"
	self.engine_04.skip_exit_secure = true
	self.engine_04.AI_carry = {SO_category = "enemies"}
	self.engine_05 = {}
	self.engine_05.type = "mega_heavy"
	self.engine_05.name_id = "hud_carry_engine_5"
	self.engine_05.skip_exit_secure = true
	self.engine_05.AI_carry = {SO_category = "enemies"}
	self.engine_06 = {}
	self.engine_06.type = "mega_heavy"
	self.engine_06.name_id = "hud_carry_engine_6"
	self.engine_06.skip_exit_secure = true
	self.engine_06.AI_carry = {SO_category = "enemies"}
	self.engine_07 = {}
	self.engine_07.type = "mega_heavy"
	self.engine_07.name_id = "hud_carry_engine_7"
	self.engine_07.skip_exit_secure = true
	self.engine_07.AI_carry = {SO_category = "enemies"}
	self.engine_08 = {}
	self.engine_08.type = "mega_heavy"
	self.engine_08.name_id = "hud_carry_engine_8"
	self.engine_08.skip_exit_secure = true
	self.engine_08.AI_carry = {SO_category = "enemies"}
	self.engine_09 = {}
	self.engine_09.type = "mega_heavy"
	self.engine_09.name_id = "hud_carry_engine_9"
	self.engine_09.skip_exit_secure = true
	self.engine_09.AI_carry = {SO_category = "enemies"}
	self.engine_10 = {}
	self.engine_10.type = "mega_heavy"
	self.engine_10.name_id = "hud_carry_engine_10"
	self.engine_10.skip_exit_secure = true
	self.engine_10.AI_carry = {SO_category = "enemies"}
	self.engine_11 = {}
	self.engine_11.type = "mega_heavy"
	self.engine_11.name_id = "hud_carry_engine_11"
	self.engine_11.skip_exit_secure = true
	self.engine_11.AI_carry = {SO_category = "enemies"}
	self.engine_12 = {}
	self.engine_12.type = "mega_heavy"
	self.engine_12.name_id = "hud_carry_engine_12"
	self.engine_12.skip_exit_secure = true
	self.engine_12.AI_carry = {SO_category = "enemies"}
	self.turret = {}
	self.turret.type = "heavy"
	self.turret.name_id = "hud_carry_turret"
	self.turret.bag_value = "turret"
	self.turret.AI_carry = {SO_category = "enemies"}
	self.ammo = {}
	self.ammo.type = "explosives"
	self.ammo.name_id = "hud_carry_ammo"
	self.ammo.bag_value = "shells"
	self.ammo.visual_object = "g_explosives_bag"
	self.ammo.unit = "units/pd2_dlc1/pickups/gen_pku_explosivesbag/gen_pku_explosivesbag"
	self.ammo.AI_carry = {SO_category = "enemies"}
	self.artifact_statue = {}
	self.artifact_statue.type = "very_heavy"
	self.artifact_statue.name_id = "hud_carry_artifact"
	self.artifact_statue.bag_value = "artifact_statue"
	self.artifact_statue.AI_carry = {SO_category = "enemies"}
	self.samurai_suit = {}
	self.samurai_suit.type = "medium"
	self.samurai_suit.name_id = "hud_carry_samurai"
	self.samurai_suit.bag_value = "samurai_suit"
	self.samurai_suit.AI_carry = {SO_category = "enemies"}
	self.equipment_bag = {}
	self.equipment_bag.type = "medium"
	self.equipment_bag.name_id = "hud_carry_equipment_bag"
	self.equipment_bag.skip_exit_secure = true
	self.equipment_bag.visual_object = "g_toolsbag"
	self.equipment_bag.unit = "units/payday2/pickups/gen_pku_toolbag/gen_pku_toolbag"
	self.equipment_bag.AI_carry = {SO_category = "enemies"}
end

function CarryTweakData_37:get_carry_ids()
	local t = {}
	for id, _ in pairs(tweak_data.carry) do
		if type(tweak_data.carry[id]) == "table" and tweak_data.carry[id].type then
			table.insert(t, id)
		end
	end
	return t
end

function CarryTweakData_37:get_zipline_offset(carry_id)
	local unit_name = tweak_data.carry[carry_id].unit or "units/payday2/pickups/gen_pku_lootbag/gen_pku_lootbag"
	if unit_name == "units/payday2/pickups/gen_pku_bodybag/gen_pku_bodybag" then
		return Vector3(0, 0, 163)
	elseif unit_name == "units/payday2/pickups/gen_pku_canvasbag/gen_pku_canvasbag" then
		return Vector3(0, 0, 180)
	end
	return Vector3(15, 0, 172)
end
