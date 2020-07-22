local data = CrimeSpreeTweakData.init
function CrimeSpreeTweakData:init(tweak_data)
    data(self, tweak_data)
	self.repeating_modifiers.forced = {
		{
			class = "ModifierEnemyHealthAndDamage",
			id = "damage_health_rpt_",
			icon = "crime_spree_health",
			level = 50,
			data = {health = {5, "add"}, damage = {1, "add"}}
		}
	}
	self.unlock_rank = 5
	self.base_difficulty = "overkill_290"
	self.base_difficulty_index = 7
	self.initial_cost = 12
	self.continue_cost = {
		12,
		0
	}
	self.catchup_bonus = 0
	self.winning_streak = 0
	self.starting_levels = {0}
	self.crash_causes_loss = false
	self.allow_highscore_continue = false
	self.modifiers = {
		forced = {
			{
				class = "ModifierEnemyHealthAndDamage",
				id = "damage_health_1",
				icon = "crime_spree_health",
				level = 50,
				data = {
					health = {
						5,
						"add"
					},
					damage = {
						1,
						"add"
					}
				}
			}
		},
		loud = {
			{
				id = "shield_reflect",
				icon = "crime_spree_shield_reflect",
				class = "ModifierShieldReflect",
				data = {}
			},
			{
				id = "cloaker_smoke",
				icon = "crime_spree_cloaker_smoke",
				class = "ModifierCloakerKick",
				data = {
					effect = {
						"smoke",
						"none"
					}
				}
			},
			{
				id = "medic_heal_1",
				icon = "crime_spree_medic_speed",
				class = "ModifierHealSpeed",
				data = {
					speed = {
						20,
						"add"
					}
				}
			},
			{
				id = "taser_overcharge",
				icon = "crime_spree_taser_overcharge",
				class = "ModifierTaserOvercharge",
				data = {
					speed = {
						50,
						"add"
					}
				}
			},
			{
				id = "dozer_rage",
				icon = "crime_spree_dozer_rage",
				class = "ModifierDozerRage",
				data = {
					damage = {
						100,
						"add"
					}
				}
			},
			{
				id = "cloaker_tear_gas",
				icon = "crime_spree_cloaker_tear_gas",
				class = "ModifierCloakerTearGas",
				data = {
					diameter = {
						4,
						"none"
					},
					damage = {
						30,
						"none"
					},
					duration = {
						10,
						"none"
					}
				}
			},
			{
				id = "dozer_1",
				icon = "crime_spree_more_dozers",
				class = "ModifierMoreDozers",
				data = {
					inc = {
						2,
						"add"
					}
				}
			},
			{
				id = "medic_heal_2",
				icon = "crime_spree_medic_speed",
				class = "ModifierHealSpeed",
				data = {
					speed = {
						20,
						"add"
					}
				}
			},
			{
				id = "dozer_2",
				icon = "crime_spree_more_dozers",
				class = "ModifierMoreDozers",
				data = {
					inc = {
						2,
						"add"
					}
				}
			},
			{
				id = "medic_deathwish",
				icon = "crime_spree_medic_deathwish",
				class = "ModifierMedicDeathwish",
				data = {}
			},
			{
				id = "cloaker_arrest",
				icon = "crime_spree_cloaker_arrest",
				class = "ModifierCloakerArrest",
				data = {}
			}
		},
		stealth = {
			{
				class = "ModifierLessPagers",
				id = "pagers_1",
				icon = "crime_spree_pager",
				level = 26,
				data = {
					count = {
						1,
						"max"
					}
				}
			},
			{
				class = "ModifierCivilianAlarm",
				id = "civs_1",
				icon = "crime_spree_civs_killed",
				level = 26,
				data = {
					count = {
						10,
						"min"
					}
				}
			},
			{
				class = "ModifierLessConcealment",
				id = "conceal_1",
				icon = "crime_spree_concealment",
				level = 26,
				data = {
					conceal = {
						3,
						"add"
					}
				}
			},
			{
				class = "ModifierCivilianAlarm",
				id = "civs_2",
				icon = "crime_spree_civs_killed",
				level = 52,
				data = {
					count = {
						7,
						"min"
					}
				}
			},
			{
				class = "ModifierLessPagers",
				id = "pagers_2",
				icon = "crime_spree_pager",
				level = 78,
				data = {
					count = {
						2,
						"max"
					}
				}
			},
			{
				class = "ModifierLessConcealment",
				id = "conceal_2",
				icon = "crime_spree_concealment",
				level = 104,
				data = {
					conceal = {
						3,
						"add"
					}
				}
			},
			{
				class = "ModifierLessPagers",
				id = "pagers_3",
				icon = "crime_spree_pager",
				level = 130,
				data = {
					count = {
						3,
						"max"
					}
				}
			},
			{
				class = "ModifierCivilianAlarm",
				id = "civs_3",
				icon = "crime_spree_civs_killed",
				level = 156,
				data = {
					count = {
						4,
						"min"
					}
				}
			},
			{
				class = "ModifierLessPagers",
				id = "pagers_4",
				icon = "crime_spree_pager",
				level = 182,
				data = {
					count = {
						4,
						"max"
					}
				}
			}
		}
	}

	local normal = 1
	local hard = 2
	local very_hard = 3
	local OVERKILL = 4
	self.missions = {
		{
			{
				stage_id = "branchbank_cash",
				id = "bb_cash",
				icon = "csm_branchbank",
				add = normal,
				level = tweak_data.narrative.stages.branchbank_cash
			},
			{
				stage_id = "cage",
				id = "cage",
				icon = "csm_carshop",
				add = normal,
				level = tweak_data.narrative.stages.cage
			},
			{
				stage_id = "kosugi",
				id = "kosugi",
				icon = "csm_shadow_raid",
				add = normal,
				level = tweak_data.narrative.stages.kosugi
			},
			{
				stage_id = "dark",
				id = "dark",
				icon = "csm_murky",
				add = normal,
				level = tweak_data.narrative.stages.dark
			},
			{
				stage_id = "firestarter_2",
				add = normal,
				id = "fs_2",
				icon = "csm_fs_2",
				level = tweak_data.narrative.stages.firestarter_2
			},
			{
				stage_id = "hox_3",
				add = normal,
				id = "hox_3",
				icon = "csm_hoxvenge",
				level = tweak_data.narrative.stages.hox_3
			},
			{
				stage_id = "fish",
				add = hard,
				id = "fish",
				icon = "csm_yacht",
				level = tweak_data.narrative.stages.fish
			},
			{
				stage_id = "election_day_2",
				add = hard,
				id = "ed_2",
				icon = "csm_election_2",
				level = tweak_data.narrative.stages.election_day_2
			},
			{
				stage_id = "crojob1",
				add = hard,
				id = "crojob1",
				icon = "csm_docks",
				level = tweak_data.narrative.stages.crojob1
			},
			{
				stage_id = "framing_frame_3",
				id = "framing_frame_3",
				icon = "csm_framing_3",
				add = hard,
				level = tweak_data.narrative.stages.framing_frame_3
			},
			{
				stage_id = "arm_for",
				id = "arm_for",
				icon = "csm_train_forest",
				add = very_hard,
				level = tweak_data.narrative.stages.arm_for
			},
			{
				stage_id = "friend",
				add = hard,
				id = "friend",
				icon = "csm_friend",
				level = tweak_data.narrative.stages.friend
			},
			{
				stage_id = "big",
				add = OVERKILL,
				id = "big",
				icon = "csm_big",
				level = tweak_data.narrative.stages.big
			},
			{
				stage_id = "mus",
				id = "mus",
				icon = "csm_diamond",
				add = hard,
				level = tweak_data.narrative.stages.mus
			},
			{
				stage_id = "roberts",
				id = "roberts",
				icon = "csm_go",
				add = OVERKILL,
				level = tweak_data.narrative.stages.roberts
			},
			{
				stage_id = "red2",
				id = "red2",
				icon = "csm_fwb",
				add = normal,
				level = tweak_data.narrative.stages.red2
			}
		},
		{
			{
				stage_id = "wwh",
				add = very_hard,
				id = "wwh",
				icon = "csm_wwh",
				level = tweak_data.narrative.stages.wwh
			},
			{
				stage_id = "rvd1",
				add = very_hard,
				id = "rvd1",
				icon = "csm_rvd_1",
				level = tweak_data.narrative.stages.rvd_1
			},
			{
				stage_id = "rvd2",
				add = very_hard,
				id = "rvd2",
				icon = "csm_rvd_2",
				level = tweak_data.narrative.stages.rvd_2
			},
			{
				stage_id = "brb",
				add = hard,
				id = "brb",
				icon = "csm_brb",
				level = tweak_data.narrative.stages.brb
			},
			{
				stage_id = "arm_cro",
				id = "arm_cro",
				icon = "csm_crossroads",
				add = OVERKILL,
				level = tweak_data.narrative.stages.arm_cro
			},
			{
				stage_id = "cage",
				id = "arm_und",
				icon = "csm_overpass",
				add = very_hard,
				level = tweak_data.narrative.stages.arm_und
			},
			{
				stage_id = "arm_hcm",
				id = "arm_hcm",
				icon = "csm_downtown",
				add = OVERKILL,
				level = tweak_data.narrative.stages.arm_hcm
			},
			{
				stage_id = "arm_par",
				id = "arm_par",
				icon = "csm_park",
				add = hard,
				level = tweak_data.narrative.stages.arm_par
			},
			{
				stage_id = "arm_fac",
				id = "arm_fac",
				icon = "csm_harbor",
				add = hard,
				level = tweak_data.narrative.stages.arm_fac
			},
			{
				stage_id = "chew",
				add = very_hard,
				id = "biker_2",
				icon = "csm_biker_2",
				level = tweak_data.narrative.stages.chew
			},
			{
				stage_id = "firestarter_1",
				add = normal,
				id = "fs_1",
				icon = "csm_fs_1",
				level = tweak_data.narrative.stages.firestarter_1
			},
			{
				stage_id = "watchdogs_1_d",
				add = very_hard,
				id = "watchdogs_1_d",
				icon = "csm_watchdogs_1",
				level = tweak_data.narrative.stages.watchdogs_1_d
			},
			{
				stage_id = "pines",
				id = "pines",
				icon = "csm_white_xmas",
				add = hard,
				level = tweak_data.narrative.stages.pines
			},
			{
				stage_id = "moon",
				id = "moon",
				icon = "csm_stealing_xmas",
				add = hard,
				level = tweak_data.narrative.stages.moon
			},
			{
				stage_id = "spa",
				add = very_hard,
				id = "spa",
				icon = "csm_brooklyn",
				level = tweak_data.narrative.stages.spa
			},
			{
				stage_id = "cane",
				add = normal,
				id = "cane",
				icon = "csm_santas_workshop",
				level = tweak_data.narrative.stages.cane
			},
			{
				stage_id = "mia_2",
				add = OVERKILL,
				id = "mia_2",
				icon = "csm_miami_2",
				level = tweak_data.narrative.stages.mia_2
			}
		},
		{
			{
				stage_id = "pbr2",
				add = very_hard,
				id = "pbr2",
				icon = "csm_sky",
				level = tweak_data.narrative.stages.pbr2
			},
			{
				stage_id = "pal",
				add = normal,
				id = "pal",
				icon = "csm_counterfeit",
				level = tweak_data.narrative.stages.pal
			},
			{
				stage_id = "flat",
				add = hard,
				id = "flat",
				icon = "csm_panic_room",
				level = tweak_data.narrative.stages.flat
			},
			{
				stage_id = "born",
				id = "born",
				icon = "csm_biker_1",
				add = hard,
				level = tweak_data.narrative.stages.born
			},
			{
				stage_id = "hox_2",
				add = very_hard,
				id = "hoxton_2",
				icon = "csm_hoxout_2",
				level = tweak_data.narrative.stages.hox_2
			},
			{
				stage_id = "hox_1",
				add = very_hard,
				id = "hoxton_1",
				icon = "csm_hoxout_1",
				level = tweak_data.narrative.stages.hox_1
			},
			{
				stage_id = "welcome_to_the_jungle_2",
				add = OVERKILL,
				id = "bo_2",
				icon = "csm_bigoil_2",
				level = tweak_data.narrative.stages.welcome_to_the_jungle_2
			},
			{
				stage_id = "mia_1",
				add = normal,
				id = "mia_1",
				icon = "csm_miami_1",
				level = tweak_data.narrative.stages.mia_1
			},
			{
				stage_id = "rat",
				add = hard,
				id = "cook_off",
				icon = "csm_rats_1",
				level = tweak_data.narrative.stages.rat
			},
			{
				stage_id = "pbr",
				id = "pbr",
				icon = "csm_mountain",
				add = OVERKILL,
				level = tweak_data.narrative.stages.pbr
			},
			{
				stage_id = "glace",
				add = very_hard,
				id = "glace",
				icon = "csm_glace",
				level = tweak_data.narrative.stages.glace
			},
			{
				stage_id = "run",
				add = OVERKILL,
				id = "run",
				icon = "csm_run",
				level = tweak_data.narrative.stages.run
			},
			{
				stage_id = "man",
				id = "man",
				icon = "csm_undercover",
				add = hard,
				level = tweak_data.narrative.stages.man
			},
			{
				stage_id = "dinner",
				add = hard,
				id = "dinner",
				icon = "csm_slaughterhouse",
				level = tweak_data.narrative.stages.dinner
			},
			{
				stage_id = "jolly",
				add = very_hard,
				id = "jolly",
				icon = "csm_aftershock",
				level = tweak_data.narrative.stages.jolly
			}
		}
	}
	self.rewards = {
		{
			id = "experience",
			always_show = true,
			max_cards = 10,
			card_inc = 200000,
			name_id = "menu_challenge_xp_drop",
			icon = "upcard_xp",
			amount = 150000
		},
		{
			id = "cash",
			max_cards = 10,
			cash_string = "$",
			card_inc = 4000000,
			name_id = "menu_challenge_cash_drop",
			icon = "upcard_cash",
			always_show = true,
			amount = 3500000
		},
		{
			id = "continental_coins",
			max_cards = 5,
			card_inc = 4,
			name_id = "menu_cs_coins",
			icon = "upcard_coins",
			amount = 0.25
		},
		{
			id = "loot_drop",
			max_cards = 5,
			card_inc = 5,
			name_id = "menu_challenge_loot_drop",
			icon = "upcard_random",
			amount = 0.5
		},
		{
			id = "random_cosmetic",
			max_cards = 5,
			card_inc = 1,
			name_id = "menu_challenge_cosmetic_drop",
			icon = "upcard_cosmetic",
			amount = 0.07
		}
	}
	
	local low = 6
	local medium = 9
	local high = 12
	local must_have = 18
	
	self.assets.increased_throwables.cost = medium
	self.assets.increased_deployables.cost = must_have
	self.assets.increased_health.cost = low
	self.assets.quick_reload.cost = medium
	self.assets.quick_switch.cost = medium
	self.assets.increased_lives.cost = must_have
	self.assets.increased_stamina.cost = low
	self.assets.increased_ammo.cost = low
	
	self.assets.explosion_immunity = nil
	self.assets.increased_absorption = nil
	self.assets.melee_invulnerability = nil
	self.assets.life_steal = nil
	
	self.assets.increased_health.data = {
		health = 25
	}
	self.assets.increased_armor = {
		name_id = "menu_cs_ga_increased_armor",
		unlock_desc_id = "menu_cs_ga_increased_armor_desc",
		icon = "csb_armor",
		cost = low,
		data = {
			armor = 20
		},
		class = "GageModifierMaxArmor"
	}
	self.assets.quick_pagers = {
		name_id = "menu_cs_ga_quick_pagers",
		unlock_desc_id = "menu_cs_ga_quick_pagers_desc",
		icon = "csb_pagers",
		cost = high,
		data = {
			speed = 15
		},
		stealth = true,
		class = "GageModifierQuickPagers"
	}
	self.assets.increased_body_bags = {
		name_id = "menu_cs_ga_increased_body_bags",
		unlock_desc_id = "menu_cs_ga_increased_body_bags_desc",
		icon = "csb_bodybags",
		cost = medium,
		data = {
			bags = 1
		},
		stealth = true,
		class = "GageModifierMaxBodyBags"
	}
	self.assets.quick_locks = {
		name_id = "menu_cs_ga_quick_locks",
		unlock_desc_id = "menu_cs_ga_quick_locks_desc",
		icon = "csb_locks",
		cost = medium,
		data = {
			speed = 15
		},
		stealth = true,
		class = "GageModifierQuickLocks"
	}
end