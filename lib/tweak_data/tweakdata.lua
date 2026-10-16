local self = tweak_data.skilltree
local digest = function(value)
	return Application:digest_value(value, true)
end

self.tier_cost = { 	
	{1, 3}, 	
	{1, 3}, 	
	{1, 3}, 	
	{4, 8}, 	
	{4, 8}, 	
	{4, 8}
}

self.tier_unlocks = {
	digest(1),
	digest(5),
	digest(10),
	digest(20),
	digest(30),
	digest(40)
}

self.costs = {
	unlock_tree = digest(1),
	default = digest(1),
	pro = digest(3),
	hightier = digest(4),
	hightierpro = digest(8)
}

self.skills.mastermind = {
	name_id = "menu_mastermind",
	desc_id = "menu_mastermind_desc",
	icon_xy = {2, 7},
	[1] = {
		upgrades = {"doctor_bag"},
		cost = self.costs.unlock_tree,
		desc_id = "menu_mastermind_tier_1"
	},
	[2] = {
		upgrades = {},
		desc_id = "menu_mastermind_tier_2"
	},
	[3] = {
		upgrades = {},
		desc_id = "menu_mastermind_tier_3"
	},
	[4] = {
		upgrades = {},
		desc_id = "menu_mastermind_tier_4"
	},
	[5] = {
		upgrades = {},
		desc_id = "menu_mastermind_tier_5"
	},
	[6] = {
		upgrades = {},
		desc_id = "menu_mastermind_tier_6"
	}
}
self.skills.enforcer = {
	name_id = "menu_enforcer",
	desc_id = "menu_enforcer_desc",
	icon_xy = {1, 0},
	[1] = {
		upgrades = {"ammo_bag"},
		cost = self.costs.unlock_tree,
		desc_id = "menu_menu_enforcer_tier_1"
	},
	[2] = {
		upgrades = {},
		desc_id = "menu_menu_enforcer_tier_2"
	},
	[3] = {
		upgrades = {},
		desc_id = "menu_menu_enforcer_tier_3"
	},
	[4] = {
		upgrades = {},
		desc_id = "menu_menu_enforcer_tier_4"
	},
	[5] = {
		upgrades = {},
		desc_id = "menu_menu_enforcer_tier_5"
	},
	[6] = {
		upgrades = {},
		desc_id = "menu_menu_enforcer_tier_6"
	}
}
self.skills.technician = {
	name_id = "menu_technician",
	desc_id = "menu_technician_desc",
	icon_xy = {7, 4},
	[1] = {
		upgrades = {"trip_mine"},
		cost = self.costs.unlock_tree,
		desc_id = "menu_technician_tier_1"
	},
	[2] = {
		upgrades = {},
		desc_id = "menu_technician_tier_2"
	},
	[3] = {
		upgrades = {},
		desc_id = "menu_technician_tier_3"
	},
	[4] = {
		upgrades = {},
		desc_id = "menu_technician_tier_4"
	},
	[5] = {
		upgrades = {},
		desc_id = "menu_technician_tier_5"
	},
	[6] = {
		upgrades = {},
		desc_id = "menu_technician_tier_6"
	}
}
self.skills.ghost = {
	name_id = "menu_ghost",
	desc_id = "menu_ghost_desc",
	icon_xy = {1, 4},
	[1] = {
		upgrades = {
			"ecm_jammer",
			"ecm_jammer_affects_cameras"
		},
		cost = self.costs.unlock_tree,
		desc_id = "menu_ghost_tier_1"
	},
	[2] = {
		upgrades = {},
		desc_id = "menu_ghost_tier_2"
	},
	[3] = {
		upgrades = {},
		desc_id = "menu_ghost_tier_3"
	},
	[4] = {
		upgrades = {},
		desc_id = "menu_ghost_tier_4"
	},
	[5] = {
		upgrades = {},
		desc_id = "menu_ghost_tier_5"
	},
	[6] = {
		upgrades = {},
		desc_id = "menu_ghost_tier_6"
	}
}
self.skills.hoxton = {
	name_id = "menu_hoxton_pack",
	desc_id = "menu_hoxton_pack_desc",
	icon_xy = {3, 10},
	[1] = {
		upgrades = {
			"first_aid_kit"
		},
		cost = self.costs.unlock_tree,
		desc_id = "menu_hoxton_tier_1"
	},
	[2] = {
		upgrades = {},
		desc_id = "menu_hoxton_tier_2"
	},
	[3] = {
		upgrades = {},
		desc_id = "menu_hoxton_tier_3"
	},
	[4] = {
		upgrades = {},
		desc_id = "menu_hoxton_tier_4"
	},
	[5] = {
		upgrades = {},
		desc_id = "menu_hoxton_tier_5"
	},
	[6] = {
		upgrades = {},
		desc_id = "menu_hoxton_tier_6"
	}
}
self.skills.black_marketeer = {
	name_id = "menu_black_marketeer",
	desc_id = "menu_black_marketeer_desc",
	icon_xy = {2, 10},
	[1] = {
		upgrades = {
			"player_hostage_health_regen_addend_1"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"player_hostage_health_regen_addend_2"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.gun_fighter = {
	name_id = "menu_gun_fighter",
	desc_id = "menu_gun_fighter_desc",
	icon_xy = {0, 9},
	[1] = {
		upgrades = {
			"pistol_reload_speed_multiplier"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"pistol_damage_addend"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.combat_medic = {
	name_id = "menu_combat_medic",
	desc_id = "menu_combat_medic_desc",
	icon_xy = {5, 7},
	[1] = {
		upgrades = {
			"temporary_combat_medic_damage_multiplier1"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"player_revive_health_boost"
		},
		cost = self.costs.pro
	}
}
self.skills.control_freak = {
	name_id = "menu_control_freak",
	desc_id = "menu_control_freak_desc",
	icon_xy = {1, 10},
	prerequisites = {"joker"},
	[1] = {
		upgrades = {
			"player_minion_master_speed_multiplier",
			"player_passive_convert_enemies_health_multiplier_1"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"player_minion_master_health_multiplier",
			"player_passive_convert_enemies_health_multiplier_2"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.leadership = {
	name_id = "menu_leadership",
	desc_id = "menu_leadership_desc",
	icon_xy = {7, 7},
	[1] = {
		upgrades = {
			"team_pistol_recoil_index_addend",
			"team_pistol_suppression_recoil_index_addend"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"team_weapon_recoil_index_addend",
			"team_weapon_suppression_recoil_index_addend"
		},
		cost = self.costs.pro
	}
}
self.skills.inside_man = {
	name_id = "menu_inside_man",
	desc_id = "menu_inside_man_desc",
	icon_xy = {6, 7},
	[1] = {
		upgrades = {
			"player_civ_calming_alerts",
			"player_civ_intimidation_mul"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"player_additional_assets"
		},
		cost = self.costs.pro
	}
}
self.skills.target_mark = {
	name_id = "menu_target_mark",
	desc_id = "menu_target_mark_desc",
	icon_xy = {3, 7},
	[1] = {
		upgrades = {},
		cost = self.costs.default
	},
	[2] = {
		cost = self.costs.pro
	}
}
self.skills.dominator = {
	name_id = "menu_dominator",
	desc_id = "menu_dominator_desc",
	icon_xy = {2, 8},
	[1] = {
		upgrades = {
			"player_intimidate_enemies"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"player_intimidate_range_mul",
			"player_intimidate_aura"
		},
		cost = self.costs.pro
	}
}
self.skills.fast_learner = {
	name_id = "menu_fast_learner",
	desc_id = "menu_fast_learner_desc",
	icon_xy = {0, 10},
	[1] = {
		upgrades = {
			"player_revive_damage_reduction_level_1"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"player_revive_damage_reduction_level_2"
		},
		cost = self.costs.pro
	}
}
self.skills.stockholm_syndrome = {
	name_id = "menu_stockholm_syndrome",
	desc_id = "menu_stockholm_syndrome_desc",
	icon_xy = {3, 8},
	[1] = {
		upgrades = {
			"player_civilian_reviver"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"player_civilian_gives_ammo"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.cable_guy = {
	name_id = "menu_cable_guy",
	desc_id = "menu_cable_guy_desc",
	icon_xy = {4, 7},
	[1] = {
		upgrades = {
			"cable_tie_interact_speed_multiplier"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"cable_tie_quantity"
		},
		cost = self.costs.pro
	}
}
self.skills.tactician = {
	name_id = "menu_tactician",
	desc_id = "menu_tactician_desc",
	icon_xy = {3, 7},
	[1] = {
		upgrades = {
			"player_marked_enemy_extra_damage"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"player_buy_spotter_asset"
		},
		cost = self.costs.pro
	}
}
self.skills.triathlete = {
	name_id = "menu_triathlete",
	desc_id = "menu_triathlete_desc",
	icon_xy = {1, 8},
	[1] = {
		upgrades = {
			"player_stamina_multiplier"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"team_stamina_multiplier"
		},
		cost = self.costs.pro
	}
}
self.skills.kilmer = {
	name_id = "menu_kilmer",
	desc_id = "menu_kilmer_desc",
	icon_xy = {1, 9},
	[1] = {
		upgrades = {
			"assault_rifle_reload_speed_multiplier",
			"snp_reload_speed_multiplier"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"assault_rifle_move_spread_index_addend",
			"player_run_and_reload",
			"snp_move_spread_index_addend"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.equilibrium = {
	name_id = "menu_equilibrium",
	desc_id = "menu_equilibrium_desc",
	icon_xy = {3, 9},
	[1] = {
		upgrades = {
			"pistol_spread_index_addend",
			"pistol_swap_speed_multiplier"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"pistol_fire_rate_multiplier"
		},
		cost = self.costs.pro
	}
}
self.skills.negotiator = {
	name_id = "menu_negotiator",
	desc_id = "menu_negotiator_desc",
	icon_xy = {7, 8},
	[1] = {
		cost = self.costs.hightier
	},
	[2] = {
		cost = self.costs.hightierpro
	}
}
self.skills.medic_2x = {
	name_id = "menu_medic_2x",
	desc_id = "menu_medic_2x_desc",
	icon_xy = {5, 8},
	[1] = {
		upgrades = {
			"doctor_bag_quantity"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"doctor_bag_amount_increase1"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.joker = {
	name_id = "menu_joker",
	desc_id = "menu_joker_desc",
	icon_xy = {6, 8},
	prerequisites = {"dominator"},
	[1] = {
		upgrades = {
			"player_convert_enemies",
			"player_convert_enemies_max_minions_1"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"player_convert_enemies_health_multiplier",
			"player_convert_enemies_damage_multiplier",
			"player_convert_enemies_interaction_speed_multiplier"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.pistol_messiah = {
	name_id = "menu_pistol_messiah",
	desc_id = "menu_pistol_messiah_desc",
	icon_xy = {2, 9},
	[1] = {
		upgrades = {
			"player_pistol_revive_from_bleed_out_1"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"player_pistol_revive_from_bleed_out_2"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.ammo_reservoir = {
	name_id = "menu_ammo_reservoir",
	desc_id = "menu_ammo_reservoir_desc",
	icon_xy = {4, 5},
	[1] = {
		upgrades = {
			"temporary_no_ammo_cost_1"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"temporary_no_ammo_cost_2"
		},
		cost = self.costs.pro
	}
}
self.skills.demolition_man = {
	name_id = "menu_demolition_man",
	desc_id = "menu_demolition_man_desc",
	icon_xy = {4, 5},
	[1] = {
		upgrades = {},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {},
		cost = self.costs.pro
	}
}
self.skills.oppressor = {
	name_id = "menu_oppressor",
	desc_id = "menu_oppressor_desc",
	icon_xy = {7, 0},
	[1] = {
		upgrades = {
			"player_suppression_bonus"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"player_suppression_mul_2"
		},
		cost = self.costs.pro
	}
}
self.skills.steroids = {
	name_id = "menu_steroids",
	desc_id = "menu_steroids_desc",
	icon_xy = {4, 0},
	[1] = {
		upgrades = {
			"player_non_special_melee_multiplier"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"player_melee_damage_multiplier"
		},
		cost = self.costs.pro
	}
}
self.skills.bandoliers = {
	name_id = "menu_bandoliers",
	desc_id = "menu_bandoliers_desc",
	icon_xy = {3, 0},
	[1] = {
		upgrades = {
			"extra_ammo_multiplier1"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"player_pick_up_ammo_multiplier",
			"player_pick_up_ammo_multiplier_2",
			"player_regain_throwable_from_ammo_1"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.pack_mule = {
	name_id = "menu_pack_mule",
	desc_id = "menu_pack_mule_desc",
	icon_xy = {6, 0},
	[1] = {
		upgrades = {
			"carry_movement_speed_multiplier"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"carry_throw_distance_multiplier"
		},
		cost = self.costs.pro
	}
}
self.skills.shotgun_impact = {
	name_id = "menu_shotgun_impact",
	desc_id = "menu_shotgun_impact_desc",
	icon_xy = {5, 0},
	[1] = {
		upgrades = {
			"shotgun_recoil_index_addend"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"shotgun_damage_multiplier"
		},
		cost = self.costs.pro
	}
}
self.skills.portable_saw = {
	name_id = "menu_portable_saw",
	desc_id = "menu_portable_saw_desc",
	icon_xy = {0, 1},
	[1] = {
		upgrades = {"saw"},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"saw_extra_ammo_multiplier"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.tough_guy = {
	name_id = "menu_tough_guy",
	desc_id = "menu_tough_guy_desc",
	icon_xy = {1, 1},
	[1] = {
		upgrades = {
			"player_damage_shake_multiplier"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"player_bleed_out_health_multiplier"
		},
		cost = self.costs.pro
	}
}
self.skills.underdog = {
	name_id = "menu_underdog",
	desc_id = "menu_underdog_desc",
	icon_xy = {2, 1},
	[1] = {
		upgrades = {
			"player_damage_multiplier_outnumbered"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"player_damage_dampener_outnumbered"
		},
		cost = self.costs.pro
	}
}
self.skills.juggernaut = {
	name_id = "menu_juggernaut",
	desc_id = "menu_juggernaut_desc",
	icon_xy = {3, 1},
	[1] = {
		upgrades = {
			"body_armor6"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"player_shield_knock",
			"player_run_and_shoot"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.from_the_hip = {
	name_id = "menu_from_the_hip",
	desc_id = "menu_from_the_hip_desc",
	icon_xy = {4, 1},
	[1] = {
		upgrades = {
			"shotgun_hip_fire_spread_index_addend"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"weapon_hip_fire_spread_index_addend"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.shotgun_cqb = {
	name_id = "menu_shotgun_cqb",
	desc_id = "menu_shotgun_cqb_desc",
	icon_xy = {5, 1},
	[1] = {
		upgrades = {
			"shotgun_reload_speed_multiplier"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"shotgun_enter_steelsight_speed_multiplier"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.shades = {
	name_id = "menu_shades",
	desc_id = "menu_shades_desc",
	icon_xy = {6, 1},
	[1] = {
		upgrades = {
			"player_flashbang_multiplier_1"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"player_flashbang_multiplier_2"
		},
		cost = self.costs.pro
	}
}
self.skills.ammo_2x = {
	name_id = "menu_ammo_2x",
	desc_id = "menu_ammo_2x_desc",
	icon_xy = {7, 1},
	[1] = {
		upgrades = {
			"ammo_bag_quantity"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"ammo_bag_ammo_increase1"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.carbon_blade = {
	name_id = "menu_carbon_blade",
	desc_id = "menu_carbon_blade_desc",
	icon_xy = {0, 2},
	prerequisites = {
		"portable_saw"
	},
	[1] = {
		upgrades = {
			"player_saw_speed_multiplier_1",
			"saw_lock_damage_multiplier_1"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"player_saw_speed_multiplier_2",
			"saw_lock_damage_multiplier_2",
			"saw_enemy_slicer",
			"saw_secondary"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.show_of_force = {
	name_id = "menu_show_of_force",
	desc_id = "menu_show_of_force_desc",
	icon_xy = {1, 2},
	[1] = {
		upgrades = {
			"player_primary_weapon_when_downed"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"player_armor_regen_timer_multiplier"
		},
		cost = self.costs.pro
	}
}
self.skills.wolverine = {
	name_id = "menu_wolverine",
	desc_id = "menu_wolverine_desc",
	icon_xy = {2, 2},
	[1] = {
		upgrades = {
			"player_melee_damage_health_ratio_multiplier"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"player_damage_health_ratio_multiplier"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.overkill = {
	name_id = "menu_overkill",
	desc_id = "menu_overkill_desc",
	icon_xy = {3, 2},
	[1] = {
		upgrades = {
			"player_overkill_damage_multiplier"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"player_overkill_all_weapons"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.mag_plus = {
	name_id = "menu_mag_plus",
	desc_id = "menu_mag_plus_desc",
	icon_xy = {2, 0},
	[1] = {
		upgrades = {
			"weapon_clip_ammo_increase_1"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"weapon_clip_ammo_increase_2"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.iron_man = {
	name_id = "menu_iron_man",
	desc_id = "menu_iron_man_desc",
	icon_xy = {6, 4},
	[1] = {
		upgrades = {
			"player_armor_multiplier"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"team_armor_regen_time_multiplier"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.rifleman = {
	name_id = "menu_rifleman",
	desc_id = "menu_rifleman_desc",
	icon_xy = {0, 5},
	[1] = {
		upgrades = {
			"assault_rifle_enter_steelsight_speed_multiplier",
			"snp_enter_steelsight_speed_multiplier"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"assault_rifle_zoom_increase",
			"snp_zoom_increase"
		},
		cost = self.costs.pro
	}
}
self.skills.blast_radius = {
	name_id = "menu_blast_radius",
	desc_id = "menu_blast_radius_desc",
	icon_xy = {7, 9},
	[1] = {
		upgrades = {
			"trip_mine_explosion_size_multiplier_2"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"player_carry_sentry_and_trip"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.insulation = {
	name_id = "menu_insulation",
	desc_id = "menu_insulation_desc",
	icon_xy = {3, 5},
	[1] = {
		upgrades = {
			"player_taser_malfunction"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"player_taser_self_shock"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.hardware_expert = {
	name_id = "menu_hardware_expert",
	desc_id = "menu_hardware_expert_desc",
	icon_xy = {5, 5},
	[1] = {
		upgrades = {
			"player_drill_fix_interaction_speed_multiplier",
			"player_trip_mine_deploy_time_multiplier_2"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"player_drill_autorepair",
			"player_sentry_gun_deploy_time_multiplier"
		},
		cost = self.costs.pro
	}
}
self.skills.trip_mine_expert = {
	name_id = "menu_trip_mine_expert",
	desc_id = "menu_trip_mine_expert_desc",
	icon_xy = {4, 6},
	[1] = {
		upgrades = {
			"trip_mine_can_switch_on_off"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"trip_mine_sensor_toggle",
			"trip_mine_sensor_highlight"
		},
		cost = self.costs.pro
	}
}
self.skills.sharpshooter = {
	name_id = "menu_sharpshooter",
	desc_id = "menu_sharpshooter_desc",
	icon_xy = {6, 5},
	[1] = {
		upgrades = {
			"weapon_single_spread_index_addend"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"assault_rifle_recoil_index_addend",
			"snp_recoil_index_addend"
		},
		cost = self.costs.pro
	}
}
self.skills.sentry_gun = {
	name_id = "menu_sentry_gun",
	desc_id = "menu_sentry_gun_desc",
	icon_xy = {7, 5},
	[1] = {
		upgrades = {"sentry_gun"},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"sentry_gun_armor_multiplier"
		},
		cost = self.costs.pro
	}
}
self.skills.sentry_targeting_package = {
	name_id = "menu_sentry_targeting_package",
	desc_id = "menu_sentry_targeting_package_desc",
	icon_xy = {1, 6},
	prerequisites = {"sentry_gun"},
	[1] = {
		upgrades = {
			"sentry_gun_spread_multiplier"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"sentry_gun_rot_speed_multiplier",
			"sentry_gun_extra_ammo_multiplier_1"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.sentry_2_0 = {
	name_id = "menu_sentry_2_0",
	desc_id = "menu_sentry_2_0_desc",
	icon_xy = {5, 6},
	prerequisites = {"sentry_gun"},
	[1] = {
		upgrades = {
			"sentry_gun_can_reload"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"sentry_gun_shield"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.drill_expert = {
	name_id = "menu_drill_expert",
	desc_id = "menu_drill_expert_desc",
	icon_xy = {3, 6},
	[1] = {
		upgrades = {
			"player_drill_speed_multiplier1"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"player_drill_speed_multiplier2"
		},
		cost = self.costs.pro
	}
}
self.skills.silent_drilling = {
	name_id = "menu_silent_drilling",
	desc_id = "menu_silent_drilling_desc",
	icon_xy = {2, 6},
	[1] = {
		upgrades = {
			"player_drill_alert"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"player_silent_drill"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.discipline = {
	name_id = "menu_discipline",
	desc_id = "menu_discipline_desc",
	icon_xy = {6, 6},
	[1] = {
		upgrades = {
			"player_interacting_damage_multiplier"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"player_steelsight_when_downed"
		},
		cost = self.costs.pro
	}
}
self.skills.trip_miner = {
	name_id = "menu_trip_miner",
	desc_id = "menu_trip_miner_desc",
	icon_xy = {2, 5},
	[1] = {
		upgrades = {
			"trip_mine_quantity_increase_1"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"player_trip_mine_deploy_time_multiplier"
		},
		cost = self.costs.pro
	}
}
self.skills.shaped_charge = {
	name_id = "menu_shaped_charge",
	desc_id = "menu_shaped_charge_desc",
	icon_xy = {0, 7},
	[1] = {
		upgrades = {
			"trip_mine_quantity_increase_2"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"player_trip_mine_shaped_charge"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.master_craftsman = {
	name_id = "menu_master_craftsman",
	desc_id = "menu_master_craftsman_desc",
	icon_xy = {6, 9},
	[1] = {
		upgrades = {
			"trip_mine_explosion_size_multiplier_1"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"trip_mine_marked_enemy_extra_damage"
		},
		cost = self.costs.pro
	}
}
self.skills.sentry_gun_2x = {
	name_id = "menu_sentry_gun_2x",
	desc_id = "menu_sentry_gun_2x_desc",
	icon_xy = {7, 6},
	prerequisites = {"sentry_gun"},
	[1] = {
		upgrades = {
			"sentry_gun_quantity_increase"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"sentry_gun_damage_multiplier"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.ecm_booster = {
	name_id = "menu_ecm_booster",
	desc_id = "menu_ecm_booster_desc",
	icon_xy = {6, 3},
	[1] = {
		upgrades = {
			"ecm_jammer_duration_multiplier"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"ecm_jammer_can_open_sec_doors"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.sprinter = {
	name_id = "menu_sprinter",
	desc_id = "menu_sprinter_desc",
	icon_xy = {7, 3},
	[1] = {
		upgrades = {
			"player_stamina_regen_timer_multiplier",
			"player_stamina_regen_multiplier"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"player_run_dodge_chance",
			"player_run_speed_multiplier"
		},
		cost = self.costs.pro
	}
}
self.skills.smg_training = {
	name_id = "menu_smg_training",
	desc_id = "menu_smg_training_desc",
	icon_xy = {3, 3},
	[1] = {
		upgrades = {
			"smg_reload_speed_multiplier"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"smg_recoil_multiplier"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.smg_master = {
	name_id = "menu_smg_master",
	desc_id = "menu_smg_master_desc",
	icon_xy = {3, 3},
	[1] = {
		upgrades = {
			"smg_reload_speed_multiplier"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"smg_fire_rate_multiplier"
		},
		cost = self.costs.pro
	}
}
self.skills.transporter = {
	name_id = "menu_transporter",
	desc_id = "menu_transporter_desc",
	icon_xy = {4, 3},
	[1] = {
		upgrades = {
			"carry_interact_speed_multiplier_1"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"carry_interact_speed_multiplier_2"
		},
		cost = self.costs.pro
	}
}
self.skills.cat_burglar = {
	name_id = "menu_cat_burglar",
	desc_id = "menu_cat_burglar_desc",
	icon_xy = {0, 4},
	[1] = {
		upgrades = {
			"player_fall_damage_multiplier"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"player_fall_health_damage_multiplier",
			"player_respawn_time_multiplier"
		},
		cost = self.costs.pro
	}
}
self.skills.chameleon = {
	name_id = "menu_chameleon",
	desc_id = "menu_chameleon_desc",
	icon_xy = {5, 3},
	[1] = {
		upgrades = {
			"player_suspicion_bonus",
			"player_sec_camera_highlight_mask_off",
			"player_special_enemy_highlight_mask_off"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"player_camouflage_bonus"
		},
		cost = self.costs.pro
	}
}
self.skills.cleaner = {
	name_id = "menu_cleaner",
	desc_id = "menu_cleaner_desc",
	icon_xy = {7, 2},
	[1] = {
		upgrades = {
			"player_buy_bodybags_asset",
			"weapon_special_damage_taken_multiplier"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"player_corpse_dispose_amount_2"
		},
		cost = self.costs.pro
	}
}
self.skills.ecm_2x = {
	name_id = "menu_ecm_2x",
	desc_id = "menu_ecm_2x_desc",
	icon_xy = {3, 4},
	[1] = {
		upgrades = {
			"ecm_jammer_quantity_increase_1"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"ecm_jammer_duration_multiplier_2",
			"ecm_jammer_feedback_duration_boost_2",
			"ecm_jammer_affects_pagers"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.assassin = {
	name_id = "menu_assassin",
	desc_id = "menu_assassin_desc",
	icon_xy = {0, 3},
	[1] = {
		upgrades = {
			"player_walk_speed_multiplier",
			"player_crouch_speed_multiplier"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"player_silent_kill"
		},
		cost = self.costs.pro
	}
}
self.skills.martial_arts = {
	name_id = "menu_martial_arts",
	desc_id = "menu_martial_arts_desc",
	icon_xy = {1, 3},
	[1] = {
		upgrades = {
			"player_melee_knockdown_mul"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"player_melee_damage_dampener"
		},
		cost = self.costs.pro
	}
}
self.skills.nine_lives = {
	name_id = "menu_nine_lives",
	desc_id = "menu_nine_lives_desc",
	icon_xy = {5, 2},
	[1] = {
		upgrades = {
			"player_additional_lives_1"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"player_cheat_death_chance"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.ecm_feedback = {
	name_id = "menu_ecm_feedback",
	desc_id = "menu_ecm_feedback_desc",
	icon_xy = {6, 2},
	[1] = {
		upgrades = {
			"ecm_jammer_can_activate_feedback"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"ecm_jammer_feedback_duration_boost",
			"ecm_jammer_interaction_speed_multiplier",
			"ecm_jammer_can_retrigger"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.moving_target = {
	name_id = "menu_moving_target",
	desc_id = "menu_moving_target_desc",
	icon_xy = {2, 4},
	[1] = {
		upgrades = {
			"player_can_strafe_run"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"player_can_free_run"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.scavenger = {
	name_id = "menu_scavenger",
	desc_id = "menu_scavenger_desc",
	icon_xy = {2, 3},
	[1] = {
		upgrades = {
			"player_small_loot_multiplier1"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"player_small_loot_multiplier2"
		},
		cost = self.costs.pro
	}
}
self.skills.hitman = {
	name_id = "menu_hitman",
	desc_id = "menu_hitman_desc",
	icon_xy = {5, 9},
	[1] = {
		upgrades = {
			"weapon_silencer_damage_multiplier_1"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"weapon_silencer_damage_multiplier_2",
			"weapon_silencer_armor_piercing_chance_1"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.silence_expert = {
	name_id = "menu_silence_expert",
	desc_id = "menu_silence_expert_desc",
	icon_xy = {4, 4},
	[1] = {
		upgrades = {
			"weapon_silencer_recoil_index_addend",
			"weapon_silencer_enter_steelsight_speed_multiplier"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"weapon_silencer_spread_index_addend",
			"weapon_silencer_armor_piercing_chance_2"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.good_luck_charm = {
	name_id = "menu_good_luck_charm",
	desc_id = "menu_good_luck_charm_desc",
	icon_xy = {4, 2},
	[1] = {
		upgrades = {
			"player_tape_loop_duration_1"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"player_tape_loop_duration_2"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.disguise = {
	name_id = "menu_disguise",
	desc_id = "menu_disguise_desc",
	icon_xy = {6, 4},
	[1] = {
		cost = self.costs.hightier
	},
	[2] = {
		cost = self.costs.hightierpro
	}
}
self.skills.magic_touch = {
	name_id = "menu_magic_touch",
	desc_id = "menu_magic_touch_desc",
	icon_xy = {5, 4},
	[1] = {
		upgrades = {
			"player_pick_lock_easy",
			"player_pick_lock_easy_speed_multiplier"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"player_pick_lock_hard",
			"player_pick_lock_easy_speed_multiplier_2"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.freedom_call = {
	name_id = "menu_freedom_call",
	desc_id = "menu_freedom_call_desc",
	icon_xy = {5, 10},
	[1] = {
		upgrades = {
			"player_climb_speed_multiplier_1"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"player_on_zipline_dodge_chance"
		},
		cost = self.costs.pro
	}
}
self.skills.hidden_blade = {
	name_id = "menu_hidden_blade",
	desc_id = "menu_hidden_blade_desc",
	icon_xy = {4, 10},
	[1] = {
		upgrades = {
			"player_melee_concealment_modifier"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"player_silent_kill"
		},
		cost = self.costs.pro
	}
}
self.skills.tea_time = {
	name_id = "menu_tea_time",
	desc_id = "menu_tea_time_desc",
	icon_xy = {1, 11},
	[1] = {
		upgrades = {
			"first_aid_kit_deploy_time_multiplier"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"first_aid_kit_damage_reduction_upgrade"
		},
		cost = self.costs.pro
	}
}
self.skills.awareness = {
	name_id = "menu_awareness",
	desc_id = "menu_awareness_desc",
	icon_xy = {7, 10},
	[1] = {
		upgrades = {
			"player_movement_speed_multiplier"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"player_steelsight_normal_movement_speed"
		},
		cost = self.costs.pro
	}
}
self.skills.alpha_dog = {
	name_id = "menu_alpha_dog",
	desc_id = "menu_alpha_dog_desc",
	icon_xy = {0, 11},
	[1] = {
		upgrades = {
			"player_crouch_dodge_chance_1"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"player_crouch_dodge_chance_2"
		},
		cost = self.costs.pro
	}
}
self.skills.tea_cookies = {
	name_id = "menu_tea_cookies",
	desc_id = "menu_tea_cookies_desc",
	icon_xy = {2, 11},
	[1] = {
		upgrades = {
			"first_aid_kit_quantity_increase_1"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"first_aid_kit_quantity_increase_2"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.cell_mates = {
	name_id = "menu_cell_mates",
	desc_id = "menu_cell_mates_desc",
	icon_xy = {4, 11},
	[1] = {
		upgrades = {
			"player_gangster_damage_dampener_1"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"player_gangster_damage_dampener_2"
		},
		cost = self.costs.pro
	}
}
self.skills.thug_life = {
	name_id = "menu_thug_life",
	desc_id = "menu_thug_life_desc",
	icon_xy = {3, 12},
	[1] = {
		upgrades = {
			"player_extra_corpse_dispose_amount"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"player_cleaner_cost_multiplier"
		},
		cost = self.costs.pro
	}
}
self.skills.thick_skin = {
	name_id = "menu_thick_skin",
	desc_id = "menu_thick_skin_desc",
	icon_xy = {2, 12},
	[1] = {
		upgrades = {
			"player_damage_shake_addend"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"player_level_2_armor_addend",
			"player_level_3_armor_addend",
			"player_level_4_armor_addend"
		},
		cost = self.costs.pro
	}
}
self.skills.backstab = {
	name_id = "menu_backstab",
	desc_id = "menu_backstab_desc",
	icon_xy = {0, 12},
	[1] = {
		upgrades = {
			"player_detection_risk_add_crit_chance_1"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"player_detection_risk_add_crit_chance_2"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.drop_soap = {
	name_id = "menu_drop_soap",
	desc_id = "menu_drop_soap_desc",
	icon_xy = {4, 12},
	[1] = {
		upgrades = {
			"player_counter_strike_melee"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"player_counter_strike_spooc"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.second_chances = {
	name_id = "menu_second_chances",
	desc_id = "menu_second_chances_desc",
	icon_xy = {5, 11},
	[1] = {
		upgrades = {
			"bodybags_bag"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"bodybags_bag_quantity"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.trigger_happy = {
	name_id = "menu_trigger_happy",
	desc_id = "menu_trigger_happy_desc",
	icon_xy = {7, 11},
	[1] = {
		upgrades = {
			"pistol_stacking_hit_damage_multiplier_1"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"pistol_stacking_hit_damage_multiplier_2"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.perseverance = {
	name_id = "menu_perseverance",
	desc_id = "menu_perseverance_desc",
	icon_xy = {5, 12},
	[1] = {
		upgrades = {
			"temporary_berserker_damage_multiplier_1"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"temporary_berserker_damage_multiplier_2",
			"player_berserker_no_ammo_cost"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.jail_workout = {
	name_id = "menu_jail_workout",
	desc_id = "menu_jail_workout_desc",
	icon_xy = {6, 10},
	[1] = {
		upgrades = {
			"player_standstill_omniscience"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"player_mask_off_pickup"
		},
		cost = self.costs.pro
	}
}
self.skills.akimbo = {
	name_id = "menu_akimbo_skill",
	desc_id = "menu_akimbo_skill_desc",
	icon_xy = {3, 11},
	[1] = {
		upgrades = {
			"unlock_all_akimbo_weapons",
			"akimbo_recoil_index_addend_1",
			"akimbo_recoil_index_addend_2"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"akimbo_extra_ammo_multiplier_1",
			"akimbo_extra_ammo_multiplier_2",
			"akimbo_recoil_index_addend_3"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.jail_diet = {
	name_id = "menu_jail_diet",
	desc_id = "menu_jail_diet_desc",
	icon_xy = {1, 12},
	[1] = {
		upgrades = {
			"player_detection_risk_add_dodge_chance_1"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"player_detection_risk_add_dodge_chance_2"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.prison_wife = {
	name_id = "menu_prison_wife",
	desc_id = "menu_prison_wife_desc",
	icon_xy = {6, 11},
	[1] = {
		upgrades = {
			"player_headshot_regen_armor_bonus_1"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"player_headshot_regen_armor_bonus_2"
		},
		cost = self.costs.hightierpro
	}
}

self.trees = {}
self.trees[1] = {
	name_id = "st_menu_mastermind",
	skill = "mastermind",
	background_texture = "guis/textures/pd2/skilltree/bg_mastermind",
	tiers = {}
}
self.trees[2] = {
	name_id = "st_menu_enforcer",
	skill = "enforcer",
	background_texture = "guis/textures/pd2/skilltree/bg_enforcer",
	tiers = {}
}
self.trees[3] = {
	name_id = "st_menu_technician",
	skill = "technician",
	background_texture = "guis/textures/pd2/skilltree/bg_technician",
	tiers = {}
}
self.trees[4] = {
	name_id = "st_menu_ghost",
	skill = "ghost",
	background_texture = "guis/textures/pd2/skilltree/bg_ghost",
	tiers = {}
}
self.trees[5] = {
	name_id = "st_menu_hoxton_pack",
	skill = "hoxton",
	background_texture = "guis/textures/pd2/skilltree/bg_fugitive",
	tiers = {}
}
self.trees[1].tiers[1] = {
	"cable_guy",
	"combat_medic",
	"triathlete"
}
self.trees[1].tiers[2] = {
	"inside_man",
	"fast_learner",
	"leadership"
}
self.trees[1].tiers[3] = {
	"tactician",
	"equilibrium",
	"dominator"
}
self.trees[1].tiers[4] = {
	"stockholm_syndrome",
	"medic_2x",
	"joker"
}
self.trees[1].tiers[5] = {
	"kilmer",
	"gun_fighter",
	"control_freak"
}
self.trees[1].tiers[6] = {
	"black_marketeer",
	"pistol_messiah",
	"inspire"
}
self.trees[2].tiers[1] = {
	"oppressor",
	"ammo_reservoir",
	"pack_mule"
}
self.trees[2].tiers[2] = {
	"show_of_force",
	"underdog",
	"steroids"
}
self.trees[2].tiers[3] = {
	"shotgun_impact",
	"shades",
	"tough_guy"
}
self.trees[2].tiers[4] = {
	"shotgun_cqb",
	"ammo_2x",
	"wolverine"
}
self.trees[2].tiers[5] = {
	"from_the_hip",
	"bandoliers",
	"portable_saw"
}
self.trees[2].tiers[6] = {
	"overkill",
	"juggernaut",
	"carbon_blade"
}
self.trees[3].tiers[1] = {
	"rifleman",
	"trip_miner",
	"discipline"
}
self.trees[3].tiers[2] = {
	"sharpshooter",
	"trip_mine_expert",
	"hardware_expert"
}
self.trees[3].tiers[3] = {
	"sentry_gun",
	"master_craftsman",
	"drill_expert"
}
self.trees[3].tiers[4] = {
	"sentry_targeting_package",
	"blast_radius",
	"silent_drilling"
}
self.trees[3].tiers[5] = {
	"sentry_2_0",
	"shaped_charge",
	"insulation"
}
self.trees[3].tiers[6] = {
	"sentry_gun_2x",
	"mag_plus",
	"iron_man"
}
self.trees[4].tiers[1] = {
	"scavenger",
	"sprinter",
	"cat_burglar"
}
self.trees[4].tiers[2] = {
	"transporter",
	"chameleon",
	"cleaner"
}
self.trees[4].tiers[3] = {
	"assassin",
	"martial_arts",
	"smg_master"
}
self.trees[4].tiers[4] = {
	"nine_lives",
	"ecm_2x",
	"hitman"
}
self.trees[4].tiers[5] = {
	"magic_touch",
	"ecm_booster",
	"silence_expert"
}
self.trees[4].tiers[6] = {
	"good_luck_charm",
	"ecm_feedback",
	"moving_target"
}
self.trees[5].tiers[1] = {
	"freedom_call",
	"hidden_blade",
	"thick_skin"
}
self.trees[5].tiers[2] = {
	"awareness",
	"jail_workout",
	"alpha_dog"
}
self.trees[5].tiers[3] = {
	"cell_mates",
	"thug_life",
	"tea_time"
}
self.trees[5].tiers[4] = {
	"perseverance",
	"second_chances",
	"tea_cookies"
}
self.trees[5].tiers[5] = {
	"trigger_happy",
	"backstab",
	"drop_soap"
}
self.trees[5].tiers[6] = {
	"prison_wife",
	"jail_diet",
	"akimbo"
}

self.default_upgrades = {
	"cable_tie",
	"player_special_enemy_highlight",
	"player_hostage_trade",
	"player_sec_camera_highlight",
	"player_corpse_dispose",
	"player_corpse_dispose_amount_1",
	"player_civ_harmless_melee",
	"striker_reload_speed_default",
	"temporary_first_aid_damage_reduction",
	"temporary_passive_revive_damage_reduction_2",
}

table.insert(self.specializations[5][3].upgrades, "unlock_all_akimbo_weapons")

local self = tweak_data.upgrades
self.values.player.body_armor.armor = { 0, 1, 2, 3, 5, 7, 15 } 
self.values.player.body_armor.dodge = { 0.1, -0.2, -0.25, -0.3, -0.35, -0.4, -0.5 } 
self.ammo_bag_base = 3 
self.sentry_gun_base_ammo = 150 
self.taser_malfunction_min = 1 
self.taser_malfunction_max = 3 
self.max_melee_weapon_dmg_mul_stacks = 4 
self.hostage_max_num = { health_regen = 1, health = 10, stamina = 10, damage_dampener = 1 } 
self.on_killshot_cooldown = 2 
self.weapon_movement_penalty.lmg = 0.8 
self.weapon_movement_penalty.minigun = 0.6
self.values.player.intimidate_aura = {700} 
self.values.player.convert_enemies_health_multiplier = {0.65} 
self.values.player.convert_enemies_damage_multiplier = {1.45} 
self.values.pistol.damage_addend = {1.5} 
self.values.assault_rifle.reload_speed_multiplier = {1.25} 
self.values.player.pistol_revive_from_bleed_out = {1, 3}
self.values.pistol.fire_rate_multiplier = {2} 
self.values.cooldown.long_dis_revive = { {0.75, 1} } 
self.values.player.suppression_multiplier = {1.25, 1.75}
self.values.player.non_special_melee_multiplier = {1.5} 
self.values.player.melee_damage_multiplier = {1.5} 
self.values.temporary.dmg_dampener_outnumbered = { {0.85, 7} } 
self.values.player.regain_throwable_from_ammo = { {chance = 0.3, chance_inc = 1.1} } 
self.values.player.bleed_out_health_multiplier = {1.25} 
self.values.shotgun.damage_multiplier = {1.35} 
self.values.shotgun.reload_speed_multiplier = {1.5} 
self.values.player.flashbang_multiplier = {0.75, 0.25}
self.player_damage_health_ratio_threshold = 0.25 
self.values.temporary.overkill_damage_multiplier = { {1.75, 5} } 
self.values.player.drill_autorepair = {0.3}
self.values.sentry_gun.damage_multiplier = {3} 
self.values.player.armor_multiplier = {1.5}
self.values.player.small_loot_multiplier = {1.1, 1.3} 
self.values.player.run_dodge_chance = {0.25} 
self.values.smg.reload_speed_multiplier = {1.35} 
self.values.player.cheat_death_chance = {0.35}
self.values.player.pick_lock_easy_speed_multiplier = {0.75, 0.5} 
self.values.snp.reload_speed_multiplier = {1.25} 
self.values.saw.swap_speed_multiplier = {1.5} 
self.values.player.minion_master_health_multiplier = {1.2}
self.values.temporary.berserker_damage_multiplier = { {1, 3}, {1, 9} } 
self.values.player.gangster_damage_dampener = {0.9, 0.65} 
self.values.player.headshot_regen_armor_bonus = {1.6, 3.2}
self.values.pistol.stacking_hit_damage_multiplier = {
	{
		max_stacks = 4,
		max_time = 2,
		damage_bonus = 1.1
	},
	{
		max_stacks = 4,
		max_time = 8,
		damage_bonus = 1.1
	}
}
self.values.first_aid_kit.quantity = {3, 10} 
self.values.temporary.first_aid_damage_reduction = { {0.8, 10} } 
self.values.temporary.passive_revive_damage_reduction = { {0.9, 5}, {0.7, 5} } 
self.values.player.passive_convert_enemies_health_multiplier = {0.6, 0.2} 
self.values.pistol.spread_index_addend = {1} 
self.values.weapon.single_spread_index_addend = {1} 
self.values.weapon.silencer_spread_index_addend = {2} 
self.values.shotgun.recoil_index_addend = {1} 
self.values.akimbo.recoil_index_addend = {
	-10,
	-8,
	-6,
	-4,
	-2
}
self.values.trip_mine.marked_enemy_extra_damage = {true} 
self.values.trip_mine.quantity = {1, 4}
self.values.player.unlock_all_akimbo_weapons = {true} 

-- ИЗМЕНЕНИЯ ПЕРКОВ
-- self.values.player.passive_health_multiplier = { 1.1, 1.2, 1.4, 1.8 }
-- self.values.player.passive_dodge_chance = { 0.05, 0.15, 0.25 } 
-- self.values.team.health.hostage_multiplier = {1.02} 
-- self.values.team.stamina.hostage_multiplier = {1.04} 
-- self.values.player.level_2_dodge_addend = { 0.1, 0.2, 0.35 } 
-- self.values.player.level_3_dodge_addend = { 0.1, 0.2, 0.35 } 
-- self.values.player.level_4_dodge_addend = { 0.1, 0.2, 0.35 } 
-- self.values.player.passive_health_regen = {0.035} 
-- self.values.akimbo.extra_ammo_multiplier = {1.25, 1.5} 
-- self.values.player.tier_dodge_chance = { 0.1, 0.15, 0.2 } 
-- self.values.temporary.dmg_dampener_outnumbered_strong = { {0.92, 7} } 
-- self.values.melee.stacking_hit_damage_multiplier = {0.1, 0.2} 
-- self.loose_ammo_restore_health_values = { base = 4, cd = 4, multiplier = 0.2, {0, 2}, {2, 4}, {4, 6} } 
-- self.loose_ammo_give_team_health_ratio = 1 
-- self.values.player.gain_life_per_players = {1} 
-- self.damage_to_hot_data.tick_time = 0.5
-- self.values.player.damage_to_hot_extra_ticks = {2} 
-- self.values.player.armor_grinding = {
	-- {
		-- {1, 2},
		-- {1.5, 3},
		-- {2, 4},
		-- {2.5, 5},
		-- {3.5, 7},
		-- {4.5, 9},
		-- {8.5, 17}
	-- }
-- } 
-- self.values.temporary.armor_break_invulnerable = { {2, 15} } 
-- self.values.player.passive_always_regen_armor = {5} 
-- self.values.player.cocaine_stack_absorption_multiplier = {1.5}


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

self.definitions.pistol_damage_addend = {
	category = "feature",
	name_id = "menu_pistol_damage_addend",
	upgrade = {
		category = "pistol",
		upgrade = "damage_addend",
		value = 1
	}
}

self.definitions.player_pistol_revive_from_bleed_out_1 = {
	category = "feature",
	name_id = "menu_player_pistol_revive_from_bleed_out",
	upgrade = {
		category = "player",
		upgrade = "pistol_revive_from_bleed_out",
		value = 1
	}
}

self.definitions.player_pistol_revive_from_bleed_out_2 = {
	category = "feature",
	name_id = "menu_player_pistol_revive_from_bleed_out",
	upgrade = {
		category = "player",
		upgrade = "pistol_revive_from_bleed_out",
		value = 2
	}
}

self.definitions.player_suppression_mul_2 = {
	category = "feature",
	name_id = "menu_player_suppression_mul_2",
	upgrade = {
		category = "player",
		upgrade = "suppression_multiplier",
		value = 2
	}
}

self.definitions.player_drill_autorepair = {
	category = "feature",
	name_id = "menu_player_drill_autorepair",
	upgrade = {
		category = "player",
		upgrade = "drill_autorepair",
		value = 1
	}
}

self.definitions.sentry_gun_quantity_increase = {
	category = "feature",
	name_id = "menu_sentry_gun_quantity_increase",
	upgrade = {
		category = "sentry_gun",
		upgrade = "quantity",
		value = 1
	}
}
self.definitions.player_camouflage_bonus = {
	category = "feature",
	name_id = "menu_player_camouflage_bonus",
	upgrade = {
		category = "player",
		upgrade = "camouflage_bonus",
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

self.definitions.unlock_all_akimbo_weapons = {
	category = "feature",
	name_id = "menu_unlock_all_akimbo_weapons",
	upgrade = {
		category = "player",
		upgrade = "unlock_all_akimbo_weapons",
		value = 1
	}
}

self.definitions.trip_mine_marked_enemy_extra_damage = {
	category = "feature",
	name_id = "menu_trip_mine_marked_enemy_extra_damage",
	upgrade = {
		category = "trip_mine",
		upgrade = "marked_enemy_extra_damage",
		value = 1
	}
}

local editable_skill_descs = {
	ammo_2x = {
		{"2"},
		{"200%"}
	},
	ammo_reservoir = {
		{"5"},
		{"10"}
	},
	assassin = {
		{"25%", "10%"},
		{"95%"}
	},
	bandoliers = {
		{"25%"},
		{"175%"}
	},
	black_marketeer = {
		{"0.6%", "5"},
		{"2%", "5"}
	},
	blast_radius = {
		{"70%"},
		{}
	},
	cable_guy = {
		{"75%"},
		{"4"}
	},
	carbon_blade = {
		{"20%"},
		{"50%", "20%"}
	},
	cat_burglar = {
		{"75%"},
		{"50%"}
	},
	chameleon = {
		{"25%"},
		{"15%"}
	},
	cleaner = {
		{"5%", "3"},
		{"1"}
	},
	combat_medic = {
		{"25%", "10"},
		{"30%"}
	},
	control_freak = {
		{"10%", "40%"},
		{"20%", "40%"}
	},
	discipline = {
		{"50%"},
		{}
	},
	dominator = {
		{},
		{"50%"}
	},
	drill_expert = {
		{"15%"},
		{"15%"}
	},
	ecm_2x = {
		{"2"},
		{"25%", "25%"}
	},
	ecm_booster = {
		{"25%"},
		{}
	},
	ecm_feedback = {
		{
			"50%-100%",
			"25",
			"1.5",
			"15-20"
		},
		{
			"25%",
			"100%",
			"4"
		}
	},
	enforcer = {
		{"400%"},
		{}
	},
	equilibrium = {
		{"10%", "50%"},
		{"100%"}
	},
	fast_learner = {
		{"10%", "5"},
		{"20%"}
	},
	from_the_hip = {
		{"20%"},
		{"20%"}
	},
	ghost = {
		{"1", "20"},
		{}
	},
	good_luck_charm = {
		{"10", "1"},
		{"10"}
	},
	gun_fighter = {
		{"50%"},
		{"50%"}
	},
	hardware_expert = {
		{"25%", "20%"},
		{"30%", "50%"}
	},
	hitman = {
		{"15%"},
		{"15%", "15%"}
	},
	inside_man = {
		{"50%"},
		{}
	},
	inspire = {
		{
			"50%",
			"20%",
			"10"
		},
		{
			"75%",
			"20",
			"9"
		}
	},
	insulation = {
		{},
		{"50%"}
	},
	iron_man = {
		{"50%"},
		{"25%"}
	},
	joker = {
		{},
		{
			"55%",
			"45%",
			"65%"
		}
	},
	juggernaut = {
		{},
		{}
	},
	kilmer = {
		{"25%"},
		{"50%"}
	},
	leadership = {
		{"25%"},
		{"50%"}
	},
	mag_plus = {
		{"5"},
		{"10"}
	},
	magic_touch = {
		{"25%"},
		{"25%"}
	},
	martial_arts = {
		{"50%"},
		{"50%"}
	},
	master_craftsman = {
		{"30%"},
		{"15%"}
	},
	mastermind = {
		{"2"},
		{}
	},
	medic_2x = {
		{"2"},
		{"2"}
	},
	nine_lives = {
		{"1"},
		{"35%"}
	},
	oppressor = {
		{"25%"},
		{"50%"}
	},
	overkill = {
		{"75%", "5"},
		{}
	},
	pack_mule = {
		{"50%"},
		{"50%"}
	},
	pistol_messiah = {
		{"1"},
		{"2"}
	},
	portable_saw = {
		{},
		{"1"}
	},
	rifleman = {
		{"100%"},
		{"25%"}
	},
	scavenger = {
		{"10%"},
		{"20%"}
	},
	sentry_2_0 = {
		{},
		{}
	},
	sentry_gun = {
		{},
		{"150%"}
	},
	sentry_gun_2x = {
		{"2"},
		{"300%"}
	},
	sentry_targeting_package = {
		{"100%"},
		{"150%", "50%"}
	},
	shades = {
		{"25%"},
		{"50%"}
	},
	shaped_charge = {
		{"3"},
		{}
	},
	sharpshooter = {
		{"20%"},
		{"25%"}
	},
	shotgun_cqb = {
		{"50%"},
		{"125%"}
	},
	shotgun_impact = {
		{"25%"},
		{"35%"}
	},
	show_of_force = {
		{},
		{"15%"}
	},
	silence = {
		{},
		{}
	},
	silence_expert = {
		{"50%", "100%"},
		{"50%", "15%"}
	},
	silent_drilling = {
		{"65%"},
		{}
	},
	smg_master = {
		{"35%"},
		{"20%"}
	},
	smg_training = {
		{},
		{}
	},
	sprinter = {
		{"25%", "25%"},
		{"25%", "25%"}
	},
	steroids = {
		{"50%"},
		{"50%"}
	},
	stockholm_syndrome = {
		{},
		{}
	},
	tactician = {
		{"15%"},
		{}
	},
	target_mark = {
		{},
		{}
	},
	technician = {
		{"2"},
		{}
	},
	tough_guy = {
		{"50%"},
		{"25%"}
	},
	transporter = {
		{"25%"},
		{"50%"}
	},
	triathlete = {
		{"100%"},
		{"50%"}
	},
	trip_mine_expert = {
		{},
		{}
	},
	trip_miner = {
		{"1"},
		{"20%"}
	},
	underdog = {
		{"15%"},
		{"15%"}
	},
	wolverine = {
		{"25%", "250%"},
		{"25%", "100%"}
	},
	hoxton = {
		{"4"},
		{}
	},
	freedom_call = {
		{"20%"},
		{"15%"}
	},
	hidden_blade = {
		{"2"},
		{"95%"}
	},
	tea_time = {
		{"50%"},
		{"20%", "10"}
	},
	awareness = {
		{"10%"},
		{}
	},
	alpha_dog = {
		{"5%"},
		{"10%"}
	},
	tea_cookies = {
		{"3"},
		{"7"}
	},
	cell_mates = {
		{"10%"},
		{"25%"}
	},
	thug_life = {
		{"1"},
		{"75%"}
	},
	thick_skin = {
		{"10"},
		{"20"}
	},
	backstab = {
		{
			"3%",
			"3",
			"35",
			"30%"
		},
		{
			"3%",
			"1",
			"35",
			"30%"
		}
	},
	drop_soap = {
		{},
		{}
	},
	second_chances = {
		{},
		{"2"}
	},
	trigger_happy = {
		{
			"10%",
			"2",
			"4"
		},
		{"8"}
	},
	perseverance = {
		{
			"0",
			"3",
			"60%"
		},
		{"6"}
	},
	jail_workout = {
		{"3.5", "10"},
		{}
	},
	akimbo = {
		{"50%"},
		{"25%", "150%"}
	},
	jail_diet = {
		{
			"1%",
			"3",
			"35",
			"10%"
		},
		{
			"1%",
			"1",
			"35",
			"10%"
		}
	},
	prison_wife = {
		{"16", "3"},
		{"16", "3"}
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

for _, weapon in pairs(tweak_data.weapon) do
	if weapon.categories and weapon.categories[1] == "akimbo" then
		weapon.unlock_func = "unlock_all_akimbo_weapons"
	end
end

tweak_data.interaction.shaped_sharge.requires_upgrade = {
	category = "player",
	upgrade = "trip_mine_shaped_charge"
}
tweak_data.interaction.shaped_sharge.slot = 1
tweak_data.interaction.shaped_sharge.blocked_hint = nil
tweak_data.equipments.trip_mine.quantity = {2}
tweak_data.equipments.trip_mine.upgrade_name = {"trip_mine"}
tweak_data.mission_door.reinforced_door_single.devices.c4[1].unit = Idstring("units/payday2/equipment/gen_equipment_shape_charge/gen_equipment_shape_charge")
tweak_data.mission_door.keycard_door_single.devices.c4[1].unit = Idstring("units/payday2/equipment/gen_equipment_shape_charge/gen_equipment_shape_charge")
tweak_data.mission_door.keycard_door_single.devices.c4[2].unit = Idstring("units/payday2/equipment/gen_equipment_shape_charge/gen_equipment_shape_charge")
tweak_data.mission_door.cage_door_deluxe.devices.c4[1].unit = Idstring("units/payday2/equipment/gen_equipment_shape_charge/gen_equipment_shape_charge")

if tweak_data.mission_door.cage_door_deluxe_non_jamming then
	tweak_data.mission_door.cage_door_deluxe_non_jamming.devices.c4[1].unit = Idstring("units/payday2/equipment/gen_equipment_shape_charge/gen_equipment_shape_charge")
end

if tweak_data.mission_door.cage_door_ranc then
	tweak_data.mission_door.cage_door_ranc.devices.c4[1].unit = Idstring("units/payday2/equipment/gen_equipment_shape_charge/gen_equipment_shape_charge")
end

if tweak_data.mission_door.cage_door_deluxe_deep then
	tweak_data.mission_door.cage_door_deluxe_deep.devices.c4[1].unit = Idstring("units/payday2/equipment/gen_equipment_shape_charge/gen_equipment_shape_charge")
end

tweak_data.interaction.sentry_gun.requires_upgrade = {
	upgrade = "can_reload",
	category = "sentry_gun"
}