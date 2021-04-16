if string.lower(RequiredScript) == "lib/tweak_data/skilltreetweakdata" then
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
			"temporary_passive_revive_damage_reduction_2"
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
				upgrades = {"carry_throw_distance_multiplier"},
				cost = self.costs.default
			},
			{
				upgrades = {"carry_movement_speed_multiplier"},
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
				upgrades = {"temporary_single_shot_fast_reload_1", "snp_reload_speed_multiplier"},
				cost = self.costs.hightier
			},
			{
				upgrades = {
					"weapon_single_not_moving_head_shot_add",
					"weapon_single_steelsight_head_shot_add",
					"weapon_assault_rifle_single_head_shot_add",
					"weapon_smg_single_head_shot_add",
					"weapon_snp_single_head_shot_add"
				},
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
			"player_secondary_silencer_damage_addend",
			"player_reduce_silencer_alert_size"
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
			"jowi",
			"x_packrat",
			"x_1911",
			"x_b92fs",
			"x_deagle",
			"x_g22c",
			"x_g17",
			"x_usp",
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
end
if string.lower(RequiredScript) == "lib/managers/localizationmanager" then
	Hooks:AddHook("LocalizationManagerPostInit", "OPSkillDesc", function()
		local self = tweak_data.upgrades
		
		local function form(var, value, mul)
			mul = mul or 100
			if var == "a" then
				return (value[1] - 1) * mul
			elseif var == "a2" then
				return ((value[2] - 1) - (value[1] - 1)) * mul
			elseif var == "b" then
				return (1 - value[1]) * mul
			elseif var == "b2" then
				return ((1 - value[2]) - (1 - value[1])) * mul
			elseif var == "c" then
				return value[1] * mul
			elseif var == "c2" then
				return (value[2] - value[1]) * mul
			elseif var == "c3" then
				return (value[3] - value[2]) * mul
			elseif var == "d" then
				return math.floor(100 - (100 / mul * value[1]))
			elseif var == "e" then
				return 100 / 8 * value[1]
			elseif var == "f" then
				return value * mul
			elseif var == "g" then
				return (1 - value) * mul
			else
				return 0
			end
		end
 
 		local mastermind_tier5_1 = form("b2", self.values.doctor_bag.interaction_speed_multiplier)
		local mastermind_tier5_2 = form("b", self.values.doctor_bag.deploy_time_multiplier)
		local mastermind_tier6_1 = form("a", self.values.player.empowered_intimidation_mul)
		local mastermind_tier6_2 = form("c", self.values.player.passive_assets_cost_multiplier)
		local enforcer_tier3_1 = form("a2", self.values.player.passive_suppression_multiplier)
		local enforcer_tier3_2 = form("b", self.values.ammo_bag.interaction_speed_multiplier)
		local enforcer_tier5_1 = form("a", self.values.weapon.passive_damage_multiplier)
		local enforcer_tier5_2 = form("b2", self.values.ammo_bag.interaction_speed_multiplier)
		local technician_tier4_1 = form("a", self.values.weapon.passive_headshot_damage_multiplier)
		local hoxton_tier1_1 = form("b", self.values.player.gangster_damage_dampener)
		local hoxton_tier2_1 = form("c", self.values.player.damage_shake_addend, 10)
		local hoxton_tier3_1 = form("b2", self.values.player.gangster_damage_dampener)
		local hoxton_tier4_1 = form("a", self.values.weapon.special_damage_taken_multiplier)
		local hoxton_tier5_1 = form("a", self.values.player.fugitive_tier_health_multiplier)
		local hoxton_tier6_1 = form("b", self.values.player.camouflage_bonus)
		
		local hostage_taker_1_a = form("a", self.values.player.civ_intimidation_mul)
		local hostage_taker_1_b = form("b", self.values.player.hostage_interaction_speed_multiplier)
		local smooth_talker_1_b = form("b", self.values.player.alarm_pager_speed_multiplier)
		local inside_man_1_a = form("b", self.values.player.assets_cost_multiplier)
		local black_marketeer_1_a = form("b", self.values.player.buy_cost_multiplier)
		local black_marketeer_1_b = form("b2", self.values.player.buy_cost_multiplier)
		local black_marketeer_2_b = form("a", self.values.player.sell_cost_multiplier)
		local dominator_1_b = form("c", self.values.player.intimidate_aura, 0.05)
		local kilmer_1_a = form("a", self.values.assault_rifle.reload_speed_multiplier)
		local kilmer_1_b = form("c", self.values.assault_rifle.move_spread_multiplier)
		local stockholm_syndrome_1_b = form("c", self.values.player.super_syndrome, 1)
		local messiah_1_a = form("c", self.values.player.messiah_revive_from_bleed_out, 1)
		local messiah_1_b = form("c", self.values.player.messiah_revive_from_bleed_out, 1)
 
		local pack_mule_1_a = form("a", self.values.carry.throw_distance_multiplier)
		local pack_mule_1_b = form("a", self.values.carry.movement_speed_multiplier)
		local scavenger_1_a = form("a", self.values.player.increased_pickup_area)
		local scavenger_1_b = self.loose_ammo_give_team_ratio * 100
		local scavenger_2_b = self.values.temporary.loose_ammo_give_team[1][2]
		local shades_1_a = form("b", self.values.player.flashbang_multiplier)
		local shades_1_b = 3
		local shades_2_b = form("b2", self.values.player.flashbang_multiplier)
		local shotgun_cqb_1_a = form("a", self.values.shotgun.reload_speed_multiplier)
		local shotgun_cqb_1_b = form("b", self.values.shotgun.hip_fire_spread_index_addend)
		local shotgun_cqb_2_b = form("a", self.values.shotgun.hip_rate_of_fire)
		local from_the_hip_1_a = form("a", self.values.shotgun.enter_steelsight_speed_multiplier)
		local from_the_hip_1_b = form("c", self.values.player.shotgun_shield_knock)
		local from_the_hip_2_b = form("c", self.values.player.shotgun_steelsight_shield_knock)
		local overkill_1_a = form("a", self.values.temporary.overkill_damage_multiplier[1])
		local overkill_2_a = self.values.temporary.overkill_damage_multiplier[1][2]
		local overkill_1_b = self.values.temporary.overkill_damage_multiplier[2][2] - self.values.temporary.overkill_damage_multiplier[1][2]
		local overkill_2_b = form("d", self.values.saw.enemy_slicer, 14)
		local carbon_blade_1_a = form("a", self.values.saw.lock_damage_multiplier)
		local carbon_blade_1_b = form("c", self.values.saw.consume_no_ammo_chance)
		local carbon_blade_2_b = form("a2", self.values.saw.lock_damage_multiplier)
		local carbon_blade_3_b = form("a", self.values.saw.reload_speed_multiplier)
		
		local discipline_1_b = form("c", self.values.player.interacting_damage_multiplier)
		local master_craftsman_1_a = form("a", self.values.trip_mine.explosion_size_multiplier_1)
		local master_craftsman_1_b = form("a", self.values.trip_mine.explosion_size_multiplier_2)
		local master_craftsman_2_b = form("f", self.values.player.marked_enemy_damage_mul - 1)
		local marksman_1_a = form("e", self.values.weapon.single_spread_index_addend)
		local marksman_2_a = form("b", self.values.player.recoil_not_moving_mul)
		local marksman_3_a = form("b", self.values.player.recoil_not_moving_aim_mul)
		local marksman_1_b = form("c",  self.values.player.single_shot_fire_rate_mul)
		local marksman_2_b = form("b", self.values.player.single_shot_accuracy_inc)
		local sentry_gun_1_b = form("a", self.values.sentry_gun.armor_multiplier)
		local sentry_gun_2x_1_a = form("c", self.values.sentry_gun.quantity, 2)
		local sentry_gun_2x_1_b = form("a", self.values.sentry_gun.damage_multiplier)
		local body_expertise_1_a = form("a", self.values.snp.reload_speed_multiplier)
		local body_expertise_2_a = form("a", self.values.temporary.single_shot_fast_reload[1])
		local body_expertise_3_a = self.values.temporary.single_shot_fast_reload[1][2]
		local body_expertise_1_b = form("c", self.values.weapon.smg_single_head_shot_add)
		local body_expertise_2_b = form("c", self.values.weapon.assault_rifle_single_head_shot_add)
		local body_expertise_3_b = form("c", self.values.weapon.snp_single_head_shot_add)
		local iron_man_1_a = form("a", self.values.player.armor_multiplier)
		local iron_man_1_b = form("b", self.values.team.armor.regen_time_multiplier)
		local iron_man_2_b = form("c", self.values.player.passive_always_regen_armor, 1)
		
		local cat_burglar_1_a = form("b", self.values.player.fall_damage_multiplier)
		local chameleon_1_a = form("b", self.values.player.suspicion_multiplier)
		local chameleon_1_b = form("c", self.values.player.guards_cant_spot_you_in_casing, 1)
		local cleaner_1_a = form("c", self.values.player.corpse_dispose_amount, 1)
		local cleaner_2_a = self.bodybag_crate_base
		local cleaner_1_b = form("c2", self.values.player.corpse_dispose_amount, 1)
		local cleaner_2_b = form("b", self.values.player.corpse_dispose_speed_multiplier)
		local spotter_1_a = form("a", self.values.player.mark_enemy_time_multiplier)
		local silence_expert_1_a = form("b", self.values.weapon.silencer_recoil_multiplier)
		local silence_expert_2_a = form("a", self.values.weapon.silencer_enter_steelsight_speed_multiplier)
		local silence_expert_1_b = form("c", self.values.player.secondary_silencer_damage_addend, 10)
		local silence_expert_2_b = form("b", self.values.player.reduce_silencer_alert_size)
		local ecm_feedback_1_a = "50%-100%"
		local ecm_feedback_2_a = 25
		local ecm_feedback_3_a = 1.5
		local ecm_feedback_4_a = "15-20"
		local ecm_feedback_1_b = 3
		local ecm_feedback_2_b = 8
		local ecm_feedback_3_b = 25
		local ecm_feedback_4_b = 100
		local ecm_feedback_5_b = 4
		local hitman_1_a = form("a", self.values.weapon.silencer_damage_multiplier)
		local hitman_2_a = form("c", self.values.weapon.armor_piercing_chance_silencer)
		local hitman_1_b = form("a2", self.values.weapon.silencer_damage_multiplier)
		local hitman_2_b = form("c2", self.values.weapon.armor_piercing_chance_silencer)

		local mastercraftsman_1_a = form("b", self.values.player.crafting_weapon_multiplier)
		local mastercraftsman_1_b = form("a", self.values.player.passive_xp_multiplier)
		local awareness_1_b = form("b", self.values.temporary.dmg_dampener_outnumbered_strong[1])
		local thick_skin_1_a = form("a", self.values.player.tier_armor_multiplier)
		local thick_skin_1_b = form("c", self.values.player.level_2_armor_addend, 10)
		local jail_workout_1_a = (self.values.player.marked_enemy_damage_mul - 1) * 100
		local up_you_go_1_a = form("c", self.values.player.revived_health_regain_solid_amount)
		local up_you_go_2_a = form("c", self.values.player.revived_health_regain_solid_wolverine)
		local up_you_go_1_b = form("c2", self.values.player.revived_health_regain_solid_amount)
		local up_you_go_2_b = form("b", self.values.temporary.revived_damage_resist[1])
		local up_you_go_3_b = self.values.temporary.revived_damage_resist[1][2]
		local second_wind_1_a = form("a", self.values.temporary.damage_speed_multiplier[1])
		local second_wind_2_a = self.values.temporary.damage_speed_multiplier[1][2]
		local second_wind_1_b = form("c", self.values.player.level_2_dodge_addend)
		local tea_cookies_1_a = form("c", self.values.first_aid_kit.quantity, 1)
		local tea_cookies_1_b = 3
		local tea_cookies_2_b = form("c", self.values.temporary.chico_injector[1])
		local tea_cookies_3_b = self.values.temporary.chico_injector[1][2]
		local tea_cookies_4_b = form("c2", self.values.first_aid_kit.quantity, 1)
		local walking_bleedout_1_a = form("c", self.values.player.walking_bleedout_chance)
		local walking_bleedout_2_a = form("c", self.values.player.walking_bleedout_temporary_health_mul)
		local walking_bleedout_3_a = form("g", self.walking_bleedout_walk_speed_penalty)
		local walking_bleedout_4_a = form("f", self.walking_bleedout_reload_speed_penalty - 1)
		local walking_bleedout_5_a = tweak_data.player.damage.DOWNED_TIME - self.values.player.walking_bleedout_time_to_bleed[1]
		local walking_bleedout_6_a = self.walking_bleedout_time_to_fatal_state
		local walking_bleedout_1_b = form("c2", self.values.player.walking_bleedout_chance)
		local walking_bleedout_2_b = form("c", self.values.player.walking_bleedout_fak_self_revive)
		local more_blood_to_bleed_1_a = form("c2", self.values.player.walking_bleedout_temporary_health_mul)
		local more_blood_to_bleed_1_b = form("c3", self.values.player.walking_bleedout_temporary_health_mul)
		local more_blood_to_bleed_2_b = tweak_data.player.damage.DOWNED_TIME - self.values.player.walking_bleedout_time_to_bleed[2]
		local time_heals_1_a = self.values.player.walking_bleedout_ticks_to_ressurection[1]
		local time_heals_1_b = self.values.player.walking_bleedout_ticks_to_ressurection[2]
		local time_heals_2_b = form("c", self.values.player.walking_bleedout_fak_self_revive_additional)
		local akimbo_1_a = 50
		local akimbo_1_b = 25
		local akimbo_2_b = 50
		
		local mr_wise_guy_1 = form("a", self.values.team.xp.multiplier)
		local mr_wise_guy_2 = form("f", self.values.player.loot_drop_multiplier[2] - 1)
		local dead_presidents_1 = form("a", self.values.player.small_loot_multiplier)
		local dead_presidents_2 = form("b", self.values.player.reduce_loose_money_exp_convertation_amount_mul)
		local good_luck_charm_1 = form("f", self.values.player.tape_loop_duration[2], 1)
		local triathlete_1 = form("a", self.values.team.stamina.multiplier)
		local triathlete_2 = form("a", self.values.player.movement_speed_multiplier)
		local joker_1 = form("a", self.values.player.convert_enemies_damage_multiplier)
		local joker_2 = 70 .."-".. 95
		local ammo_reservoir_1 = self.values.weapon.clip_ammo_increase[1]
		local ammo_reservoir_2 = 10
		local keys_under_the_carpet_1 = form("b", self.values.player.pick_lock_speed_multiplier)
		local kick_starter_1 = 50
		local fire_trap_1 = 20
		local fire_trap_2 = 6
		local hostage_situation_1 = 0.5 .."-".. 2
		local hostage_situation_2 = 8

		LocalizationManager:add_localized_strings({
			menu_tea_cookies_desc =			"BASIC: ##$basic##\nAdds ##"..tea_cookies_1_a.."## more first aid kits to your inventory.\n\nACE: ##$pro##\nUnlocks ##"..tea_cookies_1_b.."## Injectors. Activating the Injector will heal you with ##"..tea_cookies_2_b.."%## of all damage taken for ##"..tea_cookies_3_b.."## seconds.\n\nAdds ##"..tea_cookies_4_b.."## more first aid kits to your inventory.",
			menu_gunzerker_desc =			"BASIC: ##$basic##\nYou can dual wield two shotguns.\n\nACE: ##$pro##\nYou can dual wield two SMG.",
			menu_time_heals_desc =			"BASIC: ##$basic##\nIf you keep yourself alive within ##"..time_heals_1_a.."## seconds, you can revive yourself.\n\nYour movement, interaction, reload speed and bleed-out time will be gradually recovered.\n\nACE: ##$pro##\nTime to keep yourself alive is reduced to ##"..time_heals_1_b.."## seconds.\nYou can revive yourself by using First Aid Kit with additional ##"..time_heals_2_b.."%## chance.",		
			menu_more_blood_to_bleed_desc =	"BASIC: ##$basic##\nYou recieve ##"..more_blood_to_bleed_1_a.."%## more temporary health.\n\nACE: ##$pro##\nYou recieve ##"..more_blood_to_bleed_1_b.."%## even more temporary health. Maximum bleed-out time penalty is now ##"..more_blood_to_bleed_2_b.."## seconds.",		
			menu_walking_bleedout_desc =	"BASIC: ##$basic##\nWhen you lose all your health instead of being downed you have a ##"..walking_bleedout_1_a.."%## chance to survive and gain ##"..walking_bleedout_2_a.."%## temporary health, but your movement and interaction speed will be reduced by ##"..walking_bleedout_3_a.."%##, and reload speed will be reduced by ##"..walking_bleedout_4_a.."%##.\n\nYour bleed-out time will be reduced every second down to ##"..walking_bleedout_5_a.."## seconds as long as you staying alive in that state.\n\nIf you going down after ##"..walking_bleedout_6_a.."## seconds, you fall immidiatly into the fatal state without a chance to fight back while laying down.\n\nYou can revive yourself before getting down by using a medic bag.\n\nACE: ##$pro##\nYou have additional ##"..walking_bleedout_1_b.."%## chance to survive.\n\nYou can revive yourself by using First Aid Kit with ##"..walking_bleedout_2_b.."%## chance.",
			menu_up_you_go_beta_desc =		"BASIC: ##$basic##\nYou always receive ##"..up_you_go_1_a.."%## health of your total amount when you get revived.\n\nSynergy: If you have ##Berserker## skill owned, you will receive ##"..up_you_go_2_a.."%## health when you get revived.\n\nACE: ##$pro##\nYou receive ##"..up_you_go_1_b.."%## additional health when you get revived.\nYou take ##"..up_you_go_2_b.."%## less damage for ##"..up_you_go_3_b.."## seconds after being revived.",
			menu_akimbo_skill_desc =		"BASIC: ##$basic##\nYou can dual wield two pistols.\n\nDual wielded weapons have ##"..akimbo_1_a.."%## stability penalty.\n\nACE: ##$pro##\nYour stability penalty with Akimbo weapons is set to ##"..akimbo_1_b.."%## and increases the ammo capacity of your Akimbo weapons to ##"..akimbo_2_b.."%##.",
			menu_second_wind_desc =			"BASIC: ##$basic##\nWhen your armor breaks your movement speed is increased by ##"..second_wind_1_a.."%## for ##"..second_wind_2_a.."## seconds.\n\nACE: ##$pro##\nYour chance to dodge is increased by ##"..second_wind_1_b.."%## for ballistic vests.",
			menu_jail_workout_desc =		"BASIC: ##$basic##\nSpecial enemies marked by you take ##"..jail_workout_1_a.."%## additional damage.\n\nACE: ##$pro##\nWhen you stand still for ##3.5## seconds in stealth, you start highlighting people around you within a ##10## meter radius.",
			menu_thick_skin_desc =			"BASIC: ##$basic##\nYou gain an additional ##"..thick_skin_1_a.."%## more armor.\n\nACE: ##$pro##\nIncreases the armor of all ballistic vests by ##"..thick_skin_1_b.."##.",
			menu_awareness_desc =			"BASIC: ##$basic##\nYour movement speed is unhindered while using steel sight.\n\nACE: ##$pro##\nWhen you are surrounded by three enemies or more, you receive ##"..awareness_1_b.."%## less damage from enemies.",		
			menu_mastercraftsman_desc =		"BASIC: ##$basic##\nYour cost of weapon and mask crafting is reduced by ##"..mastercraftsman_1_a.."%##.\n\nACE: ##$pro##\nYou gain ##"..mastercraftsman_1_b.."%## more experience for completing days and jobs.",

			menu_ecm_feedback_desc =		"BASIC: ##$basic##\nYou can interact with ECM jammers to cause a feedback loop. When interacted, the ECM jammer has a ##"..ecm_feedback_1_a.."## chance to incapacitate enemies within ##"..ecm_feedback_2_a.."## meters radius every ##"..ecm_feedback_3_a.."## seconds.\n\nECM feedback lasts ##"..ecm_feedback_4_a.."## seconds.\n\nACE: ##$pro##\nUnlocks ##"..ecm_feedback_1_b.."## Pocket ECM Device with ##"..ecm_feedback_2_b.."## second duration each.\n\nYou will instantly interact with a ECM jammer and the ECM feedback duration is increased by ##"..ecm_feedback_3_b.."%##.\n\nYour ECM jammer has a ##"..ecm_feedback_4_b.."%## chance every ##"..ecm_feedback_5_b.."## minutes to recharge its feedback ability.",
			menu_hitman_desc =				"BASIC: ##$basic##\nYou deal ##"..hitman_1_a.."%## more damage and have a ##"..hitman_2_a.."%## chance to pierce enemy armor with silenced weapons.\n\nACE: ##$pro##\nYou deal ##"..hitman_1_b.."%## more damage and have an additional ##"..hitman_2_b.."%## chance to pierce enemy armor with silenced weapons.",
			menu_silence_expert_desc =		"BASIC: ##$basic##\nYour weapon accuracy and stability with silenced weapons is increased by ##"..silence_expert_1_a.."%##. Your snap to zoom is ##"..silence_expert_2_a.."%## faster with silenced weapons.\n\nACE: ##$pro##\nAll silenced secondary weapon gain an additional ##"..silence_expert_1_b.."## damage.\nYour weapon silencers has been improved and now make to ##"..silence_expert_2_b.."%## less noise.",
			menu_spotter_desc =				"BASIC: ##$basic##\nIncreases the duration of marked enemies by ##"..spotter_1_a.."%##.\n\nACE: ##$pro##\nUnlocks the Spotter asset in the Job Overview menu.\n\nDuring stealth, the Spotter will highlight guards for you and your crew. If stealth is not an option, the Spotter will highlight special enemies for you and your crew.",
			menu_cleaner_desc =				"BASIC: ##$basic##\n##"..cleaner_1_a.."## body bag is added to your inventory.\n\nYou can now buy a body bag asset which contains ##"..cleaner_2_a.."## body bags that can be shared with your crew.\n\nACE: ##$pro##\n##"..cleaner_1_b.."## additional body bag is added to your inventory.\n\nYou bag corpses ##"..cleaner_2_b.."%## faster.",
			menu_chameleon_desc =			"BASIC: ##$basic##\nIn casing mode, you can mark guards, cameras and your concealment is increased by ##"..chameleon_1_a.."%##.\n\nACE: ##$pro##\nIf your detection risk is ##"..chameleon_1_b.."## or below, you cannot be spotted by guards in casing mode.",
			menu_cat_burglar_desc =			"BASIC: ##$basic##\nYou take ##"..cat_burglar_1_a.."%## less damage from falling from non-lethal heights.\n\nACE: ##$pro##\nNow you can land silently when you fall from a non-lethal heights, and also you do not lose health.",
	
			menu_iron_man_desc =			"BASIC: ##$basic##\nYour armor is increased by ##"..iron_man_1_a.."%##.\n\nACE: ##$pro##\nThe armor recovery rate of you and your crew is increased by ##"..iron_man_1_b.."%##.\n\nYour armor will recover ##"..iron_man_2_b.."## seconds after being broken no matter what the situation.",
			menu_aggressive_shots_desc =	"BASIC: ##$basic##\nIncreases your reload speed with sniper rifles by ##"..body_expertise_1_a.."%##.\nAny killing headshot will increase your reload speed by additional ##"..body_expertise_2_a.."%## for ##"..body_expertise_3_a.."## seconds. Can only be triggered by SMGs, Assault Rifles and Sniper Rifles fired in single shot fire mode.\n\nACE: ##$pro##\nBonus headshot damage is permanently applied to hitting enemies on the body in steelsight with single fire mode, ##"..body_expertise_1_b.."%## for SMGs, ##"..body_expertise_2_b.."%## for Assault Rifles and ##"..body_expertise_3_b.."%## for Sniper Rifles.",
			menu_sentry_gun_2x_desc =		"BASIC: ##$basic##\nYou can place ##"..sentry_gun_2x_1_a.."## sentry guns instead of just one.\n\nACE: ##$pro##\nYour sentry gun damage is increased by ##"..sentry_gun_2x_1_b.."%##.\n\nUnlocks a special modified less noticeable turret with armor-piercing rounds, reduced rate of fire, and significantly increased damage.",
			menu_sentry_gun_desc =			"BASIC: ##$basic##\nUnlocks the sentry gun for you to use.\n\nACE: ##$pro##\nYour sentry gun gains ##"..sentry_gun_1_b.."%## more health and rotational speed.",
			menu_master_craftsman_desc =	"BASIC: ##$basic##\nThe radius of trip mine explosions are increased by ##"..master_craftsman_1_a.."%##.\n\nACE: ##$pro##\nThe radius of trip mine explosions are increased by additional ##"..master_craftsman_1_b.."%##.\n\nSpecial enemies marked by your trip mines take ##"..master_craftsman_2_b.."%## more damage.",
			menu_sharpshooter_beta_desc =	"BASIC: ##$basic##\nYou gain ##"..marksman_1_a.."%## weapon accuracy with all SMGs, Assault Rifles and Sniper Rifles fired in single shot fire mode.\n\nYou gain ##"..marksman_2_a.."%## stability boost when not moving and ##"..marksman_3_a.."%## when aiming for all weapons with single shot fire.\n\nACE: ##$pro##\nIncreased fire rate up to ##"..marksman_1_b.."%## and you gain a ##"..marksman_2_b.."%## accuracy bonus while aiming down sights with all SMGs, Assault Rifles and Sniper Rifles fired in single shot fire mode.",
			menu_discipline_desc =			"BASIC: ##$basic##\nYou can use steel sight while in bleedout.\n\nACE: ##$pro##\nYou take ##"..discipline_1_b.."%## less damage while interacting with things.",
	
			menu_carbon_blade_desc =		"BASIC: ##$basic##\nYou replace your saw blades with carbon blades, increasing your saw efficiency by ##"..carbon_blade_1_a.."%##.\n\nACE: ##$pro##\nChance to avoid wearing down the saw's blade while using it is now ##"..carbon_blade_1_b.."%##. Saws are ##"..carbon_blade_2_b.."%## more effective.\n\nReload speed of OVE9000 poratable saw increased by ##"..carbon_blade_3_b.."%##.",
			menu_overkill_desc =			"BASIC: ##$basic##\nWhenever you kill an enemy using a shotgun or the OVE9000 portable saw, you receive a ##"..overkill_1_a.."%## damage bonus that lasts ##"..overkill_2_a.."## seconds.\n\nACE: ##$pro##\nDamage boost duration is increased by additional ##"..overkill_1_b.."## seconds.\nThe damage boost now applies to all weapons. Skill must still be activated using a shotgun or the OVE9000 portable saw.\n\nYou can now saw through shields, also attacking enemies with the OVE9000 portable saw wears down the blades ##"..overkill_2_b.."%## less than before.\n\nNote: Does not apply to melee damage, throwables, grenade launchers, bows, crossbows or rocket launchers.",
			menu_from_the_hip_desc =		"BASIC: ##$basic##\nIncreases your shotgun steel sight speed by ##"..from_the_hip_1_a.."%##.\n\nACE: ##$pro##\nGives your shotgun shots a ##"..from_the_hip_1_b.."%## chance to knock down Shields when shooting them from the hip, and ##"..from_the_hip_2_b.."%## while aiming.",
			menu_shotgun_cqb_desc =			"BASIC: ##$basic##\nIncreases your shotgun reload speed by ##"..shotgun_cqb_1_a.."%##.\n\nACE: ##$pro##\nIncreases your shotgun weapon accuracy by ##"..shotgun_cqb_1_b.."%## when firing from the hip.\n\nYour rate of fire is increased by ##"..shotgun_cqb_2_b.."%## while firing from the hip with single shot Shotguns.",
			menu_scavenger_desc =			"BASIC: ##$basic##\nYour ammo box pick up range is increased by ##"..scavenger_1_a.."%##.\n\nACE: ##$pro##\nWhen you pick up ammo, you trigger an ammo pickup for ##"..scavenger_1_b.."%## of normal pickup to other players in your team. Cannot occur more than once every ##"..scavenger_2_b.."## seconds.",
			menu_pack_mule_desc =			"BASIC: ##$basic##\nYou can throw bags ##"..pack_mule_1_a.."%## further.\n\nACE: ##$pro##\nYou move ##"..pack_mule_1_b.."%## faster when carrying bags.",

			menu_pistol_beta_messiah_desc =	"BASIC: ##$basic##\nWhile in bleedout, you can revive yourself by killing an enemy. You only have ##"..messiah_1_a.."## charge.\n\nACE: ##$pro##\nYour Messiah charges are replenished whenever you use a doctor bag, one for each medic bag use.\n\nYou now have ##"..messiah_1_b.."## additional charges.",
			menu_stockholm_syndrome_desc =	"BASIC: ##$basic##\nNearby civilians have a chance of reviving you if you interact with them. Civilians reviving you have a chance of giving you ammo.\n\nACE: ##$pro##\nYour hostages will not flee when they have been rescued by law enforcers. Whenever you get into custody, your hostages will trade themselves for your safe return. This effect can occur during assaults, but only ##"..stockholm_syndrome_1_b.."## time during a heist.",
			menu_kilmer_desc =				"BASIC: ##$basic##\nIncreases your reload speed with assault rifles by ##"..kilmer_1_a.."%##.\n\nACE: ##$pro##\nYour weapon accuracy while moving with assault rifles is increased by ##"..kilmer_1_b.."%##.\n\nRun and reload - you can now reload your weapons while sprinting.",
			menu_dominator_desc =			"BASIC: ##$basic##\nNow you can intimidate an enemy during the stealth and assault. Doing so won't require you to answer their pager.\n\nACE: ##$pro##\nYou can now intimidate ##2## enemies.\n\nThe power and range of your intimidation is increased by ##"..dominator_1_b.."%##.",
			menu_control_freak_desc =		"BASIC: ##$basic##\nDistressed civilians who trying to escape or call the police are marked by a blue question mark. It gives you more time to intimidate them.\n\nACE: ##$pro##\nNoise created by you intimidates civilians.",
			menu_black_marketeer_desc =		"BASIC: ##$basic##\nReduces the cost of all your purchases by ##"..black_marketeer_1_a.."%##.\n\nACE: ##$pro##\nFurther reduces the cost of all your purchases by ##"..black_marketeer_1_b.."%## and selling items is now ##"..black_marketeer_2_b.."%## more lucrative.",
			menu_inside_man_desc =			"BASIC: ##$basic##\nReduces the asset costs in the Job Overview menu by ##"..inside_man_1_a.."%##.\n\nACE: ##$pro##\nUnlocks special Inside Man assets in the Job Overview menu.",
			menu_smooth_talker_desc =		"BASIC: ##$basic##\nYou can successfully answer ##2## additional pagers.\n\nACE: ##$pro##\nYou answer pagers ##"..smooth_talker_1_b.."%## faster.",
			menu_hostage_taker_desc =		"BASIC: ##$basic##\nCivilians remain intimidated ##"..hostage_taker_1_a.."%## longer.\n\nACE: ##$pro##\nInteraction with hostages to move them is reduced by ##"..hostage_taker_1_b.."%##.",

			menu_gunzerker =				"Gunzerker",
			menu_time_heals =				"Rehab",
			menu_more_blood_to_bleed =		"More Blood to Bleed",
			menu_walking_bleedout =			"Fatal Injury",
			menu_second_wind =				"Second Wind",
			menu_up_you_go_beta =			"Strong Stitches",
			menu_mastercraftsman =			"Fast Learner",
			menu_spotter =					"Spotter",
			menu_aggressive_shots =			"Body Expertise",
			menu_sentry_gun =				"Sentry Gun",
			menu_scavenger =				"Scavenger",
			menu_control_freak =			"Control Freak",
			menu_black_marketeer =			"Black Marketeer",
			menu_inside_man =				"Inside Man",
			menu_smooth_talker =			"Smooth Talker",
			menu_hostage_taker =			"Hostage Taker",
			menu_awareness =				"Shoot 'n Scoot",
			
			menu_mastermind_tier_5 =		"Increases your doctor bag interaction speed by additional ##"..mastermind_tier5_1.."%##.\nDecreases your doctor bag deploy time by ##"..mastermind_tier5_2.."%##.",
			menu_mastermind_tier_6 =		"The power of your intimidation is increased by ##"..mastermind_tier6_1.."%##. Reduces the asset costs in the Job Overview by ##"..mastermind_tier6_2.."%##.\n\nYou now a chance of finding cable ties in ammo boxes, ##20%## in loud and a guaranteed pickup during stealth.",
			menu_menu_enforcer_tier_3 =		"Enemies are ##"..enforcer_tier3_1.."%## more easily threatened by you.\nIncreases your ammo bag interaction speed by ##"..enforcer_tier3_2.."%##.",
			menu_menu_enforcer_tier_5 =		"You do ##"..enforcer_tier5_1.."%## more damage.\nIncreases your ammo bag interaction speed by ##"..enforcer_tier5_2.."%##.",
			menu_technician_tier_4 =		"Increases your headshot damage by ##"..technician_tier4_1.."%##.",
			menu_hoxton_tier_1 =			"The damage thugs deal to you is reduced by ##"..hoxton_tier1_1.."%##",
			menu_hoxton_tier_2 =			"Your steadiness is increased by ##"..hoxton_tier2_1.."##.",
			menu_hoxton_tier_3 =			"The damage thugs deal to you is reduced by ##"..hoxton_tier3_1.."%##",
			menu_hoxton_tier_4 =			"You deal ##"..hoxton_tier4_1.."%## more damage against special enemies.",
			menu_hoxton_tier_5 =			"You gain ##"..hoxton_tier5_1.."%## more health.",
			menu_hoxton_tier_6 =			"You are ##"..hoxton_tier6_1.."%## less likely to be targeted by enemies.",

			menu_bonus_exp =		 					"Mr. Wise Guy",
			menu_bonus_exp_desc =		 				"Increasing experience to you and your crew.",
			menu_bonus_exp_detailed_desc =				"You gain ##"..mr_wise_guy_1.."%## more experience to you and your crew for completing days and job.\n\nYour chance of getting a higher quality item during a PAYDAY is increased by ##"..mr_wise_guy_2.."%##.",
			menu_bonus_small_money =	 				"Dead Presidents",
			menu_bonus_small_money_desc =				"Increasing value of loose items that you grab.",
			menu_bonus_small_money_detailed_desc =		"Adds ##"..dead_presidents_1.."%## more value to loose items that you pick up.\n\nReduced money needed to convert into an experience bonus by ##"..dead_presidents_2.."%## when you found a loose cash.",
			menu_good_luck_charm_desc =					"Interacting with a camera will cause the camera to temporarily see a pre-recording.",
			menu_good_luck_charm_detailed_desc =		"Interacting with a camera at close range will cause the camera to temporarily see a pre-recording for the next ##"..good_luck_charm_1.."## seconds so you can sneak past it.",
			menu_triathlete_desc =		 				"Increases stamina for you and your crew.",
			menu_triathlete_detailed_desc =		 		"Increases stamina for you and your crew by ##"..triathlete_1.."%##.\n\nYou gain ##"..triathlete_2.."%## additional movement speed.\n\nYou gain the ability to sprint in any direction.",
			menu_joker_desc =		 					"You can convert a non-special enemy to fight on your side.",
			menu_joker_detailed_desc =					"You can convert a non-special enemy to fight on your side. The converted enemy deals ##"..joker_1.."%## more damage and takes ##"..joker_2.."%## less damage depends of difficulty.",
			menu_ammo_reservoir_desc =		 			"Ammo bags placed by you grant the ability to shoot without depleting ammunition.",
			menu_ammo_reservoir_detailed_desc =			"Your weapon magazine capacity is increased by ##"..ammo_reservoir_1.."## rounds.\n\nAmmo bags placed by you grant players the ability to shoot without depleting their ammunition for up to ##"..ammo_reservoir_1.."## seconds after interacting with it. The more ammo players replenish, the longer duration of the effect.",
			menu_keys_under_the_carpet =				"Keys under the Carpet",
			menu_keys_under_the_carpet_desc =			"Improves lockpicking.",
			menu_keys_under_the_carpet_detailed_desc =	"You pick locks ##"..keys_under_the_carpet_1.."%## faster.\n\nYou can pick locks while in casing mode.",
			menu_infiltrator =							"Infiltrator",
			menu_infiltrator_desc =						"Improves casing mode",
			menu_infiltrator_detailed_desc =			"You can pick up items, use desktop, keycards to doors and timelocks, also answer the phone while in casing mode.",
			menu_kick_starter_desc =					"Fix a broken drill with melee hit.",
			menu_kick_starter_detailed_desc =			"Gives you the ability to fixing a broken drill or saw with a melee attack. The odd for a success is ##"..kick_starter_1.."%##. The ability can only be used once per jam.",
			menu_fire_trap_desc =						"Modifies your trip mines into incendiary.",
			menu_fire_trap_detailed_desc =				"Your trip mines now spread fire around the area of detonation for ##"..fire_trap_1.."## seconds in a ##"..fire_trap_2.."## meter diameter.",
			menu_hostage_situation =					"Hostage Situation",
			menu_hostage_situation_desc =				"Cover-up by hostages.",
			menu_hostage_situation_detailed_desc =		"You and your crew gain ##"..hostage_situation_1.."## depends on difficulty damage absorption for each hostage you have. This effect stacks with up to a maximum of ##"..hostage_situation_2.."##.\n\nNote: This skill does not stack if multiple players equip it.",

		})

		if Idstring("russian"):key() == SystemInfo:language():key() then
			LocalizationManager:add_localized_strings({
				menu_tea_cookies_desc =			"БАЗОВЫЙ: ##$basic##\nДобавляет ##"..tea_cookies_1_a.."## аптечки первой помощи в инвентарь.\n\nПРО: ##$pro##\nОткрывает ##"..tea_cookies_1_b.."## инъектора. Активируя инъектор, вы будете исцеляться на ##"..tea_cookies_2_b.."%## от всего получаемого урона в течение ##"..tea_cookies_3_b.."## секунд.\n\nДобавляет ещё ##"..tea_cookies_4_b.."## аптечек первой помощи в инвентарь.",
				menu_gunzerker_desc =			"БАЗОВЫЙ: ##$basic##\nОткрывает парные дробовики.\n\nПРО: ##$pro##\nОткрывает парные пистолеты-пулеметы.",
				menu_time_heals_desc =			"БАЗОВЫЙ: ##$basic##\nЕсли вы будете поддерживать себя живим на протяжении ##"..time_heals_1_a.."## секунд, то вы можете пережить падение.\n\nВаша скорость ходьбы, взаимодействия, перезарядки и время блидаута будет постепенно восстанавливатся.\n\nПРО: ##$pro##\nВремя поддерживания себя живым снижено до ##"..time_heals_1_b.."## секунд.\nАптечки первой помощи могут полностью вас вылечить с дополнительным ##"..time_heals_2_b.."%## шансом.",
				menu_more_blood_to_bleed_desc =	"БАЗОВЫЙ: ##$basic##\nВы получаете на ##"..more_blood_to_bleed_1_a.."%## больше временного здоровья.\n\nПРО: ##$pro##\nВы получаете ещё на ##"..more_blood_to_bleed_1_b.."%## больше временного здоровья.\n\nМаксимальный штраф времени в блидауте теперь ##"..more_blood_to_bleed_2_b.."## секунд.",
				menu_walking_bleedout_desc =	"БАЗОВЫЙ: ##$basic##\nС шансом ##"..walking_bleedout_1_a.."%## вы можете пережить смертельное попадание и получить ##"..walking_bleedout_2_a.."%## временного здоровья, но ваша скорость взаимодействия и передвижения снижается на ##"..walking_bleedout_3_a.."%##, а скорость перезарядки снижается на ##"..walking_bleedout_4_a.."%##.\n\nВремя блидаута снижается с каждой секундой максимум до ##"..walking_bleedout_5_a.."## секунд находясь в этом состоянии.\n\nНаходясь в этом состоянии ##"..walking_bleedout_6_a.."## секунд и более, если вас добили враги, то ваше падение становится фатальным, без возможности отстреливатся во время блидаута.\n\nИспользование медицинской сумки полностью вылечивает вас от смертельного состояния.\n\nПРО: ##$pro##\nВы получаете дополнительные ##"..walking_bleedout_1_b.."%## шанса чтобы пережить сметельное ранение.\n\nАптечки первой помощи могут полностью вас вылечить с шансом ##"..walking_bleedout_2_b.."%##.",
				menu_up_you_go_beta_desc =		"БАЗОВЫЙ: ##$basic##\nВы всегда получаете ##"..up_you_go_1_a.."%## здоровья от вашего общего количества после того, как вас подняли.\n\nСинергия: если у вас открыт навык ##Берсеркер##, тогда ваше количество здоровья будет ##"..up_you_go_2_a.."%## после того, как вас подняли.\n\nПРО: ##$pro##\nВы получаете дополнительно ##"..up_you_go_1_b.."%## здоровья после того, как вас подняли.\nВы получаете на ##"..up_you_go_2_b.."%## меньше урона в течение ##"..up_you_go_3_b.."## секунд после того, как вас подняли.",
				menu_akimbo_skill_desc =		"БАЗОВЫЙ: ##$basic##\nТеперь вы можете использовать парные пистолеты. У всего парного оружия стабильность снижена на ##"..akimbo_1_a.."%##.\n\nПРО: ##$pro##\nУ всего парного оружия стабильность снижена на ##"..akimbo_1_b.."%##, а количество их боеприпасов повышается на ##"..akimbo_2_b.."%##.",
				menu_second_wind_desc =			"БАЗОВЫЙ: ##$basic##\nКогда вы лишаетесь брони во время боя, скорость вашего передвижения увеличивается на ##"..second_wind_1_a.."%## в течение ##"..second_wind_2_a.."## секунд.\n\nПРО: ##$pro##\nПри ношении баллистических бронежилетов, шанс увернуться от вражеского огня увеличен на ##"..second_wind_1_b.."%##.",
				menu_jail_workout_desc =		"БАЗОВЫЙ: ##$basic##\nСпециальные юниты отмеченные вами получают на ##"..jail_workout_1_a.."%## больше урона.\n\nПРО: ##$pro##\nЕсли вы до поднятия тревоги стоите на месте ##3.5## секунды, не совершая никаких действий, то начнёте автоматически помечать всех людей на расстоянии в ##10## метров.",				
				menu_thick_skin_desc =			"БАЗОВЫЙ: ##$basic##\nПрочность брони увеличена ещё на ##"..thick_skin_1_a.."%##.\n\nПРО: ##$pro##\nПрочность всех баллистических бронежилетов увеличена на ##"..thick_skin_1_b.."##.",
				menu_awareness_desc =			"БАЗОВЫЙ: ##$basic##\nСкорость передвижения не изменяется, когда вы прицеливаетесь.\n\nПРО: ##$pro##\nКогда вы находитесь на средней дистанции к врагу, вы будете получать на ##"..awareness_1_b.."%## меньше урона.",
				menu_mastercraftsman_desc =		"БАЗОВЫЙ: ##$basic##\nУменьшает цену улучшения оружия и покраски масок на ##"..mastercraftsman_1_a.."%##.\n\nПРО: ##$pro##\nВы получаете ##"..mastercraftsman_1_b.."%## больше опыта при завершении дней и контрактов.",

				menu_ecm_feedback_desc =		"БАЗОВЫЙ: ##$basic##\nПозволяет взаимодействовать с генераторами помех, чтобы создать акустическую петлю. После взаимодействия, генератор может с вероятностью ##"..ecm_feedback_1_a.."## оглушать врагов в радиусе ##"..ecm_feedback_2_a.."## метров каждые ##"..ecm_feedback_3_a.."## секунды.\n\nПетля длится ##"..ecm_feedback_4_a.."## секунд.\n\nПРО: ##$pro##\nОткрывает ##"..ecm_feedback_1_b.."## Карманных генератора помех, который работает ##"..ecm_feedback_2_b.."## секунд каждый.\n\nВы моментально взаимодействуете с генератором помех. Время действия петли увеличено на ##"..ecm_feedback_3_b.."%##.\n\nГенератор помех перезаряжается с вероятностью ##"..ecm_feedback_4_b.."%## каждые ##"..ecm_feedback_5_b.."## минуты, позволяя снова включить петлю.",
				menu_hitman_desc =				"БАЗОВЫЙ: ##$basic##\nУрон любого оружия с глушителем и шанс пробить вражескую броню увеличены на ##"..hitman_1_a.."%## и ##"..hitman_2_a.."%## соответственно.\n\nПРО: ##$pro##\nУрон любого оружия с глушителем и шанс пробить вражескую броню увеличены на дополнительные ##"..hitman_1_b.."%## и ##"..hitman_2_b.."%## соответственно.",
				menu_silence_expert_desc =		"БАЗОВЫЙ: ##$basic##\nПовышает точность и стабильность оружия с установленным глушителем на ##"..silence_expert_1_a.."%##. Вы прицеливаетесь на ##"..silence_expert_2_a.."%## быстрее со всем оружием, на котором установлен глушитель.\n\nПРО: ##$pro##\nВаше вторичное оружие с установленным глушителем наносит дополнительные ##"..silence_expert_1_b.."## урона.\nВаши глушители улучшены на шумоподавление и теперь издают на ##"..silence_expert_2_b.."%## меньше шума при стрельбе.",
				menu_spotter_desc =				"БАЗОВЫЙ: ##$basic##\nУвеличивает продолжительность пометки врагов на ##"..spotter_1_a.."%##.\n\nПРО: ##$pro##\nОткрывает активы Наблюдателя в меню задания.\n\nВо время стелса, наблюдатель будет подсвечивать охрану для вас и вашей команды. После поднятия тревоги наблюдатель будет подсвечивать специальных юнитов.",
				menu_cleaner_desc =				"БАЗОВЫЙ: ##$basic##\nВ инвентаре будет ##"..cleaner_1_a.."## мешкок с самого начала.\n\nВы можете купить мешки для трупов в меню активов для себя и команды. Актив содержит ##"..cleaner_2_a.."## мешка.\n\nПРО: ##$pro##\nВ инвентаре будет ##"..cleaner_1_b.."## дополнительный мешкок с самого начала.\n\nСкорость упаковки трупов увеличена на ##"..cleaner_2_b.."%##.",
				menu_chameleon_desc =			"БАЗОВЫЙ: ##$basic##\nВы можете подсвечивать охрану и камеры в режиме исследования. Вы на ##"..chameleon_1_a.."%## скрытнее для гражданских и врагов до тех пор, пока не наденете маску.\n\nПРО: ##$pro##\nЕсли ваша скрытность ##"..chameleon_1_b.."## или ниже, охранники не не смогут вас заподозрить в режиме исследования.",
				menu_cat_burglar_desc =			"БАЗОВЫЙ: ##$basic##\nУрон от падения с несмертельной высоты снижен на ##"..cat_burglar_1_a.."%##.\n\nПРО: ##$pro##\nПадая с несмертельной высоты вы приземляетесь бесшумно, а так же при падении вы не теряете здоровье.",

				menu_iron_man_desc =			"БАЗОВЫЙ: ##$basic##\nПоказатель брони увеличен на ##"..iron_man_1_a.."%## .\n\nПРО: ##$pro##\nУвеличивает скорость восстановления брони у вас и у напарников на ##"..iron_man_1_b.."%##.\n\nКогда вы лишитесь брони, то она восстановится через ##"..iron_man_2_b.."## секунд даже будучи под обстрелом.",
				menu_aggressive_shots_desc =	"БАЗОВЫЙ: ##$basic##\nУвеличивает скорость перезарядки снайперских винтовок на ##"..body_expertise_1_a.."%##. Убийство в голову увеличивает вашу скорость перезарядки на дополнительные ##"..body_expertise_2_a.."%## в течение ##"..body_expertise_3_a.."## секунд.\n\nПРО: ##$pro##\nМножитель попадания в голову применяется к телу противника с эффективностью в ##"..body_expertise_1_b.."%## с пистолетами-пулемётами, ##"..body_expertise_2_b.."%## с штурмовыми винтовками и ##"..body_expertise_3_b.."%## со снайперскими винтовками при прицеливании в режиме одиночной стрельбы.",
				menu_sentry_gun_2x_desc =		"БАЗОВЫЙ: ##$basic##\nПозволяет устанавливать ##"..sentry_gun_2x_1_a.."## турели вместо одной.\n\nПРО: ##$pro##\nУвеличивает урон, наносимый вашими турелями на ##"..sentry_gun_2x_1_b.."%##.\n\nОткрывает менее заметную, приглушённую бронебойную турель с уменьшенной скорострельностью, но значительно увеличенным уроном.",
				menu_sentry_gun_desc =			"БАЗОВЫЙ: ##$basic##\nОткрывает турель.\n\nПРО: ##$pro##\nЗдоровье и скорость вращения ваших турелей увеличено на ##"..sentry_gun_1_b.."%##.\n\nОткрывает особую модифицированную менее заметную турель с приглушённым стволом, бронебойными патронами, уменьшенной скорострельность для экономии патронов и увеличенным количеством урона.",
				menu_master_craftsman_desc =	"БАЗОВЫЙ: ##$basic##\nУвеличивает радиус поражения мин на ##"..master_craftsman_1_a.."%##.\n\nПРО: ##$pro##\nУвеличивает радиус поражения мин еще на ##"..master_craftsman_1_b.."%##.\n\nСпециальные юниты, отмеченные вашими минами, получают на ##"..master_craftsman_2_b.."%## больше урона.",
				menu_sharpshooter_beta_desc =	"БАЗОВЫЙ: ##$basic##\nВы получаете ##"..marksman_1_a.."%## точности для всех пистолетов-пулеметов, штурмовых и снайперских винтовок в режиме одиночной стрельбы.\n\nТакже вы получаете прибавку к стабильности на ##"..marksman_2_a.."%## не двигаясь и ##"..marksman_3_a.."%## при прицеливании из оружия с одиночным режимом стрельбы.\n\nПРО: ##$pro##\nУвеличена скорострельность на ##"..marksman_1_b.."%## и увеличена точность, при прицельной стрельбе на ##"..marksman_2_b.."%## из пистолетов-пулеметов, штурмовых и снайперских винтовок в режиме одиночной стрельбы.",
				menu_discipline_desc = 			"БАЗОВЫЙ: ##$basic##\nВы можете прицеливаться, когда упали.\n\nПРО: ##$pro##\nПолучаемый урон снижен на ##"..discipline_1_b.."%##, если вы взаимодействуете с каким-либо предметом.",

				menu_carbon_blade_desc =		"БАЗОВЫЙ: ##$basic##\nВы заменяете лезвия вашей пилы на углеродные, повышая тем самым её эффективность на ##"..carbon_blade_1_a.."%##.\n\nПРО: ##$pro##\nЛезвия пилы при использовании не изнашиваются с шансом ##"..carbon_blade_1_b.."%##. Лезвия становятся на ##"..carbon_blade_2_b.."%## эффективнее.\n\nСкорость смены лезвий портативной пилы OVE9000 увеличивается на ##"..carbon_blade_3_b.."%##.",
				menu_overkill_desc =			"БАЗОВЫЙ: ##$basic##\nПосле убийства врага с помощью дробовика или пилы OVE9000, вы будете наносить на ##"..overkill_1_a.."%## больше урона в течение ##"..overkill_2_a.."## секунд.\n\nПРО: ##$pro##\nУвеличено время действия навыка на дополнительные ##"..overkill_1_b.."## секунд. Бонус к урону теперь применяется ко всему оружию. Навык должен быть активирован использованием дробовика или пилы OVE9000.\n\nТеперь вы можете прорезать щитовиков своей пилой OVE9000, а также атака врагов портативной пилой изнашивает лезвия на ##"..overkill_2_b.."%## меньше.\n\nВнимание: действие навыка не распространяется на гранатомёты, метательное, луки и арбалеты.",
				menu_from_the_hip_desc =		"БАЗОВЫЙ: ##$basic##\nПовышает скорость прицеливания из дробовиков на ##"..from_the_hip_1_a.."%##.\n\nПРО: ##$pro##\nПри стрельбе по щитовику из дробовика от бедра, у вас есть шанс отбросить его назад с шансом ##"..from_the_hip_1_b.."%## и ##"..from_the_hip_2_b.."%## при прицеливании.",
				menu_shotgun_cqb_desc =			"БАЗОВЫЙ: ##$basic##\nПовышает скорость перезарядки дробовиков на ##"..shotgun_cqb_1_a.."%##.\n\nПРО: ##$pro##\nПовышает точность вашего дробовика при стрельбе от бедра на ##"..shotgun_cqb_1_b.."%##.\n\nВаша скорострельность будет увеличена на ##"..shotgun_cqb_2_b.."%## при стрельбе от бедра из дробовиков с одиночным режимом стрельбы.",
				menu_scavenger_desc =			"БАЗОВЫЙ: ##$basic##\nРадиус, с которого вы можете поднимать патроны увеличен на ##"..scavenger_1_a.."%##.\n\nПРО: ##$pro##\nКогда вы собираете боеприпасы, оставленные врагами, ваши напарники будут получать ##"..scavenger_1_b.."%## от собранного вами количества.\n\nНавык срабатывает только один раз за ##"..scavenger_2_b.."## секунд.",
				menu_pack_mule_desc =			"БАЗОВЫЙ: ##$basic##\nПозволяет кидать сумки на ##"..pack_mule_1_a.."%## дальше.\n\nПРО: ##$pro##\nПозволяет передвигаться с сумкой быстрее на ##"..pack_mule_1_b.."%##.",
	
				menu_pistol_beta_messiah_desc =	"БАЗОВЫЙ: ##$basic##\nВы самостоятельно поднимаетесь на ноги, если убьёте врага. Навык срабатывает только ##"..messiah_1_a.."## раз.\n\nПРО: ##$pro##\nВы сможете снова использовать навык, если воспользуетесь медицинской сумкой, но только один заряд за каждое использование медицинской сумки.\n\nНавык срабатывает еще ##"..messiah_1_b.."## раза.",
				menu_stockholm_syndrome_desc =	"БАЗОВЫЙ: ##$basic##\nПри взаимодействии с гражданскими есть вероятность того, что он согласится вас поднять. Гражданские, поднявшие вас, могут дать вам патроны.\n\nПРО: ##$pro##\nВаши заложники не станут убегать с места, если были освобождены полицией. Как только вы попадёте в тюрьму, они попытаются обменять себя на вас. Этот эффект может сработать даже во время полицейского штурма, но только ##"..stockholm_syndrome_1_b.."## раз.",
				menu_kilmer_desc =				"БАЗОВЫЙ: ##$basic##\nУвеличивает скорость перезарядки штурмовых винтовок на ##"..kilmer_1_a.."%##.\n\nПРО: ##$pro##\nПонижает множитель разброса штурмовых во время движения на ##"..kilmer_1_b.."%##.\n\nВы можете перезаряжать оружие во время спринта.",
				menu_dominator_desc =			"БАЗОВЫЙ: ##$basic##\nВы можете брать врагов в заложники во время скрытного прохождения и во время штурма.\n\nПРО: ##$pro##\nВы можете брать ##2## врагов в заложники.\n\nДистанция, с которой вы можете брать заложников увеличена на ##"..dominator_1_b.."%##, как и сила вашего убеждения.",
				menu_control_freak_desc =		"БАЗОВЫЙ: ##$basic##\nИспуганые гражданские которые пытаются сбежать или позвонить в полицию отмечаются синим вопросительным знаком. Это дает больше времени чтобы запугать их.\n\nПРО: ##$pro##\nШум, издаваемый вами, устрашает гражданских.",
				menu_black_marketeer_desc =		"БАЗОВЫЙ: ##$basic##\nУменьшает цены на все ваши покупки на ##"..black_marketeer_1_a.."%##.\n\nПРО: ##$pro##\nУменьшает цены на все ваши покупки еще на ##"..black_marketeer_1_b.."%## и продажа предметов на ##"..black_marketeer_2_b.."%## выгоднее.",
				menu_inside_man_desc =			"БАЗОВЫЙ: ##$basic##\nУменьшает цены в меню активов на ##"..inside_man_1_a.."%##.\n\nПРО: ##$pro##\nОткрывает особые активы Своего человека.",
				menu_smooth_talker_desc =		"БАЗОВЫЙ: ##$basic##\nВы можете ответить на ##2## дополнительных пейджера.\n\nПРО: ##$pro##\nВы отвечаете на пейджер ##"..smooth_talker_1_b.."%## быстрее.",
				menu_hostage_taker_desc =		"БАЗОВЫЙ: ##$basic##\nГражданские остаются запуганными на ##"..hostage_taker_1_a.."%## дольше.\n\nПРО: ##$pro##\nВзаимодейстие с заложниками для их перемещения снижено на ##"..hostage_taker_1_b.."%##.",

				menu_gunzerker =				"Шизострел",
				menu_time_heals =				"Реабилитация",
				menu_more_blood_to_bleed =		"Больше крови для истекания",
				menu_walking_bleedout =			"Смертельная травма",
				menu_second_wind =				"Второй шанс",
				menu_up_you_go_beta =			"Прочные швы",
				menu_mastercraftsman =			"Прилежный ученик",
				menu_spotter =					"Наблюдатель",
				menu_aggressive_shots =			"Хирургическая точность",
				menu_sentry_gun =				"Турель",
				menu_scavenger =				"Мародер",
				menu_control_freak =			"Контроль толпы",
				menu_black_marketeer =			"Торговец с черного рынка",
				menu_inside_man =				"Свой Человек",
				menu_smooth_talker =			"Пустозвон",
				menu_hostage_taker =			"Захват заложников",
				menu_awareness =				"Стрельба с перебежками",

				menu_mastermind_tier_5 =		"Увеличивает скорость взаимодействия с медицинскими сумками на ##"..mastermind_tier5_1.."%##.\nУвеличивает скорость для установки медицинских сумок на ##"..mastermind_tier5_2.."%##.",
				menu_mastermind_tier_6 =		"Увеличивает силу запугивания на ##"..mastermind_tier6_1.."%##. Снижает стоимость поддержки в меню подготовки на ##"..mastermind_tier6_2.."%##.\n\nВы можете подбирать кабельные стяжки за каждую подобраную коробку с патронами с шансом ##20%##, а во время скрытного прохождения получаете гарантировано одну.",
				menu_menu_enforcer_tier_3 =		"Вы на ##"..enforcer_tier3_1.."%## легче подавляете врагов.\nУскоряет взаимодействие с сумкой патронов на ##"..enforcer_tier3_2.."%##.",
				menu_menu_enforcer_tier_5 =		"Вы наносите на ##"..enforcer_tier5_1.."%## больше урона.\nУскоряет взаимодействие с сумкой патронов на ##"..enforcer_tier5_2.."%##.",
				menu_technician_tier_4 =		"Урон от попадания в голову увеличен на ##"..technician_tier4_1.."%##.",
				menu_hoxton_tier_1 =			"Урон от бандитов снижен на ##"..hoxton_tier1_1.."%##",
				menu_hoxton_tier_2 =			"Стойкость увеличена на ##"..hoxton_tier2_1.."## пунктов.",
				menu_hoxton_tier_3 =			"Урон от бандитов снижен на ##"..hoxton_tier3_1.."%##",
				menu_hoxton_tier_4 =			"Вы наносите на ##"..hoxton_tier4_1.."%## больше урона специальным юнитам.",
				menu_hoxton_tier_5 =			"Здоровье увеличено на ##"..hoxton_tier5_1.."%##.",
				menu_hoxton_tier_6 =			"Вы на ##"..hoxton_tier6_1.."%## менее приоритетная цель для врагов.",
				
				menu_bonus_exp =			 				"Мистер Умник",
				menu_bonus_exp_desc =		 				"Увеличивает количество опыта вам и вашей команде.",
				menu_bonus_exp_detailed_desc =				"Вы получаете ##"..mr_wise_guy_1.."%## больше опыта вам и вашей команде при завершении дней и контрактов.\n\nШанс получить предмет высокого качества при завершении контракта увеличивается на ##"..mr_wise_guy_2.."%##.",
				menu_bonus_small_money =		 			"Мертвые президенты",
				menu_bonus_small_money_desc =				"Увеличивает ценность мелкой добычи которую вы забрали.",
				menu_bonus_small_money_detailed_desc =		"Ценность мелкой добычи увеличивается на ##"..dead_presidents_1.."%##.\n\nСнижено количество денег требуемых для перечисления в бонусный опыт ##"..dead_presidents_2.."%## когда вы нашли мелкую добычу.",
				menu_good_luck_charm_desc =					"Вы можете зациклить изображение камеры тем самым отключить её.",
				menu_good_luck_charm_detailed_desc =		"Вы можете зациклить изображение камеры на ##"..good_luck_charm_1.."## секунд и тем самым отключить её.",
				menu_triathlete_desc =		 				"Увеличивает выносливость вам и вашей команде.",
				menu_triathlete_detailed_desc =		 		"Увеличивает выносливость вам и вашей команде на ##"..triathlete_1.."%##.\n\nСкорость передвижения увеличена на ##"..triathlete_2.."%##.\n\nПозволяет бегать в любом направлении.",
				menu_joker_desc =		 					"Взятый в заложники враг может сражаться на вашей стороне.",
				menu_joker_detailed_desc =					"Вы можете перевести одного врага на свою сторону. Навык работает только после поднятия тревоги.\n\nПерешедшие противники наносят на ##"..joker_1.."%## больше урона и будет получать на ##"..joker_2.."%## меньше урона в зависимости от сложности.",
				menu_ammo_reservoir_desc =		 			"Вы и ваша команда можете стрелять не расходуя боеприпасы используя ваши патроны.",
				menu_ammo_reservoir_detailed_desc =			"Увеличивает вместительность магазинов вашего оружия ещё на ##"..ammo_reservoir_1.."## патронов.\n\nСразу после установки и использования сумки с патронами, вы и ваша команда можете стрелять не расходуя боеприпасы в течение ##"..ammo_reservoir_2.."## секунд. Чем больше амуниции вы восстановите из сумки, тем дольше будет эффект непрерывной стрельбы.",
				menu_keys_under_the_carpet =				"Ключи под ковриком",
				menu_keys_under_the_carpet_desc =			"Улучшает взлом замков.",
				menu_keys_under_the_carpet_detailed_desc =	"Вы взламываете замки на ##"..keys_under_the_carpet_1.."%## быстрее.\n\nВы можете взламывать замки в режиме исследования.",
				menu_infiltrator =							"Инфильтратор",
				menu_infiltrator_desc =						"Улучшает режим исследования.",
				menu_infiltrator_detailed_desc =			"Вы можете подбирать предметы, использовать ключ-карты к дверям и временным замкам и взаимодействовать с компьютерами в режиме исследования.",
				menu_kick_starter_desc =					"Починка дрели ударом по ней.",
				menu_kick_starter_detailed_desc =			"Теперь вы можете починить дрель или пилу, ударив по ним оружием ближнего боя. У вас есть ##"..kick_starter_1.."%## шанс, если та сломается. Данный навык срабатывает только один раз за поломку дрели или пилы.",
				menu_fire_trap_desc =						"Модифицирует ваши мины в зажигательные.",
				menu_fire_trap_detailed_desc =				"Ваши мины оставляют на месте огненную ловушку в течение ##"..fire_trap_1.."## секунд в ##"..fire_trap_2.."## метровом радиусе.",
				menu_hostage_situation =					"Ситуация с заложниками",
				menu_hostage_situation_desc =				"Прикрытие с помощью заложников.",
				menu_hostage_situation_detailed_desc =		"Вы и ваши напарники будете получать в зависимости от сложности на ##"..hostage_situation_1.."## меньше урона за каждого связанного заложника. Данный эффект складывается до максимума в ##"..hostage_situation_2.."## заложников.",

			})
		end
		
	end)
end
if string.lower(RequiredScript) == "lib/tweak_data/upgradestweakdata" then
	local data = UpgradesTweakData.init
	function UpgradesTweakData:init(tweak_data)
		data(self, tweak_data)
		local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
		local difficulty_index = tweak_data:difficulty_to_index(difficulty)

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
					"beardy",
					"catch"
				}
			},
			[34] = {
				name_id = "weapons",
				upgrades = {
					"galil",
					"cleaver",
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
					"deagle"
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
					"coach",
					"hunter"
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
					"barbedwire",
					"smoke_screen_grenade"
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
					"tenderizer",
					"plainsrider"
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
			[57] = {
				name_id = "weapons",
				upgrades = {
					"elastic",
					"long",
					"frankish",
					"ecp"
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
			[68] = {
				name_id = "weapons",
				upgrades = {
					"arblast"
				}
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
					"mg42",
					"flamethrower_mk2",
					"system"
				}
			},
			[72] = {
				name_id = "weapons",
				upgrades = {
					"taser",
					"zeus"
				}
			},
			[74] = {
				name_id = "weapons",
				upgrades = {
					"m134",
					"shuno"
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
			[77] = {
				name_id = "weapons",
				upgrades = {
					"erma"
				}
			},
			[80] = {
				name_id = "lvl_80",
				upgrades = {
					"rep_upgrade8"
				}
			},
			[84] = {
				name_id = "weapons",
				upgrades = {
					"mateba",
					"wa2000",
					"winchester1874",
					"ray"
				}
			},
			[87] = {
				name_id = "weapons",
				upgrades = {
					"concussion",
					"peacemaker",
					"m95",
					"rpg7",
					"ray"
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
		
		self.values.player.reduce_loose_money_exp_convertation_amount_mul = {0.35}
		self.values.team.xp.multiplier = {1.4}
		self.values.player.walking_bleedout_doctor_bag_self_revive = {true}
		self.values.player.walking_bleedout_ticks_to_ressurection = {120, 90}
		self.walking_bleedout_time_to_fatal_state = 5
		self.walking_bleedout_interaction_time_penalty = 0.4
		self.walking_bleedout_walk_speed_penalty = 0.4
		self.walking_bleedout_reload_speed_penalty = 1.45
		self.walking_bleedout_post_reload_speed_penalty = 0.25
		self.values.player.walking_bleedout_time_to_bleed = {20, 15}
		self.values.player.walking_bleedout_chance = {0.45, 0.75}
		self.values.player.walking_bleedout_temporary_health_mul = {0.4, 0.6, 0.8}
		self.values.player.walking_bleedout_fak_self_revive = {0.15}
		self.values.player.walking_bleedout_fak_self_revive_additional = {0.15}
	
		self.values.temporary.dmg_dampener_outnumbered_strong = {{0.85, 7}}
		self.values.player.revived_health_regain_solid_amount = {0.4, 0.7}
		self.values.player.revived_health_regain_solid_wolverine = {0.15}
		self.values.player.damage_shake_addend = {1.5}
		self.values.player.camouflage_bonus = {0.65}
		self.values.player.fugitive_tier_health_multiplier = {1.2}
		self.values.player.guards_cant_spot_you_in_casing = {10}
		self.values.player.reduce_silencer_alert_size = {0.05}
		self.values.player.secondary_silencer_damage_addend = {0.5}
		
		self.values.player.passive_always_regen_armor = {2.25}
		self.values.weapon.assault_rifle_single_head_shot_add = {0.25}
		self.values.weapon.smg_single_head_shot_add = {0.35}
		self.values.weapon.snp_single_head_shot_add = {0.15}
		
		self.values.player.single_shot_fire_rate_mul = {0.25}
		self.values.player.recoil_not_moving_mul = {0.8}
		self.values.player.recoil_not_moving_aim_mul = {0.85}

		self.values.player.passive_crafting_weapon_multiplier = {0.75, 0.5, 0.25}
		self.values.player.passive_crafting_mask_multiplier = {0.75, 0.5, 0.25}
		self.values.saw.enemy_slicer = {2}
		self.values.saw.consume_no_ammo_chance = {0.35}
		self.values.player.shotgun_steelsight_shield_knock = {0.85}
		self.values.player.shotgun_shield_knock = {0.45}
		self.values.shotgun.hip_rate_of_fire = {1.5}
		self.values.shotgun.enter_steelsight_speed_multiplier = {1.75}
		self.values.ammo_bag.interaction_speed_multiplier = {0.9, 0.8}
		self.values.doctor_bag.deploy_time_multiplier = {0.65}
		self.values.doctor_bag.interaction_speed_multiplier = {0.8, 0.7}
		self.values.doctor_bag.deploy_time_multiplier = {0.65}
		self.values.player.cable_tie_pickup = {true}
		
		if difficulty_index <= 3 then
			self.values.player.convert_enemies_health_multiplier = {0.3}
			self.values.team.damage = {
				hostage_absorption = {0.05},
				hostage_absorption_limit = 8
			}
		elseif difficulty_index <= 5 then
			self.values.player.convert_enemies_health_multiplier = {0.2}
			self.values.team.damage = {
				hostage_absorption = {0.1},
				hostage_absorption_limit = 8
			}
		else
			self.values.player.convert_enemies_health_multiplier = {0.05}
			self.values.team.damage = {
				hostage_absorption = {0.2},
				hostage_absorption_limit = 8
			}
		end
		
		self.values.player.convert_enemies_damage_multiplier = {1.45}
	
		self.values.player.pocket_ecm_jammer_base = {{cooldown_drain = 8, duration = 8}}
		self.values.temporary.chico_injector = {{0.8, 8}}

		self.values.team.health.passive_multiplier = {1.15}
		self.values.player.passive_xp_multiplier = {1.10}	
		self.values.team.stamina.multiplier = {2.5}
		self.values.player.uncover_multiplier = {1.35}
		self.values.weapon.clip_ammo_increase = {10}
		
		self.values.weapon.silencer_damage_multiplier = {1.15, 1.35}
		self.values.player.melee_kill_snatch_pager_chance = {0.07}
		self.values.player.armor_regen_timer_stand_still_multiplier = {0.85}
		self.values.saw.reload_speed_multiplier = {1.15}
		
		self.values.player.mask_off_pick_lock = {true}
		self.values.player.mask_off_keycard_insert = {true}
		self.values.player.mask_off_desktop_interaction = {true}
		self.values.player.hostage_interaction_speed_multiplier = {0.25}
		self.values.player.alarm_pager_speed_multiplier = {0.80}
		self.values.player.run_speed_multiplier = {1.15}
		self.values.player.walk_speed_multiplier = {1.15}

		self.values.player.intimidate_guards_pager = {true}
		self.values.player.instant_intimidation = {true}
		self.values.player.civs_show_markers = {true}

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
		self.values.assault_rifle.reload_speed_multiplier = {1.25}
		self.values.assault_rifle.move_spread_multiplier = {0.5}
		self.values.snp.reload_speed_multiplier = {1.25}
		self.values.snp.move_spread_multiplier = {0.5}
		self.values.pistol.damage_addend = {1.5}
		self.values.akimbo.damage_addend = {0.75}
		self.values.player.minion_master_health_multiplier = {1.2}
		self.values.player.messiah_revive_from_bleed_out = {1, 3}
		self.values.cooldown.long_dis_revive = {{0.75, 1}}
		
		self.values.player.suppression_multiplier = {1.25, 1.75}
		self.values.temporary.dmg_dampener_outnumbered = {{0.85, 7}}
		self.values.player.non_special_melee_multiplier = {1.5}
		self.values.player.melee_damage_multiplier = {1.5}
		self.values.player.increased_pickup_area = {1.30}
		self.values.shotgun.damage_multiplier = {1.35}
		self.values.player.flashbang_multiplier = {0.75, 0.25}
		self.values.player.damage_shake_multiplier = {0.5}
		self.values.player.bleed_out_health_multiplier = {2}
		self.values.shotgun.reload_speed_multiplier = {1.5}
		self.player_damage_health_ratio_threshold = 0.25
		self.values.shotgun.hip_fire_spread_index_addend = {0.6}
		self.values.temporary.overkill_damage_multiplier = {
			{1.75, 5},
			{1.75, 10}
		}
		
		self.values.player.drill_autorepair_1 = {0.3}
		self.values.sentry_gun.extra_ammo_multiplier = {1.5, 2.5}
		self.values.sentry_gun.rot_speed_multiplier = {2.5}
		self.values.trip_mine.quantity = {1, 4}
		self.values.player.deploy_interact_faster = {0.85}
		self.values.shape_charge.quantity = {0, 0}
		self.values.sentry_gun.spread_multiplier = {0.5}
		self.values.sentry_gun.damage_multiplier = {4}
		self.values.temporary.single_shot_fast_reload = {{1.2, 4}}
		self.values.player.critical_hit_chance = {0.30}
		self.values.player.armor_multiplier = {1.5}

		self.values.player.run_speed_multiplier = {1.1}
		self.values.player.run_dodge_chance = {0.25}
		self.values.player.walk_speed_multiplier = {1.1}
		self.values.smg.reload_speed_multiplier = {1.35}
		self.values.player.cheat_death_chance = {0.45}
		self.values.weapon.silencer_damage_multiplier = {1.15, 1.35}

		self.values.temporary.first_aid_damage_reduction = {{0.8, 10}}
		self.values.temporary.swap_weapon_faster = {{1.2, 5}}
		self.values.temporary.reload_weapon_faster = {{1.2, 5}}
		self.values.temporary.increased_movement_speed = {{1.1, 5}}
		self.values.temporary.damage_speed_multiplier = {{1.1, 5}}
		self.values.first_aid_kit.quantity = {4, 8}
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
		self.values.player.pick_lock_easy_speed_multiplier = {0.75, 0.5}
		self.values.player.gangster_damage_dampener = {0.9, 0.65}

		self.definitions.player_reduce_loose_money_exp_convertation_amount_mul = {
			name_id = "menu_player_reduce_loose_money_exp_convertation_amount_mul",
			category = "feature",
			upgrade = {
				value = 1,
				upgrade = "reduce_loose_money_exp_convertation_amount_mul",
				category = "player"
			}
		}
		self.definitions.player_walking_bleedout_doctor_bag_self_revive = {
			name_id = "menu_player_walking_bleedout_doctor_bag_self_revive",
			category = "feature",
			upgrade = {
				value = 1,
				upgrade = "walking_bleedout_doctor_bag_self_revive",
				category = "player"
			}
		}
		self.definitions.player_walking_bleedout_ticks_to_ressurection_1 = {
			name_id = "menu_player_walking_bleedout_ticks_to_ressurection",
			category = "feature",
			upgrade = {
				value = 1,
				upgrade = "walking_bleedout_ticks_to_ressurection",
				category = "player"
			}
		}
		self.definitions.player_walking_bleedout_ticks_to_ressurection_2 = {
			name_id = "menu_player_walking_bleedout_ticks_to_ressurection",
			category = "feature",
			upgrade = {
				value = 2,
				upgrade = "walking_bleedout_ticks_to_ressurection",
				category = "player"
			}
		}
		self.definitions.player_walking_bleedout_fak_self_revive = {
			name_id = "menu_player_walking_bleedout_fak_self_revive",
			category = "feature",
			upgrade = {
				value = 1,
				upgrade = "walking_bleedout_fak_self_revive",
				category = "player"
			}
		}
		self.definitions.player_walking_bleedout_fak_self_revive_additional = {
			name_id = "menu_player_walking_bleedout_fak_self_revive_additional",
			category = "feature",
			upgrade = {
				value = 1,
				upgrade = "walking_bleedout_fak_self_revive_additional",
				category = "player"
			}
		}
		
		self.definitions.player_walking_bleedout_temporary_health_mul_1 = {
			name_id = "menu_player_walking_bleedout_temporary_health_mul",
			category = "feature",
			upgrade = {
				value = 1,
				upgrade = "walking_bleedout_temporary_health_mul",
				category = "player"
			}
		}
		self.definitions.player_walking_bleedout_temporary_health_mul_2 = {
			name_id = "menu_player_walking_bleedout_temporary_health_mul",
			category = "feature",
			upgrade = {
				value = 2,
				upgrade = "walking_bleedout_temporary_health_mul",
				category = "player"
			}
		}
		self.definitions.player_walking_bleedout_temporary_health_mul_3 = {
			name_id = "menu_player_walking_bleedout_temporary_health_mul",
			category = "feature",
			upgrade = {
				value = 3,
				upgrade = "walking_bleedout_temporary_health_mul",
				category = "player"
			}
		}
		self.definitions.player_walking_bleedout_time_to_bleed_1 = {
			name_id = "menu_player_walking_bleedout_time_to_bleed",
			category = "feature",
			upgrade = {
				value = 1,
				upgrade = "walking_bleedout_time_to_bleed",
				category = "player"
			}
		}
		self.definitions.player_walking_bleedout_time_to_bleed_2 = {
			name_id = "menu_player_walking_bleedout_time_to_bleed",
			category = "feature",
			upgrade = {
				value = 2,
				upgrade = "walking_bleedout_time_to_bleed",
				category = "player"
			}
		}
		self.definitions.player_walking_bleedout_chance_1 = {
			name_id = "menu_player_walking_bleedout_chance",
			category = "feature",
			upgrade = {
				value = 1,
				upgrade = "walking_bleedout_chance",
				category = "player"
			}
		}
		self.definitions.player_walking_bleedout_chance_2 = {
			name_id = "menu_player_walking_bleedout_chance",
			category = "feature",
			upgrade = {
				value = 2,
				upgrade = "walking_bleedout_chance",
				category = "player"
			}
		}
		
		self.definitions.player_revived_health_regain_solid_wolverine = {
			name_id = "menu_player_revived_health_regain_solid_wolverine",
			category = "feature",
			upgrade = {
				value = 1,
				upgrade = "revived_health_regain_solid_wolverine",
				category = "player"
			}
		}
		self.definitions.player_revived_health_regain_solid_amount_1 = {
			name_id = "menu_player_revived_health_regain_solid_amount",
			category = "feature",
			upgrade = {
				value = 1,
				upgrade = "revived_health_regain_solid_amount",
				category = "player"
			}
		}
		self.definitions.player_revived_health_regain_solid_amount_2 = {
			name_id = "menu_player_revived_health_regain_solid_amount",
			category = "feature",
			upgrade = {
				value = 2,
				upgrade = "revived_health_regain_solid_amount",
				category = "player"
			}
		}
		self.definitions.player_fugitive_tier_health_multiplier = {
			name_id = "menu_player_fugitive_tier_health_multiplier",
			category = "feature",
			upgrade = {
				value = 1,
				upgrade = "fugitive_tier_health_multiplier",
				category = "player"
			}
		}
		self.definitions.player_guards_cant_spot_you_in_casing = {
			category = "feature",
			name_id = "menu_player_guards_cant_spot_you_in_casing",
			upgrade = {
				category = "player",
				upgrade = "guards_cant_spot_you_in_casing",
				value = 1
			}
		}
		self.definitions.player_reduce_silencer_alert_size = {
			category = "feature",
			name_id = "menu_player_reduce_silencer_alert_size",
			upgrade = {
				category = "player",
				upgrade = "reduce_silencer_alert_size",
				value = 1
			}
		}
		self.definitions.player_secondary_silencer_damage_addend = {
			category = "feature",
			name_id = "menu_player_secondary_silencer_damage_addend",
			upgrade = {
				category = "player",
				upgrade = "secondary_silencer_damage_addend",
				value = 1
			}
		}
		self.definitions.weapon_assault_rifle_single_head_shot_add = {
			name_id = "menu_assault_rifle_single_head_shot_add",
			category = "feature",
			upgrade = {
				value = 1,
				upgrade = "assault_rifle_single_head_shot_add",
				category = "weapon"
			}
		}
		self.definitions.weapon_smg_single_head_shot_add = {
			name_id = "menu_smg_single_head_shot_add",
			category = "feature",
			upgrade = {
				value = 1,
				upgrade = "smg_single_head_shot_add",
				category = "weapon"
			}
		}
		self.definitions.weapon_snp_single_head_shot_add = {
			name_id = "menu_snp_single_head_shot_add",
			category = "feature",
			upgrade = {
				value = 1,
				upgrade = "snp_single_head_shot_add",
				category = "weapon"
			}
		}
		self.definitions.player_single_shot_fire_rate_mul = {
			name_id = "menu_player_single_shot_fire_rate_mul",
			category = "feature",
			upgrade = {
				value = 1,
				upgrade = "single_shot_fire_rate_mul",
				category = "player"
			}
		}
		self.definitions.player_recoil_not_moving_mul = {
			name_id = "menu_player_recoil_not_moving_mul",
			category = "feature",
			upgrade = {
				value = 1,
				upgrade = "recoil_not_moving_mul",
				category = "player"
			}
		}
		self.definitions.player_recoil_not_moving_aim_mul = {
			name_id = "menu_player_recoil_not_moving_aim_mul",
			category = "feature",
			upgrade = {
				value = 1,
				upgrade = "recoil_not_moving_aim_mul",
				category = "player"
			}
		}
		self.definitions.player_overkill_damage_multiplier_2 = {
			name_id = "menu_player_overkill_damage_multiplier",
			category = "temporary",
			upgrade = {
				value = 2,
				upgrade = "overkill_damage_multiplier",
				category = "temporary"
			}
		}
		self.definitions.saw_consume_no_ammo_chance = {
			name_id = "menu_saw_consume_no_ammo_chance",
			category = "feature",
			upgrade = {
				value = 1,
				upgrade = "consume_no_ammo_chance",
				category = "saw"
			}
		}
		self.definitions.player_shotgun_steelsight_shield_knock = {
			name_id = "menu_player_shotgun_steelsight_shield_knock",
			category = "feature",
			upgrade = {
				value = 1,
				upgrade = "shotgun_steelsight_shield_knock",
				category = "player"
			}
		}
		self.definitions.player_shotgun_shield_knock = {
			name_id = "menu_player_shotgun_shield_knock",
			category = "feature",
			upgrade = {
				value = 1,
				upgrade = "shotgun_shield_knock",
				category = "player"
			}
		}
		self.definitions.passive_ammo_bag_interaction_speed_multiplier_1 = {
			name_id = "menu_passive_ammo_bag_interaction_speed_multiplier_1",
			category = "feature",
			upgrade = {
				value = 1,
				upgrade = "interaction_speed_multiplier",
				category = "ammo_bag"
			}
		}
		self.definitions.passive_ammo_bag_interaction_speed_multiplier_2 = {
			name_id = "menu_passive_ammo_bag_interaction_speed_multiplier_2",
			category = "feature",
			upgrade = {
				value = 2,
				upgrade = "interaction_speed_multiplier",
				category = "ammo_bag"
			}
		}
		self.definitions.passive_doctor_bag_interaction_speed_multiplier_2 = {
			name_id = "menu_passive_doctor_bag_interaction_speed_multiplier_2",
			category = "feature",
			upgrade = {
				value = 2,
				upgrade = "interaction_speed_multiplier",
				category = "doctor_bag"
			}
		}
		self.definitions.doctor_bag_deploy_time_multiplier = {
			incremental = true,
			name_id = "menu_doctor_bag_deploy_time_multiplier",
			category = "equipment_upgrade",
			upgrade = {
				value = 1,
				upgrade = "deploy_time_multiplier",
				category = "doctor_bag"
			}
		}
		self.definitions.player_cable_tie_pickup = {
			category = "feature",
			name_id = "menu_player_cable_tie_pickup",
			upgrade = {
				category = "player",
				upgrade = "cable_tie_pickup",
				value = 1
			}
		}
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
		self.definitions.player_hostage_interaction_speed_multiplier = {
			category = "feature",
			name_id = "menu_player_hostage_interaction_speed_multiplier",
			upgrade = {
				category = "player",
				upgrade = "hostage_interaction_speed_multiplier",
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
		self.definitions.player_messiah_revive_from_bleed_out_2 = {
			name_id = "menu_player_pistol_revive_from_bleed_out",
			category = "feature",
			upgrade = {
				value = 2,
				upgrade = "messiah_revive_from_bleed_out",
				category = "player"
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
	
		local function form(var, value, mul)
			mul = mul or 100
			if var == "a" then
				return (value[1] - 1) * mul
			elseif var == "a2" then
				return ((value[2] - 1) - (value[1] - 1)) * mul
			elseif var == "b" then
				return (1 - value[1]) * mul
			elseif var == "b2" then
				return ((1 - value[2]) - (1 - value[1])) * mul
			elseif var == "c" then
				return value[1] * mul
			elseif var == "c2" then
				return (value[2] - value[1]) * mul
			elseif var == "d" then
				return math.floor(100 - (100 / mul * value[1]))
			elseif var == "e" then
				return 100 / 8 * value[1]
			else
				return 0
			end
		end
	
		self.editable_skill_descs = {
			mastermind_tier1 = {
				{self.values.team.stamina.passive_multiplier[1] * 10 .. "%"}
			},
			mastermind_tier2 = {
				{(1 - self.values.doctor_bag.interaction_speed_multiplier[1]) * 100 .. "%"}
			},
			mastermind_tier3 = {
				{(self.values.player.passive_intimidate_range_mul[1] - 1) * 100 .. "%"}
			},
			mastermind_tier4 = {
				{(self.values.team.health.passive_multiplier[1] - 1) * 100 .. "%"}
			},		
			enforcer_tier1 = {
				{(self.values.player.passive_suppression_multiplier[1] - 1) * 100 .. "%"}
			},
			enforcer_tier2 = {
				{(self.values.player.passive_health_multiplier[1] - 1) * 100 .. "%"}
			},
			enforcer_tier4 = {
				{((self.values.player.passive_health_multiplier[2] - 1) - (self.values.player.passive_health_multiplier[1] - 1)) * 100 .. "%"}
			},
			enforcer_tier6 = {
				{((self.values.player.passive_health_multiplier[3] - 1) - (self.values.player.passive_health_multiplier[2] - 1)) * 100 .. "%"}
			},
			technician_tier1 = {
				{(1 - self.values.player.passive_crafting_weapon_multiplier[1]) * 100 .. "%"}
			},
			technician_tier2 = {
				{(1 - self.values.weapon.passive_recoil_multiplier[1]) * 100 .. "%"}
			},
			technician_tier3 = {
				{((1 - self.values.player.passive_crafting_weapon_multiplier[2]) - (1 - self.values.player.passive_crafting_weapon_multiplier[1])) * 100 .. "%"}
			},
			technician_tier5 = {
				{((1 - self.values.player.passive_crafting_weapon_multiplier[3]) - ((1 - self.values.player.passive_crafting_weapon_multiplier[2]) - (1 - self.values.player.passive_crafting_weapon_multiplier[1])) - (1 - self.values.player.passive_crafting_weapon_multiplier[1])) * 100 .. "%"}
			},
			technician_tier6 = {
				{
					((1 - self.values.weapon.passive_recoil_multiplier[2]) - (1 - self.values.weapon.passive_recoil_multiplier[1])) * 100 .. "%", 		
					(self.values.player.passive_armor_multiplier[1] - 1) * 100 .. "%", 
					(1 - self.values.team.armor.passive_regen_time_multiplier[1]) * 100 .. "%" 
				}
			},
			ghost_tier1 = {
				{self.values.player.passive_dodge_chance[1] * 100 .. "%"}
			},
			ghost_tier2 = {
				{(self.values.weapon.passive_swap_speed_multiplier[1] - 1) * 100 .. "%"}
			},
			ghost_tier3 = {
				{(self.values.player.passive_dodge_chance[2] - self.values.player.passive_dodge_chance[1]) * 100 .. "%"}
			},
			ghost_tier4 = {
				{
					"+" .. self.values.player.passive_concealment_modifier[1],
					(1 - self.values.player.passive_armor_movement_penalty_multiplier[1]) * 100 .. "%"
				}
			},
			ghost_tier5 = {
				{((self.values.weapon.passive_swap_speed_multiplier[2] - 1) - (self.values.weapon.passive_swap_speed_multiplier[1] - 1)) * 100 .. "%"}
			},
			ghost_tier6 = {
				{
					(self.values.player.passive_loot_drop_multiplier[1] - 1) * 100 .. "%",
					self.values.weapon.armor_piercing_chance[1] * 100 .. "%"
				}
			},	
			
			mastermind = {
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
				{"25%"},
				{"50%"}
			},
			painkillers = {
				{"10%", "5"},
				{"20%"}
			},
			equilibrium = {
				{"10%", "50%"},
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
				{"8"}
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
				{"100%"}
			},
			pack_mule = {
				{"50"},
				{"50"}
			},
			shotgun_impact = {
				{"25%"},
				{"35%"}
			},
			shades = {
				{"25%"},
				{"50%"}
			},
			from_the_hip = {
				{"75"}
			},
			shotgun_cqb = {
				{"50"},
				{"40", "50"}
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
				{"75", "5"}
			},

			technician = {
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
				{"50"}
			},
			sharpshooter = {
				{"20%"},
				{"25%"}
			},
			hardware_expert = {
				{"25%", "20%"},
				{"30%", "50%"}
			},
			marksman = {
				{"4", "25%"},
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

			ghost = {
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
				{self.values.player.additional_lives[1]},
				{self.values.player.cheat_death_chance[1] * 100 .. "%"}
			},
			good_luck_charm = {
				{"10", "1"},
				{"10"}
			},
			ecm_booster = {
				{"25%"}
			},
			silence_expert = {
				{"50%", "100%"},
				{"50%", "15%"}
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
			
			hoxton = {
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
				{form("a", self.values.temporary.swap_weapon_faster[1]).."%", self.values.temporary.swap_weapon_faster[1][2]},
				{form("a", self.values.temporary.increased_movement_speed[1]).."%", self.values.temporary.increased_movement_speed[1][2]}
			},
			second_chances = {
				{},
				{"2"}
			},
			tea_cookies = {
				{self.values.first_aid_kit.quantity[1]},
				{self.values.first_aid_kit.quantity[2] - self.values.first_aid_kit.quantity[1]}
			},
			bloodthirst = {
				{"100%", "400%"},
				{"15%", "10"}
			}
		}
		self.skill_descs = {}
		for skill_id, skill_desc in pairs(self.editable_skill_descs) do
			self.skill_descs[skill_id] = {}
			for index, skill_version in ipairs(skill_desc) do
				local version = index == 1 and "multibasic" or "multipro"
				self.skill_descs[skill_id][index] = #skill_version

				for i, desc in ipairs(skill_version) do
					self.skill_descs[skill_id][version .. (i == 1 and "" or tostring(i))] = desc
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
		
		self.ammo_bag.upgrade_timer_multipliers = {
			{
				upgrade = "interaction_speed_multiplier",
				category = "ammo_bag"
			},
			{
				upgrade = "deploy_interact_faster",
				category = "player"
			}
		}
		
		self.shaped_sharge.requires_upgrade = {
			category = "player",
			upgrade = "trip_mine_shaped_charge"
		}
		self.shaped_sharge.slot = 1
		self.shaped_sharge.blocked_hint = nil
		self.gage_assignment.timer = 0
		
		self.hostage_move.upgrade_timer_multiplier = {
			category = "player",
			upgrade = "hostage_interaction_speed_multiplier"
		}
		self.hostage_stay.upgrade_timer_multiplier = {
			category = "player",
			upgrade = "hostage_interaction_speed_multiplier"
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
		self.cas_take_usb_key.requires_mask_off_upgrade = {
			category = "player",
			upgrade = "mask_off_pickup"
		}
		self.cas_take_usb_key_data.requires_mask_off_upgrade = {
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
		self.cas_copy_usb.requires_mask_off_upgrade = {
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
		self.security_station_keyboard.requires_mask_off_upgrade = {
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
		self.trip_mine.quantity = {2}
		self.trip_mine.upgrade_name = {"trip_mine"}
		self.doctor_bag.upgrade_deploy_time_multiplier = {
			category = "doctor_bag",
			upgrade = "deploy_time_multiplier"
		}
		self.sentry_gun_silent = {
			deploy_time = 1,
			dummy_unit = "units/payday2/equipment/gen_equipment_sentry/gen_equipment_sentry_dummy",
			text_id = "debug_sentry_gun",
			use_function_name = "use_sentry_gun",
			unit = 2,
			min_ammo_cost = 0.33,
			ammo_cost = 0.46,
			visual_object = "g_sentrybag",
			icon = "equipment_sentry_silent",
			description_id = "des_sentry_gun",
			quantity = {
				1
			},
			upgrade_deploy_time_multiplier = {
				upgrade = "sentry_gun_deploy_time_multiplier",
				category = "player"
			}
		}
	end
end
if string.lower(RequiredScript) == "lib/units/beings/player/playermovement" then
	function PlayerMovement:is_SPOOC_attack_allowed()
		if self._unit:character_damage():get_mission_blocker("invulnerable") or self._unit:character_damage().swansong then
			return false
		end
		if self._current_state_name == "driving" then
			return false
		end
		if PlayerManager.walking_bleedout > 0 then
			return false
		end
		return true
	end
	function PlayerMovement:is_taser_attack_allowed()
		if self._unit:character_damage():get_mission_blocker("invulnerable") or self._current_state_name == "driving" or self._unit:base().parachuting then
			return false
		end
		if PlayerManager.walking_bleedout > 0 then
			return false
		end
		return true
	end
end
if string.lower(RequiredScript) == "lib/units/beings/player/playerdamage" then
	function PlayerDamage:damage_bullet(attack_data)
		if not self:_chk_can_take_dmg() then
			return
		end

		local damage_info = {
			result = {
				variant = "bullet",
				type = "hurt"
			},
			attacker_unit = attack_data.attacker_unit
		}

		local pm = managers.player
		local dmg_mul = pm:damage_reduction_skill_multiplier("bullet")
		if CopDamage.is_gangster(attack_data.attacker_unit:base()._tweak_table) then
			dmg_mul = dmg_mul * managers.player:upgrade_value("player", "gangster_damage_dampener", 1)
		end
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
	
	local data = PlayerDamage.revive
	function PlayerDamage:revive(silent)
		data(self, silent)
		local arrested = self:arrested()
		if managers.player:has_category_upgrade("player", "revived_health_regain_solid_amount") then
			if not arrested then
				local amount = managers.player:has_category_upgrade("player", "melee_damage_health_ratio_multiplier") and managers.player:upgrade_value("player", "revived_health_regain_solid_wolverine") or managers.player:upgrade_value("player", "revived_health_regain_solid_amount")
				self:set_health(self:_max_health() * amount)
			end
		end
	end
	
	local data = PlayerDamage.on_downed
	function PlayerDamage:on_downed()
		data(self)
		if PlayerManager.walking_bleedout > tweak_data.upgrades.walking_bleedout_time_to_fatal_state then
			managers.player:set_player_state("fatal")
		end
		if PlayerManager.walking_bleedout > 0 then
			PlayerManager.walking_bleedout = 0
		end
	end

	local data = PlayerDamage.update
	function PlayerDamage:update(unit, t, dt)
		data(self, unit, t, dt)
		if PlayerManager.walking_bleedout > 0 then
			local ticks = managers.player:upgrade_value("player", "walking_bleedout_ticks_to_ressurection", 10^10) - (self:remaining_delayed_damage() * 2)
			PlayerManager.walking_bleedout = 1 + ticks
		end
		if self:dead() then
			PlayerManager.walking_bleedout = 0
		end
		if PlayerManager.walking_bleedout > managers.player:upgrade_value("player", "walking_bleedout_ticks_to_ressurection", 10^10) then
			PlayerManager.walking_bleedout = 0
		end
		local ticks_to_ressurection = managers.player:upgrade_value("player", "walking_bleedout_ticks_to_ressurection", 10^10)
		local bleeder = PlayerManager.walking_bleedout
		local time_to_bleed = managers.player:upgrade_value("player", "walking_bleedout_time_to_bleed", 0)
		local reability = ticks_to_ressurection - time_to_bleed
		local total_bleed_penalty = bleeder > reability and self:remaining_delayed_damage() * 2 or bleeder > time_to_bleed and time_to_bleed or bleeder
		self._down_time = tweak_data.player.damage.DOWNED_TIME - math.floor(total_bleed_penalty)

	end
		
	local data = PlayerDamage._chk_cheat_death
	function PlayerDamage:_chk_cheat_death()
		data(self)
		if math.rand(1) < managers.player:upgrade_value("player", "walking_bleedout_chance", 0) then
			if PlayerManager.walking_bleedout == 0 then
				self:set_health(self:_max_health() * managers.player:upgrade_value("player", "walking_bleedout_temporary_health_mul", 0))
				self:delay_damage(managers.player:upgrade_value("player", "walking_bleedout_ticks_to_ressurection", 10^10) * 0.5, managers.player:upgrade_value("player", "walking_bleedout_ticks_to_ressurection", 10^10))
				PlayerManager.walking_bleedout = 1
			end
		end
	end
	local data = PlayerDamage.band_aid_health
	function PlayerDamage:band_aid_health()
		data(self)
		if PlayerManager.walking_bleedout > 0 and math.rand(1) < managers.player:upgrade_value("player", "walking_bleedout_fak_self_revive", 0) + managers.player:upgrade_value("player", "walking_bleedout_fak_self_revive_additional", 0) then 
			self:clear_delayed_damage()
			PlayerManager.walking_bleedout = 0
		end
	end
	local data = PlayerDamage.recover_health
	function PlayerDamage:recover_health()
		data(self)
		if PlayerManager.walking_bleedout > 0 and managers.player:has_category_upgrade("player", "walking_bleedout_doctor_bag_self_revive") then
			self:clear_delayed_damage()
			PlayerManager.walking_bleedout = 0
		end
	end
end
if string.lower(RequiredScript) == "lib/units/beings/player/states/playerstandard" then
	function PlayerStandard:_get_interaction_speed()
		local dt = managers.player:player_timer():delta_time()
		if PlayerManager.walking_bleedout > 0 then
			local maxed = 1 - tweak_data.upgrades.walking_bleedout_interaction_time_penalty
			local wb_ttr = managers.player:upgrade_value("player", "walking_bleedout_ticks_to_ressurection", 10^10)
			local pm_wb =  (wb_ttr - PlayerManager.walking_bleedout)
			local total = (maxed - (maxed / wb_ttr * pm_wb))
			dt = dt * (tweak_data.upgrades.walking_bleedout_interaction_time_penalty + total)
		end
		return dt
	end
end
if string.lower(RequiredScript) == "lib/managers/playermanager" then

	local data = PlayerManager.total_body_bags
	function PlayerManager:total_body_bags()
		local addend = 0
		if Global.game_settings.level_id == "short1_stage1" then
			addend = addend + 1 
		end
		return data(self) + addend
	end

	PlayerManager.walking_bleedout = 0
	function PlayerManager:health_skill_multiplier()
		local multiplier = 1
		multiplier = multiplier + self:upgrade_value("player", "fugitive_tier_health_multiplier", 1) - 1
		multiplier = multiplier + self:upgrade_value("player", "health_multiplier", 1) - 1
		multiplier = multiplier + self:upgrade_value("player", "passive_health_multiplier", 1) - 1
		multiplier = multiplier + self:team_upgrade_value("health", "passive_multiplier", 1) - 1
		multiplier = multiplier + self:get_hostage_bonus_multiplier("health") - 1
		multiplier = multiplier - self:upgrade_value("player", "health_decrease", 0)
		if self:num_local_minions() > 0 then
			multiplier = multiplier + self:upgrade_value("player", "minion_master_health_multiplier", 1) - 1
		end
		return multiplier
	end
	function PlayerManager:movement_speed_multiplier(speed_state, bonus_multiplier, upgrade_level, health_ratio)
		local multiplier = 1.00000001
		if PlayerManager.walking_bleedout > 0 then
			local maxed = 1 - tweak_data.upgrades.walking_bleedout_walk_speed_penalty
			local wb_ttr = managers.player:upgrade_value("player", "walking_bleedout_ticks_to_ressurection", 10^10)
			local pm_wb =  (wb_ttr - PlayerManager.walking_bleedout)
			local total = (maxed - (maxed / wb_ttr * pm_wb))
			multiplier = multiplier + (tweak_data.upgrades.walking_bleedout_walk_speed_penalty + total) - 1
		end
		local armor_penalty = self:mod_movement_penalty(self:body_armor_value("movement", upgrade_level, 1))
		multiplier = multiplier + armor_penalty - 1
		if bonus_multiplier then
			multiplier = multiplier + bonus_multiplier - 1
		end
		if speed_state then
			multiplier = multiplier + self:upgrade_value("player", speed_state .. "_speed_multiplier", 1) - 1
		end
		multiplier = multiplier + self:get_hostage_bonus_multiplier("speed") - 1
		multiplier = multiplier + self:upgrade_value("player", "movement_speed_multiplier", 1) - 1
		if self:num_local_minions() > 0 then
			multiplier = multiplier + self:upgrade_value("player", "minion_master_speed_multiplier", 1) - 1
		end
		if self:has_category_upgrade("player", "secured_bags_speed_multiplier") then
			local bags = 0
			bags = bags + (managers.loot:get_secured_mandatory_bags_amount() or 0)
			bags = bags + (managers.loot:get_secured_bonus_bags_amount() or 0)
			multiplier = multiplier + bags * (self:upgrade_value("player", "secured_bags_speed_multiplier", 1) - 1)
		end
		if managers.player:has_activate_temporary_upgrade("temporary", "berserker_damage_multiplier") then
			multiplier = multiplier * (tweak_data.upgrades.berserker_movement_speed_multiplier or 1)
		end
		if health_ratio then
			local damage_health_ratio = self:get_damage_health_ratio(health_ratio, "movement_speed")
			multiplier = multiplier * (1 + managers.player:upgrade_value("player", "movement_speed_damage_health_ratio_multiplier", 0) * damage_health_ratio)
		end
		local damage_speed_multiplier = managers.player:temporary_upgrade_value("temporary", "damage_speed_multiplier", managers.player:temporary_upgrade_value("temporary", "team_damage_speed_multiplier_received", 1))
		multiplier = multiplier * damage_speed_multiplier
		return multiplier
	end
	
end
if string.lower(RequiredScript) == "lib/units/pickups/ammoclip" then
	--first piece of code was cowardly spied from andole's cable ties pick up changer
	local data = AmmoClip._pickup
	function AmmoClip:_pickup(unit)
		local cable_ties = managers.player:has_special_equipment('cable_tie')
		local ammoclip = data(self, unit)
		cable_ties = cable_ties and cable_ties.amount or nil
		local cable_ties_new = managers.player:has_special_equipment('cable_tie')
		cable_ties_new = cable_ties_new and cable_ties_new.amount or nil
		if ammoclip and self._picked_up and self._ammo_box then 
			if managers.player:has_category_upgrade("player", "cable_tie_pickup") and managers.groupai:state():whisper_mode() then
				managers.player:add_cable_ties(1)
				if cable_ties_new ~= cable_ties then
					managers.player:add_cable_ties(-1)
				end
			elseif not managers.player:has_category_upgrade("player", "cable_tie_pickup") and cable_ties_new ~= cable_ties then
				managers.player:add_cable_ties(-1)
			end
		end
		return ammoclip
	end
end
if string.lower(RequiredScript) == "lib/units/beings/player/states/playermaskoff" then
	local data = PlayerMaskOff.init
	function PlayerMaskOff:init(unit)
		data(self, unit)
		local detection_risk = managers.blackmarket:get_suspicion_offset_of_local(tweak_data.player.SUSPICION_OFFSET_LERP or 0.75)
		detection_risk = math.round(detection_risk * 100)
		if detection_risk <= managers.player:upgrade_value("player", "guards_cant_spot_you_in_casing", 0) then
			self._mask_off_attention_settings = {}
		end
	end
end
if string.lower(RequiredScript) == "lib/managers/menumanager" then
	local data = MenuCallbackHandler._increase_infamous
	function MenuCallbackHandler:_increase_infamous(yes_clbk)
		data(self, yes_clbk)
		managers.skilltree:reset_specializations()
		managers.skilltree._global.specializations.total_points = Application:digest_value(0, true)
		managers.skilltree._global.specializations.points = Application:digest_value(0, true)
	end
end
if string.lower(RequiredScript) == "lib/managers/menu/skilltreegui" then
	local NOT_WIN_32 = SystemInfo:platform() ~= Idstring("WIN32")
	local WIDTH_MULTIPLIER = NOT_WIN_32 and 0.6 or 0.6
	local CONSOLE_PAGE_ADJUSTMENT = NOT_WIN_32 and 0 or 0
	local TOP_ADJUSTMENT = NOT_WIN_32 and 50 or 60
	local NUM_TREES_PER_PAGE = 4

	local function make_fine_text(text)
		local x, y, w, h = text:text_rect()

		text:set_size(w, h)
		text:set_position(math.round(text:x()), math.round(text:y()))
	end

	function SkillTreeSkillItem:init(skill_id, tier_panel, num_skills, i, tree, tier, w, h, skill_refresh_skills)
		SkillTreeSkillItem.super.init(self)

		self._skill_id = skill_id
		self._tree = tree
		self._tier = tier
		local skill_panel = tier_panel:panel({
			name = skill_id,
			w = w,
			h = h
		})
		self._skill_panel = skill_panel
		self._skill_refresh_skills = skill_refresh_skills
		local skill = tweak_data.skilltree.skills[skill_id]
		self._skill_name = managers.localization:text(skill.name_id)
		local texture_rect_x = skill.icon_xy and skill.icon_xy[1] or 0
		local texture_rect_y = skill.icon_xy and skill.icon_xy[2] or 0
		self._base_size = h - 10
		local state_image = skill_panel:bitmap({
			texture = "guis/textures/pd2/skilltree/op_icons_atlas",
			name = "state_image",
			layer = 1,
			texture_rect = {
				texture_rect_x * 64,
				texture_rect_y * 64,
				64,
				64
			},
			color = tweak_data.screen_colors.item_stage_3
		})

		state_image:set_size(self._base_size, self._base_size)
		state_image:set_blend_mode("add")

		local skill_text = skill_panel:text({
			word_wrap = true,
			name = "skill_text",
			vertical = "center",
			wrap = true,
			align = "left",
			blend_mode = "add",
			text = "",
			layer = 3,
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			color = tweak_data.screen_colors.text,
			x = self._base_size + 10,
			w = skill_panel:w() - self._base_size - 10
		})

		state_image:set_x(5)
		state_image:set_center_y(skill_panel:h() / 2)

		self._inside_panel = skill_panel:panel({
			w = w - 10,
			h = h - 10
		})

		self._inside_panel:set_center(skill_panel:w() / 2, skill_panel:h() / 2)

		local cx = tier_panel:w() / num_skills
		skill_panel:set_x((i - 1) * w)

		self._box = BoxGuiObject:new(skill_panel, {
			sides = {
				2,
				2,
				2,
				2
			}
		})

		self._box:hide()

		local state_indicator = skill_panel:bitmap({
			texture = "guis/textures/pd2/skilltree/ace",
			name = "state_indicator",
			alpha = 0,
			layer = 0,
			color = Color.white:with_alpha(1)
		})

		state_indicator:set_size(state_image:w() * 2, state_image:h() * 2)
		state_indicator:set_blend_mode("add")
		state_indicator:set_rotation(360)
		state_indicator:set_center(state_image:center())
	end

	function SkillTreePage:init(tree, data, parent_panel, fullscreen_panel, tree_tab_h, skill_prerequisites)
		self._items = {}
		self._selected_item = nil
		self._tree = tree
		local tree_panel = parent_panel:panel({
			y = 0,
			visible = false,
			name = tostring(tree),
			w = math.round(parent_panel:w() * WIDTH_MULTIPLIER)
		})
		self._tree_panel = tree_panel
		self._bg_image = fullscreen_panel:bitmap({
			name = "bg_image",
			blend_mode = "add",
			layer = 1,
			texture = data.background_texture,
			w = fullscreen_panel:w(),
			h = fullscreen_panel:h()
		})

		self._bg_image:set_alpha(0.6)

		local aspect = fullscreen_panel:w() / fullscreen_panel:h()
		local texture_width = self._bg_image:texture_width()
		local texture_height = self._bg_image:texture_height()
		local sw = math.max(texture_width, texture_height * aspect)
		local sh = math.max(texture_height, texture_width / aspect)
		local dw = texture_width / sw
		local dh = texture_height / sh

		self._bg_image:set_size(dw * fullscreen_panel:w(), dh * fullscreen_panel:h())
		self._bg_image:set_right(fullscreen_panel:w())
		self._bg_image:set_center_y(fullscreen_panel:h() / 2)

		local panel_h = 0
		local h = (parent_panel:h() - tree_tab_h - TOP_ADJUSTMENT) / (8 - CONSOLE_PAGE_ADJUSTMENT)
		for i = 1, 7 do
			local color = Color.black
			local rect = tree_panel:rect({
				h = 2,
				blend_mode = "add",
				name = "rect" .. i,
				color = color
			})

			rect:set_bottom(tree_panel:h() - (i - CONSOLE_PAGE_ADJUSTMENT) * h)

			if true or i == 1 then
				rect:set_alpha(0)
				rect:hide()
			end
		end

		local tier_panels = tree_panel:panel({
			name = "tier_panels"
		})
		if data.skill then
			local tier_panel = tier_panels:panel({
				name = "tier_panel0",
				h = h
			})
			tier_panel:set_bottom(tree_panel:child("rect1"):top())
			local item = SkillTreeUnlockItem:new(data.skill, tier_panel, tree, tier_panel:w() / 3, h)
			table.insert(self._items, item)
			item:refresh(false)
		end
		for tier, tier_data in ipairs(data.tiers) do
			local unlocked = managers.skilltree:tier_unlocked(tree, tier)
			local tier_panel = tier_panels:panel({
				name = "tier_panel" .. tier,
				h = h
			})
			local num_skills = #tier_data

			tier_panel:set_bottom(tree_panel:child("rect" .. tostring(tier + 1)):top())

			local base_size = h
			local base_w = tier_panel:w() / math.max(#tier_data, 1)

			for i, skill_id in ipairs(tier_data) do
				local item = SkillTreeSkillItem:new(skill_id, tier_panel, num_skills, i, tree, tier, base_w, base_size, skill_prerequisites[skill_id])

				table.insert(self._items, item)
				item:refresh(not unlocked)
			end

			local tier_string = tostring(tier)
			local debug_text = tier_panel:text({
				word_wrap = false,
				name = "debug_text",
				wrap = false,
				align = "right",
				vertical = "bottom",
				blend_mode = "add",
				rotation = 360,
				layer = 2,
				text = tier_string,
				font = tweak_data.menu.pd2_small_font,
				font_size = tweak_data.menu.pd2_small_font_size,
				h = tweak_data.menu.pd2_small_font_size,
				color = tweak_data.screen_colors.item_stage_3
			})

			debug_text:set_world_bottom(tree_panel:child("rect" .. tostring(tier + 1)):world_top() + 2)

			local _, _, tw, _ = debug_text:text_rect()

			debug_text:move(tw * 2, 0)

			local lock_image = tier_panel:bitmap({
				texture = "guis/textures/pd2/skilltree/padlock",
				name = "lock",
				layer = 3,
				w = tweak_data.menu.pd2_small_font_size,
				h = tweak_data.menu.pd2_small_font_size,
				color = tweak_data.screen_colors.item_stage_3
			})

			lock_image:set_blend_mode("add")
			lock_image:set_rotation(360)
			lock_image:set_world_position(debug_text:world_right(), debug_text:world_y() - 2)
			lock_image:set_visible(false)

			local add_infamy_glow = false

			if managers.experience:current_rank() > 0 then
				local tree_name = tweak_data.skilltree.trees[tree].skill

				for infamy, item in pairs(tweak_data.infamy.items) do
					if managers.infamy:owned(infamy) then
						local skilltree = item.upgrades and item.upgrades.skilltree

						if skilltree then
							local tree = skilltree.tree
							local trees = skilltree.trees

							if tree and tree == tree_name or trees and table.contains(trees, tree_name) then
								add_infamy_glow = true

								break
							end
						end
					end
				end
			end

			local cost_string = (managers.skilltree:tier_cost(tree, tier) < 10 and "0" or "") .. tostring(managers.skilltree:tier_cost(tree, tier))
			local cost_text = tier_panel:text({
				word_wrap = false,
				name = "cost_text",
				wrap = false,
				align = "left",
				vertical = "bottom",
				blend_mode = "add",
				rotation = 360,
				layer = 2,
				text = cost_string,
				font = tweak_data.menu.pd2_small_font,
				font_size = tweak_data.menu.pd2_small_font_size,
				h = tweak_data.menu.pd2_small_font_size,
				color = tweak_data.screen_colors.item_stage_3
			})
			local x, y, w, h = cost_text:text_rect()

			cost_text:set_size(w, h)
			cost_text:set_world_bottom(tree_panel:child("rect" .. tostring(tier + 1)):world_top() + 2)
			cost_text:set_x(debug_text:right() + tw * 3)

			if add_infamy_glow then
				local glow = tier_panel:bitmap({
					texture = "guis/textures/pd2/crimenet_marker_glow",
					name = "cost_glow",
					h = 56,
					blend_mode = "add",
					w = 56,
					rotation = 360,
					color = tweak_data.screen_colors.button_stage_3
				})

				local function anim_pulse_glow(o)
					local t = 0
					local dt = 0

					while true do
						dt = coroutine.yield()
						t = (t + dt * 0.5) % 1

						o:set_alpha((math.sin(t * 180) * 0.5 + 0.5) * 0.8)
					end
				end

				glow:set_center(cost_text:center())
				glow:animate(anim_pulse_glow)
			end

			local color = unlocked and tweak_data.screen_colors.item_stage_1 or tweak_data.screen_colors.item_stage_2

			debug_text:set_color(color)
			cost_text:set_color(color)

			if not unlocked then
				-- Nothing
			end
		end

		local ps = managers.skilltree:points_spent(self._tree)
		local max_points = 1

		for _, tier in ipairs(tweak_data.skilltree.trees[self._tree].tiers) do
			for _, skill in ipairs(tier) do
				for to_unlock, _ in ipairs(tweak_data.skilltree.skills[skill]) do
					max_points = max_points + managers.skilltree:get_skill_points(skill, to_unlock)
				end
			end
		end

		local prev_tier_p = 0
		local next_tier_p = max_points
		local ct = 0

		for i = 1, 6 do
			local tier_unlocks = managers.skilltree:tier_cost(self._tree, i)

			if ps < tier_unlocks then
				next_tier_p = tier_unlocks

				break
			end

			ct = i
			prev_tier_p = tier_unlocks
		end

		local diff_p = next_tier_p - prev_tier_p
		local diff_ps = ps - prev_tier_p
		local dh = self._tree_panel:child("rect2"):bottom()
		local prev_tier_object = self._tree_panel:child("rect" .. tostring(ct + 1))
		local next_tier_object = self._tree_panel:child("rect" .. tostring(ct + 2))
		local prev_tier_y = prev_tier_object and prev_tier_object:top() or 0
		local next_tier_y = next_tier_object and next_tier_object:top() or 0

		if not next_tier_object then
			next_tier_object = self._tree_panel:child("rect" .. tostring(ct))
			next_tier_y = next_tier_object and next_tier_object:top() or 0
			next_tier_y = 2 * prev_tier_y - next_tier_y
		end

		if ct > 0 then
			dh = math.max(2, tier_panels:child("tier_panel1"):world_bottom() - math.lerp(prev_tier_y, next_tier_y, diff_ps / diff_p))
		else
			dh = 0
		end

		local points_spent_panel = tree_panel:panel({
			w = 4,
			name = "points_spent_panel",
			h = dh
		})
		self._points_spent_line = BoxGuiObject:new(points_spent_panel, {
			sides = {
				2,
				2,
				0,
				0
			}
		})

		self._points_spent_line:set_clipping(dh == 0)
		points_spent_panel:set_world_center_x(tier_panels:child("tier_panel1"):child("lock"):world_center())
		points_spent_panel:set_world_bottom(tier_panels:child("tier_panel1"):world_bottom())

		for i, item in ipairs(self._items) do
			item:link(i, self._items)
		end
	end

	function SkillTreePage:on_points_spent()
		local points_spent_panel = self._tree_panel:child("points_spent_panel")
		local tier_panels = self._tree_panel:child("tier_panels")
		local ps = managers.skilltree:points_spent(self._tree)
		local max_points = 1

		for _, tier in ipairs(tweak_data.skilltree.trees[self._tree].tiers) do
			for _, skill in ipairs(tier) do
				for to_unlock, _ in ipairs(tweak_data.skilltree.skills[skill]) do
					max_points = max_points + managers.skilltree:get_skill_points(skill, to_unlock)
				end
			end
		end

		local prev_tier_p = 0
		local next_tier_p = max_points
		local ct = 0

		for i = 1, 6 do
			local tier_unlocks = managers.skilltree:tier_cost(self._tree, i)

			if ps < tier_unlocks then
				next_tier_p = tier_unlocks

				break
			end

			ct = i
			prev_tier_p = tier_unlocks
		end

		local diff_p = next_tier_p - prev_tier_p
		local diff_ps = ps - prev_tier_p
		local dh = self._tree_panel:child("rect2"):bottom()
		local prev_tier_object = self._tree_panel:child("rect" .. tostring(ct + 1))
		local next_tier_object = self._tree_panel:child("rect" .. tostring(ct + 2))
		local prev_tier_y = prev_tier_object and prev_tier_object:top() or 0
		local next_tier_y = next_tier_object and next_tier_object:top() or 0

		if not next_tier_object then
			next_tier_object = self._tree_panel:child("rect" .. tostring(ct))
			next_tier_y = next_tier_object and next_tier_object:top() or 0
			next_tier_y = 2 * prev_tier_y - next_tier_y
		end

		if ct > 0 then
			dh = math.max(2, tier_panels:child("tier_panel1"):world_bottom() - math.lerp(prev_tier_y, next_tier_y, diff_ps / diff_p))
		else
			dh = 0
		end

		points_spent_panel:set_h(dh)
		self._points_spent_line:create_sides(points_spent_panel, {
			sides = {
				2,
				2,
				2,
				2
			}
		})
		self._points_spent_line:set_clipping(dh == 0)
		points_spent_panel:set_world_center_x(tier_panels:child("tier_panel1"):child("lock"):world_center())
		points_spent_panel:set_world_bottom(tier_panels:child("tier_panel1"):world_bottom())
	end

	Hooks:PreHook(SkillTreeGui, "_update_borders", "perks", function(self)
		local tree_tabs_panel = self._skill_tree_panel:child("tree_tabs_panel")
		local spec_tabs_panel = self._specialization_panel:child("spec_tabs_panel")
		tree_tabs_panel:set_y(TOP_ADJUSTMENT + 1)
		spec_tabs_panel:set_y(TOP_ADJUSTMENT + 1)
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

		local icon_atlas_texture = "guis/textures/pd2/skilltree/op_icons_atlas"
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
if string.lower(RequiredScript) == "lib/managers/skilltreemanager" then

	SkillTreeManager.VERSION = 11
	
	function SkillTreeManager:_create_tree_data(tree_id)
		self._global.trees[tree_id] = {
			unlocked = false,
			points_spent = Application:digest_value(0, true)
		}
	end
	
	function SkillTreeManager:unlock_tree(tree)
		if self._global.trees[tree].unlocked then
			Application:error("Tree", tree, "allready unlocked")
			return
		end
		local skill_id = tweak_data.skilltree.trees[tree].skill
		local to_unlock = managers.skilltree:next_skill_step(skill_id)
		local total_points, points = managers.skilltree:get_skill_points(skill_id, to_unlock)
		local skill = tweak_data.skilltree.skills[skill_id][to_unlock]
		if not skill or not skill.cost then
			print("[SkillTreeManager:unlock_tree] skill tree: \"" .. tostring(skill_id) .. "\" is missing cost!")
		end
		if total_points > self:points() then
			return
		end
		self._global.trees[tree].unlocked = true
		self:_spend_points(tree, nil, total_points, points)
	end
	
	function SkillTreeManager:get_skill_points(skill, index)
		local points = tweak_data.skilltree.skills[skill][index] and tweak_data.skilltree.skills[skill][index].cost and Application:digest_value(tweak_data.skilltree.skills[skill][index].cost, false) or 0
		local total_points = points
		if points > 0 then
			for _, tree in ipairs(tweak_data.skilltree.trees) do
				if tree.skill == skill then
					local unlocked = self:trees_unlocked()
					if unlocked < #tweak_data.skilltree.unlock_tree_cost then
						total_points = points + Application:digest_value(tweak_data.skilltree.unlock_tree_cost[unlocked + 1], false)
					end
				else
				end
			end
		end
		return total_points, points
	end
	
	function SkillTreeManager:get_tree_progress_2(tree, switch_data)
		return self:get_tree_progress_new(tree, switch_data)
	end
		
	function SkillTreeManager:switch_skills(selected_skill_switch)
		if selected_skill_switch == self._global.selected_skill_switch then
			return
		end
		if not self._global.skill_switches[selected_skill_switch] then
			return
		end
		if not self._global.skill_switches[selected_skill_switch].unlocked then
			return
		end
		local function unaquire_skill(skill_id)
			local progress_data = self._global.skills[skill_id]
			local skill_data = tweak_data.skilltree.skills[skill_id]
			for i = progress_data.unlocked, 1, -1 do
				local step_data = skill_data[i]
				local upgrades = step_data.upgrades
				if upgrades then
					for i = #upgrades, 1, -1 do
						local upgrade = upgrades[i]
						managers.upgrades:unaquire(upgrade, UpgradesManager.AQUIRE_STRINGS[2] .. "_" .. tostring(skill_id))
					end
				end
			end
		end

		for tree, data in pairs(tweak_data.skilltree.trees) do
			local tree_data = tweak_data.skilltree.trees[tree]
			for i = #tree_data.tiers, 1, -1 do
				local tier = tree_data.tiers[i]
				for _, skill in ipairs(tier) do
					unaquire_skill(skill)
				end
			end
			unaquire_skill(tree_data.skill)
		end
		self._global.selected_skill_switch = selected_skill_switch
		local data = self._global.skill_switches[self._global.selected_skill_switch]
		self._global.points = data.points
		self._global.trees = data.trees
		self._global.skills = data.skills
		for tree_id, tree_data in pairs(self._global.trees) do
			if tree_data.unlocked and not tweak_data.skilltree.trees[tree_id].dlc then
				local skill_id = tweak_data.skilltree.trees[tree_id].skill
				local skill = tweak_data.skilltree.skills[skill_id]
				local skill_data = self._global.skills[skill_id]
				for i = 1, skill_data.unlocked do
					self:_aquire_skill(skill[i], skill_id, true)
				end
				for tier, skills in pairs(tweak_data.skilltree.trees[tree_id].tiers) do
					for _, skill_id in ipairs(skills) do
						local skill = tweak_data.skilltree.skills[skill_id]
						local skill_data = self._global.skills[skill_id]
						for i = 1, skill_data.unlocked do
							self:_aquire_skill(skill[i], skill_id, true)
						end
					end
				end
			end
		end
		self:set_current_specialization(self:digest_value(data.specialization, false), 1)
		MenuCallbackHandler:_update_outfit_information()
	end
	
	function SkillTreeManager:_setup_skill_switches()
		self._global.skill_switches = {}
		local switch_data
		for i = 1, #tweak_data.skilltree.skill_switches do
			self._global.skill_switches[i] = {
				unlocked = i == 1,
				name = nil,
				points = Application:digest_value(0, true),
				specialization = false
			}
			switch_data = self._global.skill_switches[i]
			switch_data.trees = {}
			for tree, data in pairs(tweak_data.skilltree.trees) do
				switch_data.trees[tree] = {
					unlocked = false,
					points_spent = Application:digest_value(0, true)
				}
			end
			switch_data.skills = {}
			for skill_id, data in pairs(tweak_data.skilltree.skills) do
				switch_data.skills[skill_id] = {
					unlocked = 0,
					total = #data
				}
			end
		end
	end

	function SkillTreeManager:_spend_points(tree, tier, points, points_tier)
		local pre_unlocked_tier = self:current_max_tier(tree)
		managers.money:on_skillpoint_spent(tree, tier, points)
		self:_set_points(self:points() - points)
		self:_set_points_spent(tree, self:points_spent(tree) + points_tier)
		local post_unlocked_tier = self:current_max_tier(tree)
		if not tier or pre_unlocked_tier < post_unlocked_tier then
			self:_on_tier_unlocked(tree, post_unlocked_tier)
		end
		self:_on_points_spent(tree, points)
	end

	function SkillTreeManager:unlock(tree, skill_id)
		if not self._global.trees[tree].unlocked then
			Application:error("Cannot unlock skill", skill_id, "in tree", tree, ". Tree is locked")
			return
		end
		if self._global.skills[skill_id].unlocked >= self._global.skills[skill_id].total then
			Application:error("No more steps to unlock in skill", skill_id)
			return
		end
		local talent = tweak_data.skilltree.skills[skill_id]
		local prerequisites = talent.prerequisites or {}
		for _, prerequisite in ipairs(prerequisites) do
			local unlocked = managers.skilltree:skill_step(prerequisite)
			if unlocked and unlocked == 0 then
				return
			end
		end
		local to_unlock = managers.skilltree:next_skill_step(skill_id)
		local skill = talent[to_unlock]
		local total_points, points = managers.skilltree:get_skill_points(skill_id, to_unlock)
		if total_points > self:points() then
			return
		end
		self._global.skills[skill_id].unlocked = to_unlock
		local tier
		for i, tier_skills in ipairs(tweak_data.skilltree.trees[tree].tiers) do
			if table.contains(tier_skills, skill_id) then
				tier = i
			else
			end
		end
		self:_spend_points(tree, tier, total_points, points)
		self:_aquire_skill(skill, skill_id)
		self:_on_skill_unlocked(tree, skill_id)
		if SystemInfo:platform() == Idstring("WIN32") then
			managers.statistics:publish_skills_to_steam()
		end
	end

	function SkillTreeManager:_on_tier_unlocked(tree, tier)
		local skill_id = tweak_data.skilltree.trees[tree].skill
		local to_unlock = managers.skilltree:next_skill_step(skill_id)
		while tier >= to_unlock do
			local skill = tweak_data.skilltree.skills[skill_id][to_unlock]
			if not skill then
				print("SkillTreeManager:_on_tier_unlocked: No tier upgrade at tier", tier, "for tree", tree)
				break
			end
			self._global.skills[skill_id].unlocked = to_unlock
			self:_aquire_skill(skill, skill_id)
			self:_on_skill_unlocked(tree, skill_id)
			to_unlock = managers.skilltree:next_skill_step(skill_id)
		end
		managers.menu_component:on_tier_unlocked(tree, tier)
	end

	function SkillTreeManager:_on_skill_unlocked(tree, skill_id)
		managers.menu_component:on_skill_unlocked(tree, skill_id)
	end

	function SkillTreeManager:_unlock(tree, skill_id)
		local skill = tweak_data.skills.definitions[skill_id]
		self:_aquire_skill(skill, skill_id)
	end

	function SkillTreeManager:_aquire_skill(skill, skill_id, loading)
		if skill and skill.upgrades then
			for _, upgrade in ipairs(skill.upgrades) do
				managers.upgrades:aquire(upgrade, loading, UpgradesManager.AQUIRE_STRINGS[2] .. "_" .. tostring(skill_id))
			end
		end
	end

	function SkillTreeManager:_reset_skilltree(tree, forced_respec_multiplier)
		self:_set_points_spent(tree, 0)
		self._global.trees[tree].unlocked = false
		managers.money:on_respec_skilltree(tree, forced_respec_multiplier)
		local tree_data = tweak_data.skilltree.trees[tree]
		for i = #tree_data.tiers, 1, -1 do
			local tier = tree_data.tiers[i]
			for _, skill in ipairs(tier) do
				self:_unaquire_skill(skill)
			end
		end
		self:_unaquire_skill(tree_data.skill)
	end

	function SkillTreeManager:_verify_loaded_data(points_aquired_during_load)
		local level_points = managers.experience:current_level()
		local assumed_points = level_points + points_aquired_during_load
		for i, switch_data in ipairs(self._global.skill_switches) do
			local points = assumed_points
			for skill_id, data in pairs(clone(switch_data.skills)) do
				if not tweak_data.skilltree.skills[skill_id] then
					print("[SkillTreeManager:_verify_loaded_data] Skill doesn't exists", skill_id, ", removing loaded data.", "skill_switch", i)
					switch_data.skills[skill_id] = nil
				end
			end
			for tree_id, data in pairs(clone(switch_data.trees)) do
				if not tweak_data.skilltree.trees[tree_id] then
					print("[SkillTreeManager:_verify_loaded_data] Tree doesn't exists", tree_id, ", removing loaded data.", "skill switch", i)
					switch_data.trees[tree_id] = nil
				end
			end
			for tree_id, data in pairs(clone(switch_data.trees)) do
				points = points - Application:digest_value(data.points_spent, false)
			end
			local unlocked = self:trees_unlocked(switch_data.trees)
			while unlocked > 0 do
				points = points - Application:digest_value(tweak_data.skilltree.unlock_tree_cost[unlocked], false)
				unlocked = unlocked - 1
			end
			switch_data.points = Application:digest_value(points, true)
		end
		for i = 1, #self._global.skill_switches do
			if self._global.skill_switches[i] then
				if 0 > Application:digest_value(not self._global.skill_switches[i].points and 0, false) then
					local switch_data = self._global.skill_switches[i]
					switch_data.points = Application:digest_value(assumed_points, true)
					switch_data.trees = {}
					for tree, data in pairs(tweak_data.skilltree.trees) do
						switch_data.trees[tree] = {
							unlocked = false,
							points_spent = Application:digest_value(0, true)
						}
					end
					switch_data.skills = {}
					for skill_id, data in pairs(tweak_data.skilltree.skills) do
						switch_data.skills[skill_id] = {
							unlocked = 0,
							total = #data
						}
					end
				end
			end
		end
		if not self._global.skill_switches[self._global.selected_skill_switch] then
			self._global.selected_skill_switch = 1
		end
		local data = self._global.skill_switches[self._global.selected_skill_switch]
		self._global.points = data.points
		self._global.trees = data.trees
		self._global.skills = data.skills
		for tree_id, tree_data in pairs(self._global.trees) do
			if tree_data.unlocked and not tweak_data.skilltree.trees[tree_id].dlc then
				local skill_id = tweak_data.skilltree.trees[tree_id].skill
				local skill = tweak_data.skilltree.skills[skill_id]
				local skill_data = self._global.skills[skill_id]
				for i = 1, skill_data.unlocked do
					self:_aquire_skill(skill[i], skill_id, true)
				end
				for tier, skills in pairs(tweak_data.skilltree.trees[tree_id].tiers) do
					for _, skill_id in ipairs(skills) do
						local skill = tweak_data.skilltree.skills[skill_id]
						local skill_data = self._global.skills[skill_id]
						for i = 1, skill_data.unlocked do
							self:_aquire_skill(skill[i], skill_id, true)
						end
					end
				end
			end
		end
		local specialization_tweak = tweak_data.skilltree.specializations
		local points, points_left, data
		local total_points_spent = 0
		local current_specialization = self:digest_value(self._global.specializations.current_specialization, false, 1)
		local spec_data = specialization_tweak[current_specialization]
		if not spec_data or spec_data.dlc and not managers.dlc:is_dlc_unlocked(spec_data.dlc) then
			local old_specialization = self._global.specializations.current_specialization
			current_specialization = 1
			self._global.specializations.current_specialization = self:digest_value(current_specialization, true, 1)
			for i, switch_data in ipairs(self._global.skill_switches) do
				if switch_data.specialization == old_specialization then
					switch_data.specialization = self._global.specializations.current_specialization
				end
			end
		end
		for tree, data in ipairs(self._global.specializations) do
			if specialization_tweak[tree] then
				points = self:digest_value(data.points_spent, false)
				points_left = points
				for tier, spec_data in ipairs(specialization_tweak[tree]) do
					if points_left >= spec_data.cost then
						points_left = points_left - spec_data.cost
						if tree == current_specialization then
							for _, upgrade in ipairs(spec_data.upgrades) do
								managers.upgrades:aquire(upgrade, true, UpgradesManager.AQUIRE_STRINGS[3] .. tostring(current_specialization))
							end
						end
						if tier == #specialization_tweak[tree] then
							data.tiers.current_tier = self:digest_value(tier, true)
							data.tiers.max_tier = self:digest_value(#specialization_tweak[tree], true)
							data.tiers.next_tier_data = false
						end
					else
						data.tiers.current_tier = self:digest_value(tier - 1, true)
						data.tiers.max_tier = self:digest_value(#specialization_tweak[tree], true)
						data.tiers.next_tier_data = {
							current_points = self:digest_value(points_left, true),
							points = self:digest_value(spec_data.cost, true)
						}
						points_left = 0
						break
					end
				end
				data.points_spent = self:digest_value(points - points_left, true)
				total_points_spent = total_points_spent + (points - points_left)
			end
		end
		total_points_spent = total_points_spent + self:digest_value(self._global.specializations.points, false)
		if self:digest_value(self._global.specializations.total_points, false) ~= total_points_spent then
			Application:error("[SkillTreeManager] Specialization points do not match up, reseting everything!!!")
			self:reset_specializations()
		else
			local max_points = self:digest_value(self._global.specializations.max_points, false)
			local points = self:digest_value(self._global.specializations.points, false)
			if total_points_spent > max_points or max_points < points then
				self._global.specializations.total_points = self:digest_value(max_points, true)
				self._global.specializations.points = self:digest_value(math.max(total_points_spent - max_points, 0), true)
				self._global.specializations.points_present = self:digest_value(0, true)
				self._global.specializations.xp_present = self:digest_value(0, true)
				self._global.specializations.xp_leftover = self:digest_value(0, true)
			end
		end
	end
end
if string.lower(RequiredScript) == "lib/managers/menu/playerinventorygui" then
	Hooks:PreHook(PlayerInventoryGui, "_round_everything", "PlayerInventoryGui_update_legends", function(self)
		self:_update_specialization_box()
	end)
	
	function PlayerInventoryGui:_update_specialization_box()
		local box = self._boxes_by_name.specialization

		if box then
			local current_specialization = managers.skilltree:get_specialization_value("current_specialization")
			local specialization_data = tweak_data.skilltree.specializations[current_specialization]
			local texture_rect_x = 0
			local texture_rect_y = 0
			local specialization_text = managers.localization:text(specialization_data.name_id) or " "
			local guis_catalog = "guis/"

			if specialization_data then
				local current_tier = managers.skilltree:get_specialization_value(current_specialization, "tiers", "current_tier")
				local max_tier = managers.skilltree:get_specialization_value(current_specialization, "tiers", "max_tier")
				local tier_data = specialization_data[max_tier]

				if tier_data then
					texture_rect_x = tier_data.icon_xy and tier_data.icon_xy[1] or 0
					texture_rect_y = tier_data.icon_xy and tier_data.icon_xy[2] or 0

					if tier_data.texture_bundle_folder then
						guis_catalog = guis_catalog .. "dlcs/" .. tostring(tier_data.texture_bundle_folder) .. "/"
					end
				end
			end

			local icon_atlas_texture = guis_catalog .. "textures/pd2/skilltree/op_icons_atlas"

			self:update_box(box, {
				text = specialization_text,
				image = icon_atlas_texture,
				image_rect = {
					texture_rect_x * 64,
					texture_rect_y * 64,
					64,
					64
				}
			}, true)
		end
	end
	
	function PlayerInventoryGui:set_skilltree_stats(panel, data) return end
	PlayerInventoryGui._update_info_skilltree = function(self, name)
		local text_string = ""
		text_string = text_string .. managers.localization:text("menu_st_skill_switch_set", {skill_switch = managers.skilltree:get_skill_switch_name(managers.skilltree:get_selected_skill_switch(), true)}) .. "\n "
		local tree_to_string_id = {mastermind = "st_menu_mastermind", enforcer = "st_menu_enforcer", technician = "st_menu_technician", ghost = "st_menu_ghost", hoxton = "st_menu_hoxton_pack"}
		text_string = text_string .. "\n"
		
		local trees = {"mastermind", "enforcer", "technician", "ghost", "hoxton"}
		
		for i,tree in ipairs(trees) do
			local points, progress, num_skills = managers.skilltree:get_tree_progress_new(tree)
			points = string.format("%02d", points)
			text_string = text_string .. managers.localization:to_upper_text("menu_profession_progress", {profession = managers.localization:to_upper_text(tree_to_string_id[tree]), progress = points, num_skills = num_skills}) .. "\n"
		end
		self:set_info_text(text_string)
	end
end
if string.lower(RequiredScript) == "lib/units/equipment/ammo_bag/ammobagbase" then
	AmmoBagBase._BULLET_STORM = {10}
end
if string.lower(RequiredScript) == "lib/managers/menu/menucomponentmanager" then
	local data = SkillTreeGui._set_selected_skill_item
	function SkillTreeGui:_set_selected_skill_item(item, no_sound)
		data(self, item, no_sound)
		local desc_text = self._skill_description_panel:child("text")
		desc_text:set_font_size(tweak_data.menu.pd2_small_font_size)
		local _, _, _, h = desc_text:text_rect()
		while h > self._skill_description_panel:h() - desc_text:top() do
			desc_text:set_font_size(desc_text:font_size() * 0.99)
			_, _, _, h = desc_text:text_rect()
		end
	end
	
	function MenuComponentManager:create_skilltree_new_gui(node)
		self:close_skilltree_new_gui()

		self._skilltree_gui = SkillTreeGui:new(self._ws, self._fullscreen_ws, node)
		self._new_skilltree_gui_active = true

		self:enable_skilltree_gui()
	end

	function MenuComponentManager:close_skilltree_new_gui()
		if self._skilltree_gui and not self._old_skilltree_gui_active then
			self._skilltree_gui:close()

			self._skilltree_gui = nil
			self._new_skilltree_gui_active = nil
		end
	end

	function MenuComponentManager:on_skill_unlocked(...)
		if self._skilltree_gui then
			self._skilltree_gui:on_skill_unlocked(...)
		end
	end
end
if string.lower(RequiredScript) == "lib/units/beings/player/states/playertased" then
	function PlayerTased:call_teammate(line, t, no_gesture, skip_alert)
		local voice_type, plural, prime_target = self:_get_unit_intimidation_action(true, false, false, true, false)
		local interact_type, queue_name = nil

		if voice_type == "stop_cop" or voice_type == "mark_cop" then
			local prime_target_tweak = tweak_data.character[prime_target.unit:base()._tweak_table]
			local shout_sound = prime_target_tweak.priority_shout

			if managers.groupai:state():whisper_mode() then
				shout_sound = prime_target_tweak.silent_priority_shout or shout_sound
			end

			if shout_sound then
				interact_type = "cmd_point"
				queue_name = "s07x_sin"

				if managers.player:has_category_upgrade("player", "special_enemy_highlight") then
					prime_target.unit:contour():add(managers.player:get_contour_for_marked_enemy(), true, managers.player:upgrade_value("player", "mark_enemy_time_multiplier", 1))
				end
				if not self._tase_ended and managers.player:has_category_upgrade("player", "taser_self_shock") and prime_target.unit:key() == self._unit:character_damage():tase_data().attacker_unit:key() then
					self:_start_action_counter_tase(t, prime_target)
				end
			end
		end

		if interact_type then
			self:_do_action_intimidate(t, not no_gesture and interact_type or nil, queue_name, skip_alert)
		end
	end
end
if string.lower(RequiredScript) == "lib/managers/menumanagerdialogs" then
	function MenuManager:show_confirm_respec_skilltree(params)
		local tree_name = managers.localization:text(tweak_data.skilltree.trees[params.tree].name_id)
		local dialog_data = {
			title = managers.localization:text("dialog_skills_respec_title"),
			text = managers.localization:text("dialog_respec_skilltree", {
				tree = tree_name
			}),
			focus_button = 2
		}
		local yes_button = {
			text = managers.localization:text("dialog_yes"),
			callback_func = params.yes_func
		}
		local no_button = {
			text = managers.localization:text("dialog_no"),
			callback_func = params.no_func,
			cancel_button = true
		}
		dialog_data.button_list = {
			yes_button,
			no_button
		}
		dialog_data.no_upper = true

		managers.system_menu:show(dialog_data)
	end
end
if string.lower(RequiredScript) == "lib/units/weapons/newraycastweaponbase" then
	function NewRaycastWeaponBase:reload_speed_multiplier()
		if self._current_reload_speed_multiplier then
			return self._current_reload_speed_multiplier
		end

		local multiplier = 1

		for _, category in ipairs(self:weapon_tweak_data().categories) do
			multiplier = multiplier + 1 - managers.player:upgrade_value(category, "reload_speed_multiplier", 1)
		end

		if PlayerManager.walking_bleedout > 0 then
			local maxed = tweak_data.upgrades.walking_bleedout_post_reload_speed_penalty
			local wb_ttr = managers.player:upgrade_value("player", "walking_bleedout_ticks_to_ressurection", 10^10)
			local pm_wb =  (wb_ttr - PlayerManager.walking_bleedout)
			local total = (maxed - (maxed / wb_ttr * pm_wb))
			multiplier = multiplier * (tweak_data.upgrades.walking_bleedout_reload_speed_penalty - total)
		end
		
		multiplier = multiplier + 1 - managers.player:upgrade_value("weapon", "passive_reload_speed_multiplier", 1)
		multiplier = multiplier + 1 - managers.player:upgrade_value(self._name_id, "reload_speed_multiplier", 1)

		if self._setup and alive(self._setup.user_unit) and self._setup.user_unit:movement() then
			local morale_boost_bonus = self._setup.user_unit:movement():morale_boost()

			if morale_boost_bonus then
				multiplier = multiplier + 1 - morale_boost_bonus.reload_speed_bonus
			end

			if self._setup.user_unit:movement():next_reload_speed_multiplier() then
				multiplier = multiplier + 1 - self._setup.user_unit:movement():next_reload_speed_multiplier()
			end
		end

		if managers.player:has_activate_temporary_upgrade("temporary", "reload_weapon_faster") then
			multiplier = multiplier + 1 - managers.player:temporary_upgrade_value("temporary", "reload_weapon_faster", 1)
		end

		if managers.player:has_activate_temporary_upgrade("temporary", "single_shot_fast_reload") then
			multiplier = multiplier + 1 - managers.player:temporary_upgrade_value("temporary", "single_shot_fast_reload", 1)
		end

		multiplier = multiplier + 1 - managers.player:get_property("shock_and_awe_reload_multiplier", 1)
		multiplier = multiplier + 1 - managers.player:get_temporary_property("bloodthirst_reload_speed", 1)
		multiplier = multiplier + 1 - managers.player:upgrade_value("team", "crew_faster_reload", 1)
		multiplier = self:_convert_add_to_mul(multiplier)
		multiplier = multiplier * self:reload_speed_stat()
		multiplier = managers.modifiers:modify_value("WeaponBase:GetReloadSpeedMultiplier", multiplier)

		return multiplier
	end
	local data = NewRaycastWeaponBase._update_bullet_objects
	function NewRaycastWeaponBase:_update_bullet_objects(ammo_func)
		data(self, ammo_func)
		local user_unit = self._setup and self._setup.user_unit
		local current_state = alive(user_unit) and user_unit:movement() and user_unit:movement()._current_state
		local chance_value = current_state and current_state:in_steelsight() and managers.player:upgrade_value("player", "shotgun_steelsight_shield_knock") or managers.player:upgrade_value("player", "shotgun_shield_knock") or 0
		self._shield_knock = math.random() <= chance_value and self:is_category("shotgun")
	end
	function NewRaycastWeaponBase:get_add_head_shot_mul()
		local user_unit = self._setup and self._setup.user_unit
		local current_state = alive(user_unit) and user_unit:movement() and user_unit:movement()._current_state
		if self:is_single_shot() and (current_state and current_state:in_steelsight()) then
			local snp = self:is_category("snp") and managers.player:upgrade_value("weapon", "snp_single_head_shot_add", nil)
			local assault_rifle = self:is_category("assault_rifle") and managers.player:upgrade_value("weapon", "assault_rifle_single_head_shot_add", nil)
			local smg = self:is_category("smg") and managers.player:upgrade_value("weapon", "smg_single_head_shot_add", nil)
			local bonus = snp or smg or assault_rifle
			return bonus
		end
		return nil
	end	
	function NewRaycastWeaponBase:fire_rate_multiplier()
		local weapon_unit = managers.player:equipped_weapon_unit()
		local mul = self._fire_rate_multiplier
		if weapon_unit and weapon_unit:base():fire_mode() == "single" and weapon_unit:base():is_category("smg", "assault_rifle", "snp") then
			mul = mul + managers.player:upgrade_value("player", "single_shot_fire_rate_mul")
		end
		return mul
	end
	local data = NewRaycastWeaponBase._update_stats_values
	function NewRaycastWeaponBase:_update_stats_values(disallow_replenish)
		data(self, disallow_replenish)
		if self:got_silencer() then
			self._alert_size = self._alert_size * managers.player:upgrade_value("player", "reduce_silencer_alert_size", 1)
		end
	end
end
if string.lower(RequiredScript) == "lib/managers/blackmarketmanager" then
	function BlackMarketManager:recoil_multiplier(name, categories, silencer, blueprint, is_moving)
		local multiplier = 1

		local weapon_unit = managers.player:equipped_weapon_unit()
		if weapon_unit and weapon_unit:base():fire_mode() == "single" and weapon_unit:base():is_category("smg", "assault_rifle", "snp") then
			if not is_moving then
				multiplier = multiplier + 1 - managers.player:upgrade_value("player", "recoil_not_moving_mul", 1)
			end
			if managers.player:player_unit():movement()._current_state:in_steelsight() then
				multiplier = multiplier + 1 - managers.player:upgrade_value("player", "recoil_not_moving_aim_mul", 1)
			end
		end

		for _, category in ipairs(categories) do
			multiplier = multiplier + 1 - managers.player:upgrade_value(category, "recoil_multiplier", 1)
			multiplier = multiplier + 1 - managers.player:upgrade_value(category, "passive_recoil_multiplier", 1)
		end
		if managers.player:player_unit() and managers.player:player_unit():character_damage():is_suppressed() then
			for _, category in ipairs(categories) do
				if managers.player:has_team_category_upgrade(category, "suppression_recoil_multiplier") then
					multiplier = multiplier + 1 - managers.player:team_upgrade_value(category, "suppression_recoil_multiplier", 1)
				end
			end

			if managers.player:has_team_category_upgrade("weapon", "suppression_recoil_multiplier") then
				multiplier = multiplier + 1 - managers.player:team_upgrade_value("weapon", "suppression_recoil_multiplier", 1)
			end
		else
			for _, category in ipairs(categories) do
				if managers.player:has_team_category_upgrade(category, "recoil_multiplier") then
					multiplier = multiplier + 1 - managers.player:team_upgrade_value(category, "recoil_multiplier", 1)
				end
			end

			if managers.player:has_team_category_upgrade("weapon", "recoil_multiplier") then
				multiplier = multiplier + 1 - managers.player:team_upgrade_value("weapon", "recoil_multiplier", 1)
			end
		end

		multiplier = multiplier + 1 - managers.player:upgrade_value(name, "recoil_multiplier", 1)
		multiplier = multiplier + 1 - managers.player:upgrade_value("weapon", "passive_recoil_multiplier", 1)
		multiplier = multiplier + 1 - managers.player:upgrade_value("player", "recoil_multiplier", 1)
		if silencer then
			multiplier = multiplier + 1 - managers.player:upgrade_value("weapon", "silencer_recoil_multiplier", 1)

			for _, category in ipairs(categories) do
				multiplier = multiplier + 1 - managers.player:upgrade_value(category, "silencer_recoil_multiplier", 1)
			end
		end
		if blueprint and self:is_weapon_modified(managers.weapon_factory:get_factory_id_by_weapon_id(name), blueprint) then
			multiplier = multiplier + 1 - managers.player:upgrade_value("weapon", "modded_recoil_multiplier", 1)
		end
		return self:_convert_add_to_mul(multiplier)
	end
	
	function BlackMarketManager:damage_addend(name, categories, silencer, detection_risk, current_state, blueprint)
		local value = 0

		local category = tweak_data.weapon[name].use_data.selection_index
		if silencer and category == 1 then
			value = value + managers.player:upgrade_value("player", "secondary_silencer_damage_addend", 0)
		end
		
		if tweak_data.weapon[name] and tweak_data.weapon[name].ignore_damage_upgrades then
			return value
		end
		value = value + managers.player:upgrade_value("player", "damage_addend", 0)
		value = value + managers.player:upgrade_value("weapon", "damage_addend", 0)
		value = value + managers.player:upgrade_value(name, "damage_addend", 0)
		for _, category in ipairs(categories) do
			value = value + managers.player:upgrade_value(category, "damage_addend", 0)
		end
		return value
	end
end
if string.lower(RequiredScript) == "lib/units/weapons/sentrygunweapon" then
	local data = SentryGunWeapon.setup
	function SentryGunWeapon:setup(setup_data)
		data(self, setup_data)
		local sentry_gun_silent = managers.player:selected_equipment_id() == "sentry_gun_silent"
		if sentry_gun_silent then
			self._use_armor_piercing = true
			self._slow_fire_rate = true
			self._current_damage_mul = 3
			self._fire_rate_reduction = 3.5
			self._spread_mul = 0.5
		end
	end
end
if string.lower(RequiredScript) == "lib/units/equipment/ecm_jammer/ecmjammerbase" then
	local tmp_vec1 = Vector3()
	function ECMJammerBase._detect_and_give_dmg(hit_pos, device_unit, user_unit, range)
		local mvec3_dis_sq = mvector3.distance_sq
		local slotmask = managers.slot:get_mask("bullet_impact_targets")
		local splinters = {
			mvector3.copy(hit_pos)
		}
		local dirs = {
			Vector3(range, 0, 0),
			Vector3(-range, 0, 0),
			Vector3(0, range, 0),
			Vector3(0, -range, 0),
			Vector3(0, 0, range),
			Vector3(0, 0, -range)
		}
		local pos = tmp_vec1
		for _, dir in ipairs(dirs) do
			mvector3.set(pos, dir)
			mvector3.add(pos, hit_pos)
			local splinter_ray = World:raycast("ray", hit_pos, pos, "slot_mask", slotmask)
			pos = (splinter_ray and splinter_ray.position or pos) - dir:normalized() * math.min(splinter_ray and splinter_ray.distance or 0, 10)
			local near_splinter = false
			for _, s_pos in ipairs(splinters) do
				if mvector3.distance_sq(pos, s_pos) < 300 then
					near_splinter = true

					break
				end
			end
			if not near_splinter then
				table.insert(splinters, mvector3.copy(pos))
			end
		end
		local range_sq = range * range
		local half_range_sq = range * 0.5
		half_range_sq = half_range_sq * half_range_sq
		local function _chk_apply_dmg_to_char(u_data)
			if not u_data.char_tweak.ecm_vulnerability then
				return
			end
			if u_data.unit.brain and u_data.unit:brain().is_hostage and u_data.unit:brain():is_hostage() then
				return
			end
			if u_data.unit:anim_data() and u_data.unit:anim_data().act then
				return
			end
			if u_data.char_tweak.ecm_vulnerability <= math.random() then
				return
			end
			local head_pos = u_data.unit:movement():m_head_pos()
			local dis_sq = mvec3_dis_sq(head_pos, hit_pos)
			if range_sq < dis_sq then
				return
			end
			for i_splinter, s_pos in ipairs(splinters) do
				if i_splinter == 1 or dis_sq < half_range_sq then
					local attack_data = {
						damage = 0,
						variant = "stun",
						attacker_unit = alive(user_unit) and user_unit or nil,
						weapon_unit = device_unit,
						col_ray = {
							position = mvector3.copy(head_pos),
							ray = (head_pos - s_pos):normalized()
						}
					}

					u_data.unit:character_damage():damage_explosion(attack_data)
					break
				end
			end
		end
		for u_key, u_data in pairs(managers.enemy:all_enemies()) do
			_chk_apply_dmg_to_char(u_data)
		end
		for u_key, u_data in pairs(managers.enemy:all_civilians()) do
			_chk_apply_dmg_to_char(u_data)
		end
	end
end
if string.lower(RequiredScript) == "lib/units/enemies/cop/logics/coplogicidle" then
	function CopLogicIdle.on_intimidated(data, amount, aggressor_unit)
		local surrender = false
		local my_data = data.internal_data
		data.t = TimerManager:game():time()

		if not aggressor_unit:movement():team().foes[data.unit:movement():team().id] then
			return
		end

		if managers.groupai:state():has_room_for_police_hostage() then
			local i_am_special = managers.groupai:state():is_enemy_special(data.unit)
			local required_skill = i_am_special and "intimidate_specials" or "intimidate_enemies"
			local aggressor_can_intimidate = nil
			local aggressor_intimidation_mul = 1

			if aggressor_unit:base().is_local_player then
				aggressor_can_intimidate = managers.player:has_category_upgrade("player", required_skill)
				aggressor_intimidation_mul = aggressor_intimidation_mul * managers.player:upgrade_value("player", "empowered_intimidation_mul", 1) * managers.player:upgrade_value("player", "intimidation_multiplier", 1)
			else
				aggressor_can_intimidate = aggressor_unit:base():upgrade_value("player", required_skill)
				aggressor_intimidation_mul = aggressor_intimidation_mul * (aggressor_unit:base():upgrade_value("player", "empowered_intimidation_mul") or 1) * (aggressor_unit:base():upgrade_value("player", "intimidation_multiplier") or 1)
			end

			if not managers.groupai:state():whisper_mode() and not managers.groupai:state():get_assault_mode() or aggressor_can_intimidate then
				local hold_chance = CopLogicBase._evaluate_reason_to_surrender(data, my_data, aggressor_unit)

				if hold_chance then
					hold_chance = hold_chance^aggressor_intimidation_mul

					if hold_chance >= 1 then
						-- Nothing
					else
						local rand_nr = math.random()

						print("and the winner is: hold_chance", hold_chance, "rand_nr", rand_nr, "rand_nr > hold_chance", hold_chance < rand_nr)

						if hold_chance < rand_nr then
							surrender = true
						end
					end
				end
			end

			if surrender then
				CopLogicIdle._surrender(data, amount, aggressor_unit)
			else
				data.unit:brain():on_surrender_chance()
			end
		end

		CopLogicBase.identify_attention_obj_instant(data, aggressor_unit:key())
		managers.groupai:state():criminal_spotted(aggressor_unit)

		return surrender
	end
end
if string.lower(RequiredScript) == "lib/managers/group_ai_states/groupaistatebase" then
	function GroupAIStateBase:has_room_for_police_hostage()
		local nr_hostages_allowed = 0
		for u_key, u_data in pairs(self._player_criminals) do
			if u_data.unit:base().is_local_player then
				if not managers.groupai:state():whisper_mode() and not managers.groupai:state():get_assault_mode() or managers.player:has_category_upgrade("player", "intimidate_enemies") then
					if managers.player:has_category_upgrade("player", "intimidate_aura") then
						nr_hostages_allowed = nr_hostages_allowed + 2
					else
						nr_hostages_allowed = nr_hostages_allowed + 1
					end
				end
			elseif not managers.groupai:state():whisper_mode() and not managers.groupai:state():get_assault_mode() or u_data.unit:base():upgrade_value("player", "intimidate_enemies") then
				if u_data.unit:base():upgrade_value("player", "intimidate_aura") then
					nr_hostages_allowed = nr_hostages_allowed + 2
				else
					nr_hostages_allowed = nr_hostages_allowed + 1
				end
			end
		end

		return nr_hostages_allowed > self._police_hostage_headcount + table.size(self._converted_police)
	end
	local _upd_criminal_suspicion_progress_original = GroupAIStateBase._upd_criminal_suspicion_progress
	function GroupAIStateBase:_upd_criminal_suspicion_progress(...)
		if self._ai_enabled and managers.groupai:state():whisper_mode() then
			for obs_key, obs_susp_data in pairs(self._suspicion_hud_data or {}) do
				local unit = obs_susp_data.u_observer
				local function _sync_status(sync_status_code)
					if Network:is_server() and managers.network:session() then
						managers.network:session():send_to_peers_synched("suspicion_hud", unit, sync_status_code)
					end
				end
				
				if managers.enemy:is_civilian(unit) then
					local waypoint = managers.hud._hud.waypoints["susp1" .. tostring(obs_key)]
					
					
					if waypoint then
						if unit:anim_data().drop then
							if not obs_susp_data._subdued_civ then
								obs_susp_data._alerted_civ = nil
								obs_susp_data._subdued_civ = true
									waypoint.arrow:set_color(Color(0, 0.3, 0.5))
									waypoint.bitmap:set_image("guis/textures/pd2/hud_stealth_eye")
									obs_susp_data.expire_time = self._t + 8
								_sync_status(1)
							end
						elseif obs_susp_data.alerted then
							if not obs_susp_data._alerted_civ then
								obs_susp_data._subdued_civ = nil
								obs_susp_data._alerted_civ = true
								if managers.player:has_category_upgrade("player", "civs_show_markers") then
									waypoint.arrow:set_alpha(1)
									waypoint.bitmap:set_alpha(1)
								end
								_sync_status(2)
							end
						end
						if obs_susp_data._subdued_civ then
							if obs_susp_data.expire_time < self._t then
								waypoint.arrow:set_alpha(0)
								waypoint.bitmap:set_alpha(0)
							end
						elseif obs_susp_data.status == "calling" then
							waypoint.arrow:set_alpha(1)
							waypoint.bitmap:set_alpha(1)
							_sync_status(3)
						end
					end
				end
			end
		end
		
		return _upd_criminal_suspicion_progress_original(self, ...)
	end
end
if string.lower(RequiredScript) == "lib/units/enemies/cop/logics/coplogicintimidated" then
	function CopLogicIntimidated._start_action_hands_up(data)
		data.rand_value = math.random()
		data.good_chance = 0.5
		local my_data = data.internal_data
		local spooked = data.rand_value <= data.good_chance
		local anim_name = spooked and managers.groupai:state():whisper_mode() and "tied_all_in_one" or "hands_up"
		local action_data = {
			type = "act",
			body_part = 1,
			variant = anim_name,
			clamp_to_graph = true,
			blocks = {
				light_hurt = -1,
				hurt = -1,
				heavy_hurt = -1,
				walk = -1
			}
		}
		my_data.act_action = data.unit:brain():action_request(action_data)
		if my_data.act_action and data.unit:anim_data().hands_tied then
			CopLogicIntimidated._do_tied(data, my_data.aggressor_unit)
		end
	end
	function CopLogicIntimidated._chk_begin_alarm_pager(data)
		if managers.groupai:state():whisper_mode() and data.unit:unit_data().has_alarm_pager then
			if data.rand_value >= data.good_chance then
				data.brain:begin_alarm_pager()
			end
		end
	end
end