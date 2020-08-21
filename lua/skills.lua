if string.lower(RequiredScript) == "lib/tweak_data/skilltreetweakdata" then
	local data = SkillTreeTweakData.init
	function SkillTreeTweakData:init(tweak_data)
		local function digest(value)
			return Application:digest_value(value, true)
		end
		data(self, tweak_data)
		
		self.skills.mastermind = {
			[2] = {desc_id = "menu_mastermind_tier_1"},
			[3] = {desc_id = "menu_mastermind_tier_2"},
			[4] = {desc_id = "menu_mastermind_tier_3"},
			[5] = {desc_id = "menu_mastermind_tier_4"},
			[6] = {desc_id = "menu_mastermind_tier_5"},
			[7] = {desc_id = "menu_mastermind_tier_6"}
		}
		self.skills.enforcer = {
			[2] = {desc_id = "menu_menu_enforcer_tier_1"},
			[3] = {desc_id = "menu_menu_enforcer_tier_2"},
			[4] = {desc_id = "menu_menu_enforcer_tier_3"},
			[5] = {desc_id = "menu_menu_enforcer_tier_4"},
			[6] = {desc_id = "menu_menu_enforcer_tier_5"},
			[7] = {desc_id = "menu_menu_enforcer_tier_6"}
		}
		self.skills.technician = {
			[2] = {desc_id = "menu_technician_tier_1"},
			[3] = {desc_id = "menu_technician_tier_2"},
			[4] = {desc_id = "menu_technician_tier_3"},
			[5] = {desc_id = "menu_technician_tier_4"},
			[6] = {desc_id = "menu_technician_tier_5"},
			[7] = {desc_id = "menu_technician_tier_6"}
		}
		self.skills.ghost = {
			[2] = {desc_id = "menu_ghost_tier_1"},
			[3] = {desc_id = "menu_ghost_tier_2"},
			[4] = {desc_id = "menu_ghost_tier_3"},
			[5] = {desc_id = "menu_ghost_tier_4"},
			[6] = {desc_id = "menu_ghost_tier_5"},
			[7] = {desc_id = "menu_ghost_tier_6"}
		}
		self.skills.hoxton = {
			[2] = {desc_id = "menu_hoxton_tier_1"},
			[3] = {desc_id = "menu_hoxton_tier_2"},
			[4] = {desc_id = "menu_hoxton_tier_3"},
			[5] = {desc_id = "menu_hoxton_tier_4"},
			[6] = {desc_id = "menu_hoxton_tier_5"},
			[7] = {desc_id = "menu_hoxton_tier_6"}
		}

		self.tier_unlocks = {
			digest(0),
			digest(1),
			digest(5),
			digest(10),
			digest(20),
			digest(30),
			digest(40)
		}
		
		self.tier_cost = {
			{1, 3},
			{1, 3},
			{1, 3},
			{1, 3},
			{4, 8},
			{4, 8},
			{4, 8}
		}
		
		self.default_upgrades = {
			"armor_kit",
			"cable_tie",
			"ecm_jammer_affects_cameras",
			"player_special_enemy_highlight",
			"player_hostage_trade",
			"player_sec_camera_highlight",
			"player_corpse_dispose",
			"player_corpse_dispose_amount_1",
			"player_civ_harmless_melee",
			"striker_reload_speed_default",
			"temporary_first_aid_damage_reduction",
			"temporary_passive_revive_damage_reduction_2"
		}

	----------------------------------------------------------------------------
	------Skills for opening skilltrees/Скиллы открытия ветвей навыков----------
	----------------------------------------------------------------------------
		self.skills.unlock_mastermind = {
			{
				upgrades = {
					"doctor_bag"
				},
				cost = self.costs.default
			},
			name_id = "menu_mastermind",
			desc_id = "menu_mastermind_desc",
			icon_xy = {
				2,
				7
			}
		}
		self.skills.unlock_enforcer = {
			{
				upgrades = {
					"ammo_bag"
				},
				cost = self.costs.default
			},
			name_id = "menu_enforcer",
			desc_id = "menu_enforcer_desc",
			icon_xy = {
				1,
				0
			}
		}
		self.skills.unlock_technician = {
			{
				upgrades = {
					"trip_mine"
				},
				cost = self.costs.default
			},
			name_id = "menu_technician",
			desc_id = "menu_technician_desc",
			icon_xy = {
				7,
				4
			}
		}
		self.skills.unlock_ghost = {
			{
				upgrades = {
					"ecm_jammer"
				},
				cost = self.costs.default
			},
			name_id = "menu_ghost",
			desc_id = "menu_ghost_desc",
			icon_xy = {
				1,
				4
			}
		}
		self.skills.unlock_hoxton = {
			{
				upgrades = {
					"first_aid_kit"
				},
				cost = self.costs.default
			},
			name_id = "menu_hoxton_pack",
			desc_id = "menu_hoxton_pack_desc",
			icon_xy = {
				3,
				10
			}
		}
	----------------------------------------------------------------------------
	----------------------------------------------------------------------------
	----------------------------------------------------------------------------

		self.trees = {
			{
				skill = "mastermind",
				name_id = "",
				unlocked = true,
				background_texture = "guis/textures/pd2/skilltree/bg_mastermind",
				tiers = {
					{"unlock_mastermind"},
					{
						"cable_guy",
						"combat_medic",
						"leadership"
					},
					{
						"hostage_taker",
						"painkillers",
						"equilibrium"
					},
					{
						"smooth_talker",
						"inside_man",
						"black_marketeer"
					},
					{
						"control_freak",
						"medic_2x",
						"dominator"
					},
					{
						"gunslinger",
						"kilmer",
						"stockholm_syndrome"
					},
					{
						"trigger_happy",
						"messiah",
						"inspire"
					}
				}
			},
			{
				skill = "enforcer",
				name_id = "",
				unlocked = true,
				background_texture = "guis/textures/pd2/skilltree/bg_mastermind",
				tiers = {
					{"unlock_enforcer"},
					{
						"oppressor",
						"tough_guy",
						"steroids"
					},
					{
						"show_of_force",
						"underdog",
						"pack_mule"
					},
					{
						"shotgun_impact",
						"shades",
						"scavenger"
					},
					{
						"shotgun_cqb",
						"ammo_2x",
						"wolverine"
					},
					{
						"heavy_impact",
						"bandoliers",
						"portable_saw"
					},
					{
						"overkill",
						"juggernaut",
						"carbon_blade"
					}
				}
			},
			{
				skill = "technician",
				name_id = "",
				unlocked = true,
				background_texture = "guis/textures/pd2/skilltree/bg_mastermind",
				tiers = {
					{"unlock_technician"},
					{
						"rifleman",
						"trip_miner",
						"discipline"
					},
					{
						"sharpshooter",
						"trip_mine_expert",
						"hardware_expert"
					},
					{
						"marksman", 
						"combat_engineering",
						"drill_expert"
					},
					{
						"sentry_gun",
						"jack_of_all_trades",
						"silent_drilling"
					},
					{
						"sentry_2_0",
						"shaped_charge",
						"insulation"
					},
					{
						"tower_defense",
						"aggressive_shots",
						"iron_man"
					}
				}
			},
			{
				skill = "ghost",
				name_id = "",
				unlocked = true,
				background_texture = "guis/textures/pd2/skilltree/bg_mastermind",
				tiers = {
					{"unlock_ghost"},
					{
						"martial_arts",
						"sprinter",
						"cat_burglar"
					},
					{
						"transporter",
						"chameleon",
						"cleaner"
					},
					{
						"assassin",
						"spotter",
						"smg_master"
					},
					{
						"magic_touch",
						"ecm_2x",
						"nine_lives"
					},
					{
						"good_luck_charm",
						"ecm_booster",
						"silence_expert"
					},
					{
						"low_blow",
						"ecm_feedback",
						"hitman"
					}
				}
			},
			{
				skill = "hoxton",
				name_id = "",
				unlocked = true,
				background_texture = "guis/textures/pd2/skilltree/bg_mastermind",
				tiers = {
					{"unlock_hoxton"},
					{
						"cell_mates",
						"master_craftsman",
						"freedom_call"
					},
					{
						"awareness",
						"alpha_dog",
						"up_you_go"
					},
					{
						"hidden_blade",
						"jail_workout",
						"running_from_death"
					},
					{
						"thick_skin",
						"tea_time",
						"second_wind"
					},
					{
						"second_chances",
						"tea_cookies",
						"akimbo"
					},
					{
						"bloodthirst",
						"backstab",
						"gunzerker"
					}
				}
			}
		}

		self.skills.cable_guy 				= {{upgrades = {"passive_doctor_bag_interaction_speed_multiplier",
					"cable_tie_interact_speed_multiplier"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"cable_tie_quantity"
				},
				cost = self.costs.pro
			},
			name_id = "menu_cable_guy",
			desc_id = "menu_cable_guy_desc",
			icon_xy = {
				4,
				7
			}
		}
		self.skills.combat_medic 			= {{upgrades = {"passive_doctor_bag_interaction_speed_multiplier",
					"temporary_combat_medic_damage_multiplier1"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"player_revive_health_boost"
				},
				cost = self.costs.pro
			},
			name_id = "menu_combat_medic",
			desc_id = "menu_combat_medic_desc",
			icon_xy = {
				5,
				7
			}
		}
		self.skills.leadership 				= {{upgrades = {"passive_doctor_bag_interaction_speed_multiplier",
					"team_pistol_recoil_multiplier",
					"team_akimbo_recoil_multiplier"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"team_weapon_recoil_multiplier"
				},
				cost = self.costs.pro
			},
			name_id = "menu_leadership",
			desc_id = "menu_leadership_desc",
			icon_xy = {
				7,
				7
			}
		}
		self.skills.hostage_taker 			= {{upgrades = {"team_passive_stamina_multiplier_1",
					"player_civ_intimidation_mul"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"player_hostage_move_speed_multiplier",
					"player_hostage_stay_speed_multiplier"
				},
				cost = self.costs.pro
			},
			name_id = "menu_hostage_taker",
			desc_id = "menu_hostage_taker_desc",
			icon_xy = {
				7,
				8
			}
		}
		self.skills.painkillers 			= {{upgrades = {"team_passive_stamina_multiplier_1",
					"player_revive_damage_reduction_level_1"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"player_revive_damage_reduction_level_2"
				},
				cost = self.costs.pro
			},
			name_id = "menu_fast_learner",
			desc_id = "menu_fast_learner_desc",
			icon_xy = {
				0,
				10
			}
		}
		self.skills.equilibrium 			= {{upgrades = {"team_passive_stamina_multiplier_1",
					"pistol_spread_index_addend",
					"pistol_swap_speed_multiplier"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"pistol_fire_rate_multiplier"
				},
				cost = self.costs.pro
			},
			name_id = "menu_equilibrium",
			desc_id = "menu_equilibrium_desc",
			icon_xy = {
				3,
				9
			}
		}
		self.skills.smooth_talker 			= {{upgrades = {"player_passive_intimidate_range_mul",
					"player_corpse_alarm_pager_bluff"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"player_alarm_pager_speed_multiplier"
				},
				cost = self.costs.pro
			},
			name_id = "menu_smooth_talker",
			desc_id = "menu_smooth_talker_desc",
			icon_xy = {
				2,
				4
			}
		}
		self.skills.inside_man 				= {{upgrades = {"player_passive_intimidate_range_mul",
					"player_assets_cost_multiplier"
				},
				cost = self.costs.hightier
			},
			{
				upgrades = {
					"player_additional_assets"
				},
				cost = self.costs.hightierpro
			},
			name_id = "menu_inside_man",
			desc_id = "menu_inside_man_desc",
			icon_xy = {
				0,
				8
			}
		}
		self.skills.black_marketeer 		= {{upgrades = {"player_passive_intimidate_range_mul",
					"player_buy_cost_multiplier_1"
				},
				cost = self.costs.hightier
			},
			{
				upgrades = {
					"player_buy_cost_multiplier_2",
					"player_sell_cost_multiplier_1"
				},
				cost = self.costs.hightierpro
			},
			name_id = "menu_black_marketeer",
			desc_id = "menu_black_marketeer_desc",
			icon_xy = {
				4,
				8
			}
		}
		self.skills.control_freak 			= {{upgrades = {"team_passive_health_multiplier", "player_passive_convert_enemies_health_multiplier",
					"player_civs_show_markers"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"player_civ_calming_alerts"
				},
				cost = self.costs.pro
			},
			name_id = "menu_control_freak",
			desc_id = "menu_control_freak_desc",
			icon_xy = {
				6,
				7
			}
		}
		self.skills.medic_2x 				= {{upgrades = {"team_passive_health_multiplier", "player_passive_convert_enemies_health_multiplier", "player_passive_convert_enemies_damage_multiplier",
					"doctor_bag_quantity"
				},
				cost = self.costs.hightier
			},
			{
				upgrades = {
					"doctor_bag_amount_increase1"
				},
				cost = self.costs.hightierpro
			},
			name_id = "menu_medic_2x_beta",
			desc_id = "menu_medic_2x_beta_desc",
			icon_xy = {
				5,
				8
			}
		}
		self.skills.dominator 				= {{upgrades = {"team_passive_health_multiplier", "player_passive_convert_enemies_health_multiplier",
					"player_intimidate_enemies"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"player_intimidate_range_mul",
					"player_intimidate_aura"
				},
				cost = self.costs.pro
			},
			name_id = "menu_dominator",
			desc_id = "menu_dominator_desc",
			icon_xy = {
				2,
				8
			}
		}
		self.skills.gunslinger 				= {{upgrades = {"player_convert_enemies_interaction_speed_multiplier",
					"pistol_reload_speed_multiplier"
				},
				cost = self.costs.hightier
			},
			{
				upgrades = {
					"pistol_damage_addend_1"
				},
				cost = self.costs.hightierpro
			},
			name_id = "menu_gun_fighter",
			desc_id = "menu_gun_fighter_desc",
			icon_xy = {
				0,
				9
			}
		}
		self.skills.kilmer 					= {{upgrades = {"player_convert_enemies_interaction_speed_multiplier",
					"assault_rifle_reload_speed_multiplier"
				},
				cost = self.costs.hightier
			},
			{
				upgrades = {
					"assault_rifle_move_spread_multiplier",
					"player_run_and_reload"
				},
				cost = self.costs.hightierpro
			},
			name_id = "menu_kilmer",
			desc_id = "menu_kilmer_desc",
			icon_xy = {
				1,
				9
			}
		}
		self.skills.stockholm_syndrome 		= {{upgrades = {"player_convert_enemies_interaction_speed_multiplier",
					"player_civilian_reviver",
					"player_civilian_gives_ammo"
				},
				cost = self.costs.hightier
			},
			{
				upgrades = {
					"player_super_syndrome_1"
				},
				cost = self.costs.hightierpro
			},
			name_id = "menu_stockholm_syndrome",
			desc_id = "menu_stockholm_syndrome_desc",
			icon_xy = {
				3,
				8
			}
		}
		self.skills.trigger_happy 			= {{upgrades = {"player_passive_empowered_intimidation", "passive_player_assets_cost_multiplier",
					"pistol_stacking_hit_expire_t_1",
					"pistol_stacking_hit_damage_multiplier_1"
				},
				cost = self.costs.hightier
			},
			{
				upgrades = {
					"pistol_stacking_hit_expire_t_2"
				},
				cost = self.costs.hightierpro
			},
			name_id = "menu_trigger_happy",
			desc_id = "menu_trigger_happy_desc",
			icon_xy = {
				7,
				11
			}
		}
		self.skills.messiah 				= {{upgrades = {"player_passive_empowered_intimidation", "passive_player_assets_cost_multiplier",
					"player_messiah_revive_from_bleed_out_1"
				},
				cost = self.costs.hightier
			},
			{
				upgrades = {
					"player_messiah_revive_from_bleed_out_2"
				},
				cost = self.costs.hightierpro
			},
			name_id = "menu_pistol_beta_messiah",
			desc_id = "menu_pistol_beta_messiah_desc",
			icon_xy = {
				2,
				9
			}
		}
		self.skills.inspire 				= {{upgrades = {"player_passive_empowered_intimidation", "passive_player_assets_cost_multiplier",
					"player_revive_interaction_speed_multiplier",
					"player_morale_boost"
				},
				cost = self.costs.hightier
			},
			{
				upgrades = {
					"cooldown_long_dis_revive"
				},
				cost = self.costs.hightierpro
			},
			name_id = "menu_inspire",
			desc_id = "menu_inspire_desc",
			icon_xy = {
				4,
				9
			}
		}

		self.skills.show_of_force 	= {{upgrades = {"player_passive_suppression_bonus_1",
					"player_primary_weapon_when_downed"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"player_armor_regen_timer_multiplier"
				},
				cost = self.costs.pro
			},
			name_id = "menu_show_of_force",
			desc_id = "menu_show_of_force_desc",
			icon_xy = {
				1,
				2
			}
		}
		self.skills.underdog 		= {{upgrades = {"player_passive_suppression_bonus_1",
					"player_damage_multiplier_outnumbered"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"player_damage_dampener_outnumbered"
				},
				cost = self.costs.pro
			},
			name_id = "menu_underdog",
			desc_id = "menu_underdog_desc",
			icon_xy = {
				2,
				1
			}
		}
		self.skills.steroids 		= {{upgrades = {"player_passive_suppression_bonus_1",
					"player_non_special_melee_multiplier"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"player_melee_damage_multiplier"
				},
				cost = self.costs.pro
			},
			name_id = "menu_steroids",
			desc_id = "menu_steroids_desc",
			icon_xy = {
				4,
				0
			}
		}
		self.skills.oppressor 		= {{upgrades = {"player_passive_health_multiplier_1",
					"player_suppression_bonus"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"player_suppression_mul_2"
				},
				cost = self.costs.pro
			},
			name_id = "menu_oppressor",
			desc_id = "menu_oppressor_desc",
			icon_xy = {
				7,
				0
			}
		}
		self.skills.tough_guy 		= {{upgrades = {"player_passive_health_multiplier_1",
					"player_damage_shake_multiplier"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"player_bleed_out_health_multiplier"
				},
				cost = self.costs.pro
			},
			name_id = "menu_tough_guy",
			desc_id = "menu_tough_guy_desc",
			icon_xy = {
				1,
				1
			}
		}
		self.skills.pack_mule 		= {{upgrades = {"player_passive_health_multiplier_1",
					"carry_movement_speed_multiplier"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"carry_throw_distance_multiplier"
				},
				cost = self.costs.pro
			},
			name_id = "menu_pack_mule",
			desc_id = "menu_pack_mule_desc",
			icon_xy = {
				6,
				0
			}
		}
		self.skills.shotgun_impact 	= {{upgrades = {"player_passive_suppression_bonus_2",
					"shotgun_recoil_multiplier"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"shotgun_damage_multiplier_1"
				},
				cost = self.costs.pro
			},
			name_id = "menu_shotgun_impact",
			desc_id = "menu_shotgun_impact_desc",
			icon_xy = {
				5,
				0
			}
		}
		self.skills.shades 			= {{upgrades = {"player_passive_suppression_bonus_2",
					"player_flashbang_multiplier_1"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"player_flashbang_multiplier_2"
				},
				cost = self.costs.pro
			},
			name_id = "menu_shades",
			desc_id = "menu_shades_desc",
			icon_xy = {
				6,
				1
			}
		}
		self.skills.scavenger 		= {{upgrades = {"player_passive_suppression_bonus_2",
					"player_increased_pickup_area_1"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"temporary_loose_ammo_give_team"
				},
				cost = self.costs.pro
			},
			name_id = "menu_scavenger",
			desc_id = "menu_scavenger_desc",
			icon_xy = {
				4,
				5
			}
		}
		self.skills.shotgun_cqb 	= {{upgrades = {"player_passive_health_multiplier_2",
					"shotgun_reload_speed_multiplier_1"
				},
				cost = self.costs.hightier
			},
			{
				upgrades = {
					"shotgun_enter_steelsight_speed_multiplier"
				},
				cost = self.costs.hightierpro
			},
			name_id = "menu_shotgun_cqb",
			desc_id = "menu_shotgun_cqb_desc",
			icon_xy = {
				5,
				1
			}
		}
		self.skills.ammo_2x 		= {{upgrades = {"player_passive_health_multiplier_2",
					"ammo_bag_quantity"
				},
				cost = self.costs.hightier
			},
			{
				upgrades = {
					"ammo_bag_ammo_increase1"
				},
				cost = self.costs.hightierpro
			},
			name_id = "menu_ammo_2x_beta",
			desc_id = "menu_ammo_2x_beta_desc",
			icon_xy = {
				7,
				1
			}
		}
		self.skills.wolverine 		= {{upgrades = {"player_passive_health_multiplier_2",
					"player_melee_damage_health_ratio_multiplier"
				},
				cost = self.costs.hightier
			},
			{
				upgrades = {
					"player_damage_health_ratio_multiplier"
				},
				cost = self.costs.hightierpro
			},
			name_id = "menu_wolverine",
			desc_id = "menu_wolverine_beta_desc",
			icon_xy = {
				2,
				2
			}
		}
		self.skills.heavy_impact 	= {{upgrades = {"weapon_passive_damage_multiplier",
					"shotgun_steelsight_range_inc_1",
					"shotgun_steelsight_accuracy_inc_1"
				},
				cost = self.costs.hightier
			},
			{
				upgrades = {
					"weapon_knock_down_2"
				},
				cost = self.costs.hightierpro
			},
			name_id = "menu_heavy_impact",
			desc_id = "menu_heavy_impact_desc",
			icon_xy = {
				5,
				12
			}
		}
		self.skills.bandoliers 		= {{upgrades = {"weapon_passive_damage_multiplier",
					"extra_ammo_multiplier1"
				},
				cost = self.costs.hightier
			},
			{
				upgrades = {
					"player_pick_up_ammo_multiplier",
					"player_pick_up_ammo_multiplier_2"
				},
				cost = self.costs.hightierpro
			},
			name_id = "menu_bandoliers",
			desc_id = "menu_bandoliers_desc",
			icon_xy = {
				3,
				0
			}
		}
		self.skills.portable_saw 	= {{upgrades = {"weapon_passive_damage_multiplier",
					"saw"
				},
				cost = self.costs.hightier
			},
			{
				upgrades = {
					"saw_extra_ammo_multiplier"
				},
				cost = self.costs.hightierpro
			},
			name_id = "menu_portable_saw",
			desc_id = "menu_portable_saw_desc",
			icon_xy = {
				0,
				1
			}
		}
		self.skills.overkill 		= {{upgrades = {"player_passive_health_multiplier_3",
					"player_overkill_damage_multiplier"
				},
				cost = self.costs.hightier
			},
			{
				upgrades = {
					"player_overkill_all_weapons"
				},
				cost = self.costs.hightierpro
			},
			name_id = "menu_overkill",
			desc_id = "menu_overkill_desc",
			icon_xy = {
				3,
				2
			}
		}
		self.skills.juggernaut 		= {{upgrades = {"player_passive_health_multiplier_3",
					"body_armor6"
				},
				cost = self.costs.hightier
			},
			{
				upgrades = {
					"player_shield_knock",
					"player_run_and_shoot"
				},
				cost = self.costs.hightierpro
			},
			name_id = "menu_juggernaut",
			desc_id = "menu_juggernaut_desc",
			icon_xy = {
				3,
				1
			}
		}
		self.skills.carbon_blade 	= {{upgrades = {"player_passive_health_multiplier_3",
					"player_saw_speed_multiplier_1",
					"saw_lock_damage_multiplier_1"
				},
				cost = self.costs.hightier
			},
			{
				upgrades = {
					"player_saw_speed_multiplier_2",
					"saw_lock_damage_multiplier_2",
					"saw_enemy_slicer",
					"saw_reload_speed_multiplier"
				},
				cost = self.costs.hightierpro
			},
			name_id = "menu_carbon_blade",
			desc_id = "menu_carbon_blade_desc",
			icon_xy = {
				0,
				2
			}
		}

		self.skills.rifleman 					= {{upgrades = {"player_passive_crafting_weapon_multiplier_1", "player_passive_crafting_mask_multiplier_1",
					"assault_rifle_enter_steelsight_speed_multiplier",
					"snp_enter_steelsight_speed_multiplier"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"assault_rifle_zoom_increase",
					"snp_zoom_increase"
				},
				cost = self.costs.pro
			},
			name_id = "menu_rifleman",
			desc_id = "menu_rifleman_desc",
			icon_xy = {
				0,
				5
			}
		}
		self.skills.trip_miner 					= {{upgrades = {"player_passive_crafting_weapon_multiplier_1", "player_passive_crafting_mask_multiplier_1",
					"trip_mine_quantity_increase_1"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"player_trip_mine_deploy_time_multiplier"
				},
				cost = self.costs.pro
			},
			name_id = "menu_trip_miner",
			desc_id = "menu_trip_miner_desc",
			icon_xy = {
				2,
				5
			}
		}
		self.skills.discipline 					= {{upgrades = {"player_passive_crafting_weapon_multiplier_1", "player_passive_crafting_mask_multiplier_1",
					"player_interacting_damage_multiplier"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"player_steelsight_when_downed"
				},
				cost = self.costs.pro
			},
			name_id = "menu_discipline",
			desc_id = "menu_discipline_desc",
			icon_xy = {
				6,
				6
			}
		}
		self.skills.sharpshooter 				= {{upgrades = {"weapon_passive_recoil_multiplier_1",
					"weapon_single_spread_multiplier"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"assault_rifle_recoil_multiplier",
					"snp_recoil_multiplier"
				},
				cost = self.costs.pro
			},
			name_id = "menu_sharpshooter",
			desc_id = "menu_sharpshooter_desc",
			icon_xy = {
				6,
				5
			}
		}
		self.skills.trip_mine_expert 			= {{upgrades = {"weapon_passive_recoil_multiplier_1",
					"trip_mine_can_switch_on_off"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"trip_mine_sensor_toggle",
					"trip_mine_sensor_highlight"
				},
				cost = self.costs.pro
			},
			name_id = "menu_trip_mine_expert",
			desc_id = "menu_trip_mine_expert_desc",
			icon_xy = {
				4,
				6
			}
		}
		self.skills.hardware_expert 			= {{upgrades = {"weapon_passive_recoil_multiplier_1",
					"player_drill_fix_interaction_speed_multiplier",
					"player_trip_mine_deploy_time_multiplier_2"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"player_drill_autorepair_1",
					"player_sentry_gun_deploy_time_multiplier"
				},
				cost = self.costs.pro
			},
			name_id = "menu_hardware_expert",
			desc_id = "menu_hardware_expert_desc",
			icon_xy = {
				5,
				5
			}
		}
		self.skills.marksman 					= {{upgrades = {"player_passive_crafting_weapon_multiplier_2", "player_passive_crafting_mask_multiplier_2",
					"weapon_single_spread_index_addend"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"single_shot_accuracy_inc_1"
				},
				cost = self.costs.pro
			},
			name_id = "menu_sharpshooter_beta",
			desc_id = "menu_sharpshooter_beta_desc",
			icon_xy = {
				6,
				12
			}
		}
		self.skills.combat_engineering 			= {{upgrades = {"player_passive_crafting_weapon_multiplier_2", "player_passive_crafting_mask_multiplier_2",
					"trip_mine_explosion_size_multiplier_1"
				},
				cost = self.costs.hightier
			},
			{
				upgrades = {
					"trip_mine_marked_enemy_extra_damage"
				},
				cost = self.costs.hightierpro
			},
			name_id = "menu_master_craftsman",
			desc_id = "menu_master_craftsman_desc",
			icon_xy = {
				6,
				9
			}
		}
		self.skills.drill_expert 				= {{upgrades = {"player_passive_crafting_weapon_multiplier_2", "player_passive_crafting_mask_multiplier_2",
					"player_drill_speed_multiplier1"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"player_drill_speed_multiplier2"
				},
				cost = self.costs.pro
			},
			name_id = "menu_drill_expert_beta",
			desc_id = "menu_drill_expert_beta_desc",
			icon_xy = {
				3,
				6
			}
		}
		self.skills.sentry_gun 					= {{upgrades = {"weapon_passive_headshot_damage_multiplier",
					"sentry_gun",
					"sentry_gun_silent"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"sentry_gun_armor_multiplier"
				},
				cost = self.costs.pro
			},
			name_id = "menu_sentry_gun",
			desc_id = "menu_sentry_gun_desc",
			icon_xy = {
				7,
				5
			}
		}	
		self.skills.jack_of_all_trades 			= {{upgrades = {"weapon_passive_headshot_damage_multiplier",
					"deploy_interact_faster_1"
				},
				cost = self.costs.hightier
			},
			{
				upgrades = {
					"second_deployable_1"
				},
				cost = self.costs.hightierpro
			},
			name_id = "menu_jack_of_all_trades_beta",
			desc_id = "menu_jack_of_all_trades_beta_desc",
			icon_xy = {
				7,
				9
			}
		}
		self.skills.silent_drilling 			= {{upgrades = {"weapon_passive_headshot_damage_multiplier",
				"player_drill_alert"
			},
				cost = self.costs.hightier
			},
			{
				upgrades = {"player_silent_drill"},
				cost = self.costs.hightierpro
			},
			name_id = "menu_silent_drilling",
			desc_id = "menu_silent_drilling_desc",
			icon_xy = {
				2,
				6
			}
		}
		self.skills.sentry_2_0 					= {{upgrades = {"player_passive_crafting_weapon_multiplier_3", "player_passive_crafting_mask_multiplier_3",
					"sentry_gun_cost_reduction_1"
				},
				cost = self.costs.hightier
			},
			{
				upgrades = {
					"sentry_gun_shield"
				},
				cost = self.costs.hightierpro
			},
			name_id = "menu_sentry_2_0",
			desc_id = "menu_defense_up_beta_desc",
			icon_xy = {
				1,
				6
			}
		}
		self.skills.shaped_charge 				= {{upgrades = {"player_passive_crafting_weapon_multiplier_3", "player_passive_crafting_mask_multiplier_3",
					"trip_mine_quantity_increase_2"
				},
				cost = self.costs.hightier
			},
			{
				upgrades = {
					"player_trip_mine_shaped_charge"
				},
				cost = self.costs.hightierpro
			},
			name_id = "menu_shaped_charge",
			desc_id = "menu_shaped_charge_desc",
			icon_xy = {
				0,
				7
			}
		}
		self.skills.insulation 					= {{upgrades = {"player_passive_crafting_weapon_multiplier_3", "player_passive_crafting_mask_multiplier_3",
					"player_taser_malfunction"
				},
				cost = self.costs.hightier
			},
			{
				upgrades = {
					"player_taser_self_shock"
				},
				cost = self.costs.hightierpro
			},
			name_id = "menu_insulation",
			desc_id = "menu_insulation_desc",
			icon_xy = {
				3,
				5
			}
		}	
		self.skills.tower_defense 				= {{upgrades = {"weapon_passive_recoil_multiplier_2", "player_passive_armor_multiplier_1", "team_passive_armor_regen_time_multiplier",
					"sentry_gun_quantity_1"
				},
				cost = self.costs.hightier
			},
			{
				upgrades = {
					"sentry_gun_damage_multiplier"
				},
				cost = self.costs.hightierpro
			},
			name_id = "menu_sentry_gun_2x",
			desc_id = "menu_sentry_gun_2x_desc",
			icon_xy = {
				7,
				6
			}
		}
		self.skills.aggressive_shots 			= {{upgrades = {"weapon_passive_recoil_multiplier_2", "player_passive_armor_multiplier_1", "team_passive_armor_regen_time_multiplier",
					"temporary_single_shot_fast_reload_1",
					"snp_reload_speed_multiplier"
				},
				cost = self.costs.hightier
			},
			{
				upgrades = {
					"player_critical_hit_chance_1",
					"snp_move_spread_multiplier"
				},
				cost = self.costs.hightierpro
			},
			name_id = "menu_aggressive_shots",
			desc_id = "menu_aggressive_shots_desc",
			icon_xy = {
				2,
				0
			}
		}
		self.skills.iron_man 					= {{upgrades = {"weapon_passive_recoil_multiplier_2", "player_passive_armor_multiplier_1", "team_passive_armor_regen_time_multiplier",
					"player_armor_multiplier"
				},
				cost = self.costs.hightier
			},
			{
				upgrades = {
					"team_armor_regen_time_multiplier"
				},
				cost = self.costs.hightierpro
			},
			name_id = "menu_iron_man",
			desc_id = "menu_iron_man_desc",
			icon_xy = {
				6,
				4
			}
		}

		self.skills.martial_arts 	= {{upgrades = {"player_passive_dodge_chance_1",
					"player_melee_knockdown_mul"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"player_melee_damage_dampener"
				},
				cost = self.costs.pro
			},
			name_id = "menu_martial_arts",
			desc_id = "menu_martial_arts_desc",
			icon_xy = {
				1,
				3
			}
		}
		self.skills.sprinter 		= {{upgrades = {"player_passive_dodge_chance_1",
					"player_stamina_regen_timer_multiplier",
					"player_stamina_regen_multiplier"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"player_run_dodge_chance",
					"player_run_speed_multiplier"
				},
				cost = self.costs.pro
			},
			name_id = "menu_sprinter",
			desc_id = "menu_sprinter_desc",
			icon_xy = {
				7,
				3
			}
		}
		self.skills.cat_burglar 	= {{upgrades = {"player_passive_dodge_chance_1",
					"player_fall_damage_multiplier"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"player_fall_health_damage_multiplier"
				},
				cost = self.costs.pro
			},
			name_id = "menu_cat_burglar",
			desc_id = "menu_cat_burglar_desc",
			icon_xy = {
				0,
				4
			}
		}
		self.skills.transporter 	= {{upgrades = {"weapon_passive_swap_speed_multiplier_1",
					"carry_interact_speed_multiplier_1"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"carry_interact_speed_multiplier_2"
				},
				cost = self.costs.pro
			},
			name_id = "menu_transporter",
			desc_id = "menu_transporter_desc",
			icon_xy = {
				4,
				3
			}
		}
		self.skills.chameleon 		= {{upgrades = {"weapon_passive_swap_speed_multiplier_1",
					"player_suspicion_bonus",
					"player_sec_camera_highlight_mask_off",
					"player_special_enemy_highlight_mask_off"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"player_camouflage_bonus_2"
				},
				cost = self.costs.pro
			},
			name_id = "menu_chameleon",
			desc_id = "menu_chameleon_desc",
			icon_xy = {
				5,
				3
			}
		}
		self.skills.cleaner 		= {{upgrades = {"weapon_passive_swap_speed_multiplier_1",
					"player_corpse_dispose_amount_1",
					"player_buy_bodybags_asset"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"player_corpse_dispose_amount_2"
				},
				cost = self.costs.pro
			},
			name_id = "menu_cleaner",
			desc_id = "menu_cleaner_desc",
			icon_xy = {
				7,
				2
			}
		}
		self.skills.assassin 		= {{upgrades = {"player_passive_dodge_chance_2",
					"player_walk_speed_multiplier",
					"player_crouch_speed_multiplier_1"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"player_silent_kill"
				},
				cost = self.costs.pro
			},
			name_id = "menu_assassin",
			desc_id = "menu_assassin_desc",
			icon_xy = {
				0,
				3
			}
		}
		self.skills.spotter 		= {{upgrades = {"player_passive_dodge_chance_2",
					"player_marked_enemy_extra_damage"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"player_buy_spotter_asset"
				},
				cost = self.costs.pro
			},
			name_id = "menu_spotter",
			desc_id = "menu_spotter_desc",
			icon_xy = {
				3,
				7
			}
		}
		self.skills.smg_master 		= {{upgrades = {"player_passive_dodge_chance_2",
					"smg_reload_speed_multiplier"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"smg_fire_rate_multiplier"
				},
				cost = self.costs.pro
			},
			name_id = "menu_smg_master",
			desc_id = "menu_smg_master_desc",
			icon_xy = {
				3,
				3
			}
		}
		self.skills.magic_touch 	= {{upgrades = {"player_passive_suspicion_bonus", "player_passive_armor_movement_penalty_multiplier",
					"player_pick_lock_easy",
					"player_pick_lock_easy_speed_multiplier_1"
				},
				cost = self.costs.hightier
			},
			{
				upgrades = {
					"player_pick_lock_hard",
					"player_pick_lock_easy_speed_multiplier_2"
				},
				cost = self.costs.hightierpro
			},
			name_id = "menu_magic_touch",
			desc_id = "menu_magic_touch_desc",
			icon_xy = {
				5,
				4
			}
		}
		self.skills.ecm_2x 			= {{upgrades = {"player_passive_suspicion_bonus", "player_passive_armor_movement_penalty_multiplier",
					"ecm_jammer_quantity_increase_1"
				},
				cost = self.costs.hightier
			},
			{
				upgrades = {
					"ecm_jammer_duration_multiplier_2",
					"ecm_jammer_feedback_duration_boost_2",
					"ecm_jammer_affects_pagers"
				},
				cost = self.costs.hightierpro
			},
			name_id = "menu_ecm_2x_beta",
			desc_id = "menu_ecm_2x_beta_desc",
			icon_xy = {
				3,
				4
			}
		}
		self.skills.nine_lives 		= {{upgrades = {"player_passive_suspicion_bonus", "player_passive_armor_movement_penalty_multiplier",
					"player_additional_lives_1"
				},
				cost = self.costs.hightier
			},
			{
				upgrades = {
					"player_cheat_death_chance_1"
				},
				cost = self.costs.hightierpro
			},
			name_id = "menu_nine_lives",
			desc_id = "menu_nine_lives_desc",
			icon_xy = {
				5,
				2
			}
		}
		self.skills.good_luck_charm = {{upgrades = {"weapon_passive_swap_speed_multiplier_2",
					"player_tape_loop_duration_1"
				},
				cost = self.costs.hightier
			},
			{
				upgrades = {
					"player_tape_loop_duration_2"
				},
				cost = self.costs.hightierpro
			},
			name_id = "menu_good_luck_charm",
			desc_id = "menu_good_luck_charm_desc",
			icon_xy = {
				4,
				2
			}
		}
		self.skills.ecm_booster 	= {{upgrades = {"weapon_passive_swap_speed_multiplier_2",
					"ecm_jammer_duration_multiplier"
				},
				cost = self.costs.hightier
			},
			{
				upgrades = {
					"ecm_jammer_can_open_sec_doors"
				},
				cost = self.costs.hightierpro
			},
			name_id = "menu_ecm_booster",
			desc_id = "menu_ecm_booster_desc",
			icon_xy = {
				6,
				3
			}
		}
		self.skills.silence_expert 	= {{upgrades = {"weapon_passive_swap_speed_multiplier_2",
					"weapon_silencer_recoil_multiplier",
					"weapon_silencer_enter_steelsight_speed_multiplier"
				},
				cost = self.costs.hightier
			},
			{
				upgrades = {
					"weapon_silencer_spread_multiplier",
					"weapon_silencer_armor_piercing_chance_2"
				},
				cost = self.costs.hightierpro
			},
			name_id = "menu_silence_expert",
			desc_id = "menu_silence_expert_desc",
			icon_xy = {
				4,
				4
			}
		}
		self.skills.low_blow 		= {{upgrades = {"player_passive_loot_drop_multiplier", "weapon_passive_armor_piercing_chance",
					"player_detection_risk_add_crit_chance_1"
				},
				cost = self.costs.hightier
			},
			{
				upgrades = {
					"player_detection_risk_add_crit_chance_2"
				},
				cost = self.costs.hightierpro
			},
			name_id = "menu_backstab_beta",
			desc_id = "menu_backstab_beta_desc",
			icon_xy = {
				0,
				12
			}
		}
		self.skills.ecm_feedback 	= {{upgrades = {"player_passive_loot_drop_multiplier", "weapon_passive_armor_piercing_chance",
					"ecm_jammer_can_activate_feedback"
				},
				cost = self.costs.hightier
			},
			{
				upgrades = {
					"ecm_jammer_feedback_duration_boost",
					"ecm_jammer_interaction_speed_multiplier",
					"ecm_jammer_can_retrigger"
				},
				cost = self.costs.hightierpro
			},
			name_id = "menu_ecm_feedback",
			desc_id = "menu_ecm_feedback_desc",
			icon_xy = {
				6,
				2
			}
		}
		self.skills.hitman 			= {{upgrades = {"player_passive_loot_drop_multiplier", "weapon_passive_armor_piercing_chance",
					"weapon_silencer_damage_multiplier_1"
				},
				cost = self.costs.hightier
			},
			{
				upgrades = {
					"weapon_silencer_damage_multiplier_2",
					"weapon_silencer_armor_piercing_chance_1"
				},
				cost = self.costs.hightierpro
			},
			name_id = "menu_hitman",
			desc_id = "menu_hitman_desc",
			icon_xy = {
				5,
				9
			}
		}

		self.skills.cell_mates 				= {{upgrades = {"team_passive_health_multiplier",
					"player_gangster_damage_dampener_1"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"player_gangster_damage_dampener_2"
				},
				cost = self.costs.pro
			},
			name_id = "menu_cell_mates",
			desc_id = "menu_cell_mates_desc",
			icon_xy = {
				4,
				11
			}
		}
		self.skills.master_craftsman 		= {{upgrades = {"team_passive_health_multiplier",
					"player_crafting_weapon_multiplier"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"player_crafting_mask_multiplier"
				},
				cost = self.costs.pro
			},
			name_id = "menu_mastercraftsman",
			desc_id = "menu_mastercraftsman_desc",
			icon_xy = {
				1,
				7
			}
		}
		self.skills.freedom_call 			= {{upgrades = {"team_passive_health_multiplier",
					"player_climb_speed_multiplier_1"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"player_on_zipline_dodge_chance"
				},
				cost = self.costs.pro
			},
			name_id = "menu_freedom_call",
			desc_id = "menu_freedom_call_desc",
			icon_xy = {
				5,
				10
			}
		}
		self.skills.awareness 				= {{upgrades = {"player_tier_armor_multiplier_1",
					"player_movement_speed_multiplier"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"player_steelsight_normal_movement_speed"
				},
				cost = self.costs.pro
			},
			name_id = "menu_awareness",
			desc_id = "menu_awareness_desc",
			icon_xy = {
				7,
				10
			}
		}
		self.skills.alpha_dog 				= {{upgrades = {"player_tier_armor_multiplier_1",
					"player_crouch_dodge_chance_1"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"player_crouch_dodge_chance_2"
				},
				cost = self.costs.pro
			},
			name_id = "menu_alpha_dog",
			desc_id = "menu_alpha_dog_desc",
			icon_xy = {
				0,
				11
			}
		}
		self.skills.up_you_go 				= {{upgrades = {"player_tier_armor_multiplier_1",
					"player_revived_damage_resist_1"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"player_revived_health_regain_1"
				},
				cost = self.costs.pro
			},
			name_id = "menu_up_you_go_beta",
			desc_id = "menu_up_you_go_beta_desc",
			icon_xy = {
				3,
				13
			}
		}
		self.skills.hidden_blade 			= {{upgrades = {"player_damage_dampener_outnumbered_strong",
					"player_melee_concealment_modifier"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"player_ballistic_vest_concealment_1"
				},
				cost = self.costs.pro
			},
			name_id = "menu_thick_skin_beta",
			desc_id = "menu_thick_skin_beta_desc",
			icon_xy = {
				1,
				13
			}
		}
		self.skills.jail_workout 			= {{upgrades = {"player_damage_dampener_outnumbered_strong",
					"player_mark_enemy_time_multiplier"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"player_standstill_omniscience"
				},
				cost = self.costs.pro
			},
			name_id = "menu_jail_workout",
			desc_id = "menu_jail_workout_desc",
			icon_xy = {
				6,
				10
			}
		}
		self.skills.running_from_death 		= {{upgrades = {"player_damage_dampener_outnumbered_strong",
					"player_temp_swap_weapon_faster_1",
					"player_temp_reload_weapon_faster_1"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"player_temp_increased_movement_speed_1"
				},
				cost = self.costs.pro
			},
			name_id = "menu_running_from_death_beta",
			desc_id = "menu_running_from_death_beta_desc",
			icon_xy = {
				2,
				13
			}
		}
		self.skills.thick_skin 				= {{upgrades = {"weapon_special_damage_taken_multiplier",
					"player_damage_shake_addend"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"player_level_2_armor_addend",
					"player_level_3_armor_addend",
					"player_level_4_armor_addend"
				},
				cost = self.costs.pro
			},
			name_id = "menu_thick_skin",
			desc_id = "menu_thick_skin_desc",
			icon_xy = {
				2,
				12
			}
		}
		self.skills.tea_time 				= {{upgrades = {"weapon_special_damage_taken_multiplier",
					"first_aid_kit_deploy_time_multiplier"
				},
				cost = self.costs.default
			},
			{
				upgrades = {
					"first_aid_kit_damage_reduction_upgrade"
				},
				cost = self.costs.pro
			},
			name_id = "menu_tea_time_beta",
			desc_id = "menu_tea_time_beta_desc",
			icon_xy = {
				1,
				11
			}
		}
		self.skills.second_wind 			= {{upgrades = {"weapon_special_damage_taken_multiplier",
					"temporary_damage_speed_multiplier"
				},
				cost = self.costs.hightier
			},
			{
				upgrades = {
					"player_level_2_dodge_addend_1",
					"player_level_3_dodge_addend_1",
					"player_level_4_dodge_addend_1"
				},
				cost = self.costs.hightierpro
			},
			name_id = "menu_second_wind",
			desc_id = "menu_second_wind_desc",
			icon_xy = {
				7,
				12
			}
		}
		self.skills.second_chances 			= {{upgrades = {"player_stand_still_crouch_camouflage_bonus_2",
					"bodybags_bag"
				},
				cost = self.costs.hightier
			},
			{
				upgrades = {
					"bodybags_bag_quantity"
				},
				cost = self.costs.hightierpro
			},
			name_id = "menu_second_chances",
			desc_id = "menu_second_chances_desc",
			icon_xy = {
				5,
				11
			}
		}
		self.skills.tea_cookies 			= {{upgrades = {"player_stand_still_crouch_camouflage_bonus_2",
					"first_aid_kit_quantity_increase_1"
				},
				cost = self.costs.hightier
			},
			{
				upgrades = {
					"first_aid_kit_quantity_increase_2"
				},
				cost = self.costs.hightierpro
			},
			name_id = "menu_tea_cookies",
			desc_id = "menu_tea_cookies_desc",
			icon_xy = {
				2,
				11
			}
		}
		self.skills.akimbo 					= {{upgrades = {"player_stand_still_crouch_camouflage_bonus_2",
					"jowi",
					"x_packrat",
					"x_1911",
					"x_b92fs",
					"x_deagle",
					"x_g22c",
					"x_g17",
					"x_usp",
					"x_packrat",
					"x_p226",
					"x_ppk",
					"x_rage",
					"x_sparrow",
					"x_pl14",
					"x_legacy",
					"x_c96",
					"x_breech",
					"x_chinchilla",
					"x_shrew",
					"x_hs2000",
					"x_g18c",
					"x_2006m",
					"akimbo_recoil_multiplier_1",
					"akimbo_recoil_multiplier_2"
				},
				cost = self.costs.hightier
			},
			{
				upgrades = {
					"akimbo_extra_ammo_multiplier_1",
					"akimbo_extra_ammo_multiplier_2",
					"akimbo_recoil_multiplier_3"
				},
				cost = self.costs.hightierpro
			},
			name_id = "menu_akimbo_skill",
			desc_id = "menu_akimbo_skill_desc",
			icon_xy = {
				3,
				11
			}
		}
		self.skills.bloodthirst 			= {{upgrades = {"player_armor_regen_timer_stand_still_multiplier",
					"player_melee_damage_stacking_1"
				},
				cost = self.costs.hightier
			},
			{
				upgrades = {
					"player_temp_melee_kill_increase_reload_speed_1"
				},
				cost = self.costs.hightierpro
			},
			name_id = "menu_bloodthirst",
			desc_id = "menu_bloodthirst_desc",
			icon_xy = {
				0,
				6
			}
		}
		self.skills.backstab 				= {{upgrades = {"player_armor_regen_timer_stand_still_multiplier",
					"player_counter_strike_spooc"
				},
				cost = self.costs.hightier
			},
			{
				upgrades = {
					"player_melee_kill_snatch_pager_chance"
				},
				cost = self.costs.hightierpro
			},
			name_id = "menu_backstab",
			desc_id = "menu_backstab_desc",
			icon_xy = {
				2,
				10
			}
		}
		self.skills.gunzerker 				= {{upgrades = {"player_armor_regen_timer_stand_still_multiplier",
					"x_basset",
					"x_judge",
					"x_rota"
				},
				cost = self.costs.hightier
			},
			{
				upgrades = {
					"x_akmsu",
					"x_baka",
					"x_coal",
					"x_cobray",
					"x_erma",
					"x_hajk",
					"x_m1928",
					"x_m45",
					"x_mac10",
					"x_mp5",
					"x_mp7",
					"x_mp9",
					"x_olympic",
					"x_p90",
					"x_polymer",
					"x_schakal",
					"x_scorpion",
					"x_shepheard",
					"x_sr2",
					"x_sterling",
					"x_tec9",
					"x_uzi"
				},
				cost = self.costs.hightierpro
			},
			name_id = "menu_gunzerker",
			desc_id = "menu_gunzerker_desc",
			icon_xy = {
				0,
				13
			}
		}

		self.skill_switches[2].locks = {achievement = "frog_1"}
		self.skill_switches[15].locks = {level = 100}
		
		self.specialization_convertion_rate = {
			10000,
			10000,
			10000,
			10000,
			10000,
			10000,
			10000,
			10000,
			10000,
			10000
		}
		local very_low = 25
		local low = 100
		local medium = 200
		local high = 300
		local very_high = 500
		local top = 700
		
		self.specializations = {
			{
				name_id = "menu_bonus_exp",
				desc_id = "menu_bonus_exp_desc",
				{
					upgrades = {
						"passive_player_xp_multiplier"
					},
					cost = very_low,
					icon_xy = {0, 0},
					name_id = "menu_bonus_exp",
					desc_id = "menu_bonus_exp_detailed_desc"
				}
			},
			{
				name_id = "menu_bonus_small_money",
				desc_id = "menu_bonus_small_money_desc",
				{
					upgrades = {
						"player_small_loot_multiplier_1"
					},
					cost = very_low,
					icon_xy = {1, 0},
					name_id = "menu_bonus_small_money",
					desc_id = "menu_bonus_small_money_detailed_desc"
				}
			},
			{
				name_id = "menu_bonus_loot",
				desc_id = "menu_bonus_loot_desc",
				{
					upgrades = {
						"player_loot_drop_multiplier_2"
					},
					cost = very_low,
					icon_xy = {2, 0},
					name_id = "menu_bonus_loot",
					desc_id = "menu_bonus_loot_detailed_desc"
				}
			},
			{
				name_id = "menu_triathlete",
				desc_id = "menu_triathlete_desc",
				{
					upgrades = {
						"team_stamina_multiplier"
					},
					cost = low,
					icon_xy = {3, 0},
					name_id = "menu_triathlete",
					desc_id = "menu_triathlete_detailed_desc"
				}
			},
			{
				name_id = "menu_joker",
				desc_id = "menu_joker_desc",
				{
					upgrades = {
						"player_convert_enemies",
						"player_convert_enemies_max_minions_1",
						"player_convert_enemies_health_multiplier",
						"player_convert_enemies_damage_multiplier",
						"player_passive_convert_enemies_health_multiplier_2"
					},
					cost = high,
					icon_xy = {4, 0},
					name_id = "menu_joker",
					desc_id = "menu_joker_detailed_desc"
				}
			},
			{
				name_id = "menu_mag_plus",
				desc_id = "menu_mag_plus_desc",
				{
					upgrades = {
						"weapon_clip_ammo_increase_1"
					},
					cost = medium,
					icon_xy = {2, 1},
					name_id = "menu_mag_plus",
					desc_id = "menu_mag_plus_detailed_desc"
				}
			},
			{
				name_id = "menu_blast_radius",
				desc_id = "menu_blast_radius_desc",
				{
					upgrades = {
						"trip_mine_explosion_size_multiplier_2"
					},
					cost = low,
					icon_xy = {9, 0},
					name_id = "menu_blast_radius",
					desc_id = "menu_blast_radius_detailed_desc"
				}
			},
			{
				name_id = "menu_moving_target",
				desc_id = "menu_moving_target_desc",
				{
					upgrades = {
						"player_can_free_run",
						"shotgun_hip_run_and_shoot_1",
						"player_uncover_multiplier"
					},
					cost = medium,
					icon_xy = {7, 0},
					name_id = "menu_moving_target",
					desc_id = "menu_moving_target_detailed_desc"
				}
			},
			{
				name_id = "menu_ammo_reservoir",
				desc_id = "menu_ammo_reservoir_desc",
				{
					upgrades = {
						"temporary_no_ammo_cost_1"
					},
					cost = medium,
					icon_xy = {4, 1},
					name_id = "menu_ammo_reservoir",
					desc_id = "menu_ammo_reservoir_detailed_desc"
				}
			},
			{
				name_id = "menu_keys_under_the_carpet",
				desc_id = "menu_keys_under_the_carpet_desc",
				{
					upgrades = {
						"player_pick_lock_speed_multiplier",
						"player_mask_off_pick_lock"
					},
					cost = medium,
					icon_xy = {5, 0},
					name_id = "menu_keys_under_the_carpet",
					desc_id = "menu_keys_under_the_carpet_detailed_desc"
				}
			},
			{
				name_id = "menu_infiltrator",
				desc_id = "menu_infiltrator_desc",
				{
					upgrades = {
						"player_mask_off_pickup",
						"player_mask_off_desktop_interaction",
						"player_mask_off_keycard_insert"
					},
					cost = very_high,
					icon_xy = {6, 0},
					name_id = "menu_infiltrator",
					desc_id = "menu_infiltrator_detailed_desc"
				}
			},		
			{
				name_id = "menu_fire_trap_beta",
				desc_id = "menu_fire_trap_desc",
				{
					upgrades = {
						"trip_mine_fire_trap_1",
						"trip_mine_fire_trap_2"
					},
					cost = medium,
					icon_xy = {0, 1},
					name_id = "menu_fire_trap_beta",
					desc_id = "menu_fire_trap_detailed_desc"
				}
			},
			{
				name_id = "menu_kick_starter_beta",
				desc_id = "menu_kick_starter_desc",
				{
					upgrades = {
						"player_drill_melee_hit_restart_chance_1"
					},
					cost = high,
					icon_xy = {8, 0},
					name_id = "menu_kick_starter_beta",
					desc_id = "menu_kick_starter_detailed_desc"
				}
			},
			{
				name_id = "menu_hostage_situation",
				desc_id = "menu_hostage_situation_desc",
				{
					upgrades = {
						"team_damage_hostage_absorption"
					},
					cost = low,
					icon_xy = {1, 1},
					name_id = "menu_hostage_situation",
					desc_id = "menu_hostage_situation_detailed_desc"
				}
			},
			
			-- Tools

			{
				name_id = "bm_ability_chico_injector",
				desc_id = "menu_unlock_tool_desc",
				dlc = "chico",
				{
					upgrades = {"chico_injector", "temporary_chico_injector_1"},
					cost = high,
					icon_xy = {6, 1},
					name_id = "bm_ability_chico_injector",
					desc_id = "bm_ability_chico_injector_desc"
				}
			},	
			
			--Weapons

			{
				name_id = "bm_concussion",
				desc_id = "menu_unlock_tool_desc",
				{
					upgrades = {"concussion"},
					cost = very_high,
					icon_xy = {7, 1},
					name_id = "bm_concussion",
					desc_id = "bm_concussion_desc"
				}
			},
			{
				name_id = "bm_grenade_smoke_screen_grenade",
				desc_id = "menu_unlock_tool_desc",
				{
					upgrades = {"smoke_screen_grenade"},
					cost = very_high,
					icon_xy = {8, 1},
					name_id = "bm_grenade_smoke_screen_grenade",
					desc_id = "bm_grenade_smoke_screen_grenade_desc"
				}
			},
			{
				name_id = "bm_grenade_pocket_ecm_jammer",
				desc_id = "menu_unlock_weapon_desc",
				{
					upgrades = {"pocket_ecm_jammer", "player_pocket_ecm_jammer_base"},
					cost = very_high,
					icon_xy = {9, 1},
					name_id = "bm_grenade_pocket_ecm_jammer",
					desc_id = "bm_grenade_pocket_ecm_jammer_desc"
				}
			},
			{
				name_id = "bm_w_hunter",
				desc_id = "menu_unlock_weapon_desc",
				dlc = "turtles",
				{
					upgrades = {"hunter"},
					cost = low,
					icon_xy = {9, 2},
					name_id = "bm_w_hunter",
					desc_id = "menu_hunter_desc"
				}
			},
			
			{
				name_id = "bm_w_elastic",
				desc_id = "menu_unlock_weapon_desc",
				{
					upgrades = {"elastic"},
					cost = medium,
					icon_xy = {8, 2},
					name_id = "bm_w_elastic",
					desc_id = "menu_elastic_desc"
				}
			},
			{
				name_id = "bm_w_plainsrider",
				desc_id = "menu_unlock_weapon_desc",
				dlc = "west",
				{
					upgrades = {"plainsrider"},
					cost = medium,
					icon_xy = {0, 3},
					name_id = "bm_w_plainsrider",
					desc_id = "menu_plainsrider_desc"
				}
			},
			{
				name_id = "bm_w_long",
				desc_id = "menu_unlock_weapon_desc",
				dlc = "steel",
				{
					upgrades = {"long"},
					cost = medium,
					icon_xy = {1, 3},
					name_id = "bm_w_long",
					desc_id = "menu_long_desc"
				}
			},
			{
				name_id = "bm_w_frankish",
				desc_id = "menu_unlock_weapon_desc",
				dlc = "steel",
				{
					upgrades = {"frankish"},
					cost = medium,
					icon_xy = {2, 3},
					name_id = "bm_w_frankish",
					desc_id = "menu_frankish_desc"
				}
			},
			{
				name_id = "bm_w_arblast",
				desc_id = "menu_unlock_weapon_desc",
				dlc = "steel",
				{
					upgrades = {"arblast"},
					cost = medium,
					icon_xy = {3, 3},
					name_id = "bm_w_arblast",
					desc_id = "menu_arblast_desc"
				}
			},
			{
				name_id = "bm_w_ecp",
				desc_id = "menu_unlock_weapon_desc",
				dlc = "ecp",
				{
					upgrades = {"ecp"},
					cost = medium,
					icon_xy = {7, 2},
					name_id = "bm_w_ecp",
					desc_id = "menu_ecp_desc"
				}
			},
			{
				name_id = "bm_w_m95",
				desc_id = "menu_unlock_weapon_desc",
				dlc = "gage_pack_snp",
				{
					upgrades = {"m95"},
					cost = top,
					icon_xy = {0, 2},
					name_id = "bm_w_m95",
					desc_id = "menu_m95_desc"
				}
			},
			{
				name_id = "bm_w_m134",
				desc_id = "menu_unlock_weapon_desc",
				dlc = "overkill_pack",
				{
					upgrades = {"m134"},
					cost = top,
					icon_xy = {1, 2},
					name_id = "bm_w_m134",
					desc_id = "menu_m134_desc"
				}
			},
			{
				name_id = "bm_w_shuno",
				desc_id = "menu_unlock_weapon_desc",
				{
					upgrades = {"shuno"},
					cost = top,
					icon_xy = {2, 2},
					name_id = "bm_w_shuno",
					desc_id = "menu_shuno_desc"
				}
			},
			{
				name_id = "bm_w_rpg7",
				desc_id = "menu_unlock_weapon_desc",
				dlc = "overkill_pack",
				{
					upgrades = {"rpg7"},
					cost = top,
					icon_xy = {3, 2},
					name_id = "bm_w_rpg7",
					desc_id = "menu_rpg7_desc"
				}
			},
			{
				name_id = "bm_w_ray",
				desc_id = "menu_unlock_weapon_desc",
				dlc = "friend",
				{
					upgrades = {"ray"},
					cost = top,
					icon_xy = {4, 2},
					name_id = "bm_w_ray",
					desc_id = "menu_ray_desc"
				}
			},
			{
				name_id = "bm_w_flamethrower_mk2",
				desc_id = "menu_unlock_weapon_desc",
				dlc = "bbq",
				{
					upgrades = {"flamethrower_mk2"},
					cost = top,
					icon_xy = {5, 2},
					name_id = "bm_w_flamethrower_mk2",
					desc_id = "menu_flamethrower_mk2_desc"
				}
			},
			{
				name_id = "bm_w_system",
				desc_id = "menu_unlock_weapon_desc",
				{
					upgrades = {"system"},
					cost = top,
					icon_xy = {6, 2},
					name_id = "bm_w_system",
					desc_id = "menu_system_desc"
				}
			}
		}
	end
