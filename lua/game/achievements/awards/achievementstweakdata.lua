local function get_texture_path(tweak_data, category, id)
	local td = nil
	local rtn = {}

	if category == "armor_skins" then
		td = tweak_data.economy.armor_skins[id]
	elseif category == "suit_variations" then
		local player_style = id[1]
		local suit_variation = id[2]
		local ps_td = tweak_data:get_raw_value("blackmarket", "player_styles", player_style)
		local sv_td = ps_td.material_variations and ps_td.material_variations[suit_variation]
		td = sv_td and (sv_td.texture_bundle_folder and sv_td or ps_td)
	else
		td = tweak_data:get_raw_value("blackmarket", category, id)
	end

	if category == "textures" then
		rtn.texture = td.texture
		rtn.render_template = "VertexColorTexturedPatterns"
	else
		local guis_catalog = "guis/"
		local bundle_folder = td.texture_bundle_folder

		if bundle_folder then
			guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
		end

		if category == "armor_skins" then
			rtn.texture = guis_catalog .. "armor_skins/" .. id
		elseif category == "weapon_skins" then
			rtn.texture = guis_catalog .. "textures/pd2/blackmarket/icons/" .. (td.is_a_color_skin and "weapon_color" or "weapon_skins") .. "/" .. id
		elseif category == "suit_variations" then
			local player_style = id[1]
			local suit_variation = id[2]
			rtn.texture = guis_catalog .. "textures/pd2/blackmarket/icons/player_styles/" .. player_style .. "_" .. suit_variation
		else
			rtn.texture = guis_catalog .. "textures/pd2/blackmarket/icons/" .. (category == "weapon_mods" and "mods" or category) .. "/" .. id
		end
	end

	if not DB:has(Idstring("texture"), Idstring(rtn.texture)) then
		Application:error("ERROR MISSING TEXTURE:", rtn.texture)

		rtn.texture = "guis/textures/pd2/endscreen/exp_ring"
	end

	return rtn
end

