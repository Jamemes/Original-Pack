LootDropTweakData_37 = LootDropTweakData_37 or class()

function LootDropTweakData_37:init(tweak_data)
	self.PC_STEP = 10
	self.no_drop = {}
	self.no_drop.BASE = 35
	self.no_drop.HUMAN_STEP_MODIFIER = 10
	self.joker_chance = 0
	self.level_limit = 1
	self.risk_pc_multiplier = {
		0,
		0,
		0,
		0
	}
	self.risk_infamous_multiplier = {
		1,
		2,
		3
	}
	self.PC_CHANCE = {}
	self.PC_CHANCE[1] = 0.7
	self.PC_CHANCE[2] = 0.7
	self.PC_CHANCE[3] = 0.7
	self.PC_CHANCE[4] = 0.7
	self.PC_CHANCE[5] = 0.9
	self.PC_CHANCE[6] = 0.91
	self.PC_CHANCE[7] = 0.92
	self.PC_CHANCE[8] = 0.93
	self.PC_CHANCE[9] = 0.94
	self.PC_CHANCE[10] = 0.95
	self.STARS = {}
	self.STARS[1] = {
		pcs = {10, 10}
	}
	self.STARS[2] = {
		pcs = {20, 20}
	}
	self.STARS[3] = {
		pcs = {30, 30}
	}
	self.STARS[4] = {
		pcs = {40, 40}
	}
	self.STARS[5] = {
		pcs = {40, 40}
	}
	self.STARS[6] = {
		pcs = {40, 40}
	}
	self.STARS[7] = {
		pcs = {40, 40}
	}
	self.STARS[8] = {
		pcs = {40, 40}
	}
	self.STARS[9] = {
		pcs = {40, 40}
	}
	self.STARS[10] = {
		pcs = {40, 40}
	}
	self.STARS_CURVES = {
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1
	}
	self.WEIGHTED_TYPE_CHANCE = {}
	local min = 10
	local max = 100
	local range = {
		cash = {20, 5},
		weapon_mods = {50, 45},
		colors = {6, 11},
		textures = {7, 12},
		materials = {7, 12},
		masks = {10, 15},
		xp = {8, 0}
	}
	for i = min, max, 10 do
		local cash = math.lerp(range.cash[1], range.cash[2], i / max)
		local weapon_mods = math.lerp(range.weapon_mods[1], range.weapon_mods[2], i / max)
		local colors = math.lerp(range.colors[1], range.colors[2], i / max)
		local textures = math.lerp(range.textures[1], range.textures[2], i / max)
		local materials = math.lerp(range.materials[1], range.materials[2], i / max)
		local masks = math.lerp(range.masks[1], range.masks[2], i / max)
		local xp = math.lerp(range.xp[1], range.xp[2], i / max)
		self.WEIGHTED_TYPE_CHANCE[i] = {
			cash = cash,
			weapon_mods = weapon_mods,
			colors = colors,
			textures = textures,
			materials = materials,
			masks = masks,
			xp = xp
		}
	end
	self.DEFAULT_WEIGHT = 1
	self.got_item_weight_mod = 0.5
	self.type_weight_mod_funcs = {}
	
	function self.type_weight_mod_funcs.weapon_mods(global_value, category, id)
		local weapons = managers.weapon_factory:get_weapons_uses_part(id) or {}
		local primaries = managers.blackmarket:get_crafted_category("primaries") or {}
		local secondaries = managers.blackmarket:get_crafted_category("secondaries") or {}
		local crafted_weapons = {}
		for _, weapon in pairs(primaries) do
			table.insert(crafted_weapons, weapon.factory_id)
		end
		for _, weapon in pairs(secondaries) do
			table.insert(crafted_weapons, weapon.factory_id)
		end
		table.list_union(crafted_weapons)
		for _, factory_id in pairs(weapons) do
			if table.contains(crafted_weapons, factory_id) then
				return 2
			end
		end
		return 1
	end
	
	self.global_value_category = {}
	self.global_value_category.normal = {}
	self.global_value_category.normal.name_id = "bm_global_value_normal"
	self.global_value_category.normal.sort_number = 0
	self.global_value_category.dlc = {}
	self.global_value_category.dlc.name_id = "bm_menu_dlc"
	self.global_value_category.dlc.sort_number = 10
	self.global_value_category.global_event = {}
	self.global_value_category.global_event.name_id = "bm_menu_global_event"
	self.global_value_category.global_event.sort_number = 20
	self.global_value_category.infamous = {}
	self.global_value_category.infamous.name_id = "bm_global_value_infamous"
	self.global_value_category.infamous.sort_number = 30
	self.global_values = {}
	self.global_values.normal = {}
	self.global_values.normal.name_id = "bm_global_value_normal"
	self.global_values.normal.desc_id = "menu_l_global_value_normal"
	self.global_values.normal.color = Color.white
	self.global_values.normal.dlc = false
	self.global_values.normal.chance = 0.84
	self.global_values.normal.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "normal")
	self.global_values.normal.durability_multiplier = 1
	self.global_values.normal.drops = true
	self.global_values.normal.track = false
	self.global_values.normal.sort_number = 0
	self.global_values.normal.category = "normal"
	self.global_values.superior = {}
	self.global_values.superior.name_id = "bm_global_value_superior"
	self.global_values.superior.desc_id = "menu_l_global_value_superior"
	self.global_values.superior.color = Color.blue
	self.global_values.superior.dlc = false
	self.global_values.superior.chance = 0.1
	self.global_values.superior.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "superior")
	self.global_values.superior.durability_multiplier = 1.5
	self.global_values.superior.drops = false
	self.global_values.superior.track = false
	self.global_values.superior.sort_number = 25
	self.global_values.superior.category = nil
	self.global_values.exceptional = {}
	self.global_values.exceptional.name_id = "bm_global_value_exceptional"
	self.global_values.exceptional.desc_id = "menu_l_global_value_exceptional"
	self.global_values.exceptional.color = Color.yellow
	self.global_values.exceptional.dlc = false
	self.global_values.exceptional.chance = 0.05
	self.global_values.exceptional.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "exceptional")
	self.global_values.exceptional.durability_multiplier = 2.25
	self.global_values.exceptional.drops = false
	self.global_values.exceptional.track = false
	self.global_values.exceptional.sort_number = 26
	self.global_values.exceptional.category = nil
	self.global_values.infamous = {}
	self.global_values.infamous.name_id = "bm_global_value_infamous"
	self.global_values.infamous.desc_id = "menu_l_global_value_infamous"
	self.global_values.infamous.color = Color(1, 0.1, 1)
	self.global_values.infamous.dlc = false
	self.global_values.infamous.chance = 0.05
	self.global_values.infamous.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "infamous")
	self.global_values.infamous.durability_multiplier = 3
	self.global_values.infamous.drops = true
	self.global_values.infamous.track = false
	self.global_values.infamous.sort_number = 30
	self.global_values.infamous.category = "infamous"
	self.global_values.infamy = {}
	self.global_values.infamy.name_id = "bm_global_value_infamous"
	self.global_values.infamy.desc_id = "menu_l_global_value_infamous"
	self.global_values.infamy.color = Color(1, 0.1, 1)
	self.global_values.infamy.dlc = false
	self.global_values.infamy.chance = 0.05
	self.global_values.infamy.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "infamous")
	self.global_values.infamy.durability_multiplier = 3
	self.global_values.infamy.drops = false
	self.global_values.infamy.track = false
	self.global_values.infamy.sort_number = 35
	self.global_values.infamy.hide_unavailable = true
	self.global_values.infamy.category = "infamous"
	self.global_values.preorder = {}
	self.global_values.preorder.name_id = "bm_global_value_preorder"
	self.global_values.preorder.desc_id = "menu_l_global_value_preorder"
	self.global_values.preorder.color = Color(255, 255, 212, 0) / 255
	self.global_values.preorder.dlc = true
	self.global_values.preorder.chance = 1
	self.global_values.preorder.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "preorder")
	self.global_values.preorder.durability_multiplier = 1
	self.global_values.preorder.drops = false
	self.global_values.preorder.track = true
	self.global_values.preorder.sort_number = -10
	self.global_values.preorder.hide_unavailable = true
	self.global_values.preorder.category = "dlc"
	self.global_values.pd2_clan = {}
	self.global_values.pd2_clan.name_id = "bm_global_value_pd2_clan"
	self.global_values.pd2_clan.desc_id = "menu_l_global_value_pd2_clan"
	self.global_values.pd2_clan.unlock_id = "bm_global_value_pd2_clan_unlock"
	self.global_values.pd2_clan.color = Color(255, 59, 174, 254) / 255
	self.global_values.pd2_clan.dlc = true
	self.global_values.pd2_clan.chance = 1
	self.global_values.pd2_clan.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "pd2_clan")
	self.global_values.pd2_clan.durability_multiplier = 1
	self.global_values.pd2_clan.drops = true
	self.global_values.pd2_clan.track = true
	self.global_values.pd2_clan.sort_number = -100
	self.global_values.pd2_clan.unique_lock_icon = "guis/textures/pd2/lock_community"
	self.global_values.pd2_clan.category = nil
	self.global_values.poetry_soundtrack = {}
	self.global_values.poetry_soundtrack.name_id = "bm_global_value_poetry_soundtrack"
	self.global_values.poetry_soundtrack.desc_id = "menu_l_global_value_poetry_soundtrack"
	self.global_values.poetry_soundtrack.unlock_id = "bm_global_value_poetry_soundtrack_unlock"
	self.global_values.poetry_soundtrack.color = Color(255, 255, 212, 0) / 255
	self.global_values.poetry_soundtrack.dlc = true
	self.global_values.poetry_soundtrack.chance = 1
	self.global_values.poetry_soundtrack.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "poetry_sountrack")
	self.global_values.poetry_soundtrack.durability_multiplier = 1
	self.global_values.poetry_soundtrack.drops = true
	self.global_values.poetry_soundtrack.track = true
	self.global_values.poetry_soundtrack.sort_number = 40
	self.global_values.poetry_soundtrack.hide_unavailable = false
	self.global_values.poetry_soundtrack.category = "dlc"
	self.global_values.halloween = {}
	self.global_values.halloween.name_id = "bm_global_value_halloween"
	self.global_values.halloween.desc_id = "menu_l_global_value_halloween"
	self.global_values.halloween.color = Color(255, 255, 145, 0) / 255
	self.global_values.halloween.dlc = false
	self.global_values.halloween.chance = 1
	self.global_values.halloween.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "halloween")
	self.global_values.halloween.durability_multiplier = 1
	self.global_values.halloween.drops = true
	self.global_values.halloween.track = true
	self.global_values.halloween.sort_number = 50
	self.global_values.halloween.hide_unavailable = true
	self.global_values.halloween.category = "global_event"
	self.global_values.xmas = {}
	self.global_values.xmas.name_id = "bm_global_value_xmas"
	self.global_values.xmas.desc_id = "menu_l_global_value_xmas"
	self.global_values.xmas.color = Color(255, 247, 86, 105) / 255
	self.global_values.xmas.dlc = false
	self.global_values.xmas.chance = 1
	self.global_values.xmas.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "xmas")
	self.global_values.xmas.durability_multiplier = 1
	self.global_values.xmas.drops = true
	self.global_values.xmas.track = true
	self.global_values.xmas.sort_number = 60
	self.global_values.xmas.hide_unavailable = true
	self.global_values.xmas.category = "global_event"
	self.global_values.twitch_pack = {}
	self.global_values.twitch_pack.name_id = "bm_global_value_twitch_pack"
	self.global_values.twitch_pack.desc_id = "menu_l_global_value_twitch_pack"
	self.global_values.twitch_pack.unlock_id = "bm_global_value_twitch_pack_unlock"
	self.global_values.twitch_pack.color = Color(255, 255, 145, 0) / 255
	self.global_values.twitch_pack.dlc = true
	self.global_values.twitch_pack.chance = 1
	self.global_values.twitch_pack.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "twitch_pack")
	self.global_values.twitch_pack.durability_multiplier = 1
	self.global_values.twitch_pack.drops = true
	self.global_values.twitch_pack.track = true
	self.global_values.twitch_pack.sort_number = 70
	self.global_values.twitch_pack.hide_unavailable = true
	self.global_values.twitch_pack.category = "global_event"
	self.global_values.xmas_soundtrack = {}
	self.global_values.xmas_soundtrack.name_id = "bm_global_value_xmas_soundtrack"
	self.global_values.xmas_soundtrack.desc_id = "menu_l_global_value_xmas_soundtrack"
	self.global_values.xmas_soundtrack.unlock_id = "bm_global_value_xmas_soundtrack_unlock"
	self.global_values.xmas_soundtrack.color = Color(255, 255, 212, 0) / 255
	self.global_values.xmas_soundtrack.dlc = true
	self.global_values.xmas_soundtrack.chance = 1
	self.global_values.xmas_soundtrack.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "xmas_soundtrack")
	self.global_values.xmas_soundtrack.durability_multiplier = 1
	self.global_values.xmas_soundtrack.drops = true
	self.global_values.xmas_soundtrack.track = true
	self.global_values.xmas_soundtrack.sort_number = 60
	self.global_values.xmas_soundtrack.hide_unavailable = false
	self.global_values.xmas_soundtrack.category = "dlc"
	self.global_values.armored_transport = {}
	self.global_values.armored_transport.name_id = "bm_global_value_armored_transport"
	self.global_values.armored_transport.desc_id = "menu_l_global_value_armored_transport"
	self.global_values.armored_transport.unlock_id = "bm_global_value_armored_transport_unlock"
	self.global_values.armored_transport.color = Color(255, 255, 212, 0) / 255
	self.global_values.armored_transport.dlc = true
	self.global_values.armored_transport.chance = 1
	self.global_values.armored_transport.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "armored_transport")
	self.global_values.armored_transport.durability_multiplier = 1
	self.global_values.armored_transport.drops = true
	self.global_values.armored_transport.track = true
	self.global_values.armored_transport.sort_number = 70
	self.global_values.armored_transport.category = "dlc"
	self.global_values.gage_pack = {}
	self.global_values.gage_pack.name_id = "bm_global_value_gage_pack"
	self.global_values.gage_pack.desc_id = "menu_l_global_value_gage_pack"
	self.global_values.gage_pack.unlock_id = "bm_global_value_gage_pack_unlock"
	self.global_values.gage_pack.color = Color(255, 255, 212, 0) / 255
	self.global_values.gage_pack.dlc = true
	self.global_values.gage_pack.chance = 1
	self.global_values.gage_pack.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "gage_pack")
	self.global_values.gage_pack.durability_multiplier = 1
	self.global_values.gage_pack.drops = true
	self.global_values.gage_pack.track = true
	self.global_values.gage_pack.sort_number = 80
	self.global_values.gage_pack.category = "dlc"
	self.global_values.gage_pack_lmg = {}
	self.global_values.gage_pack_lmg.name_id = "bm_global_value_gage_pack_lmg"
	self.global_values.gage_pack_lmg.desc_id = "menu_l_global_value_gage_pack_lmg"
	self.global_values.gage_pack_lmg.unlock_id = "bm_global_value_gage_pack_lmg_unlock"
	self.global_values.gage_pack_lmg.color = Color(255, 255, 212, 0) / 255
	self.global_values.gage_pack_lmg.dlc = true
	self.global_values.gage_pack_lmg.chance = 1
	self.global_values.gage_pack_lmg.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "gage_pack_lmg")
	self.global_values.gage_pack_lmg.durability_multiplier = 1
	self.global_values.gage_pack_lmg.drops = true
	self.global_values.gage_pack_lmg.track = true
	self.global_values.gage_pack_lmg.sort_number = 81
	self.global_values.gage_pack_lmg.category = "dlc"
	self.global_values.gage_pack_jobs = {}
	self.global_values.gage_pack_jobs.name_id = "bm_global_value_gage_pack_jobs"
	self.global_values.gage_pack_jobs.desc_id = "menu_l_global_value_gage_pack_jobs"
	self.global_values.gage_pack_jobs.unlock_id = "bm_global_value_gage_pack_jobs_unlock"
	self.global_values.gage_pack_jobs.color = Color(255, 255, 212, 0) / 255
	self.global_values.gage_pack_jobs.dlc = true
	self.global_values.gage_pack_jobs.chance = 1
	self.global_values.gage_pack_jobs.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "gage_pack_jobs")
	self.global_values.gage_pack_jobs.durability_multiplier = 1
	self.global_values.gage_pack_jobs.drops = true
	self.global_values.gage_pack_jobs.track = true
	self.global_values.gage_pack_jobs.sort_number = 82
	self.global_values.gage_pack_jobs.category = "dlc"
	self.global_values.gage_pack_snp = {}
	self.global_values.gage_pack_snp.name_id = "bm_global_value_gage_pack_snp"
	self.global_values.gage_pack_snp.desc_id = "menu_l_global_value_gage_pack_snp"
	self.global_values.gage_pack_snp.unlock_id = "bm_global_value_gage_pack_snp_unlock"
	self.global_values.gage_pack_snp.color = Color(255, 255, 212, 0) / 255
	self.global_values.gage_pack_snp.dlc = true
	self.global_values.gage_pack_snp.chance = 1
	self.global_values.gage_pack_snp.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "gage_pack_snp")
	self.global_values.gage_pack_snp.durability_multiplier = 1
	self.global_values.gage_pack_snp.drops = true
	self.global_values.gage_pack_snp.track = true
	self.global_values.gage_pack_snp.sort_number = 83
	self.global_values.gage_pack_snp.category = "dlc"
	self.global_values.big_bank = {}
	self.global_values.big_bank.name_id = "bm_global_value_big_bank_snp"
	self.global_values.big_bank.desc_id = "menu_l_global_value_big_bank_snp"
	self.global_values.big_bank.unlock_id = "bm_global_value_big_bank_snp_unlock"
	self.global_values.big_bank.color = Color(255, 255, 212, 0) / 255
	self.global_values.big_bank.dlc = true
	self.global_values.big_bank.chance = 1
	self.global_values.big_bank.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "big_bank")
	self.global_values.big_bank.durability_multiplier = 1
	self.global_values.big_bank.drops = true
	self.global_values.big_bank.track = true
	self.global_values.big_bank.sort_number = 84
	self.global_values.big_bank.category = "dlc"
	self.global_values.gage_pack_shotgun = {}
	self.global_values.gage_pack_shotgun.name_id = "bm_global_value_gage_pack_shotgun"
	self.global_values.gage_pack_shotgun.desc_id = "menu_l_global_value_gage_pack_shotgun"
	self.global_values.gage_pack_shotgun.unlock_id = "bm_global_value_gage_pack_shotgun_unlock"
	self.global_values.gage_pack_shotgun.color = Color(255, 255, 212, 0) / 255
	self.global_values.gage_pack_shotgun.dlc = true
	self.global_values.gage_pack_shotgun.chance = 1
	self.global_values.gage_pack_shotgun.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "gage_pack_shotgun")
	self.global_values.gage_pack_shotgun.durability_multiplier = 1
	self.global_values.gage_pack_shotgun.drops = true
	self.global_values.gage_pack_shotgun.track = true
	self.global_values.gage_pack_shotgun.sort_number = 85
	self.global_values.gage_pack_shotgun.category = "dlc"
	self.global_values.gage_pack_assault = {}
	self.global_values.gage_pack_assault.name_id = "bm_global_value_gage_pack_assault"
	self.global_values.gage_pack_assault.desc_id = "menu_l_global_value_gage_pack_assault"
	self.global_values.gage_pack_assault.unlock_id = "bm_global_value_gage_pack_assault_unlock"
	self.global_values.gage_pack_assault.color = Color(255, 255, 212, 0) / 255
	self.global_values.gage_pack_assault.dlc = true
	self.global_values.gage_pack_assault.chance = 1
	self.global_values.gage_pack_assault.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "gage_pack_assault")
	self.global_values.gage_pack_assault.durability_multiplier = 1
	self.global_values.gage_pack_assault.drops = true
	self.global_values.gage_pack_assault.track = true
	self.global_values.gage_pack_assault.sort_number = 86
	self.global_values.gage_pack_assault.category = "dlc"
	self.global_values.hl_miami = {}
	self.global_values.hl_miami.name_id = "bm_global_value_hl_miami"
	self.global_values.hl_miami.desc_id = "menu_l_global_value_hl_miami"
	self.global_values.hl_miami.unlock_id = "bm_global_value_hl_miami_unlock"
	self.global_values.hl_miami.color = Color(255, 255, 212, 0) / 255
	self.global_values.hl_miami.dlc = true
	self.global_values.hl_miami.chance = 1
	self.global_values.hl_miami.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "hl_miami")
	self.global_values.hl_miami.durability_multiplier = 1
	self.global_values.hl_miami.drops = true
	self.global_values.hl_miami.track = true
	self.global_values.hl_miami.sort_number = 87
	self.global_values.hl_miami.category = "dlc"
	self.global_values.hlm_game = {}
	self.global_values.hlm_game.name_id = "bm_global_value_hlm_game"
	self.global_values.hlm_game.desc_id = "menu_l_global_value_hlm_game"
	self.global_values.hlm_game.unlock_id = "bm_global_value_hlm_game_unlock"
	self.global_values.hlm_game.color = Color(255, 255, 212, 0) / 255
	self.global_values.hlm_game.dlc = true
	self.global_values.hlm_game.chance = 1
	self.global_values.hlm_game.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "hlm_game")
	self.global_values.hlm_game.durability_multiplier = 1
	self.global_values.hlm_game.drops = true
	self.global_values.hlm_game.track = true
	self.global_values.hlm_game.sort_number = 88
	self.global_values.hlm_game.unique_lock_icon = "guis/textures/pd2/blackmarket/money_lock"
	self.global_values.hlm_game.category = "normal"
	self.global_values.legendary = {}
	self.global_values.legendary.name_id = "bm_global_value_legendary"
	self.global_values.legendary.desc_id = "menu_l_global_value_legendary"
	self.global_values.legendary.color = Color(255, 0, 255, 212) / 255
	self.global_values.legendary.dlc = false
	self.global_values.legendary.chance = 1
	self.global_values.legendary.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "legendary")
	self.global_values.legendary.durability_multiplier = 1
	self.global_values.legendary.drops = false
	self.global_values.legendary.track = false
	self.global_values.legendary.sort_number = 50
	self.global_values.legendary.category = nil
	self.global_values.sweettooth = {}
	self.global_values.sweettooth.name_id = "bm_global_value_sweettooth"
	self.global_values.sweettooth.desc_id = "menu_l_global_value_sweettooth"
	self.global_values.sweettooth.unlock_id = "bm_global_value_sweettooth_unlock"
	self.global_values.sweettooth.color = Color(255, 59, 174, 254) / 255
	self.global_values.sweettooth.dlc = true
	self.global_values.sweettooth.chance = 1
	self.global_values.sweettooth.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "sweettooth")
	self.global_values.sweettooth.durability_multiplier = 1
	self.global_values.sweettooth.drops = true
	self.global_values.sweettooth.track = true
	self.global_values.sweettooth.sort_number = 200
	self.global_values.sweettooth.category = nil
	self.global_value_list_index = {
		"normal",
		"infamous",
		"pre_order",
		"pd2_clan",
		"halloween",
		"xmas",
		"armored_transport",
		"gage_pack",
		"gage_pack_lmg",
		"gage_pack_jobs",
		"gage_pack_snp",
		"poetry_soundtrack",
		"big_bank",
		"gage_pack_shotgun",
		"gage_pack_assault",
		"hl_miami",
		"hlm_game"
	}
	self:_create_global_value_list_map()
end

function LootDropTweakData_37:_create_global_value_list_map()
	self.global_value_list_map = {}
	for i, d in ipairs(self.global_value_list_index) do
		self.global_value_list_map[d] = i
	end
end
