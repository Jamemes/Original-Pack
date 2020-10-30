local easy_mode = Global.game_settings and Global.game_settings.one_down
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
					"passive_doctor_bag_interaction_speed_multiplier"
				},
				cost = self.costs.unlock_tree,
				desc_id = "menu_mastermind_tier_1"
			},
			{
				upgrades = {"team_passive_stamina_multiplier_1"},
				desc_id = "menu_mastermind_tier_2"
			},
			{
				upgrades = {"player_passive_intimidate_range_mul"},
				desc_id = "menu_mastermind_tier_3"
			},
			{
				upgrades = {
					"team_passive_health_multiplier",
					"player_passive_convert_enemies_health_multiplier",
					"player_passive_convert_enemies_damage_multiplier"
				},
				desc_id = "menu_mastermind_tier_4"
			},
			{
				upgrades = {"player_convert_enemies_interaction_speed_multiplier"},
				desc_id = "menu_mastermind_tier_5"
			},
			{
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
				upgrades = {"player_passive_suppression_bonus_2"},
				desc_id = "menu_menu_enforcer_tier_3"
			},
			{
				upgrades = {"player_passive_health_multiplier_2"},
				desc_id = "menu_menu_enforcer_tier_4"
			},
			{
				upgrades = {"weapon_passive_damage_multiplier"},
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
					"player_stand_still_crouch_camouflage_bonus_2"
				},
				cost = self.costs.unlock_tree,
				desc_id = "menu_hoxton_tier_1"
			},
			{
				upgrades = {"player_tier_armor_multiplier_1"},
				desc_id = "menu_hoxton_tier_2"
			},
			{
				upgrades = {"player_damage_dampener_outnumbered_strong"},
				desc_id = "menu_hoxton_tier_3"
			},
			{
				upgrades = {"weapon_special_damage_taken_multiplier"},
				desc_id = "menu_hoxton_tier_4"
			},
			{
				upgrades = {"player_corpse_dispose_speed_multiplier"},
				desc_id = "menu_hoxton_tier_5"
			},
			{
				upgrades = {"player_armor_regen_timer_stand_still_multiplier"},
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
				name_id = "st_menu_hoxton_pack",
				background_texture = "guis/textures/pd2/skilltree/bg_fugitive",
				tiers = {
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
				upgrades = {
					"player_hostage_move_speed_multiplier",
					"player_hostage_stay_speed_multiplier"
				},
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
		self.skills.messiah[2].upgrades = {"player_messiah_revive_from_bleed_out_2"}
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
		self.skills.shotgun_cqb[2].upgrades = {"shotgun_enter_steelsight_speed_multiplier"}
		self.skills.shotgun_cqb.icon_xy = {5, 1}
		self.skills.shotgun_cqb.name_id = "menu_shotgun_cqb"
		self.skills.shotgun_cqb.desc_id = "menu_shotgun_cqb_desc"
		self.skills.wolverine.name_id = "menu_wolverine"
		self.skills.from_the_hip.name_id = "menu_from_the_hip"
		self.skills.from_the_hip.desc_id = "menu_from_the_hip_desc"
		self.skills.bandoliers[2].upgrades = {"player_pick_up_ammo_multiplier", "player_pick_up_ammo_multiplier_2"}
		self.skills.bandoliers.name_id = "menu_bandoliers"
		self.skills.bandoliers.desc_id = "menu_bandoliers_desc"
		self.skills.portable_saw[1].upgrades = {"saw"}
		self.skills.portable_saw[2].upgrades = {"saw_extra_ammo_multiplier"}
		self.skills.portable_saw.name_id = "menu_portable_saw"
		self.skills.portable_saw.desc_id = "menu_portable_saw_desc"
		self.skills.overkill[2].upgrades = {"player_overkill_all_weapons"}
		self.skills.overkill.name_id = "menu_overkill"
		self.skills.overkill.desc_id = "menu_overkill_desc"
		self.skills.juggernaut[1].upgrades = {"body_armor6"}
		self.skills.juggernaut[2].upgrades = {"player_shield_knock", "player_run_and_shoot"}
		self.skills.juggernaut.name_id = "menu_juggernaut"
		self.skills.juggernaut.desc_id = "menu_juggernaut_desc"
		self.skills.carbon_blade[1].upgrades = {"player_saw_speed_multiplier_1", "saw_lock_damage_multiplier_1"}
		self.skills.carbon_blade[2].upgrades = {"player_saw_speed_multiplier_2", "saw_lock_damage_multiplier_2", "saw_enemy_slicer", "saw_reload_speed_multiplier"}
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
				upgrades = {"weapon_single_spread_index_addend"},
				cost = self.costs.default
			},
			{
				upgrades = {"single_shot_accuracy_inc_1"},
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
				upgrades = {"trip_mine_marked_enemy_extra_damage"},
				cost = self.costs.pro
			},
			name_id = "menu_master_craftsman",
			desc_id = "menu_master_craftsman_desc",
			icon_xy = {6, 9}
		}
		self.skills.sentry_gun[1].upgrades = {"sentry_gun", "sentry_gun_silent"}
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
				upgrades = {"sentry_gun_damage_multiplier"},
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
				upgrades = {"player_critical_hit_chance_1", "snp_move_spread_multiplier"},
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
				upgrades = {"team_armor_regen_time_multiplier"},
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
				upgrades = {"player_camouflage_bonus_2"},
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
				upgrades = {"player_marked_enemy_extra_damage"},
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
		self.skills.good_luck_charm[2].upgrades = {"player_tape_loop_duration_2"}
		self.skills.good_luck_charm.name_id = "menu_good_luck_charm"
		self.skills.good_luck_charm.desc_id = "menu_good_luck_charm_desc"
		self.skills.ecm_booster[1].upgrades = {"ecm_jammer_duration_multiplier"}
		self.skills.ecm_booster.name_id = "menu_ecm_booster"
		self.skills.ecm_booster.desc_id = "menu_ecm_booster_desc"
		self.skills.silence_expert[1].upgrades = {"weapon_silencer_recoil_multiplier", "weapon_silencer_enter_steelsight_speed_multiplier"}
		self.skills.silence_expert[2].upgrades = {"weapon_silencer_spread_multiplier", "weapon_silencer_armor_piercing_chance_2"}
		self.skills.silence_expert.name_id = "menu_silence_expert"
		self.skills.silence_expert.desc_id = "menu_silence_expert_desc"
		self.skills.low_blow = {
			{
				upgrades = {"player_detection_risk_add_crit_chance_1"},
				cost = self.costs.hightier
			},
			{
				upgrades = {"player_detection_risk_add_crit_chance_2"},
				cost = self.costs.hightierpro
			},
			name_id = "menu_backstab_beta",
			desc_id = "menu_backstab_beta_desc",
			icon_xy = {0, 12}
		}
		self.skills.ecm_feedback[1].upgrades = {"ecm_jammer_can_activate_feedback"}
		self.skills.ecm_feedback[2].upgrades = {"ecm_jammer_feedback_duration_boost", "ecm_jammer_interaction_speed_multiplier", "ecm_jammer_can_retrigger"}
		self.skills.ecm_feedback.name_id = "menu_ecm_feedback"
		self.skills.ecm_feedback.desc_id = "menu_ecm_feedback_desc"
		self.skills.hitman = {
			{
				upgrades = {"weapon_silencer_damage_multiplier_1"},
				cost = self.costs.hightier
			},
			{
				upgrades = {"weapon_silencer_damage_multiplier_2", "weapon_silencer_armor_piercing_chance_1"},
				cost = self.costs.hightierpro
			},
			name_id = "menu_hitman",
			desc_id = "menu_hitman_desc",
			icon_xy = {5, 9}
		}

		self.skills.cell_mates[1].upgrades = {"player_gangster_damage_dampener_1"}
		self.skills.cell_mates[2].upgrades = {"player_gangster_damage_dampener_2"}
		self.skills.cell_mates.name_id = "menu_cell_mates"
		self.skills.cell_mates.desc_id = "menu_cell_mates_desc"
		self.skills.master_craftsman = {
			{
				upgrades = {"player_crafting_weapon_multiplier"},
				cost = self.costs.default
			},
			{
				upgrades = {"player_crafting_mask_multiplier"},
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
				upgrades = {"player_movement_speed_multiplier"},
				cost = self.costs.default
			},
			{
				upgrades = {"player_steelsight_normal_movement_speed"},
				cost = self.costs.pro
			},
			name_id = "menu_awareness",
			desc_id = "menu_awareness_desc",
			icon_xy = {7, 10}
		}
		self.skills.alpha_dog[2].upgrades = {"player_crouch_dodge_chance_2"}
		self.skills.alpha_dog.name_id = "menu_alpha_dog"
		self.skills.alpha_dog.desc_id = "menu_alpha_dog_desc"
		self.skills.up_you_go[1].cost = self.costs.default
		self.skills.up_you_go[2].cost = self.costs.pro
		self.skills.up_you_go.icon_xy = {3, 13}
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
				upgrades = {"player_mark_enemy_time_multiplier"},
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
				upgrades = {"player_damage_shake_addend"},
				cost = self.costs.hightier
			},
			{
				upgrades = {"player_level_2_armor_addend", "player_level_3_armor_addend", "player_level_4_armor_addend"},
				cost = self.costs.hightierpro
			},
			name_id = "menu_thick_skin",
			desc_id = "menu_thick_skin_desc",
			icon_xy = {2, 12}
		}
		self.skills.tea_time[1].cost = self.costs.hightier
		self.skills.tea_time[2].cost = self.costs.hightierpro
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
		self.skills.second_chances = {
			{
				upgrades = {"bodybags_bag"},
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
		self.skills.tea_cookies[2].upgrades = {"first_aid_kit_quantity_increase_2"}
		self.skills.tea_cookies.name_id = "menu_tea_cookies"
		self.skills.tea_cookies.desc_id = "menu_tea_cookies_desc"
		self.skills.akimbo[1].upgrades = {
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
			{
				name_id = "menu_heavy_impact",
				desc_id = "menu_heavy_impact_desc",
				{
					upgrades = {
						"weapon_knock_down_1"
					},
					cost = high,
					icon_xy = {5, 1},
					name_id = "menu_heavy_impact",
					desc_id = "menu_heavy_impact_detailed_desc"
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

		self.values.team.damage = {
			hostage_absorption = {0.1},
			hostage_absorption_limit = 12
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
				{"25%"},
				{"35%"}
			},
			shades = {
				{"25%"},
				{"50%"}
			},
			from_the_hip = {
				{"20%"},
				{"20%"}
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
				{"50%"}
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
if not easy_mode and string.lower(RequiredScript) == "lib/tweak_data/playertweakdata" then
	local data = PlayerTweakData.init
	function PlayerTweakData:init(tweak_data)
		data(self, tweak_data)
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

	function PlayerDamage:replenish()
		if (Application:editor() or managers.platform:presence() == "Playing") and (self:arrested() or self:need_revive()) then
			self:revive(true)
		end

		if Global.game_settings.one_down then
			self._lives_init = tweak_data.player.damage.LIVES_INIT
		end
		
		self:_regenerated()
		self:_regenerate_armor()
		managers.hud:set_player_health({
			current = self:get_real_health(),
			total = self:_max_health(),
			revives = Application:digest_value(self._revives, false)
		})
		SoundDevice:set_rtpc("shield_status", 100)
		SoundDevice:set_rtpc("downed_state_progression", 0)
	end

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
	function PlayerInventoryGui:set_skilltree_stats(panel, data) return end
	PlayerInventoryGui._update_info_skilltree = function(self, name)
		local text_string = ""
		text_string = text_string .. managers.localization:text("menu_st_skill_switch_set", {skill_switch = managers.skilltree:get_skill_switch_name(managers.skilltree:get_selected_skill_switch(), true)}) .. "\n "
		local tree_to_string_id = {mastermind = "st_menu_mastermind", enforcer = "st_menu_enforcer", technician = "st_menu_technician", ghost = "st_menu_ghost", hoxton = "st_menu_hoxton_pack"}
		text_string = text_string .. "\n"
		for i,tree in ipairs({"mastermind", "enforcer", "technician", "ghost", "hoxton"}) do
			local points, progress, num_skills = managers.skilltree:get_tree_progress_new(tree)
			points = string.format("%02d", points)
			text_string = text_string .. managers.localization:to_upper_text("menu_profession_progress", {profession = managers.localization:to_upper_text(tree_to_string_id[tree]), progress = points, num_skills = num_skills}) .. "\n"
		end
		self:set_info_text(text_string)
	end
end
if string.lower(RequiredScript) == "lib/units/equipment/ammo_bag/ammobagbase" then
	AmmoBagBase._BULLET_STORM = {5, 10}
end
if string.lower(RequiredScript) == "lib/managers/menu/menucomponentmanager" then
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