function AchievementsTweakData:init(tweak_data)
	local normal = {"normal"}
	local hard = {"hard"}
	local veryhard = {"overkill"}
	local overkill = {"overkill_145"}
	local deathwish = {"overkill_290"}
	local any = {
		"normal",
		"hard",
		"overkill",
		"overkill_145",
		"overkill_290"
	}
	local hard_or_above = {
		"hard",
		"overkill",
		"overkill_145",
		"overkill_290"
	}
	local veryhard_or_above = {
		"overkill",
		"overkill_145",
		"overkill_290"
	}
	local overkill_or_above = {
		"overkill_145",
		"overkill_290"
	}
	self.im_a_healer_tank_damage_dealer = 10
	self.iron_man = "level_7"
	self.going_places = 1000000
	self.spend_money_to_make_money = 1000000
	self.fully_loaded = 9
	self.weapon_collector = 18
	self.arms_dealer = 72
	self.how_do_you_like_me_now = "level_1"
	self.like_an_angry_bear = "bear"
	self.merry_christmas = "santa_happy"
	self.witch_doctor = {
		stat = "halloween_4_stats",
		mask = "witch"
	}
	self.its_alive_its_alive = {
		stat = "halloween_5_stats",
		mask = "frank"
	}
	self.pump_action = {
		stat = "halloween_6_stats",
		mask = "pumpkin_king"
	}
	self.cant_hear_you_scream = {
		stat = "halloween_7_stats",
		mask = "venomorph"
	}
	self.unique_selling_point = "usp"
	self.relation_with_bulldozer = {
		stat = "armored_8_stat",
		mask = "clinton"
	}
	self.no_we_cant = {
		stat = "armored_10_stat",
		mask = "obama"
	}
	self.heat_around_the_corner = "heat"
	self.fire_in_the_hole = {
		stat = "gage_9_stats",
		grenade = {
			"frag",
			"frag_com",
			"concussion",
			"dada_com"
		}
	}
	self.level_achievements = {
		you_gotta_start_somewhere = {
			award = "you_gotta_start_somewhere",
			level = 5
		},
		guilty_of_crime = {
			award = "guilty_of_crime",
			level = 10
		},
		gone_in_30_seconds = {
			award = "gone_in_30_seconds",
			level = 25
		},
		armed_and_dangerous = {
			award = "armed_and_dangerous",
			level = 50
		},
		big_shot = {
			award = "big_shot",
			level = 75
		},
		most_wanted = {
			award = "most_wanted",
			level = 100
		},
		story_basics_lvl10 = {
			story = "story_basics_lvl10",
			level = 10
		},
		story_chill_level = {
			story = "story_chill_level",
			level = 25
		},
		story_half_lvl = {
			story = "story_half_lvl",
			level = 50
		}
	}
	self.tango_4 = {
		award = "tango_achieve_4",
		count = 10,
		difficulty = overkill_or_above
	}
	self.infamous = {
		"ignominy_1",
		"ignominy_2",
		"ignominy_3",
		"ignominy_4",
		"ignominy_5",
		"ignominy_6",
		"ignominy_7",
		"ignominy_8",
		"ignominy_9",
		"ignominy_10",
		"ignominy_11",
		"ignominy_12",
		"ignominy_13",
		"ignominy_14"
	}
	self.final_rule = {
		heist = "nightclub",
		stat = "gage2_3_stats",
		melee_type = "fists"
	}
	self.easy_as_breathing = {
		award = "gage2_4",
		weapon_type = "lmg",
		count = 10
	}
	self.first_blood = {
		award = "gage2_5",
		count = 220,
		weapon_type = "lmg"
	}
	self.in_town_you_are_law = {
		award = "gage2_6",
		weapon_type = "shotgun"
	}
	self.dont_push_it = {
		award = "gage2_7",
		weapon = "deagle"
	}
	self.finally = {
		award = "gage2_8"
	}
	self.demise_knuckles = "brass_knuckles"
	self.vote_for_change = "g22c"
	self.steam_500k = "akm_gold"
	self.shotgun_one_o_one = {
		award = "gage4_5",
		count = 50,
		accuracy = 101
	}
	self.close_and_personal = {
		kill_type = "melee",
		count = 50,
		award = "gage4_3"
	}
	self.cavity = {
		award = "bulldog_4",
		melee_type = "toothbrush"
	}
	self.double_trouble = {
		award = "ovk_9",
		converted_cops = 4,
		difficulty = overkill_or_above
	}
	self.never_let_you_go = {
		weapon_id = "m134",
		timer = 15,
		award = "ovk_3"
	}
	self.nothing_to_see_here = {
		timer = 90,
		award = "slakt_2",
		total_value = 4
	}
	self.drive_away = "fort_2"
	self.disco_inferno = "grill_1"
	self.overgrill = "grill_4"
	self.pickup_sticks = {
		weapon_category = "bow",
		stat = "scorpion_1_stats"
	}
	self.pincushion = {
		award = "scorpion_3",
		weapon_category = "bow",
		enemy = "tank",
		count = 10
	}
	self.jordan_1 = "brooklyn_1"
	self.jordan_2 = {
		award = "brooklyn_2",
		timer = 30,
		count = 100
	}
	self.one_man_army = {
		award = "gage5_3",
		equipped = {
			secondary = "serbu",
			primary = "gre_m79",
			armor = "level_7"
		}
	}
	self.man_5 = {
		weapon_category = "grenade_launcher",
		award = "man_5",
		job = "man",
		difficulty = overkill_or_above
	}
	self.mad_5 = "mad_5"
	self.peta_4 = {
		carry_id = "goat",
		award = "peta_4",
		count = 1
	}
	self.weapons_owned = {
		gage4_2 = {
			"huntsman",
			"r870",
			"saiga",
			"ksg",
			"striker",
			"serbu",
			"benelli"
		},
		gage5_4 = {
			"gre_m79",
			"g3",
			"galil",
			"famas"
		}
	}
	self.gage_assignments = {
		green_mantis = "gmod_1_stats",
		yellow_bull = "gmod_2_stats",
		red_spider = "gmod_3_stats",
		blue_eagle = "gmod_4_stats",
		purple_snake = "gmod_5_stats"
	}
	self.gonna_find_them_all = 1
	self.weapon_blueprints = {
		gmod_7 = {
			"wpn_fps_upg_fg_jp",
			"wpn_fps_upg_m4_m_quad",
			"wpn_fps_upg_ass_ns_jprifles"
		},
		gmod_8 = {
			"wpn_fps_upg_o_rmr",
			"wpn_fps_upg_pis_ns_flash"
		},
		gmod_9 = {
			"wpn_fps_upg_fg_smr",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_o_eotech_xps",
			"wpn_fps_upg_m4_s_crane",
			"wpn_fps_upg_fl_ass_peq15"
		},
		gmod_10 = {
			"wpn_fps_upg_fg_midwest",
			"wpn_fps_upg_ak_b_draco",
			"wpn_fps_upg_ak_m_quad",
			"wpn_fps_upg_ass_ns_linear"
		},
		eagle_4 = {
			"wpn_fps_pis_c96_nozzle",
			"wpn_fps_pis_c96_sight"
		}
	}
	self.explosion_achievements = {
		shock_awe = {
			count = 4,
			award = "gage4_9",
			weapon_type = "shotgun"
		}
	}
	self.dot_achievements = {
		turtles_4 = {
			award = "turtles_4",
			count = 3,
			variant = "poison"
		}
	}
	self.grenade_achievements = {
		bada_boom = {
			kill = true,
			grenade_type = "launcher_frag",
			count = 4,
			award = "gage5_2"
		},
		artillery_barrage = {
			kill = true,
			grenade_type = "launcher_frag",
			distance = 4000,
			stat = "gage5_5_stats"
		},
		boom_shakalaka = {
			kill = true,
			flying_strike = true,
			award = "gage5_7",
			enemy = "spooc",
			grenade_type = "launcher_frag"
		},
		not_invited = {
			timer = 10,
			grenade_type = "launcher_frag_m32",
			award = "grill_3",
			kill_count = 10
		},
		threemite = {
			kill = true,
			grenade_type = "dynamite",
			count = 3,
			award = "scorpion_2"
		},
		steel_3 = {
			kill = true,
			grenade_type = "wpn_prj_jav",
			award = "steel_3",
			enemy = "spooc"
		},
		pim_2 = {
			kill = true,
			grenade_type = "wpn_prj_target",
			success = true,
			job = "dark",
			crouching = true,
			stat = "pim_2_stats",
			is_civilian = false
		},
		tango_2 = {
			kill = true,
			stat = "tango_2_stats",
			enemy = "sniper",
			grenade_type = "launcher_frag_arbiter"
		},
		any_kills = {
			kill = true,
			challenge_stat = "any_kills"
		},
		any_sniper_kills = {
			kill = true,
			enemy = "sniper",
			challenge_stat = "any_sniper_kills"
		},
		any_shield_kills = {
			kill = true,
			enemy = "shield",
			challenge_stat = "any_shield_kills"
		},
		any_taser_kills = {
			kill = true,
			enemy = "taser",
			challenge_stat = "any_taser_kills"
		},
		any_tank_kills = {
			kill = true,
			enemies = {
				"tank",
				"tank_hw",
				"tank_mini",
				"tank_medic"
			},
			challenge_stat = "any_tank_kills"
		},
		any_spooc_kills = {
			kill = true,
			enemy = "spooc",
			challenge_stat = "any_spooc_kills"
		},
		trophy_special_kills = {
			kill = true,
			trophy_stat = "trophy_special_kills",
			enemies = {
				"sniper",
				"shield",
				"taser",
				"tank",
				"tank_hw",
				"tank_mini",
				"tank_medic",
				"spooc",
				"medic"
			}
		},
		trophy_ace = {
			kill = true,
			trophy_stat = "trophy_ace",
			grenade_type = "wpn_prj_ace",
			difficulties = overkill_or_above
		},
		trophy_washington = {
			kill = true,
			trophy_stat = "trophy_washington"
		},
		trophy_medic = {
			kill = true,
			trophy_stat = "trophy_medic",
			enemies = {
				"medic"
			}
		},
		daily_grenades = {
			kill = true,
			trophy_stat = "daily_grenades",
			grenade_type = "frag",
			is_civilian = false
		},
		daily_grenades_community = {
			kill = true,
			trophy_stat = "daily_grenades",
			grenade_type = "frag_com",
			is_civilian = false
		},
		daily_grenades_dynamite = {
			kill = true,
			trophy_stat = "daily_grenades",
			grenade_type = "dynamite",
			is_civilian = false
		},
		daily_grenades_dada = {
			kill = true,
			trophy_stat = "daily_grenades",
			grenade_type = "dada_com",
			is_civilian = false
		},
		explosive_kills = {
			kill = true,
			explosive = true,
			challenge_stat = "explosive_kills"
		},
		cac_1 = {
			kill = true,
			grenade_type = "launcher_frag_slap",
			distance = 4000,
			enemy = "sniper",
			award = "cac_1"
		},
		cac_35 = {
			player_state = "driving",
			stat = "cac_35_stats",
			enemy_tags_all = {
				"law"
			}
		}
	}
	self.shotgun_single_shot_kills = {
		tango_1 = {
			award = "tango_achieve_1",
			count = 3,
			is_not_civilian = true,
			headshot = true,
			blueprint = {
				"wpn_fps_upg_ns_duck"
			}
		}
	}
	self.enemy_kill_achievements = {
		try_out_your_usp = {
			weapon = "usp",
			stat = "halloween_8_stats"
		},
		license_to_kill = {
			weapon = "ppk",
			stat = "armored_5_stat"
		},
		im_not_a_crook = {
			weapon = "s552",
			stat = "armored_7_stat",
			enemy = "sniper",
			mask = "nixon"
		},
		fool_me_once = {
			weapon = "m45",
			stat = "armored_9_stat",
			enemy = "shield",
			mask = "bush"
		},
		wanted = {
			weapon = "ak5",
			stat = "gage_1_stats",
			mask = "goat"
		},
		three_thousand_miles = {
			weapon = "p90",
			stat = "gage_2_stats",
			mask = "panda"
		},
		commando = {
			weapon = "aug",
			stat = "gage_3_stats",
			mask = "pitbull"
		},
		public_enemies = {
			weapon = "colt_1911",
			stat = "gage_4_stats",
			mask = "eagle"
		},
		inception = {
			weapon = "scar",
			stat = "gage_5_stats"
		},
		hard_corps = {
			weapon = "mp7",
			stat = "gage_6_stats"
		},
		above_the_law = {
			weapon = "p226",
			stat = "gage_7_stats"
		},
		surprise_motherfucker = {
			weapon = "m95",
			stat = "gage3_12_stats",
			enemies = {
				"tank",
				"tank_hw",
				"tank_mini",
				"tank_medic"
			}
		},
		man_with_golden_gun = {
			weapon = "akm_gold",
			stat = "gage3_2_stats",
			enemies = {
				"tank",
				"tank_hw",
				"tank_mini",
				"tank_medic"
			},
			enemy_weapon = "m249"
		},
		lord_of_flies = {
			in_head = true,
			stat = "gage3_3_stats",
			weapon_type = "snp"
		},
		arachnes_curse = {
			in_head = true,
			stat = "gage3_4_stats",
			weapon_type = "snp"
		},
		pest_control = {
			in_head = true,
			stat = "gage3_5_stats",
			weapon_type = "snp"
		},
		seer_of_death = {
			in_head = true,
			stat = "gage3_6_stats",
			weapon_type = "snp"
		},
		far_far_away = {
			weapon = "m95",
			stat = "gage3_7_stats",
			distance = 4000
		},
		last_action_villian = {
			in_head = true,
			weapon = "r93",
			award = "gage3_8",
			on_zipline = true
		},
		dodge_this = {
			in_head = true,
			stat = "gage3_11_stats",
			enemy = "spooc",
			weapon = "m95"
		},
		didnt_see_this_coming = {
			stat = "gage3_13_stats",
			weapon_type = "snp",
			on_zipline = true
		},
		grand_master_sniper = {
			weapon = "msr",
			stat = "gage3_14_stats",
			enemy = "sniper"
		},
		public_enemy_no_one = {
			weapon = "msr",
			stat = "gage3_17_stats"
		},
		knock_knock = {
			weapon_type = "shotgun",
			stat = "gage4_6_stats",
			enemy = "shield",
			part_id = "wpn_fps_upg_a_slug"
		},
		peek_a_boo = {
			weapon_type = "shotgun",
			stat = "gage4_8_stats",
			enemy = "sniper",
			part_id = "wpn_fps_upg_a_piercing"
		},
		seven_eleven = {
			count = 7,
			timer = 11,
			award = "gage4_4",
			in_head = true,
			weapon_type = "shotgun"
		},
		bang_for_buck = {
			weapon_type = "shotgun",
			stat = "gage4_10_stats",
			enemies = {
				"tank",
				"tank_hw",
				"tank_mini",
				"tank_medic"
			},
			parts = {
				"wpn_fps_upg_a_custom",
				"wpn_fps_upg_a_custom_free"
			}
		},
		grind_fest = {
			weapon = "g3",
			stat = "gage5_1_stats",
			enemies = {
				"tank",
				"tank_hw",
				"tank_mini",
				"tank_medic"
			}
		},
		kill_streak = {
			weapon = "galil",
			stat = "gage5_9_stats",
			enemy = "spooc"
		},
		le_picnic = {
			weapon = "famas",
			stat = "gage5_10_stats"
		},
		repel_from_rope = {
			weapon = "mosin",
			stat = "eagle_1_stats",
			on_rope = true
		},
		bullet_hell = {
			weapon = "mg42",
			timer = 10,
			award = "eagle_5",
			count = 10
		},
		akm4_shootout = {
			is_cop = true,
			stat = "ameno_08_stats",
			weapons = {
				"ak74",
				"akm",
				"akm_gold",
				"saiga",
				"rpk",
				"amcar",
				"new_m4",
				"m16",
				"akmsu",
				"olympic",
				"flint"
			}
		},
		scorpion_4 = {
			in_steelsight = false,
			timer = 6,
			award = "scorpion_4",
			weapon = "peacemaker",
			count = 6
		},
		turtles_1 = {
			weapon = "wa2000",
			award = "turtles_1",
			count_no_reload = 11
		},
		turtles_2 = {
			weapon = "polymer",
			kill_count = 100,
			award = "turtles_2"
		},
		berry_5 = {
			in_steelsight = false,
			count_in_row = 10,
			award = "berry_5",
			weapon = "model70",
			in_head = true
		},
		assault_rifle_kills = {
			weapon_type = "assault_rifle",
			challenge_stat = "assault_rifle_kills"
		},
		shotgun_kills = {
			weapon_type = "shotgun",
			challenge_stat = "shotgun_kills"
		},
		smg_kills = {
			weapon_type = "smg",
			challenge_stat = "smg_kills"
		},
		pistol_kills = {
			weapon_type = "pistol",
			challenge_stat = "pistol_kills"
		},
		lmg_kills = {
			weapon_type = "lmg",
			challenge_stat = "lmg_kills"
		},
		sniper_kills = {
			weapon_type = "snp",
			challenge_stat = "sniper_kills"
		},
		critical_kills = {
			critical = true,
			challenge_stat = "critical_kills"
		},
		explosive_kills = {
			variant = "explosion",
			challenge_stat = "explosive_kills"
		},
		sentry_kills = {
			attack_weapon_type = "sentry_gun",
			challenge_stat = "sentry_kills"
		},
		-- challenge_winters_mutated = {
			-- challenge_award = "challenge_winters_mutated",
			-- is_vip = true,
			-- mutators = {
				-- "MutatorHydra"
			-- }
		-- },
		any_kills = {
			challenge_stat = "any_kills"
		},
		any_headshot_kills = {
			in_head = true,
			challenge_stat = "any_headshot_kills"
		},
		any_sniper_kills = {
			enemy = "sniper",
			challenge_stat = "any_sniper_kills"
		},
		any_shield_kills = {
			enemy = "shield",
			challenge_stat = "any_shield_kills"
		},
		any_taser_kills = {
			enemy = "taser",
			challenge_stat = "any_taser_kills"
		},
		any_tank_kills = {
			enemies = {
				"tank",
				"tank_hw",
				"tank_mini",
				"tank_medic"
			},
			challenge_stat = "any_tank_kills"
		},
		any_spooc_kills = {
			enemy = "spooc",
			challenge_stat = "any_spooc_kills"
		},
		trophy_headshots = {
			in_head = true,
			trophy_stat = "trophy_headshots"
		},
		trophy_washington = {
			trophy_stat = "trophy_washington"
		},
		trophy_smg = {
			timer = 25,
			trophy_stat = "trophy_smg",
			weapon_type = "smg",
			count = 25
		},
		trophy_special_kills = {
			trophy_stat = "trophy_special_kills",
			enemies = {
				"sniper",
				"shield",
				"taser",
				"tank",
				"tank_hw",
				"tank_mini",
				"tank_medic",
				"spooc",
				"medic"
			}
		},
		trophy_medic = {
			trophy_stat = "trophy_medic",
			enemies = {
				"medic"
			}
		},
		pim_1 = {
			weapon = "desertfox",
			stat = "pim_1_stats",
			difficulty = overkill_or_above,
			enemies = {
				"sniper"
			}
		},
		pim_3 = {
			weapon = "schakal",
			level_id = "mad",
			stat = "pim_3_stats",
			difficulty = overkill_or_above,
			enemies = {
				"sniper",
				"shield",
				"taser",
				"tank",
				"tank_hw",
				"tank_mini",
				"tank_medic",
				"spooc",
				"medic"
			}
		},
		grv_2 = {
			weapon = "coal",
			award = "grv_2",
			count_no_reload = 32
		},
		grv_3 = {
			stat = "grv_3_stats",
			weapons = {
				"siltstone",
				"flint",
				"coal"
			}
		},
		aru_2 = {
			stat = "aru_2",
			weapons = {
				"breech"
			}
		},
		aru_3 = {
			stat = "aru_3",
			weapons = {
				"erma"
			}
		},
		aru_4 = {
			stat = "aru_4",
			weapons = {
				"ching"
			}
		},
		cac_35 = {
			player_state = "driving",
			stat = "cac_35_stats",
			enemy_tags_all = {
				"law"
			}
		}
	}
	self.enemy_melee_hit_achievements = {
		cloak_n_dagger = {
			enemy = "spooc",
			melee_type = "knife",
			award = "gage2_2",
			result = "death"
		},
		are_you_kidding_me = {
			enemies = {
				"tank",
				"tank_hw",
				"tank_mini",
				"tank_medic"
			},
			melee_type = "knife",
			award = "gage2_10",
			result = "death"
		},
		no_time_to_bleed = {
			health = 25,
			result = "death",
			stat = "gage2_9_stats",
			melee_type = "knife",
			enemies = {
				"fbi_swat",
				"fbi_heavy_swat"
			},
			difficulty = overkill_or_above
		},
		police_brutality = {
			enemy = "shield",
			melee_id = "baton",
			award = "gage4_1",
			result = "death"
		},
		every_day_shovelin = {
			stat = "gage4_7_stats",
			level_id = "nightclub",
			is_cop = true,
			result = "death",
			melee_id = "shovel"
		},
		cant_touch_this = {
			melee_id = "dingdong",
			stat = "gage5_8_stats",
			is_gangster = true,
			result = "death"
		},
		hurting_people = {
			melee_id = "baseballbat",
			result = "death",
			stat = "pig_3_stats",
			enemies = {
				"mobster",
				"mobster_boss",
				"biker_boss"
			},
			jobs = {"mia", "mia_pro"}
		},
		special_operations = {
			stat = "eagle_2_stats",
			melee_id = "fairbair",
			is_stealth = true,
			result = "death",
			is_not_civilian = true
		},
		knockout = {
			enemies = {
				"tank",
				"tank_hw",
				"tank_mini",
				"tank_medic"
			},
			melee_id = "boxing_gloves",
			award = "gorilla_1",
			result = "death"
		},
		stick_a_fork_in_me = {
			is_not_civilian = true,
			award = "grill_2",
			result = "death",
			melee_id = "fork",
			is_on_fire = true
		},
		steel_2 = {
			award = "steel_2",
			result = "death",
			melee_weapons = {
				"morning",
				"buck",
				"beardy",
				"great"
			},
			enemy_kills = {
				enemy = "shield",
				count = 10
			}
		},
		steel_4 = {
			enemies = {
				"tank",
				"tank_hw",
				"tank_mini",
				"tank_medic"
			},
			enemy_weapon = "saiga",
			award = "steel_4",
			result = "death",
			melee_id = "great"
		},
		melee_kills = {
			result = "death",
			is_not_civilian = true,
			challenge_stat = "melee_kills"
		},
		any_kills = {
			result = "death",
			is_not_civilian = true,
			challenge_stat = "any_kills"
		},
		any_sniper_kills = {
			result = "death",
			is_not_civilian = true,
			enemy = "sniper",
			challenge_stat = "any_sniper_kills"
		},
		any_shield_kills = {
			result = "death",
			is_not_civilian = true,
			enemy = "shield",
			challenge_stat = "any_shield_kills"
		},
		any_taser_kills = {
			result = "death",
			is_not_civilian = true,
			enemy = "taser",
			challenge_stat = "any_taser_kills"
		},
		any_tank_kills = {
			result = "death",
			is_not_civilian = true,
			enemies = {
				"tank",
				"tank_hw",
				"tank_mini",
				"tank_medic"
			},
			challenge_stat = "any_tank_kills"
		},
		any_spooc_kills = {
			result = "death",
			is_not_civilian = true,
			enemy = "spooc",
			challenge_stat = "any_spooc_kills"
		},
		trophy_knockouts = {
			trophy_stat = "trophy_knockouts",
			is_not_civilian = true,
			result = "death",
			melee_id = "boxing_gloves",
			enemies = {
				"tank",
				"tank_hw",
				"tank_mini",
				"tank_medic"
			}
		},
		trophy_washington = {
			is_not_civilian = true,
			trophy_stat = "trophy_washington",
			result = "death"
		},
		trophy_medic = {
			is_not_civilian = true,
			trophy_stat = "trophy_medic",
			enemy = "medic",
			result = "death"
		},
		trophy_special_kills = {
			trophy_stat = "trophy_special_kills",
			is_not_civilian = true,
			result = "death",
			enemies = {
				"sniper",
				"shield",
				"taser",
				"tank",
				"tank_hw",
				"tank_mini",
				"tank_medic",
				"spooc",
				"medic"
			}
		},
		daily_hangover = {
			melee_id = "whiskey",
			trophy_stat = "daily_hangover",
			is_not_civilian = true,
			result = "death"
		},
		raid_aru_1 = {
			melee_id = "push",
			stat = "aru_1",
			is_not_civilian = true,
			result = "death"
		},
		critical_kills = {
			critical = true,
			is_not_civilian = true,
			result = "death",
			challenge_stat = "critical_kills"
		},
		challenge_melee_creeps = {
			result = "death",
			is_not_civilian = true,
			challenge_stat = "challenge_melee_creeps",
			mutators = {
				"MutatorExplodingEnemies"
			}
		},
		rvd_12 = {
			jobs = {"rvd", "rvd_pro"},
			melee_id = "clean",
			result = "death",
			stat = "rvd_12_stats",
			difficulty = overkill_or_above
		},
		cac_6 = {
			award = "cac_6",
			melee_id = "moneybundle",
			enemy = "cop_female",
			jobs = {"rvd", "rvd_pro"}
		},
		cac_14 = {
			melee_id = "baton",
			award = "cac_14",
			result = "death",
			enemy_tags_all = {
				"spooc"
			}
		},
		cac_25 = {
			award = "cac_25",
			melee_id = "moneybundle",
			enemy = "bank_manager",
			job = "red2"
		},
		cac_29 = {
			award = "cac_29",
			result = "death",
			enemy_tags_all = {
				"sniper"
			}
		},
		cac_32 = {
			award = "cac_32",
			enemy_tags_all = {
				"spooc"
			},
			melee_weapons = {
				"taser",
				"zeus"
			},
			action = {
				body_part = 1,
				type = "spooc"
			}
		},
		cac_36 = {
			award = "cac_36",
			result = "death",
			enemy_tags_all = {
				"taser"
			},
			melee_weapons = {
				"taser",
				"zeus"
			}
		},
		bph_9 = {
			melee_id = "toothbrush",
			result = "death",
			stat = "bph_9_stat",
			is_dropin = false,
			difficulty = overkill_or_above
		},
		bex_9 = {
			award = "bex_9",
			melee_id = "chac",
			enemy = "civilian_mariachi",
			job = "bex"
		}
	}
	self.complete_heist_achievements = {
		in_soviet_russia = {
			contract = "vlad",
			stat = "halloween_10_stats",
			mask = "bear",
			difficulty = overkill_or_above
		},
		i_take_scores = {
			stat = "armored_4_stat",
			mask = "heat",
			difficulty = overkill_or_above,
			jobs = {
				"arm_wrapper",
				"arm_cro",
				"arm_und",
				"arm_hcm",
				"arm_par",
				"arm_fac"
			}
		},
		eco_round = {
			award = "charliesierra_7",
			no_shots = "primaries",
			job = "roberts",
			difficulty = overkill_or_above
		},
		stealth_election_day = {
			stealth = true,
			award = "bob_3",
			jobs = {"election_day", "election_day_pro"}
		},
		death_stealth_election_day = {
			award = "bob_7",
			stealth = true,
			jobs = {"election_day", "election_day_pro"},
			difficulty = deathwish
		},
		death_ukranian = {
			award = "death_1",
			job = "ukrainian_job_prof",
			difficulty = deathwish
		},
		death_mallcrasher = {
			award = "death_2",
			job = "mallcrasher",
			difficulty = deathwish
		},
		death_four_stores = {
			award = "death_3",
			job = "four_stores",
			difficulty = deathwish
		},
		death_nightclub = {
			award = "death_4",
			job = "nightclub",
			difficulty = deathwish
		},
		death_watchdogs = {
			award = "death_34",
			difficulty = deathwish,
			jobs = {
				"watchdogs_wrapper",
				"watchdogs_night",
				"watchdogs"
			}
		},
		death_rats = {
			award = "death_33",
			job = "alex",
			difficulty = deathwish
		},
		death_firestarter = {
			award = "death_32",
			job = "firestarter",
			difficulty = deathwish
		},
		death_framing_frame = {
			award = "death_35",
			job = "framing_frame",
			difficulty = deathwish
		},
		death_big_oil = {
			award = "death_11",
			difficulty = deathwish,
			jobs = {
				"welcome_to_the_jungle_wrapper_prof",
				"welcome_to_the_jungle_night_prof",
				"welcome_to_the_jungle_prof"
			}
		},
		death_jewelry_store = {
			award = "death_13",
			job = "jewelry_store",
			difficulty = deathwish
		},
		death_diamond_store = {
			award = "death_14",
			job = "family",
			difficulty = deathwish
		},
		death_go_bank = {
			award = "death_15",
			job = "roberts",
			difficulty = deathwish
		},
		death_bank_heist = {
			award = "death_16",
			job = "branchbank_prof",
			difficulty = deathwish
		},
		death_bank_heist_gold = {
			award = "death_17",
			job = "branchbank_gold_prof",
			difficulty = deathwish
		},
		death_bank_heist_cash = {
			award = "death_18",
			job = "branchbank_cash",
			difficulty = deathwish
		},
		death_bank_heist_deposit = {
			award = "death_19",
			job = "branchbank_deposit",
			difficulty = deathwish
		},
		death_transport_crossroads = {
			award = "death_20",
			job = "arm_cro",
			difficulty = deathwish
		},
		death_transport_downtown = {
			award = "death_21",
			job = "arm_hcm",
			difficulty = deathwish
		},
		death_transport_harbor = {
			award = "death_22",
			job = "arm_fac",
			difficulty = deathwish
		},
		death_transport_park = {
			award = "death_23",
			job = "arm_par",
			difficulty = deathwish
		},
		death_transport_underpass = {
			award = "death_24",
			job = "arm_und",
			difficulty = deathwish
		},
		death_transport_train = {
			award = "death_25",
			job = "arm_for",
			difficulty = deathwish
		},
		death_election_day = {
			award = "bob_9",
			job = "election_day",
			difficulty = deathwish
		},
		death_kosugi = {
			award = "kosugi_6",
			job = "kosugi",
			difficulty = deathwish
		},
		death_bigbank = {
			award = "bigbank_9",
			job = "big",
			difficulty = deathwish
		},
		death_miami = {
			award = "pig_1",
			job = "mia",
			difficulty = deathwish
		},
		death_artgallery = {
			award = "squek",
			job = "gallery",
			difficulty = deathwish
		},
		death_hoxton = {
			award = "bulldog_2",
			job = "hox",
			difficulty = deathwish
		},
		death_mus = {
			award = "bat_1",
			job = "mus",
			difficulty = deathwish
		},
		death_red = {
			award = "green_5",
			job = "red2",
			difficulty = deathwish
		},
		death_dinner = {
			award = "farm_5",
			job = "dinner",
			difficulty = deathwish
		},
		death_hox_3 = {
			award = "payback_1",
			job = "hox_3",
			difficulty = deathwish
		},
		death_rat = {
			award = "djur_1",
			job = "rat",
			difficulty = deathwish
		},
		death_cage = {
			award = "fort_1",
			job = "cage",
			difficulty = deathwish
		},
		death_shoutout = {
			award = "melt_1",
			job = "shoutout_raid",
			difficulty = deathwish
		},
		death_arena = {
			award = "live_1",
			job = "arena",
			difficulty = deathwish
		},
		death_kenaz = {
			award = "kenaz_1",
			difficulty = deathwish,
			jobs = {
				"kenaz"
			}
		},
		death_sinus = {
			award = "sinus_2",
			job = "jolly",
			difficulty = deathwish
		},
		death_nails = {
			award = "lab_3",
			job = "nail",
			difficulty = deathwish
		},
		death_berry = {
			award = "berry_1",
			job = "pbr",
			difficulty = deathwish
		},
		death_jerry = {
			award = "jerry_1",
			job = "pbr2",
			difficulty = deathwish
		},
		death_peta = {
			award = "peta_1",
			difficulty = deathwish,
			jobs = {
				"peta"
			}
		},
		death_pal = {
			award = "pal_1",
			job = "pal",
			difficulty = deathwish
		},
		death_man = {
			award = "man_1",
			job = "man",
			difficulty = deathwish
		},
		death_dark = {
			award = "dark_1",
			job = "dark",
			difficulty = deathwish
		},
		death_cane = {
			award = "cane_1",
			job = "cane",
			difficulty = deathwish
		},
		death_flat = {
			award = "flat_1",
			job = "flat",
			difficulty = deathwish
		},
		death_mad = {
			award = "mad_1",
			job = "mad",
			difficulty = deathwish
		},
		death_born = {
			award = "born_1",
			job = "born",
			difficulty = deathwish
		},
		death_help = {
			award = "orange_2",
			job = "help",
			difficulty = deathwish
		},
		death_moon = {
			award = "moon_2",
			job = "moon",
			difficulty = deathwish
		},
		death_friend = {
			award = "friend_2",
			job = "friend",
			difficulty = deathwish
		},
		death_spa = {
			award = "spa_2",
			job = "spa",
			difficulty = deathwish
		},
		death_fish = {
			award = "fish_2",
			job = "fish",
			difficulty = deathwish
		},
		death_glace = {
			award = "glace_6",
			job = "glace",
			difficulty = deathwish
		},
		death_run = {
			award = "run_6",
			job = "run",
			difficulty = deathwish
		},
		complete_pines_deathwish = {
			award = "deer_5",
			difficulty = deathwish,
			jobs = {"pines"}
		},
		complete_crojob_for_deathwish = {
			award = "cow_2",
			difficulty = deathwish,
			jobs = {
				"crojob_wrapper",
				"crojob2",
				"crojob2_night"
			}
		},
		complete_crojob_dock_deathwish = {
			award = "cow_7",
			difficulty = deathwish,
			jobs = {
				"crojob1"
			}
		},
		complete_hoxton = {
			award = "bulldog_1",
			jobs = {"hox", "hox_pro"}
		},
		complete_pines_normal = {
			award = "deer_1",
			difficulty = normal,
			jobs = {"pines"}
		},
		complete_pines_hard = {
			award = "deer_2",
			difficulty = hard,
			jobs = {"pines"}
		},
		complete_pines_veryhard = {
			award = "deer_3",
			difficulty = veryhard,
			jobs = {"pines"}
		},
		complete_pines_overkill = {
			award = "deer_4",
			difficulty = overkill,
			jobs = {"pines"}
		},
		complete_crojob_for_all = {
			award = "cow_1",
			difficulty = any,
			jobs = {"crojob_wrapper", "crojob2", "crojob2_night"}
		},
		complete_crojob_dock_all = {
			award = "cow_6",
			difficulty = any,
			jobs = {"crojob1"}
		},
		melt_2 = {
			award = "melt_2",
			job = "shoutout_raid",
			difficulty = any
		},
		trk_sh_0 = {
			award = "trk_sh_0",
			job = "dinner",
			difficulty = any
		},
		sah_1 = {
			award = "sah_1",
			job = "sah",
			difficulty = any
		},
		hox_3_silent = {
			stealth = true,
			award = "payback_2",
			job = "hox_3"
		},
		owe_saw = {
			award = "ameno_1",
			job = "nightclub",
			equipped_team = {primary = "wpn_fps_saw"}
		},
		challenge_pain_train = {
			loud = true,
			num_players = 4,
			challenge_award = "challenge_winters_mutated",
			need_full_job = true,
			jobs = {"firestarter", "firestarter_pro"},
			difficulty = overkill_or_above,
			equipped_team = {
				secondary_unmodded = true,
				primary_unmodded = true,
				primaries = {
					"wpn_fps_ass_74"
				},
				secondaries = {
					"wpn_fps_smg_olympic"
				}
			}
		},
		pain_train = {
			loud = true,
			num_players = 4,
			award = "ameno_4",
			need_full_job = true,
			jobs = {"firestarter", "firestarter_pro"},
			difficulty = overkill_or_above,
			equipped_team = {
				secondary_unmodded = true,
				primary_unmodded = true,
				primaries = {
					"wpn_fps_ass_74"
				},
				secondaries = {
					"wpn_fps_smg_olympic"
				}
			}
		},
		turtle_wins = {
			timer = 240,
			stealth = true,
			award = "ameno_6",
			job = "gallery",
			equipped_team = {
				reverse_deployable = true,
				armor = "level_7",
				deployable = "armor_kit"
			}
		},
		anticimex = {
			num_players = 4,
			award = "ovk_1",
			need_full_job = true,
			jobs = {"alex", "alex_pro"},
			difficulty = overkill_or_above,
			equipped_team = {
				armor = "level_6",
				mask = "the_overkill_mask",
				primaries = {"wpn_fps_lmg_m134", "wpn_fps_rpg7"}
			}
		},
		modern_ninja = {
			stealth = true,
			award = "ovk_2",
			job = "kosugi",
			equipped = {primaries = {weapon_id = "m134"}}
		},
		newbee = {
			award = "ovk_4",
			need_full_job = true,
			jobs = {"watchdogs_wrapper", "watchdogs_wrapper_pro"},
			difficulty = hard_or_above,
			equipped_team = {
				num_skills = 0,
				primaries = {
					"wpn_fps_ass_amcar"
				},
				secondaries = {
					"wpn_fps_pis_g17"
				}
			}
		},
		intel_thief = {
			award = "ovk_6",
			stealth = true,
			levels = {
				"welcome_to_the_jungle_1",
				"welcome_to_the_jungle_1_night"
			},
			difficulty = overkill_or_above
		},
		ovk_8 = {
			num_players = 2,
			award = "ovk_8",
			need_full_job = true,
			jobs = {
				"welcome_to_the_jungle_wrapper_prof"
			},
			difficulty = overkill_or_above,
			equipped_team = {
				armor = "level_1",
				primaries = {
					"wpn_fps_x_b92fs"
				}
			}
		},
		kenaz_silent = {
			stealth = true,
			award = "kenaz_2",
			jobs = {"kenaz", "kenaz_pro"}
		},
		kenaz_timed = {
			timer = 840,
			award = "kenaz_4",
			jobs = {"kenaz", "kenaz_pro"}
		},
		not_for_old_men = {
			stealth = true,
			award = "gage4_11",
			equipped = {
				secondaries = {
					weapon_id = "serbu",
					blueprint = {
						{
							"wpn_fps_upg_ns_shot_thick"
						}
					}
				}
			}
		},
		turtles_3 = {
			killed_by_weapons = 0,
			stealth = true,
			award = "turtles_3",
			killed_by_melee = 0,
			killed_by_grenade = 4,
			civilians_killed = 0,
			equipped = {grenades = "wpn_prj_four"}
		},
		jordan_3 = {
			award = "brooklyn_3",
			memory = {
				is_shortterm = false
			}
		},
		jordan_4 = {
			jump_timer = 4,
			award = "brooklyn_4",
			memory = {
				value = true,
				is_shortterm = false
			}
		},
		steel_1 = {
			num_players = 4,
			award = "steel_1",
			need_full_job = true,
			difficulty = overkill_or_above,
			equipped_team = {
				primaries = {"wpn_fps_bow_ecp", "wpn_fps_bow_elastic"},
				masks = {
					"mason_knight_veteran",
					"agatha_knight",
					"agatha_vanguard_veteran",
					"mason_vanguard_veteran"
				},
				armors = {
					"level_3",
					"level_4",
					"level_5",
					"level_6",
					"level_7"
				},
				melee_weapons = {
					"morning",
					"buck",
					"beardy",
					"great"
				}
			}
		},
		green_2 = {
			num_players = 4,
			award = "green_2",
			job = "red2",
			difficulty = overkill_or_above,
			equipped_team = {
				primaries = {
					"wpn_fps_shot_r870"
				},
				secondaries = {
					"wpn_fps_pis_beretta"
				},
				characters = {
					"russian",
					"german",
					"spanish",
					"old_hoxton"
				}
			}
		},
		jerry_5 = {
			award = "jerry_5",
			job = "pbr2",
			difficulty = hard_or_above,
			equipped_team = {
				secondary_category = "pistol",
				armor = "level_1",
				primary_category = "akimbo"
			}
		},
		cane_4 = {
			award = "cane_4",
			job = "cane",
			equipped_team = {
				secondary_category = "shotgun",
				primary_category = "shotgun"
			}
		},
		mad_3 = {
			award = "mad_3",
			job = "mad",
			difficulty = veryhard_or_above,
			memory = {
				value = true,
				is_shortterm = false
			}
		},
		mad_4 = {
			award = "mad_4",
			job = "mad",
			difficulty = overkill_or_above,
			equipped_team = {
				primaries = {
					"wpn_fps_ass_akm_gold"
				},
				masks = {
					"rus_hat"
				}
			}
		},
		flake_1 = {
			award = "flake_1",
			need_full_job = true,
			jobs = {"framing_frame", "framing_frame_pro"},
			difficulty = hard_or_above,
			equipped_team = {
				num_skills = 0,
				armor = "level_1",
				primaries = {
					"wpn_fps_snp_model70"
				},
				secondaries = {
					"wpn_fps_pis_judge"
				}
			}
		},
		pim_4 = {
			everyone_killed_by_melee = 0,
			award = "pim_4",
			jobs = {"firestarter", "firestarter_pro"},
			need_full_job = true,
			everyone_killed_by_grenade = 0,
			difficulty = overkill_or_above,
			shots_by_weapon = {
				"packrat",
				"x_packrat"
			}
		},
		orange_6 = {
			award = "orange_6",
			job = "help",
			need_full_job = true,
			everyone_killed_by_grenade = 0,
			everyone_killed_by_weapons = 0,
			difficulty = hard_or_above,
			characters = {
				"old_hoxton"
			},
			equipped_team = {
				melee_weapons = {
					"toothbrush"
				}
			}
		},
		tango_3 = {
			award = "tango_achieve_3",
			difficulty = veryhard_or_above,
			killed_by_blueprint = {
				blueprint = "wpn_fps_upg_o_spot",
				amount = 200
			}
		},
		spa_4 = {
			award = "spa_4",
			job = "spa",
			need_full_job = true,
			difficulty = overkill_or_above,
			equipped_team = {primary_category = "snp"}
		},
		fish_4 = {
			timer = 360,
			award = "fish_4",
			job = "fish",
			difficulty = overkill_or_above
		},
		fish_5 = {
			everyone_killed_by_weapons = 0,
			everyone_killed_by_melee = 0,
			award = "fish_5",
			job = "fish",
			everyone_killed_by_grenade = 0
		},
		grv_1 = {
			award = "grv_1",
			difficulty = overkill_or_above,
			equipped_outfit = {
				secondary = "wpn_fps_smg_coal",
				melee_weapon = "oxide",
				primaries = {
					"wpn_fps_snp_siltstone",
					"wpn_fps_ass_flint"
				}
			}
		},
		grv_4 = {
			stealth = true,
			award = "grv_4",
			equipped_outfit = {
				secondary = "wpn_fps_smg_coal",
				melee_weapon = "oxide",
				primaries = {
					"wpn_fps_snp_siltstone",
					"wpn_fps_ass_flint"
				}
			}
		},
		glace_1 = {
			award = "glace_1",
			job = "glace",
			difficulty = any
		},
		wwh_6 = {
			award = "wwh_6",
			job = "wwh",
			difficulty = deathwish
		},
		dah_1 = {
			award = "dah_1",
			job = "dah",
			difficulty = any
		},
		dah_6 = {
			award = "dah_6",
			job = "dah",
			difficulty = deathwish
		},
		rvd_6 = {
			award = "rvd_6",
			job = "rvd",
			difficulty = deathwish
		},
		rvd_8 = {
			melee_used = false,
			award = "rvd_8",
			jobs = {"rvd", "rvd_pro"},
			difficulty = overkill_or_above,
			weapons_used = {
				"corgi"
			},
			equipped = {
				primaries = {
					weapon_id = "corgi"
				}
			}
		},
		brb_6 = {
			award = "brb_6",
			job = "brb",
			difficulty = deathwish
		},
		ckr_6 = {
			award = "ckr_6",
			job = "hvh",
			difficulty = deathwish
		},
		nbm_1 = {
			award = "nbm_1",
			job = "haunted",
			difficulty = normal
		},
		nbm_2 = {
			award = "nbm_2",
			job = "haunted",
			difficulty = hard
		},
		nbm_3 = {
			award = "nbm_3",
			job = "haunted",
			difficulty = veryhard
		},
		nbm_4 = {
			award = "nbm_4",
			job = "haunted",
			difficulty = overkill
		},
		halloween_nightmare_5 = {
			award = "halloween_nightmare_5",
			job = "haunted",
			difficulty = deathwish
		},
		tag_6 = {
			award = "tag_6",
			job = "tag",
			difficulty = deathwish
		},
		des_6 = {
			award = "des_6",
			job = "des",
			difficulty = deathwish
		},
		cac_4 = {
			loud = true,
			award = "cac_4",
			memory = {
				is_shortterm = false
			}
		},
		cac_5 = {
			award = "cac_5",
			job = "kosugi",
			no_preplan = true,
			difficulty = overkill_or_above
		},
		cac_23 = {
			everyone_killed_by_grenade = 0,
			award = "cac_23",
			job = "man",
			everyone_used_weapon_category = "bow",
			everyone_killed_by_melee = 0,
			no_bots = true,
			difficulty = veryhard_or_above,
			equipped_team = {
				primary_unmodded = true,
				primary_category = "bow"
			}
		},
		cac_27 = {
			everyone_killed_by_grenade = 0,
			award = "cac_27",
			job = "wwh",
			everyone_used_weapon_category = "flamethrower",
			everyone_killed_by_melee = 0,
			equipped_team = {
				primary_category = "flamethrower"
			}
		},
		cac_31 = {
			loud = true,
			award = "cac_31",
			max_players = 1,
			no_bots = true,
			difficulty = overkill_or_above
		},
		sah_6 = {
			award = "sah_6",
			job = "sah",
			difficulty = deathwish
		},
		nmh_1 = {
			award = "nmh_1",
			job = "nmh",
			difficulty = any
		},
		nmh_6 = {
			award = "nmh_6",
			job = "nmh",
			difficulty = deathwish
		},
		bph_6 = {
			award = "bph_6",
			job = "bph",
			difficulty = deathwish
		},
		vit_6 = {
			award = "vit_6",
			job = "vit",
			difficulty = deathwish
		},
		vit_11 = {
			award = "vit_11",
			job = "vit",
			masks = {
				"bush",
				"clinton",
				"franklin",
				"grant",
				"lincoln",
				"nixon",
				"obama",
				"washington",
				"win_donald",
				"win_donald_mega"
			},
			difficulty = overkill_or_above
		},
		mex_6 = {
			award = "mex_6",
			job = "mex",
			difficulty = deathwish
		},
		mex2_6 = {
			award = "mex2_6",
			job = "mex_cooking",
			difficulty = deathwish
		},
		bex_1 = {
			award = "bex_1",
			job = "bex",
			difficulty = normal
		},
		bex_2 = {
			award = "bex_2",
			job = "bex",
			difficulty = hard
		},
		bex_3 = {
			award = "bex_3",
			job = "bex",
			difficulty = veryhard
		},
		bex_4 = {
			award = "bex_4",
			job = "bex",
			difficulty = overkill
		},
		bex_6 = {
			award = "bex_6",
			job = "bex",
			difficulty = deathwish
		},
		uno_1 = {
			award = "uno_1",
			bag_loot_value = 400000,
			jobs = {
				"branchbank_pro",
				"branchbank_prof",
				"branchbank_gold_prof",
				"branchbank_cash",
				"branchbank_deposit"
			}
		},
		bain_jobs = {
			complete_job = true,
			contract = "bain",
			challenge_stat = "bain_jobs"
		},
		vlad_jobs = {
			complete_job = true,
			contract = "vlad",
			challenge_stat = "vlad_jobs"
		},
		hector_jobs = {
			complete_job = true,
			contract = "hector",
			challenge_stat = "hector_jobs"
		},
		elephant_jobs = {
			complete_job = true,
			contract = "the_elephant",
			challenge_stat = "elephant_jobs"
		},
		dentist_jobs = {
			complete_job = true,
			contract = "the_dentist",
			challenge_stat = "dentist_jobs"
		},
		butcher_jobs = {
			complete_job = true,
			contract = "the_butcher",
			challenge_stat = "butcher_jobs"
		},
		any_jobs = {
			complete_job = true,
			challenge_stat = "any_jobs"
		},
		monthly_rats = {
			challenge_award = "monthly_rats",
			need_full_job = true,
			jobs = {"alex", "alex_pro"},
			difficulty = hard_or_above,
			equipped_team = {
				num_skills = 0,
				armor = "level_1",
				primaries = {
					"wpn_fps_ass_amcar"
				},
				secondaries = {
					"wpn_fps_pis_g17"
				}
			}
		},
		monthly_firestarter = {
			challenge_award = "monthly_firestarter",
			need_full_job = true,
			jobs = {"firestarter", "firestarter_pro"},
			difficulty = hard_or_above,
			equipped_team = {
				num_skills = 0,
				armor = "level_1",
				primaries = {
					"wpn_fps_ass_amcar"
				},
				secondaries = {
					"wpn_fps_pis_g17"
				}
			}
		},
		monthly_shadowraid = {
			challenge_award = "monthly_shadowraid",
			job = "kosugi",
			need_full_job = true,
			difficulty = overkill_or_above,
			equipped_team = {
				num_skills = 0,
				armor = "level_1",
				primaries = {
					"wpn_fps_ass_amcar"
				},
				secondaries = {
					"wpn_fps_pis_g17"
				}
			}
		},
		challenge_safehouse_raid = {
			need_full_job = true,
			challenge_stat = "challenge_safehouse_raid",
			jobs = {
				"chill_combat"
			}
		},
		challenge_xmas_white = {
			need_full_job = true,
			challenge_award = "challenge_xmas_white",
			jobs = {
				"pines"
			}
		},
		challenge_xmas_santas = {
			need_full_job = true,
			challenge_award = "challenge_xmas_santas",
			jobs = {
				"cane"
			}
		},
		challenge_xmas_stealing = {
			need_full_job = true,
			challenge_award = "challenge_xmas_stealing",
			jobs = {
				"moon"
			}
		},
		challenge_art_ghost = {
			everyone_killed_by_melee = 0,
			challenge_award = "challenge_art_ghost",
			everyone_killed_by_weapons = 0,
			job = "gallery",
			everyone_killed_by_grenade = 0,
			stealth = true,
			secured = {
				carry_id = "painting",
				total_amount = 9
			}
		},
		challenge_cookoff_mutated = {
			need_full_job = true,
			challenge_award = "challenge_cookoff_mutated",
			mutators = 6,
			job = "rat"
		},
		challenge_mallcrasher_stealth = {
			need_full_job = true,
			challenge_award = "challenge_mallcrasher_stealth",
			stealth = true,
			job = "mallcrasher"
		},
		challenge_rats_pacifist = {
			need_full_job = true,
			challenge_award = "challenge_rats_pacifist",
			jobs = {"alex", "alex_pro"},
			memory = {is_shortterm = false}
		},
		challenge_crime_spree = {
			crime_spree = true,
			challenge_stat = "challenge_crime_spree"
		},
		challenge_walking_nightmare = {
			need_full_job = true,
			challenge_award = "challenge_walking_nightmare",
			jobs = {
				"pines",
				"cane",
				"moon"
			},
			mutators = {
				"MutatorTitandozers"
			}
		},
		challenge_clone_1 = {
			challenge_award = "challenge_clone_1",
			need_full_job = true,
			difficulty = overkill_or_above,
			jobs = {"hox", "hox_pro"},
			mutators = {
				{
					id = "MutatorEnemyReplacer",
					override_enemy = "tank"
				}
			}
		},
		challenge_clone_2 = {
			challenge_award = "challenge_clone_2",
			need_full_job = true,
			difficulty = overkill_or_above,
			jobs = {
				"welcome_to_the_jungle_wrapper_prof",
				"welcome_to_the_jungle_night_prof",
				"welcome_to_the_jungle_prof"
			},
			mutators = {
				{
					id = "MutatorEnemyReplacer",
					override_enemy = "taser"
				}
			}
		},
		challenge_clone_3 = {
			challenge_award = "challenge_clone_3",
			need_full_job = true,
			difficulty = overkill_or_above,
			jobs = {"watchdogs_wrapper", "watchdogs_night", "watchdogs", "watchdogs_wrapper_pro"},
			mutators = {
				{
					id = "MutatorEnemyReplacer",
					override_enemy = "shield"
				}
			}
		},
		challenge_clone_4 = {
			challenge_award = "challenge_clone_4",
			need_full_job = true,
			difficulty = overkill_or_above,
			jobs = {
				"help"
			},
			mutators = {
				{
					id = "MutatorEnemyReplacer",
					override_enemy = "spooc"
				}
			}
		},
		challenge_clone_5 = {
			challenge_award = "challenge_clone_5",
			need_full_job = true,
			difficulty = overkill_or_above,
			jobs = {
				"red2"
			},
			mutators = {
				{
					id = "MutatorEnemyReplacer",
					override_enemy = "medic"
				}
			}
		},
		monthly_prison = {
			everyone_killed_by_grenade = 0,
			challenge_award = "monthly_prison",
			everyone_killed_by_weapons = 0,
			job = "help",
			difficulty = overkill_or_above
		},
		monthly_tabula = {
			challenge_award = "monthly_tabula",
			crime_spree = 25,
			equipped_team = {
				primaries = {
					"wpn_fps_ass_amcar"
				},
				secondaries = {
					"wpn_fps_pis_g17"
				}
			}
		},
		trophy_transport_crossroads = {
			trophy_stat = "trophy_transport_crossroads",
			level_id = "arm_cro",
			difficulty = overkill_or_above
		},
		trophy_transport_downtown = {
			trophy_stat = "trophy_transport_downtown",
			level_id = "arm_hcm",
			difficulty = overkill_or_above
		},
		trophy_transport_harbor = {
			trophy_stat = "trophy_transport_harbor",
			level_id = "arm_fac",
			difficulty = overkill_or_above
		},
		trophy_transport_park = {
			trophy_stat = "trophy_transport_park",
			level_id = "arm_par",
			difficulty = overkill_or_above
		},
		trophy_transport_underpass = {
			trophy_stat = "trophy_transport_underpass",
			level_id = "arm_und",
			difficulty = overkill_or_above
		},
		trophy_transport_train = {
			trophy_stat = "trophy_transport_train",
			level_id = "arm_for",
			difficulty = overkill_or_above
		},
		trophy_escapes = {
			trophy_stat = "trophy_escapes",
			levels = {
				"escape_cafe",
				"escape_cafe_day",
				"escape_park",
				"escape_park_day",
				"escape_street",
				"escape_overpass",
				"escape_garage"
			}
		},
		trophy_basics_stealth = {
			job = "short1",
			trophy_stat = "trophy_basics_stealth"
		},
		trophy_basics_loud = {
			job = "short2",
			trophy_stat = "trophy_basics_loud"
		},
		trophy_car_shop = {
			job = "cage",
			trophy_stat = "trophy_car_shop"
		},
		trophy_golden_grin = {
			trophy_stat = "trophy_golden_grin",
			used_weapon_category = "pistol",
			difficulty = deathwish,
			jobs = {"kenaz", "kenaz_pro"},
			equipped = {
				primaries = {
					category = "pistol",
					blueprint_part_data = {
						sub_type = "silencer"
					}
				},
				secondaries = {
					category = "pistol",
					blueprint_part_data = {
						sub_type = "silencer"
					}
				}
			}
		},
		trophy_nightclub_dw = {
			stealth = true,
			trophy_stat = "trophy_nightclub_dw",
			job = "nightclub",
			difficulty = deathwish
		},
		trophy_tiara = {
			trophy_stat = "trophy_tiara",
			job = "ukrainian_job_prof",
			difficulty = deathwish,
			equipped_team = {
				deployable = "ecm_jammer",
				reverse_deployable = true
			}
		},
		trophy_train_bomb = {
			trophy_stat = "trophy_train_bomb",
			difficulty = deathwish,
			jobs = {
				"crojob_wrapper",
				"crojob2",
				"crojob2_night"
			}
		},
		trophy_shoutout = {
			timer = 420,
			trophy_stat = "trophy_shoutout",
			job = "shoutout_raid",
			difficulty = overkill_or_above
		},
		trophy_stealth = {
			stealth = true,
			trophy_stat = "trophy_stealth",
			complete_job = true,
			difficulty = overkill_or_above
		},
		trophy_bank_heists = {
			trophy_stat = "trophy_bank_heists",
			difficulty = overkill_or_above,
			jobs = {
				"branchbank_pro",
				"branchbank_prof",
				"branchbank_gold_prof",
				"branchbank_cash",
				"branchbank_deposit"
			}
		},
		trophy_carshop_stealth = {
			trophy_stat = "trophy_carshop_stealth",
			job = "cage",
			equipped_team = {
				reverse_deployable = true,
				deployable = "ecm_jammer",
				detection = {
					max = 100,
					min = 70
				}
			}
		},
		trophy_watchout = {
			trophy_stat = "trophy_watchout",
			need_full_job = true,
			used_weapon_category = "snp",
			total_accuracy = 100,
			jobs = {"watchdogs_wrapper", "watchdogs_night", "watchdogs", "watchdogs_wrapper_pro"},
			equipped = {
				primaries = {
					category = "snp"
				}
			}
		},
		trophy_piggy_bank = {
			trophy_stat = "trophy_piggy_bank",
			job = "big",
			difficulty = overkill_or_above,
			equipped_team = {
				num_skills = 0
			}
		},
		trophy_jfk = {
			everyone_killed_by_melee = 0,
			everyone_killed_by_grenade = 0,
			job = "man",
			everyone_used_weapon_category = "snp",
			trophy_stat = "trophy_jfk",
			difficulty = overkill_or_above,
			equipped_team = {
				armor = "level_1",
				num_skills = 0,
				primary_category = "snp"
			}
		},
		trophy_dance = {
			killed_by_weapons = 0,
			killed_by_melee = 0,
			job = "nightclub",
			trophy_stat = "trophy_dance",
			killed_by_grenade = 0,
			equipped_team = {
				deployable = "trip_mine"
			}
		},
		trophy_fbi = {
			trophy_stat = "trophy_fbi",
			stealth = true,
			levels = {
				"firestarter_2"
			}
		},
		trophy_host = {
			need_full_job = true,
			trophy_stat = "trophy_host",
			is_host = true
		},
		trophy_framing_frame = {
			need_full_stealth = true,
			trophy_stat = "trophy_framing_frame",
			need_full_job = true,
			difficulty = overkill_or_above,
			jobs = {"framing_frame", "framing_frame_pro"}
		},
		trophy_courtesy = {
			complete_job = true,
			job = "pbr",
			trophy_stat = "trophy_courtesy",
			difficulty = deathwish,
			killed = {medic = 0}
		},
		trophy_evolution = {
			complete_job = true,
			trophy_stat = "trophy_evolution",
			mutators = true
		},
		trophy_flawless = {
			complete_job = true,
			num_players = 4,
			trophy_stat = "trophy_flawless",
			difficulty = deathwish,
			mutators = {
				"MutatorFriendlyFire"
			},
			memory = {
				is_shortterm = false
			}
		},
		trophy_defender = {
			complete_job = true,
			trophy_stat = "trophy_defender",
			difficulty = overkill_or_above,
			jobs = {"chill_combat"}
		},
		trophy_friendly_car = {
			stealth = false,
			complete_job = true,
			job = "friend",
			num_players = 1,
			trophy_stat = "trophy_friendly_car",
			difficulty = deathwish
		},
		trophy_fish_trophy = {
			need_full_job = true,
			trophy_stat = "trophy_fish_trophy",
			job = "fish",
			equipped_team = {
				detection = {
					max = 100,
					min = 75
				}
			}
		},
		trophy_glace_completion = {
			trophy_stat = "trophy_glace_completion",
			job = "glace",
			difficulty = any
		},
		daily_classics = {
			trophy_stat = "daily_classics",
			jobs = {
				"red2",
				"flat",
				"dinner",
				"pal",
				"man",
				"run",
				"glace",
				"dah"
			}
		},
		daily_discord = {
			converted_cops = 1,
			trophy_stat = "daily_discord"
		},
		daily_fwtd = {
			everyone_killed_by_melee = 0,
			everyone_killed_by_grenade = 0,
			job = "red2",
			trophy_stat = "daily_fwtd",
			difficulty = overkill_or_above,
			everyone_weapons_used = {
				"sentry_gun",
				"swat_van_turret_module"
			}
		},
		daily_gears = {
			trophy_stat = "daily_gears",
			difficulty = overkill_or_above,
			jobs = {
				"arm_wrapper",
				"arm_cro",
				"arm_und",
				"arm_hcm",
				"arm_fac",
				"arm_par"
			},
			equipped_team = {
				primaries = {"wpn_fps_saw"}
			},
			memory = {is_shortterm = true}
		},
		daily_spacetime = {
			need_full_job = true,
			trophy_stat = "daily_spacetime",
			jobs = {"hox", "hox_pro"},
			characters = {
				"old_hoxton"
			}
		},
		daily_night_out = {
			trophy_stat = "daily_night_out",
			everyone_killed_by_weapons = 0,
			job = "nightclub"
		},
		daily_naked = {
			trophy_stat = "daily_naked",
			difficulty = overkill_or_above,
			jobs = {
				"pbr",
				"pbr2"
			},
			equipped_team = {
				perk_deck = 3,
				armor = "level_1",
				num_skills = 0
			}
		},
		daily_ninja = {
			killed_by_weapons = 0,
			trophy_stat = "daily_ninja",
			levels = {"arm_cro"},
			equipped_outfit = {
				grenade = {
					"wpn_prj_ace",
					"wpn_prj_four",
					"wpn_prj_jav",
					"wpn_prj_hur",
					"wpn_prj_target",
					"chico_injector",
					"smoke_screen_grenade"
				}
			}
		},
		daily_whats_stealth = {
			job = "kosugi",
			need_full_job = true,
			trophy_stat = "daily_whats_stealth",
			difficulty = deathwish,
			equipped_team = {
				armor = "level_7"
			},
			memory = {
				is_shortterm = true
			}
		},
		daily_akimbo = {
			trophy_stat = "daily_akimbo",
			total_accuracy = 80,
			equipped_outfit = {
				primary_category = "akimbo"
			},
			equipped = {
				secondaries = {
					category = "pistol",
					blueprint_part_data = {
						sub_type = "silencer"
					}
				}
			}
		},
		story_basics_stealth = {
			job = "short1",
			story = "story_basics_stealth"
		},
		story_basics_loud = {
			job = "short2",
			story = "story_basics_loud"
		},
		story_jewelry_store = {
			job = "jewelry_store",
			story = "story_jewelry_store"
		},
		story_bank_heist = {
			story = "story_bank_heist",
			jobs = {
				"branchbank_pro",
				"branchbank_prof",
				"branchbank_gold_prof",
				"branchbank_cash",
				"branchbank_deposit"
			}
		},
		story_go_bank = {
			job = "roberts",
			story = "story_go_bank"
		},
		story_diamond_store = {
			job = "family",
			story = "story_diamond_store"
		},
		story_transport_mult = {
			story = "story_transport_mult",
			jobs = {
				"arm_wrapper",
				"arm_cro",
				"arm_und",
				"arm_hcm",
				"arm_fac",
				"arm_par"
			}
		},
		story_train_heist = {
			levels = {"arm_for"},
			story = "story_train_heist"
		},
		story_hard_mallcrasher = {
			job = "mallcrasher",
			story = "story_hard_mallcrasher",
			difficulty = hard_or_above
		},
		story_hard_four_store = {
			job = "four_stores",
			story = "story_hard_four_store",
			difficulty = hard_or_above
		},
		story_hard_white_xmas = {
			job = "pines",
			story = "story_hard_white_xmas",
			difficulty = hard_or_above
		},
		story_hard_ukrainian_job = {
			job = "ukrainian_job_prof",
			story = "story_hard_ukrainian_job",
			difficulty = hard_or_above
		},
		story_hard_meltdown = {
			job = "shoutout_raid",
			story = "story_hard_meltdown",
			difficulty = hard_or_above
		},
		story_hard_aftershock = {
			job = "jolly",
			story = "story_hard_aftershock",
			difficulty = hard_or_above
		},
		story_hard_stealing_xmas = {
			job = "moon",
			story = "story_hard_stealing_xmas",
			difficulty = hard_or_above
		},
		story_hard_nightclub = {
			job = "nightclub",
			story = "story_hard_nightclub",
			difficulty = hard_or_above
		},
		story_very_hard_watchdog = {
			story = "story_very_hard_watchdog",
			jobs = {"watchdogs_wrapper", "watchdogs_night", "watchdogs", "watchdogs_wrapper_pro"},
			difficulty = veryhard_or_above
		},
		story_very_hard_firestarter = {
			jobs = {"firestarter", "firestarter_pro"},
			story = "story_very_hard_firestarter",
			difficulty = veryhard_or_above
		},
		story_very_hard_rats = {
			jobs = {"alex", "alex_pro"},
			story = "story_very_hard_rats",
			difficulty = veryhard_or_above
		},
		story_very_hard_big_oil = {
			story = "story_very_hard_big_oil",
			jobs = {
				"welcome_to_the_jungle_wrapper_prof",
				"welcome_to_the_jungle_night_prof",
				"welcome_to_the_jungle_prof"
			},
			difficulty = veryhard_or_above
		},
		story_very_hard_framing_frames = {
			jobs = {"framing_frame", "framing_frame_pro"},
			story = "story_very_hard_framing_frames",
			difficulty = veryhard_or_above
		},
		story_very_hard_election_day = {
			jobs = {"election_day", "election_day_pro"},
			story = "story_very_hard_election_day",
			difficulty = veryhard_or_above
		},
		story_very_hard_big_bank = {
			job = "big",
			story = "story_very_hard_big_bank",
			difficulty = veryhard_or_above
		},
		story_very_hard_hotline_miami = {
			jobs = {"mia", "mia_pro"},
			story = "story_very_hard_hotline_miami",
			difficulty = veryhard_or_above
		},
		story_very_hard_hoxton_breakout = {
			jobs = {"hox", "hox_pro"},
			story = "story_very_hard_hoxton_breakout",
			difficulty = veryhard_or_above
		},
		story_very_hard_hoxton_revenge = {
			job = "hox_3",
			story = "story_very_hard_hoxton_revenge",
			difficulty = veryhard_or_above
		},
		story_very_hard_diamond = {
			job = "mus",
			story = "story_very_hard_diamond",
			difficulty = veryhard_or_above
		},
		story_very_hard_golden_grin = {
			jobs = {"kenaz", "kenaz_pro"},
			story = "story_very_hard_golden_grin",
			difficulty = veryhard_or_above
		},
		story_very_hard_bomb_dockyard = {
			job = "crojob1",
			story = "story_very_hard_bomb_dockyard",
			difficulty = veryhard_or_above
		},
		story_very_hard_bomb_forest = {
			story = "story_very_hard_bomb_forest",
			jobs = {
				"crojob_wrapper",
				"crojob2",
				"crojob2_night"
			},
			difficulty = veryhard_or_above
		},
		story_very_hard_scarface = {
			job = "friend",
			story = "story_very_hard_scarface",
			difficulty = veryhard_or_above
		},
		story_very_hard_alesso = {
			job = "arena",
			story = "story_very_hard_alesso",
			difficulty = veryhard_or_above
		},
		story_very_hard_counterfeit = {
			job = "pal",
			story = "story_very_hard_counterfeit",
			difficulty = veryhard_or_above
		},
		story_very_hard_first_world_bank = {
			job = "red2",
			story = "story_very_hard_first_world_bank",
			difficulty = veryhard_or_above
		},
		story_very_hard_murky_station = {
			job = "dark",
			story = "story_very_hard_murky_station",
			difficulty = veryhard_or_above
		},
		story_very_hard_boiling_point = {
			job = "mad",
			story = "story_very_hard_boiling_point",
			difficulty = veryhard_or_above
		},
		story_very_hard_goat_sim = {
			jobs = {"peta", "peta_pro"},
			story = "story_very_hard_goat_sim",
			difficulty = veryhard_or_above
		},
		story_very_hard_santas_workshop = {
			job = "cane",
			story = "story_very_hard_santas_workshop",
			difficulty = veryhard_or_above
		},
		story_very_hard_car_shop = {
			job = "cage",
			story = "story_very_hard_car_shop",
			difficulty = veryhard_or_above
		},
		story_very_hard_biker_heist = {
			jobs = {"born", "born_pro"},
			story = "story_very_hard_biker_heist",
			difficulty = veryhard_or_above
		},
		story_very_hard_panic_room = {
			job = "flat",
			story = "story_very_hard_panic_room",
			difficulty = veryhard_or_above
		},
		story_very_hard_brooklyn_10_10 = {
			job = "spa",
			story = "story_very_hard_brooklyn_10_10",
			difficulty = veryhard_or_above
		},
		story_very_hard_yacht = {
			job = "fish",
			story = "story_very_hard_yacht",
			difficulty = veryhard_or_above
		},
		story_very_hard_undercover = {
			job = "man",
			story = "story_very_hard_undercover",
			difficulty = veryhard_or_above
		},
		story_very_hard_slaughterhouse = {
			job = "dinner",
			story = "story_very_hard_slaughterhouse",
			difficulty = veryhard_or_above
		},
		story_very_hard_beneath_the_mountain = {
			job = "pbr",
			story = "story_very_hard_beneath_the_mountain",
			difficulty = veryhard_or_above
		},
		story_very_hard_birth_of_sky = {
			job = "pbr2",
			story = "story_very_hard_birth_of_sky",
			difficulty = veryhard_or_above
		},
		story_very_hard_heat_street = {
			job = "run",
			story = "story_very_hard_heat_street",
			difficulty = veryhard_or_above
		},
		story_very_hard_green_bridge = {
			job = "glace",
			story = "story_very_hard_green_bridge",
			difficulty = veryhard_or_above
		},
		story_very_hard_alaskan_deal = {
			job = "wwh",
			story = "story_very_hard_alaskan_deal",
			difficulty = veryhard_or_above
		},
		story_very_hard_diamond_heist = {
			job = "dah",
			story = "story_very_hard_diamond_heist",
			difficulty = veryhard_or_above
		},
		story_very_hard_reservoir_dogs = {
			jobs = {"rvd", "rvd_pro"},
			story = "story_very_hard_reservoir_dogs",
			difficulty = veryhard_or_above
		},
		story_very_hard_brooklyn_bank = {
			job = "brb",
			story = "story_very_hard_brooklyn_bank",
			difficulty = veryhard_or_above
		},
		story_very_hard_breakin_feds = {
			job = "tag",
			story = "story_very_hard_breakin_feds",
			difficulty = veryhard_or_above
		},
		story_very_hard_henrys_rock = {
			job = "des",
			story = "story_very_hard_henrys_rock",
			difficulty = veryhard_or_above
		},
		story_very_hard_sah = {
			job = "sah",
			story = "story_very_hard_sah",
			difficulty = veryhard_or_above
		},
		story_very_hard_bph = {
			job = "bph",
			story = "story_very_hard_bph",
			difficulty = veryhard_or_above
		},
		story_very_hard_nmh = {
			job = "nmh",
			story = "story_very_hard_nmh",
			difficulty = veryhard_or_above
		},
		story_very_hard_vit = {
			job = "vit",
			story = "story_very_hard_vit",
			difficulty = veryhard_or_above
		},
		challenge_srtd = {
			everyone_killed_by_melee = 0,
			everyone_killed_by_grenade = 0,
			job = "chill_combat",
			challenge_award = "challenge_srtd",
			difficulty = overkill_or_above,
			everyone_weapons_used = {
				"sentry_gun",
				"swat_van_turret_module"
			}
		},
		challenge_geneva = {
			complete_job = true,
			challenge_award = "challenge_geneva",
			job = "chill_combat",
			difficulty = overkill_or_above,
			killed = {
				medic = 0
			}
		}
	}
	local skirmish_complete_heists = {
		"skm_cas",
		"skm_big2",
		"skm_mallcrasher",
		"skm_arena",
		"skm_watchdogs_stage2",
		"skm_red2",
		"skm_run",
		"skm_mus",
		"skm_bex"
	}
	self.skirmish_wave_achievements = {}

	for index, job_id in pairs(skirmish_complete_heists) do
		local achievement_index = (index - 1) * 4
		self.skirmish_wave_achievements["skm_" .. tostring(achievement_index + 1)] = {
			skirmish_wave = 3,
			award = "skm_" .. tostring(achievement_index + 1),
			level_id = job_id
		}
		self.skirmish_wave_achievements["skm_" .. tostring(achievement_index + 2)] = {
			skirmish_wave = 5,
			award = "skm_" .. tostring(achievement_index + 2),
			level_id = job_id
		}
		self.skirmish_wave_achievements["skm_" .. tostring(achievement_index + 3)] = {
			skirmish_wave = 7,
			award = "skm_" .. tostring(achievement_index + 3),
			level_id = job_id
		}
		self.skirmish_wave_achievements["skm_" .. tostring(achievement_index + 4)] = {
			skirmish_wave = 9,
			award = "skm_" .. tostring(achievement_index + 4),
			level_id = job_id
		}
	end

	self.check_equipment_memory_on_leave = {
		self.complete_heist_achievements.daily_whats_stealth,
		self.complete_heist_achievements.daily_gears
	}
	self.complete_heist_statistics_achievements = {
		immortal_ballot = {
			num_players = 4,
			award = "ovk_5",
			total_downs = 0,
			levels = {
				"election_day_3",
				"election_day_3_skip1",
				"election_day_3_skip2"
			},
			difficulty = deathwish
		},
		full_two_twenty = {
			num_players = 4,
			total_kills = 120,
			award = "ovk_7",
			total_accuracy = 120
		},
		berry_4 = {
			is_dropin = false,
			award = "berry_4",
			level_id = "pbr",
			total_downs = 0,
			difficulty = overkill_or_above
		},
		flat_5 = {
			success = true,
			level_id = "flat",
			award = "flat_5",
			total_accuracy = 200
		},
		daily_professional = {
			trophy_stat = "daily_professional",
			difficulty = overkill_or_above,
			total_headshots = {
				invert = true,
				amount = 0
			}
		}
	}
	self.loot_cash_achievements = {
		mallrunner = {
			award = "ameno_3",
			total_value = 1800000,
			total_time = 50,
			jobs = {
				"mallcrasher"
			},
			difficulties = {
				"overkill_145"
			}
		},
		cane_5 = {
			award = "cane_5",
			job = "cane",
			no_deployable = true,
			no_assets = true,
			secured = {
				carry_id = "present",
				total_amount = 10
			}
		},
		pal_2 = {
			award = "pal_2",
			job = "pal",
			secured = {
				carry_id = "counterfeit_money",
				value = 1000000
			}
		},
		dah_9 = {
			award = "dah_9",
			job = "dah",
			difficulties = overkill_or_above,
			secured = {
				carry_id = "red_diamond",
				amount = 1
			}
		},
		trophy_tfturret = {
			trophy_stat = "trophy_tfturret",
			is_dropin = false,
			levels = {"arm_for"},
			difficulties = overkill_or_above,
			secured = {
				{
					carry_id = "ammo",
					total_amount = 20
				},
				{
					carry_id = "turret",
					total_amount = 3
				}
			}
		},
		daily_mortage = {
			trophy_stat = "daily_mortage",
			is_dropin = false,
			jobs = {
				"family"
			},
			secured = {
				carry_id = "diamonds",
				total_amount = 16
			}
		},
		daily_toast = {
			trophy_stat = "daily_toast",
			is_dropin = false,
			jobs = {
				"pines"
			},
			secured = {
				carry_id = "sandwich",
				amount = 1
			}
		},
		daily_lodsofemone = {
			trophy_stat = "daily_lodsofemone",
			secured = {
				carry_id = "money",
				amount = 1
			}
		},
		daily_heirloom = {
			trophy_stat = "daily_heirloom",
			is_dropin = false,
			jobs = {
				"kosugi"
			},
			secured = {
				carry_id = "samurai_suit",
				total_amount = 4
			}
		},
		daily_candy = {
			trophy_stat = "daily_candy",
			secured = {
				{
					amount = 1,
					carry_id = {
						"coke",
						"coke_light",
						"coke_pure",
						"present",
						"yayo"
					}
				}
			}
		},
		daily_art = {
			trophy_stat = "daily_art",
			is_dropin = false,
			jobs = {
				"gallery"
			},
			secured = {
				carry_id = "painting",
				total_amount = 9
			}
		},
		trophy_coke = {
			trophy_stat = "trophy_coke",
			jobs = {
				"friend"
			},
			secured = {
				{
					amount = 1,
					carry_id = {
						"yayo"
					}
				}
			}
		},
		story_shadow_raid_bags = {
			amount = 1,
			story = "story_shadow_raid_bags",
			jobs = {
				"kosugi"
			}
		}
	}
	self.job_list = {
		vlad = {
			"ukrainian_job_prof",
			"mallcrasher",
			"four_stores",
			"nightclub",
			"pines",
			"shoutout_raid",
			"jolly",
			"cane",
			"peta",
			"moon"
		},
		hector = {
			"watchdogs_wrapper",
			"watchdogs_wrapper_pro",
			"alex",
			"alex_pro",
			"firestarter",
			"firestarter_pro"
		},
		the_elephant = {
			"framing_frame",
			"framing_frame_pro",
			"welcome_to_the_jungle_wrapper_prof",
			"election_day",
			"election_day_pro",
			"born",
			"born_pro"
		},
		bain = {
			"jewelry_store",
			"family",
			"roberts",
			"branchbank_pro",
			"branchbank_prof",
			"branchbank_gold_prof",
			"branchbank_cash",
			"branchbank_deposit",
			"arm_wrapper",
			"arm_cro",
			"arm_hcm",
			"arm_fac",
			"arm_par",
			"arm_und",
			"arm_for",
			"kosugi",
			"gallery",
			"rat",
			"cage",
			"arena",
			"rvd",
			"rvd_pro"
		},
		the_dentist = {
			"big",
			"mia",
			"mia_pro",
			"hox",
			"hox_pro",
			"mus",
			"hox_3",
			"kenaz",
			"kenaz_pro"
		},
		the_butcher = {
			"crojob_wrapper",
			"crojob1",
			"friend"
		},
		classic = {
			"red2",
			"dinner",
			"pal",
			"man",
			"flat",
			"run",
			"glace",
			"dah",
			"nmh"
		},
		locke = {
			"pbr",
			"pbr2",
			"wwh",
			"brb",
			"tag",
			"des",
			"sah",
			"bph",
			"vit",
			"mex",
			"mex_cooking",
			"bex",
			"pex"
		},
		jimmy = {
			"mad",
			"dark"
		},
		events = {
			"nail",
			"help",
			"haunted",
			"hvh"
		},
		the_continental = {
			"spa",
			"fish"
		}
	}
	self.persistent_stat_unlocks = {
		gage_9_stats = { 			{award = "gage_9", 			at = 100 			}},
		halloween_4_stats = { 		{award = "halloween_4",		at = 50 			}},
		halloween_5_stats = { 		{award = "halloween_5",		at = 25 			}},
		halloween_6_stats = { 		{award = "halloween_6",		at = 666 			}},
		halloween_7_stats = { 		{award = "halloween_7",		at = 50 			}},
		armored_8_stat = { 			{award = "armored_8", 		at = 7 				}},
		armored_10_stat = { 		{award = "armored_10", 		at = 61 			}},
		gage2_3_stats = { 			{award = "gage2_3", 		at = 50 			}},
		scorpion_1_stats = { 		{award = "scorpion_1", 		at = 100 			}},
		gage_10_stats = { 			{award = "gage_10", 		at = 100 			}},
		halloween_8_stats = { 		{award = "halloween_8",		at = 666 			}},
		armored_5_stat = { 			{award = "armored_5", 		at = 378 			}},
		armored_7_stat = { 			{award = "armored_7", 		at = 69 			}},
		armored_9_stat = { 			{award = "armored_9", 		at = 95 			}},
		gage_1_stats = { 			{award = "gage_1", 			at = 100 			}},
		gage_2_stats = { 			{award = "gage_2", 			at = 100 			}},
		gage_3_stats = { 			{award = "gage_3", 			at = 100 			}},
		gage_4_stats = { 			{award = "gage_4", 			at = 100 			}},
		gage_5_stats = { 			{award = "gage_5", 			at = 100 			}},
		gage_6_stats = { 			{award = "gage_6", 			at = 100 			}},
		gage_7_stats = { 			{award = "gage_7", 			at = 100 			}},
		gage3_12_stats = { 			{award = "gage3_12", 		at = 10 			}},
		gage3_2_stats = { 			{award = "gage3_2", 		at = 6 				}},
		gage3_3_stats = { 			{award = "gage3_3", 		at = 50 			}},
		gage3_4_stats = { 			{award = "gage3_4", 		at = 100 			}},
		gage3_5_stats = { 			{award = "gage3_5", 		at = 250 			}},
		gage3_6_stats = { 			{award = "gage3_6", 		at = 500 			}},
		gage3_7_stats = { 			{award = "gage3_7", 		at = 25 			}},
		gage3_11_stats = { 			{award = "gage3_11", 		at = 10 			}},
		gage3_13_stats = { 			{award = "gage3_13", 		at = 10 			}},
		gage3_14_stats = { 			{award = "gage3_14", 		at = 25 			}},
		gage3_17_stats = { 			{award = "gage3_17", 		at = 250 			}},
		gage4_6_stats = { 			{award = "gage4_6", 		at = 50 			}},
		gage4_8_stats = { 			{award = "gage4_8", 		at = 10 			}},
		gage4_10_stats = { 			{award = "gage4_10", 		at = 10 			}},
		gage5_1_stats = { 			{award = "gage5_1", 		at = 25 			}},
		gage5_9_stats = { 			{award = "gage5_9", 		at = 10 			}},
		gage5_10_stats = { 			{award = "gage5_10", 		at = 200 			}},
		eagle_1_stats = { 			{award = "eagle_1", 		at = 25 			}},
		ameno_08_stats = { 			{award = "ameno_8", 		at = 100 			}},
		pim_1_stats = { 			{award = "pim_1", 			at = 30 			}},
		pim_3_stats = { 			{award = "pim_3", 			at = 45 			}},
		grv_3_stats = { 			{award = "grv_3", 			at = 300 			}},
		gmod_1_stats = {			{award = "gmod_1", 			at = 100			}},
		gmod_2_stats = {			{award = "gmod_2", 			at = 100			}},
		gmod_3_stats = {			{award = "gmod_3", 			at = 100			}},
		gmod_4_stats = {			{award = "gmod_4", 			at = 100			}},
		gmod_5_stats = {			{award = "gmod_5", 			at = 100			}},
		gage5_5_stats = { 			{award = "gage5_5", 		at = 25 			}},
		pim_2_stats = { 			{award = "pim_2", 			at = 8 				}},
		tango_2_stats = { 			{award = "tango_achieve_2",	at = 50 			}},
		gage2_9_stats = {			{award = "gage2_9", 		at = 15 			}},
		gage4_7_stats = {			{award = "gage4_7", 		at = 25 			}},
		gage5_8_stats = {			{award = "gage5_8", 		at = 25 			}},
		pig_3_stats = {				{award = "pig_3", 			at = 30 			}},
		eagle_2_stats = {			{award = "eagle_2", 		at = 25 			}},
		halloween_10_stats = {		{award = "halloween_10", 	at = 25 			}},
		armored_4_stat = {			{award = "armored_4", 		at = 15 			}},
		gage3_10_stats = {			{award = "gage3_10", 		at = 10 			}},
		gage3_15_stats = {			{award = "gage3_15", 		at = 25 			}},
		gage3_16_stats = {			{award = "gage3_16", 		at = 25 			}},
		eng_1_stats = {				{award = "eng_1", 			at = 5 				}},
		eng_2_stats = {				{award = "eng_2", 			at = 5 				}},
		eng_3_stats = {				{award = "eng_3", 			at = 5 				}},
		eng_4_stats = {				{award = "eng_4", 			at = 5 				}},
		rvd_12_stats = {			{award = "rvd_12", 			at = 92 			}},
		cac_3_stats = {				{award = "cac_3", 			at = 30 			}},
		cac_7_stats = {				{award = "cac_7", 			at = 1000000000 	}},
		cac_34_stats = {			{award = "cac_34", 			at = 300 			}},
		cac_35_stats = {			{award = "cac_35", 			at = 10 			}},
		bph_9_stat = { 				{award = "bph_9", 			at = 13 			}}
	}
	local jobs = {}
	local job_data = nil
	local available_jobs = {}

	for _, job_id in ipairs(tweak_data.narrative:get_jobs_index()) do
		if tweak_data.narrative:job_data(job_id).contact ~= "wip" and tweak_data.narrative:job_data(job_id).contact ~= "tests" then
			jobs[job_id] = true
			available_jobs[job_id] = tweak_data.narrative:job_data(job_id).contact
		end
	end

	for _, list in pairs(self.job_list) do
		for _, job_id in pairs(list) do
			if tweak_data.narrative:has_job_wrapper(job_id) then
				available_jobs[job_id] = nil

				for _, job_id in ipairs(tweak_data.narrative:job_data(job_id).job_wrapper) do
					available_jobs[job_id] = nil
				end
			elseif jobs[job_id] then
				available_jobs[job_id] = nil
			else
				Application:debug("[TWEAKDATA:ACHIEVEMENTS] Job missing in narrative", job_id)
			end
		end
	end

	if table.size(available_jobs) > 0 then
		Application:debug("[TWEAKDATA:ACHIEVEMENTS] Jobs not yet in achievement 'job_list':", inspect(available_jobs))
	end

	self.complete_heist_stats_achievements = {
		death_vlad = {
			award = "death_5",
			contact = "vlad",
			difficulty = deathwish
		},
		death_hector = {
			award = "death_9",
			contact = "hector",
			difficulty = deathwish
		},
		death_elephant = {
			award = "death_12",
			contact = "the_elephant",
			difficulty = deathwish
		},
		death_bain = {
			award = "death_26",
			contact = "bain",
			difficulty = deathwish
		},
		skull_hard = {
			award = "death_27",
			contact = "all",
			difficulty = hard
		},
		skull_very_hard = {
			award = "death_28",
			contact = "all",
			difficulty = veryhard
		},
		skull_overkill = {
			award = "death_29",
			contact = "all",
			difficulty = overkill
		},
		skull_deathwish = {
			award = "death_30",
			contact = "all",
			difficulty = deathwish
		},
		trk_a_0 = {
			award = "trk_a_0",
			contact = "all",
			difficulty = any
		},
		trk_c_5 = {
			award = "trk_c_5",
			contact = "the_continental",
			difficulty = deathwish
		},
		trk_cb_5 = {
			award = "trk_cb_5",
			contact = "the_butcher",
			difficulty = deathwish
		},
		trk_cc_5 = {
			award = "trk_cc_5",
			contact = "classic",
			difficulty = deathwish
		},
		trk_d_5 = {
			award = "trk_d_5",
			contact = "the_dentist",
			difficulty = deathwish
		},
		trk_ev_5 = {
			award = "trk_ev_5",
			contact = "events",
			difficulty = deathwish
		},
		trk_j_5 = {
			award = "trk_j_5",
			contact = "jimmy",
			difficulty = deathwish
		},
		trk_l_5 = {
			award = "trk_l_5",
			contact = "locke",
			difficulty = deathwish
		},
		trophy_smwish = {
			trophy_stat = "trophy_smwish",
			contact = "all",
			difficulty = deathwish
		}
	}
	self.four_mask_achievements = {
		reindeer_games = {
			award = "charliesierra_9",
			masks = {
				"santa_happy",
				"santa_mad",
				"santa_drunk",
				"santa_surprise"
			}
		},
		ghost_riders = {
			award = "bob_10",
			masks = {
				"skullhard",
				"skullveryhard",
				"skulloverkill",
				"skulloverkillplus",
				"gitgud_e_wish",
				"gitgud_sm_wish",
				"dnm",
				"ggac_od_t2"
			}
		},
		funding_father = {
			award = "bigbank_10",
			masks = {
				"franklin",
				"lincoln",
				"grant",
				"washington"
			}
		},
		go_bananas = {
			award = "gage4_12",
			jobs = {"alex", "alex_pro"},
			difficulties = overkill_or_above,
			masks = {
				"silverback",
				"mandril",
				"skullmonkey",
				"orangutang"
			}
		},
		animal_fight = {
			award = "pig_5",
			jobs = {"mia", "mia_pro"},
			difficulties = hard_or_above,
			masks = {
				"white_wolf",
				"owl",
				"rabbit",
				"pig"
			}
		},
		guy_with_gun_now_with_night_jobs = {
			award = "gage5_6",
			jobs = {"watchdogs_wrapper", "watchdogs_night", "watchdogs", "watchdogs_wrapper_pro"},
			difficulties = overkill_or_above,
			masks = {
				"galax",
				"crowgoblin",
				"evil",
				"volt"
			}
		},
		wind_of_change = {
			award = "eagle_3",
			jobs = {"hox", "hox_pro"},
			difficulties = overkill_or_above,
			masks = {
				"churchill",
				"red_hurricane",
				"patton",
				"de_gaulle"
			}
		},
		xmas_2014 = {
			award = "deer_6",
			jobs = {
				"pines"
			},
			difficulties = deathwish,
			masks = {
				"krampus",
				"mrs_claus",
				"strinch",
				"robo_santa"
			}
		},
		blight = {
			award = "bat_5",
			jobs = {
				"mus"
			},
			difficulties = overkill_or_above,
			masks = {
				"medusa",
				"anubis",
				"pazuzu",
				"cursed_crown"
			}
		},
		brb_10 = {
			award = "brb_10",
			job = "brb",
			difficulties = overkill_or_above,
			masks = {
				"cmt_01",
				"cmt_02",
				"cmt_03",
				"cmt_04"
			}
		}
	}
	self.sniper_kill_achievements = {
		did_i_do_that = {
			weapon_type = "snp",
			award = "gage3_9",
			multi_kill = 3
		},
		max_peneration = {
			weapon = "r93",
			stat = "gage3_10_stats",
			obstacle = "shield",
			enemy = "shield"
		},
		you_cant_hide = {
			weapon = "r93",
			stat = "gage3_15_stats",
			obstacle = "wall"
		},
		two_for_one = {
			weapon = "msr",
			stat = "gage3_16_stats",
			multi_kill = 2
		}
	}
	self.inventory = {}
	self.crime_spree = {
		cee_1 = {
			award = "cee_1",
			level = 50
		},
		cee_2 = {
			award = "cee_2",
			level = 100
		},
		cee_3 = {
			award = "cee_3",
			level = 250
		},
		story_crime_spree = {
			story = "story_crime_spree",
			level = 20
		}
	}
	self.medic_heal_achievements = {
		challenge_overheal = {
			total = 50,
			challenge_award = "challenge_overheal"
		}
	}
	local gage_5_1_achievement = {
		max_progress = 25,
		stat = "gage5_1_stats",
		text_id = "bm_wp_gage5_1_achievment"
	}
	local gage_5_2_achievement = {
		award = "gage5_2",
		text_id = "bm_wp_gage5_2_achievment"
	}
	local gage_5_3_achievement = {
		award = "gage5_3",
		text_id = "bm_wp_gage5_3_achievment"
	}
	local gage_5_4_achievement = {
		award = "gage5_4",
		text_id = "bm_wp_gage5_4_achievment"
	}
	local gage_5_5_achievement = {
		max_progress = 25,
		stat = "gage5_5_stats",
		text_id = "bm_wp_gage5_5_achievment"
	}
	local gage_5_6_achievement = {
		award = "gage5_6",
		text_id = "bm_wp_gage5_6_achievment"
	}
	local gage_5_7_achievement = {
		award = "gage5_7",
		text_id = "bm_wp_gage5_7_achievment"
	}
	local gage_5_9_achievement = {
		max_progress = 10,
		stat = "gage5_9_stats",
		text_id = "bm_wp_gage5_9_achievment"
	}
	local gage_5_10_achievement = {
		max_progress = 200,
		stat = "gage5_10_stats",
		text_id = "bm_wp_gage5_10_achievment"
	}
	local pig_1_achievement = {
		award = "pig_1",
		text_id = "bm_wp_pig_1_achievment"
	}
	local pig_2_achievement = {
		award = "pig_2",
		text_id = "bm_wp_pig_2_achievment"
	}
	local pig_3_achievement = {
		max_progress = 25,
		stat = "pig_3_stats",
		text_id = "bm_wp_pig_3_achievment"
	}
	local pig_4_achievement = {
		award = "pig_4",
		text_id = "bm_wp_pig_4_achievment"
	}
	local pig_5_achievement = {
		award = "pig_5",
		text_id = "bm_wp_pig_5_achievment"
	}
	local eagle_1_achievement = {
		max_progress = 25,
		stat = "eagle_1_stats",
		text_id = "bm_wp_eagle_1_achievment"
	}
	local eagle_2_achievement = {
		max_progress = 25,
		stat = "eagle_2_stats",
		text_id = "bm_wp_eagle_2_achievment"
	}
	local eagle_3_achievement = {
		award = "eagle_3",
		text_id = "bm_wp_eagle_3_achievment"
	}
	local eagle_4_achievement = {
		award = "eagle_4",
		text_id = "bm_wp_eagle_4_achievment"
	}
	local eagle_5_achievement = {
		award = "eagle_5",
		text_id = "bm_wp_eagle_5_achievment"
	}
	local ameno_1_achievement = {
		award = "ameno_1",
		text_id = "bm_wp_ameno_1_achievment"
	}
	local ameno_2_achievement = {
		award = "ameno_2",
		text_id = "bm_wp_ameno_2_achievment"
	}
	local ameno_3_achievement = {
		award = "ameno_3",
		text_id = "bm_wp_ameno_3_achievment"
	}
	local ameno_4_achievement = {
		award = "ameno_4",
		text_id = "bm_wp_ameno_4_achievment"
	}
	local ameno_5_achievement = {
		award = "ameno_5",
		text_id = "bm_wp_ameno_5_achievment"
	}
	local ameno_6_achievement = {
		award = "ameno_6",
		text_id = "bm_wp_ameno_6_achievment"
	}
	local ameno_7_achievement = {
		award = "ameno_7",
		text_id = "bm_wp_ameno_7_achievment"
	}
	local ameno_8_achievement = {
		max_progress = 100,
		stat = "ameno_08_stats",
		text_id = "bm_wp_ameno_8_achievment"
	}
	self.mask_tracker = {}
	self.weapon_part_tracker = {
		wpn_fps_snp_m95_barrel_long = {
			max_progress = 25,
			stat = "gage3_7_stats",
			text_id = "bm_wp_m95_b_barrel_long_achievment"
		},
		wpn_fps_snp_r93_b_suppressed = {
			award = "gage3_8",
			text_id = "bm_wp_r93_b_suppressed_achievment"
		},
		wpn_fps_upg_o_45iron = {
			award = "gage3_9",
			text_id = "bm_wp_upg_o_45iron_achievment"
		},
		wpn_fps_snp_r93_b_short = {
			max_progress = 10,
			stat = "gage3_10_stats",
			text_id = "bm_wp_r93_b_short_achievment"
		},
		wpn_fps_snp_m95_barrel_suppressed = {
			max_progress = 10,
			stat = "gage3_11_stats",
			text_id = "bm_wp_m95_b_barrel_suppressed_achievment"
		},
		wpn_fps_snp_m95_barrel_short = {
			max_progress = 10,
			award = "gage3_12_stats",
			text_id = "bm_wp_m95_b_barrel_short_achievment"
		},
		wpn_fps_upg_o_leupold = {
			max_progress = 10,
			stat = "gage3_13_stats",
			text_id = "bm_wp_upg_o_leupold_achievment"
		},
		wpn_fps_snp_msr_body_msr = {
			max_progress = 25,
			stat = "gage3_14_stats",
			text_id = "bm_wp_msr_body_msr_achievment"
		},
		wpn_fps_snp_r93_body_wood = {
			max_progress = 25,
			stat = "gage3_15_stats",
			text_id = "bm_wp_r93_body_wood_achievment"
		},
		wpn_fps_snp_msr_ns_suppressor = {
			max_progress = 25,
			stat = "gage3_16_stats",
			text_id = "bm_wp_snp_msr_ns_suppressor_achievment"
		},
		wpn_fps_snp_msr_b_long = {
			max_progress = 250,
			stat = "gage3_17_stats",
			text_id = "bm_wp_snp_msr_b_long_achievment"
		},
		wpn_fps_ass_fal_fg_01 = {
			award = "bigbank_7",
			text_id = "bm_wp_fal_fg_01_achievment"
		},
		wpn_fps_ass_fal_fg_03 = {
			award = "bigbank_8",
			text_id = "bm_wp_fal_fg_03_achievment"
		},
		wpn_fps_ass_fal_fg_04 = {
			award = "bigbank_3",
			text_id = "bm_wp_fal_fg_04_achievment"
		},
		wpn_fps_ass_fal_fg_wood = {
			award = "bigbank_4",
			text_id = "bm_wp_fal_fg_wood_achievment"
		},
		wpn_fps_ass_fal_s_01 = {
			award = "bigbank_5",
			text_id = "bm_wp_fal_s_01_achievment"
		},
		wpn_fps_ass_fal_s_03 = {
			award = "bigbank_10",
			text_id = "bm_wp_fal_s_03_achievment"
		},
		wpn_fps_ass_fal_s_wood = {
			award = "bigbank_6",
			text_id = "bm_wp_fal_s_wood_achievment"
		},
		wpn_fps_ass_fal_g_01 = {
			award = "bigbank_1",
			text_id = "bm_wp_fal_g_01_achievment"
		},
		wpn_fps_ass_fal_m_01 = {
			award = "bigbank_2",
			text_id = "bm_wp_fal_m_01_achievment"
		},
		wpn_fps_upg_o_mbus_rear = {
			award = "gage4_2",
			text_id = "bm_wp_upg_o_mbus_rear_achievment"
		},
		wpn_fps_sho_ben_b_short = {
			award = "gage4_4",
			text_id = "bm_wp_ben_b_short_achievment"
		},
		wpn_fps_sho_ben_b_long = {
			award = "gage4_5",
			text_id = "bm_wp_ben_b_long_achievment"
		},
		wpn_fps_sho_ben_s_collapsed = {
			max_progress = 50,
			stat = "gage4_6",
			text_id = "bm_wp_ben_s_collapsed_achievment"
		},
		wpn_fps_sho_ksg_b_short = {
			max_progress = 25,
			stat = "gage4_7",
			text_id = "bm_wp_ksg_b_short_achievment"
		},
		wpn_fps_sho_ksg_b_long = {
			max_progress = 10,
			stat = "gage4_8",
			text_id = "bm_wp_ksg_b_long_achievment"
		},
		wpn_fps_sho_ben_s_solid = {
			award = "gage4_9",
			text_id = "bm_wp_ben_s_solid_achievment"
		},
		wpn_fps_sho_striker_b_long = {
			max_progress = 10,
			stat = "gage4_10_stats",
			text_id = "bm_wp_striker_b_long_achievment"
		},
		wpn_fps_sho_striker_b_suppressed = {
			award = "gage4_11",
			text_id = "bm_wp_striker_b_suppressed_achievment"
		},
		wpn_fps_gre_m79_barrel_short = gage_5_5_achievement,
		wpn_fps_gre_m79_stock_short = gage_5_2_achievement,
		wpn_fps_ass_g3_b_sniper = gage_5_1_achievement,
		wpn_fps_ass_g3_fg_psg = gage_5_1_achievement,
		wpn_fps_ass_g3_g_sniper = gage_5_1_achievement,
		wpn_fps_ass_g3_s_sniper = gage_5_1_achievement,
		wpn_fps_ass_g3_b_short = gage_5_4_achievement,
		wpn_fps_ass_g3_fg_retro_plastic = gage_5_4_achievement,
		wpn_fps_ass_g3_fg_railed = gage_5_6_achievement,
		wpn_fps_ass_g3_fg_retro = gage_5_7_achievement,
		wpn_fps_ass_g3_g_retro = gage_5_7_achievement,
		wpn_fps_ass_g3_s_wood = gage_5_7_achievement,
		wpn_fps_ass_galil_s_sniper = gage_5_1_achievement,
		wpn_fps_ass_galil_fg_sniper = gage_5_1_achievement,
		wpn_fps_ass_galil_g_sniper = gage_5_1_achievement,
		wpn_fps_ass_galil_fg_sar = gage_5_6_achievement,
		wpn_fps_ass_galil_fg_mar = gage_5_3_achievement,
		wpn_fps_ass_galil_s_plastic = gage_5_3_achievement,
		wpn_fps_ass_galil_s_light = gage_5_4_achievement,
		wpn_fps_ass_galil_s_wood = gage_5_5_achievement,
		wpn_fps_ass_galil_fg_fab = gage_5_9_achievement,
		wpn_fps_ass_galil_s_fab = gage_5_9_achievement,
		wpn_fps_ass_galil_s_skeletal = gage_5_9_achievement,
		wpn_fps_ass_famas_b_sniper = gage_5_1_achievement,
		wpn_fps_ass_famas_b_short = gage_5_4_achievement,
		wpn_fps_ass_famas_b_long = gage_5_6_achievement,
		wpn_fps_ass_famas_g_retro = gage_5_10_achievement,
		wpn_fps_ass_famas_b_suppressed = gage_5_10_achievement,
		wpn_fps_smg_scorpion_g_ergo = pig_1_achievement,
		wpn_fps_smg_scorpion_m_extended = pig_1_achievement,
		wpn_fps_smg_scorpion_s_unfolded = pig_1_achievement,
		wpn_fps_smg_uzi_fg_rail = pig_2_achievement,
		wpn_fps_smg_uzi_s_leather = pig_2_achievement,
		wpn_fps_smg_uzi_s_solid = pig_3_achievement,
		wpn_fps_smg_scorpion_g_wood = pig_3_achievement,
		wpn_fps_smg_tec9_ns_ext = pig_4_achievement,
		wpn_fps_smg_tec9_m_extended = pig_4_achievement,
		wpn_fps_smg_tec9_s_unfolded = pig_4_achievement,
		wpn_fps_smg_uzi_b_suppressed = pig_5_achievement,
		wpn_fps_smg_uzi_s_standard = pig_5_achievement,
		wpn_fps_smg_scorpion_b_suppressed = pig_5_achievement,
		wpn_fps_smg_scorpion_s_nostock = pig_5_achievement,
		wpn_fps_smg_tec9_b_standard = pig_5_achievement,
		wpn_fps_snp_mosin_b_sniper = eagle_1_achievement,
		wpn_fps_snp_mosin_b_standard = eagle_1_achievement,
		wpn_fps_smg_sterling_b_e11 = eagle_2_achievement,
		wpn_fps_pis_c96_nozzle = eagle_2_achievement,
		wpn_fps_pis_c96_sight = eagle_2_achievement,
		wpn_fps_smg_sterling_b_short = eagle_2_achievement,
		wpn_fps_smg_sterling_b_suppressed = eagle_2_achievement,
		wpn_fps_smg_sterling_m_short = eagle_2_achievement,
		wpn_fps_smg_sterling_s_folded = eagle_2_achievement,
		wpn_fps_smg_sterling_s_nostock = eagle_2_achievement,
		wpn_fps_smg_sterling_s_solid = eagle_2_achievement,
		wpn_fps_snp_mosin_body_black = eagle_3_achievement,
		wpn_fps_pis_c96_b_long = eagle_3_achievement,
		wpn_fps_snp_mosin_b_short = eagle_3_achievement,
		wpn_fps_smg_sterling_m_long = eagle_3_achievement,
		wpn_fps_smg_sterling_b_long = eagle_3_achievement,
		wpn_fps_lmg_mg42_b_vg38 = eagle_3_achievement,
		wpn_fps_pis_c96_m_extended = eagle_4_achievement,
		wpn_fps_pis_c96_s_solid = eagle_4_achievement,
		wpn_fps_lmg_mg42_b_mg34 = eagle_5_achievement,
		wpn_fps_upg_ass_m4_upper_reciever_core = ameno_1_achievement,
		wpn_fps_upg_ass_m4_lower_reciever_core = ameno_1_achievement,
		wpn_fps_upg_ass_m16_fg_stag = ameno_1_achievement,
		wpn_fps_upg_ak_g_rk3 = ameno_2_achievement,
		wpn_fps_upg_ak_fg_zenit = ameno_2_achievement,
		wpn_fps_upg_ass_m4_upper_reciever_ballos = ameno_2_achievement,
		wpn_fps_upg_o_ak_scopemount = ameno_3_achievement,
		wpn_fps_upg_ns_ass_pbs1 = ameno_3_achievement,
		wpn_fps_upg_ass_ak_b_zastava = ameno_4_achievement,
		wpn_fps_upg_ak_m_uspalm = ameno_4_achievement,
		wpn_fps_upg_ass_m4_fg_moe = ameno_5_achievement,
		wpn_fps_upg_smg_olympic_fg_lr300 = ameno_5_achievement,
		wpn_fps_upg_ass_m4_fg_lvoa = ameno_5_achievement,
		wpn_fps_upg_ak_s_solidstock = ameno_6_achievement,
		wpn_fps_upg_m4_s_ubr = ameno_6_achievement,
		wpn_fps_upg_ass_m4_b_beowulf = ameno_7_achievement,
		wpn_fps_upg_m4_m_l5 = ameno_7_achievement,
		wpn_fps_upg_ak_fg_trax = ameno_8_achievement,
		wpn_fps_upg_ak_fg_krebs = ameno_8_achievement,
		wpn_fps_upg_ak_b_ak105 = ameno_8_achievement
	}

	if SystemInfo:platform() == Idstring("PS4") or SystemInfo:platform() == Idstring("XB1") then
		self.weapon_part_tracker = {}
	end

	local default = "guis/dlcs/ami/textures/pd2/milestone_trophy_icon"
	self.milestones = {
		{
			id = "ami_0",
			at = 21,
			coins = 1,
			texture = default
		},
		{
			id = "ami_1",
			at = 45,
			coins = 2,
			texture = default
		},
		{
			at = 72,
			has_drop = true,
			id = "ami_2",
			coins = 3,
			texture = default
		},
		{
			id = "ami_3",
			at = 104,
			coins = 4,
			texture = default
		},
		{
			at = 140,
			has_drop = true,
			id = "ami_4",
			coins = 5,
			texture = default
		},
		{
			id = "ami_5",
			at = 178,
			coins = 6,
			texture = default
		},
		{
			at = 218,
			has_drop = true,
			id = "ami_6",
			coins = 7,
			texture = default
		},
		{
			id = "ami_7",
			at = 264,
			coins = 8,
			texture = default
		},
		{
			at = 312,
			has_drop = true,
			id = "ami_8",
			coins = 9,
			texture = default
		},
		{
			id = "ami_9",
			at = 362,
			coins = 10,
			texture = default
		},
		{
			at = 416,
			has_drop = true,
			id = "ami_10",
			coins = 11,
			texture = default
		},
		{
			id = "ami_11",
			at = 475,
			coins = 12,
			texture = default
		},
		{
			at = 537,
			has_drop = true,
			id = "ami_12",
			coins = 13,
			texture = default
		},
		{
			at = 610,
			has_drop = true,
			id = "ami_13",
			coins = 14,
			texture = default
		}
	}
	local last_at = 0

	for _, v in ipairs(self.milestones) do
		v.rewards = v.coins and {
			{
				name_id = "menu_cs_coins",
				texture = "guis/dlcs/chill/textures/pd2/safehouse/continental_coins_drop",
				amount = v.coins
			}
		} or {}

		if v.has_drop then
			local data = tweak_data.dlc[v.id]

			for _, loot in ipairs(data.content.loot_drops) do
				local td, data = nil

				if loot.type_items == "armor_skins" then
					td = tweak_data.economy.armor_skins[loot.item_entry]
				else
					td = tweak_data:get_raw_value("blackmarket", loot.type_items, loot.item_entry)
				end

				if v.id == "ami_13" and loot.type_items == "weapon_skins" then
					td = nil
				end

				if td then
					data = get_texture_path(tweak_data, loot.type_items, loot.item_entry)
					data.name_id = td.name_id

					table.insert(v.rewards, data)
				end
			end
		end

		v.last_at = last_at
		last_at = v.at

		if v.id == "ami_13" then
			local tam_weapon_skin_reward = {
				texture = "guis/dlcs/tam/textures/pd2/blackmarket/icons/weapon_skins/tam_achievement_reward",
				name_id = "bm_wskn_tam"
			}

			table.insert(v.rewards, tam_weapon_skin_reward)
		end
	end

	self:_init_visual(tweak_data)

