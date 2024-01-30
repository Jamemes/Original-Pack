local data = GageAssignmentTweakData.init
function GageAssignmentTweakData:init(tweak_data)
	data(self, tweak_data)

	local normal = {
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_ns_pis_large",
		"wpn_fps_upg_ns_pis_medium",
		"wpn_fps_upg_ns_pis_small",
		"wpn_fps_upg_ns_shot_thick",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_ns_shot_shark",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_pis_laser",
		"wpn_fps_upg_fl_pis_tlr1",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_upg_o_marksmansight_rear",
		"wpn_fps_upg_o_acog",
		"wpn_fps_m4_upper_reciever_edge",
		"wpn_fps_m4_uupg_b_long",
		"wpn_fps_m4_uupg_b_short",
		"wpn_fps_m4_uupg_b_medium",
		"wpn_fps_m4_uupg_b_sd",
		"wpn_fps_m4_uupg_fg_lr300",
		"wpn_fps_m4_uupg_m_std",
		"wpn_fps_m4_uupg_s_fold",
		"wpn_fps_upg_m4_g_ergo",
		"wpn_fps_upg_m4_g_sniper",
		"wpn_fps_upg_m4_m_pmag",
		"wpn_fps_upg_m4_m_straight",
		"wpn_fps_upg_m4_s_standard",
		"wpn_fps_upg_m4_s_pts",
		"wpn_fps_pis_g18c_co_1",
		"wpn_fps_pis_g18c_co_comp_2",
		"wpn_fps_pis_g18c_m_mag_33rnd",
		"wpn_fps_pis_g18c_s_stock",
		"wpn_fps_pis_g18c_g_ergo",
		"wpn_fps_m16_fg_railed",
		"wpn_fps_m16_fg_vietnam",
		"wpn_fps_smg_olympic_fg_railed",
		"wpn_fps_smg_olympic_s_short",
		"wpn_upg_ak_fg_combo2",
		"wpn_upg_ak_fg_combo3",
		"wpn_upg_ak_s_folding",
		"wpn_upg_ak_s_psl",
		"wpn_upg_ak_s_skfoldable",
		"wpn_fps_smg_akmsu_fg_rail",
		"wpn_upg_saiga_fg_lowerrail",
		"wpn_fps_ass_ak5_fg_ak5c",
		"wpn_fps_ass_ak5_fg_fnc",
		"wpn_fps_ass_ak5_s_ak5b",
		"wpn_fps_ass_ak5_s_ak5c",
		"wpn_fps_aug_b_long",
		"wpn_fps_aug_b_short",
		"wpn_fps_aug_fg_a3",
		"wpn_fps_ass_g36_fg_c",
		"wpn_fps_ass_g36_fg_ksk",
		"wpn_fps_ass_g36_s_kv",
		"wpn_fps_ass_g36_s_sl8",
		"wpn_fps_smg_p90_b_long",
		"wpn_fps_ass_m14_body_ebr",
		"wpn_fps_ass_m14_body_jae",
		"wpn_fps_smg_mp9_m_extended",
		"wpn_fps_smg_mp9_s_skel",
		"wpn_fps_pis_deagle_b_long",
		"wpn_fps_pis_deagle_co_long",
		"wpn_fps_pis_deagle_co_short",
		"wpn_fps_pis_deagle_g_bling",
		"wpn_fps_pis_deagle_g_ergo",
		"wpn_fps_pis_deagle_m_extended",
		"wpn_fps_smg_mp5_fg_m5k",
		"wpn_fps_smg_mp5_fg_mp5a5",
		"wpn_fps_smg_mp5_fg_mp5sd",
		"wpn_fps_smg_mp5_s_adjust",
		"wpn_fps_smg_mp5_s_ring",
		"wpn_fps_pis_1911_b_long",
		"wpn_fps_pis_1911_b_vented",
		"wpn_fps_pis_1911_co_1",
		"wpn_fps_pis_1911_co_2",
		"wpn_fps_pis_1911_g_bling",
		"wpn_fps_pis_1911_g_ergo",
		"wpn_fps_pis_1911_m_extended",
		"wpn_fps_smg_mac10_body_ris",
		"wpn_fps_smg_mac10_m_extended",
		"wpn_fps_smg_mac10_s_skel",
		"wpn_fps_shot_r870_body_rack",
		"wpn_fps_shot_r870_fg_wood",
		"wpn_fps_shot_r870_m_extended",
		"wpn_fps_shot_r870_s_folding",
		"wpn_fps_shot_r870_s_solid",
		"wpn_fps_shot_r870_s_nostock_big",
		"wpn_fps_shot_r870_s_nostock",
		"wpn_fps_shot_r870_s_solid_big",
		"wpn_fps_shot_shorty_m_extended_short",
		"wpn_fps_shot_shorty_s_nostock_short",
		"wpn_fps_shot_shorty_s_solid_short",
		"wpn_fps_pis_beretta_co_co1",
		"wpn_fps_pis_beretta_co_co2",
		"wpn_fps_pis_beretta_g_ergo",
		"wpn_fps_pis_beretta_m_extended",
		"wpn_fps_pis_beretta_sl_brigadier",
		"wpn_fps_shot_huntsman_b_short",
		"wpn_fps_shot_huntsman_s_short",
		"wpn_fps_pis_rage_b_comp1",
		"wpn_fps_pis_rage_b_comp2",
		"wpn_fps_pis_rage_b_long",
		"wpn_fps_pis_rage_b_short",
		"wpn_fps_pis_rage_body_smooth",
		"wpn_fps_pis_rage_g_ergo",
		"wpn_fps_smg_thompson_barrel_long",
		"wpn_fps_smg_thompson_barrel_short",
		"wpn_fps_smg_thompson_foregrip_discrete",
		"wpn_fps_smg_thompson_grip_discrete",
		"wpn_fps_smg_thompson_stock_discrete",
		"wpn_fps_smg_thompson_stock_nostock",
		"wpn_fps_upg_a_bow_poison",
		"wpn_fps_bow_arblast_m_poison",
		"wpn_fps_bow_arblast_m_explosive",
		"wpn_fps_bow_frankish_m_poison",
		"wpn_fps_bow_frankish_m_explosive",
		"wpn_fps_bow_long_m_explosive",
		"wpn_fps_bow_long_m_poison",
		"wpn_fps_lmg_par_b_short",
		"wpn_fps_lmg_par_s_plastic",
		"wpn_fps_snp_model70_ns_suppressor",
		"wpn_fps_snp_model70_iron_sight",
		"wpn_fps_upg_bp_lmg_lionbipod",
		"wpn_fps_smg_sr2_s_unfolded",
		"wpn_fps_smg_sr2_ns_silencer",
		"wpn_fps_pis_pl14_b_comp",
		"wpn_fps_pis_pl14_m_extended",
		"wpn_fps_upg_o_xpsg33_magnifier",
		"wpn_fps_upg_o_45rds_v2",
		"wpn_fps_pis_chinchilla_b_satan",
		"wpn_fps_pis_chinchilla_g_black",
		"wpn_fps_pis_chinchilla_g_death",
		"wpn_fps_pis_breech_b_reinforced",
		"wpn_fps_pis_breech_b_short",
		"wpn_fps_pis_breech_g_custom",
		"wpn_fps_ass_ching_b_short",
		"wpn_fps_ass_ching_fg_railed",
		"wpn_fps_ass_ching_s_pouch",
		"wpn_fps_smg_erma_s_folded",
		"wpn_fps_pis_shrew_g_bling",
		"wpn_fps_pis_shrew_g_ergo",
		"wpn_fps_pis_shrew_m_extended",
		"wpn_fps_pis_shrew_sl_milled",
		"wpn_fps_sho_basset_fg_short",
		"wpn_fps_sho_basset_m_extended",
		"wpn_fps_smg_p90_body_boxy",
		"wpn_fps_smg_mac10_body_modern",
		"wpn_fps_pis_deagle_b_modern",
		"wpn_fps_pis_beretta_body_modern",
		"wpn_fps_pis_judge_body_modern",
		"wpn_fps_ass_corgi_body_lower_strap",
		"wpn_fps_ass_corgi_b_short",
		"wpn_fps_lmg_shuno_b_short",
		"wpn_fps_lmg_shuno_b_heat_short",
		"wpn_fps_lmg_shuno_b_heat_long",
		"wpn_fps_fla_system_b_wtf",
		"wpn_fps_fla_system_m_high",
		"wpn_fps_fla_system_m_low",
		"wpn_fps_bow_elastic_body_tactic",
		"wpn_fps_bow_elastic_g_2",
		"wpn_fps_bow_elastic_g_3",
		"wpn_fps_bow_elastic_m_explosive",
		"wpn_fps_bow_elastic_m_poison",
		"wpn_fps_pis_legacy_b_threaded",
		"wpn_fps_pis_legacy_g_wood",
		"wpn_fps_sho_coach_b_short",
		"wpn_fps_sho_coach_s_short"
	}
	local pd2_clan = {
		"wpn_fps_pis_usp_b_expert",
		"wpn_fps_pis_usp_b_match",
		"wpn_fps_pis_usp_m_extended",
		"wpn_fps_pis_usp_co_comp_1",
		"wpn_fps_pis_usp_co_comp_2",
		"wpn_fps_pis_g22c_b_long",
		"wpn_fps_pis_g26_b_custom",
		"wpn_fps_pis_g26_body_custom",
		"wpn_fps_pis_g26_g_gripforce",
		"wpn_fps_pis_g26_g_laser",
		"wpn_fps_pis_g26_m_contour",
		"wpn_fps_upg_fl_pis_crimson",
		"wpn_fps_upg_fl_pis_x400v",
		"wpn_fps_upg_ns_pis_large_kac",
		"wpn_fps_upg_ns_pis_medium_gem",
		"wpn_fps_upg_ns_pis_meatgrinder",
		"wpn_fps_upg_ns_pis_ipsccomp",
		"wpn_fps_sho_b_spas12_long",
		"wpn_fps_sho_s_spas12_folded",
		"wpn_fps_sho_s_spas12_nostock",
		"wpn_fps_sho_s_spas12_solid",
		"wpn_fps_shot_b682_b_short",
		"wpn_fps_shot_b682_s_short",
		"wpn_fps_shot_b682_s_ammopouch",
		"wpn_fps_pis_lemming_b_nitride",
		"wpn_fps_pis_lemming_m_ext",
		"wpn_fps_smg_shepheard_body_short",
		"wpn_fps_smg_shepheard_mag_extended",
		"wpn_fps_smg_shepheard_s_no"
	}
	local atw = {
		"wpn_fps_pis_holt_g_bling",
		"wpn_fps_pis_holt_g_ergo",
		"wpn_fps_pis_holt_m_extended",
		"wpn_fps_ass_m14_body_ruger",
		"wpn_fps_lmg_m60_b_short",
		"wpn_fps_lmg_m60_fg_tactical",
		"wpn_fps_lmg_m60_fg_tropical",
		"wpn_fps_lmg_m60_fg_keymod",
		"wpn_fps_snp_r700_b_short",
		"wpn_fps_snp_r700_b_medium",
		"wpn_fps_snp_r700_s_tactical",
		"wpn_fps_snp_r700_s_military"
	}
	local afp = {
		"wpn_fps_pis_beer_b_robo",
		"wpn_fps_pis_beer_g_robo",
		"wpn_fps_pis_beer_g_lux",
		"wpn_fps_pis_beer_m_extended",
		"wpn_fps_pis_beer_s_std",
		"wpn_fps_pis_czech_b_long",
		"wpn_fps_pis_czech_g_sport",
		"wpn_fps_pis_czech_g_luxury",
		"wpn_fps_pis_czech_m_extended",
		"wpn_fps_pis_czech_s_standard",
		"wpn_fps_pis_stech_b_long",
		"wpn_fps_pis_stech_g_luxury",
		"wpn_fps_pis_stech_g_tactical",
		"wpn_fps_pis_stech_m_extended",
		"wpn_fps_pis_stech_s_standard"
	}
	local mwm = {
		"wpn_fps_upg_ns_ass_smg_v6",
		"wpn_fps_upg_g_m4_surgeon",
		"wpn_fps_upg_o_sig",
		"wpn_fps_upg_o_bmg",
		"wpn_fps_upg_o_rms",
		"wpn_fps_upg_o_rikt",
		"wpn_fps_upg_o_uh",
		"wpn_fps_upg_o_fc1",
		"wpn_fps_upg_o_45steel",
		"wpn_fps_upg_ns_pis_typhoon"
	}
	local ecp = {
		"wpn_fps_bow_ecp_s_bare",
		"wpn_fps_bow_ecp_m_arrows_explosive",
		"wpn_fps_bow_ecp_m_arrows_poison"
	}
	local grv = {
		"wpn_fps_snp_siltstone_b_silenced",
		"wpn_fps_snp_siltstone_ns_variation_b",
		"wpn_fps_snp_siltstone_fg_polymer",
		"wpn_fps_snp_siltstone_iron_sight",
		"wpn_fps_snp_siltstone_s_polymer"
	}
	local spa = {
		"wpn_fps_snp_tti_s_vltor",
		"wpn_fps_snp_tti_ns_hex",
		"wpn_fps_snp_tti_g_grippy"
	}
	local tango = {
		"wpn_fps_upg_a_grenade_launcher_incendiary_arbiter",
		"wpn_fps_sho_saiga_b_short",
		"wpn_fps_sho_saiga_fg_holy",
		"wpn_fps_upg_o_45rds",
		"wpn_fps_upg_o_spot",
		"wpn_fps_upg_o_box",
		"wpn_fps_ass_g36_o_vintage",
		"wpn_fps_upg_g36_fg_long",
		"wpn_fps_smg_mp5_fg_flash",
		"wpn_fps_smg_mp5_s_folding",
		"wpn_fps_upg_ns_duck",
		"wpn_fps_pis_usp_m_big",
		"wpn_fps_pis_1911_m_big",
		"wpn_fps_smg_p90_m_strap",
		"wpn_fps_ass_aug_m_quick",
		"wpn_fps_m4_upg_m_quick",
		"wpn_fps_upg_ak_m_quick",
		"wpn_fps_ass_g36_m_quick",
		"wpn_fps_smg_mac10_m_quick",
		"wpn_fps_smg_sr2_m_quick",
		"wpn_fps_gre_arbiter_b_long",
		"wpn_fps_gre_arbiter_b_comp"
	}
	local rota = {
		"wpn_fps_sho_rota_b_short",
		"wpn_fps_sho_rota_b_silencer"
	}
	local pim = {
		"wpn_fps_pis_packrat_m_extended",
		"wpn_fps_pis_packrat_ns_wick",
		"wpn_fps_pis_packrat_o_expert",
		"wpn_fps_smg_schakal_b_civil",
		"wpn_fps_smg_schakal_m_long",
		"wpn_fps_smg_schakal_m_short",
		"wpn_fps_smg_schakal_ns_silencer",
		"wpn_fps_smg_schakal_s_civil",
		"wpn_fps_smg_schakal_s_folded",
		"wpn_fps_smg_schakal_vg_surefire",
		"wpn_fps_snp_desertfox_b_long",
		"wpn_fps_snp_desertfox_b_silencer"
	}
	local wild = {
		"wpn_fps_sho_boot_b_short",
		"wpn_fps_sho_boot_b_long",
		"wpn_fps_sho_boot_s_long",
		"wpn_fps_sho_boot_body_exotic"
	}
	local born = {
		"wpn_fps_smg_hajk_b_short",
		"wpn_fps_smg_hajk_b_medium"
	}
	local opera = {
		"wpn_fps_ass_tecci_b_long",
		"wpn_fps_ass_tecci_ns_special"
	}
	local pal = {
		"wpn_fps_gre_china_s_short"
	}
	local peta = {
		"wpn_fps_shot_m37_b_short",
		"wpn_fps_shot_m37_s_short"
	}
	local berry = {
		"wpn_fps_pis_sparrow_b_comp",
		"wpn_fps_pis_sparrow_b_threaded",
		"wpn_fps_pis_sparrow_body_941",
		"wpn_fps_pis_sparrow_g_cowboy"
	}
	local dragon = {
		"wpn_fps_smg_baka_b_comp",
		"wpn_fps_smg_baka_b_midsupp",
		"wpn_fps_smg_baka_b_smallsupp",
		"wpn_fps_smg_baka_b_longsupp",
		"wpn_fps_smg_baka_s_standard",
		"wpn_fps_smg_baka_s_unfolded"
	}
	local turtles = {
		"wpn_fps_snp_wa2000_b_long",
		"wpn_fps_snp_wa2000_b_suppressed",
		"wpn_fps_snp_wa2000_g_light",
		"wpn_fps_snp_wa2000_g_stealth",
		"wpn_fps_snp_wa2000_g_walnut",
		"wpn_fps_smg_polymer_barrel_precision",
		"wpn_fps_smg_polymer_ns_silencer",
		"wpn_fps_bow_hunter_b_carbon",
		"wpn_fps_bow_hunter_b_skeletal",
		"wpn_fps_bow_hunter_g_camo",
		"wpn_fps_bow_hunter_g_walnut",
		"wpn_fps_upg_a_crossbow_poison",
		"wpn_fps_upg_a_crossbow_explosion"
	}
	local kenaz = {
		"wpn_fps_ass_sub2000_fg_gen2",
		"wpn_fps_ass_sub2000_fg_railed",
		"wpn_fps_ass_sub2000_fg_suppressed"
	}
	local character_pack_sokol = {
		"wpn_fps_ass_asval_b_proto",
		"wpn_fps_ass_asval_s_solid"
	}
	local arena = {
		"wpn_fps_pis_2006m_b_long",
		"wpn_fps_pis_2006m_b_medium",
		"wpn_fps_pis_2006m_b_short",
		"wpn_fps_pis_2006m_g_bling"
	}
	local west = {
		"wpn_fps_pis_peacemaker_b_long",
		"wpn_fps_pis_peacemaker_b_short",
		"wpn_fps_pis_peacemaker_g_bling",
		"wpn_fps_pis_peacemaker_s_skeletal",
		"wpn_fps_snp_winchester_b_long",
		"wpn_fps_snp_winchester_b_suppressed",
		"wpn_fps_upg_winchester_o_classic",
		"wpn_fps_upg_a_bow_explosion"
	}
	local bbq = {
		"wpn_fps_upg_a_grenade_launcher_incendiary",
		"wpn_fps_fla_mk2_mag_rare",
		"wpn_fps_fla_mk2_mag_welldone",
		"wpn_fps_gre_m32_barrel_short",
		"wpn_fps_gre_m32_no_stock",
		"wpn_fps_sho_aa12_barrel_long",
		"wpn_fps_sho_aa12_barrel_silenced",
		"wpn_fps_sho_aa12_mag_drum"
	}
	local butch_pack_free = {
		"wpn_fps_saw_body_silent",
		"wpn_fps_saw_body_speed",
		"wpn_fps_saw_m_blade_durable",
		"wpn_fps_saw_m_blade_sharp",
		"wpn_fps_aug_body_f90",
		"wpn_fps_ass_ak5_b_short",
		"wpn_fps_smg_mp5_m_straight",
		"wpn_fps_smg_mp9_b_suppressed",
		"wpn_fps_smg_p90_b_civilian",
		"wpn_fps_smg_p90_b_ninja",
		"wpn_fps_upg_o_m14_scopemount",
		"wpn_fps_pis_1911_g_engraved",
		"wpn_fps_pis_beretta_g_engraved",
		"wpn_fps_upg_fl_ass_utg",
		"wpn_fps_upg_fl_pis_m3x",
		"wpn_fps_upg_ass_ns_battle",
		"wpn_fps_upg_ns_ass_filter",
		"wpn_fps_upg_ns_pis_jungle",
		"wpn_fps_upg_ns_sho_salvo_large"
	}
	local hlm2_deluxe = {
		"wpn_fps_smg_cobray_body_upper_jacket",
		"wpn_fps_smg_cobray_ns_barrelextension",
		"wpn_fps_smg_cobray_ns_silencer"
	}
	local overkill_pack = {
		"wpn_fps_lmg_m134_body_upper_light",
		"wpn_fps_lmg_m134_barrel_short"
	}
	local akm4_pack = {
		"wpn_fps_upg_ass_ak_b_zastava",
		"wpn_fps_upg_ak_b_ak105",
		"wpn_fps_upg_ak_fg_krebs",
		"wpn_fps_upg_ak_fg_trax",
		"wpn_fps_upg_ak_fg_zenit",
		"wpn_fps_upg_ak_g_rk3",
		"wpn_fps_upg_ak_m_uspalm",
		"wpn_fps_upg_ak_s_solidstock",
		"wpn_fps_upg_ns_ass_pbs1",
		"wpn_fps_upg_o_ak_scopemount",
		"wpn_fps_upg_ass_m4_fg_lvoa",
		"wpn_fps_upg_ass_m4_fg_moe",
		"wpn_fps_upg_ass_m16_fg_stag",
		"wpn_fps_upg_smg_olympic_fg_lr300",
		"wpn_fps_upg_ass_m4_upper_reciever_ballos",
		"wpn_fps_upg_ass_m4_upper_reciever_core",
		"wpn_fps_upg_ass_m4_lower_reciever_core",
		"wpn_fps_upg_m4_m_l5",
		"wpn_fps_upg_m4_s_ubr",
		"wpn_fps_upg_ass_m4_b_beowulf"
	}
	local the_bomb = {
		"wpn_fps_pis_hs2000_sl_custom",
		"wpn_fps_pis_hs2000_sl_long",
		"wpn_fps_pis_hs2000_m_extended"
	}
	local character_pack_dragan = {
		"wpn_fps_ass_vhs_b_short",
		"wpn_fps_ass_vhs_b_silenced",
		"wpn_fps_ass_vhs_b_sniper"
	}
	local character_pack_clover = {
		"wpn_fps_ass_l85a2_m_emag",
		"wpn_fps_ass_l85a2_fg_short",
		"wpn_fps_ass_l85a2_b_long",
		"wpn_fps_ass_l85a2_b_short",
		"wpn_fps_ass_l85a2_g_worn"
	}
	local gage_pack_historical = {
		"wpn_fps_lmg_mg42_b_mg34",
		"wpn_fps_lmg_mg42_b_vg38",
		"wpn_fps_pis_c96_b_long",
		"wpn_fps_pis_c96_nozzle",
		"wpn_fps_pis_c96_sight",
		"wpn_fps_pis_c96_m_extended",
		"wpn_fps_pis_c96_s_solid",
		"wpn_fps_smg_sterling_b_long",
		"wpn_fps_smg_sterling_b_short",
		"wpn_fps_smg_sterling_b_suppressed",
		"wpn_fps_smg_sterling_b_e11",
		"wpn_fps_smg_sterling_m_long",
		"wpn_fps_smg_sterling_m_short",
		"wpn_fps_smg_sterling_s_folded",
		"wpn_fps_smg_sterling_s_nostock",
		"wpn_fps_smg_sterling_s_solid",
		"wpn_fps_snp_mosin_b_standard",
		"wpn_fps_snp_mosin_b_short",
		"wpn_fps_snp_mosin_b_sniper",
		"wpn_fps_snp_mosin_body_black",
		"wpn_fps_snp_mosin_ns_bayonet",
		"wpn_fps_snp_mosin_iron_sight"
	}
	local hl_miami = {
		"wpn_fps_smg_scorpion_b_suppressed",
		"wpn_fps_smg_scorpion_g_wood",
		"wpn_fps_smg_scorpion_g_ergo",
		"wpn_fps_smg_scorpion_m_extended",
		"wpn_fps_smg_scorpion_s_nostock",
		"wpn_fps_smg_scorpion_s_unfolded",
		"wpn_fps_smg_tec9_b_standard",
		"wpn_fps_smg_tec9_ns_ext",
		"wpn_fps_smg_tec9_m_extended",
		"wpn_fps_smg_tec9_s_unfolded",
		"wpn_fps_smg_uzi_b_suppressed",
		"wpn_fps_smg_uzi_fg_rail",
		"wpn_fps_smg_uzi_s_leather",
		"wpn_fps_smg_uzi_s_solid",
		"wpn_fps_smg_uzi_s_standard"
	}
	local gage_pack_shotgun = {
		"wpn_fps_upg_a_dragons_breath",
		"wpn_fps_upg_a_piercing",
		"wpn_fps_upg_a_explosive",
		"wpn_fps_upg_a_custom_free",
		"wpn_fps_upg_a_custom",
		"wpn_fps_upg_a_slug",
		"wpn_fps_sho_ben_b_long",
		"wpn_fps_sho_ben_b_short",
		"wpn_fps_sho_ben_s_collapsed",
		"wpn_fps_sho_ben_s_solid",
		"wpn_fps_sho_striker_b_long",
		"wpn_fps_sho_striker_b_suppressed",
		"wpn_fps_sho_ksg_b_long",
		"wpn_fps_sho_ksg_b_short",
		"wpn_fps_upg_o_mbus_rear"
	}
	local gage_pack_assault = {
		"wpn_fps_gre_m79_barrel_short",
		"wpn_fps_gre_m79_stock_short",
		"wpn_fps_ass_g3_b_sniper",
		"wpn_fps_ass_g3_b_short",
		"wpn_fps_ass_g3_fg_psg",
		"wpn_fps_ass_g3_fg_railed",
		"wpn_fps_ass_g3_fg_retro",
		"wpn_fps_ass_g3_fg_retro_plastic",
		"wpn_fps_ass_g3_g_retro",
		"wpn_fps_ass_g3_g_sniper",
		"wpn_fps_ass_g3_s_sniper",
		"wpn_fps_ass_g3_s_wood",
		"wpn_fps_ass_galil_fg_fab",
		"wpn_fps_ass_galil_fg_mar",
		"wpn_fps_ass_galil_fg_sar",
		"wpn_fps_ass_galil_fg_sniper",
		"wpn_fps_ass_galil_g_sniper",
		"wpn_fps_ass_galil_s_fab",
		"wpn_fps_ass_galil_s_light",
		"wpn_fps_ass_galil_s_plastic",
		"wpn_fps_ass_galil_s_skeletal",
		"wpn_fps_ass_galil_s_sniper",
		"wpn_fps_ass_galil_s_wood",
		"wpn_fps_ass_famas_b_long",
		"wpn_fps_ass_famas_b_short",
		"wpn_fps_ass_famas_b_sniper",
		"wpn_fps_ass_famas_b_suppressed",
		"wpn_fps_ass_famas_g_retro"
	}
	local big_bank = {
		"wpn_fps_ass_fal_fg_01",
		"wpn_fps_ass_fal_fg_03",
		"wpn_fps_ass_fal_fg_04",
		"wpn_fps_ass_fal_fg_wood",
		"wpn_fps_ass_fal_g_01",
		"wpn_fps_ass_fal_m_01",
		"wpn_fps_ass_fal_s_01",
		"wpn_fps_ass_fal_s_03",
		"wpn_fps_ass_fal_s_wood"
	}
	local gage_pack_lmg = {
		"wpn_fps_lmg_hk21_b_long",
		"wpn_fps_lmg_hk21_fg_short",
		"wpn_fps_lmg_hk21_g_ergo",
		"wpn_fps_lmg_m249_b_long",
		"wpn_fps_lmg_m249_fg_mk46",
		"wpn_fps_lmg_m249_s_solid",
		"wpn_fps_lmg_rpk_fg_standard",
		"wpn_fps_lmg_rpk_s_standard"
	}
	local armored_transport = {
		"wpn_fps_smg_m45_m_extended",
		"wpn_fps_smg_m45_b_green",
		"wpn_fps_smg_m45_b_small",
		"wpn_fps_smg_m45_body_green",
		"wpn_fps_smg_m45_s_folded",
		"wpn_fps_smg_m45_g_ergo",
		"wpn_fps_smg_m45_g_bling",
		"wpn_fps_ass_s552_b_long",
		"wpn_fps_ass_s552_body_standard_black",
		"wpn_fps_ass_s552_fg_standard_green",
		"wpn_fps_ass_s552_fg_railed",
		"wpn_fps_ass_s552_g_standard_green",
		"wpn_fps_ass_s552_s_standard_green",
		"wpn_fps_pis_ppk_b_long",
		"wpn_fps_pis_ppk_g_laser",
		"wpn_fps_upg_o_cmore"
	}
	local gage_pack_snp = {
		"wpn_fps_snp_r93_body_wood",
		"wpn_fps_snp_r93_b_suppressed",
		"wpn_fps_snp_r93_b_short",
		"wpn_fps_snp_msr_body_msr",
		"wpn_fps_snp_msr_ns_suppressor",
		"wpn_fps_snp_msr_b_long",
		"wpn_fps_snp_m95_barrel_suppressed",
		"wpn_fps_snp_m95_barrel_short",
		"wpn_fps_snp_m95_barrel_long",
		"wpn_fps_upg_o_45iron",
		"wpn_fps_upg_o_leupold"
	}
	local gage_pack = {
		"wpn_fps_pis_p226_co_comp_2",
		"wpn_fps_pis_p226_co_comp_1",
		"wpn_fps_pis_p226_m_extended",
		"wpn_fps_pis_p226_g_ergo",
		"wpn_fps_pis_p226_b_long",
		"wpn_fps_pis_p226_b_equinox",
		"wpn_fps_ass_scar_s_sniper",
		"wpn_fps_ass_scar_fg_railext",
		"wpn_fps_ass_scar_b_short",
		"wpn_fps_ass_scar_b_long",
		"wpn_fps_smg_mp7_s_long",
		"wpn_fps_smg_mp7_b_suppressed",
		"wpn_fps_smg_mp7_m_extended",
		"wpn_fps_upg_i_singlefire",
		"wpn_fps_upg_i_autofire",
		"wpn_fps_upg_m4_g_hgrip",
		"wpn_fps_upg_m4_g_mgrip"
	}
	local gage_pack_jobs = {
		"wpn_fps_pis_rage_extra",
		"wpn_fps_pis_deagle_extra",
		"wpn_fps_upg_fg_jp",
		"wpn_fps_upg_fg_smr",
		"wpn_fps_upg_m4_m_quad",
		"wpn_fps_upg_ak_fg_tapco",
		"wpn_fps_upg_fg_midwest",
		"wpn_fps_upg_ak_b_draco",
		"wpn_fps_upg_ak_m_quad",
		"wpn_fps_upg_ak_g_hgrip",
		"wpn_fps_upg_ak_g_pgrip",
		"wpn_fps_upg_ak_g_wgrip",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_pis_ns_flash",
		"wpn_fps_upg_shot_ns_king",
		"wpn_fps_upg_ns_pis_medium_slim",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser",
		"wpn_fps_upg_m4_s_crane",
		"wpn_fps_upg_m4_s_mk46",
		"wpn_fps_upg_o_rmr",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs"
	}
	
	math.randomseed(os.date("%d") * 1000)
	local rand_afp = afp[math.random(#afp)]
	local rand_akm4_pack = akm4_pack[math.random(#akm4_pack)]
	local rand_arena = arena[math.random(#arena)]
	local rand_armored_transport = armored_transport[math.random(#armored_transport)]
	local rand_atw = atw[math.random(#atw)]
	local rand_bbq = bbq[math.random(#bbq)]
	local rand_berry = berry[math.random(#berry)]
	local rand_big_bank = big_bank[math.random(#big_bank)]
	local rand_born = born[math.random(#born)]
	local rand_butch_pack_free = butch_pack_free[math.random(#butch_pack_free)]
	local rand_character_pack_clover = character_pack_clover[math.random(#character_pack_clover)]
	local rand_character_pack_dragan = character_pack_dragan[math.random(#character_pack_dragan)]
	local rand_character_pack_sokol = character_pack_sokol[math.random(#character_pack_sokol)]
	local rand_dragon = dragon[math.random(#dragon)]
	local rand_ecp = ecp[math.random(#ecp)]
	local rand_gage_pack = gage_pack[math.random(#gage_pack)]
	local rand_gage_pack_assault = gage_pack_assault[math.random(#gage_pack_assault)]
	local rand_gage_pack_historical = gage_pack_historical[math.random(#gage_pack_historical)]
	local rand_gage_pack_jobs = gage_pack_jobs[math.random(#gage_pack_jobs)]
	local rand_gage_pack_lmg = gage_pack_lmg[math.random(#gage_pack_lmg)]
	local rand_gage_pack_shotgun = gage_pack_shotgun[math.random(#gage_pack_shotgun)]
	local rand_gage_pack_snp = gage_pack_snp[math.random(#gage_pack_snp)]
	local rand_grv = grv[math.random(#grv)]
	local rand_hl_miami = hl_miami[math.random(#hl_miami)]
	local rand_hlm2_deluxe = hlm2_deluxe[math.random(#hlm2_deluxe)]
	local rand_kenaz = kenaz[math.random(#kenaz)]
	local rand_mwm = mwm[math.random(#mwm)]
	local rand_normal = normal[math.random(#normal)]
	local rand_opera = opera[math.random(#opera)]
	local rand_overkill_pack = overkill_pack[math.random(#overkill_pack)]
	local rand_pal = pal[math.random(#pal)]
	local rand_pd2_clan = pd2_clan[math.random(#pd2_clan)]
	local rand_peta = peta[math.random(#peta)]
	local rand_pim = pim[math.random(#pim)]
	local rand_rota = rota[math.random(#rota)]
	local rand_spa = spa[math.random(#spa)]
	local rand_tango = tango[math.random(#tango)]
	local rand_the_bomb = the_bomb[math.random(#the_bomb)]
	local rand_turtles = turtles[math.random(#turtles)]
	local rand_west = west[math.random(#west)]
	local rand_wild = wild[math.random(#wild)]
	
	local weapon_mods = {
		{"afp",						"weapon_mods", 		rand_afp					},
		{"akm4_pack",				"weapon_mods", 		rand_akm4_pack				},
		{"arena",					"weapon_mods", 		rand_arena					},
		{"armored_transport",		"weapon_mods", 		rand_armored_transport		},
		{"atw",						"weapon_mods", 		rand_atw					},
		{"bbq",						"weapon_mods", 		rand_bbq					},
		{"berry",					"weapon_mods", 		rand_berry					},
		{"big_bank",				"weapon_mods", 		rand_big_bank				},
		{"born",					"weapon_mods", 		rand_born					},
		{"butch_pack_free",			"weapon_mods", 		rand_butch_pack_free		},
		{"character_pack_clover",	"weapon_mods", 		rand_character_pack_clover	},
		{"character_pack_dragan",	"weapon_mods", 		rand_character_pack_dragan	},
		{"character_pack_sokol",	"weapon_mods", 		rand_character_pack_sokol	},
		{"dragon",					"weapon_mods", 		rand_dragon					},
		{"ecp",						"weapon_mods", 		rand_ecp					},
		{"gage_pack",				"weapon_mods", 		rand_gage_pack				},
		{"gage_pack_assault",		"weapon_mods", 		rand_gage_pack_assault		},
		{"gage_pack_historical",	"weapon_mods", 		rand_gage_pack_historical	},
		{"gage_pack_jobs",			"weapon_mods", 		rand_gage_pack_jobs			},
		{"gage_pack_lmg",			"weapon_mods", 		rand_gage_pack_lmg			},
		{"gage_pack_shotgun",		"weapon_mods", 		rand_gage_pack_shotgun		},
		{"gage_pack_snp",			"weapon_mods", 		rand_gage_pack_snp			},
		{"grv",						"weapon_mods", 		rand_grv					},
		{"hl_miami",				"weapon_mods", 		rand_hl_miami				},
		{"hlm2_deluxe",				"weapon_mods", 		rand_hlm2_deluxe			},
		{"kenaz",					"weapon_mods", 		rand_kenaz					},
		{"mwm",						"weapon_mods", 		rand_mwm					},
		{"normal",					"weapon_mods", 		rand_normal					},
		{"opera",					"weapon_mods", 		rand_opera					},
		{"overkill_pack", 			"weapon_mods", 		rand_overkill_pack			},
		{"pal",						"weapon_mods", 		rand_pal					},
		{"pd2_clan",				"weapon_mods", 		rand_pd2_clan				},
		{"peta",					"weapon_mods", 		rand_peta					},
		{"pim",						"weapon_mods", 		rand_pim					},
		{"rota",					"weapon_mods", 		rand_rota					},
		{"spa",						"weapon_mods", 		rand_spa					},
		{"tango",					"weapon_mods", 		rand_tango					},
		{"the_bomb",				"weapon_mods", 		rand_the_bomb				},
		{"turtles",					"weapon_mods", 		rand_turtles				},
		{"west",					"weapon_mods", 		rand_west					},
		{"wild",					"weapon_mods", 		rand_wild					}
	}
	
	self.assignments.green_mantis.rewards = {weapon_mods[math.random(#weapon_mods)]}
	
	self.assignments.yellow_bull.rewards = {
		weapon_mods[math.random(#weapon_mods)],
		weapon_mods[math.random(#weapon_mods)]
	}
	
	self.assignments.red_spider.rewards = {
		weapon_mods[math.random(#weapon_mods)],
		weapon_mods[math.random(#weapon_mods)],
		weapon_mods[math.random(#weapon_mods)]
	}
	
	self.assignments.blue_eagle.rewards = {
		weapon_mods[math.random(#weapon_mods)],
		weapon_mods[math.random(#weapon_mods)],
		weapon_mods[math.random(#weapon_mods)],
		weapon_mods[math.random(#weapon_mods)]
	}
	
	self.assignments.purple_snake.rewards = {
		{"gage_pack_jobs", "weapon_mods", gage_pack_jobs[math.random(#gage_pack_jobs)]},
		{"gage_pack_jobs", "weapon_mods", gage_pack_jobs[math.random(#gage_pack_jobs)]},
		{"gage_pack_jobs", "weapon_mods", gage_pack_jobs[math.random(#gage_pack_jobs)]},
		{"gage_pack_jobs", "weapon_mods", gage_pack_jobs[math.random(#gage_pack_jobs)]},
		{"gage_pack_jobs", "weapon_mods", gage_pack_jobs[math.random(#gage_pack_jobs)]}
	}
end