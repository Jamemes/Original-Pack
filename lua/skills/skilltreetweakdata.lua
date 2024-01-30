local data = SkillTreeTweakData.init
function SkillTreeTweakData:init(tweak_data)
	local function digest(value)
		return Application:digest_value(value, true)
	end
	data(self, tweak_data)
	
	self.tier_unlocks = {
		digest(1),
		digest(5),
		digest(10),
		digest(20),
		digest(30),
		digest(40)
	}
	self.costs.unlock_tree = digest(1)
	
	self.skill_pages_order = {
		"mastermind",
		"enforcer",
		"technician",
		"ghost",
		"hoxton"
	}
	
	self.HIDE_TIER_BONUS = false
	self.skills.mastermind = {
		name_id = "menu_mastermind",
		desc_id = "menu_mastermind_desc",
		icon_xy = {2, 7},
		{
			upgrades = {
				"doctor_bag",
				"team_passive_stamina_multiplier_1"
			},
			cost = self.costs.unlock_tree,
			desc_id = "menu_mastermind_tier_2"
		},
		{
			upgrades = {"passive_doctor_bag_interaction_speed_multiplier"},
			desc_id = "menu_mastermind_tier_1"
		},
		{
			upgrades = {"player_passive_intimidate_range_mul"},
			desc_id = "menu_mastermind_tier_3"
		},
		{
			upgrades = {"team_passive_health_multiplier"},
			desc_id = "menu_mastermind_tier_4"
		},
		{
			upgrades = {
				"doctor_bag_deploy_time_multiplier",
				"passive_doctor_bag_interaction_speed_multiplier_2"
			},
			desc_id = "menu_mastermind_tier_5"
		},
		{
			upgrades = {
				"player_passive_empowered_intimidation",
				"passive_player_assets_cost_multiplier",
				"player_cable_tie_pickup"
			},
			desc_id = "menu_mastermind_tier_6"
		}
	}
	self.skills.enforcer = {
		name_id = "menu_enforcer",
		desc_id = "menu_enforcer_desc",
		icon_xy = {1, 0},
		{
			upgrades = {
				"ammo_bag",
				"player_passive_suppression_bonus_1"
			},
			cost = self.costs.unlock_tree,
			desc_id = "menu_menu_enforcer_tier_1"
		},
		{
			upgrades = {"player_passive_health_multiplier_1"},
			desc_id = "menu_menu_enforcer_tier_2"
		},
		{
			upgrades = {
				"player_passive_suppression_bonus_2",
				"passive_ammo_bag_interaction_speed_multiplier_1"
			},
			desc_id = "menu_menu_enforcer_tier_3"
		},
		{
			upgrades = {"player_passive_health_multiplier_2"},
			desc_id = "menu_menu_enforcer_tier_4"
		},
		{
			upgrades = {
				"weapon_passive_damage_multiplier",
				"passive_ammo_bag_interaction_speed_multiplier_2"
			},
			desc_id = "menu_menu_enforcer_tier_5"
		},
		{
			upgrades = {"player_passive_health_multiplier_3"},
			desc_id = "menu_menu_enforcer_tier_6"
		}
	}
	self.skills.technician = {
		name_id = "menu_technician",
		desc_id = "menu_technician_desc",
		icon_xy = {7, 4},
		{
			upgrades = {
				"trip_mine",
				"player_passive_crafting_weapon_multiplier_1",
				"player_passive_crafting_mask_multiplier_1"
			},
			cost = self.costs.unlock_tree,
			desc_id = "menu_technician_tier_1"
		},
		{
			upgrades = {"weapon_passive_recoil_multiplier_1"},
			desc_id = "menu_technician_tier_2"
		},
		{
			upgrades = {
				"player_passive_crafting_weapon_multiplier_2",
				"player_passive_crafting_mask_multiplier_2"
			},
			desc_id = "menu_technician_tier_3"
		},
		{
			upgrades = {"weapon_passive_headshot_damage_multiplier"},
			desc_id = "menu_technician_tier_4"
		},
		{
			upgrades = {
				"player_passive_crafting_weapon_multiplier_3",
				"player_passive_crafting_mask_multiplier_3"
			},
			desc_id = "menu_technician_tier_5"
		},
		{
			upgrades = {
				"weapon_passive_recoil_multiplier_2",
				"player_passive_armor_multiplier_1",
				"team_passive_armor_regen_time_multiplier"
			},
			desc_id = "menu_technician_tier_6"
		}
	}
	self.skills.ghost = {
		name_id = "menu_ghost",
		desc_id = "menu_ghost_desc",
		icon_xy = {1, 4},
		{
			upgrades = {
				"ecm_jammer",
				"ecm_jammer_affects_cameras",
				"player_passive_dodge_chance_1"
			},
			cost = self.costs.unlock_tree,
			desc_id = "menu_ghost_tier_1"
		},
		{
			upgrades = {"weapon_passive_swap_speed_multiplier_1"},
			desc_id = "menu_ghost_tier_2"
		},
		{
			upgrades = {"player_passive_dodge_chance_2"},
			desc_id = "menu_ghost_tier_3"
		},
		{
			upgrades = {
				"player_passive_suspicion_bonus",
				"player_passive_armor_movement_penalty_multiplier"
			},
			desc_id = "menu_ghost_tier_4"
		},
		{
			upgrades = {"weapon_passive_swap_speed_multiplier_2"},
			desc_id = "menu_ghost_tier_5"
		},
		{
			upgrades = {
				"player_passive_loot_drop_multiplier",
				"weapon_passive_armor_piercing_chance"
			},
			desc_id = "menu_ghost_tier_6"
		}
	}
	self.skills.hoxton = {
		name_id = "menu_hoxton_pack",
		desc_id = "menu_hoxton_pack_desc",
		icon_xy = {3, 10},
		{
			upgrades = {
				"first_aid_kit",
				"player_gangster_damage_dampener_1"
			},
			cost = self.costs.unlock_tree,
			desc_id = "menu_hoxton_tier_1"
		},
		{
			upgrades = {"player_damage_shake_addend"},
			desc_id = "menu_hoxton_tier_2"
		},
		{
			upgrades = {"player_gangster_damage_dampener_2"},
			desc_id = "menu_hoxton_tier_3"
		},
		{
			upgrades = {"weapon_special_damage_taken_multiplier"},
			desc_id = "menu_hoxton_tier_4"
		},
		{
			upgrades = {"player_fugitive_tier_health_multiplier"},
			desc_id = "menu_hoxton_tier_5"
		},
		{
			upgrades = {"player_camouflage_bonus_1"},
			desc_id = "menu_hoxton_tier_6"
		}
	}
			
	self.default_upgrades = {
		"player_extra_corpse_dispose_amount",
		"armor_kit",
		"cable_tie",
		"ecm_jammer_affects_cameras",
		"player_special_enemy_highlight",
		"player_hostage_trade",
		"player_sec_camera_highlight",
		"player_corpse_dispose",
		"player_civ_harmless_melee",
		"striker_reload_speed_default",
		"temporary_first_aid_damage_reduction",
		"temporary_passive_revive_damage_reduction_2",
		"jowi",
		"x_1911",
		"x_b92fs",
		"x_deagle",
		"x_g22c",
		"x_g17",
		"x_usp",
		"x_sr2",
		"x_mp5",
		"x_akmsu",
		"x_packrat",
		"x_p226",
		"x_m45",
		"x_mp7",
		"x_ppk"
	}

