local data = WeaponFactoryTweakData.init
function WeaponFactoryTweakData:init(tweak_data)
    data(self, tweak_data)
	
	self.parts.wpn_fps_saw_body_silent.stats.alert_size = 7
	
	self.parts.wpn_fps_upg_a_slug.stats = {
			value = 5,
			total_ammo_mod = -10,
			damage = 3,
			spread = 2,
			moving_spread = 2
		}
	self.parts.wpn_fps_upg_a_custom.stats = {
			value = 5,
			total_ammo_mod = -6,
			damage = 3
		}
	self.parts.wpn_fps_upg_a_custom_free.stats = {
			value = 5,
			total_ammo_mod = -6,
			damage = 3
		}
	self.parts.wpn_fps_upg_a_explosive.stats = {
			value = 5,
			total_ammo_mod = -10,
			damage = 3,
			spread = -3,
			moving_spread = 3
		}
	self.parts.wpn_fps_upg_a_piercing.stats = {
			value = 5,
			damage = -3,
			spread = 2
		}
	self.parts.wpn_fps_upg_a_dragons_breath.stats = {
			value = 5,
			total_ammo_mod = -6,
			damage = -2,
			spread = -1,
			moving_spread = 3
		}
	self.parts.wpn_fps_upg_a_grenade_launcher_incendiary.stats = {damage = -30}
	self.parts.wpn_fps_upg_a_bow_explosion.stats = {damage = 4}
	self.parts.wpn_fps_upg_a_bow_poison.stats = {damage = -12, total_ammo_mod = -6}
	self.parts.wpn_fps_bow_long_m_explosive.stats = {damage = 4}
	self.parts.wpn_fps_bow_long_m_poison.stats = {damage = -12, total_ammo_mod = -6}
	self.parts.wpn_fps_bow_elastic_m_explosive.stats = {damage = 4}
	self.parts.wpn_fps_bow_elastic_m_poison.stats = {damage = -12, total_ammo_mod = -6}
	self.parts.wpn_fps_bow_frankish_m_poison.stats = {damage = -14, total_ammo_mod = -6}
	self.parts.wpn_fps_bow_frankish_m_explosive.stats = {damage = 5}
	self.parts.wpn_fps_bow_ecp_m_arrows_poison.stats = {damage = -14, total_ammo_mod = -6}
	self.parts.wpn_fps_bow_ecp_m_arrows_explosive.stats = {damage = 5}
	self.parts.wpn_fps_bow_arblast_m_poison.stats = {damage = -14, total_ammo_mod = -6}
	self.parts.wpn_fps_bow_arblast_m_explosive.stats = {damage = 5}
	self.parts.wpn_fps_fla_mk2_mag_rare.stats = {
			value = 1,
			total_ammo_mod = 5,
			damage = -3
		}
	self.parts.wpn_fps_fla_mk2_mag_welldone.stats = {
			value = 1,
			total_ammo_mod = -5,
			damage = 3
		}
	self.parts.wpn_fps_fla_system_m_low.stats = {
			value = 1,
			total_ammo_mod = 5,
			damage = -3
		}
	self.parts.wpn_fps_fla_system_m_high.stats = {
			value = 1,
			total_ammo_mod = -5,
			damage = 3
		}
	self.parts.wpn_fps_upg_a_crossbow_poison.stats = {damage = -14, total_ammo_mod = -6}
	self.parts.wpn_fps_upg_a_crossbow_explosion.stats = {damage = 5}
	self.parts.wpn_fps_upg_a_grenade_launcher_incendiary_arbiter.stats = {damage = -20}
	
	self.parts.wpn_fps_upg_ass_m4_b_beowulf.stats = {
		value = 1,
		spread = 2,
		recoil = -8,
		total_ammo_mod = -12,
		damage = 12,
		concealment = -4
	}
	self.wpn_fps_ass_m16.override.wpn_fps_upg_ass_m4_b_beowulf.stats = {
		value = 1,
		spread = 2,
		recoil = -8,
		total_ammo_mod = -6,
		damage = 10,
		concealment = -4
	}
	self.wpn_fps_ass_74.override.wpn_fps_upg_ass_ak_b_zastava.stats = {
		value = 1,
		spread = 2,
		recoil = -8,
		total_ammo_mod = -12,
		damage = 14,
		concealment = -4
	}
	self.parts.wpn_fps_upg_ass_ak_b_zastava.stats = {
		value = 1,
		spread = 2,
		recoil = -8,
		total_ammo_mod = -6,
		damage = 10,
		concealment = -4
	}
	self.wpn_fps_ass_74.override.wpn_fps_upg_ass_ak_b_zastava.stats = {
		value = 1,
		spread = 2,
		recoil = -8,
		total_ammo_mod = -12,
		damage = 14,
		concealment = -4
	}

	self.parts.wpn_fps_upg_ass_m4_b_beowulf.custom_stats = {ammo_pickup_min_mul = 0.5, ammo_pickup_max_mul = 0.5}
	self.wpn_fps_ass_m16.override.wpn_fps_upg_ass_m4_b_beowulf.custom_stats = {ammo_pickup_min_mul = 0.8, ammo_pickup_max_mul = 0.8}
	self.wpn_fps_ass_74.override.wpn_fps_upg_ass_ak_b_zastava.custom_stats = {ammo_pickup_min_mul = 0.5, ammo_pickup_max_mul = 0.5}
	self.parts.wpn_fps_upg_ass_ak_b_zastava.custom_stats = {ammo_pickup_min_mul = 0.5, ammo_pickup_max_mul = 0.5}
	self.wpn_fps_ass_74.override.wpn_fps_upg_ass_ak_b_zastava.custom_stats = {ammo_pickup_min_mul = 0.5, ammo_pickup_max_mul = 0.5}
	
	self.parts.wpn_fps_ass_aug_m_quick.stats = {value = 2, reload = 3}
	self.parts.wpn_fps_m4_upg_m_quick.stats = {value = 2, reload = 3}
	self.parts.wpn_fps_upg_ak_m_quick.stats = {value = 2, reload = 3}
	self.parts.wpn_fps_ass_g36_m_quick.stats = {value = 2, reload = 3}
	self.parts.wpn_fps_smg_mac10_m_quick.stats = {value = 2, reload = 3}
	self.parts.wpn_fps_smg_sr2_m_quick.stats = {value = 2, reload = 3}
		
	self.wpn_fps_lmg_m249.uses_parts = {
			"wpn_fps_lmg_m249_b_long",
			"wpn_fps_lmg_m249_b_short",
			"wpn_fps_lmg_m249_body_standard",
			"wpn_fps_lmg_m249_fg_mk46",
			"wpn_fps_lmg_m249_fg_standard",
			"wpn_fps_lmg_m249_m_standard",
			"wpn_fps_lmg_m249_s_para",
			"wpn_fps_lmg_m249_s_solid",
			"wpn_fps_lmg_m249_upper_reciever",
			"wpn_fps_upg_m4_s_standard",
			"wpn_fps_upg_m4_s_pts",
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_bp_lmg_lionbipod",
			"wpn_fps_upg_fl_ass_smg_sho_peqbox",
			"wpn_fps_upg_fl_ass_smg_sho_surefire",
			"wpn_fps_upg_m4_s_crane",
			"wpn_fps_upg_m4_s_mk46",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_fl_ass_peq15",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_m4_s_ubr",
			"wpn_fps_upg_ass_ns_battle",
			"wpn_fps_upg_fl_ass_utg",
			"wpn_fps_snp_tti_s_vltor",
			"wpn_fps_upg_ns_ass_smg_v6"
		}
	self.wpn_fps_lmg_hk21.uses_parts = {
			"wpn_fps_lmg_hk21_b_short",
			"wpn_fps_lmg_hk21_b_long",
			"wpn_fps_lmg_hk21_body_lower",
			"wpn_fps_lmg_hk21_body_upper",
			"wpn_fps_lmg_hk21_fg_short",
			"wpn_fps_lmg_hk21_fg_long",
			"wpn_fps_lmg_hk21_g_standard",
			"wpn_fps_lmg_hk21_g_ergo",
			"wpn_fps_lmg_hk21_m_standard",
			"wpn_fps_lmg_hk21_s_standard",
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_bp_lmg_lionbipod",
			"wpn_fps_upg_fl_ass_smg_sho_peqbox",
			"wpn_fps_upg_fl_ass_smg_sho_surefire",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_fl_ass_peq15",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_ass_ns_battle",
			"wpn_fps_upg_fl_ass_utg",
			"wpn_fps_upg_ns_ass_smg_v6"
		}
	self.wpn_fps_lmg_rpk.uses_parts = {
			"wpn_fps_lmg_rpk_b_standard",
			"wpn_fps_lmg_rpk_fg_standard",
			"wpn_fps_lmg_rpk_fg_wood",
			"wpn_lmg_rpk_m_drum",
			"wpn_fps_lmg_rpk_s_standard",
			"wpn_fps_lmg_rpk_s_wood",
			"wpn_fps_ass_74_body_upperreceiver",
			"wpn_fps_lmg_rpk_body_lowerreceiver",
			"wpn_upg_ak_g_standard",
			"wpn_fps_upg_ak_g_hgrip",
			"wpn_fps_upg_ak_g_pgrip",
			"wpn_fps_upg_ak_g_wgrip",
			"wpn_fps_upg_m4_s_standard",
			"wpn_fps_upg_m4_s_pts",
			"wpn_upg_ak_s_folding",
			"wpn_upg_ak_s_skfoldable_vanilla",
			"wpn_fps_upg_fl_ass_smg_sho_peqbox",
			"wpn_fps_upg_fl_ass_smg_sho_surefire",
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_bp_lmg_lionbipod",
			"wpn_fps_upg_vg_ass_smg_verticalgrip",
			"wpn_fps_upg_m4_s_crane",
			"wpn_fps_upg_m4_s_mk46",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_fl_ass_peq15",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_m4_s_ubr",
			"wpn_fps_upg_ak_g_rk3",
			"wpn_fps_upg_ak_s_solidstock",
			"wpn_fps_upg_ns_ass_pbs1",
			"wpn_fps_upg_ass_ns_battle",
			"wpn_fps_upg_fl_ass_utg",
			"wpn_fps_snp_tti_s_vltor",
			"wpn_fps_upg_ns_ass_smg_v6"
		}
	self.wpn_fps_lmg_mg42.uses_parts = {
			"wpn_fps_lmg_mg42_b_mg42",
			"wpn_fps_lmg_mg42_b_mg34",
			"wpn_fps_lmg_mg42_b_vg38",
			"wpn_fps_lmg_mg42_reciever",
			"wpn_fps_lmg_mg42_n42",
			"wpn_fps_lmg_mg42_n34",
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_bp_lmg_lionbipod",
			"wpn_fps_upg_fl_ass_smg_sho_peqbox",
			"wpn_fps_upg_fl_ass_smg_sho_surefire",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_fl_ass_peq15",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_ass_ns_battle",
			"wpn_fps_upg_fl_ass_utg",
			"wpn_fps_upg_ns_ass_smg_v6"
		}
	self.wpn_fps_lmg_par.uses_parts = {
			"wpn_fps_lmg_par_b_short",
			"wpn_fps_lmg_par_b_standard",
			"wpn_fps_lmg_par_body_standard",
			"wpn_fps_lmg_par_m_standard",
			"wpn_fps_lmg_par_s_standard",
			"wpn_fps_lmg_par_s_plastic",
			"wpn_fps_lmg_par_upper_reciever",
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_bp_lmg_lionbipod",
			"wpn_fps_upg_fl_ass_smg_sho_peqbox",
			"wpn_fps_upg_fl_ass_smg_sho_surefire",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_fl_ass_peq15",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_ass_ns_battle",
			"wpn_fps_upg_fl_ass_utg",
			"wpn_fps_lmg_svinet_b_standard",
			"wpn_fps_lmg_svinet_s_legend",
			"wpn_fps_upg_ns_ass_smg_v6"
		}

	self.parts.wpn_fps_ass_sub2000_m_standard.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_pis_beretta_body_modern.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_pis_deagle_b_modern.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_pis_deagle_extra.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_pis_judge_body_modern.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_pis_rage_extra.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_smg_mac10_body_modern.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_smg_p90_body_boxy.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_ak_b_draco.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_ak_fg_tapco.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_ak_g_hgrip.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_ak_g_pgrip.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_ak_g_wgrip.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_ak_m_quad.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_ass_ns_jprifles.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_ass_ns_linear.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_ass_ns_surefire.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_fg_jp.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_fg_midwest.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_fg_smr.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_fl_ass_laser.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_fl_ass_peq15.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_m4_m_quad.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_m4_s_crane.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_m4_s_mk46.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_ns_pis_medium_slim.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_o_cs.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_o_eotech_xps.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_o_reflex.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_o_rmr.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_o_rx01.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_o_rx30.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_pis_adam.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_pis_ns_flash.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_shot_ns_king.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_ass_asval_b_proto.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_ass_asval_s_solid.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_ass_aug_m_quick.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_ass_fal_fg_01.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_ass_fal_fg_03.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_ass_fal_fg_04.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_ass_fal_fg_wood.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_ass_fal_g_01.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_ass_fal_m_01.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_ass_fal_s_01.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_ass_fal_s_03.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_ass_fal_s_wood.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_ass_famas_b_long.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_ass_famas_b_short.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_ass_famas_b_sniper.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_ass_famas_b_suppressed.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_ass_famas_body_standard.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_ass_famas_g_retro.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_ass_g3_b_short.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_ass_g3_b_sniper.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_ass_g3_fg_psg.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_ass_g3_fg_retro.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_ass_g3_fg_retro_plastic.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_ass_g3_g_retro.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_ass_g3_g_sniper.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_ass_g3_s_sniper.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_ass_g3_s_wood.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_ass_g36_m_quick.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_ass_g36_o_vintage.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_ass_galil_fg_fab.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_ass_galil_fg_mar.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_ass_galil_fg_sar.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_ass_galil_fg_sniper.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_ass_galil_g_sniper.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_ass_galil_s_fab.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_ass_galil_s_light.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_ass_galil_s_plastic.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_ass_galil_s_skeletal.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_ass_galil_s_sniper.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_ass_galil_s_wood.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_ass_sub2000_fg_gen2.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_ass_sub2000_fg_railed.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_ass_sub2000_fg_suppressed.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_bow_ecp_m_arrows_explosive.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_bow_ecp_m_arrows_poison.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_bow_elastic_m_explosive.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_bow_elastic_m_poison.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_gre_arbiter_b_comp.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_gre_arbiter_b_long.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_gre_m32_no_stock.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_gre_m79_barrel_short.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_gre_m79_stock_short.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_lmg_mg42_b_mg34.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_lmg_mg42_b_vg38.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_m4_upg_m_quick.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_pis_1911_m_big.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_pis_c96_b_long.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_pis_c96_m_extended.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_pis_c96_nozzle.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_pis_c96_s_solid.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_pis_c96_sight.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_pis_packrat_m_extended.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_pis_packrat_ns_wick.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_pis_packrat_o_expert.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_pis_usp_m_big.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_sho_ben_b_long.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_sho_ben_b_short.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_sho_ben_s_collapsed.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_sho_ben_s_solid.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_sho_ksg_b_long.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_sho_ksg_b_short.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_sho_saiga_b_short.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_sho_saiga_fg_holy.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_sho_striker_b_long.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_sho_striker_b_suppressed.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_smg_cobray_body_upper_jacket.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_smg_mac10_m_quick.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_smg_mp5_fg_flash.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_smg_mp5_s_folding.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_smg_p90_m_strap.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_smg_schakal_b_civil.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_smg_schakal_m_long.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_smg_schakal_m_short.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_smg_schakal_ns_silencer.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_smg_schakal_s_civil.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_smg_schakal_s_folded.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_smg_schakal_vg_surefire.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_smg_scorpion_b_suppressed.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_smg_scorpion_g_ergo.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_smg_scorpion_g_wood.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_smg_scorpion_m_extended.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_smg_scorpion_s_nostock.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_smg_scorpion_s_unfolded.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_smg_sr2_m_quick.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_smg_sterling_b_e11.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_smg_sterling_b_long.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_smg_sterling_b_short.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_smg_sterling_b_suppressed.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_smg_sterling_m_long.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_smg_sterling_m_short.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_smg_sterling_s_folded.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_smg_sterling_s_nostock.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_smg_sterling_s_solid.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_smg_tec9_b_standard.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_smg_tec9_m_extended.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_smg_tec9_ns_ext.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_smg_tec9_s_unfolded.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_smg_uzi_b_suppressed.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_smg_uzi_fg_rail.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_smg_uzi_s_leather.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_smg_uzi_s_solid.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_smg_uzi_s_standard.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_snp_desertfox_b_long.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_snp_desertfox_b_silencer.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_snp_m95_barrel_long.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_snp_m95_barrel_short.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_snp_m95_barrel_suppressed.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_snp_model70_iron_sight.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_snp_mosin_b_short.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_snp_mosin_b_sniper.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_snp_mosin_b_standard.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_snp_mosin_body_black.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_snp_mosin_ns_bayonet.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_snp_msr_b_long.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_snp_msr_body_msr.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_snp_msr_ns_suppressor.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_a_bow_explosion.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_a_bow_poison.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_a_custom.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_a_dragons_breath.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_a_explosive.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_a_grenade_launcher_incendiary.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_a_grenade_launcher_incendiary_arbiter.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_a_piercing.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_a_slug.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_ak_b_ak105.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_ak_fg_krebs.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_ak_fg_trax.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_ak_fg_zenit.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_ak_g_rk3.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_ak_m_quick.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_ak_m_uspalm.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_ak_s_solidstock.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_ass_ak_b_zastava.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_ass_m4_b_beowulf.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_ass_m4_fg_lvoa.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_ass_m4_fg_moe.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_ass_m4_lower_reciever_core.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_ass_m4_upper_reciever_ballos.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_ass_m4_upper_reciever_core.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_ass_m16_fg_stag.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_g36_fg_long.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_m4_m_l5.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_m4_s_ubr.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_ns_ass_pbs1.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_ns_duck.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_o_45iron.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_o_45rds.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_o_ak_scopemount.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_o_box.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_o_leupold.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_o_mbus_front.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_o_mbus_rear.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_o_spot.pcs = {10, 20, 30, 40}
	self.parts.wpn_fps_upg_smg_olympic_fg_lr300.pcs = {10, 20, 30, 40}
	
	self.parts.wpn_fps_ass_sub2000_m_standard.stats.value = 6
	self.parts.wpn_fps_pis_beretta_body_modern.stats.value = 6
	self.parts.wpn_fps_pis_deagle_b_modern.stats.value = 6
	self.parts.wpn_fps_pis_deagle_extra.stats.value = 6
	self.parts.wpn_fps_pis_judge_body_modern.stats.value = 6
	self.parts.wpn_fps_pis_rage_extra.stats.value = 6
	self.parts.wpn_fps_smg_mac10_body_modern.stats.value = 6
	self.parts.wpn_fps_smg_p90_body_boxy.stats.value = 6
	self.parts.wpn_fps_upg_ak_b_draco.stats.value = 6
	self.parts.wpn_fps_upg_ak_fg_tapco.stats.value = 6
	self.parts.wpn_fps_upg_ak_g_hgrip.stats.value = 6
	self.parts.wpn_fps_upg_ak_g_pgrip.stats.value = 6
	self.parts.wpn_fps_upg_ak_g_wgrip.stats.value = 6
	self.parts.wpn_fps_upg_ak_m_quad.stats.value = 6
	self.parts.wpn_fps_upg_ass_ns_jprifles.stats.value = 6
	self.parts.wpn_fps_upg_ass_ns_linear.stats.value = 6
	self.parts.wpn_fps_upg_ass_ns_surefire.stats.value = 6
	self.parts.wpn_fps_upg_fg_jp.stats.value = 6
	self.parts.wpn_fps_upg_fg_midwest.stats.value = 6
	self.parts.wpn_fps_upg_fg_smr.stats.value = 6
	self.parts.wpn_fps_upg_fl_ass_laser.stats.value = 6
	self.parts.wpn_fps_upg_fl_ass_peq15.stats.value = 6
	self.parts.wpn_fps_upg_m4_m_quad.stats.value = 6
	self.parts.wpn_fps_upg_m4_s_crane.stats.value = 6
	self.parts.wpn_fps_upg_m4_s_mk46.stats.value = 6
	self.parts.wpn_fps_upg_ns_pis_medium_slim.stats.value = 6
	self.parts.wpn_fps_upg_o_cs.stats.value = 6
	self.parts.wpn_fps_upg_o_eotech_xps.stats.value = 6
	self.parts.wpn_fps_upg_o_reflex.stats.value = 6
	self.parts.wpn_fps_upg_o_rmr.stats.value = 6
	self.parts.wpn_fps_upg_o_rx01.stats.value = 6
	self.parts.wpn_fps_upg_pis_adam.stats.value = 6
	self.parts.wpn_fps_upg_pis_ns_flash.stats.value = 6
	self.parts.wpn_fps_upg_shot_ns_king.stats.value = 6
	self.parts.wpn_fps_ass_asval_b_proto.stats.value = 7
	self.parts.wpn_fps_ass_asval_s_solid.stats.value = 7
	self.parts.wpn_fps_ass_aug_m_quick.stats.value = 7
	self.parts.wpn_fps_ass_fal_fg_01.stats.value = 7
	self.parts.wpn_fps_ass_fal_fg_03.stats.value = 7
	self.parts.wpn_fps_ass_fal_fg_04.stats.value = 7
	self.parts.wpn_fps_ass_fal_fg_wood.stats.value = 7
	self.parts.wpn_fps_ass_fal_g_01.stats.value = 7
	self.parts.wpn_fps_ass_fal_m_01.stats.value = 7
	self.parts.wpn_fps_ass_fal_s_01.stats.value = 7
	self.parts.wpn_fps_ass_fal_s_03.stats.value = 7
	self.parts.wpn_fps_ass_fal_s_wood.stats.value = 7
	self.parts.wpn_fps_ass_famas_b_long.stats.value = 7
	self.parts.wpn_fps_ass_famas_b_short.stats.value = 7
	self.parts.wpn_fps_ass_famas_b_sniper.stats.value = 7
	self.parts.wpn_fps_ass_famas_b_suppressed.stats.value = 7
	self.parts.wpn_fps_ass_famas_body_standard.stats.value = 7
	self.parts.wpn_fps_ass_famas_g_retro.stats.value = 7
	self.parts.wpn_fps_ass_g3_b_short.stats.value = 7
	self.parts.wpn_fps_ass_g3_b_sniper.stats.value = 7
	self.parts.wpn_fps_ass_g3_fg_psg.stats.value = 7
	self.parts.wpn_fps_ass_g3_fg_retro.stats.value = 7
	self.parts.wpn_fps_ass_g3_fg_retro_plastic.stats.value = 7
	self.parts.wpn_fps_ass_g3_g_retro.stats.value = 7
	self.parts.wpn_fps_ass_g3_g_sniper.stats.value = 7
	self.parts.wpn_fps_ass_g3_s_sniper.stats.value = 7
	self.parts.wpn_fps_ass_g3_s_wood.stats.value = 7
	self.parts.wpn_fps_ass_g36_m_quick.stats.value = 7
	self.parts.wpn_fps_ass_g36_o_vintage.stats.value = 7
	self.parts.wpn_fps_ass_galil_fg_fab.stats.value = 7
	self.parts.wpn_fps_ass_galil_fg_mar.stats.value = 7
	self.parts.wpn_fps_ass_galil_fg_sar.stats.value = 7
	self.parts.wpn_fps_ass_galil_fg_sniper.stats.value = 7
	self.parts.wpn_fps_ass_galil_g_sniper.stats.value = 7
	self.parts.wpn_fps_ass_galil_s_fab.stats.value = 7
	self.parts.wpn_fps_ass_galil_s_light.stats.value = 7
	self.parts.wpn_fps_ass_galil_s_plastic.stats.value = 7
	self.parts.wpn_fps_ass_galil_s_skeletal.stats.value = 7
	self.parts.wpn_fps_ass_galil_s_sniper.stats.value = 7
	self.parts.wpn_fps_ass_galil_s_wood.stats.value = 7
	self.parts.wpn_fps_ass_sub2000_fg_gen2.stats.value = 7
	self.parts.wpn_fps_ass_sub2000_fg_railed.stats.value = 7
	self.parts.wpn_fps_ass_sub2000_fg_suppressed.stats.value = 7
	self.parts.wpn_fps_bow_ecp_m_arrows_explosive.stats.value = 7
	self.parts.wpn_fps_bow_ecp_m_arrows_poison.stats.value = 7
	self.parts.wpn_fps_bow_elastic_m_explosive.stats.value = 7
	self.parts.wpn_fps_bow_elastic_m_poison.stats.value = 7
	self.parts.wpn_fps_gre_arbiter_b_comp.stats.value = 7
	self.parts.wpn_fps_gre_arbiter_b_long.stats.value = 7
	self.parts.wpn_fps_gre_m32_no_stock.stats.value = 7
	self.parts.wpn_fps_gre_m79_barrel_short.stats.value = 7
	self.parts.wpn_fps_gre_m79_stock_short.stats.value = 7
	self.parts.wpn_fps_lmg_mg42_b_mg34.stats.value = 7
	self.parts.wpn_fps_lmg_mg42_b_vg38.stats.value = 7
	self.parts.wpn_fps_m4_upg_m_quick.stats.value = 7
	self.parts.wpn_fps_pis_1911_m_big.stats.value = 7
	self.parts.wpn_fps_pis_c96_b_long.stats.value = 7
	self.parts.wpn_fps_pis_c96_m_extended.stats.value = 7
	self.parts.wpn_fps_pis_c96_nozzle.stats.value = 7
	self.parts.wpn_fps_pis_c96_s_solid.stats.value = 7
	self.parts.wpn_fps_pis_c96_sight.stats.value = 7
	self.parts.wpn_fps_pis_packrat_m_extended.stats.value = 7
	self.parts.wpn_fps_pis_packrat_ns_wick.stats.value = 7
	self.parts.wpn_fps_pis_packrat_o_expert.stats.value = 7
	self.parts.wpn_fps_pis_usp_m_big.stats.value = 7
	self.parts.wpn_fps_sho_ben_b_long.stats.value = 7
	self.parts.wpn_fps_sho_ben_b_short.stats.value = 7
	self.parts.wpn_fps_sho_ben_s_collapsed.stats.value = 7
	self.parts.wpn_fps_sho_ben_s_solid.stats.value = 7
	self.parts.wpn_fps_sho_ksg_b_long.stats.value = 7
	self.parts.wpn_fps_sho_ksg_b_short.stats.value = 7
	self.parts.wpn_fps_sho_saiga_b_short.stats.value = 7
	self.parts.wpn_fps_sho_saiga_fg_holy.stats.value = 7
	self.parts.wpn_fps_sho_striker_b_long.stats.value = 7
	self.parts.wpn_fps_sho_striker_b_suppressed.stats.value = 7
	self.parts.wpn_fps_smg_cobray_body_upper_jacket.stats.value = 7
	self.parts.wpn_fps_smg_mac10_m_quick.stats.value = 7
	self.parts.wpn_fps_smg_mp5_fg_flash.stats.value = 7
	self.parts.wpn_fps_smg_mp5_s_folding.stats.value = 7
	self.parts.wpn_fps_smg_p90_m_strap.stats.value = 7
	self.parts.wpn_fps_smg_schakal_b_civil.stats.value = 7
	self.parts.wpn_fps_smg_schakal_m_long.stats.value = 7
	self.parts.wpn_fps_smg_schakal_m_short.stats.value = 7
	self.parts.wpn_fps_smg_schakal_ns_silencer.stats.value = 7
	self.parts.wpn_fps_smg_schakal_s_civil.stats.value = 7
	self.parts.wpn_fps_smg_schakal_s_folded.stats.value = 7
	self.parts.wpn_fps_smg_schakal_vg_surefire.stats.value = 7
	self.parts.wpn_fps_smg_scorpion_b_suppressed.stats.value = 7
	self.parts.wpn_fps_smg_scorpion_g_ergo.stats.value = 7
	self.parts.wpn_fps_smg_scorpion_g_wood.stats.value = 7
	self.parts.wpn_fps_smg_scorpion_m_extended.stats.value = 7
	self.parts.wpn_fps_smg_scorpion_s_nostock.stats.value = 7
	self.parts.wpn_fps_smg_scorpion_s_unfolded.stats.value = 7
	self.parts.wpn_fps_smg_sr2_m_quick.stats.value = 7
	self.parts.wpn_fps_smg_sterling_b_e11.stats.value = 7
	self.parts.wpn_fps_smg_sterling_b_long.stats.value = 7
	self.parts.wpn_fps_smg_sterling_b_short.stats.value = 7
	self.parts.wpn_fps_smg_sterling_b_suppressed.stats.value = 7
	self.parts.wpn_fps_smg_sterling_m_long.stats.value = 7
	self.parts.wpn_fps_smg_sterling_m_short.stats.value = 7
	self.parts.wpn_fps_smg_sterling_s_folded.stats.value = 7
	self.parts.wpn_fps_smg_sterling_s_nostock.stats.value = 7
	self.parts.wpn_fps_smg_sterling_s_solid.stats.value = 7
	self.parts.wpn_fps_smg_tec9_b_standard.stats.value = 7
	self.parts.wpn_fps_smg_tec9_m_extended.stats.value = 7
	self.parts.wpn_fps_smg_tec9_ns_ext.stats.value = 7
	self.parts.wpn_fps_smg_tec9_s_unfolded.stats.value = 7
	self.parts.wpn_fps_smg_uzi_b_suppressed.stats.value = 7
	self.parts.wpn_fps_smg_uzi_fg_rail.stats.value = 7
	self.parts.wpn_fps_smg_uzi_s_leather.stats.value = 7
	self.parts.wpn_fps_smg_uzi_s_solid.stats.value = 7
	self.parts.wpn_fps_smg_uzi_s_standard.stats.value = 7
	self.parts.wpn_fps_snp_desertfox_b_long.stats.value = 7
	self.parts.wpn_fps_snp_desertfox_b_silencer.stats.value = 7
	self.parts.wpn_fps_snp_m95_barrel_long.stats.value = 7
	self.parts.wpn_fps_snp_m95_barrel_short.stats.value = 7
	self.parts.wpn_fps_snp_m95_barrel_suppressed.stats.value = 7
	self.parts.wpn_fps_snp_model70_iron_sight.stats.value = 7
	self.parts.wpn_fps_snp_mosin_b_short.stats.value = 7
	self.parts.wpn_fps_snp_mosin_b_sniper.stats.value = 7
	self.parts.wpn_fps_snp_mosin_b_standard.stats.value = 7
	self.parts.wpn_fps_snp_mosin_body_black.stats.value = 7
	self.parts.wpn_fps_snp_mosin_ns_bayonet.stats.value = 7
	self.parts.wpn_fps_snp_msr_b_long.stats.value = 7
	self.parts.wpn_fps_snp_msr_body_msr.stats.value = 7
	self.parts.wpn_fps_snp_msr_ns_suppressor.stats.value = 7
	self.parts.wpn_fps_upg_a_bow_explosion.stats.value = 7
	self.parts.wpn_fps_upg_a_bow_poison.stats.value = 7
	self.parts.wpn_fps_upg_a_custom.stats.value = 7
	self.parts.wpn_fps_upg_a_dragons_breath.stats.value = 7
	self.parts.wpn_fps_upg_a_explosive.stats.value = 7
	self.parts.wpn_fps_upg_a_grenade_launcher_incendiary.stats.value = 7
	self.parts.wpn_fps_upg_a_grenade_launcher_incendiary_arbiter.stats.value = 7
	self.parts.wpn_fps_upg_a_piercing.stats.value = 7
	self.parts.wpn_fps_upg_a_slug.stats.value = 7
	self.parts.wpn_fps_upg_ak_b_ak105.stats.value = 7
	self.parts.wpn_fps_upg_ak_fg_krebs.stats.value = 7
	self.parts.wpn_fps_upg_ak_fg_trax.stats.value = 7
	self.parts.wpn_fps_upg_ak_fg_zenit.stats.value = 7
	self.parts.wpn_fps_upg_ak_g_rk3.stats.value = 7
	self.parts.wpn_fps_upg_ak_m_quick.stats.value = 7
	self.parts.wpn_fps_upg_ak_m_uspalm.stats.value = 7
	self.parts.wpn_fps_upg_ak_s_solidstock.stats.value = 7
	self.parts.wpn_fps_upg_ass_ak_b_zastava.stats.value = 7
	self.parts.wpn_fps_upg_ass_m4_b_beowulf.stats.value = 7
	self.parts.wpn_fps_upg_ass_m4_fg_lvoa.stats.value = 7
	self.parts.wpn_fps_upg_ass_m4_fg_moe.stats.value = 7
	self.parts.wpn_fps_upg_ass_m4_lower_reciever_core.stats.value = 7
	self.parts.wpn_fps_upg_ass_m4_upper_reciever_ballos.stats.value = 7
	self.parts.wpn_fps_upg_ass_m4_upper_reciever_core.stats.value = 7
	self.parts.wpn_fps_upg_ass_m16_fg_stag.stats.value = 7
	self.parts.wpn_fps_upg_g36_fg_long.stats.value = 7
	self.parts.wpn_fps_upg_m4_m_l5.stats.value = 7
	self.parts.wpn_fps_upg_m4_s_ubr.stats.value = 7
	self.parts.wpn_fps_upg_ns_ass_pbs1.stats.value = 7
	self.parts.wpn_fps_upg_ns_duck.stats.value = 7
	self.parts.wpn_fps_upg_o_45iron.stats.value = 7
	self.parts.wpn_fps_upg_o_45rds.stats.value = 7
	self.parts.wpn_fps_upg_o_ak_scopemount.stats.value = 7
	self.parts.wpn_fps_upg_o_box.stats.value = 7
	self.parts.wpn_fps_upg_o_leupold.stats.value = 7
	self.parts.wpn_fps_upg_o_mbus_rear.stats.value = 7
	self.parts.wpn_fps_upg_o_spot.stats.value = 7
	self.parts.wpn_fps_upg_smg_olympic_fg_lr300.stats.value = 7
	
	self.parts.wpn_fps_ass_asval_b_proto.is_a_unlockable = false
	self.parts.wpn_fps_ass_asval_s_solid.is_a_unlockable = false
	self.parts.wpn_fps_ass_aug_m_quick.is_a_unlockable = false
	self.parts.wpn_fps_ass_fal_fg_01.is_a_unlockable = false
	self.parts.wpn_fps_ass_fal_fg_03.is_a_unlockable = false
	self.parts.wpn_fps_ass_fal_fg_04.is_a_unlockable = false
	self.parts.wpn_fps_ass_fal_fg_wood.is_a_unlockable = false
	self.parts.wpn_fps_ass_fal_g_01.is_a_unlockable = false
	self.parts.wpn_fps_ass_fal_m_01.is_a_unlockable = false
	self.parts.wpn_fps_ass_fal_s_01.is_a_unlockable = false
	self.parts.wpn_fps_ass_fal_s_03.is_a_unlockable = false
	self.parts.wpn_fps_ass_fal_s_wood.is_a_unlockable = false
	self.parts.wpn_fps_ass_famas_b_long.is_a_unlockable = false
	self.parts.wpn_fps_ass_famas_b_short.is_a_unlockable = false
	self.parts.wpn_fps_ass_famas_b_sniper.is_a_unlockable = false
	self.parts.wpn_fps_ass_famas_b_suppressed.is_a_unlockable = false
	self.parts.wpn_fps_ass_famas_body_standard.is_a_unlockable = false
	self.parts.wpn_fps_ass_famas_g_retro.is_a_unlockable = false
	self.parts.wpn_fps_ass_g3_b_short.is_a_unlockable = false
	self.parts.wpn_fps_ass_g3_b_sniper.is_a_unlockable = false
	self.parts.wpn_fps_ass_g3_fg_psg.is_a_unlockable = false
	self.parts.wpn_fps_ass_g3_fg_retro.is_a_unlockable = false
	self.parts.wpn_fps_ass_g3_fg_retro_plastic.is_a_unlockable = false
	self.parts.wpn_fps_ass_g3_g_retro.is_a_unlockable = false
	self.parts.wpn_fps_ass_g3_g_sniper.is_a_unlockable = false
	self.parts.wpn_fps_ass_g3_s_sniper.is_a_unlockable = false
	self.parts.wpn_fps_ass_g3_s_wood.is_a_unlockable = false
	self.parts.wpn_fps_ass_g36_m_quick.is_a_unlockable = false
	self.parts.wpn_fps_ass_g36_o_vintage.is_a_unlockable = false
	self.parts.wpn_fps_ass_galil_fg_fab.is_a_unlockable = false
	self.parts.wpn_fps_ass_galil_fg_mar.is_a_unlockable = false
	self.parts.wpn_fps_ass_galil_fg_sar.is_a_unlockable = false
	self.parts.wpn_fps_ass_galil_fg_sniper.is_a_unlockable = false
	self.parts.wpn_fps_ass_galil_g_sniper.is_a_unlockable = false
	self.parts.wpn_fps_ass_galil_s_fab.is_a_unlockable = false
	self.parts.wpn_fps_ass_galil_s_light.is_a_unlockable = false
	self.parts.wpn_fps_ass_galil_s_plastic.is_a_unlockable = false
	self.parts.wpn_fps_ass_galil_s_skeletal.is_a_unlockable = false
	self.parts.wpn_fps_ass_galil_s_sniper.is_a_unlockable = false
	self.parts.wpn_fps_ass_galil_s_wood.is_a_unlockable = false
	self.parts.wpn_fps_ass_sub2000_fg_gen2.is_a_unlockable = false
	self.parts.wpn_fps_ass_sub2000_fg_railed.is_a_unlockable = false
	self.parts.wpn_fps_ass_sub2000_fg_suppressed.is_a_unlockable = false
	self.parts.wpn_fps_bow_ecp_m_arrows_explosive.is_a_unlockable = false
	self.parts.wpn_fps_bow_ecp_m_arrows_poison.is_a_unlockable = false
	self.parts.wpn_fps_bow_elastic_m_explosive.is_a_unlockable = false
	self.parts.wpn_fps_bow_elastic_m_poison.is_a_unlockable = false
	self.parts.wpn_fps_gre_arbiter_b_comp.is_a_unlockable = false
	self.parts.wpn_fps_gre_arbiter_b_long.is_a_unlockable = false
	self.parts.wpn_fps_gre_m32_no_stock.is_a_unlockable = false
	self.parts.wpn_fps_gre_m79_barrel_short.is_a_unlockable = false
	self.parts.wpn_fps_gre_m79_stock_short.is_a_unlockable = false
	self.parts.wpn_fps_lmg_mg42_b_mg34.is_a_unlockable = false
	self.parts.wpn_fps_lmg_mg42_b_vg38.is_a_unlockable = false
	self.parts.wpn_fps_m4_upg_m_quick.is_a_unlockable = false
	self.parts.wpn_fps_pis_1911_m_big.is_a_unlockable = false
	self.parts.wpn_fps_pis_c96_b_long.is_a_unlockable = false
	self.parts.wpn_fps_pis_c96_m_extended.is_a_unlockable = false
	self.parts.wpn_fps_pis_c96_nozzle.is_a_unlockable = false
	self.parts.wpn_fps_pis_c96_s_solid.is_a_unlockable = false
	self.parts.wpn_fps_pis_c96_sight.is_a_unlockable = false
	self.parts.wpn_fps_pis_packrat_m_extended.is_a_unlockable = false
	self.parts.wpn_fps_pis_packrat_ns_wick.is_a_unlockable = false
	self.parts.wpn_fps_pis_packrat_o_expert.is_a_unlockable = false
	self.parts.wpn_fps_pis_usp_m_big.is_a_unlockable = false
	self.parts.wpn_fps_sho_ben_b_long.is_a_unlockable = false
	self.parts.wpn_fps_sho_ben_b_short.is_a_unlockable = false
	self.parts.wpn_fps_sho_ben_s_collapsed.is_a_unlockable = false
	self.parts.wpn_fps_sho_ben_s_solid.is_a_unlockable = false
	self.parts.wpn_fps_sho_ksg_b_long.is_a_unlockable = false
	self.parts.wpn_fps_sho_ksg_b_short.is_a_unlockable = false
	self.parts.wpn_fps_sho_saiga_b_short.is_a_unlockable = false
	self.parts.wpn_fps_sho_saiga_fg_holy.is_a_unlockable = false
	self.parts.wpn_fps_sho_striker_b_long.is_a_unlockable = false
	self.parts.wpn_fps_sho_striker_b_suppressed.is_a_unlockable = false
	self.parts.wpn_fps_smg_cobray_body_upper_jacket.is_a_unlockable = false
	self.parts.wpn_fps_smg_mac10_m_quick.is_a_unlockable = false
	self.parts.wpn_fps_smg_mp5_fg_flash.is_a_unlockable = false
	self.parts.wpn_fps_smg_mp5_s_folding.is_a_unlockable = false
	self.parts.wpn_fps_smg_p90_m_strap.is_a_unlockable = false
	self.parts.wpn_fps_smg_schakal_b_civil.is_a_unlockable = false
	self.parts.wpn_fps_smg_schakal_m_long.is_a_unlockable = false
	self.parts.wpn_fps_smg_schakal_m_short.is_a_unlockable = false
	self.parts.wpn_fps_smg_schakal_ns_silencer.is_a_unlockable = false
	self.parts.wpn_fps_smg_schakal_s_civil.is_a_unlockable = false
	self.parts.wpn_fps_smg_schakal_s_folded.is_a_unlockable = false
	self.parts.wpn_fps_smg_schakal_vg_surefire.is_a_unlockable = false
	self.parts.wpn_fps_smg_scorpion_b_suppressed.is_a_unlockable = false
	self.parts.wpn_fps_smg_scorpion_g_ergo.is_a_unlockable = false
	self.parts.wpn_fps_smg_scorpion_g_wood.is_a_unlockable = false
	self.parts.wpn_fps_smg_scorpion_m_extended.is_a_unlockable = false
	self.parts.wpn_fps_smg_scorpion_s_nostock.is_a_unlockable = false
	self.parts.wpn_fps_smg_scorpion_s_unfolded.is_a_unlockable = false
	self.parts.wpn_fps_smg_sr2_m_quick.is_a_unlockable = false
	self.parts.wpn_fps_smg_sterling_b_e11.is_a_unlockable = false
	self.parts.wpn_fps_smg_sterling_b_long.is_a_unlockable = false
	self.parts.wpn_fps_smg_sterling_b_short.is_a_unlockable = false
	self.parts.wpn_fps_smg_sterling_b_suppressed.is_a_unlockable = false
	self.parts.wpn_fps_smg_sterling_m_long.is_a_unlockable = false
	self.parts.wpn_fps_smg_sterling_m_short.is_a_unlockable = false
	self.parts.wpn_fps_smg_sterling_s_folded.is_a_unlockable = false
	self.parts.wpn_fps_smg_sterling_s_nostock.is_a_unlockable = false
	self.parts.wpn_fps_smg_sterling_s_solid.is_a_unlockable = false
	self.parts.wpn_fps_smg_tec9_b_standard.is_a_unlockable = false
	self.parts.wpn_fps_smg_tec9_m_extended.is_a_unlockable = false
	self.parts.wpn_fps_smg_tec9_ns_ext.is_a_unlockable = false
	self.parts.wpn_fps_smg_tec9_s_unfolded.is_a_unlockable = false
	self.parts.wpn_fps_smg_uzi_b_suppressed.is_a_unlockable = false
	self.parts.wpn_fps_smg_uzi_fg_rail.is_a_unlockable = false
	self.parts.wpn_fps_smg_uzi_s_leather.is_a_unlockable = false
	self.parts.wpn_fps_smg_uzi_s_solid.is_a_unlockable = false
	self.parts.wpn_fps_smg_uzi_s_standard.is_a_unlockable = false
	self.parts.wpn_fps_snp_desertfox_b_long.is_a_unlockable = false
	self.parts.wpn_fps_snp_desertfox_b_silencer.is_a_unlockable = false
	self.parts.wpn_fps_snp_m95_barrel_long.is_a_unlockable = false
	self.parts.wpn_fps_snp_m95_barrel_short.is_a_unlockable = false
	self.parts.wpn_fps_snp_m95_barrel_suppressed.is_a_unlockable = false
	self.parts.wpn_fps_snp_model70_iron_sight.is_a_unlockable = false
	self.parts.wpn_fps_snp_mosin_b_short.is_a_unlockable = false
	self.parts.wpn_fps_snp_mosin_b_sniper.is_a_unlockable = false
	self.parts.wpn_fps_snp_mosin_b_standard.is_a_unlockable = false
	self.parts.wpn_fps_snp_mosin_body_black.is_a_unlockable = false
	self.parts.wpn_fps_snp_mosin_ns_bayonet.is_a_unlockable = false
	self.parts.wpn_fps_snp_msr_b_long.is_a_unlockable = false
	self.parts.wpn_fps_snp_msr_body_msr.is_a_unlockable = false
	self.parts.wpn_fps_snp_msr_ns_suppressor.is_a_unlockable = false
	self.parts.wpn_fps_upg_a_bow_explosion.is_a_unlockable = false
	self.parts.wpn_fps_upg_a_bow_poison.is_a_unlockable = false
	self.parts.wpn_fps_upg_a_custom.is_a_unlockable = false
	self.parts.wpn_fps_upg_a_dragons_breath.is_a_unlockable = false
	self.parts.wpn_fps_upg_a_explosive.is_a_unlockable = false
	self.parts.wpn_fps_upg_a_grenade_launcher_incendiary.is_a_unlockable = false
	self.parts.wpn_fps_upg_a_grenade_launcher_incendiary_arbiter.is_a_unlockable = false
	self.parts.wpn_fps_upg_a_piercing.is_a_unlockable = false
	self.parts.wpn_fps_upg_a_slug.is_a_unlockable = false
	self.parts.wpn_fps_upg_ak_b_ak105.is_a_unlockable = false
	self.parts.wpn_fps_upg_ak_fg_krebs.is_a_unlockable = false
	self.parts.wpn_fps_upg_ak_fg_trax.is_a_unlockable = false
	self.parts.wpn_fps_upg_ak_fg_zenit.is_a_unlockable = false
	self.parts.wpn_fps_upg_ak_g_rk3.is_a_unlockable = false
	self.parts.wpn_fps_upg_ak_m_quick.is_a_unlockable = false
	self.parts.wpn_fps_upg_ak_m_uspalm.is_a_unlockable = false
	self.parts.wpn_fps_upg_ak_s_solidstock.is_a_unlockable = false
	self.parts.wpn_fps_upg_ass_ak_b_zastava.is_a_unlockable = false
	self.parts.wpn_fps_upg_ass_m4_b_beowulf.is_a_unlockable = false
	self.parts.wpn_fps_upg_ass_m4_fg_lvoa.is_a_unlockable = false
	self.parts.wpn_fps_upg_ass_m4_fg_moe.is_a_unlockable = false
	self.parts.wpn_fps_upg_ass_m4_lower_reciever_core.is_a_unlockable = false
	self.parts.wpn_fps_upg_ass_m4_upper_reciever_ballos.is_a_unlockable = false
	self.parts.wpn_fps_upg_ass_m4_upper_reciever_core.is_a_unlockable = false
	self.parts.wpn_fps_upg_ass_m16_fg_stag.is_a_unlockable = false
	self.parts.wpn_fps_upg_g36_fg_long.is_a_unlockable = false
	self.parts.wpn_fps_upg_m4_m_l5.is_a_unlockable = false
	self.parts.wpn_fps_upg_m4_s_ubr.is_a_unlockable = false
	self.parts.wpn_fps_upg_ns_ass_pbs1.is_a_unlockable = false
	self.parts.wpn_fps_upg_ns_duck.is_a_unlockable = false
	self.parts.wpn_fps_upg_o_45iron.is_a_unlockable = false
	self.parts.wpn_fps_upg_o_45rds.is_a_unlockable = false
	self.parts.wpn_fps_upg_o_ak_scopemount.is_a_unlockable = false
	self.parts.wpn_fps_upg_o_box.is_a_unlockable = false
	self.parts.wpn_fps_upg_o_leupold.is_a_unlockable = false
	self.parts.wpn_fps_upg_o_mbus_front.is_a_unlockable = false
	self.parts.wpn_fps_upg_o_mbus_rear.is_a_unlockable = false
	self.parts.wpn_fps_upg_o_spot.is_a_unlockable = false
	self.parts.wpn_fps_upg_smg_olympic_fg_lr300.is_a_unlockable = false
end