--=====================================================================================--
--=====================================================================================--
--=====================================================================================--
	-- New DW achievements
	self.complete_heist_achievements.deathwish_branchbank_pro = {
		award = "trk_uj_0",
		job = "branchbank_pro",
		difficulty = deathwish
	}
	self.complete_heist_achievements.deathwish_firestarter_pro = {
		award = "trk_tu_0",
		job = "firestarter_pro",
		difficulty = deathwish
	}
	self.complete_heist_achievements.deathwish_alex_pro = {
		award = "trk_tt_0",
		job = "alex_pro",
		difficulty = deathwish
	}
	self.complete_heist_achievements.deathwish_watchdogs_wrapper_pro = {
		award = "trk_tp_0",
		job = "watchdogs_wrapper_pro",
		difficulty = deathwish
	}
	self.complete_heist_achievements.deathwish_framing_frame_pro = {
		award = "trk_th_0",
		job = "framing_frame_pro",
		difficulty = deathwish
	}
	self.complete_heist_achievements.deathwish_election_day_pro = {
		award = "trk_td_0",
		job = "election_day_pro",
		difficulty = deathwish
	}
	self.complete_heist_achievements.deathwish_arm_wrapper = {
		award = "trk_uc_0",
		job = "arm_wrapper",
		difficulty = deathwish
	}
	self.complete_heist_achievements.deathwish_mia_pro = {
		award = "trk_tc_0",
		job = "mia_pro",
		difficulty = deathwish
	}
	self.complete_heist_achievements.deathwish_hox_pro = {
		award = "trk_sx_0",
		job = "hox_pro",
		difficulty = deathwish
	}
	self.complete_heist_achievements.deathwish_kenaz_pro = {
		award = "trk_sr_0",
		job = "kenaz_pro",
		difficulty = deathwish
	}
	self.complete_heist_achievements.deathwish_peta_pro = {
		award = "trk_sw_0",
		job = "peta_pro",
		difficulty = deathwish
	}
	self.complete_heist_achievements.deathwish_born_pro = {
		award = "trk_sf_0",
		job = "born_pro",
		difficulty = deathwish
	}
	self.complete_heist_achievements.deathwish_rvd_pro = {
		award = "trk_sa_0",
		job = "rvd_pro",
		difficulty = deathwish
	}
	self.complete_heist_achievements.pex_6 = {
		award = "pex_6",
		job = "pex",
		difficulty = deathwish
	}