end
if string.lower(RequiredScript) == "lib/tweak_data/upgradestweakdata" then
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
			[72] = {
				name_id = "weapons",
				upgrades = {
					"taser",
					"zeus"
				}
			},
			[75] = {
				name_id = "weapons",
				upgrades = {
					"hk21",
					"sandsteel",
					"cs",
					"great",
					"nin"
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

		self.values.player.pocket_ecm_jammer_base = {{cooldown_drain = 8, duration = 8}}
		self.values.temporary.chico_injector = {{0.8, 8}}

		self.values.team.health.passive_multiplier = {1.15}
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
		
		
		self.weapon_movement_penalty = {
			lmg = 0.8,
			minigun = 0.6
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
		self.values.cooldown.long_dis_revive = {{0.75, 1}}
		
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
		self.values.player.critical_hit_chance = {0.30}
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
		self.values.temporary.increased_movement_speed = {{1.05, 5}}
		self.values.temporary.damage_speed_multiplier = {{1.1, 5}}
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
				{"5%", "5"}
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
end
if string.lower(RequiredScript) == "lib/tweak_data/playertweakdata" then
	local data = PlayerTweakData.init
	function PlayerTweakData:init(tweak_data)
		data(self, tweak_data)
		self.damage.MIN_DAMAGE_INTERVAL = 0.35
		self.alarm_pager = {
			first_call_delay = {2, 4},
			call_duration = {
				{3, 6},
				{3, 6}
			},
			nr_of_calls = {2, 2},
			bluff_success_chance = {
				1,
				1,
				0
			},
			bluff_success_chance_w_skill = {
				1,
				1,
				1,
				1,
				0
			}
		}
		self.fall_damage_alert_size = 1000
	end


	function PlayerTweakData:_set_normal()
		self.damage.automatic_respawn_time = 120
		self.alarm_pager.call_duration = {
			{6, 6},
			{6, 6}
		}
		self.alarm_pager.bluff_success_chance = {1, 1, 1, 1, 0}
	end

	function PlayerTweakData:_set_hard()
		self.damage.automatic_respawn_time = 220
		self.damage.DOWNED_TIME_DEC = 7
		self.damage.DOWNED_TIME_MIN = 5
		self.damage.automatic_respawn_time = 120
		self.alarm_pager.call_duration = {
			{6, 6},
			{6, 6}
		}
		self.alarm_pager.bluff_success_chance = {1, 1, 1, 1, 0}
	end
end
if string.lower(RequiredScript) == "lib/tweak_data/interactiontweakdata" then
	local data = InteractionTweakData.init
	function InteractionTweakData:init(tweak_data)
		data(self, tweak_data)
		
		if Global.game_settings and Global.game_settings.level_id == "pbr2" then
		else
			self.money_wrap.no_contour = true
		end
		self.safe_loot_pickup.no_contour = true
		self.gold_pile.no_contour = true
		
		self.shaped_sharge.requires_upgrade = {
			category = "player",
			upgrade = "trip_mine_shaped_charge"
		}
		self.shaped_sharge.slot = 1
		self.shaped_sharge.blocked_hint = nil
		self.gage_assignment.timer = 0
		
		self.hostage_move.upgrade_timer_multiplier = {
			category = "player",
			upgrade = "hostage_move_speed_multiplier"
		}
		self.hostage_stay.upgrade_timer_multiplier = {
			category = "player",
			upgrade = "hostage_stay_speed_multiplier"
		}
		
		self.invisible_interaction_open.requires_mask_off_upgrade = {
			category = "player",
			upgrade = "mask_off_pickup"
		}
		self.take_keys.requires_mask_off_upgrade = {
			category = "player",
			upgrade = "mask_off_pickup"
		}
		self.gage_assignment.requires_mask_off_upgrade = {
			category = "player",
			upgrade = "mask_off_pickup"
		}
		self.pickup_hotel_room_keycard.requires_mask_off_upgrade = {
			category = "player",
			upgrade = "mask_off_pickup"
		}
		
		self.key.requires_mask_off_upgrade = {
			category = "player",
			upgrade = "mask_off_keycard_insert"
		}
		self.key_double.requires_mask_off_upgrade = {
			category = "player",
			upgrade = "mask_off_keycard_insert"
		}
		self.numpad_keycard.requires_mask_off_upgrade = {
			category = "player",
			upgrade = "mask_off_keycard_insert"
		}
		self.timelock_panel.requires_mask_off_upgrade = {
			category = "player",
			upgrade = "mask_off_keycard_insert"
		}
		self.hold_close_keycard.requires_mask_off_upgrade = {
			category = "player",
			upgrade = "mask_off_keycard_insert"
		}
		self.vit_keycard_use.requires_mask_off_upgrade = {
			category = "player",
			upgrade = "mask_off_keycard_insert"
		}
		self.use_hotel_room_key.requires_mask_off_upgrade = {
			category = "player",
			upgrade = "mask_off_keycard_insert"
		}
		self.use_hotel_room_key_no_access.requires_mask_off_upgrade = {
			category = "player",
			upgrade = "mask_off_keycard_insert"
		}
		
		self.hospital_phone.requires_mask_off_upgrade = {
			category = "player",
			upgrade = "mask_off_desktop_interaction"
		}
		self.bus_wall_phone.requires_mask_off_upgrade = {
			category = "player",
			upgrade = "mask_off_desktop_interaction"
		}
		self.big_computer_hackable.requires_mask_off_upgrade = {
			category = "player",
			upgrade = "mask_off_desktop_interaction"
		}
		self.big_computer_not_hackable.requires_mask_off_upgrade = {
			category = "player",
			upgrade = "mask_off_desktop_interaction"
		}
		self.big_computer_server.requires_mask_off_upgrade = {
			category = "player",
			upgrade = "mask_off_desktop_interaction"
		}
		self.hold_search_c4.requires_mask_off_upgrade = {
			category = "player",
			upgrade = "mask_off_desktop_interaction"
		}
		self.start_hacking.requires_mask_off_upgrade = {
			category = "player",
			upgrade = "mask_off_desktop_interaction"
		}
		self.postpone_update.requires_mask_off_upgrade = {
			category = "player",
			upgrade = "mask_off_desktop_interaction"
		}
		self.reboot_computer.requires_mask_off_upgrade = {
			category = "player",
			upgrade = "mask_off_desktop_interaction"
		}
		self.bypass_the_firewall.requires_mask_off_upgrade = {
			category = "player",
			upgrade = "mask_off_desktop_interaction"
		}
		self.uno_use_device.requires_mask_off_upgrade = {
			category = "player",
			upgrade = "mask_off_desktop_interaction"
		}
		self.uno_assemble_device.requires_mask_off_upgrade = {
			category = "player",
			upgrade = "mask_off_desktop_interaction"
		}
		self.vit_remove_painting.requires_mask_off_upgrade = {
			category = "player",
			upgrade = "mask_off_desktop_interaction"
		}
		self.hold_open_the_safe.requires_mask_off_upgrade = {
			category = "player",
			upgrade = "mask_off_desktop_interaction"
		}
		
		self.open_door_with_keys.requires_mask_off_upgrade = {
			category = "player",
			upgrade = "mask_off_pick_lock"
		}
		self.pick_lock_deposit_transport.requires_mask_off_upgrade = {
			category = "player",
			upgrade = "mask_off_pick_lock"
		}
		self.pick_lock_easy.requires_mask_off_upgrade = {
			category = "player",
			upgrade = "mask_off_pick_lock"
		}
		self.pick_lock_easy_no_skill.requires_mask_off_upgrade = {
			category = "player",
			upgrade = "mask_off_pick_lock"
		}
		self.pick_lock_hard.requires_mask_off_upgrade = {
			category = "player",
			upgrade = "mask_off_pick_lock"
		}
		self.pick_lock_hard_no_skill.requires_mask_off_upgrade = {
			category = "player",
			upgrade = "mask_off_pick_lock"
		}
		self.pick_lock_hard_no_skill_deactivated.requires_mask_off_upgrade = {
			category = "player",
			upgrade = "mask_off_pick_lock"
		}
		self.cas_security_door.requires_mask_off_upgrade = {
			category = "player",
			upgrade = "mask_off_pick_lock"
		}
		self.lockpick_locker.requires_mask_off_upgrade = {
			category = "player",
			upgrade = "mask_off_pick_lock"
		}
	end
end
if string.lower(RequiredScript) == "lib/tweak_data/equipmentstweakdata" then
	local data = EquipmentsTweakData.init
	function EquipmentsTweakData:init()
		data(self, tweak_data)
		self.trip_mine = {
			icon = "equipment_trip_mine",
			use_function_name = "use_trip_mine",
			quantity = {2},
			text_id = "debug_trip_mine",
			description_id = "des_trip_mine",
			dummy_unit = "units/payday2/equipment/gen_equipment_tripmine/gen_equipment_tripmine_dummy",
			deploy_time = 2,
			upgrade_deploy_time_multiplier = {
				category = "player",
				upgrade = "trip_mine_deploy_time_multiplier"
			},
			visual_object = "g_toolbag",
			upgrade_name = {
				"trip_mine"
			}
		}
	end
end
if string.lower(RequiredScript) == "lib/units/beings/player/playerdamage" then
	function PlayerDamage:damage_bullet(attack_data)
		self:_chk_can_take_dmg()

		local damage_info = {
			result = {
				variant = "bullet",
				type = "hurt"
			},
			attacker_unit = attack_data.attacker_unit
		}
		local pm = managers.player
		local dmg_mul = pm:damage_reduction_skill_multiplier("bullet")
		attack_data.damage = attack_data.damage * dmg_mul
		attack_data.damage = managers.mutators:modify_value("PlayerDamage:TakeDamageBullet", attack_data.damage)
		attack_data.damage = managers.modifiers:modify_value("PlayerDamage:TakeDamageBullet", attack_data.damage)

		if _G.IS_VR then
			local distance = mvector3.distance(self._unit:position(), attack_data.attacker_unit:position())

			if tweak_data.vr.long_range_damage_reduction_distance[1] < distance then
				local step = math.clamp(distance / tweak_data.vr.long_range_damage_reduction_distance[2], 0, 1)
				local mul = 1 - math.step(tweak_data.vr.long_range_damage_reduction[1], tweak_data.vr.long_range_damage_reduction[2], step)
				attack_data.damage = attack_data.damage * mul
			end
		end

		local damage_absorption = pm:damage_absorption()

		if damage_absorption > 0 then
			attack_data.damage = math.max(0, attack_data.damage - damage_absorption)
		end
			local dodge_roll = math.random()
		local dodge_value = tweak_data.player.damage.DODGE_INIT or 0
		local armor_dodge_chance = pm:body_armor_value("dodge")
		local skill_dodge_chance = pm:skill_dodge_chance(self._unit:movement():running(), self._unit:movement():crouching(), self._unit:movement():zipline_unit())
		dodge_value = dodge_value + armor_dodge_chance + skill_dodge_chance

		if self._temporary_dodge_t and TimerManager:game():time() < self._temporary_dodge_t then
			dodge_value = dodge_value + self._temporary_dodge
		end

		local smoke_dodge = 0

		for _, smoke_screen in ipairs(managers.player._smoke_screen_effects or {}) do
			if smoke_screen:is_in_smoke(self._unit) then
				smoke_dodge = tweak_data.projectiles.smoke_screen_grenade.dodge_chance

				break
			end
		end

		dodge_value = 1 - (1 - dodge_value) * (1 - smoke_dodge)

		if dodge_roll < dodge_value then
			if attack_data.damage > 0 then
				self:_send_damage_drama(attack_data, 0)
			end

			self:_call_listeners(damage_info)
			self:play_whizby(attack_data.col_ray.position)
			self:_hit_direction(attack_data.attacker_unit:position())

			self._next_allowed_dmg_t = Application:digest_value(pm:player_timer():time() + self._dmg_interval, true)
			self._last_received_dmg = attack_data.damage

			managers.player:send_message(Message.OnPlayerDodge)

			return
		end

		if self._god_mode then
			if attack_data.damage > 0 then
				self:_send_damage_drama(attack_data, attack_data.damage)
			end

			self:_call_listeners(damage_info)

			return
		elseif self._invulnerable or self._mission_damage_blockers.invulnerable then
			self:_call_listeners(damage_info)

			return
		elseif self:incapacitated() then
			return
		elseif self:is_friendly_fire(attack_data.attacker_unit) then
			return
		elseif self:_chk_dmg_too_soon(attack_data.damage) then
			return
		elseif self._unit:movement():current_state().immortal then
			return
		elseif self._revive_miss and math.random() < self._revive_miss then
			self:play_whizby(attack_data.col_ray.position)

			return
		end
		
		if attack_data.attacker_unit:base()._tweak_table == "tank" then
			managers.achievment:set_script_data("dodge_this_fail", true)
		end

		if self:get_real_armor() > 0 then
			self._unit:sound():play("player_hit")
		else
			self._unit:sound():play("player_hit_permadamage")
		end

		local shake_armor_multiplier = pm:body_armor_value("damage_shake") * pm:upgrade_value("player", "damage_shake_multiplier", 1)
		local gui_shake_number = tweak_data.gui.armor_damage_shake_base / shake_armor_multiplier
		gui_shake_number = gui_shake_number + pm:upgrade_value("player", "damage_shake_addend", 0)
		shake_armor_multiplier = tweak_data.gui.armor_damage_shake_base / gui_shake_number
		local shake_multiplier = math.clamp(attack_data.damage, 0.2, 2) * shake_armor_multiplier

		self._unit:camera():play_shaker("player_bullet_damage", 1 * shake_multiplier)

		if not _G.IS_VR then
			managers.rumble:play("damage_bullet")
		end

		self:_hit_direction(attack_data.attacker_unit:position())
		pm:check_damage_carry(attack_data)

		attack_data.damage = managers.player:modify_value("damage_taken", attack_data.damage, attack_data)

		if self._bleed_out then
			self:_bleed_out_damage(attack_data)

			return
		end

		if not attack_data.ignore_suppression and not self:is_suppressed() then
			return
		end

		self:_check_chico_heal(attack_data)

		local armor_reduction_multiplier = 0

		if self:get_real_armor() <= 0 then
			armor_reduction_multiplier = 1
		end

		local health_subtracted = self:_calc_armor_damage(attack_data)

		if attack_data.armor_piercing then
			attack_data.damage = attack_data.damage - health_subtracted
		else
			attack_data.damage = attack_data.damage * armor_reduction_multiplier
		end

		health_subtracted = health_subtracted + self:_calc_health_damage(attack_data)
		self._next_allowed_dmg_t = Application:digest_value(managers.player:player_timer():time() + self._dmg_interval, true)
		self._last_received_dmg = health_subtracted
			
			if not self._bleed_out and health_subtracted > 0 then
				self:_send_damage_drama(attack_data, health_subtracted)
			elseif self._bleed_out and attack_data.attacker_unit and attack_data.attacker_unit:alive() and attack_data.attacker_unit:base()._tweak_table == "tank" then
				self._kill_taunt_clbk_id = "kill_taunt" .. tostring(self._unit:key())
				managers.enemy:add_delayed_clbk(self._kill_taunt_clbk_id, callback(self, self, "clbk_kill_taunt", attack_data), TimerManager:game():time() + 0.1 + 0.1 + 0.1)	
			elseif self._bleed_out and attack_data.attacker_unit and attack_data.attacker_unit:alive() and attack_data.attacker_unit:base()._tweak_table == "taser" then
				self._kill_taunt_clbk_id = "kill_taunt" .. tostring(self._unit:key())
				managers.enemy:add_delayed_clbk(self._kill_taunt_clbk_id, callback(self, self, "clbk_kill_taunt_tase", attack_data), TimerManager:game():time() + 0.1 + 0.1 + 0.1)	
			elseif self._bleed_out and attack_data.attacker_unit and attack_data.attacker_unit:alive() then
				self._kill_taunt_clbk_id = "kill_taunt" .. tostring(self._unit:key())
				managers.enemy:add_delayed_clbk(self._kill_taunt_clbk_id, callback(self, self, "clbk_kill_taunt_common", attack_data), TimerManager:game():time() + 0.1 + 0.1 + 0.1)			
			end

		pm:send_message(Message.OnPlayerDamage, nil, attack_data)
		self:_call_listeners(damage_info)
	end

	function PlayerDamage:_hit_direction(position_vector)
		if position_vector then
			local dir = (self._unit:camera():position() - position_vector):normalized()
			local infront = math.dot(self._unit:camera():forward(), dir)
			if infront < -0.9 then
				managers.environment_controller:hit_feedback_front()
			elseif infront > 0.9 then
				managers.environment_controller:hit_feedback_back()
			else
				local polar = self._unit:camera():forward():to_polar_with_reference(-dir, Vector3(0, 0, 1))
				local direction = Vector3(polar.spin, polar.pitch, 0):normalized()
				if math.abs(direction.x) > math.abs(direction.y) then
					if 0 > direction.x then
						managers.environment_controller:hit_feedback_left()
					else
						managers.environment_controller:hit_feedback_right()
					end
				elseif 0 > direction.y then
					managers.environment_controller:hit_feedback_up()
				else
					managers.environment_controller:hit_feedback_down()
				end
				if position_vector then
					managers.hud:on_hit_direction(position_vector, HUDHitDirection.DAMAGE_TYPES.HEALTH)
				end
			end
		else
		end
	end
		
	function PlayerDamage:damage_tase(attack_data)
		if self._god_mode then
			return
		end
		   
		local cur_state = self._unit:movement():current_state_name()
		   
		if cur_state ~= "tased" and cur_state ~= "fatal" then
			self:on_tased(false)
		   
			self._tase_data = attack_data
		   
			managers.player:set_player_state("tased")
		   
			local damage_info = {
				result = {
					variant = "tase",
					type = "hurt"
				}
			}
		   
			self:_call_listeners(damage_info)
		   
			if attack_data.attacker_unit and attack_data.attacker_unit:alive() and attack_data.attacker_unit:base()._tweak_table == "taser" then
				attack_data.attacker_unit:sound():say("post_tasing_taunt")
		
				if managers.blackmarket:equipped_mask().mask_id == tweak_data.achievement.its_alive_its_alive.mask then
					managers.achievment:award_progress(tweak_data.achievement.its_alive_its_alive.stat)
				end
			end
		end
		if cur_state == "tased" then
			if attack_data.attacker_unit:base()._tweak_table == "taser" or attack_data.attacker_unit:base()._tweak_table == "taser_titan" then
			   attack_data.attacker_unit:sound():say("post_tasing_taunt")
			end
		end	
	   end
		
	function PlayerDamage:clbk_kill_taunt_tase(attack_data)
		if attack_data.attacker_unit and attack_data.attacker_unit:alive() then
			self._kill_taunt_clbk_id = nil

			attack_data.attacker_unit:sound():say("post_tasing_taunt")
		end
	end		

	function PlayerDamage:clbk_kill_taunt_common(attack_data)
		if attack_data.attacker_unit and attack_data.attacker_unit:alive() then
			if not attack_data.attacker_unit:base()._tweak_table then
				return
			end
			self._kill_taunt_clbk_id = nil

			attack_data.attacker_unit:sound():say("i03")
		end
	end	
end
if string.lower(RequiredScript) == "lib/managers/group_ai_states/groupaistatebase" then
	local _upd_criminal_suspicion_progress_original = GroupAIStateBase._upd_criminal_suspicion_progress
	function GroupAIStateBase:_upd_criminal_suspicion_progress(...)
		if self._ai_enabled and managers.groupai:state():whisper_mode() then
			for obs_key, obs_susp_data in pairs(self._suspicion_hud_data or {}) do
				local unit = obs_susp_data.u_observer
				
				if managers.enemy:is_civilian(unit) then
					local waypoint = managers.hud._hud.waypoints["susp1" .. tostring(obs_key)]
					
					if waypoint then
						if unit:anim_data().drop then
							if not obs_susp_data._subdued_civ then
								obs_susp_data._alerted_civ = nil
								obs_susp_data._subdued_civ = true
								if managers.player:has_category_upgrade("player", "civs_show_markers") then
									waypoint.bitmap:set_color(Color())
									waypoint.arrow:set_color(Color())
								else
									obs_susp_data.expire_t = self._t + 8
									waypoint.arrow:set_color(Color(0, 0.3, 0.5))
									waypoint.bitmap:set_image("guis/textures/pd2/hud_stealth_eye")
								end
							end
						elseif obs_susp_data.alerted then
							if not obs_susp_data._alerted_civ then
								obs_susp_data._subdued_civ = nil
								obs_susp_data._alerted_civ = true
								waypoint.bitmap:set_color(Color.white)
								waypoint.arrow:set_color(tweak_data.hud.detected_color:with_alpha(0.75))
							end
						end
					end
				end
			end
		end
		
		return _upd_criminal_suspicion_progress_original(self, ...)
	end
end
if string.lower(RequiredScript) == "lib/units/pickups/ammoclip" then
	local CABLE_TIE_GET_CHANCE = 0
	local CABLE_TIE_GET_AMOUNT = 0

	function AmmoClip:_pickup(unit)
		if self._picked_up then
			return
		end

		local player_manager = managers.player
		local inventory = unit:inventory()

		if not unit:character_damage():dead() and inventory then
			local picked_up = false

			if self._projectile_id then
				if managers.blackmarket:equipped_projectile() == self._projectile_id and not player_manager:got_max_grenades() then
					player_manager:add_grenade_amount(self._ammo_count or 1)

					picked_up = true
				end
			else
				local available_selections = {}

				for i, weapon in pairs(inventory:available_selections()) do
					if inventory:is_equipped(i) then
						table.insert(available_selections, 1, weapon)
					else
						table.insert(available_selections, weapon)
					end
				end

				local success, add_amount = nil

				for _, weapon in ipairs(available_selections) do
					if not self._weapon_category or self._weapon_category == weapon.unit:base():weapon_tweak_data().categories[1] then
						success, add_amount = weapon.unit:base():add_ammo(1, self._ammo_count)
						picked_up = success or picked_up

						if self._ammo_count then
							self._ammo_count = math.max(math.floor(self._ammo_count - add_amount), 0)
						end

						if picked_up and tweak_data.achievement.pickup_sticks and self._weapon_category == tweak_data.achievement.pickup_sticks.weapon_category then
							managers.achievment:award_progress(tweak_data.achievement.pickup_sticks.stat)
						end
					end
				end
			end

			if picked_up then
				self._picked_up = true
				local rand = math.random()

				if rand <= CABLE_TIE_GET_CHANCE and self._ammo_box then
					managers.player:add_cable_ties(CABLE_TIE_GET_AMOUNT)
				end

				if not self._projectile_id and not self._weapon_category then
					local restored_health = nil

					if not unit:character_damage():is_downed() and player_manager:has_category_upgrade("temporary", "loose_ammo_restore_health") and not player_manager:has_activate_temporary_upgrade("temporary", "loose_ammo_restore_health") then
						player_manager:activate_temporary_upgrade("temporary", "loose_ammo_restore_health")

						local values = player_manager:temporary_upgrade_value("temporary", "loose_ammo_restore_health", 0)

						if values ~= 0 then
							local restore_value = math.random(values[1], values[2])
							local num_more_hp = 1

							if player_manager:num_connected_players() > 0 then
								num_more_hp = player_manager:num_players_with_more_health()
							end

							local base = tweak_data.upgrades.loose_ammo_restore_health_values.base
							local sync_value = math.round(math.clamp(restore_value - base, 0, 13))
							restore_value = restore_value * (tweak_data.upgrades.loose_ammo_restore_health_values.multiplier or 0.1)
							local percent_inc = player_manager:upgrade_value("player", "gain_life_per_players", 0) * num_more_hp + 1

							print("[AmmoClip:_pickup] Percent increase for health pickup is: ", percent_inc - 1)

							restore_value = restore_value * percent_inc
							local damage_ext = unit:character_damage()

							if not damage_ext:need_revive() and not damage_ext:dead() and not damage_ext:is_berserker() then
								damage_ext:restore_health(restore_value, true)
								unit:sound():play("pickup_ammo_health_boost", nil, true)
							end

							if player_manager:has_category_upgrade("player", "loose_ammo_restore_health_give_team") then
								managers.network:session():send_to_peers_synched("sync_unit_event_id_16", self._unit, "pickup", 2 + sync_value)
							end
						end
					end

					if player_manager:has_category_upgrade("temporary", "loose_ammo_give_team") and not player_manager:has_activate_temporary_upgrade("temporary", "loose_ammo_give_team") then
						player_manager:activate_temporary_upgrade("temporary", "loose_ammo_give_team")
						managers.network:session():send_to_peers_synched("sync_unit_event_id_16", self._unit, "pickup", AmmoClip.EVENT_IDS.bonnie_share_ammo)
					end
				elseif self._projectile_id then
					player_manager:register_grenade(managers.network:session():local_peer():id())
					managers.network:session():send_to_peers_synched("sync_unit_event_id_16", self._unit, "pickup", AmmoClip.EVENT_IDS.register_grenade)
				end

				if Network:is_client() then
					managers.network:session():send_to_host("sync_pickup", self._unit)
				end

				unit:sound():play(self._pickup_event or "pickup_ammo", nil, true)
				self:consume()

				if self._ammo_box then
					player_manager:send_message(Message.OnAmmoPickup, nil, unit)
				end

				return true
			end
		end

		return false
	end
end
if string.lower(RequiredScript) == "lib/managers/playermanager" then
	Hooks:PreHook(PlayerManager, "transfer_from_custody_special_equipment_to", "PlayerManager_transfer_from_custody_special_equipment_to", function(self)
		if managers.job:is_current_job_professional() then
			return
		end
	end)
	function PlayerManager:critical_hit_chance()
		local multiplier = 0
		local weapon_unit = self:equipped_weapon_unit()

		if weapon_unit then
			local weapon = weapon_unit:base()

			if weapon and weapon:fire_mode() == "single" and weapon:is_category("smg", "assault_rifle", "snp") then
				multiplier = multiplier + self:upgrade_value("player", "critical_hit_chance", 0)
			end
		end
		multiplier = multiplier + self:upgrade_value("weapon", "critical_hit_chance", 0)
		multiplier = multiplier + self:team_upgrade_value("critical_hit", "chance", 0)
		multiplier = multiplier + self:get_hostage_bonus_multiplier("critical_hit") - 1
		multiplier = multiplier + managers.player:temporary_upgrade_value("temporary", "unseen_strike", 1) - 1
		multiplier = multiplier + self._crit_mul - 1
		local detection_risk_add_crit_chance = managers.player:upgrade_value("player", "detection_risk_add_crit_chance")
		multiplier = multiplier + self:get_value_from_risk_upgrade(detection_risk_add_crit_chance)

		return multiplier
	end
end
if string.lower(RequiredScript) == "lib/managers/menu/skilltreeguinew" then
	local function make_fine_text(text_gui)
		local x, y, w, h = text_gui:text_rect()

		text_gui:set_size(w, h)
		text_gui:set_position(math.round(text_gui:x()), math.round(text_gui:y()))
	end
	local function fit_text_height(text_gui)
		local _, y, _, h = text_gui:text_rect()

		text_gui:set_h(h)
		text_gui:set_y(math.round(text_gui:y()))
	end
	local massive_font = tweak_data.menu.pd2_massive_font
	local large_font = tweak_data.menu.pd2_large_font
	local medium_font = tweak_data.menu.pd2_medium_font
	local small_font = tweak_data.menu.pd2_small_font
	local massive_font_size = tweak_data.menu.pd2_massive_font_size
	local large_font_size = tweak_data.menu.pd2_large_font_size
	local medium_font_size = tweak_data.menu.pd2_medium_font_size
	local small_font_size = tweak_data.menu.pd2_small_font_size
	local IS_WIN_32 = SystemInfo:platform() == Idstring("WIN32")
	local NOT_WIN_32 = not IS_WIN_32
	local TOP_ADJUSTMENT = NOT_WIN_32 and 45 or 45
	local BOT_ADJUSTMENT = NOT_WIN_32 and 45 or 45
	local BIG_PADDING = 13.5
	local PADDING = 10
	local PAGE_TREE_OVERLAP = 2
	local SKILLS_WIDTH_PERCENT = 0.7
	local PAGE_TAB_H = medium_font_size + 10

	function NewSkillTreeGui:_setup()
		if alive(self._panel) then
			self._ws:panel():remove(self._panel)
		end

		self._panel = self._ws:panel():panel({
			name = "SkillTreePanel",
			layer = self._init_layer
		})
		self._fullscreen_panel = self._fullscreen_ws:panel():panel()

		WalletGuiObject.set_wallet(self._panel)

		local skilltree_text = self._panel:text({
			vertical = "top",
			name = "TitleText",
			align = "left",
			text = managers.localization:to_upper_text("menu_st_skilltree"),
			font = large_font,
			font_size = large_font_size,
			color = tweak_data.screen_colors.text
		})
		local x, y, w, h = skilltree_text:text_rect()

		skilltree_text:set_size(w, h)

		local title_bg_text = self._fullscreen_panel:text({
			name = "TitleTextBg",
			vertical = "top",
			h = 90,
			alpha = 0.4,
			align = "left",
			blend_mode = "add",
			layer = 1,
			text = skilltree_text:text(),
			font = massive_font,
			font_size = massive_font_size,
			color = tweak_data.screen_colors.button_stage_3
		})
		local x, y = managers.gui_data:safe_to_full_16_9(skilltree_text:world_x(), skilltree_text:world_center_y())

		title_bg_text:set_world_left(x)
		title_bg_text:set_world_center_y(y)
		title_bg_text:move(-13, 9)
		MenuBackdropGUI.animate_bg_text(self, title_bg_text)

		if managers.menu:is_pc_controller() then
			local back_button = self._panel:text({
				name = "BackButton",
				blend_mode = "add",
				text = managers.localization:to_upper_text("menu_back"),
				font = large_font,
				font_size = large_font_size,
				color = tweak_data.screen_colors.button_stage_3
			})

			make_fine_text(back_button)
			back_button:set_right(self._panel:w())
			back_button:set_bottom(self._panel:h())

			local back_bg_text = self._fullscreen_panel:text({
				name = "TitleTextBg",
				vertical = "top",
				h = 90,
				alpha = 0.4,
				align = "right",
				blend_mode = "add",
				layer = 1,
				text = back_button:text(),
				font = massive_font,
				font_size = massive_font_size,
				color = tweak_data.screen_colors.button_stage_3
			})
			local x, y = managers.gui_data:safe_to_full_16_9(back_button:world_right(), back_button:world_center_y())

			back_bg_text:set_world_right(x)
			back_bg_text:set_world_center_y(y)
			back_bg_text:move(13, 0)
			MenuBackdropGUI.animate_bg_text(self, back_bg_text)
		end

		local skills_panel = self._panel:panel({
			name = "SkillsRootPanel",
			layer = 1,
			w = self._panel:w() * SKILLS_WIDTH_PERCENT,
			h = self._panel:h() - 63
		})

		skills_panel:set_top(TOP_ADJUSTMENT + 16)
		skills_panel:set_left(0)

		local tab_panel = skills_panel:panel({
			name = "TabPanel",
			h = PAGE_TAB_H
		})

		tab_panel:set_top(0)
		tab_panel:set_left(0)

		local page_panel = skills_panel:panel({
			name = "PagePanel",
			h = skills_panel:h() - PAGE_TAB_H + PAGE_TREE_OVERLAP
		})

		page_panel:set_top(tab_panel:bottom() - PAGE_TREE_OVERLAP)
		page_panel:set_left(0)
		page_panel:set_w(773)
		page_panel:set_h(550)
		
		local tree_title_panel = page_panel:panel({
			name = "TreeTitlePanel",
			h = large_font_size
		})

		tree_title_panel:set_bottom(page_panel:h())
		tree_title_panel:set_left(0)
		tree_title_panel:set_w(2207)

		local tree_panel = page_panel:panel({
			name = "TreePanel",
			h = tree_title_panel:top()
		})

		tree_panel:set_top(0)
		tree_panel:set_left(0)

		local info_panel = self._panel:panel({
			name = "InfoRootPanel",
			layer = 1,
			w = self._panel:w() * (1.131 - SKILLS_WIDTH_PERCENT) - BIG_PADDING,
			h = tree_panel:h()
		})

		info_panel:set_world_top(tree_panel:world_y())
		info_panel:set_left(page_panel:w())

		local skillset_panel = page_panel:panel({
			name = "SkillSetPanel"
		})
		skillset_panel:set_left(page_panel:left())
		skillset_panel:set_bottom(page_panel:bottom() * 1.7 + 5)
		skillset_panel:set_w(140)
		local skillset_text = skillset_panel:text({
			name = "SkillSetText",
			blend_mode = "add",
			layer = 1,
			text = managers.localization:text("menu_st_skill_switch_set", {
				skill_switch = managers.skilltree:get_skill_switch_name(managers.skilltree:get_selected_skill_switch(), true)
			}),
			font = medium_font,
			font_size = medium_font_size,
			color = tweak_data.screen_colors.button_stage_3
		})

		make_fine_text(skillset_text)
		skillset_panel:set_h(skillset_text:bottom())
		
		local skillset_reset_text = page_panel:text({
			name = "SkillSetResetText",
			text = managers.localization:to_upper_text("menu_st_switch_skillset", {
						BTN_SKILLSET = managers.localization:btn_macro("menu_switch_skillset")
					}),
			font = medium_font,
			font_size = medium_font_size,
			blend_mode = "add",
			layer = 1,
			color = tweak_data.screen_colors.text
		})
		skillset_reset_text:set_left(page_panel:left())
		skillset_reset_text:set_bottom(page_panel:bottom() * 1.75)
		
		self._skillset_panel = skillset_panel
		local skillpoints_panel = self._panel:panel({
			name = "SkillPointsPanel"
		})
		skillpoints_panel:set_right(self._panel:right() * 1.4 + 10)
		skillpoints_panel:set_bottom(self._panel:bottom() * 1.8 - 2)
		local skillpoints_title_text = skillpoints_panel:text({
			name = "SkillPointsTitleText",
			blend_mode = "add",
			layer = 1,
			text = managers.localization:to_upper_text("menu_skillpoints"),
			font = medium_font,
			font_size = medium_font_size,
			color = tweak_data.screen_colors.text
		})
		local skillpoints_points_text = skillpoints_panel:text({
			name = "SkillPointsPointsText",
			blend_mode = "add",
			layer = 1,
			text = tostring(self._skilltree:points()),
			font = medium_font,
			font_size = medium_font_size,
			color = tweak_data.screen_colors.text
		})

		make_fine_text(skillpoints_title_text)
		make_fine_text(skillpoints_points_text)
		skillpoints_points_text:set_left(skillpoints_panel:left() / 2.01)
		skillpoints_panel:set_h(skillpoints_title_text:bottom())

		self._skill_points_title_text = skillpoints_title_text
		self._skill_points_text = skillpoints_points_text
		local color = self._skilltree:points() > 0 and tweak_data.screen_colors.text or tweak_data.screen_colors.important_1

		self._skill_points_title_text:set_color(color)
		self._skill_points_text:set_color(color)

		local description_panel = info_panel:panel({
			name = "DescriptionPanel",
			h = 434,
			w = 425
		})
		local description_title_text = description_panel:text({
			name = "DescriptionTitleText",
			text = "",
			font = medium_font,
			font_size = medium_font_size,
			blend_mode = "add",
			wrap = true,
			word_wrap = true
		})
		local description_text = description_panel:text({
			text = "",
			name = "DescriptionText",
			wrap = true,
			blend_mode = "add",
			word_wrap = true,
			font = small_font,
			font_size = small_font_size
		})

		description_title_text:grow(1, 1)
		description_title_text:move(PADDING, PADDING)
		description_text:grow(1, 1)
		description_text:move(PADDING, 16)

		self._tab_items = {}
		self._tree_items = {}
		self._active_page = 0
		self._active_tree_item = nil
		self._active_tier_item = nil
		self._selected_item = nil
		local pages = managers.skilltree:get_pages()
		local page_data = nil
		local tab_x = 0
		local page_tree_title_panel, page_tree_panel = nil

		for index, page in ipairs(tweak_data.skilltree.skill_pages_order) do
			page_data = pages[page]

			if page_data and tweak_data.skilltree.skilltree[page] then
				page_tree_title_panel = tree_title_panel:panel()
				page_tree_panel = tree_panel:panel()
				local tree = NewSkillTreePage:new(page, page_data, page_tree_title_panel, page_tree_panel, self._fullscreen_panel, self)

				table.insert(self._tree_items, tree)

				local tab_item = NewSkillTreeTabItem:new(tab_panel, page, tab_x, index, self, tree)
				tab_x = tab_item:next_page_position()

				table.insert(self._tab_items, tab_item)
			end
		end

		self._selected_page = self._tree_items[1]
		self._legend_buttons = {}
		local legends_panel = self._panel:panel({
			name = "LegendsPanel",
			w = self._panel:w() * 0.75,
			h = tweak_data.menu.pd2_medium_font_size
		})

		legends_panel:set_righttop(self._panel:w(), 0)
		legends_panel:text({
			text = "",
			name = "LegendText",
			align = "right",
			blend_mode = "add",
			vertical = "top",
			font = small_font,
			font_size = small_font_size,
			color = tweak_data.screen_colors.text
		})

		local legend_panel_reset_skills = self._panel:panel({
			name = "LegendPanelResetSkills",
			w = self._panel:w() * 0.75,
			h = tweak_data.menu.pd2_medium_font_size
		})

		legend_panel_reset_skills:set_righttop(self._panel:w() - 2, tweak_data.menu.pd2_medium_font_size)
		legend_panel_reset_skills:text({
			text = "RESET SKILLS",
			name = "LegendTextResetSkills",
			align = "right",
			blend_mode = "add",
			vertical = "top",
			font = small_font,
			font_size = small_font_size,
			color = tweak_data.screen_colors.text
		})
		local border_panel = tree_panel:panel({
			name = "BorderPanel"
		})
		border_panel:set_size(719, 434)
		BoxGuiObject:new(border_panel, {
			sides = {
				1,
				1,
				2,
				1
			}
		})
		BoxGuiObject:new(description_panel, {
			sides = {
				1,
				1,
				1,
				1
			}
		})

		local black_rect = self._fullscreen_panel:rect({
			layer = 1,
			color = Color(0.4, 0, 0, 0)
		})
		local blur = self._fullscreen_panel:bitmap({
			texture = "guis/textures/test_blur_df",
			render_template = "VertexColorTexturedBlur3D",
			layer = -1,
			w = self._fullscreen_ws:panel():w(),
			h = self._fullscreen_ws:panel():h()
		})

		local function func(o)
			over(0.6, function (p)
				o:set_alpha(p)
			end)
		end

		blur:animate(func)
		self:set_active_page(1)
		self:_rec_round_object(self._panel)
	end
	function NewSkillTreeGui:_update_description(item)
		local desc_panel = self._panel:child("InfoRootPanel"):child("DescriptionPanel")
		local text_title = desc_panel:child("DescriptionTitleText")
		local text = desc_panel:child("DescriptionText")
		local tier = item:tier()
		local skill_id = item:skill_id()
		local tweak_data_skill = tweak_data.skilltree.skills[skill_id]
		local skill_stat_color = tweak_data.screen_colors.resource
		local color_replace_table = {}
		local points = self._skilltree:points() or 0
		local basic_cost = self._skilltree:get_skill_points(skill_id, 1) or 0
		local pro_cost = self._skilltree:get_skill_points(skill_id, 2) or 0
		local talent = tweak_data.skilltree.skills[skill_id]
		local unlocked = self._skilltree:skill_unlocked(nil, skill_id)
		local step = self._skilltree:next_skill_step(skill_id)
		local completed = self._skilltree:skill_completed(skill_id)
		local skill_descs = tweak_data.upgrades.skill_descs[skill_id] or {
			0,
			0
		}
		local spending_money = managers.money:total()
		local basic_color_index = 1
		local pro_color_index = 2 + (skill_descs[1] or 0)

		if step > 1 then
			basic_cost = utf8.to_upper(managers.localization:text("st_menu_skill_owned"))
			color_replace_table[basic_color_index] = tweak_data.screen_colors.resource
		else
			local money_cost = managers.money:get_skillpoint_cost(self._selected_item._tree, self._selected_item._tier, basic_cost)
			local can_afford = points >= basic_cost and spending_money >= money_cost
			color_replace_table[basic_color_index] = can_afford and tweak_data.screen_colors.resource or tweak_data.screen_colors.important_1
			basic_cost = managers.localization:text(basic_cost == 1 and "st_menu_point" or "st_menu_point_plural", {points = basic_cost}) .. " / " .. managers.experience:cash_string(money_cost)
		end
		if step > 2 then
			pro_cost = utf8.to_upper(managers.localization:text("st_menu_skill_owned"))
			color_replace_table[pro_color_index] = tweak_data.screen_colors.resource
		else
			local money_cost = managers.money:get_skillpoint_cost(self._selected_item._tree, self._selected_item._tier, pro_cost)
			local can_afford = points >= pro_cost and spending_money >= money_cost
			color_replace_table[pro_color_index] = can_afford and tweak_data.screen_colors.resource or tweak_data.screen_colors.important_1
			pro_cost = managers.localization:text(pro_cost == 1 and "st_menu_point" or "st_menu_point_plural", {points = pro_cost}) .. " / " .. managers.experience:cash_string(money_cost)
		end

		local macroes = {
			basic = basic_cost,
			pro = pro_cost
		}

		for i, d in pairs(skill_descs) do
			macroes[i] = d
		end

		local skill_btns = tweak_data.upgrades.skill_btns[skill_id]

		if skill_btns then
			for i, d in pairs(skill_btns) do
				macroes[i] = d()
			end
		end
		if tweak_data.skilltree.HIDE_TIER_BONUS then
			local skilltree = tweak_data.skilltree.trees[self._active_tree] and tweak_data.skilltree.trees[self._active_tree].skill or "NIL"
			local tier_descs = tweak_data.upgrades.skill_descs[tostring(skilltree) .. "_tier" .. tostring(self._selected_item._tier)]
			if tier == 1 then
				tier_bonus_text = "\n\n"
			elseif unlocked and step > 1 then
				tier_bonus_text = "\n\n" .. utf8.to_upper(managers.localization:text(unlocked and "menu_owned" or "st_menu_tier_locked")) .. "\n" .. managers.localization:text(tweak_data.skilltree.skills[tweak_data.skilltree.trees[self._selected_item._tree].skill][self._selected_item._tier].desc_id, tier_descs)
			else
				tier_bonus_text = "\n\n" .. utf8.to_upper(managers.localization:text(unlocked and "st_menu_tier_unlocked" or "st_menu_tier_locked")) .. "\n" .. managers.localization:text(tweak_data.skilltree.skills[tweak_data.skilltree.trees[self._selected_item._tree].skill][self._selected_item._tier].desc_id, tier_descs)
			end
			end
		local basic_cost = managers.skilltree:skill_cost(tier, 1)
		local aced_cost = managers.skilltree:skill_cost(tier, 2)
		local skill_string = managers.localization:to_upper_text(tweak_data_skill.name_id)
		local cost_string = managers.localization:to_upper_text(basic_cost == 1 and "st_menu_skill_cost_singular" or "st_menu_skill_cost", {
			basic = basic_cost,
			aced = aced_cost
		})
		local desc_string = managers.localization:text(tweak_data.skilltree.skills[skill_id].desc_id, macroes)
		local full_string = "\n\n" .. desc_string .. tier_bonus_text

		if (_G.IS_VR or managers.user:get_setting("show_vr_descs")) and tweak_data.vr.skill_descs_addons[skill_id] then
			local addon_data = tweak_data.vr.skill_descs_addons[skill_id]
			local vr_addon = managers.localization:text(addon_data.text_id, addon_data.macros)
			full_string = full_string .. "\n\n" .. managers.localization:text("menu_vr_skill_addon") .. "\n" .. vr_addon
		end

		text_title:set_text(skill_string)
		text:set_text(full_string)
		text:set_size(400, 400)
		managers.menu_component:make_color_text(text)
		text:set_font_size(small_font_size)

		local _, _, _, h = text:text_rect()

		while h > desc_panel:h() - text:top() do
			text:set_font_size(text:font_size() * 0.98)

			_, _, _, h = text:text_rect()
		end
	end

	function NewSkillTreeSkillItem:init(skill_id, skill_data, skill_panel, tree_panel, tree, tier, tier_item, fullscreen_panel, gui)
		NewSkillTreeSkillItem.super.init(self)
		self._gui = gui
		self._skilltree = managers.skilltree
		self._fullscreen_panel = fullscreen_panel
		self._tree = tree
		self._tier = tier
		self._tier_item = tier_item
		self._skill_panel = skill_panel
		self._tree_panel = tree_panel
		self._skill_id = skill_id
		self._selected = false
		self._can_refund = false
		self._event_listener = gui:event_listener()
		
		self._event_listener:add(skill_id, {
			"refresh"
		}, callback(self, self, "_on_refresh_event"))
		self._box = BoxGuiObject:new(skill_panel, {
			sides = {
				2,
				2,
				2,
				2
			}
		})
		self._box:hide()
		
		local skill_text = skill_panel:text({
			name = "SkillName",
			blend_mode = "add",
			rotation = 360,
			layer = 2,
			text = "",
			font = small_font,
			font_size = small_font_size,
			color = tweak_data.screen_colors.text
		})
		local owned_text = skill_panel:text({
			name = "OwnedName",
			text = managers.localization:to_upper_text("st_menu_skill_owned"),
			font = small_font,
			font_size = small_font_size,
			layer = 2,
			color = tweak_data.screen_colors.text,
			blend_mode = "add",
			rotation = 360,
			visible = false
		})
		local aced_text = skill_panel:text({
			name = "AcedName",
			text = managers.localization:to_upper_text("st_menu_skill_maxed"),
			font = small_font,
			font_size = small_font_size,
			layer = 2,
			color = tweak_data.screen_colors.text,
			blend_mode = "add",
			rotation = 360,
			visible = false
		})
		make_fine_text(skill_text)
		make_fine_text(owned_text)
		make_fine_text(aced_text)

		local icon_panel_size = skill_panel:h() - skill_text:h() - PADDING * 2
		local skill_icon_panel = skill_panel:panel({
			name = "SkillIconPanel",
			w = icon_panel_size,
			h = icon_panel_size
		})
		if tier == 1 then
			skill_panel:set_left(skill_panel:w() / 3)
		end

		skill_icon_panel:set_left()
		skill_icon_panel:set_top(PADDING - 4)
		skill_icon_panel:set_size(240, 72)
		skill_panel:set_size(240, 72)
		local texture_rect_x = skill_data.icon_xy and skill_data.icon_xy[1] or 0
		local texture_rect_y = skill_data.icon_xy and skill_data.icon_xy[2] or 0
		self._icon = skill_icon_panel:bitmap({
			texture = "guis/textures/pd2/skilltree/op_icons_atlas",
			name = "Icon",
			blend_mode = "normal",
			layer = 1,
			texture_rect = {
				texture_rect_x * 64,
				texture_rect_y * 64,
				64,
				64
			},
			rotation = 360,
			color = tweak_data.screen_colors.item_stage_3,
			blend_mode = "add",
			layer = 1
		})
		local locked = skill_icon_panel:bitmap({
			texture = "guis/textures/pd2/skilltree/padlock",
			name = "Locked",
			blend_mode = "normal",
			layer = 2,
			alpha = 0,
			color = tweak_data.screen_colors.text,
		})

		locked:set_center(skill_icon_panel:w() / 2, skill_icon_panel:h() / 2)

		local maxed_indicator = skill_icon_panel:bitmap({
			name = "MaxedIndicator",
			texture = "guis/textures/pd2/skilltree/ace",
			rotation = 360,
			blend_mode = "add"
		})

		maxed_indicator:set_center(self._icon:center_y() + 5, self._icon:center_x())

		self._current_size = self._unselected_size
		self._icon:set_left(4)
		self._icon:set_top(-2)
		skill_text:set_left(self._icon:right() + 4)
		skill_text:set_top(self._icon:center_x() - 9)
		owned_text:set_left(self._icon:right() + 4)
		owned_text:set_top(self._icon:center_x() - 9)
		aced_text:set_left(self._icon:right() + 4)
		aced_text:set_top(self._icon:center_x() - 9)
		self._connection = self._connection or {}

	 self._tier_points_0 = tree_panel:text({
			name = "TierPointsZeros",
			align = "right",
			vertical = "top",
			font = small_font,
			font_size = small_font_size,
			color = tweak_data.screen_colors.item_stage_2,
			alpha = 0.4,
			rotation = 360,
			blend_mode = "add",
			layer = 1
		})
		self._tier_points = tree_panel:text({
			name = "TierPoints",
			align = "right",
			vertical = "top",
			font = small_font,
			font_size = small_font_size,
			color = tweak_data.screen_colors.item_stage_2,
			alpha = 0.6,
			rotation = 360,
			blend_mode = "add",
			layer = 1
		})
		local tier_points = managers.skilltree:tier_cost(tree, tier)
		self._tier_points_0:set_text(tier_points < 1 and "00" or tier_points < 10 and "0" or tier_points < 100 and " " or "")
		self._tier_points:set_text(tier_points > 0 and tier_points or "")
		local _, _, zero_w, zero_h = self._tier_points_0:text_rect()
		self._tier_points_0:set_size(zero_w, zero_h)
		self._tier_points:set_right(tree_panel:right() + 49)
		self._tier_points_0:set_right(tree_panel:right() + 42)
		if tier == 2 then
			self._tier_points:set_y(55 + 72 * 5)
			self._tier_points_0:set_y(55 + 72 * 5)
		elseif tier == 3 then
			self._tier_points:set_y(55 + 72 * 4)
			self._tier_points_0:set_y(55 + 72 * 4)
		elseif tier == 4 then
			self._tier_points:set_y(54 + 72 * 3)
			self._tier_points_0:set_y(54 + 72 * 3)
		elseif tier == 5 then
			self._tier_points:set_y(54 + 72 * 2)
			self._tier_points_0:set_y(54 + 72 * 2)
		elseif tier == 6 then
			self._tier_points:set_y(53 + 72)
			self._tier_points_0:set_y(53 + 72)
		elseif tier == 7 then
			self._tier_points:set_y(53)
			self._tier_points_0:set_y(53)
		elseif tier == 1 then
			self._tier_points:set_visible(false)
			self._tier_points_0:set_visible(false)
		end
		self._tier_points_needed_tier = tree_panel:text({
			name = "TierPointsNeededTier",
			align = "left",
			vertical = "top",
			font = small_font,
			font_size = small_font_size,
			color = tweak_data.screen_colors.item_stage_2,
			alpha = 0.6,
			blend_mode = "add",
			rotation = 360,
			layer = 1
		})
		self._tier_points_needed_tier:set_text(managers.localization:to_upper_text("menu_tier", {tier = tier - 1}))
		local _, _, tw, th = self._tier_points_needed_tier:text_rect()
		self._tier_points_needed_tier:set_size(tw, th)
		self._tier_points_needed_tier:set_right(tree_panel:right() + 14)
		if tier == 2 then
			self._tier_points_needed_tier:set_y(55 + 72 * 5)
		elseif tier == 3 then
			self._tier_points_needed_tier:set_y(55 + 72 * 4)
		elseif tier == 4 then
			self._tier_points_needed_tier:set_y(54 + 72 * 3)
		elseif tier == 5 then
			self._tier_points_needed_tier:set_y(54 + 72 * 2)
		elseif tier == 6 then
			self._tier_points_needed_tier:set_y(53 + 72)
		elseif tier == 7 then
			self._tier_points_needed_tier:set_y(53)
		elseif tier == 1 then
			self._tier_points_needed_tier:set_visible(false)
		end
		local add_infamy_glow = false
			if 0 < managers.experience:current_rank() then
				local tree_name = tweak_data.skilltree.trees[tree].skill
				for infamy, item in pairs(tweak_data.infamy.items) do
					if managers.infamy:owned(infamy) then
						local skilltree = item.upgrades and item.upgrades.skilltree
						if skilltree then
							local tree = skilltree.tree
							local trees = skilltree.trees
							if tree and tree == tree_name or trees and table.contains(trees, tree_name) then
								add_infamy_glow = true
							end
						end
					else
					end
				end
			end
			if add_infamy_glow then
				local glow = tree_panel:bitmap({
					name = "cost_glow",
					w = 56,
					h = 56,
					texture = "guis/textures/pd2/crimenet_marker_glow",
					blend_mode = "add",
					color = tweak_data.screen_colors.button_stage_3,
					rotation = 360,
					y = 1
				})
				local anim_pulse_glow = function(o)
					local t = 0
					local dt = 0
					while true do
						dt = coroutine.yield()
						t = (t + dt * 0.5) % 1
						o:set_alpha((math.sin(t * 180) * 0.5 + 0.5) * 0.18)
						
					end
				end
				if tier == 1 then
					glow:set_visible(false)
				end
				glow:set_center(self._tier_points_needed_tier:center())
				glow:set_center_x(self._tier_points_needed_tier:center() + 32)
				glow:animate(anim_pulse_glow)
			end
		self:refresh()
	end
	function NewSkillTreeSkillItem:refresh()
		if not alive(self._skill_panel) then
			return
		end

		local skill_id = self._skill_id
		local selected = self._selected
		local step = self._skilltree:next_skill_step(skill_id)
		local unlocked = managers.skilltree:skill_unlocked(self._tree, skill_id)
		local unlocked_tier = managers.skilltree:tier_unlocked(self._tree, self._tier)
		local completed = self._skilltree:skill_completed(skill_id)
		local skill_data = tweak_data.skilltree.skills[skill_id]
		local skill_panel = self._skill_panel
		local skill_icon_panel = self._skill_panel:child("SkillIconPanel")
		local skill_text = self._skill_panel:child("SkillName")
		local owned_text = self._skill_panel:child("OwnedName")
		local aced_text = self._skill_panel:child("AcedName")
		local icon = skill_icon_panel:child("Icon")
		local locked = skill_icon_panel:child("Locked")
		local maxed_indicator = skill_icon_panel:child("MaxedIndicator")
		if step > 2 and selected or step > 1 and selected then
			owned_text:set_visible(false)
			aced_text:set_visible(false)
		elseif step > 2 then
			owned_text:set_visible(false)
			aced_text:set_visible(true)
		elseif step > 1 then
			owned_text:set_visible(true)
			aced_text:set_visible(false)
		else
			owned_text:set_visible(false)
			aced_text:set_visible(false)
		end
		if selected then
			if not self._tier then
				if step == 1 then
					skill_text:set_text(managers.localization:text("st_menu_unlock_profession", {
						profession = managers.localization:to_upper_text(tweak_data.skilltree.trees[self._tree].name_id),
						points = managers.skilltree:get_skill_points(self._skill_id, 1)
					}))
				else
					skill_text:set_text(managers.localization:text("st_menu_profession_unlocked", {
						profession = managers.localization:to_upper_text(tweak_data.skilltree.trees[self._tree].name_id)
					}))
				end
			elseif completed then
				skill_text:set_text(managers.localization:to_upper_text(""))
				aced_text:set_visible(true)
			elseif step == 2 then
				local points = managers.skilltree:get_skill_points(self._skill_id, 2)
				local cost = managers.money:get_skillpoint_cost(self._tree, self._tier, points)
				skill_text:set_text(managers.localization:to_upper_text("st_menu_buy_skill_pro" .. (points > 1 and "_plural" or ""), {
					cost = managers.experience:cash_string(cost),
					points = points
				}))
				skill_text:set_center_y(skill_panel:center_y() - 20)
			elseif not unlocked then
				skill_text:set_text(managers.localization:to_upper_text("st_menu_skill_locked"))
				skill_text:set_center_y(skill_panel:center_y() - 9)
			elseif step == 1 then
				local points = managers.skilltree:get_skill_points(self._skill_id, 1)
				local cost = managers.money:get_skillpoint_cost(self._tree, self._tier, points)
				skill_text:set_text(managers.localization:to_upper_text("st_menu_buy_skill_basic" .. (points > 1 and "_plural" or ""), {
					cost = managers.experience:cash_string(cost),
					points = points
				}))
				skill_text:set_center_y(skill_panel:center_y() - 20)
			else
				skill_text:set_text("MISSING")
			end
		elseif self._tier then
			if completed then
				skill_text_string = managers.localization:text("st_menu_skill_maxed")
			elseif step == 2 then
				skill_text_string = managers.localization:text("st_menu_skill_owned")
			end
		end
		if not unlocked then
			icon:set_color(tweak_data.screen_colors.item_stage_3)
			icon:set_alpha(0.6)
		elseif step == 1 or step == 0 then
			icon:set_color(tweak_data.screen_colors.item_stage_2)
			icon:set_alpha(1)
		else
			icon:set_color(tweak_data.screen_colors.text)
			icon:set_alpha(1)
		end
		if self._tier == 1 then
			maxed_indicator:set_visible(false)
		else
			maxed_indicator:set_visible(completed)
		end
		if self._tier == 1 then
			aced_text:set_text(managers.localization:to_upper_text("st_menu_skill_owned"))
		end
		if unlocked_tier then
			self._tier_points_needed_tier:set_color(tweak_data.screen_colors.text)
			self._tier_points_0:set_color(tweak_data.screen_colors.text)
			self._tier_points:set_color(tweak_data.screen_colors.text)
		else
			self._tier_points_needed_tier:set_color(tweak_data.screen_colors.item_stage_2)
			self._tier_points_0:set_color(tweak_data.screen_colors.item_stage_2)
			self._tier_points:set_color(tweak_data.screen_colors.item_stage_2)
		end
		skill_text:set_visible(self._selected)
		self._box:set_visible(self._selected)
		locked:set_visible(not unlocked)
		self:_update_can_refund()
	end

	function NewSkillTreeTreeItem:init(tree, tree_data, tree_panel, fullscreen_panel, gui, page)
		NewSkillTreeTreeItem.super.init(self)

		self._gui = gui
		self._selected = false
		self._tiers = {}
		self._tree_panel = tree_panel
		self._tree = tree
		self._page = page
		self._event_listener = gui:event_listener()

		self._event_listener:add(tree_data, {
			"refresh"
		}, callback(self, self, "_on_refresh_event"))

		local num_tiers = #tree_data.tiers
		local tier_height = tree_panel:h() / num_tiers
		local tier_panel, tier_item = nil

		for tier, tier_data in ipairs(tree_data.tiers) do
			tier_panel = tree_panel:panel({
				name = "Tier" .. tostring(tier),
				h = tier_height,
				y = (num_tiers - tier) * tier_height
			})
			tier_item = NewSkillTreeTierItem:new(tier, tier_data, tier_panel, tree_panel, tree, self, fullscreen_panel, gui)
			self._tiers[tier] = tier_item
		end

		for tier, tier_item in ipairs(self._tiers) do
			tier_item:link(self._tiers[tier + 1], self._tiers[tier - 1])
			tier_item:connect(self._tiers[tier + 1])
		end

		local tier, points_spent, points_max = self:_tree_points()
		local tier_height = self._tree_panel:h() / num_tiers
		tree_panel:set_w(775)
		local progress_panel = tree_panel:panel({
			name = "ProgressPanel",
			w = 4,
			h = 365
		})
		progress_panel:set_right(745)
		progress_panel:set_y(70)
		self._progress_start = self._tree_panel:h()
		self._progress_tier_height = tier_height
		self._progress_pos_current = math.max(0, self._progress_start - self._progress_tier_height * tier - self._progress_tier_height * points_spent / points_max)
		self._progress_pos_wanted = self._progress_pos_current
		self._progress = progress_panel:panel({
			name = "ProgressBox"
		})
		self._points_spent_line = BoxGuiObject:new(self._progress, {
			sides = {
				2,
				2,
				2,
				2
			}
		})
		self._progress:set_y(self._progress_pos_current)
	end

	function NewSkillTreeTierItem:refresh_points(selected)
	end
	function NewSkillTreeTierItem:_refresh_tier_text()
	end
	function NewSkillTreeTierItem:init(tier, tier_data, tier_panel, tree_panel, tree, tree_item, fullscreen_panel, gui)
		NewSkillTreeTierItem.super.init(self)

		local skilltrees_tweak = tweak_data.skilltree.skills
		self._gui = gui
		self._tree = tree
		self._tree_item = tree_item
		self._tier = tier
		self._tier_panel = tier_panel
		self._skills = {}
		self._skills_ordered = {}
		local num_skills = #tier_data
		local skill_width = tier_panel:w() / num_skills
		local skill_x = 0
		local skill_data, skill_panel, skill_item = nil

		for index, skill_id in ipairs(tier_data) do
			skill_data = skilltrees_tweak[skill_id]

			if skill_data then
				skill_panel = tier_panel:panel({
					name = "Skill" .. string.capitalize(skill_id),
					x = skill_x,
					w = skill_width
				})
				skill_x = skill_panel:right()
				skill_item = NewSkillTreeSkillItem:new(skill_id, skill_data, skill_panel, tree_panel, tree, tier, self, fullscreen_panel, gui)
				self._skills[skill_id] = skill_item

				table.insert(self._skills_ordered, skill_id)
			end
		end

		for index, skill_id in ipairs(self._skills_ordered) do
			local left_item = self._skills[self._skills_ordered[index - 1]]
			local right_item = self._skills[self._skills_ordered[index + 1]]

			self._skills[skill_id]:link(left_item, right_item, nil, nil)
			self._skills[skill_id]:connect(right_item)
		end

		self:refresh()
	end

	function NewSkillTreeGui:_update_legends(item)
		local legend_panel = self._panel:child("LegendsPanel")
		local text = legend_panel:child("LegendText")
		local skill_id = item:skill_id()
		local tier = item:tier()
		local tree = item:tree()
		local step = self._skilltree:next_skill_step(skill_id)
		local unlocked = self._skilltree:skill_unlocked(tree, skill_id)
		local completed = self._skilltree:skill_completed(skill_id)
		local skill_data = tweak_data.skilltree.skills[skill_id]
		local can_invest = unlocked and not completed
		local can_refund = step > 1
		local legends = {}

		if managers.menu:is_pc_controller() then
			if can_refund then
				table.insert(legends, {
					string_id = "menu_mouse_refund",
					texture = "guis/textures/pd2/mouse_buttons",
					texture_rect = {
						35,
						1,
						17,
						23
					},
					w = 17,
					h = 23
				})
			end
			if can_invest then
				table.insert(legends, {
					string_id = "menu_mouse_invest_fast",
					texture = "guis/textures/pd2/mouse_buttons",
					texture_rect = {
						18,
						1,
						17,
						23
					},
					w = 17,
					h = 23
				})
				table.insert(legends, {
					string_id = "menu_mouse_invest",
					texture = "guis/textures/pd2/mouse_buttons",
					texture_rect = {
						1,
						1,
						17,
						23
					},
					w = 17,
					h = 23
				})
			end
		else
			if can_refund then
				table.insert(legends, {
					string_id = "menu_controller_refund"
				})
			end
			if can_invest then
				table.insert(legends, {
					string_id = "menu_controller_invest_fast"
				})
				table.insert(legends, {
					string_id = "menu_controller_invest"
				})
			end

		end

		legend_panel:clear()

		local text, icon = nil
		local right = legend_panel:w()

		for _, legend in ipairs(legends) do
			text, icon = nil

			if legend.string_id then
				text = legend_panel:text({
					blend_mode = "add",
					text = managers.localization:to_upper_text(legend.string_id, {
						BTN_SKILLSET = managers.localization:btn_macro("menu_switch_skillset")
					}),
					font = small_font,
					font_size = small_font_size
				})

				make_fine_text(text)
				text:set_right(right)

				right = text:left()
			end

			if legend.texture then
				icon = legend_panel:bitmap({
					texture = legend.texture,
					texture_rect = legend.texture_rect,
					w = legend.w,
					h = legend.h
				})

				icon:set_right(right)

				right = icon:left()
			end

			if text and legend.is_button then
				text:set_color(managers.menu:is_pc_controller() and tweak_data.screen_colors.button_stage_3 or Color.white)
				table.insert(self._legend_buttons, {
					text = text,
					callback = legend.callback
				})
			end

			right = right - 10
		end
	end
	function NewSkillTreeGui:refresh_reset_skills_legends(trees_idx)
		local legend_panel_reset_skills = self._panel:child("LegendPanelResetSkills")

		legend_panel_reset_skills:clear()
		legend_panel_reset_skills:set_size(1000, 1000)

		local localization = managers.localization
		local right = legend_panel_reset_skills:w()


		if self:has_tree_spent_points(trees_idx) then
			local text = legend_panel_reset_skills:text({
				blend_mode = "add",
				text = localization:to_upper_text("skill_tree_reset_skills_button", {
					BTN_RESET_SKILLS = localization:btn_macro("menu_respec_tree_all")
				}),
				font = medium_font,
				font_size = medium_font_size,
				color = managers.menu:is_pc_controller() and tweak_data.screen_colors.button_stage_3 or Color.white
			})

			make_fine_text(text)
			text:set_position(legend_panel_reset_skills:center_x() / 4.2 + 1, legend_panel_reset_skills:center_y() + 14)
			table.insert(self._legend_buttons, {
				text = text,
				callback = function ()
					self:respec_page(self._tree_items[self._active_page])
				end
			})
		end
	end

	function NewSkillTreeGui:mouse_pressed(button, x, y)
		if self._renaming_skill_switch then
			self:_stop_rename_skill_switch()

			return
		end

		if not self._enabled then
			return
		end

		if button == Idstring("0") and self._skillset_panel:inside(x, y) then
			self:_start_rename_skill_switch()

			return
		end

		if button == Idstring("mouse wheel down") then
			self:next_page()

			return
		elseif button == Idstring("mouse wheel up") then
			self:previous_page()

			return
		end

		local invest_button_pressed = button == Idstring("0")
		local fast_invest_button_pressed = button == Idstring("1")
		local refund_button_pressed = button == Idstring("2")
		local fast_refund_button_pressed = button == Idstring("3")

		if self._selected_item and self._selected_item:inside(x, y) then
			if invest_button_pressed then
				self:invest_point(self._selected_item)
				return
			elseif fast_invest_button_pressed then
				self:fast_invest_point(self._selected_item)
				return
			elseif fast_refund_button_pressed then
				self:fast_refund_point(self._selected_item)
				return
			elseif refund_button_pressed then
				self:refund_point(self._selected_item)
				return
			end
		end

		if invest_button_pressed and self._selected_tab and self._selected_tab:inside(x, y) then
			self:set_active_page(self._selected_tab:index())

			return
		end

		if managers.menu:is_pc_controller() then
			if self._back_highlight and self._panel:child("BackButton"):inside(x, y) then
				managers.menu:back()

				return
			end

			for _, legend in ipairs(self._legend_buttons) do
				if alive(legend.text) and legend.text:inside(x, y) then
					if legend.callback then
						legend.callback()
					end

					return
				end
			end
		end
	end

	function NewSkillTreeGui:invest_point(item)
		local tier = item:tier()
		local tree = item:tree()
		local skill_id = item:skill_id()
		local step = self._skilltree:next_skill_step(skill_id)
		local unlocked = self._skilltree:skill_unlocked(nil, skill_id)
		local completed = self._skilltree:skill_completed(skill_id)
		local skill_data = tweak_data.skilltree.skills[skill_id]
		self._points = managers.skilltree:get_skill_points(skill_id, step) or 0
		local money = managers.money:total()
		local skill_cost = managers.money:get_skillpoint_cost(self._selected_item._tree, self._selected_item._tier, self._points)
		local to_unlock = managers.skilltree:next_skill_step(skill_id)
		local skill_points = managers.skilltree:get_skill_points(skill_id, to_unlock) or 0
		local points = managers.skilltree:points()
		if not unlocked or completed or money < skill_cost or points < skill_points then
			item:flash()
			return
		end
		
		managers.menu:show_confirm_invest({
					yes_func=callback(self, self, "invest_confirm", self._selected_item),
					no_func=callback(self, self, "_dialog_confirm_no")
		})
	end
	function NewSkillTreeGui:invest_confirm(item)
		if item:invest() then
			local panel = item:panel()
			if step == 1 then
				self._points = managers.skilltree:get_skill_points(skill_id, 1) or 0
			elseif step == 2 then
				self._points = managers.skilltree:get_skill_points(skill_id, 2) or 0	
			end		
			managers.money:on_skillpoint_spent(self._selected_item._tree, self._selected_item._tier, self._points)
			SimpleGUIEffectSpewer.infamous_up(panel:left() + 32, panel:world_center_y(), self._fullscreen_panel)
			self:on_notify(item:tree(), {
				label = "refresh"
			})
			managers.menu_component:post_event("menu_skill_investment")
			self:update_item()
			self:reload_connections()
			WalletGuiObject.refresh()
			self:refresh_reset_skills_legends(self._selected_page:trees_idx())
		end
	end
	function NewSkillTreeGui:fast_invest_point(item)
		local tier = item:tier()
		local tree = item:tree()
		local skill_id = item:skill_id()
		local step = self._skilltree:next_skill_step(skill_id)
		local unlocked = self._skilltree:skill_unlocked(nil, skill_id)
		local completed = self._skilltree:skill_completed(skill_id)
		local skill_data = tweak_data.skilltree.skills[skill_id]
		self._points = managers.skilltree:get_skill_points(skill_id, step) or 0
		local money = managers.money:total()
		local skill_cost = managers.money:get_skillpoint_cost(self._selected_item._tree, self._selected_item._tier, self._points)
		local to_unlock = managers.skilltree:next_skill_step(skill_id)
		local skill_points = managers.skilltree:get_skill_points(skill_id, to_unlock) or 0
		local points = managers.skilltree:points()
		if not unlocked or completed or money < skill_cost or points < skill_points then
			item:flash()
			return
		end

		if item:invest() then	
			local panel = item:panel()
			managers.money:on_skillpoint_spent(self._selected_item._tree, self._selected_item._tier, self._points)
			SimpleGUIEffectSpewer.infamous_up(panel:left() + 32, panel:world_center_y(), self._fullscreen_panel)
			self:on_notify(item:tree(), {
				label = "refresh"
			})
			managers.menu_component:post_event("menu_skill_investment")
			self:update_item()
			self:reload_connections()
			WalletGuiObject.refresh()
			self:refresh_reset_skills_legends(self._selected_page:trees_idx())
		end
	end
	function NewSkillTreeGui:refund_point(item)
		local skill_id = item:skill_id()
		local step = self._skilltree:next_skill_step(skill_id)
		local completed = self._skilltree:skill_completed(skill_id)
		local skill_data = tweak_data.skilltree.skills[skill_id]
		local can_refund = item:can_refund()
		local cost = managers.money:get_skilltree_tree_respec_cost(self._selected_item._tree)

		if not can_refund then
			item:flash()

			return
		end
		managers.menu:show_confirm_refund({
					yes_func=callback(self, self, "refund_confirm", self._selected_item),
					no_func=callback(self, self, "_dialog_confirm_no")
		})
	end
	function NewSkillTreeGui:refund_confirm(item)
		local cost = managers.money:get_skilltree_tree_respec_cost(self._selected_item._tree)
		if item:refund() then
			self:on_notify(item:tree(), {
				label = "refresh"
			})
			managers.money:_add_to_total(cost / 10, {no_offshore = true})
			managers.menu_component:post_event("menu_skill_investment")
			self:update_item()
			self:reload_connections()
			WalletGuiObject.refresh()
			self:refresh_reset_skills_legends(self._selected_page:trees_idx())
		else
			item:flash()
		end
	end
	function NewSkillTreeGui:fast_refund_point(item)
		local skill_id = item:skill_id()
		local step = self._skilltree:next_skill_step(skill_id)
		local completed = self._skilltree:skill_completed(skill_id)
		local skill_data = tweak_data.skilltree.skills[skill_id]
		local can_refund = item:can_refund()
		local cost = managers.money:get_skilltree_tree_respec_cost(self._selected_item._tree)

		if not can_refund then
			item:flash()

			return
		end

		if item:refund() then
			self:on_notify(item:tree(), {
				label = "refresh"
			})
			managers.money:_add_to_total(cost / 10, {no_offshore = true})
			managers.menu_component:post_event("menu_skill_investment")
			self:update_item()
			self:reload_connections()
			WalletGuiObject.refresh()
			self:refresh_reset_skills_legends(self._selected_page:trees_idx())
		else
			item:flash()
		end
	end
	function NewSkillTreeGui:_dialog_respec_trees_yes(trees_idx)
		for i = 1, #trees_idx, 1 do
			local tree_idx = trees_idx[i]

			if self._skilltree:points_spent(tree_idx) > 0 then
				local cost = managers.money:get_skilltree_tree_respec_cost(self._selected_item._tree)
				self._skilltree:on_respec_tree(tree_idx)
				managers.money:_add_to_total(cost, {no_offshore = true})
			end
		end

		self._event_listener:call("refresh")
	end
	function NewSkillTreeGui:special_btn_pressed(button)
		if not self._enabled then
			return
		end

		if button == Idstring("menu_remove_skill") then
			self:refund_point(self._selected_item)

			return true
		elseif button == Idstring("menu_switch_skillset") then
			managers.menu:open_node("skill_switch", {})

			return
		elseif button == Idstring("menu_respec_tree_all") and self:has_tree_spent_points(self._selected_page:trees_idx()) then
			self:respec_page(self._tree_items[self._active_page])
			
			return
		end

		return false
	end


	--[[
	IMAGE TRANSPARENCY
	This value sets how see-through the background images are.
	0 (minimum value) is invisible. 1 (maximum value) is very visible.

	default: 0.6
	--]]
	local image_transparency = 0.6
	--[[
	ASPECT RATIO ADJUSTMENT METHOD
	PAYDAY 2 normally scales background images to your game's resolution,
	not the resolution the main menu is actually being displayed at. This
	means using any aspect ratio except 16:9 could be cutting off portions
	of the image. I've attempted to fix this so that the images are scaled
	to the menu's actual rendered resolution.

	For people who see black bars at their main menu, this should make
	images fit a little better.

	If it's causing problems, your menu doesn't render at 16:9 for some
	reason, or you just want the old scaling method back, set
	adjust_aspect_ratio = false.
	--]]
	local adjust_aspect_ratio = true
	function NewSkillTreeGui:setbgimg(page, init)
		local bgpanels = { "_bg_image1", "_bg_image2", "_bg_image3", "_bg_image4", "_bg_image5" }

		if init then
			if self._fullscreen_ws then
				managers.gui_data:destroy_workspace(self._fullscreen_ws)
			end
			self._fullscreen_ws = nil
			self._fullscreen_panel = nil
			self._bg_image1 = nil
			self._bg_image2 = nil
			self._bg_image3 = nil
			self._bg_image4 = nil
			self._bg_image5 = nil

			self._fullscreen_ws = managers.gui_data:create_fullscreen_workspace()
			self._fullscreen_panel = self._fullscreen_ws:panel():panel({name = "fullscreen"})

			self._bg_image1 = self._fullscreen_panel:bitmap({
				name = "bg_image1",
				texture = "guis/textures/pd2/skilltree/bg_mastermind",
				w = self._fullscreen_panel:w(),
				h = self._fullscreen_panel:h(),
				layer = 1,
				blend_mode = "add"
			})

			self._bg_image2 = self._fullscreen_panel:bitmap({
				name = "bg_image2",
				texture = "guis/textures/pd2/skilltree/bg_enforcer",
				w = self._fullscreen_panel:w(),
				h = self._fullscreen_panel:h(),
				layer = 1,
				blend_mode = "add"
			})

			self._bg_image3 = self._fullscreen_panel:bitmap({
				name = "bg_image3",
				texture = "guis/textures/pd2/skilltree/bg_technician",
				w = self._fullscreen_panel:w(),
				h = self._fullscreen_panel:h(),
				layer = 1,
				blend_mode = "add"
			})

			self._bg_image4 = self._fullscreen_panel:bitmap({
				name = "bg_image4",
				texture = "guis/textures/pd2/skilltree/bg_ghost",
				w = self._fullscreen_panel:w(),
				h = self._fullscreen_panel:h(),
				layer = 1,
				blend_mode = "add"
			})

			self._bg_image5 = self._fullscreen_panel:bitmap({
				name = "bg_image5",
				texture = "guis/textures/pd2/skilltree/bg_fugitive",
				w = self._fullscreen_panel:w(),
				h = self._fullscreen_panel:h(),
				layer = 1,
				blend_mode = "add"
			})
		end


		for i, panel in ipairs(bgpanels) do
			self[panel]:set_alpha(image_transparency)
			local aspect = self._fullscreen_panel:w() / self._fullscreen_panel:h()
			local texture_width = self[panel]:texture_width()
			local texture_height = self[panel]:texture_height()

		if adjust_aspect_ratio == true then
			local correct_height = self._fullscreen_panel:w() / (16/9) -- actual menu aspect ratio
			self[panel]:set_size(correct_height, correct_height)
		else
			local sw = math.max(texture_width, texture_height * aspect)
			local sh = math.max(texture_height, texture_width / aspect)
			local dw = texture_width / sw
			local dh = texture_height / sh
			self[panel]:set_size(dw * self._fullscreen_panel:w(), dh * self._fullscreen_panel:h())
		end

			self[panel]:set_right(self._fullscreen_panel:w())
			self[panel]:set_center_y(self._fullscreen_panel:h() / 2)
		end

		for i, panel in ipairs(bgpanels) do
			self[panel]:set_visible(false)
		end

		if page == 1 then
			self._bg_image1:set_visible(true)
		elseif page == 2 then
			self._bg_image2:set_visible(true)
		elseif page == 3 then
			self._bg_image3:set_visible(true)
		elseif page == 4 then
			self._bg_image4:set_visible(true)
		elseif page == 5 then
			self._bg_image5:set_visible(true)
		end
	end
	Hooks:PreHook( NewSkillTreeGui , "init" , "gibskillbg_init" , function( self , params )
		NewSkillTreeGui:setbgimg(1, true)
	end)
	Hooks:PostHook( NewSkillTreeGui , "set_active_page" , "gibskillbg_setpage" , function( self , params )
		NewSkillTreeGui:setbgimg(self._active_page, false)
	end)
	Hooks:PostHook( NewSkillTreeGui , "close" , "gibtest2" , function( self , params )
		NewSkillTreeGui:setbgimg(0, false)
	end)
end
if string.lower(RequiredScript) == "lib/managers/menu/skilltreegui" then
	local NUM_TREES_PER_PAGE = 4

	local function make_fine_text(text)
		local x, y, w, h = text:text_rect()

		text:set_size(w, h)
		text:set_position(math.round(text:x()), math.round(text:y()))
	end

	Hooks:PreHook(SkillTreeGui, "_update_borders", "perks", function(self)
		local spec_tabs_panel = self._specialization_panel:child("spec_tabs_panel")
		local spec_box_panel = self._specialization_panel:child("spec_box_panel")
		self._specialization_panel:set_y(28)
		spec_tabs_panel:set_y(32)
	end)

	function SpecializationTierItem:init(tier_data, tree_panel, tree, tier, x, y, w, h)
		SpecializationTierItem.super.init(self)

		self._locked = false
		self._tree = tree
		self._tier = tier
		local specialization_descs = tweak_data.upgrades.specialization_descs[tree]
		specialization_descs = specialization_descs and specialization_descs[tier] or {}
		local macroes = {}

		for i, d in pairs(specialization_descs) do
			macroes[i] = d
		end

		self._tier_data = tier_data
		self._name_string = tier_data.name_id and managers.localization:text(tier_data.name_id) or "NO_NAME_" .. tostring(tree) .. "_" .. tostring(tier)
		self._desc_string = tier_data.desc_id and managers.localization:text(tier_data.desc_id, macroes) or "NO_DESC_" .. tostring(tree) .. "_" .. tostring(tier)

		if _G.IS_VR or managers.user:get_setting("show_vr_descs") then
			local vr_desc_data = tweak_data:get_raw_value("vr", "specialization_descs_addons", self._tree, self._tier)

			if vr_desc_data then
				local vr_string = managers.localization:text("menu_vr_skill_addon") .. " " .. managers.localization:text(vr_desc_data.desc_id, vr_desc_data.macros)
				self._desc_string = self._desc_string .. "\n\n" .. vr_string
			end
		end

		local tier_panel = tree_panel:panel({
			halign = "scale",
			valign = "scale",
			name = tostring(tier),
			x = x,
			y = y,
			w = w,
			h = h
		})
		self._tier_panel = tier_panel
		self._basic_size = {
			w + 46,
			h + 46
		}
		self._selected_size = {
			w + 46,
			h + 46
		}
		local texture = "guis/textures/pd2/specialization/perk_icon_card"
		local texture_rect = {
			0,
			0,
			64,
			92
		}
		local unlocked_bg = tier_panel:bitmap({
			name = "unlocked_bg",
			layer = 0,
			visible = false,
			valign = "scale",
			halign = "scale",
			w = 80,
			h = 80,
			rotation = 360,
			alpha = 2,
			texture = texture,
			texture_rect = texture_rect,
			color = Color.white
		})
		

		unlocked_bg:set_center_x(tier_panel:center() - 1)
		unlocked_bg:set_center_y(tier_panel:center() - 1)

		local texture_rect_x = tier_data.icon_xy and tier_data.icon_xy[1] or 0
		local texture_rect_y = tier_data.icon_xy and tier_data.icon_xy[2] or 0
		local guis_catalog = "guis/"

		if tier_data.texture_bundle_folder then
			guis_catalog = guis_catalog .. "dlcs/" .. tostring(tier_data.texture_bundle_folder) .. "/"
		end

		local icon_atlas_texture = "guis/textures/pd2/specialization/icons_atlas"
		local tier_icon = tier_panel:bitmap({
			layer = 1,
			halign = "scale",
			valign = "scale",
			blend_mode = "add",
			name = tostring(math.random(1000000)),
			rotation = 360,
			alpha = 2,
			texture = icon_atlas_texture,
			texture_rect = {
				texture_rect_x * 64,
				texture_rect_y * 64,
				64,
				64
			},
			color = Color.white
		})

		tier_icon:grow(-5, -5)
		tier_icon:set_center(unlocked_bg:center())

		self._tier_icon = tier_icon
		local progress_circle = tier_panel:bitmap({
			texture = "guis/textures/pd2/specialization/progress_ring",
			name = "progress_circle_current",
			valign = "scale",
			visible = false,
			alpha = 0.5,
			halign = "scale",
			render_template = "VertexColorTexturedRadial",
			layer = 1,
			color = Color(0, 1, 1)
		})

		progress_circle:set_size(95, 95)
		progress_circle:set_blend_mode("add")
		progress_circle:set_center(unlocked_bg:center())

		local progress_circle = tier_panel:bitmap({
			texture = "guis/textures/pd2/specialization/progress_ring",
			name = "progress_circle",
			valign = "scale",
			visible = false,
			rotation = 360,
			alpha = 0.5,
			halign = "scale",
			render_template = "VertexColorTexturedRadial",
			layer = 1,
			color = Color(0, 1, 1)
		})

		progress_circle:set_size(95, 95)
		progress_circle:set_blend_mode("add")
		progress_circle:set_center(unlocked_bg:center())

		local progress_circle_bg = tier_panel:bitmap({
			texture = "guis/textures/pd2/specialization/progress_ring",
			name = "progress_circle_bg",
			valign = "scale",
			visible = false,
			rotation = 360,
			halign = "scale",
			alpha = 0.1,
			layer = 0,
			color = Color.white
		})

		progress_circle_bg:set_size(95, 95)
		progress_circle_bg:set_center(unlocked_bg:center())

		self._select_box_panel = self._tier_panel:panel({})
		self._select_box_panel:set_size(90, 90)
		
		self._inside_panel = self._select_box_panel:panel({})

		self._inside_panel:set_shape(6, 6, w + 730, h - 12)
		
		local tier_box_panel = tree_panel:panel({
			name = "tier_box_panel"
		})
		self._tier_box = BoxGuiObject:new(self._select_box_panel, {
			sides = {
				1,
				1,
				1,
				1
			}
		})
		
		self._tier_rect = self._select_box_panel:rect({
			alpha = 0.3,
			layer = -1,
			color = Color.black
		})
		
		self._select_box = BoxGuiObject:new(tier_box_panel, {
			sides = {
				1,
				1,
				1,
				1
			}
		})
		self._tier_rect = tier_box_panel:rect({
			alpha = 0.3,
			layer = -1,
			color = Color.black
		})
		self._select_box:hide()
		self._select_box:set_clipping(false)
		self:refresh()
	end

	Hooks:PreHook(SpecializationTierItem, "refresh", "perksrefresh", function(self)
		self._tier_rect:set_visible(self._selected)
	end)

	function SpecializationTreeItem:init(tree, parent_panel, tab_iem)
		self._items = {}
		self._parent_panel = parent_panel
		self._tree = tree
		self._tab_item = tab_iem
		local tree_panel = parent_panel:panel({
			alpha = 1,
			visible = true,
			name = tostring(tree)
		})
		self._tree_panel = tree_panel
		local max_tier = managers.skilltree:get_specialization_value(tree, "tiers", "max_tier")
		local num_trees_per_page = NUM_TREES_PER_PAGE
		local parent_h = parent_panel:h() - 24
		local x = 0
		local y = 0
		local w = math.round(100)
		local h = math.round(parent_h / num_trees_per_page)
		local size = math.min(w, h)
		h = math.round((parent_h - size) / (num_trees_per_page - 1))

		tree_panel:set_h(size)
		tree_panel:set_y(h * (tree - 1) + 24)

		if num_trees_per_page <= tree then
			tree_panel:move(0, -2)
		end

		local data = tweak_data.skilltree.specializations[tree]
		self._data = data
		local new_item = nil

		for tier, tier_data in ipairs(data) do
			x = math.round(w * (tier - 1) + (w - size) / 2 + 1)
			new_item = SpecializationTierItem:new(tier_data, tree_panel, tree, tier, x, y, size, size)

			table.insert(self._items, new_item)
		end

		local active_text = parent_panel:text({
			alpha = 0,
			blend_mode = "add",
			visible = true,
			x = 4,
			name = "active_text" .. tostring(self._tree),
			text = utf8.to_upper(tab_iem:name_string()),
			font = tweak_data.menu.pd2_medium_font,
			font_size = tweak_data.menu.pd2_medium_size,
			color = tweak_data.screen_colors.text
		})

		make_fine_text(active_text)
		active_text:set_left(tree_panel:left() + 120)
		active_text:set_center_y(tree_panel:center_y() - 10)
		
		local active_desc = parent_panel:text({
			alpha = 0,
			blend_mode = "add",
			visible = true,
			name = "active_desc" .. tostring(self._tree),
			text = utf8.to_upper(tab_iem:desc_string()),
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_size,
			color = tweak_data.screen_colors.text
		})
		
		make_fine_text(active_desc)
		active_desc:set_left(tree_panel:left() + 120)
		active_desc:set_center_y(tree_panel:center_y() + 20)

		local selected_text = parent_panel:text({
			alpha = 0,
			blend_mode = "add",
			visible = true,
			x = 4,
			name = "selected_text" .. tostring(self._tree),
			text = utf8.to_upper(tab_iem:name_string()),
			font = tweak_data.menu.pd2_medium_font,
			font_size = tweak_data.menu.pd2_medium_size,
			color = tweak_data.screen_colors.text
		})

		make_fine_text(selected_text)
		selected_text:set_left(tree_panel:left() + 120)
		selected_text:set_center_y(tree_panel:center_y())

		self._active_box_panel = parent_panel:panel({
			visible = false,
			name = "active_box_panel" .. tostring(self._tree)
		})

		self._active_box_panel:set_shape(tree_panel:shape())

		self._active_box = BoxGuiObject:new(self._active_box_panel, {
			sides = {
				1,
				1,
				2,
				2
			}
		})
		self._active_rect = self._active_box_panel:rect({
			alpha = 0.5,
			layer = -1,
			color = Color.black
		})
		local point_btns_panel = parent_panel:panel({
			alpha = 0,
			visible = true,
			name = "point_btns_panel" .. tostring(self._tree)
		})
		local reduce_points = point_btns_panel:bitmap({
			texture = "guis/textures/pd2/specialization/points_reduce",
			name = "reduce_points",
			h = 24,
			w = 24,
			visible = true,
			x = -45,
			y = -45,
			blend_mode = "add",
			rotation = 360,
			layer = 0
		})
		local increase_points = point_btns_panel:bitmap({
			texture = "guis/textures/pd2/specialization/points_add",
			name = "increase_points",
			h = 24,
			w = 24,
			rotation = 360,
			blend_mode = "add",
			visible = true,
			x = -45,
			y = -80,
			layer = 0
		})

		point_btns_panel:set_size(36, 16)
		point_btns_panel:set_top(tree_panel:bottom())

		local current_tier = managers.skilltree:get_specialization_value(self._tree, "tiers", "current_tier")
		local max_tier = managers.skilltree:get_specialization_value(self._tree, "tiers", "max_tier")

		self:refresh()
	end

	function SpecializationTreeItem:refresh()
		local current_specialization = managers.skilltree:get_specialization_value("current_specialization")
		self._active = self._tree == current_specialization

		local function anim_refresh(o)
			local start_alpha = self._tree_panel:alpha()
			local end_alpha = (self._active and 1 or 1) * (self._selected and 1 or 1)
			local alpha = start_alpha
			local is_done = false
			local dt = 0

			while not is_done do
				dt = coroutine.yield()
				alpha = math.step(alpha, end_alpha, dt)

				self._tree_panel:set_alpha(alpha)

				is_done = alpha == end_alpha

				for _, item in ipairs(self._items) do
					if not alive(item) then
						return
					end

					if not item:update_size(dt, self._selected) then
						is_done = false
					end
				end
			end
		end

		local current_tier = managers.skilltree:get_specialization_value(self._tree, "tiers", "current_tier")
		local max_tier = managers.skilltree:get_specialization_value(self._tree, "tiers", "max_tier")
		local point_btns_panel = self._parent_panel:child("point_btns_panel" .. tostring(self._tree))
		local reduce_points = point_btns_panel:child("reduce_points")
		local increase_points = point_btns_panel:child("increase_points")

		reduce_points:set_alpha(self._selected and 1 or 0)
		increase_points:set_alpha(self._selected and 1 or 0)

		local dlc = tweak_data:get_raw_value("skilltree", "specializations", self._tree, "dlc")
		local can_place_points = current_tier < max_tier and (not dlc or managers.dlc:is_dlc_unlocked(dlc))

		point_btns_panel:set_alpha(can_place_points and 1 or 0)

		if can_place_points then
			point_btns_panel:set_center_x(math.round(self._items[current_tier + 1]:panel():center_x()))
		end

		self._place_points_item = can_place_points and current_tier + 1 or false
		local active_text = self._parent_panel:child("active_text" .. tostring(self._tree))
		
		active_text:set_alpha(self._active and 1 or 0)

		local active_desc = self._parent_panel:child("active_desc" .. tostring(self._tree))
		
		active_desc:set_alpha(self._active and 1 or 0)

		local selected_text = self._parent_panel:child("selected_text" .. tostring(self._tree))

		selected_text:set_alpha(not self._active and self._selected and 1 or self._active and 0 or 1)
		self._active_box_panel:set_visible(self._active)
		self._tree_panel:stop()
		self._tree_panel:animate(anim_refresh)
	end

	function SpecializationTabItem:init(spec_tabs_panel, tree, data, w, x)
		SpecializationTabItem.super.init(self)

		self._data = data
		self._tree = tree
		self._spec_tab = spec_tabs_panel:panel({
			name = tostring(tree),
			w = w,
			x = x
		})
		self._name_string = data.name_id and managers.localization:text(data.name_id) or "NO_NAME_" .. tostring(tree)
		self._desc_string = data.desc_id and managers.localization:text(data.desc_id) or "NO_DESC_" .. tostring(tree)

		if data and data.dlc and tweak_data.lootdrop.global_values[data.dlc] then
			self._desc_string = self._desc_string
			self._desc_custom_color = tweak_data.lootdrop.global_values[data.dlc].color
		end

		self._spec_tab:text({
			word_wrap = false,
			name = "spec_tab_name",
			vertical = "center",
			wrap = false,
			align = "center",
			layer = 1,
			text = utf8.to_upper(self._name_string),
			font = tweak_data.menu.pd2_medium_font,
			font_size = tweak_data.menu.pd2_medium_font_size,
			color = tweak_data.screen_colors.button_stage_3
		})

		local _, _, tw, th = self._spec_tab:child("spec_tab_name"):text_rect()

		self._spec_tab:set_size(tw + 15, th + 10)
		self._spec_tab:child("spec_tab_name"):set_size(self._spec_tab:size())
		self._spec_tab:bitmap({
			texture = "guis/textures/pd2/shared_tab_box",
			name = "spec_tab_select_rect",
			visible = false,
			layer = 0,
			w = self._spec_tab:w(),
			h = self._spec_tab:h(),
			color = tweak_data.screen_colors.text
		})
		self._spec_tab:move(0, 0)
	end
end
if string.lower(RequiredScript) == "lib/managers/menumanagerdialogs" then
	function MenuManager:show_confirm_invest(params)
		local dialog_data = {}
		dialog_data.title = managers.localization:text("dialog_confirm_invest")
		dialog_data.text = managers.localization:text("dialog_confirm_invest_desc")
		dialog_data.focus_button = 2
		local yes_button = {}
		yes_button.text = managers.localization:text("dialog_yes")
		yes_button.callback_func = params.yes_func
		local no_button = {}
		no_button.text = managers.localization:text("dialog_no")
		no_button.callback_func = params.no_func
		no_button.cancel_button = true
		dialog_data.button_list = {yes_button, no_button}
		dialog_data.no_upper = true
		managers.system_menu:show(dialog_data)
	end

	function MenuManager:show_confirm_refund(params)
		local dialog_data = {}
		dialog_data.title = managers.localization:text("dialog_confirm_refund")
		dialog_data.text = managers.localization:text("dialog_confirm_refund_desc")
		dialog_data.focus_button = 2
		local yes_button = {}
		yes_button.text = managers.localization:text("dialog_yes")
		yes_button.callback_func = params.yes_func
		local no_button = {}
		no_button.text = managers.localization:text("dialog_no")
		no_button.callback_func = params.no_func
		no_button.cancel_button = true
		dialog_data.button_list = {yes_button, no_button}
		dialog_data.no_upper = true
		managers.system_menu:show(dialog_data)
	end
end
if string.lower(RequiredScript) == "lib/managers/skilltreemanager" then
	SkillTreeManager.VERSION = 10
	local get_skill_costs = function()
		local t = {
			{1, 3},
			{1, 3},
			{1, 3},
			{1, 3},
			{4, 8},
			{4, 8},
			{4, 8}
		}
		return t
	end

	function SkillTreeManager:skill_cost(tier, skill_level, skill_cost)
		local t = skill_cost or get_skill_costs()

		return t[tier][skill_level]
	end

	function SkillTreeManager:_points_spent_skill(tier, skill_id)
		local points = 0
		local skill_costs = get_skill_costs()
		local skill_level = self._global.skills[skill_id].unlocked

		if skill_level and skill_level >= 1 then
			for j = skill_level, 1, -1 do
				points = points + self:skill_cost(tier, j, skill_costs)
			end
		end

		return points
	end

	function SkillTreeManager:get_points_spent_in_tier(tier, tier_idx)
		local skills = self._global.skills
		local skill_costs = get_skill_costs()
		local points = 0

		for i = 1, #tier, 1 do
			local skill_level = skills[tier[i]].unlocked

			if skill_level and skill_level >= 1 then
				for j = skill_level, 1, -1 do
					points = points + self:skill_cost(tier_idx, j, skill_costs)
				end
			end
		end

		return points
	end

	function SkillTreeManager:get_points_spent_until_tier(tiers, target_tier_idx)
		local skills = self._global.skills
		local skill_costs = get_skill_costs()
		local points = 0

		for i = 1, target_tier_idx, 1 do
			for j = 1, #tiers[i], 1 do
				local skill_level = skills[tiers[i][j]].unlocked

				if skill_level and skill_level >= 1 then
					for k = skill_level, 1, -1 do
						points = points + self:skill_cost(i, k, skill_costs)
					end
				end
			end
		end

		return points
	end

end