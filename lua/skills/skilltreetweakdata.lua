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
				"assault_rifle_reload_speed_multiplier",
				"snp_reload_speed_multiplier"
			},
			cost = self.costs.hightier
		},
		{
			upgrades = {
				"assault_rifle_move_spread_multiplier",
				"player_run_and_reload",
				"snp_move_spread_multiplier"
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
				"sentry_gun_armor_multiplier",
				"sentry_gun_spread_multiplier"
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
				"temporary_single_shot_fast_reload_1"
			},
			cost = self.costs.hightier
		},
		{
			upgrades = {
				"player_critical_hit_chance_1"
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
	self.skills.awareness 				= {{upgrades = {"player_tier_armor_multiplier_1", "player_tier_armor_multiplier_2",
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
	self.skills.alpha_dog 				= {{upgrades = {"player_tier_armor_multiplier_1", "player_tier_armor_multiplier_2",
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
	self.skills.up_you_go 				= {{upgrades = {"player_tier_armor_multiplier_1", "player_tier_armor_multiplier_2",
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
			cost = self.costs.hightier
		},
		{
			upgrades = {
				"x_basset",
				"x_judge",
				"x_rota"
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

	self.skill_switches = {

		{
			name_id = "menu_st_skill_switch_1"
		},
		{
			name_id = "menu_st_skill_switch_2",
			locks = {level = 100}
		},
		{
			name_id = "menu_st_skill_switch_3",
			locks = {level = 100}
		},
		{
			name_id = "menu_st_skill_switch_4",
			locks = {level = 100}
		},
		{
			name_id = "menu_st_skill_switch_5",
			locks = {level = 100}
		}

	}

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
	self.specializations = {
		{
			name_id = "menu_bonus_exp",
			desc_id = "menu_bonus_exp_desc",
			{
				upgrades = {
					"passive_player_xp_multiplier"
				},
				cost = 50,
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
					"player_small_loot_multiplier2"
				},
				cost = 50,
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
				cost = 50,
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
				cost = 200,
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
				cost = 300,
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
				cost = 300,
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
				cost = 100,
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
				cost = 200,
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
				cost = 300,
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
				cost = 300,
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
				cost = 600,
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
					"trip_mine_fire_trap_2"
				},
				cost = 300,
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
				cost = 400,
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
				cost = 200,
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
				cost = 500,
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
				cost = 500,
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
				cost = 500,
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
				cost = 500,
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
				cost = 125,
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
				cost = 250,
				icon_xy = {8, 2},
				name_id = "bm_w_elastic",
				desc_id = "menu_elastic_desc"
			}
		},
		{
			name_id = "bm_w_ecp",
			desc_id = "menu_unlock_weapon_desc",
			dlc = "ecp",
			{
				upgrades = {"ecp"},
				cost = 250,
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
				cost = 1000,
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
				cost = 1000,
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
				cost = 1000,
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
				cost = 1000,
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
				cost = 1000,
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
				cost = 1000,
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
				cost = 1000,
				icon_xy = {6, 2},
				name_id = "bm_w_system",
				desc_id = "menu_system_desc"
			}
		}
	}
end