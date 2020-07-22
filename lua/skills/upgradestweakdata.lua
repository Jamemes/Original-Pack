local data = UpgradesTweakData.init
function UpgradesTweakData:init(tweak_data)
	data(self, tweak_data)
		self.level_tree = {
		[0] = {
			upgrades = {
				"wpn_dallas_mask",
				"clean",
				"aziz"
			}
		},
		{
			name_id = "body_armor",
			upgrades = {
				"body_armor2"
			}
		},
		{
			name_id = "weapons",
			upgrades = {
				"new_m4",
				"colt_1911",
				"mac10",
				"ak74",
				"hajk",
				"corgi"
			}
		},
		{
			name_id = "weapons",
			upgrades = {
				"spatula",
				"fork",
				"boot"
			}
		},
		{
			name_id = "weapons",
			upgrades = {
				"shovel",
				"frag_com",
				"nin",
				"fir_com",
				"dada_com",
				"frag",
				"dynamite",
				"molotov"
			}
		},
		[6] = {
			name_id = "weapons",
			upgrades = {
				"new_raging_bull",
				"b92fs"
			}
		},
		[7] = {
			name_id = "body_armor",
			upgrades = {
				"body_armor1",
				"moneybundle"
			}
		},
		[8] = {
			name_id = "weapons",
			upgrades = {
				"r870",
				"aug",
				"fight"
			}
		},
		[10] = {
			name_id = "lvl_10",
			upgrades = {
				"rep_upgrade1",
				"cutters",
				"shawn"
			}
		},
		[12] = {
			name_id = "body_armor3",
			upgrades = {
				"body_armor3",
				"cobray",
				"boxcutter"
			}
		},
		[13] = {
			name_id = "weapons",
			upgrades = {
				"new_mp5",
				"serbu",
				"microphone",
				"selfie"
			}
		},
		[14] = {
			name_id = "weapons",
			upgrades = {
				"bayonet",
				"m1928",
				"sparrow",
				"gator",
				"pl14"
			}
		},
		[15] = {
			name_id = "weapons",
			upgrades = {
				"msr",
				"benelli",
				"road",
				"legacy"
			}
		},
		[16] = {
			name_id = "weapons",
			upgrades = {
				"akm",
				"g36",
				"iceaxe",
				"zeus",
				"flint",
				"oxide",
				"sword"
			}
		},
		[17] = {
			name_id = "weapons",
			upgrades = {
				"akm_gold",
				"baton",
				"slot_lever"
			}
		},
		[18] = {
			name_id = "weapons",
			upgrades = {
				"baseballbat",
				"scorpion",
				"oldbaton",
				"hockey",
				"meter",
				"hauteur",
				"shock",
				"fear"
			}
		},
		[19] = {
			name_id = "weapons",
			upgrades = {
				"olympic",
				"mp9",
				"baka",
				"pugio",
				"ballistic"
			}
		},
		[20] = {
			name_id = "lvl_20",
			upgrades = {
				"rep_upgrade2",
				"schakal",
				"agave",
				"happy",
				"shepheard",
				"slap"
			}
		},
		[21] = {
			name_id = "body_armor4",
			upgrades = {
				"body_armor4",
				"kampfmesser",
				"buck",
				"tecci",
				"wing"
			}
		},
		[22] = {
			name_id = "community_item",
			upgrades = {
				"g22c",
				"ksg",
				"branding_iron",
				"detector",
				"croupier_rake"
			}
		},
		[23] = {
			name_id = "weapons",
			upgrades = {
				"bullseye",
				"c96",
				"par",
				"m37",
				"rota",
				"cs",
				"brick",
				"ostry"
			}
		},
		[24] = {
			name_id = "weapons",
			upgrades = {
				"model24",
				"l85a2",
				"scalper",
				"switchblade"
			}
		},
		[25] = {
			name_id = "weapons",
			upgrades = {
				"boxing_gloves",
				"meat_cleaver",
				"wpn_prj_four",
				"sr2",
				"grip",
				"push",
				"breech",
				"ching",
				"erma",
				"sap"
			}
		},
		[26] = {
			name_id = "weapons",
			upgrades = {
				"new_m14",
				"saiga",
				"sandsteel",
				"packrat",
				"lemming",
				"chinchilla"
			}
		},
		[27] = {
			name_id = "weapons",
			upgrades = {
				"famas",
				"g26",
				"twins",
				"pitchfork",
				"shrew",
				"basset"
			}
		},
		[28] = {
			name_id = "weapons",
			upgrades = {
				"hs2000",
				"vhs",
				"bowie",
				"micstand"
			}
		},
		[29] = {
			name_id = "weapons",
			upgrades = {
				"akmsu",
				"glock_18c",
				"asval",
				"beer",
				"czech",
				"stech"
			}
		},
		[30] = {
			name_id = "lvl_30",
			upgrades = {
				"rep_upgrade3"
			}
		},
		[31] = {
			name_id = "body_armor5",
			upgrades = {
				"body_armor5",
				"chef",
				"peacemaker",
				"wpn_prj_ace"
			}
		},
		[32] = {
			name_id = "weapons",
			upgrades = {
				"x46",
				"tec9",
				"tiger",
				"model70"
			}
		},
		[33] = {
			name_id = "weapons",
			upgrades = {
				"ak5",
				"striker",
				"wa2000",
				"beardy",
				"catch"
			}
		},
		[34] = {
			name_id = "weapons",
			upgrades = {
				"galil",
				"cleaver",
				"mateba",
				"taser",
				"desertfox",
				"wpn_prj_target",
				"tti"
			}
		},
		[35] = {
			name_id = "weapons",
			upgrades = {
				"r93",
				"judge",
				"mining_pick",
				"wing"
			}
		},
		[36] = {
			name_id = "weapons",
			upgrades = {
				"p90",
				"deagle",
				"winchester1874"
			}
		},
		[37] = {
			name_id = "weapons",
			upgrades = {
				"shillelagh",
				"hammer",
				"stick"
			}
		},
		[38] = {
			name_id = "weapons",
			upgrades = {
				"scoutknife",
				"komodo"
			}
		},
		[39] = {
			name_id = "weapons",
			upgrades = {
				"m16",
				"huntsman",
				"polymer",
				"sub2000",
				"china"
			}
		},
		[40] = {
			name_id = "lvl_40",
			upgrades = {
				"rep_upgrade4"
			}
		},
		[41] = {
			name_id = "weapons",
			upgrades = {
				"gerber",
				"fairbair",
				"wpn_prj_jav",
				"wpn_prj_hur",
				"contraband"
			}
		},
		[42] = {
			name_id = "weapons",
			upgrades = {
				"fal",
				"tomahawk",
				"coal"
			}
		},
		[43] = {
			name_id = "weapons",
			upgrades = {
				"b682",
				"m32",
				"morning",
				"coach"
			}
		},
		[44] = {
			name_id = "weapons",
			upgrades = {
				"poker"
			}
		},
		[45] = {
			name_id = "weapons",
			upgrades = {
				"m249",
				"barbedwire"
			}
		},
		[46] = {
			name_id = "weapons",
			upgrades = {
				"gre_m79",
				"great",
				"siltstone"
			}
		},
		[47] = {
			name_id = "weapons",
			upgrades = {
				"freedom",
				"whiskey",
				"arbiter"
			}
		},
		[48] = {
			name_id = "weapons",
			upgrades = {
				"dingdong",
				"tenderizer"
			}
		},
		[50] = {
			name_id = "lvl_50",
			upgrades = {
				"rep_upgrade5"
			}
		},
		[51] = {
			name_id = "weapons",
			upgrades = {
				"machete",
				"sterling"
			}
		},
		[52] = {
			name_id = "weapons",
			upgrades = {
				"g3",
				"aa12"
			}
		},
		[54] = {
			name_id = "weapons",
			upgrades = {
				"becker",
				"mosin",
				"cqc"
			}
		},
		[55] = {
			name_id = "weapons",
			upgrades = {
				"uzi"
			}
		},
		[60] = {
			name_id = "lvl_60",
			upgrades = {
				"rep_upgrade6"
			}
		},
		[61] = {
			name_id = "weapons",
			upgrades = {
				"rambo"
			}
		},
		[65] = {
			upgrades = {}
		},
		[70] = {
			name_id = "lvl_70",
			upgrades = {
				"rep_upgrade7"
			}
		},
		[71] = {
			name_id = "weapons",
			upgrades = {
				"fireaxe",
				"mg42"
			}
		},
		[75] = {
			name_id = "weapons",
			upgrades = {
				"hk21"
			}
		},
		[80] = {
			name_id = "lvl_80",
			upgrades = {
				"rep_upgrade8"
			}
		},
		[90] = {
			name_id = "lvl_90",
			upgrades = {
				"rep_upgrade9"
			}
		},
		[100] = {
			name_id = "lvl_100",
			upgrades = {
				"rep_upgrade10"
			}
		}
	}


	self.values.player.passive_xp_multiplier = {1.40}	
	self.values.team.stamina.multiplier = {2.5}
	self.values.player.uncover_multiplier = {1.35}
	self.values.weapon.clip_ammo_increase = {10}
	
	self.values.weapon.silencer_damage_multiplier = {1.15, 1.4}
	self.values.player.melee_kill_snatch_pager_chance = {0.07}
	self.values.player.armor_regen_timer_stand_still_multiplier = {0.85}
	self.values.saw.reload_speed_multiplier = {1.15}
	
	self.values.player.mask_off_pick_lock = {true}
	self.values.player.mask_off_keycard_insert = {true}
	self.values.player.mask_off_desktop_interaction = {true}
	self.values.player.hostage_move_speed_multiplier = {0.3}
	self.values.player.hostage_stay_speed_multiplier = {0.1}
	self.values.player.alarm_pager_speed_multiplier = {0.80}
	self.values.player.run_speed_multiplier = {1.15}
	self.values.player.walk_speed_multiplier = {1.15}
	self.values.player.uncover_multiplier = {1.3}

	self.values.player.intimidate_guards_pager = {true}
	self.values.player.instant_intimidation = {true}
	self.values.player.civs_show_markers = {true}
	
	self.definitions.player_civs_show_markers = {
		category = "feature",
		name_id = "menu_player_civs_show_markers",
		upgrade = {
			category = "player",
			upgrade = "civs_show_markers",
			value = 1
		}
	}
	self.definitions.player_instant_intimidation = {
		category = "feature",
		name_id = "menu_player_instant_intimidation",
		upgrade = {
			category = "player",
			upgrade = "instant_intimidation",
			value = 1
		}
	}
	self.definitions.player_intimidate_guards_pager = {
		category = "feature",
		name_id = "menu_player_intimidate_guards_pager",
		upgrade = {
			category = "player",
			upgrade = "intimidate_guards_pager",
			value = 1
		}
	}



	self.definitions.player_hostage_move_speed_multiplier = {
		category = "feature",
		name_id = "menu_player_hostage_move_speed_multiplier",
		upgrade = {
			category = "player",
			upgrade = "hostage_move_speed_multiplier",
			value = 1
		}
	}
	self.definitions.player_hostage_stay_speed_multiplier = {
		category = "feature",
		name_id = "menu_player_hostage_stay_speed_multiplier",
		upgrade = {
			category = "player",
			upgrade = "hostage_stay_speed_multiplier",
			value = 1
		}
	}
	self.definitions.player_mask_off_keycard_insert = {
		category = "feature",
		name_id = "menu_player_mask_off_keycard_insert",
		upgrade = {
			category = "player",
			upgrade = "mask_off_keycard_insert",
			value = 1
		}
	}
	self.definitions.player_mask_off_pick_lock = {
		category = "feature",
		name_id = "menu_player_mask_off_pick_lock",
		upgrade = {
			category = "player",
			upgrade = "mask_off_pick_lock",
			value = 1
		}
	}
	self.definitions.player_mask_off_desktop_interaction = {
		category = "feature",
		name_id = "menu_player_mask_off_desktop_interaction",
		upgrade = {
			category = "player",
			upgrade = "mask_off_desktop_interaction",
			value = 1
		}
	}
	
	
	
	self.values.player.body_armor.dodge = {0.1, 0.05, 0.03, -0.03, -0.1, -0.3, -0.5}
	self.values.player.body_armor.armor = {0, 1, 2, 3, 5, 7, 15}
	self.values.player.body_armor.movement = {1.05, 1.025, 1, 0.95, 0.85, 0.75, 0.675}

	self.values.player.passive_dodge_chance = {0.05, 0.15}
	self.values.player.passive_concealment_modifier = {5}
	self.values.weapon.passive_swap_speed_multiplier = {1.2, 2}
	self.values.weapon.armor_piercing_chance = {0.15}
	self.values.player.tier_armor_multiplier = {
		1.1,
		1.25,
		1.5
	}
	self.values.player.passive_health_multiplier = {
		1.1,
		1.2,
		1.5
	 
	}

	self.values.temporary.combat_medic_damage_multiplier = {
		{1.25, 10},
		{1.25, 15}
	}
	self.values.player.convert_enemies_health_multiplier = {0.65}
	self.values.player.convert_enemies_damage_multiplier = {1.45}
	self.values.assault_rifle.reload_speed_multiplier = {1.25}
	self.values.assault_rifle.move_spread_multiplier = {0.5}
	self.values.snp.reload_speed_multiplier = {1.25}
	self.values.snp.move_spread_multiplier = {0.5}
	self.values.pistol.damage_addend = {1.5}
	self.values.akimbo.damage_addend = {0.75}
	self.values.player.passive_convert_enemies_health_multiplier = {0.4, 0.2}
	self.values.player.minion_master_health_multiplier = {1.2}
	self.values.player.messiah_revive_from_bleed_out = {1, 3}
	self.definitions.player_messiah_revive_from_bleed_out_2 = {
		name_id = "menu_player_pistol_revive_from_bleed_out",
		category = "feature",
		upgrade = {
			value = 2,
			upgrade = "messiah_revive_from_bleed_out",
			category = "player"
		}
	}
	self.values.player.long_dis_revive = {0.75, 1}
	
	self.values.player.suppression_multiplier = {1.25, 1.75}
	self.values.temporary.dmg_dampener_outnumbered = {
		{0.85, 7}
	}
	self.values.player.non_special_melee_multiplier = {1.5}
	self.values.player.melee_damage_multiplier = {1.5}
	self.values.player.increased_pickup_area = {1.30}
	self.values.shotgun.damage_multiplier = {
		1.35
	}
	self.values.player.flashbang_multiplier = {
		0.75,
		0.25
	}
	self.values.player.damage_shake_multiplier = {0.5}
	self.values.player.bleed_out_health_multiplier = {1.25}
	self.values.shotgun.reload_speed_multiplier = {1.5}
	self.player_damage_health_ratio_threshold = 0.25
	self.values.shotgun.hip_fire_spread_index_addend = {0.8}
	self.values.weapon.hip_fire_spread_index_addend = {0.8}
	self.values.temporary.overkill_damage_multiplier = {
		{1.75, 5}
	}
	
	self.values.player.drill_autorepair_1 = {0.3}
	self.values.sentry_gun.extra_ammo_multiplier = {1.5, 2.5}
	self.values.sentry_gun.rot_speed_multiplier = {2.5}
	self.values.trip_mine.quantity = {
		1,
		4
	}
	self.values.player.deploy_interact_faster = {
		0.85
	}
	self.values.shape_charge.quantity = {
		0,
		0
	}
	self.values.sentry_gun.spread_multiplier = {0.5}
	self.values.sentry_gun.damage_multiplier = {4}
	self.values.temporary.single_shot_fast_reload = {{1.2, 4}}
	self.values.player.critical_hit_chance = {0.20}
	self.values.player.armor_multiplier = {1.5}

	self.definitions.player_small_loot_multiplier1 = {
		category = "feature",
		name_id = "menu_player_small_loot_multiplier",
		upgrade = {
			category = "player",
			upgrade = "small_loot_multiplier",
			value = 1
		}
	}
	self.definitions.player_small_loot_multiplier2 = {
		category = "feature",
		name_id = "menu_player_small_loot_multiplier",
		upgrade = {
			category = "player",
			upgrade = "small_loot_multiplier",
			value = 2
		}
	}
	self.values.player.run_speed_multiplier = {1.1}
	self.values.player.run_dodge_chance = {0.25}
	self.values.player.walk_speed_multiplier = {1.1}
	self.values.smg.reload_speed_multiplier = {1.35}
	self.values.player.cheat_death_chance = {0.35}
	self.values.weapon.silencer_damage_multiplier = {1.15, 1.35}
	self.definitions.weapon_silencer_damage_multiplier_1 = {
		category = "feature",
		name_id = "silencer_damage_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "silencer_damage_multiplier",
			value = 1
		}
	}
	self.definitions.weapon_silencer_damage_multiplier_2 = {
		category = "feature",
		name_id = "silencer_damage_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "silencer_damage_multiplier",
			value = 2
		}
	}
	self.values.player.pick_lock_easy_speed_multiplier = {0.75, 0.5}
	self.definitions.player_pick_lock_easy_speed_multiplier_1 = {
		category = "feature",
		name_id = "menu_player_pick_lock_easy_speed_multiplier",
		upgrade = {
			category = "player",
			upgrade = "pick_lock_easy_speed_multiplier",
			value = 1
		}
	}
	self.definitions.player_pick_lock_easy_speed_multiplier_2 = {
		category = "feature",
		name_id = "menu_player_pick_lock_easy_speed_multiplier",
		upgrade = {
			category = "player",
			upgrade = "pick_lock_easy_speed_multiplier",
			value = 2
		}
	}
	
	self.values.player.gangster_damage_dampener = {0.9, 0.65}
	self.definitions.player_gangster_damage_dampener_1 = {
		category = "feature",
		name_id = "menu_player_gangster_damage_dampener",
		upgrade = {
			category = "player",
			upgrade = "gangster_damage_dampener",
			value = 1
		}
	}
	self.definitions.player_gangster_damage_dampener_2 = {
		category = "feature",
		name_id = "menu_player_gangster_damage_dampener",
		upgrade = {
			category = "player",
			upgrade = "gangster_damage_dampener",
			value = 2
		}
	}
	self.values.temporary.first_aid_damage_reduction = {
		{0.8, 10}
	}
	self.values.temporary.swap_weapon_faster = {{1.2, 5}}
	self.values.temporary.reload_weapon_faster = {{1.2, 5}}
	self.values.temporary.increased_movement_speed = {{1.15, 5}}
	self.values.first_aid_kit.quantity = {2, 4}
	self.values.pistol.stacking_hit_expire_t = {2, 8}
	self.values.pistol.stacking_hit_damage_multiplier = {
		{
			max_stacks = 4,
			max_time = 2,
			damage_bonus = 1.1
		}
	}
	self.values.player.headshot_regen_armor_bonus = {0.8, 2.4}
	self.values.akimbo.extra_ammo_multiplier = {1.25, 1.5}
	self.values.player.melee_damage_stacking = {{max_multiplier = 4, melee_multiplier = 1}}
	self.values.player.melee_kill_increase_reload_speed = {{1.15, 10}}
	
	local editable_skill_descs = {
		unlock_mastermind = {
			{"2"}
		},		
		cable_guy = {
			{"75%"},
			{"4"}
		},
		combat_medic = {
			{"25%", "10"},
			{"30%"}
		},
		leadership = {
			{"4"},
			{"8"}
		},
		painkillers = {
			{"10%", "5"},
			{"20%"}
		},
		equilibrium = {
			{"4", "50%"},
			{"100%"}
		},
		medic_2x = {
			{"2"},
			{"2"}
		},
		dominator = {
			{},
			{"50%"}
		},
		gunslinger = {
			{"50%"},
			{"15"}
		},
		kilmer = {
			{"25%"},
			{"50%"}
		},
		trigger_happy = {
			{
				"10%",
				"2",
				"4"
			},
			{
				"8"
			}
		},
		messiah = {
			{"1"},
			{"2"}
		},
		inspire = {
			{"50%", "20%", "10"},
			{"75%", "9"}
		},
		
		show_of_force = {
			{},
			{"15%"}
		},
		underdog = {
			{"15%"},
			{"15%"}
		},
		steroids = {
			{"50%"},
			{"50%"}
		},
		oppressor = {
			{"25%"},
			{"50%"}
		},
		tough_guy = {
			{"50%"},
			{"25%"}
		},
		pack_mule = {
			{"50%"},
			{"50%"}
		},
		shotgun_impact = {
			{"4"},
			{"35%"}
		},
		shades = {
			{"25%"},
			{"50%"}
		},
		shotgun_cqb = {
			{"50%"},
			{"125%"}
		},
		ammo_2x = {
			{"2"},
			{"200%"}
		},
		wolverine = {
			{"", "250%", "25%"},
			{"", "100%", "25%"}
		},
		bandoliers = {
			{"25%"},
			{"175%"}
		},
		portable_saw = {
			{},
			{"1"}
		},
		overkill = {
			{"75%", "5"}
		},


		unlock_technician = {
			{"2"}
		},
		rifleman = {
			{"100%"},
			{"25%"}
		},
		trip_miner = {
			{"1"},
			{"20%"}
		},
		discipline = {
			{"50%"}
		},
		sharpshooter = {
			{"4"},
			{"8"}
		},
		hardware_expert = {
			{"25%", "20%"},
			{"30%", "50%"}
		},
		marksman = {
			{"4", "8"},
			{"8", "20%"}
		},
		combat_engineering = {
			{"30%"},
			{"15%"}
		},
		drill_expert = {
			{"15%"},
			{"15%"}
		},
		jack_of_all_trades = {
			{"15%"},
			{"50%"}
		},
		silent_drilling = {
			{"65%"}
		},
		sentry_2_0 = {
			{"5%"}
		},
		shaped_charge = {
			{"3"}
		},
		insulation = {
			{},
			{"50%"}
		},
		tower_defense = {
			{"2"},
			{"300%"}
		},
		iron_man = {
			{"50%"},
			{"25%"}
		},

		unlock_ghost = {
			{"1", "20"}
		},
		martial_arts = {
			{"50%"},
			{"50%"}
		},
		sprinter = {
			{"25%", "25%"},
			{"10%", "25%"}
		},
		transporter = {
			{"25%"},
			{"50%"}
		},
		chameleon = {
			{"25%"},
			{"15%"}
		},
		assassin = {
			{"10%", "10%"},
			{"95%"}
		},
		smg_master = {
			{"35%"},
			{"20%"}
		},
		magic_touch = {
			{"25%"},
			{"25%"}
		},
		ecm_2x = {
			{"2"},
			{"25%", "25%"}
		},
		nine_lives = {
			{"1"},
			{"35%"}
		},
		good_luck_charm = {
			{"10", "1"},
			{"10"}
		},
		ecm_booster = {
			{"25%"}
		},
		silence_expert = {
			{"8", "100%"},
			{"8", "15%"}
		},
		low_blow = {
			{"3%", "3", "35", "30%"},
			{"3%", "1", "35", "30%"}
		},
		ecm_feedback = {
			{"50%-100%", "25", "1.5", "15-20"},
			{"25%", "100%", "4"}
		},
		hitman = {
			{
				"15%"
			},
			{
				"20%",
				"20%"
			}
		},
		
		unlock_hoxton = {
			{"4"}
		},	
		cell_mates = {
			{"10%"},
			{"25%"}
		},
		freedom_call = {
			{"20%"},
			{"15%"}
		},
		awareness = {
			{"10%"}
		},
		alpha_dog = {
			{"5%"},
			{"10%"}
		},
		up_you_go = {
			{"30%", "10"},
			{"40%"}
		},
		thick_skin = {
			{"10", "2"},
			{"20", "4"}
		},
		tea_time = {
			{"50%"},
			{"10%", "120"}
		},
		hidden_blade = {
			{"10", "2"},
			{"20", "4"}
		},
		running_from_death = {
			{"20%", "5"},
			{"15%", "5"}
		},
		second_chances = {
			{},
			{"2"}
		},
		tea_cookies = {
			{"2"},
			{"2"}
		},
		bloodthirst = {
			{"100%", "400%"},
			{"15%", "10"}
		}
	}
	self.skill_descs = {}
	for skill_id, skill_desc in pairs(editable_skill_descs) do
		self.skill_descs[skill_id] = {}
		for index, skill_version in ipairs(skill_desc) do
			local version = index == 1 and "multibasic" or "multipro"
			self.skill_descs[skill_id][index] = #skill_version

			for i, desc in ipairs(skill_version) do
				self.skill_descs[skill_id][version .. (i == 1 and "" or tostring(i))] = desc
			end
		end
	end

	
	local editable_specialization_descs = {
		{{"40"}},
		{{"30"}},
		{{"200"}},
		{{"150"}},
		{},
		{{"10"}},
		{{"70"}},
		{{"15"}},
		{{"5"}},
		{{"20"}},
		{},
		{{"20"}},
		{{"50"}},
		{},
		{}
	}
	
	for tree, data in pairs(editable_specialization_descs) do
		self.specialization_descs[tree] = {}
		for tier, tier_data in ipairs(data) do
			self.specialization_descs[tree][tier] = {}
			for i, desc in ipairs(tier_data) do
				self.specialization_descs[tree][tier]["multiperk" .. (i == 1 and "" or tostring(i))] = desc
			end
		end
	end

end