--=====================================================================================--
--=====================================================================================--
--=====================================================================================--
end

local tracking = {
	second = "second",
	realtime = "realtime",
	rarely = "rarely"
}

local function from_complete_heist_stats_item(self, item)
	local heists = nil

	if item.contact == "all" then
		local lists = table.map_values(self.job_list)
		heists = table.list_union(unpack(lists))
	else
		heists = table.list_copy(self.job_list[item.contact])
	end

	local function get_todo()
		local res = table.list_to_set(heists)

		for _, job in pairs(heists) do
			for _, difficulty in ipairs(item.difficulty) do
				if managers.statistics:completed_job(job, difficulty, item.one_down) > 0 then
					res[job] = nil

					break
				end
			end
		end

		return table.map_keys(res)
	end

	return {
		persistent = true,
		is_list = true,
		get_todo_list = get_todo,
		get = function ()
			return #heists - #get_todo()
		end,
		checklist = heists,
		max = #heists,
		update = tracking.rarely
	}
end

local function from_crimespree_item(item)
	return {
		get = function ()
			local rtn = managers.crime_spree:spree_level()

			return rtn == -1 and 0 or rtn
		end,
		max = item.level,
		update = tracking.realtime
	}
end

local function from_level(level)
	if not level then
		error()
	end

	return {
		persistent = true,
		get = function ()
			return managers.experience:current_level()
		end,
		max = level,
		update = tracking.realtime
	}