----------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------
	self.trees = {
		{
			skill = "mastermind",
			name_id = "st_menu_mastermind",
			background_texture = "guis/textures/pd2/skilltree/bg_mastermind",
			tiers = {
				{
					"cable_guy",
					"combat_medic",
					"leadership"
				},
				{
					"hostage_taker",
					"painkillers",
					"black_marketeer"
				},
				{
					"smooth_talker",
					"equilibrium",
					"inside_man"
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
			name_id = "st_menu_enforcer",
			background_texture = "guis/textures/pd2/skilltree/bg_enforcer",
			tiers = {
				{
					"oppressor",
					"tough_guy",
					"pack_mule"
				},
				{
					"show_of_force",
					"underdog",
					"steroids"
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
					"from_the_hip",
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
			name_id = "st_menu_technician",
			background_texture = "guis/textures/pd2/skilltree/bg_technician",
			tiers = {
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
			name_id = "st_menu_ghost",
			background_texture = "guis/textures/pd2/skilltree/bg_ghost",
			tiers = {
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
					"silence_expert"
				},
				{
					"nine_lives",
					"ecm_booster",
					"hitman"
				},
				{
					"second_chances",
					"ecm_feedback",
					"low_blow"
				}
			}
		},
		{
			skill = "hoxton",
			name_id = "st_menu_hoxton_pack",
			background_texture = "guis/textures/pd2/skilltree/bg_fugitive",
			tiers = {
				{
					"freedom_call",
					"master_craftsman",
					"awareness"
				},
				{
					"hidden_blade",
					"alpha_dog",
					"running_from_death"
				},
				{
					"thick_skin",
					"tea_time",
					"jail_workout"
				},
				{
					"second_wind",
					"tea_cookies",
					"drop_soap"
				},
				{
					"up_you_go",
					"walking_bleedout",
					"akimbo"
				},
				{
					"time_heals",
					"more_blood_to_bleed",
					"gunzerker"
				}
			}
		}
	}

		
	self.skills.cable_guy[1].upgrades = {"cable_tie_interact_speed_multiplier"}
	self.skills.cable_guy[2].upgrades = {"cable_tie_quantity"}
	self.skills.cable_guy.icon_xy = {4, 7}
	self.skills.cable_guy.name_id = "menu_cable_guy"
	self.skills.cable_guy.desc_id = "menu_cable_guy_desc"
	self.skills.combat_medic[1].upgrades = {"temporary_combat_medic_damage_multiplier1"}
	self.skills.combat_medic.name_id = "menu_combat_medic"
	self.skills.combat_medic.desc_id = "menu_combat_medic_desc"
	self.skills.leadership[1].upgrades = {"team_pistol_recoil_multiplier", "team_akimbo_recoil_multiplier"}
	self.skills.leadership[2].upgrades = {"team_weapon_recoil_multiplier"}
	self.skills.leadership.name_id = "menu_leadership"
	self.skills.leadership.desc_id = "menu_leadership_desc"
	self.skills.hostage_taker = {
		{
			upgrades = {"player_civ_intimidation_mul"},
			cost = self.costs.default
		},
		{
			upgrades = {"player_hostage_interaction_speed_multiplier"},
			cost = self.costs.pro
		},
		name_id = "menu_hostage_taker",
		desc_id = "menu_hostage_taker_desc",
		icon_xy = {7, 8}
	}
	self.skills.painkillers = {
		{
			upgrades = {"player_revive_damage_reduction_level_1"},
			cost = self.costs.default
		},
		{
			upgrades = {"player_revive_damage_reduction_level_2"},
			cost = self.costs.pro
		},
		name_id = "menu_fast_learner",
		desc_id = "menu_fast_learner_desc",
		icon_xy = {0, 10}
	}
	self.skills.equilibrium[1].upgrades = {"pistol_spread_index_addend", "pistol_swap_speed_multiplier"}
	self.skills.equilibrium[2].upgrades = {"pistol_fire_rate_multiplier"}
	self.skills.equilibrium.name_id = "menu_equilibrium"
	self.skills.equilibrium.desc_id = "menu_equilibrium_desc"
	self.skills.smooth_talker = {
		{
			upgrades = {"player_corpse_alarm_pager_bluff"},
			cost = self.costs.default
		},
		{
			upgrades = {"player_alarm_pager_speed_multiplier"},
			cost = self.costs.pro
		},
		name_id = "menu_smooth_talker",
		desc_id = "menu_smooth_talker_desc",
		icon_xy = {2, 4}
	}
	self.skills.inside_man[1].upgrades = {"player_assets_cost_multiplier"}
	self.skills.inside_man.icon_xy = {0, 8}
	self.skills.inside_man.name_id = "menu_inside_man"
	self.skills.inside_man.desc_id = "menu_inside_man_desc"
	self.skills.black_marketeer = {
		{
			upgrades = {"player_buy_cost_multiplier_1"},
			cost = self.costs.default
		},
		{
			upgrades = {"player_buy_cost_multiplier_2", "player_sell_cost_multiplier_1"},
			cost = self.costs.pro
		},
		name_id = "menu_black_marketeer",
		desc_id = "menu_black_marketeer_desc",
		icon_xy = {4, 8}
	}
	self.skills.control_freak[1].upgrades = {"player_civs_show_markers"}
	self.skills.control_freak[2].upgrades = {"player_civ_calming_alerts"}
	self.skills.control_freak.icon_xy = {6, 7}
	self.skills.control_freak.name_id = "menu_control_freak"
	self.skills.control_freak.desc_id = "menu_control_freak_desc"
	self.skills.dominator[1].upgrades = {"player_intimidate_enemies"}
	self.skills.dominator[1].cost = self.costs.hightier
	self.skills.dominator[2].cost = self.costs.hightierpro
	self.skills.dominator.name_id = "menu_dominator"
	self.skills.dominator.desc_id = "menu_dominator_desc"
	self.skills.gunslinger = {
		{
			upgrades = {"pistol_reload_speed_multiplier"},
			cost = self.costs.hightier
		},
		{
			upgrades = {"pistol_damage_addend_1"},
			cost = self.costs.hightierpro
		},
		name_id = "menu_gun_fighter",
		desc_id = "menu_gun_fighter_desc",
		icon_xy = {0, 9}
	}
	self.skills.kilmer = {
		{
			upgrades = {"assault_rifle_reload_speed_multiplier"},
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
		icon_xy = {1, 9}
	}
	self.skills.stockholm_syndrome[1].upgrades = {"player_civilian_reviver", "player_civilian_gives_ammo"}
	self.skills.stockholm_syndrome.name_id = "menu_stockholm_syndrome"
	self.skills.stockholm_syndrome.desc_id = "menu_stockholm_syndrome_desc"
	self.skills.trigger_happy[1].upgrades = {"pistol_stacking_hit_expire_t_1", "pistol_stacking_hit_damage_multiplier_1"}
	self.skills.trigger_happy[2].upgrades = {"pistol_stacking_hit_expire_t_2"}
	self.skills.trigger_happy.icon_xy = {7, 11}
	self.skills.trigger_happy.name_id = "menu_trigger_happy"
	self.skills.trigger_happy.desc_id = "menu_trigger_happy_desc"
	self.skills.messiah[2].upgrades = {"player_messiah_revive_from_bleed_out_2", "player_recharge_messiah_1"}
	self.skills.inspire.name_id = "menu_inspire"
	self.skills.inspire.desc_id = "menu_inspire_desc"

	self.skills.show_of_force = {
		{
			upgrades = {"player_primary_weapon_when_downed"},
			cost = self.costs.default
		},
		{
			upgrades = {"player_armor_regen_timer_multiplier"},
			cost = self.costs.pro
		},
		name_id = "menu_show_of_force",
		desc_id = "menu_show_of_force_desc",
		icon_xy = {1, 2}
	}
	self.skills.underdog.name_id = "menu_underdog"
	self.skills.underdog.desc_id = "menu_underdog_desc"
	self.skills.steroids.icon_xy = {4, 0}
	self.skills.steroids.name_id = "menu_steroids"
	self.skills.steroids.desc_id = "menu_steroids_desc"
	self.skills.oppressor[1].upgrades = {"player_suppression_bonus"}
	self.skills.oppressor[2].upgrades = {"player_suppression_mul_2"}
	self.skills.oppressor.icon_xy = {7, 0}
	self.skills.oppressor.name_id = "menu_oppressor"
	self.skills.oppressor.desc_id = "menu_oppressor_desc"
	self.skills.tough_guy.icon_xy = {1, 1}
	self.skills.tough_guy.name_id = "menu_tough_guy"
	self.skills.tough_guy.desc_id = "menu_tough_guy_desc"
	self.skills.pack_mule = {
		{
			upgrades = {"carry_movement_speed_multiplier"},
			cost = self.costs.default
		},
		{
			upgrades = {"carry_throw_distance_multiplier"},
			cost = self.costs.pro
		},
		name_id = "menu_pack_mule",
		desc_id = "menu_pack_mule_desc",
		icon_xy = {6, 0}
	}
	self.skills.shotgun_impact = {
		{
			upgrades = {"shotgun_recoil_multiplier"},
			cost = self.costs.default
		},
		{
			upgrades = {"shotgun_damage_multiplier_1"},
			cost = self.costs.pro
		},
		name_id = "menu_shotgun_impact",
		desc_id = "menu_shotgun_impact_desc",
		icon_xy = {5, 0}
	}
	self.skills.shades.name_id = "menu_shades"
	self.skills.shades.desc_id = "menu_shades_desc"
	self.skills.scavenger = {
		{
			upgrades = {"player_increased_pickup_area_1"},
			cost = self.costs.default
		},
		{
			upgrades = {"temporary_loose_ammo_give_team"},
			cost = self.costs.pro
		},
		name_id = "menu_scavenger",
		desc_id = "menu_scavenger_desc",
		icon_xy = {4, 5}
	}
	self.skills.shotgun_cqb[2].upgrades = {"shotgun_hip_fire_spread_index_addend", "shotgun_hip_rate_of_fire_1"}
	self.skills.shotgun_cqb.icon_xy = {5, 1}
	self.skills.shotgun_cqb.name_id = "menu_shotgun_cqb"
	self.skills.shotgun_cqb.desc_id = "menu_shotgun_cqb_desc"
	self.skills.wolverine.name_id = "menu_wolverine"
	self.skills.from_the_hip.name_id = "menu_from_the_hip"
	self.skills.from_the_hip.desc_id = "menu_from_the_hip_desc"
	self.skills.from_the_hip[1].upgrades = {"shotgun_enter_steelsight_speed_multiplier"}
	self.skills.from_the_hip[2].upgrades = {"player_shotgun_shield_knock", "player_shotgun_steelsight_shield_knock"}
	self.skills.bandoliers[2].upgrades = {"player_pick_up_ammo_multiplier", "player_pick_up_ammo_multiplier_2"}
	self.skills.bandoliers.name_id = "menu_bandoliers"
	self.skills.bandoliers.desc_id = "menu_bandoliers_desc"
	self.skills.portable_saw[1].upgrades = {"saw"}
	self.skills.portable_saw[2].upgrades = {"saw_extra_ammo_multiplier"}
	self.skills.portable_saw.name_id = "menu_portable_saw"
	self.skills.portable_saw.desc_id = "menu_portable_saw_desc"
	self.skills.overkill[2].upgrades = {"player_overkill_all_weapons", "player_overkill_damage_multiplier_2", "saw_ignore_shields_1", "saw_enemy_slicer"}
	self.skills.overkill.name_id = "menu_overkill"
	self.skills.overkill.desc_id = "menu_overkill_desc"
	self.skills.juggernaut[1].upgrades = {"body_armor6"}
	self.skills.juggernaut[2].upgrades = {"player_shield_knock", "player_run_and_shoot"}
	self.skills.juggernaut.name_id = "menu_juggernaut"
	self.skills.juggernaut.desc_id = "menu_juggernaut_desc"
	self.skills.carbon_blade[1].upgrades = {"player_saw_speed_multiplier_1", "saw_lock_damage_multiplier_1"}
	self.skills.carbon_blade[2].upgrades = {"player_saw_speed_multiplier_2", "saw_lock_damage_multiplier_2", "saw_consume_no_ammo_chance", "saw_reload_speed_multiplier"}
	self.skills.carbon_blade.prerequisites = {"portable_saw"}
	self.skills.carbon_blade.name_id = "menu_carbon_blade"
	self.skills.carbon_blade.desc_id = "menu_carbon_blade_desc"
	
	self.skills.rifleman = {
		{
			upgrades = {
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
		icon_xy = {0, 5}
	}
	self.skills.trip_miner.name_id = "menu_trip_miner"
	self.skills.trip_miner.desc_id = "menu_trip_miner_desc"
	self.skills.discipline[1].upgrades = {"player_steelsight_when_downed"}
	self.skills.discipline[2].upgrades = {"player_interacting_damage_multiplier"}
	self.skills.discipline.name_id = "menu_discipline"
	self.skills.discipline.desc_id = "menu_discipline_desc"
	self.skills.sharpshooter = {
		{
			upgrades = {"weapon_single_spread_multiplier"},
			cost = self.costs.default
		},
		{
			upgrades = {"assault_rifle_recoil_multiplier", "snp_recoil_multiplier"},
			cost = self.costs.pro
		},
		name_id = "menu_sharpshooter",
		desc_id = "menu_sharpshooter_desc",
		icon_xy = {6, 5}
	}
	self.skills.trip_mine_expert = {
		{
			upgrades = {"trip_mine_can_switch_on_off"},
			cost = self.costs.default
		},
		{
			upgrades = {"trip_mine_sensor_toggle", "trip_mine_sensor_highlight"},
			cost = self.costs.pro
		},
		name_id = "menu_trip_mine_expert",
		desc_id = "menu_trip_mine_expert_desc",
		icon_xy = {4, 6}
	}
	self.skills.hardware_expert = {
		{
			upgrades = {"player_drill_fix_interaction_speed_multiplier", "player_trip_mine_deploy_time_multiplier_2"},
			cost = self.costs.default
		},
		{
			upgrades = {"player_drill_autorepair_1", "player_sentry_gun_deploy_time_multiplier"},
			cost = self.costs.pro
		},
		name_id = "menu_hardware_expert",
		desc_id = "menu_hardware_expert_desc",
		icon_xy = {5, 5}
	}
	self.skills.marksman = {
		{
			upgrades = {
				"player_recoil_not_moving_mul",
				"player_recoil_not_moving_aim_mul",
				"weapon_single_spread_index_addend"
			},
			cost = self.costs.default
		},
		{
			upgrades = {
				"player_single_shot_fire_rate_mul",
				"single_shot_accuracy_inc_1"
			},
			cost = self.costs.pro
		},
		name_id = "menu_sharpshooter_beta",
		desc_id = "menu_sharpshooter_beta_desc",
		icon_xy = {6, 12}
	}
	self.skills.combat_engineering = {
		{
			upgrades = {"trip_mine_explosion_size_multiplier_1"},
			cost = self.costs.default
		},
		{
			upgrades = {
				"trip_mine_explosion_size_multiplier_2",
				"trip_mine_marked_enemy_extra_damage"
			},
			cost = self.costs.pro
		},
		name_id = "menu_master_craftsman",
		desc_id = "menu_master_craftsman_desc",
		icon_xy = {6, 9}
	}
	self.skills.sentry_gun[1].upgrades = {"sentry_gun"}
	self.skills.sentry_gun[1].cost = self.costs.hightier
	self.skills.sentry_gun[2].cost = self.costs.hightierpro
	self.skills.sentry_gun.name_id = "menu_sentry_gun"
	self.skills.sentry_gun.desc_id = "menu_sentry_gun_desc"
	self.skills.jack_of_all_trades.icon_xy = {7, 9}
	self.skills.silent_drilling[1].upgrades = {"player_drill_alert"}
	self.skills.silent_drilling[2].upgrades = {"player_silent_drill"}
	self.skills.silent_drilling.name_id = "menu_silent_drilling"
	self.skills.silent_drilling.desc_id = "menu_silent_drilling_desc"
	self.skills.sentry_2_0[1].upgrades = {"sentry_gun_cost_reduction_1"}
	self.skills.sentry_2_0[2].upgrades = {"sentry_gun_shield"}
	self.skills.sentry_2_0.icon_xy = {1, 6}
	self.skills.sentry_2_0.name_id = "menu_sentry_2_0"
	self.skills.sentry_2_0.desc_id = "menu_defense_up_beta_desc"
	self.skills.sentry_2_0.prerequisites = {"sentry_gun"}
	self.skills.shaped_charge.name_id = "menu_shaped_charge"
	self.skills.shaped_charge.desc_id = "menu_shaped_charge_desc"
	self.skills.insulation.name_id = "menu_insulation"
	self.skills.insulation.desc_id = "menu_insulation_desc"
	self.skills.tower_defense = {
		{
			upgrades = {"sentry_gun_quantity_1"},
			cost = self.costs.hightier
		},
		{
			upgrades = {
				"sentry_gun_damage_multiplier",
				"sentry_gun_silent"
			},
			cost = self.costs.hightierpro
		},
		name_id = "menu_sentry_gun_2x",
		desc_id = "menu_sentry_gun_2x_desc",
		prerequisites = {"sentry_gun"},
		icon_xy = {7, 6}
	}
	self.skills.aggressive_shots = {
		{
			upgrades = {"temporary_single_shot_fast_reload_1", "weapon_automatic_head_shot_add_1"},
			cost = self.costs.hightier
		},
		{
			upgrades = {"weapon_automatic_head_shot_add_2", "snp_reload_speed_multiplier"},
			cost = self.costs.hightierpro
		},
		name_id = "menu_aggressive_shots",
		desc_id = "menu_aggressive_shots_desc",
		icon_xy = {2, 0}
	}
	self.skills.iron_man = {
		{
			upgrades = {"player_armor_multiplier"},
			cost = self.costs.hightier
		},
		{
			upgrades = {"team_armor_regen_time_multiplier", "player_passive_always_regen_armor_1"},
			cost = self.costs.hightierpro
		},
		name_id = "menu_iron_man",
		desc_id = "menu_iron_man_desc",
		icon_xy = {6, 4}
	}

	self.skills.martial_arts = {
		{
			upgrades = {"player_melee_knockdown_mul"},
			cost = self.costs.default
		},
		{
			upgrades = {"player_melee_damage_dampener"},
			cost = self.costs.pro
		},
		name_id = "menu_martial_arts",
		desc_id = "menu_martial_arts_desc",
		icon_xy = {1, 3}
	}
	self.skills.sprinter = {
		{
			upgrades = {"player_stamina_regen_timer_multiplier", "player_stamina_regen_multiplier"},
			cost = self.costs.default
		},
		{
			upgrades = {"player_run_dodge_chance", "player_run_speed_multiplier"},
			cost = self.costs.pro
		},
		name_id = "menu_sprinter",
		desc_id = "menu_sprinter_desc",
		icon_xy = {7, 3}
	}
	self.skills.cat_burglar[1].upgrades = {"player_fall_damage_multiplier"}
	self.skills.cat_burglar[2].upgrades = {"player_fall_health_damage_multiplier"}
	self.skills.cat_burglar.name_id = "menu_cat_burglar"
	self.skills.cat_burglar.desc_id = "menu_cat_burglar_desc"
	self.skills.transporter[2].upgrades = {"carry_interact_speed_multiplier_2"}
	self.skills.transporter.name_id = "menu_transporter"
	self.skills.transporter.desc_id = "menu_transporter_desc"
	self.skills.chameleon = {
		{
			upgrades = {"player_suspicion_bonus", "player_sec_camera_highlight_mask_off", "player_special_enemy_highlight_mask_off"},
			cost = self.costs.default
		},
		{
			upgrades = {"player_guards_cant_spot_you_in_casing"},
			cost = self.costs.pro
		},
		name_id = "menu_chameleon",
		desc_id = "menu_chameleon_desc",
		icon_xy = {5, 3}
	}
	self.skills.cleaner = {
		{
			upgrades = {"player_corpse_dispose_amount_1", "player_buy_bodybags_asset"},
			cost = self.costs.default
		},
		{
			upgrades = {"player_corpse_dispose_amount_2"},
			cost = self.costs.pro
		},
		name_id = "menu_cleaner",
		desc_id = "menu_cleaner_desc",
		icon_xy = {7, 2}
	}
	self.skills.assassin[1].upgrades = {"player_walk_speed_multiplier", "player_crouch_speed_multiplier_1"}
	self.skills.assassin.name_id = "menu_assassin"
	self.skills.assassin.desc_id = "menu_assassin_desc"
	self.skills.spotter = {
		{
			upgrades = {"player_mark_enemy_time_multiplier"},
			cost = self.costs.default
		},
		{
			upgrades = {"player_buy_spotter_asset"},
			cost = self.costs.pro
		},
		name_id = "menu_spotter",
		desc_id = "menu_spotter_desc",
		icon_xy = {3, 7}
	}
	self.skills.smg_master.name_id = "menu_smg_master"
	self.skills.smg_master.desc_id = "menu_smg_master_desc"
	self.skills.magic_touch[1].upgrades = {"player_pick_lock_easy", "player_pick_lock_easy_speed_multiplier_1"}
	self.skills.magic_touch[2].upgrades = {"player_pick_lock_hard", "player_pick_lock_easy_speed_multiplier_2"}
	self.skills.magic_touch.name_id = "menu_magic_touch"
	self.skills.magic_touch.desc_id = "menu_magic_touch_desc"
	self.skills.nine_lives[1].upgrades = {"player_additional_lives_1"}
	self.skills.nine_lives[2].upgrades = {"player_cheat_death_chance_1"}
	self.skills.nine_lives.name_id = "menu_nine_lives"
	self.skills.nine_lives.desc_id = "menu_nine_lives_desc"
	self.skills.second_chances = {
		{
			upgrades = {"bodybags_bag", "player_corpse_dispose_speed_multiplier"},
			cost = self.costs.hightier
		},
		{
			upgrades = {"bodybags_bag_quantity"},
			cost = self.costs.hightierpro
		},
		name_id = "menu_second_chances",
		desc_id = "menu_second_chances_desc",
		icon_xy = {5, 11}
	}
	self.skills.ecm_booster[1].upgrades = {"ecm_jammer_duration_multiplier"}
	self.skills.ecm_booster.name_id = "menu_ecm_booster"
	self.skills.ecm_booster.desc_id = "menu_ecm_booster_desc"
	self.skills.hitman = {
		{
			upgrades = {"weapon_silencer_damage_multiplier_1", "weapon_silencer_armor_piercing_chance_1"},
			cost = self.costs.hightier
		},
		{
			upgrades = {"weapon_silencer_damage_multiplier_2", "weapon_silencer_armor_piercing_chance_2"},
			cost = self.costs.hightierpro
		},
		prerequisites = {"silence_expert"},
		name_id = "menu_hitman",
		desc_id = "menu_hitman_desc",
		icon_xy = {5, 9}
	}
	self.skills.low_blow = {
		{
			upgrades = {"player_detection_risk_add_crit_chance_1"},
			cost = self.costs.hightier
		},
		{
			upgrades = {"player_detection_risk_add_crit_chance_2"},
			cost = self.costs.hightierpro
		},
		prerequisites = {"hitman"},
		name_id = "menu_backstab_beta",
		desc_id = "menu_backstab_beta_desc",
		icon_xy = {0, 12}
	}
	self.skills.ecm_feedback[1].upgrades = {"ecm_jammer_can_activate_feedback", "pocket_ecm_jammer", "player_pocket_ecm_jammer_base"}
	self.skills.ecm_feedback[2].upgrades = {"ecm_jammer_feedback_duration_boost", "ecm_jammer_interaction_speed_multiplier", "ecm_jammer_can_retrigger"}
	self.skills.ecm_feedback.name_id = "menu_ecm_feedback"
	self.skills.ecm_feedback.desc_id = "menu_ecm_feedback_desc"
	self.skills.silence_expert[1].upgrades = {
		"weapon_silencer_enter_steelsight_speed_multiplier",
		"weapon_silencer_recoil_multiplier",
		"weapon_silencer_spread_multiplier"
	}
	self.skills.silence_expert[2].upgrades = {
		"player_secondary_silencer_damage_addend"
	}
	self.skills.silence_expert.name_id = "menu_silence_expert"
	self.skills.silence_expert.desc_id = "menu_silence_expert_desc"

	self.skills.master_craftsman = {
		{
			upgrades = {"player_crafting_weapon_multiplier", "player_crafting_mask_multiplier"},
			cost = self.costs.default
		},
		{
			upgrades = {"passive_player_xp_multiplier"},
			cost = self.costs.pro
		},
		name_id = "menu_mastercraftsman",
		desc_id = "menu_mastercraftsman_desc",
		icon_xy = {1, 7}
	}
	self.skills.freedom_call[1].upgrades = {"player_climb_speed_multiplier_1"}
	self.skills.freedom_call.name_id = "menu_freedom_call"
	self.skills.freedom_call.desc_id = "menu_freedom_call_desc"
	self.skills.awareness = {
		{
			upgrades = {"player_steelsight_normal_movement_speed"},
			cost = self.costs.default
		},
		{
			upgrades = {"player_damage_dampener_outnumbered_strong"},
			cost = self.costs.pro
		},
		name_id = "menu_awareness",
		desc_id = "menu_awareness_desc",
		icon_xy = {7, 10}
	}
	self.skills.alpha_dog[2].upgrades = {"player_crouch_dodge_chance_2"}
	self.skills.alpha_dog.name_id = "menu_alpha_dog"
	self.skills.alpha_dog.desc_id = "menu_alpha_dog_desc"
	self.skills.up_you_go[1].cost = self.costs.hightier
	self.skills.up_you_go[2].cost = self.costs.hightierpro
	self.skills.up_you_go[1].upgrades = {"player_revived_health_regain_solid_amount_1", "player_revived_health_regain_solid_wolverine"}
	self.skills.up_you_go[2].upgrades = {"player_revived_health_regain_solid_amount_2", "player_revived_damage_resist_1"}
	self.skills.up_you_go.icon_xy = {4, 13}
	self.skills.hidden_blade = {
		{
			upgrades = {"player_melee_concealment_modifier"},
			cost = self.costs.default
		},
		{
			upgrades = {"player_ballistic_vest_concealment_1"},
			cost = self.costs.pro
		},
		name_id = "menu_thick_skin_beta",
		desc_id = "menu_thick_skin_beta_desc",
		icon_xy = {1, 13}
	}
	self.skills.jail_workout = {
		{
			upgrades = {"player_marked_enemy_extra_damage"},
			cost = self.costs.default
		},
		{
			upgrades = {"player_standstill_omniscience"},
			cost = self.costs.pro
		},
		name_id = "menu_jail_workout",
		desc_id = "menu_jail_workout_desc",
		icon_xy = {6, 10}
	}
	self.skills.running_from_death[1].cost = self.costs.default
	self.skills.running_from_death[2].cost = self.costs.pro
	self.skills.running_from_death.icon_xy = {2, 13}
	self.skills.thick_skin = {
		{
			upgrades = {"player_tier_armor_multiplier_1"},
			cost = self.costs.default
		},
		{
			upgrades = {"player_level_2_armor_addend", "player_level_3_armor_addend", "player_level_4_armor_addend"},
			cost = self.costs.pro
		},
		name_id = "menu_thick_skin",
		desc_id = "menu_thick_skin_desc",
		icon_xy = {2, 12}
	}
	self.skills.tea_time[1].cost = self.costs.default
	self.skills.tea_time[2].cost = self.costs.pro
	self.skills.second_wind = {
		{
			upgrades = {"temporary_damage_speed_multiplier"},
			cost = self.costs.hightier
		},
		{
			upgrades = {"player_level_2_dodge_addend_1", "player_level_3_dodge_addend_1", "player_level_4_dodge_addend_1"},
			cost = self.costs.hightierpro
		},
		name_id = "menu_second_wind",
		desc_id = "menu_second_wind_desc",
		icon_xy = {7, 12}
	}
	self.skills.tea_cookies[2].upgrades = {"chico_injector", "temporary_chico_injector_1", "first_aid_kit_quantity_increase_2"}
	self.skills.tea_cookies.name_id = "menu_tea_cookies"
	self.skills.tea_cookies.desc_id = "menu_tea_cookies_desc"
	self.skills.walking_bleedout = {
		{
			upgrades = {
				"player_walking_bleedout_chance_1",
				"player_walking_bleedout_temporary_health_mul_1",
				"player_walking_bleedout_time_to_bleed_1",
				"player_walking_bleedout_doctor_bag_self_revive"
			},
			cost = self.costs.hightier
		},
		{
			upgrades = {
				"player_walking_bleedout_chance_2",
				"player_walking_bleedout_fak_self_revive"
			},
			cost = self.costs.hightierpro
		},
		name_id = "menu_perseverance",
		desc_id = "menu_walking_bleedout_desc",
		icon_xy = {5, 13}
	}
	self.skills.more_blood_to_bleed = {
		{
			upgrades = {
				"player_walking_bleedout_temporary_health_mul_2"
			},
			cost = self.costs.hightier
		},
		{
			upgrades = {
				"player_walking_bleedout_temporary_health_mul_3",
				"player_walking_bleedout_time_to_bleed_2"
			},
			cost = self.costs.hightierpro
		},
		prerequisites = {"walking_bleedout"},
		name_id = "menu_more_blood_to_bleed",
		desc_id = "menu_more_blood_to_bleed_desc",
		icon_xy = {7, 13}
	}
	self.skills.time_heals = {
		{
			upgrades = {
				"player_walking_bleedout_ticks_to_ressurection_1"
			},
			cost = self.costs.hightier
		},
		{
			upgrades = {
				"player_walking_bleedout_ticks_to_ressurection_2",
				"player_walking_bleedout_fak_self_revive_additional"
			},
			cost = self.costs.hightierpro
		},
		prerequisites = {"walking_bleedout"},
		name_id = "menu_time_heals",
		desc_id = "menu_time_heals_desc",
		icon_xy = {6, 13}
	}
	
	self.skills.akimbo[1].upgrades = {
		"player_unlock_akimbo_pistols",
		"akimbo_recoil_multiplier_1",
		"akimbo_recoil_multiplier_2"
	}
	self.skills.akimbo[2].upgrades = {"akimbo_extra_ammo_multiplier_1", "akimbo_extra_ammo_multiplier_2", "akimbo_recoil_multiplier_3"}
	self.skills.akimbo.name_id = "menu_akimbo_skill"
	self.skills.akimbo.desc_id = "menu_akimbo_skill_desc"
	self.skills.bloodthirst.icon_xy = {0, 6}
	self.skills.backstab = {
		{
			upgrades = {"player_counter_strike_spooc"},
			cost = self.costs.hightier
		},
		{
			upgrades = {"player_melee_kill_snatch_pager_chance"},
			cost = self.costs.hightierpro
		},
		name_id = "menu_backstab",
		desc_id = "menu_backstab_desc",
		icon_xy = {2, 10}
	}
	self.skills.gunzerker = {
		{
			upgrades = {
				"player_unlock_akimbo_shotguns"
			},
			cost = self.costs.hightier
		},
		{
			upgrades = {
				"player_unlock_akimbo_smg"
			},
			cost = self.costs.hightierpro
		},
		name_id = "menu_gunzerker",
		desc_id = "menu_gunzerker_desc",
		prerequisites = {"akimbo"},
		icon_xy = {0, 13}
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
						"team_xp_multiplier",
						"player_loot_drop_multiplier_2"
					},
				cost = very_low,
				icon_xy = {0, 14},
				name_id = "menu_bonus_exp",
				desc_id = "menu_bonus_exp_detailed_desc"
			}
		},
		{
			name_id = "menu_bonus_small_money",
			desc_id = "menu_bonus_small_money_desc",
			{
				upgrades = {
					"player_small_loot_multiplier_1",
					"player_reduce_loose_money_exp_convertation_amount_mul"
				},
				cost = very_low,
				icon_xy = {1, 14},
				name_id = "menu_bonus_small_money",
				desc_id = "menu_bonus_small_money_detailed_desc"
			}
		},
		{
			name_id = "menu_good_luck_charm",
			desc_id = "menu_good_luck_charm_desc",
			{
				upgrades = {"player_tape_loop_duration_2"},
				cost = medium,
				icon_xy = {4, 2},
				name_id = "menu_good_luck_charm",
				desc_id = "menu_good_luck_charm_detailed_desc"
			}
		},
		{
			name_id = "menu_triathlete",
			desc_id = "menu_triathlete_desc",
			{
				upgrades = {
					"team_stamina_multiplier",
					"player_movement_speed_multiplier",
					"player_can_free_run"
				},
				cost = low,
				icon_xy = {2, 14},
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
					"player_convert_enemies_damage_multiplier"
				},
				cost = high,
				icon_xy = {3, 14},
				name_id = "menu_joker",
				desc_id = "menu_joker_detailed_desc"
			}
		},
		{
			name_id = "menu_ammo_reservoir",
			desc_id = "menu_ammo_reservoir_desc",
			{
				upgrades = {
					"temporary_no_ammo_cost_1",
					"weapon_clip_ammo_increase_1"
				},
				cost = medium,
				icon_xy = {4, 14},
				name_id = "menu_ammo_reservoir",
				desc_id = "menu_ammo_reservoir_detailed_desc"
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
				icon_xy = {5, 14},
				name_id = "menu_fire_trap_beta",
				desc_id = "menu_fire_trap_detailed_desc"
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
				icon_xy = {6, 14},
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
				icon_xy = {7, 14},
				name_id = "menu_infiltrator",
				desc_id = "menu_infiltrator_detailed_desc"
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
				icon_xy = {0, 15},
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
				icon_xy = {1, 15},
				name_id = "menu_hostage_situation",
				desc_id = "menu_hostage_situation_detailed_desc"
			}
		}
	}
end