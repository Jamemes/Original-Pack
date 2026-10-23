local self = tweak_data.skilltree
local digest = function(value)
	return Application:digest_value(value, true)
end

self.HIDE_TIER_BONUS = nil
self.tier_cost = { 	
	{1, 3}, 	
	{1, 3}, 	
	{1, 3}, 	
	{4, 8}, 	
	{4, 8}, 	
	{4, 8}
}

local digest = function(value)
	return Application:digest_value(value, true)
end
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
		upgrades = {
			"doctor_bag",
			"passive_doctor_bag_interaction_speed_multiplier"
		},
		cost = self.costs.unlock_tree,
		desc_id = "menu_mastermind_tier_1"
	},
	[2] = {
		upgrades = {
			"team_passive_stamina_multiplier_1"
		},
		desc_id = "menu_mastermind_tier_2"
	},
	[3] = {
		upgrades = {
			"player_passive_intimidate_range_mul"
		},
		desc_id = "menu_mastermind_tier_3"
	},
	[4] = {
		upgrades = {
			"player_passive_convert_enemies_health_multiplier",
			"player_passive_convert_enemies_damage_multiplier"
		},
		desc_id = "menu_mastermind_tier_4"
	},
	[5] = {
		upgrades = {
			"player_convert_enemies_interaction_speed_multiplier"
		},
		desc_id = "menu_mastermind_tier_5"
	},
	[6] = {
		upgrades = {
			"player_passive_empowered_intimidation",
			"passive_player_assets_cost_multiplier"
		},
		desc_id = "menu_mastermind_tier_6"
	}
}
self.skills.enforcer = {
	name_id = "menu_enforcer",
	desc_id = "menu_enforcer_desc",
	icon_xy = {1, 0},
	[1] = {
		upgrades = {
			"ammo_bag",
			"player_passive_suppression_bonus_1"
		},
		cost = self.costs.unlock_tree,
		desc_id = "menu_menu_enforcer_tier_1"
	},
	[2] = {
		upgrades = {
			"player_passive_health_multiplier_1"
		},
		desc_id = "menu_menu_enforcer_tier_2"
	},
	[3] = {
		upgrades = {
			"player_passive_suppression_bonus_2"
		},
		desc_id = "menu_menu_enforcer_tier_3"
	},
	[4] = {
		upgrades = {
			"player_passive_health_multiplier_2"
		},
		desc_id = "menu_menu_enforcer_tier_4"
	},
	[5] = {
		upgrades = {
			"weapon_passive_damage_multiplier"
		},
		desc_id = "menu_menu_enforcer_tier_5"
	},
	[6] = {
		upgrades = {
			"player_passive_health_multiplier_3"
		},
		desc_id = "menu_menu_enforcer_tier_6"
	}
}
self.skills.technician = {
	name_id = "menu_technician",
	desc_id = "menu_technician_desc",
	icon_xy = {7, 4},
	[1] = {
		upgrades = {
			"trip_mine",
			"player_passive_crafting_weapon_multiplier_1",
			"player_passive_crafting_mask_multiplier_1"
		},
		cost = self.costs.unlock_tree,
		desc_id = "menu_technician_tier_1"
	},
	[2] = {
		upgrades = {
			"weapon_passive_recoil_multiplier_1"
		},
		desc_id = "menu_technician_tier_2"
	},
	[3] = {
		upgrades = {
			"player_passive_crafting_weapon_multiplier_2",
			"player_passive_crafting_mask_multiplier_2"
		},
		desc_id = "menu_technician_tier_3"
	},
	[4] = {
		upgrades = {
			"weapon_passive_headshot_damage_multiplier"
		},
		desc_id = "menu_technician_tier_4"
	},
	[5] = {
		upgrades = {
			"player_passive_crafting_weapon_multiplier_3",
			"player_passive_crafting_mask_multiplier_3"
		},
		desc_id = "menu_technician_tier_5"
	},
	[6] = {
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
	[1] = {
		upgrades = {
			"ecm_jammer",
			"ecm_jammer_affects_cameras",
			"player_passive_dodge_chance_1"
		},
		cost = self.costs.unlock_tree,
		desc_id = "menu_ghost_tier_1"
	},
	[2] = {
		upgrades = {
			"weapon_passive_swap_speed_multiplier_1"
		},
		desc_id = "menu_ghost_tier_2"
	},
	[3] = {
		upgrades = {
			"player_passive_dodge_chance_2"
		},
		desc_id = "menu_ghost_tier_3"
	},
	[4] = {
		upgrades = {
			"player_passive_suspicion_bonus"
		},
		desc_id = "menu_ghost_tier_4"
	},
	[5] = {
		upgrades = {
			"weapon_passive_swap_speed_multiplier_2"
		},
		desc_id = "menu_ghost_tier_5"
	},
	[6] = {
		upgrades = {
			"player_passive_loot_drop_multiplier"
		},
		desc_id = "menu_ghost_tier_6"
	}
}
self.skills.black_marketeer = {
	name_id = "menu_black_marketeer",
	desc_id = "menu_black_marketeer_desc",
	icon_xy = {4, 8},
	[1] = {
		upgrades = {
			"player_buy_cost_multiplier_1"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"player_buy_cost_multiplier_2",
			"player_sell_cost_multiplier_1"
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
			"pistol_damage_multiplier"
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
	icon_xy = {6, 7},
	[1] = {
		upgrades = {
			"player_civ_calming_alerts"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"player_civ_intimidation_mul"
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
			"team_pistol_recoil_multiplier"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"team_weapon_recoil_multiplier"
		},
		cost = self.costs.pro
	}
}
self.skills.inside_man = {
	name_id = "menu_inside_man",
	desc_id = "menu_inside_man_desc",
	icon_xy = {0, 8},
	[1] = {
		upgrades = {
			"player_assets_cost_multiplier"
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
	icon_xy = {7, 8},
	[1] = {
		upgrades = {
			"player_xp_multiplier"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"team_xp_multiplier"
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
			"player_corpse_alarm_pager_bluff"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"player_marked_enemy_extra_damage"
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
			"assault_rifle_reload_speed_multiplier"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"assault_rifle_move_spread_multiplier"
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
			"pistol_spread_multiplier",
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
			"player_convert_enemies_damage_multiplier"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.inspire = {
	name_id = "menu_inspire",
	desc_id = "menu_inspire_desc",
	icon_xy = {4, 9},
	[1] = {
		upgrades = {
			"player_revive_interaction_speed_multiplier"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"player_long_dis_revive"
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
			"player_pick_up_ammo_multiplier"
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
			"shotgun_recoil_multiplier"
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
			"player_shield_knock"
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
			"shotgun_hip_fire_spread_multiplier"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"assault_rifle_hip_fire_spread_multiplier",
			"saw_hip_fire_spread_multiplier",
			"pistol_hip_fire_spread_multiplier",
			"smg_hip_fire_spread_multiplier"
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
			"saw_enemy_slicer"
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
			"assault_rifle_enter_steelsight_speed_multiplier"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"assault_rifle_zoom_increase"
		},
		cost = self.costs.pro
	}
}
self.skills.blast_radius = {
	name_id = "menu_blast_radius",
	desc_id = "menu_blast_radius_desc",
	icon_xy = {1, 5},
	[1] = {
		upgrades = {
			"trip_mine_explosion_size_multiplier_1"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"trip_mine_explosion_size_multiplier_2"
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
			"trip_mine_sensor_toggle"
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
			"weapon_single_spread_multiplier"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"assault_rifle_recoil_multiplier"
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
			"sentry_gun_rot_speed_multiplier"
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
			"sentry_gun_extra_ammo_multiplier_1"
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
self.skills.military_grade = {
	name_id = "menu_military_grade",
	desc_id = "menu_military_grade_desc",
	icon_xy = {4, 6},
	[1] = {
		upgrades = {
			"trip_mine_quantity_increase_2"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {},
		cost = self.costs.hightierpro
	}
}
self.skills.dye_pack_removal = {
	name_id = "menu_dye_pack_removal",
	desc_id = "menu_dye_pack_removal_desc",
	icon_xy = {0, 6},
	[1] = {
		upgrades = {
			"player_dye_pack_chance_multiplier"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"player_dye_pack_cash_loss_multiplier"
		},
		cost = self.costs.hightierpro
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
			"trip_mine_quantity_increase_3"
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
	icon_xy = {1, 7},
	[1] = {
		upgrades = {
			"player_crafting_weapon_multiplier"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"player_crafting_mask_multiplier"
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
			"smg_recoil_multiplier"
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
			"player_suspicion_bonus"
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
			"weapon_special_damage_taken_multiplier"
		},
		cost = self.costs.default
	},
	[2] = {
		upgrades = {
			"player_corpse_dispose"
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
			"ecm_jammer_feedback_duration_boost_2"
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
			"player_damage_dampener"
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
			"ecm_jammer_feedback_duration_boost"
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
			"weapon_silencer_damage_multiplier_2"
		},
		cost = self.costs.hightierpro
	}
}
self.skills.silence = {
	name_id = "menu_silence",
	desc_id = "menu_silence_desc",
	icon_xy = {4, 4},
	[1] = {
		upgrades = {
			"weapon_silencer_recoil_multiplier"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"weapon_silencer_enter_steelsight_speed_multiplier",
			"weapon_silencer_spread_multiplier"
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
			"weapon_silencer_recoil_multiplier"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"weapon_silencer_enter_steelsight_speed_multiplier",
			"weapon_silencer_spread_multiplier"
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
			"player_loot_drop_multiplier_1"
		},
		cost = self.costs.hightier
	},
	[2] = {
		upgrades = {
			"player_loot_drop_multiplier_2"
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
			"player_pick_lock_hard"
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
	"black_marketeer",
	"gun_fighter",
	"kilmer"
}
self.trees[1].tiers[6] = {
	"control_freak",
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

self.default_upgrades = {
	"cable_tie",
	"player_special_enemy_highlight",
	"player_hostage_trade",
	"player_sec_camera_highlight",
}

local self = tweak_data.upgrades

self.values.player.body_armor.armor = {
	0,
	1,
	2,
	3,
	4,
	5,
	10
}
self.values.player.body_armor.movement = {
	1,
	0.96,
	0.92,
	0.88,
	0.84,
	0.8,
	0.76
}
self.values.player.body_armor.concealment = {
	30,
	27,
	21,
	18,
	15,
	12,
	6
}
self.values.player.body_armor.damage_shake = {
	1,
	1,
	1,
	1,
	1,
	1,
	1
}
self.values.player.body_armor.stamina = {
	1,
	1,
	1,
	1,
	1,
	1,
	1
}
self.values.player.body_armor.dodge = {
	0,
	0,
	0,
	0,
	0,
	0,
	0
}
self.values.player.body_armor.damage_shake = {
	1,
	1,
	1,
	1,
	1,
	1,
	1
}
self.values.player.body_armor.stamina = {
	1,
	1,
	1,
	1,
	1,
	1,
	1
}

self.values.player.body_armor.skill_ammo_mul = {
	1,
	1,
	1,
	1,
	1,
	1,
	1
}

self.level_tree = {}
self.level_tree[1] = {
	name_id = "body_armor",
	upgrades = {
		"body_armor2",
		"ak74"
	}
}
self.level_tree[2] = {
	name_id = "Angst",
	upgrades = {"colt_1911", "mac10"}
}
self.level_tree[4] = {
	name_id = "Angst",
	upgrades = {"new_m4"}
}
self.level_tree[6] = {
	name_id = "Angst",
	upgrades = {
		"new_raging_bull",
		"b92fs"
	}
}
self.level_tree[7] = {
	name_id = "body_armor",
	upgrades = {
		"body_armor1"
	}
}
self.level_tree[8] = {
	name_id = "Angst",
	upgrades = {"r870", "aug"}
}
self.level_tree[10] = {
	name_id = "lvl_10",
	upgrades = {
		"rep_upgrade1"
	}
}
self.level_tree[12] = {
	name_id = "body_armor3",
	upgrades = {
		"body_armor3"
	}
}
self.level_tree[13] = {
	name_id = "Angst",
	upgrades = {"new_mp5", "serbu"}
}
self.level_tree[16] = {
	name_id = "Angst",
	upgrades = {"akm", "g36"}
}
self.level_tree[19] = {
	name_id = "Angst",
	upgrades = {"olympic", "mp9"}
}
self.level_tree[20] = {
	name_id = "lvl_20",
	upgrades = {
		"rep_upgrade2"
	}
}
self.level_tree[21] = {
	name_id = "body_armor4",
	upgrades = {
		"body_armor4"
	}
}
self.level_tree[26] = {
	name_id = "Angst",
	upgrades = {"new_m14", "saiga"}
}
self.level_tree[29] = {
	name_id = "Angst",
	upgrades = {"akmsu", "glock_18c"}
}
self.level_tree[30] = {
	name_id = "lvl_30",
	upgrades = {
		"rep_upgrade3"
	}
}
self.level_tree[31] = {
	name_id = "body_armor5",
	upgrades = {
		"body_armor5"
	}
}
self.level_tree[33] = {
	name_id = "Angst",
	upgrades = {"ak5"}
}
self.level_tree[36] = {
	name_id = "Angst",
	upgrades = {"p90", "deagle"}
}
self.level_tree[39] = {
	name_id = "Angst",
	upgrades = {"m16", "huntsman"}
}
self.level_tree[40] = {
	name_id = "lvl_40",
	upgrades = {
		"rep_upgrade4"
	}
}
self.level_tree[50] = {
	name_id = "lvl_50",
	upgrades = {
		"rep_upgrade5"
	}
}
self.level_tree[60] = {
	name_id = "lvl_60",
	upgrades = {
		"rep_upgrade6"
	}
}
self.level_tree[70] = {
	name_id = "lvl_70",
	upgrades = {
		"rep_upgrade7"
	}
}
self.level_tree[80] = {
	name_id = "lvl_80",
	upgrades = {
		"rep_upgrade8"
	}
}
self.level_tree[90] = {
	name_id = "lvl_90",
	upgrades = {
		"rep_upgrade9"
	}
}
self.level_tree[95] = {
	name_id = "menu_es_jobs_available",
	upgrades = {
		"lucky_charm"
	}
}
self.level_tree[100] = {
	name_id = "lvl_100",
	upgrades = {
		"rep_upgrade10"
	}
}

self.revive_health_multiplier[1] = 1.25 --1.3


-- self.values.player.passive_suspicion_multiplier[1] = 0.75 --nil
-- self.definitions.player_passive_suspicion_bonus.upgrade.upgrade = "passive_suspicion_multiplier" --"passive_concealment_modifier"
-- self.definitions.temporary_no_ammo_cost_1.upgrade.category = "temporary" --"player"
-- self.definitions.temporary_no_ammo_cost_2.upgrade.category = "temporary" --"player"

-- self.definitions.player_long_dis_revive.category = "feature" --nil
-- self.definitions.player_long_dis_revive.upgrade.category = "player" --nil
-- self.definitions.player_long_dis_revive.upgrade.upgrade = "long_dis_revive" --nil
-- self.definitions.player_long_dis_revive.upgrade.value = 1 --nil
-- self.definitions.player_long_dis_revive.name_id = "menu_player_long_dis_revive" --nil

-- self.values.player.long_dis_revive[1] = true --nil

-- self.definitions.trip_mine_quantity_increase_3.category = "feature" --nil
-- self.definitions.trip_mine_quantity_increase_3.upgrade.category = "trip_mine" --nil
-- self.definitions.trip_mine_quantity_increase_3.upgrade.upgrade = "quantity_3" --nil
-- self.definitions.trip_mine_quantity_increase_3.upgrade.value = 1 --nil
-- self.definitions.trip_mine_quantity_increase_3.name_id = "menu_trip_mine_quantity_increase_1" --nil

-- self.definitions.trip_mine_quantity_increase_2.upgrade.upgrade = "quantity_2" --"quantity"
-- self.definitions.trip_mine_quantity_increase_2.upgrade.value = 1 --2
-- self.values.player.civ_intimidation_mul[1] = 10 --1.5
-- self.values.player.taser_malfunction[1] = true --table: 0x40592cc0

-- self.values.player.melee_damage_health_ratio_multiplier[1] = 5 --2.5 ???
-- self.values.player.camouflage_bonus[1] = 1.25 --0.85 ???
-- self.values.ecm_jammer.duration_multiplier[1] = 1.25 --true ???
-- self.values.ecm_jammer.duration_multiplier_2[1] = 1.25 --true ???
-- self.values.saw.enemy_slicer[1] = true --1 ???
-- self.values.cable_tie.quantity[1] = 3 --nil ???
-- self.values.sentry_gun.extra_ammo_multiplier[2] = 2 --nil ???
-- self.values.player.suppression_multiplier[2] = 1.75 --nil
-- self.values.player.small_loot_multiplier[2] = 1.3 --nil
-- self.values.temporary.no_ammo_cost[1][1] = true --nil
-- self.values.temporary.no_ammo_cost[1][2] = 5 --nil
-- self.values.temporary.no_ammo_cost[2][1] = true --nil
-- self.values.temporary.no_ammo_cost[2][2] = 10 --nil
-- self.values.trip_mine.quantity_1[1] = 1 --nil
-- self.values.trip_mine.quantity_2[1] = 2 --nil
-- self.values.trip_mine.quantity[1] = 1 --4
-- self.values.trip_mine.quantity[2] = 2 --11
-- self.values.trip_mine.quantity[3] = 3 --nil
-- self.values.trip_mine.quantity[4] = 4 --nil
-- self.values.trip_mine.quantity[5] = 5 --nil
-- self.values.trip_mine.quantity[6] = 8 --nil
-- self.values.trip_mine.quantity_3[1] = 3 --nil
-- self.definitions.cable_tie_quantity.upgrade.upgrade = "quantity" --"quantity_1"

self.definitions.player_pistol_revive_from_bleed_out_timer = {}
self.definitions.player_pistol_revive_from_bleed_out_timer.category = "temporary" --nil
self.definitions.player_pistol_revive_from_bleed_out_timer.upgrade = {}
self.definitions.player_pistol_revive_from_bleed_out_timer.upgrade.category = "temporary" --nil
self.definitions.player_pistol_revive_from_bleed_out_timer.upgrade.upgrade = "pistol_revive_from_bleed_out" --nil
self.definitions.player_pistol_revive_from_bleed_out_timer.upgrade.value = 1 --nil
self.definitions.player_pistol_revive_from_bleed_out_timer.name_id = "menu_player_pistol_revive_from_bleed_out_timer" --nil

self.definitions.shotgun_reload_speed_multiplier = {}
self.definitions.shotgun_reload_speed_multiplier.category = "feature" --nil
self.definitions.shotgun_reload_speed_multiplier.upgrade = {}
self.definitions.shotgun_reload_speed_multiplier.upgrade.category = "shotgun" --nil
self.definitions.shotgun_reload_speed_multiplier.upgrade.upgrade = "reload_speed_multiplier" --nil
self.definitions.shotgun_reload_speed_multiplier.upgrade.value = 1 --nil
self.definitions.shotgun_reload_speed_multiplier.name_id = "menu_shotgun_reload_speed_multiplier" --nil

self.definitions.player_convert_enemies_damage_multiplier = {}
self.definitions.player_convert_enemies_damage_multiplier.category = "feature" --nil
self.definitions.player_convert_enemies_damage_multiplier.upgrade = {}
self.definitions.player_convert_enemies_damage_multiplier.upgrade.category = "player" --nil
self.definitions.player_convert_enemies_damage_multiplier.upgrade.upgrade = "convert_enemies_damage_multiplier" --nil
self.definitions.player_convert_enemies_damage_multiplier.upgrade.value = 1 --nil
self.definitions.player_convert_enemies_damage_multiplier.name_id = "menu_player_convert_enemies_damage_multiplier" --nil

self.definitions.player_passive_convert_enemies_health_multiplier = {}
self.definitions.player_passive_convert_enemies_health_multiplier.category = "feature" --nil
self.definitions.player_passive_convert_enemies_health_multiplier.upgrade = {}
self.definitions.player_passive_convert_enemies_health_multiplier.upgrade.category = "player" --nil
self.definitions.player_passive_convert_enemies_health_multiplier.upgrade.upgrade = "passive_convert_enemies_health_multiplier" --nil
self.definitions.player_passive_convert_enemies_health_multiplier.upgrade.value = 1 --nil
self.definitions.player_passive_convert_enemies_health_multiplier.name_id = "menu_player_passive_convert_enemies_health_multiplier" --nil

self.definitions.shotgun_damage_multiplier = {}
self.definitions.shotgun_damage_multiplier.category = "feature" --nil
self.definitions.shotgun_damage_multiplier.upgrade = {}
self.definitions.shotgun_damage_multiplier.upgrade.category = "shotgun" --nil
self.definitions.shotgun_damage_multiplier.upgrade.upgrade = "damage_multiplier" --nil
self.definitions.shotgun_damage_multiplier.upgrade.value = 1 --nil
self.definitions.shotgun_damage_multiplier.name_id = "menu_shotgun_damage_multiplier" --nil

self.definitions.trip_mine_explosion_size_multiplier_1.upgrade.upgrade = "explosion_size_multiplier" --"explosion_size_multiplier_1"
self.definitions.trip_mine_explosion_size_multiplier_2.upgrade.upgrade = "explosion_size_multiplier" --"explosion_size_multiplier_2"
self.definitions.trip_mine_explosion_size_multiplier_2.upgrade.value = 2 --1

self.definitions.player_cheat_death_chance = {}
self.definitions.player_cheat_death_chance.category = "feature" --nil
self.definitions.player_cheat_death_chance.upgrade = {}
self.definitions.player_cheat_death_chance.upgrade.category = "player" --nil
self.definitions.player_cheat_death_chance.upgrade.upgrade = "cheat_death_chance" --nil
self.definitions.player_cheat_death_chance.upgrade.value = 1 --nil
self.definitions.player_cheat_death_chance.name_id = "menu_player_cheat_death_chance" --nil

self.player_damage_health_ratio_threshold = 0.4 --0.5
self.values.assault_rifle.reload_speed_multiplier[1] = 1.33 --1.15
self.values.player.saw_speed_multiplier[1] = 0.9 --0.95
self.values.player.saw_speed_multiplier[2] = 0.7 --0.65
self.values.player.damage_dampener[1] = 0.5 --0.95
self.values.player.passive_crafting_weapon_multiplier[2] = 0.97 --0.96
self.values.player.passive_crafting_weapon_multiplier[3] = 0.95 --0.91
self.values.player.suppression_multiplier[1] = 1.25 --1.75
self.values.player.flashbang_multiplier[1] = 0.5 --0.25
self.values.player.xp_multiplier[1] = 1.1 --1.15
self.values.player.intimidation_multiplier[1] = 1.25 --1.5
self.values.player.run_dodge_chance[1] = 0.25 --0.1
self.values.player.bleed_out_health_multiplier[1] = 1.25 --1.5
self.values.player.crouch_speed_multiplier[1] = 1.25 --1.1
self.values.player.silent_kill[1] = 400 --25
self.values.player.passive_xp_multiplier[1] = 1.05 --1.45
self.values.player.cheat_death_chance[1] = 0.1 --0.15
self.values.player.passive_dodge_chance[1] = 0.05 --0.15
self.values.player.passive_dodge_chance[2] = 0.15 --0.3
self.values.player.drill_speed_multiplier[1] = 0.9 --0.85
self.values.player.drill_speed_multiplier[2] = 0.75 --0.7
self.values.player.armor_multiplier[1] = 1.5 --1.3
self.values.player.intimidate_aura[1] = 700 --1000
self.values.player.pistol_revive_from_bleed_out = {1, 3} --nil
self.values.player.trip_mine_deploy_time_multiplier[2] = 0.5 --0.6
self.values.player.fall_damage_multiplier[1] = 0.5 --0.25
self.values.player.passive_crafting_mask_multiplier[2] = 0.97 --0.96
self.values.player.passive_crafting_mask_multiplier[3] = 0.95 --0.91
self.values.player.buy_cost_multiplier[1] = 0.95 --0.9
self.values.player.buy_cost_multiplier[2] = 0.8 --0.7
self.values.player.convert_enemies_damage_multiplier[1] = 1.43 --0.65
self.values.player.convert_enemies_interaction_speed_multiplier[1] = 0.33 --0.35
self.values.player.passive_convert_enemies_damage_multiplier[1] = 1.05 --1.15
self.values.player.passive_convert_enemies_health_multiplier[1] = 0.25 --0.55
self.values.player.convert_enemies_health_multiplier[1] = 0.65 --0.45
self.values.player.pick_up_ammo_multiplier[1] = 1.75 --1.35
self.values.team.stamina.passive_multiplier[1] = 1.15 --1.5
self.values.team.xp.multiplier[1] = 1.1 --1.3
self.values.team.weapon.suppression_recoil_multiplier[1] = 0.75 --0.5
self.values.shotgun.reload_speed_multiplier[1] = 1.5 --1.15
self.values.shotgun.damage_multiplier[1] = 1.2 --1.05
self.values.smg.recoil_multiplier = {0.75} --nil
self.values.smg.reload_speed_multiplier[1] = 1.33 --1.15
self.values.cable_tie.interact_speed_multiplier[1] = 0.5 --0.25
self.values.sentry_gun.damage_multiplier[1] = 2 --2.5
self.values.sentry_gun.armor_multiplier[1] = 2 --2.5
self.values.sentry_gun.spread_multiplier[1] = 0.5 --2
self.values.sentry_gun.extra_ammo_multiplier[1] = 1.5 --2
self.values.temporary.overkill_damage_multiplier[1][1] = 2 --1.75
self.values.temporary.overkill_damage_multiplier[1][2] = 6 --20
self.values.temporary.pistol_revive_from_bleed_out[1][2] = 3 --1
self.values.temporary.dmg_multiplier_outnumbered[1][1] = 1.1 --1.15
self.values.temporary.dmg_dampener_outnumbered[1][1] = 0.85 --0.9
self.values.trip_mine.explosion_size_multiplier = {1.25, 1.75} --nil
self.values.weapon.silencer_damage_multiplier[1] = 1.1 --1.15
self.values.weapon.silencer_damage_multiplier[2] = 1.2 --1.3
self.values.weapon.single_spread_multiplier[1] = 0.5 --0.8
self.values.weapon.passive_swap_speed_multiplier[1] = 1.2 --1.8
self.values.weapon.swap_speed_multiplier[1] = 1.25 --1.8
self.values.pistol.reload_speed_multiplier[1] = 1.33 --1.5
self.values.pistol.fire_rate_multiplier[1] = 2 --1.5
self.values.pistol.damage_multiplier[1] = 1.25 --1.5
self.values.carry.interact_speed_multiplier[1] = 0.6 --0.75
self.sentry_gun_base_ammo = 150 --100

self.ammo_bag_base = 3
self.taser_malfunction_min = 1
self.taser_malfunction_max = 3
self.values.cooldown.long_dis_revive = { {0.5, 1} }
self.values.player.drill_autorepair = {0.3}
self.values.player.small_loot_multiplier = {1.1, 1.3} 
self.values.player.pick_lock_easy_speed_multiplier = {0.75, 0.5}
self.values.trip_mine.quantity = {1, 4}

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

local self = tweak_data.attention
self.settings.pl_law_susp_peaceful = {
	reaction = "REACT_SUSPICIOUS",
	filter = "combatant",
	max_range = 600,
	suspicion_range = 500,
	suspicion_duration = 4,
	turn_around_range = 250,
	uncover_range = 150,
	notice_delay_mul = 0.3,
	verification_interval = 0.02,
	release_delay = 2,
	notice_requires_FOV = true
}
self.settings.pl_gangster_cur_peaceful = {
	reaction = "REACT_SUSPICIOUS",
	filter = "gangster",
	max_range = 600,
	suspicion_range = 500,
	suspicion_duration = 5.5,
	turn_around_range = 250,
	uncover_range = 90,
	notice_delay_mul = 0.3,
	verification_interval = 0.02,
	release_delay = 2,
	notice_requires_FOV = true
}
self.settings.pl_team_cur_peaceful = {
	reaction = "REACT_IDLE",
	filter = "criminal",
	max_range = 1000,
	notice_delay_mul = 1,
	verification_interval = 4,
	release_delay = 3,
	duration = {2, 5},
	pause = {15, 25},
	notice_requires_FOV = false
}
self.settings.pl_civ_idle_peaceful = {
	reaction = "REACT_IDLE",
	filter = "civilian",
	max_range = 600,
	notice_delay_mul = 0,
	notice_interval = 0.5,
	attract_chance = 0.5,
	verification_interval = 2,
	release_delay = 3,
	duration = {2, 15},
	pause = {10, 60},
	notice_requires_FOV = true
}
self.settings.pl_team_idle_std = {
	reaction = "REACT_IDLE",
	filter = "criminal",
	max_range = 1000,
	notice_delay_mul = 0,
	verification_interval = 4,
	release_delay = 3,
	duration = {1.7, 2.5},
	pause = {45, 90},
	notice_requires_FOV = false
}
self.settings.pl_enemy_cbt = {
	reaction = "REACT_COMBAT",
	filter = "all_enemy",
	verification_interval = 1,
	notice_interval = 0.1,
	uncover_range = 550,
	release_delay = 1,
	notice_clbk = "clbk_attention_notice_sneak",
	notice_requires_FOV = true
}
self.settings.pl_civ_cbt = {
	reaction = "REACT_COMBAT",
	filter = "civilian",
	verification_interval = 0.1,
	uncover_range = 550,
	release_delay = 1,
	notice_delay_mul = 1.5,
	notice_clbk = "clbk_attention_notice_sneak",
	notice_requires_FOV = true
}
self.settings.pl_enemy_cur_peaceful = {
	reaction = "REACT_CURIOUS",
	filter = "all_enemy",
	max_range = 600,
	notice_delay_mul = 0.5,
	verification_interval = 2,
	release_delay = 1,
	duration = {1.5, 3.5},
	pause = {25, 50},
	notice_requires_FOV = true
}
self.settings.pl_civ_sneak = {
	reaction = "REACT_COMBAT",
	filter = "civilian",
	verification_interval = 0.1,
	uncover_range = 200,
	release_delay = 1,
	notice_delay_mul = 3,
	max_range = 1500,
	notice_clbk = "clbk_attention_notice_sneak",
	notice_requires_FOV = true
}
self.settings.pl_enemy_sneak = {
	reaction = "REACT_COMBAT",
	filter = "all_enemy",
	verification_interval = 0.1,
	uncover_range = 350,
	release_delay = 1,
	notice_delay_mul = 2,
	max_range = 1500,
	notice_clbk = "clbk_attention_notice_sneak",
	notice_requires_FOV = true
}
self.settings.pl_enemy_cbt_crh = {
	reaction = "REACT_COMBAT",
	filter = "all_enemy",
	verification_interval = 0.1,
	uncover_range = 350,
	release_delay = 1,
	notice_delay_mul = 2,
	notice_requires_FOV = true
}
self.settings.enemy_team_corpse_cbt = {
	reaction = "REACT_IDLE",
	filter = "criminal",
	max_range = 800,
	notice_delay_mul = 2,
	verification_interval = 1.5,
	release_delay = 0,
	duration = {2, 3},
	pause = {50, 360},
	notice_requires_FOV = true
}
self.settings.enemy_law_corpse_cbt = {
	reaction = "REACT_CURIOUS",
	filter = "law_enforcer",
	max_range = 800,
	notice_delay_mul = 0.1,
	verification_interval = 1.5,
	release_delay = 1,
	duration = {2, 3},
	pause = {30, 120},
	notice_requires_FOV = true
}

self.settings.enemy_law_corpse_sneak.filter = "civilians_enemies" --"all"
self.settings.enemy_team_corpse_sneak.filter = "civilians_enemies" --"all"
self.settings.enemy_enemy_cbt.filter = "all_enemy" --"combatant"
self.settings.enemy_enemy_cbt.max_range = 8000 --3900
self.settings.sentry_gun_enemy_cbt.filter = "all_enemy" --"combatant"
self.settings.civ_enemy_corpse_sneak.filter = "civilians_enemies" --"all"
self.settings.team_enemy_cbt.filter = "all_enemy" --"all"
self.settings.civ_civ_cbt.filter = "civilian" --"all"
self.settings.team_enemy_idle.filter = "all_enemy" --"combatant"
self.settings.enemy_team_cbt.filter = "criminal" --"combatant"
self.settings.team_team_idle.filter = "criminal" --"all"
self.settings.enemy_team_idle.filter = "criminal" --"combatant"
self.settings.enemy_civ_cbt.filter = "civilian" --"non_combatant"
self.settings.civ_enemy_cbt.filter = "all_enemy" --"all"
self.settings.civ_enemy_cbt.notice_delay_mul = 0.6 --1