end

local function from_owned_weapons(num)
	if not num then
		error()
	end

	return {
		persistent = true,
		get = function ()
			return table.size(managers.blackmarket:get_crafted_category("primaries")) + table.size(managers.blackmarket:get_crafted_category("secondaries"))
		end,
		max = num,
		update = tracking.rarely
	}
end

local function from_timed_memory(item, memory_name, count_name)
	count_name = count_name or "count"

	if not memory_name or not item or not item[count_name] then
		error()
	end

	return {
		get = function ()
			local mem = managers.job:get_memory(memory_name, true) or {}
			local t = Application:time()

			return table.count(mem, function (time)
				return t - time < item.timer
			end)
		end,
		max = item[count_name],
		update = tracking.realtime
	}
end

function AchievementsTweakData:_init_visual(tweak_data)
	self.tags = {
		progress = {
			"leveling",
			"beginner",
			"completion",
			"heisting",
			"generic"
		},
		contracts = {
			"all"
		},
		difficulty = {
			"normal",
			"hard",
			"very_hard",
			"overkill",
			"mayhem",
			"death_wish",
			"death_sentence"
		},
		unlock = {
			"mask",
			"weapon",
			"skill_slot",
			"character"
		},
		tactics = {
			"loud",
			"stealth",
			"killer",
			"timed"
		},
		inventory = {
			"mask",
			"weapon",
			"armor",
			"skill",
			"equipment"
		},
		teamwork = {
			"players_1_to_4",
			"players_2_to_4",
			"players_4"
		}
	}

	table.insert(self.tags.unlock, "outfit")
	table.insert(self.tags.unlock, "weapon_color")

	local contacts = {}

	for _, job_id in ipairs(tweak_data.narrative:get_jobs_index()) do
		local contact = tweak_data.narrative:job_data(job_id).contact

		if contact ~= "wip" and contact ~= "tests" and not table.contains(self.tags.contracts, contact) then
			table.insert(self.tags.contracts, contact)
		end
	end

	for cat_name, cat in pairs(self.tags) do
		local converted = {}

		for _, tag in pairs(cat) do
			converted[tag] = cat_name .. "_" .. tag
		end

		self.tags[cat_name] = converted
	end

	self.visual = init_auto_generated_achievement_data(self.tags)

	self:_init_non_auto_generated(tweak_data)

	for stat, unlocks in pairs(self.persistent_stat_unlocks) do
		for _, v in pairs(unlocks) do
			local data = self.visual[v.award]

			if not data then
				Application:error("Achievement visual data for '" .. v.award .. "' doesn't exists! (achievement was found in 'persistent_stat_unlocks')")
			elseif type(data.progress) ~= "table" then
				data.progress = {
					persistent = true,
					get = function ()
						return managers.achievment:get_stat(stat)
					end,
					max = v.at,
					update = tracking.second
				}
			end
		end
	end

	for name, data in pairs(tweak_data.dlc) do
		local visual = data.achievement_id and self.visual[data.achievement_id]

		if visual then
			if visual.need_unlock_icons == false then
				visual.need_unlock_icons = nil
			else
				visual.need_unlock_icons = nil
				visual.unlock_icons = visual.unlock_icons or {}
				visual.unlock_id = visual.unlock_id or true

				for _, loot in pairs(data.content.loot_drops) do
					local tex_data = get_texture_path(tweak_data, loot.type_items, loot.item_entry)

					if not table.contains(visual.unlock_icons, tex_data) then
						tex_data.type_items = loot.type_items
						tex_data.original_order = #visual.unlock_icons + 1

						table.insert(visual.unlock_icons, tex_data)
					end
				end

				local sort_order = {
					"characters",
					"weapon_mods",
					"weapon_skins",
					"masks",
					"player_styles",
					"melee_weapons",
					"materials",
					"textures"
				}

				table.sort(visual.unlock_icons, function (lhs, rhs)
					local l = table.index_of(sort_order, lhs.type_items)
					local r = table.index_of(sort_order, rhs.type_items)

					if l == r then
						return lhs.original_order < rhs.original_order
					elseif not l or not r then
						return l
					end

					return l < r
				end)
			end
		elseif data.achievement_id then
			for _, loot in pairs(data.content.loot_drops) do
				get_texture_path(tweak_data, loot.type_items, loot.item_entry)
			end
		end
	end

	for name, data in pairs(self.visual) do
		data.name_id = data.name_id or "achievement_" .. name
		data.desc_id = data.desc_id or "achievement_" .. name .. "_desc"
		data.additional_id = data.additional_id == true and "achievement_" .. name .. "_additional" or data.additional_id
		data.unlock_id = data.unlock_id == true and "achievement_" .. name .. "_unlock" or data.unlock_id
		data.icon_id = data.icon_id or data.sort_name
	end
end

function AchievementsTweakData:_init_non_auto_generated(tweak_data)
	self.visual.bulldog_1.unlock_icons = {
		{
			type_items = "characters",
			type_index = -1,
			original_order = -1,
			texture = "guis/dlcs/trk/textures/pd2/old_hoxton_unlock_icon"
		},
		table.map_append({
			type_items = "melee_weapons",
			type_index = 99,
			original_order = 0
		}, get_texture_path(tweak_data, "melee_weapons", "toothbrush"))
	}
	self.visual.armored_2.need_unlock_icons = false
	self.visual.fin_1.need_unlock_icons = true
	self.visual.frog_1.unlock_icons = {
		{
			type_items = "kill_slot",
			texture = "guis/dlcs/trk/textures/pd2/skills_slot_unlock_icon"
		}
	}
	for k, v in pairs(self.complete_heist_stats_achievements) do
		if v.award and self.visual[v.award] then
			self.visual[v.award].progress = from_complete_heist_stats_item(self, v)
		end
	end

	self.visual.armed_and_dangerous.progress = from_level(self.level_achievements.armed_and_dangerous.level)
	self.visual.big_shot.progress = from_level(self.level_achievements.big_shot.level)
	self.visual.gone_in_30_seconds.progress = from_level(self.level_achievements.gone_in_30_seconds.level)
	self.visual.guilty_of_crime.progress = from_level(self.level_achievements.guilty_of_crime.level)
	self.visual.most_wanted.progress = from_level(self.level_achievements.most_wanted.level)
	self.visual.you_gotta_start_somewhere.progress = from_level(self.level_achievements.you_gotta_start_somewhere.level)

	for id, v in pairs(self.crime_spree) do
		if v.award then
			self.visual[id].progress = from_crimespree_item(v)
		end
	end

	for i, v in pairs(self.infamous) do
		self.visual[v].progress = {
			get = function ()
				return managers.experience:current_rank() or 0
			end,
			max = i
		}
	end

	self.visual.fully_loaded.progress = from_owned_weapons(self.fully_loaded)
	self.visual.gage_8.progress = from_owned_weapons(self.arms_dealer)
	self.visual.weapon_collector.progress = from_owned_weapons(self.weapon_collector)
	self.visual.grill_3.progress = from_timed_memory(self.grenade_achievements.not_invited, "gre_ach_not_invited", "kill_count")
	self.visual.gage4_4.progress = from_timed_memory(self.enemy_kill_achievements.seven_eleven, "seven_eleven")
	self.visual.eagle_5.progress = from_timed_memory(self.enemy_kill_achievements.bullet_hell, "bullet_hell")
	self.visual.scorpion_4.progress = from_timed_memory(self.enemy_kill_achievements.scorpion_4, "scorpion_4")
	self.visual.brooklyn_1.progress = {
		max = 1,
		get = function ()
			return 0
		end,
		update = tracking.realtime
	}
	self.visual.berry_5.progress = {
		get = function ()
			return managers.job:get_memory("berry_5", true) or 0
		end,
		max = self.enemy_kill_achievements.berry_5.count_in_row,
		update = tracking.realtime
	}
	self.visual.turtles_1.progress = {
		get = function ()
			return managers.job:get_memory("kill_count_no_reload_wa2000", true) or 0
		end,
		max = self.enemy_kill_achievements.turtles_1.count_no_reload,
		update = tracking.realtime
	}
	self.visual.grv_2.progress = {
		get = function ()
			return managers.job:get_memory("kill_count_no_reload_coal", true) or 0
		end,
		max = self.enemy_kill_achievements.grv_2.count_no_reload,
		update = tracking.realtime
	}
	local cane_5 = self.loot_cash_achievements.cane_5
	self.visual.cane_5.progress = {
		get = function ()
			local total, _, _ = managers.loot:_count_achievement_secured("cane_5", cane_5.secured)

			return total or 0
		end,
		max = cane_5.secured.total_amount,
		update = tracking.second
	}
	self.visual.gage2_5.progress = {
		get = function ()
			return managers.statistics:session_killed_by_weapon_category(self.first_blood.weapon_type)
		end,
		max = self.first_blood.count,
		update = tracking.realtime
	}
	self.visual.going_places.progress = {
		get = function ()
			return managers.money:total()
		end,
		max = self.going_places,
		update = tracking.realtime
	}
	local pal_2 = self.loot_cash_achievements.pal_2
	self.visual.pal_2.progress = {
		get = function ()
			local _, _, value = managers.loot:_count_achievement_secured("pal_2", pal_2.secured)

			return value or 0
		end,
		max = pal_2.secured.value,
		update = tracking.second
	}
	local steel_2 = self.enemy_melee_hit_achievements.steel_2
	self.visual.steel_2.progress = {
		get = function ()
			if table.contains(steel_2.melee_weapons, managers.blackmarket:equipped_melee_weapon()) then
				return managers.statistics:session_enemy_killed_by_type(steel_2.enemy_kills.enemy, "melee")
			end

			return 0
		end,
		max = steel_2.enemy_kills.count,
		update = tracking.second
	}
	local tango_3 = self.complete_heist_achievements.tango_3
	self.visual.tango_achieve_3.progress = {
		get = function ()
			if not table.contains(tango_3.difficulty, Global.game_settings.difficulty) then
				return 0
			end

			local rtn = 0
			local weapons_to_check = {
				managers.blackmarket:equipped_primary(),
				managers.blackmarket:equipped_secondary()
			}

			for _, weapon_data in ipairs(weapons_to_check) do
				if table.contains(weapon_data.blueprint or {}, tango_3.killed_by_blueprint.blueprint) then
					rtn = rtn + (managers.statistics:session_killed_by_weapon(weapon_data.weapon_id) or 0)
				end
			end

			return rtn
		end,
		max = tango_3.killed_by_blueprint.amount,
		update = tracking.realtime
	}
	self.visual.tango_achieve_4.progress = {
		get = function ()
			local unit = managers.player:equipped_weapon_unit()

			if not unit or not unit:base() then
				return 0
			end

			local data = unit:base()._tango_4_data

			return data and data.count or 0
		end,
		max = self.tango_4.count
	}
	local turtles_2 = self.enemy_kill_achievements.turtles_2
	self.visual.turtles_2.progress = {
		get = function ()
			return managers.statistics:session_killed_by_weapon(turtles_2.weapon) or 0
		end,
		max = turtles_2.kill_count
	}
	self.visual.gage4_3.progress = {
		get = function ()
			return managers.statistics:session_total_killed()[self.close_and_personal.kill_type] or 0
		end,
		max = self.close_and_personal.count
	}
	self.visual.spend_money_to_make_money.progress = {
		get = function ()
			return managers.money:total_spent()
		end,
		max = self.spend_money_to_make_money
	}

	local function dummy_progress()
		return 0
	end

	self.visual.cac_2.progress = {
		max = 0,
		get = dummy_progress,
		update = tracking.realtime
	}
	self.visual.cac_20.progress = {
		max = 7,
		get = function ()
			local masks = {
				"sds_01",
				"sds_02",
				"sds_03",
				"sds_04",
				"sds_05",
				"sds_06",
				"sds_07"
			}
			local count = 0

			for _, mask_id in ipairs(masks) do
				if managers.blackmarket:has_item("halloween", "masks", mask_id) then
					count = count + 1
				end
			end

			return count
		end
	}
end
