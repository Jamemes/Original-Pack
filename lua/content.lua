if string.lower(RequiredScript) == "lib/tweak_data/dlctweakdata" then
	local data = DLCTweakData.init
	function DLCTweakData:init(tweak_data)
		data(self, tweak_data)

			self.ach_cee_3.content.loot_drops = {
				{
					type_items = "masks",
					item_entry = "gitgud_e_wish",
					amount = 1
				},
				{
					type_items = "masks",
					item_entry = "gitgud_sm_wish",
					amount = 1
				},
				{
					type_items = "masks",
					item_entry = "ggac_od_t2",
					amount = 1
				},
				{
					type_items = "masks",
					item_entry = "mrm",
					amount = 1
				}
			}

			self.ami_2.content.loot_drops = {}
			self.ami_4.content.loot_drops = {}
			self.ami_6.content.loot_drops = {}
			self.ami_8.content.loot_drops = {}
			self.ami_10.content.loot_drops = {}
			self.ami_12.content.loot_drops = {}
			self.ami_13.content.loot_drops = {}
	
			self.starvr_free.content.loot_drops = {}
			self.pd2_clan.content.loot_drops = {}
			self.pd2_clan2.content.loot_drops = {}
			self.pd2_clan3.content.loot_drops = {}
			self.pd2_clan4.content.loot_drops = {}
			self.pd2_clan6.content.loot_drops = {}
			self.pd2_clan_crimefest_oct19.content.loot_drops = {}
			self.pd2_clan_johnwick.content.loot_drops = {}
			self.pd2_clan_crimefest_oct23.content.loot_drops = {}
			self.pd2_clan_lgl.content.loot_drops = {}
			self.crimefest2_u2.content.loot_drops = {}
			self.crimefest2_par.content.loot_drops = {}
			self.crimefest2_rave.content.loot_drops = {}
			self.crimefest2_u8.content.loot_drops = {}
			self.crimefest2_u9.content.loot_drops = {}
			self.pd2_clan_bonnie.content.loot_drops = {}
			self.poetry_soundtrack.content.loot_drops = {}
			self.gage_pack_shotgun.content.loot_drops = {}
			self.charliesierra.content.loot_drops = {}
			self.twitch_pack.content.loot_drops = {}
			self.twitch_pack2.content.loot_drops = {}
			self.humble_pack2.content.loot_drops = {}
			self.humble_pack3.content.loot_drops = {}
			self.humble_pack4.content.loot_drops = {}
			self.e3_s15a.content.loot_drops = {}
			self.e3_s15b.content.loot_drops = {}
			self.e3_s15c.content.loot_drops = {}
			self.e3_s15d.content.loot_drops = {}
			self.sweettooth.content.loot_drops = {}
			self.hlm_game.content.loot_drops = {}
			self.gage_pack_historical.content.loot_drops = {}
			self.alienware_alpha.content.loot_drops = {}
			self.goty_weapon_bundle_2014.content.loot_drops = {}
			self.goty_heist_bundle_2014.content.loot_drops = {}
			self.goty_dlc_bundle_2014.content.loot_drops = {}
			self.character_pack_clover.content.loot_drops = {}
			self.butch_pack_free.content.loot_drops = {
				{
					type_items = "weapon_mods",
					item_entry = "wpn_fps_upg_ns_ass_filter",
					amount = 1
				}
			}
			self.character_pack_dragan.content.loot_drops = {}
			self.overkill_pack.content.loot_drops = {}
			self.complete_overkill_pack.content.loot_drops = {}
			self.complete_overkill_pack2.content.loot_drops = {}
			self.complete_overkill_pack3.content.loot_drops = {}
			self.hlm2.content.loot_drops = {}
			self.hlm2_deluxe.content.loot_drops = {}
			self.speedrunners.content.loot_drops = {}
			self.bbq.content.loot_drops = {}
			self.west.content.loot_drops = {}
			self.arena.content.loot_drops = {}
			self.character_pack_sokol.content.loot_drops = {}
			self.turtles_mods_fix.content.loot_drops = {}
			self.dragon.content.loot_drops = {}
			self.dragon_maskfix.content.loot_drops = {}
			self.rip_free.content.loot_drops = {}
			self.tormentor_mask.content.loot_drops = {}
			self.coco.content.loot_drops = {}
			self.mad.content.loot_drops = {}
			self.pim.content.loot_drops = {}
			self.opera.content.loot_drops = {}
			self.jigg.content.loot_drops = {}
			self.dbd_clan_award.content.loot_drops = {}
			self.dbd_deluxe.content.loot_drops = {}
			self.pdcon_2015.content.loot_drops = {}
			self.pdcon_2016.content.loot_drops = {}
			self.bobblehead.content.loot_drops = {}
			self.free_jwshades.content.loot_drops = {}
			self.dbd_boo_0_award.content.loot_drops = {}
			self.dbd_boo_1_award.content.loot_drops = {}
			self.dbd_boo_4_award.content.loot_drops = {}
			self.wild.content.loot_drops = {}
			self.solus_clan_award.content.loot_drops = {}
			self.pd2_clan_migg.content.loot_drops = {}
			self.pd2_clan_fibb.content.loot_drops = {}
			self.gotti_bundle.content.loot_drops = {}
			self.nyck_bundle.content.loot_drops = {}
			self.urf_bundle.content.loot_drops = {}
			self.howl.content.loot_drops = {}
			self.tango.content.loot_drops = {}
			self.tango.content.loot_drops = {}
			self.win_bundle.content.loot_drops = {}
			self.chico_bundle.content.loot_drops = {}
			self.friend_bundle.content.loot_drops = {}
			self.swm_bundle.content.loot_drops = {}
			self.sparkle_bundle.content.loot_drops = {}
			self.sha_bundle.content.loot_drops = {}
			self.yor_bundle.content.loot_drops = {}
			self.bny_bundle.content.loot_drops = {}
			self.mp2_bundle.content.loot_drops = {}
			self.amp_bundle.content.loot_drops = {}
			self.flip_bundle.content.loot_drops = {}
			self.mdm_bundle.content.loot_drops = {}
			self.ant_free.content.loot_drops = {}
			self.ant.content.loot_drops = {}
			self.dgm_bundle.content.loot_drops = {}
			self.gcm_bundle.content.loot_drops = {}
			self.ztm_bundle.content.loot_drops = {}
			self.wmp_bundle.content.loot_drops = {}
			self.cmo_bundle.content.loot_drops = {}
			self.pbm_bundle.content.loot_drops = {}
			self.fdm_bundle.content.loot_drops = {}
			self.kwm_bundle.content.loot_drops = {}
			self.mmj_bundle.content.loot_drops = {}
			self.ecp_bundle.content.loot_drops = {}
			self.gwm_bundle.content.loot_drops = {}
			self.rvd_bundle.content.loot_drops = {}
			self.pmp_bundle.content.loot_drops = {}
			self.joy_bundle.content.loot_drops = {}
			self.ghm_bundle.content.loot_drops = {}
			self.khp_bundle.content.loot_drops = {}
			self.sdb_bundle.content.loot_drops = {}
			self.sms_bundle_1.content.loot_drops = {}
			self.sms_bundle_2.content.loot_drops = {}
			self.scm_bundle.content.loot_drops = {}
			self.ghx_bundle.content.loot_drops = {}
			self.sdm_bundle.content.loot_drops = {}
			self.flm_bundle.content.loot_drops = {}
			self.toon_bundle.content.loot_drops = {}
			self.mmh_bundle.content.loot_drops = {}
			self.maw_bundle.content.loot_drops = {}
			self.free_halloween_textures.content.loot_drops = {}
			self.gage_pack_shotgun_free.content.loot_drops = {}
			self.xmas_soundtrack.content.loot_drops = {}
			self.character_pack_sokol.content.loot_drops = {}
			self.dragon.content.loot_drops = {}
			self.steel_free.content.loot_drops = {}
			self.rip_free.content.loot_drops = {}
			self.tormentor_mask.content.loot_drops = {}
			self.halloween_nightmare_1.content.loot_drops = {}
			self.halloween_nightmare_2.content.loot_drops = {}
			self.halloween_nightmare_3.content.loot_drops = {}
			self.halloween_nightmare_4.content.loot_drops = {}
			
			self.gage_pack.content.loot_drops = {
				{
					type_items = "weapon_mods",
					item_entry = "wpn_fps_upg_i_singlefire",
					amount = 0
				},
				{
					type_items = "weapon_mods",
					item_entry = "wpn_fps_upg_i_autofire",
					amount = 0
				},
				{
					{
						type_items = "masks",
						item_entry = "goat",
						amount = 1
					},
					{
						type_items = "masks",
						item_entry = "panda",
						amount = 1
					},
					{
						type_items = "masks",
						item_entry = "pitbull",
						amount = 1
					},
					{
						type_items = "masks",
						item_entry = "eagle",
						amount = 1
					}
				},
				{
					{
						type_items = "materials",
						item_entry = "fur",
						amount = 1
					},
					{
						type_items = "materials",
						item_entry = "galvanized",
						amount = 1
					},
					{
						type_items = "materials",
						item_entry = "heavymetal",
						amount = 1
					},
					{
						type_items = "materials",
						item_entry = "oilmetal",
						amount = 1
					}
				},
				{
					{
						type_items = "textures",
						item_entry = "army",
						amount = 1
					},
					{
						type_items = "textures",
						item_entry = "commando",
						amount = 1
					},
					{
						type_items = "textures",
						item_entry = "hunter",
						amount = 1
					},
					{
						type_items = "textures",
						item_entry = "digitalcamo",
						amount = 1
					}
				}
			}
	end
end
if string.lower(RequiredScript) == "lib/tweak_data/gageassignmenttweakdata" then
	local data = GageAssignmentTweakData.init
	function GageAssignmentTweakData:init(tweak_data)
		data(self, tweak_data)
		self.assignments.green_mantis.aquire = 100
		self.assignments.yellow_bull.aquire = 100
		self.assignments.red_spider.aquire = 100
		self.assignments.blue_eagle.aquire = 100
		self.assignments.purple_snake.aquire = 100
				
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
		
		local rand_afp = afp[math.random(15)]
		local rand_akm4_pack = akm4_pack[math.random(20)]
		local rand_arena = arena[math.random(4)]
		local rand_armored_transport = armored_transport[math.random(16)]
		local rand_atw = atw[math.random(12)]
		local rand_bbq = bbq[math.random(8)]
		local rand_berry = berry[math.random(4)]
		local rand_big_bank = big_bank[math.random(9)]
		local rand_born = born[math.random(2)]
		local rand_butch_pack_free = butch_pack_free[math.random(19)]
		local rand_character_pack_clover = character_pack_clover[math.random(5)]
		local rand_character_pack_dragan = character_pack_dragan[math.random(3)]
		local rand_character_pack_sokol = character_pack_sokol[math.random(3)]
		local rand_dragon = dragon[math.random(6)]
		local rand_ecp = ecp[math.random(3)]
		local rand_gage_pack = gage_pack[math.random(17)]
		local rand_gage_pack_assault = gage_pack_assault[math.random(28)]
		local rand_gage_pack_historical = gage_pack_historical[math.random(22)]
		local rand_gage_pack_jobs = gage_pack_jobs[math.random(28)]
		local rand_gage_pack_lmg = gage_pack_lmg[math.random(8)]
		local rand_gage_pack_shotgun = gage_pack_shotgun[math.random(15)]
		local rand_gage_pack_snp = gage_pack_snp[math.random(11)]
		local rand_grv = grv[math.random(5)]
		local rand_hl_miami = hl_miami[math.random(15)]
		local rand_hlm2_deluxe = hlm2_deluxe[math.random(3)]
		local rand_kenaz = kenaz[math.random(3)]
		local rand_mwm = mwm[math.random(10)]
		local rand_normal = normal[math.random(175)]
		local rand_opera = opera[math.random(2)]
		local rand_overkill_pack = overkill_pack[math.random(2)]
		local rand_pal = pal[math.random(1)]
		local rand_pd2_clan = pd2_clan[math.random(29)]
		local rand_peta = peta[math.random(2)]
		local rand_pim = pim[math.random(12)]
		local rand_rota = rota[math.random(2)]
		local rand_spa = spa[math.random(3)]
		local rand_tango = tango[math.random(22)]
		local rand_the_bomb = the_bomb[math.random(3)]
		local rand_turtles = turtles[math.random(13)]
		local rand_west = west[math.random(8)]
		local rand_wild = wild[math.random(4)]
		
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

		local green_mantis_mod_1 = weapon_mods[math.random(41)]
		local green_mantis_mod_2 = weapon_mods[math.random(41)]
		local green_mantis_mod_3 = weapon_mods[math.random(41)]
		local green_mantis_mod_4 = weapon_mods[math.random(41)]
		local green_mantis_mod_5 = weapon_mods[math.random(41)]
		local yellow_bull_mod_1 = weapon_mods[math.random(41)]
		local yellow_bull_mod_2 = weapon_mods[math.random(41)]
		local yellow_bull_mod_3 = weapon_mods[math.random(41)]
		local yellow_bull_mod_4 = weapon_mods[math.random(41)]
		local yellow_bull_mod_5 = weapon_mods[math.random(41)]
		local red_spider_mod_1 = weapon_mods[math.random(41)]
		local red_spider_mod_2 = weapon_mods[math.random(41)]
		local red_spider_mod_3 = weapon_mods[math.random(41)]
		local red_spider_mod_4 = weapon_mods[math.random(41)]
		local red_spider_mod_5 = weapon_mods[math.random(41)]
		local red_spider_mod_6 = weapon_mods[math.random(41)]
		local blue_eagle_mod_1 = weapon_mods[math.random(41)]
		local blue_eagle_mod_2 = weapon_mods[math.random(41)]
		local blue_eagle_mod_3 = weapon_mods[math.random(41)]
		local blue_eagle_mod_4 = weapon_mods[math.random(41)]
		local blue_eagle_mod_5 = weapon_mods[math.random(41)]
		local blue_eagle_mod_6 = weapon_mods[math.random(41)]
		local purple_snake_mod_1 = weapon_mods[math.random(41)]
		local purple_snake_mod_2 = weapon_mods[math.random(41)]
		local purple_snake_mod_3 = weapon_mods[math.random(41)]
		local purple_snake_mod_4 = weapon_mods[math.random(41)]
		local purple_snake_mod_5 = weapon_mods[math.random(41)]
		local purple_snake_mod_6 = weapon_mods[math.random(41)]
		
		self.assignments.green_mantis.rewards[1] = green_mantis_mod_1
		self.assignments.green_mantis.rewards[2] = green_mantis_mod_2
		self.assignments.green_mantis.rewards[3] = green_mantis_mod_3
		self.assignments.green_mantis.rewards[4] = green_mantis_mod_4
		self.assignments.green_mantis.rewards[5] = green_mantis_mod_5
		
		self.assignments.yellow_bull.rewards[1] = yellow_bull_mod_1
		self.assignments.yellow_bull.rewards[2] = yellow_bull_mod_2
		self.assignments.yellow_bull.rewards[3] = yellow_bull_mod_3
		self.assignments.yellow_bull.rewards[4] = yellow_bull_mod_4
		self.assignments.yellow_bull.rewards[5] = yellow_bull_mod_5
		
		self.assignments.red_spider.rewards[1] = red_spider_mod_1
		self.assignments.red_spider.rewards[2] = red_spider_mod_2
		self.assignments.red_spider.rewards[3] = red_spider_mod_3
		self.assignments.red_spider.rewards[4] = red_spider_mod_4
		self.assignments.red_spider.rewards[5] = red_spider_mod_5
		self.assignments.red_spider.rewards[6] = red_spider_mod_6
		
		self.assignments.blue_eagle.rewards[1] = blue_eagle_mod_1
		self.assignments.blue_eagle.rewards[2] = blue_eagle_mod_2
		self.assignments.blue_eagle.rewards[3] = blue_eagle_mod_3
		self.assignments.blue_eagle.rewards[4] = blue_eagle_mod_4
		self.assignments.blue_eagle.rewards[5] = blue_eagle_mod_5
		self.assignments.blue_eagle.rewards[6] = blue_eagle_mod_6
		
		self.assignments.purple_snake.rewards[1] = purple_snake_mod_1
		self.assignments.purple_snake.rewards[2] = purple_snake_mod_2
		self.assignments.purple_snake.rewards[3] = purple_snake_mod_3
		self.assignments.purple_snake.rewards[4] = purple_snake_mod_4
		self.assignments.purple_snake.rewards[5] = purple_snake_mod_5
		self.assignments.purple_snake.rewards[6] = purple_snake_mod_6
		
	end
end
if string.lower(RequiredScript) == "lib/tweak_data/blackmarket/maskstweakdata" then
	local data = BlackMarketTweakData._init_masks
	function BlackMarketTweakData:_init_masks(tweak_data)
		data(self, tweak_data)
		
		self.masks.tam.infamy_lock = "infamy_maskpack_immortal"
		
		self.masks.unicorn.pcs = {10, 20, 30, 40}
		self.masks.combusto.pcs = {10, 20, 30, 40}
		self.masks.spackle.pcs = {10, 20, 30, 40}
		self.masks.smiley.pcs = {10, 20, 30, 40}
		self.masks.gumbo.pcs = {10, 20, 30, 40}
		self.masks.crazy_lion.pcs = {10, 20, 30, 40}
		self.masks.mig_death.pcs = {10, 20, 30, 40}
		self.masks.mig_war.pcs = {10, 20, 30, 40}
		self.masks.mig_conquest.pcs = {10, 20, 30, 40}
		self.masks.mig_famine.pcs = {10, 20, 30, 40}
		self.masks.fib_fox.pcs = {10, 20, 30, 40}
		self.masks.fib_cat.pcs = {10, 20, 30, 40}
		self.masks.fib_mouse.pcs = {10, 20, 30, 40}
		self.masks.fib_hare.pcs = {10, 20, 30, 40}
		self.masks.wmp_01.pcs = {10, 20, 30, 40}
		self.masks.wmp_02.pcs = {10, 20, 30, 40}
		self.masks.wmp_03.pcs = {10, 20, 30, 40}
		self.masks.wmp_04.pcs = {10, 20, 30, 40}
		
		self.masks.simpson.pcs = {10, 20, 30, 40}
		self.masks.krampus.pcs = {10, 20, 30, 40}
		self.masks.mrs_claus.pcs = {10, 20, 30, 40}
		self.masks.strinch.pcs = {10, 20, 30, 40}
		self.masks.almirs_beard.pcs = {10, 20, 30, 40}
		self.masks.robo_santa.pcs = {10, 20, 30, 40}
		self.masks.champion_dallas.pcs = {10, 20, 30, 40}
		self.masks.baitface.pcs = {10, 20, 30, 40}
		self.masks.nomegusta.pcs = {10, 20, 30, 40}
		self.masks.rageface.pcs = {10, 20, 30, 40}
		self.masks.dawg.pcs = {10, 20, 30, 40}
		self.masks.rudeolph.pcs = {10, 20, 30, 40}
		self.masks.greedy_the_elf.pcs = {10, 20, 30, 40}
		self.masks.half_mask.pcs = {10, 20, 30, 40}
		self.masks.visor.pcs = {10, 20, 30, 40}
		self.masks.mad_goggles.pcs = {10, 20, 30, 40}
		self.masks.mad_mask.pcs = {10, 20, 30, 40}
		self.masks.nyck_beret.pcs = {10, 20, 30, 40}
		self.masks.nyck_pickle.pcs = {10, 20, 30, 40}
		self.masks.nyck_cap.pcs = {10, 20, 30, 40}
		self.masks.nyck_ace.pcs = {10, 20, 30, 40}
		self.masks.gti_al_capone.pcs = {10, 20, 30, 40}
		self.masks.gti_bugsy.pcs = {10, 20, 30, 40}
		self.masks.gti_madame_st_claire.pcs = {10, 20, 30, 40}
		self.masks.gti_lucky_luciano.pcs = {10, 20, 30, 40}
		self.masks.urf_seal.pcs = {10, 20, 30, 40}
		self.masks.moon_paycheck_dallas.pcs = {10, 20, 30, 40}
		self.masks.moon_paycheck_chains.pcs = {10, 20, 30, 40}
		self.masks.amp_01.pcs = {10, 20, 30, 40}
		self.masks.amp_02.pcs = {10, 20, 30, 40}
		self.masks.amp_03.pcs = {10, 20, 30, 40}
		self.masks.amp_04.pcs = {10, 20, 30, 40}
		self.masks.mp2_02.pcs = {10, 20, 30, 40}
		self.masks.mp2_03.pcs = {10, 20, 30, 40}
		self.masks.bny_01.pcs = {10, 20, 30, 40}
		self.masks.bny_02.pcs = {10, 20, 30, 40}
		self.masks.bny_03.pcs = {10, 20, 30, 40}
		self.masks.bny_04.pcs = {10, 20, 30, 40}
		self.masks.mmj.pcs = {10, 20, 30, 40}
		self.masks.cmo_01.pcs = {10, 20, 30, 40}
		self.masks.cmo_02.pcs = {10, 20, 30, 40}
		self.masks.cmo_03.pcs = {10, 20, 30, 40}
		self.masks.cmo_04.pcs = {10, 20, 30, 40}
		self.masks.kwm.pcs = {10, 20, 30, 40}
		self.masks.cmt_01.pcs = {10, 20, 30, 40}
		self.masks.cmt_02.pcs = {10, 20, 30, 40}
		self.masks.cmt_03.pcs = {10, 20, 30, 40}
		self.masks.cmt_04.pcs = {10, 20, 30, 40}
		self.masks.sdm_01.pcs = {10, 20, 30, 40}
		self.masks.sdm_02.pcs = {10, 20, 30, 40}
		self.masks.sdm_03.pcs = {10, 20, 30, 40}
		self.masks.sdm_04.pcs = {10, 20, 30, 40}
		self.masks.flm.pcs = {10, 20, 30, 40}
		self.masks.toon_01.pcs = {10, 20, 30, 40}
		self.masks.toon_02.pcs = {10, 20, 30, 40}
		self.masks.toon_03.pcs = {10, 20, 30, 40}
		self.masks.toon_04.pcs = {10, 20, 30, 40}
		
		self.masks.metalhead.pcs = {10, 20, 30, 40}
		self.masks.tcn.pcs = {10, 20, 30, 40}
		self.masks.surprise.pcs = {10, 20, 30, 40}
		self.masks.optimist_prime.pcs = {10, 20, 30, 40}
		self.masks.robberfly.pcs = {10, 20, 30, 40}
		self.masks.spider.pcs = {10, 20, 30, 40}
		self.masks.mantis.pcs = {10, 20, 30, 40}
		self.masks.wasp.pcs = {10, 20, 30, 40}
		self.masks.franklin.pcs = {10, 20, 30, 40}
		self.masks.lincoln.pcs = {10, 20, 30, 40}
		self.masks.grant.pcs = {10, 20, 30, 40}
		self.masks.washington.pcs = {10, 20, 30, 40}
		self.masks.silverback.pcs = {10, 20, 30, 40}
		self.masks.mandril.pcs = {10, 20, 30, 40}
		self.masks.skullmonkey.pcs = {10, 20, 30, 40}
		self.masks.orangutang.pcs = {10, 20, 30, 40}
		self.masks.galax.pcs = {10, 20, 30, 40}
		self.masks.crowgoblin.pcs = {10, 20, 30, 40}
		self.masks.evil.pcs = {10, 20, 30, 40}
		self.masks.volt.pcs = {10, 20, 30, 40}
		self.masks.white_wolf.pcs = {10, 20, 30, 40}
		self.masks.owl.pcs = {10, 20, 30, 40}
		self.masks.rabbit.pcs = {10, 20, 30, 40}
		self.masks.pig.pcs = {10, 20, 30, 40}
		self.masks.churchill.pcs = {10, 20, 30, 40}
		self.masks.red_hurricane.pcs = {10, 20, 30, 40}
		self.masks.patton.pcs = {10, 20, 30, 40}
		self.masks.de_gaulle.pcs = {10, 20, 30, 40}
		self.masks.msk_grizel.pcs = {10, 20, 30, 40}
		self.masks.medusa.pcs = {10, 20, 30, 40}
		self.masks.anubis.pcs = {10, 20, 30, 40}
		self.masks.pazuzu.pcs = {10, 20, 30, 40}
		self.masks.cursed_crown.pcs = {10, 20, 30, 40}
		self.masks.nun_town.pcs = {10, 20, 30, 40}
		self.masks.robo_arnold.pcs = {10, 20, 30, 40}
		self.masks.arch_nemesis.pcs = {10, 20, 30, 40}
		self.masks.dragan.pcs = {10, 20, 30, 40}
		self.masks.butcher.pcs = {10, 20, 30, 40}
		self.masks.doctor.pcs = {10, 20, 30, 40}
		self.masks.tech_lion.pcs = {10, 20, 30, 40}
		self.masks.lady_butcher.pcs = {10, 20, 30, 40}
		self.masks.carnotaurus.pcs = {10, 20, 30, 40}
		self.masks.triceratops.pcs = {10, 20, 30, 40}
		self.masks.pachy.pcs = {10, 20, 30, 40}
		self.masks.velociraptor.pcs = {10, 20, 30, 40}
		self.masks.the_overkill_mask.pcs = {10, 20, 30, 40}
		self.masks.firedemon.pcs = {10, 20, 30, 40}
		self.masks.gasmask.pcs = {10, 20, 30, 40}
		self.masks.firemask.pcs = {10, 20, 30, 40}
		self.masks.chef_hat.pcs = {10, 20, 30, 40}
		self.masks.bandit.pcs = {10, 20, 30, 40}
		self.masks.bullskull.pcs = {10, 20, 30, 40}
		self.masks.kangee.pcs = {10, 20, 30, 40}
		self.masks.lone.pcs = {10, 20, 30, 40}
		self.masks.concert_male.pcs = {10, 20, 30, 40}
		self.masks.concert_female.pcs = {10, 20, 30, 40}
		self.masks.boombox.pcs = {10, 20, 30, 40}
		self.masks.cantus.pcs = {10, 20, 30, 40}
		self.masks.sokol.pcs = {10, 20, 30, 40}
		self.masks.croupier_hat.pcs = {10, 20, 30, 40}
		self.masks.gladiator_helmet.pcs = {10, 20, 30, 40}
		self.masks.the_king_mask.pcs = {10, 20, 30, 40}
		self.masks.sports_utility_mask.pcs = {10, 20, 30, 40}
		self.masks.kage.pcs = {10, 20, 30, 40}
		self.masks.ninja_hood.pcs = {10, 20, 30, 40}
		self.masks.shirai.pcs = {10, 20, 30, 40}
		self.masks.slicer.pcs = {10, 20, 30, 40}
		self.masks.jiro.pcs = {10, 20, 30, 40}
		self.masks.mason_knight_veteran.pcs = {10, 20, 30, 40}
		self.masks.agatha_knight.pcs = {10, 20, 30, 40}
		self.masks.agatha_vanguard_veteran.pcs = {10, 20, 30, 40}
		self.masks.mason_vanguard_veteran.pcs = {10, 20, 30, 40}
		self.masks.water_spirit.pcs = {10, 20, 30, 40}
		self.masks.tane.pcs = {10, 20, 30, 40}
		self.masks.oro.pcs = {10, 20, 30, 40}
		self.masks.maui.pcs = {10, 20, 30, 40}
		self.masks.tall_goat.pcs = {10, 20, 30, 40}
		self.masks.goat_goat.pcs = {10, 20, 30, 40}
		self.masks.wet_goat.pcs = {10, 20, 30, 40}
		self.masks.fancy_goat.pcs = {10, 20, 30, 40}
		self.masks.horned_king.pcs = {10, 20, 30, 40}
		self.masks.viking.pcs = {10, 20, 30, 40}
		self.masks.nutcracker.pcs = {10, 20, 30, 40}
		self.masks.divided.pcs = {10, 20, 30, 40}
		self.masks.sydney.pcs = {10, 20, 30, 40}
		self.masks.born_biker_01.pcs = {10, 20, 30, 40}
		self.masks.born_biker_02.pcs = {10, 20, 30, 40}
		self.masks.born_biker_03.pcs = {10, 20, 30, 40}
		self.masks.brutal.pcs = {10, 20, 30, 40}
		self.masks.rust.pcs = {10, 20, 30, 40}
		self.masks.pim_dog.pcs = {10, 20, 30, 40}
		self.masks.pim_russian_ballistic.pcs = {10, 20, 30, 40}
		self.masks.pim_hotelier.pcs = {10, 20, 30, 40}
		self.masks.pim_mustang.pcs = {10, 20, 30, 40}
		self.masks.chc_terry.pcs = {10, 20, 30, 40}
		self.masks.chc_terry_begins.pcs = {10, 20, 30, 40}
		self.masks.sfm_01.pcs = {10, 20, 30, 40}
		self.masks.sfm_02.pcs = {10, 20, 30, 40}
		self.masks.sfm_03.pcs = {10, 20, 30, 40}
		self.masks.sfm_04.pcs = {10, 20, 30, 40}
		self.masks.spa_01.pcs = {10, 20, 30, 40}
		self.masks.spa_02.pcs = {10, 20, 30, 40}
		self.masks.spa_03.pcs = {10, 20, 30, 40}
		self.masks.spa_04.pcs = {10, 20, 30, 40}
		self.masks.grv_01.pcs = {10, 20, 30, 40}
		self.masks.grv_02.pcs = {10, 20, 30, 40}
		self.masks.grv_03.pcs = {10, 20, 30, 40}
		self.masks.grv_04.pcs = {10, 20, 30, 40}
		self.masks.ecp_male.pcs = {10, 20, 30, 40}
		self.masks.ecp_female.pcs = {10, 20, 30, 40}
		self.masks.ecp_male_begins.pcs = {10, 20, 30, 40}
		self.masks.ecp_female_begins.pcs = {10, 20, 30, 40}
		self.masks.bobblehead_dozer.pcs = {10, 20, 30, 40}
		
		self.masks.ancient.pcs = {10, 20, 30, 40}
		self.masks.twitch_orc.pcs = {10, 20, 30, 40}
		self.masks.the_one_below.pcs = {10, 20, 30, 40}
		self.masks.lycan.pcs = {10, 20, 30, 40}
		self.masks.area51.pcs = {10, 20, 30, 40}
		self.masks.alien_helmet.pcs = {10, 20, 30, 40}
		self.masks.titan.pcs = {10, 20, 30, 40}
		self.masks.pokachu.pcs = {10, 20, 30, 40}
		self.masks.moon.pcs = {10, 20, 30, 40}
		self.masks.borsuk.pcs = {10, 20, 30, 40}
		self.masks.card_jack.pcs = {10, 20, 30, 40}
		self.masks.card_queen.pcs = {10, 20, 30, 40}
		self.masks.card_king.pcs = {10, 20, 30, 40}
		self.masks.card_joker.pcs = {10, 20, 30, 40}
		self.masks.king_of_jesters.pcs = {10, 20, 30, 40}
		self.masks.hwl_dallas_zombie.pcs = {10, 20, 30, 40}
		self.masks.pdc16_clover.pcs = {10, 20, 30, 40}
		self.masks.spk_party.pcs = {10, 20, 30, 40}
		self.masks.fdm.pcs = {10, 20, 30, 40}
		self.masks.pbm.pcs = {10, 20, 30, 40}
		self.masks.swm_sydney.pcs = {10, 20, 30, 40}
		
		self.masks.panther.pcs = {10, 20, 30, 40}
		self.masks.rooster.pcs = {10, 20, 30, 40}
		self.masks.horse.pcs = {10, 20, 30, 40}
		self.masks.tiger.pcs = {10, 20, 30, 40}
		self.masks.jake.pcs = {10, 20, 30, 40}
		self.masks.richter.pcs = {10, 20, 30, 40}
		self.masks.biker.pcs = {10, 20, 30, 40}
		self.masks.alex.pcs = {10, 20, 30, 40}
		self.masks.corey.pcs = {10, 20, 30, 40}
		self.masks.tonys_revenge.pcs = {10, 20, 30, 40}
		self.masks.richard_returns.pcs = {10, 20, 30, 40}
		self.masks.hothead.pcs = {10, 20, 30, 40}
		self.masks.falcon.pcs = {10, 20, 30, 40}
		self.masks.unic.pcs = {10, 20, 30, 40}
		self.masks.speedrunner.pcs = {10, 20, 30, 40}
		self.masks.dbd_01.pcs = {10, 20, 30, 40}
		self.masks.dbd_02.pcs = {10, 20, 30, 40}
		self.masks.dbd_03.pcs = {10, 20, 30, 40}
		self.masks.dbd_04.pcs = {10, 20, 30, 40}
		self.masks.dbd_slasher.pcs = {10, 20, 30, 40}
		self.masks.ant_01.pcs = {10, 20, 30, 40}
		self.masks.ant_02.pcs = {10, 20, 30, 40}
		self.masks.ant_03.pcs = {10, 20, 30, 40}
		self.masks.ant_04.pcs = {10, 20, 30, 40}
		self.masks.ant_05.pcs = {10, 20, 30, 40}
		self.masks.ant_06.pcs = {10, 20, 30, 40}
		self.masks.ant_07.pcs = {10, 20, 30, 40}
		self.masks.ant_08.pcs = {10, 20, 30, 40}
		self.masks.eng_01.pcs = {10, 20, 30, 40}
		self.masks.eng_02.pcs = {10, 20, 30, 40}
		self.masks.eng_03.pcs = {10, 20, 30, 40}
		self.masks.eng_04.pcs = {10, 20, 30, 40}
		
		self.masks.bodhi.pcs = {10, 20, 30, 40}
		self.masks.bonnie.pcs = {10, 20, 30, 40}
		self.masks.jw_shades.pcs = {10, 20, 30, 40}
		self.masks.starvr.pcs = {10, 20, 30, 40}
		self.masks.jimmy_duct.pcs = {10, 20, 30, 40}
		self.masks.mmh.pcs = {10, 20, 30, 40}
		self.masks.joy.pcs = {10, 20, 30, 40}
		self.masks.maw_01.pcs = {10, 20, 30, 40}
		self.masks.dgm.pcs = {10, 20, 30, 40}
		self.masks.gcm.pcs = {10, 20, 30, 40}
		self.masks.gwm.pcs = {10, 20, 30, 40}
		self.masks.ghx.pcs = {10, 20, 30, 40}
		self.masks.ghm.pcs = {10, 20, 30, 40}
		self.masks.stoneface.pcs = {10, 20, 30, 40}
		self.masks.wayfarer.pcs = {10, 20, 30, 40}
		
		self.masks.fab_mega_grin.pcs = {10, 20, 30, 40}
		self.masks.fab_mega_doctor.pcs = {10, 20, 30, 40}
		self.masks.fab_mega_alien.pcs = {10, 20, 30, 40}
		self.masks.cop_mega_gage_blade.pcs = {10, 20, 30, 40}
		self.masks.fab_mega_mark.pcs = {10, 20, 30, 40}
		self.masks.dallas_glow.pcs = {10, 20, 30, 40}
		self.masks.wolf_glow.pcs = {10, 20, 30, 40}
		self.masks.hoxton_glow.pcs = {10, 20, 30, 40}
		self.masks.chains_glow.pcs = {10, 20, 30, 40}
		
		self.masks.unicorn.value = 3
		self.masks.combusto.value = 3
		self.masks.spackle.value = 3
		self.masks.smiley.value = 3
		self.masks.gumbo.value = 3
		self.masks.crazy_lion.value = 3
		self.masks.mig_death.value = 3
		self.masks.mig_war.value = 3
		self.masks.mig_conquest.value = 3
		self.masks.mig_famine.value = 3
		self.masks.fib_fox.value = 4
		self.masks.fib_cat.value = 4
		self.masks.fib_mouse.value = 4
		self.masks.fib_hare.value = 4
		self.masks.wmp_01.value = 3
		self.masks.wmp_02.value = 3
		self.masks.wmp_03.value = 3
		self.masks.wmp_04.value = 3
		
		self.masks.simpson.value = 4
		self.masks.krampus.value = 4
		self.masks.mrs_claus.value = 4
		self.masks.strinch.value = 4
		self.masks.almirs_beard.value = 4
		self.masks.robo_santa.value = 4
		self.masks.champion_dallas.value = 4
		self.masks.baitface.value = 4
		self.masks.nomegusta.value = 4
		self.masks.rageface.value = 4
		self.masks.dawg.value = 4
		self.masks.rudeolph.value = 4
		self.masks.greedy_the_elf.value = 4
		self.masks.half_mask.value = 4
		self.masks.visor.value = 4
		self.masks.mad_goggles.value = 4
		self.masks.mad_mask.value = 4
		self.masks.nyck_beret.value = 4
		self.masks.nyck_pickle.value = 4
		self.masks.nyck_cap.value = 4
		self.masks.nyck_ace.value = 4
		self.masks.gti_al_capone.value = 4
		self.masks.gti_bugsy.value = 4
		self.masks.gti_madame_st_claire.value = 4
		self.masks.gti_lucky_luciano.value = 4
		self.masks.urf_seal.value = 4
		self.masks.moon_paycheck_dallas.value = 4
		self.masks.moon_paycheck_chains.value = 4
		self.masks.amp_01.value = 4
		self.masks.amp_02.value = 4
		self.masks.amp_03.value = 4
		self.masks.amp_04.value = 4
		self.masks.mp2_02.value = 4
		self.masks.mp2_03.value = 4
		self.masks.bny_01.value = 4
		self.masks.bny_02.value = 4
		self.masks.bny_03.value = 4
		self.masks.bny_04.value = 4
		self.masks.mmj.value = 4
		self.masks.cmo_01.value = 4
		self.masks.cmo_02.value = 4
		self.masks.cmo_03.value = 4
		self.masks.cmo_04.value = 4
		self.masks.kwm.value = 4
		self.masks.cmt_01.value = 4
		self.masks.cmt_02.value = 4
		self.masks.cmt_03.value = 4
		self.masks.cmt_04.value = 4
		self.masks.sdm_01.value = 4
		self.masks.sdm_02.value = 4
		self.masks.sdm_03.value = 4
		self.masks.sdm_04.value = 4
		self.masks.flm.value = 4
		self.masks.toon_01.value = 5
		self.masks.toon_02.value = 5
		self.masks.toon_03.value = 5
		self.masks.toon_04.value = 5
		
		self.masks.metalhead.value = 5
		self.masks.tcn.value = 5
		self.masks.surprise.value = 5
		self.masks.optimist_prime.value = 5
		self.masks.robberfly.value = 5
		self.masks.spider.value = 5
		self.masks.mantis.value = 5
		self.masks.wasp.value = 5
		self.masks.franklin.value = 5
		self.masks.lincoln.value = 5
		self.masks.grant.value = 5
		self.masks.washington.value = 5
		self.masks.silverback.value = 5
		self.masks.mandril.value = 5
		self.masks.skullmonkey.value = 5
		self.masks.orangutang.value = 5
		self.masks.galax.value = 5
		self.masks.crowgoblin.value = 5
		self.masks.evil.value = 5
		self.masks.volt.value = 5
		self.masks.white_wolf.value = 5
		self.masks.owl.value = 5
		self.masks.rabbit.value = 5
		self.masks.pig.value = 5
		self.masks.churchill.value = 5
		self.masks.red_hurricane.value = 5
		self.masks.patton.value = 5
		self.masks.de_gaulle.value = 5
		self.masks.msk_grizel.value = 5
		self.masks.medusa.value = 5
		self.masks.anubis.value = 5
		self.masks.pazuzu.value = 5
		self.masks.cursed_crown.value = 5
		self.masks.nun_town.value = 5
		self.masks.robo_arnold.value = 5
		self.masks.arch_nemesis.value = 5
		self.masks.dragan.value = 5
		self.masks.butcher.value = 5
		self.masks.doctor.value = 5
		self.masks.tech_lion.value = 5
		self.masks.lady_butcher.value = 5
		self.masks.carnotaurus.value = 5
		self.masks.triceratops.value = 5
		self.masks.pachy.value = 5
		self.masks.velociraptor.value = 5
		self.masks.the_overkill_mask.value = 5
		self.masks.firedemon.value = 5
		self.masks.gasmask.value = 5
		self.masks.firemask.value = 5
		self.masks.chef_hat.value = 5
		self.masks.bandit.value = 5
		self.masks.bullskull.value = 5
		self.masks.kangee.value = 5
		self.masks.lone.value = 5
		self.masks.concert_male.value = 5
		self.masks.concert_female.value = 5
		self.masks.boombox.value = 5
		self.masks.cantus.value = 5
		self.masks.sokol.value = 5
		self.masks.croupier_hat.value = 5
		self.masks.gladiator_helmet.value = 5
		self.masks.the_king_mask.value = 5
		self.masks.sports_utility_mask.value = 5
		self.masks.kage.value = 5
		self.masks.ninja_hood.value = 5
		self.masks.shirai.value = 5
		self.masks.slicer.value = 5
		self.masks.jiro.value = 5
		self.masks.mason_knight_veteran.value = 5
		self.masks.agatha_knight.value = 5
		self.masks.agatha_vanguard_veteran.value = 5
		self.masks.mason_vanguard_veteran.value = 5
		self.masks.water_spirit.value = 5
		self.masks.tane.value = 5
		self.masks.oro.value = 5
		self.masks.maui.value = 5
		self.masks.tall_goat.value = 5
		self.masks.goat_goat.value = 5
		self.masks.wet_goat.value = 5
		self.masks.fancy_goat.value = 5
		self.masks.horned_king.value = 5
		self.masks.viking.value = 5
		self.masks.nutcracker.value = 5
		self.masks.divided.value = 5
		self.masks.sydney.value = 5
		self.masks.born_biker_01.value = 5
		self.masks.born_biker_02.value = 5
		self.masks.born_biker_03.value = 5
		self.masks.brutal.value = 5
		self.masks.rust.value = 5
		self.masks.pim_dog.value = 5
		self.masks.pim_russian_ballistic.value = 5
		self.masks.pim_hotelier.value = 5
		self.masks.pim_mustang.value = 5
		self.masks.chc_terry.value = 5
		self.masks.chc_terry_begins.value = 5
		self.masks.sfm_01.value = 5
		self.masks.sfm_02.value = 5
		self.masks.sfm_03.value = 5
		self.masks.sfm_04.value = 5
		self.masks.spa_01.value = 5
		self.masks.spa_02.value = 5
		self.masks.spa_03.value = 5
		self.masks.spa_04.value = 5
		self.masks.grv_01.value = 5
		self.masks.grv_02.value = 5
		self.masks.grv_03.value = 5
		self.masks.grv_04.value = 5
		self.masks.ecp_male.value = 5
		self.masks.ecp_female.value = 5
		self.masks.ecp_male_begins.value = 5
		self.masks.ecp_female_begins.value = 5
		self.masks.bobblehead_dozer.value = 5
		
		self.masks.ancient.value = 7
		self.masks.twitch_orc.value = 7
		self.masks.the_one_below.value = 7
		self.masks.lycan.value = 7
		self.masks.area51.value = 7
		self.masks.alien_helmet.value = 7
		self.masks.titan.value = 7
		self.masks.pokachu.value = 7
		self.masks.moon.value = 7
		self.masks.borsuk.value = 7
		self.masks.card_jack.value = 7
		self.masks.card_queen.value = 7
		self.masks.card_king.value = 7
		self.masks.card_joker.value = 7
		self.masks.king_of_jesters.value = 7
		self.masks.hwl_dallas_zombie.value = 7
		self.masks.pdc16_clover.value = 7
		self.masks.spk_party.value = 7
		self.masks.fdm.value = 7
		self.masks.pbm.value = 7
		self.masks.swm_sydney.value = 7
		
		self.masks.panther.value = 6
		self.masks.rooster.value = 6
		self.masks.horse.value = 6
		self.masks.tiger.value = 6
		self.masks.jake.value = 6
		self.masks.richter.value = 6
		self.masks.biker.value = 6
		self.masks.alex.value = 6
		self.masks.corey.value = 6
		self.masks.tonys_revenge.value = 6
		self.masks.richard_returns.value = 6
		self.masks.hothead.value = 6
		self.masks.falcon.value = 6
		self.masks.unic.value = 6
		self.masks.speedrunner.value = 6
		self.masks.dbd_01.value = 6
		self.masks.dbd_02.value = 6
		self.masks.dbd_03.value = 6
		self.masks.dbd_04.value = 6
		self.masks.dbd_slasher.value = 6
		self.masks.ant_01.value = 6
		self.masks.ant_02.value = 6
		self.masks.ant_03.value = 6
		self.masks.ant_04.value = 6
		self.masks.ant_05.value = 6
		self.masks.ant_06.value = 6
		self.masks.ant_07.value = 6
		self.masks.ant_08.value = 6
		self.masks.eng_01.value = 6
		self.masks.eng_02.value = 6
		self.masks.eng_03.value = 6
		self.masks.eng_04.value = 6
		
		self.masks.bodhi.value = 8
		self.masks.bonnie.value = 8
		self.masks.jw_shades.value = 8
		self.masks.starvr.value = 8
		self.masks.jimmy_duct.value = 8
		self.masks.mmh.value = 8
		self.masks.joy.value = 8
		self.masks.maw_01.value = 8
		self.masks.dgm.value = 8
		self.masks.gcm.value = 8
		self.masks.gwm.value = 8
		self.masks.ghx.value = 8
		self.masks.ghm.value = 8
		self.masks.stoneface.value = 8
		self.masks.wayfarer.value = 8
		
		self.masks.fab_mega_grin.value = 9
		self.masks.fab_mega_doctor.value = 9
		self.masks.fab_mega_alien.value = 9
		self.masks.cop_mega_gage_blade.value = 9
		self.masks.fab_mega_mark.value = 9
		self.masks.dallas_glow.value = 9
		self.masks.wolf_glow.value = 9
		self.masks.hoxton_glow.value = 9
		self.masks.chains_glow.value = 9
			
		self.masks.dgm.global_value = "infamy"
		self.masks.gcm.global_value = "infamy"
		self.masks.gwm.global_value = "infamy"
		self.masks.ghx.global_value = "infamy"
		self.masks.ghm.global_value = "infamy"
		self.masks.stoneface.global_value = "infamy"
		self.masks.wayfarer.global_value = "infamy"
		self.masks.dgm.infamous = true
		self.masks.gcm.infamous = true
		self.masks.gwm.infamous = true
		self.masks.ghx.infamous = true
		self.masks.ghm.infamous = true
		self.masks.stoneface.infamous = true
		self.masks.wayfarer.infamous = true
	end
end
if string.lower(RequiredScript) == "lib/tweak_data/blackmarket/materialstweakdata" then
	local data = BlackMarketTweakData._init_materials
	function BlackMarketTweakData:_init_materials(tweak_data)
		data(self, tweak_data)
		self.materials.bugshell.pcs = {10, 20, 30, 40}
		self.materials.carapace.pcs = {10, 20, 30, 40}
		self.materials.hardshell.pcs = {10, 20, 30, 40}
		self.materials.insectoid.pcs = {10, 20, 30, 40}
		self.materials.carbongrid.pcs = {10, 20, 30, 40}
		self.materials.cosmoline.pcs = {10, 20, 30, 40}
		self.materials.electronic.pcs = {10, 20, 30, 40}
		self.materials.blackmetal.pcs = {10, 20, 30, 40}
		self.materials.gemstone.pcs = {10, 20, 30, 40}
		self.materials.old.pcs = {10, 20, 30, 40}
		self.materials.clay.pcs = {10, 20, 30, 40}
		self.materials.parchment.pcs = {10, 20, 30, 40}
		self.materials.sparks.pcs = {10, 20, 30, 40}
		self.materials.explosive.pcs = {10, 20, 30, 40}
		self.materials.bananapeel.pcs = {10, 20, 30, 40}
		self.materials.leaf.pcs = {10, 20, 30, 40}
		self.materials.bone.pcs = {10, 20, 30, 40}
		self.materials.frost.pcs = {10, 20, 30, 40}
		self.materials.evil.pcs = {10, 20, 30, 40}
		self.materials.void.pcs = {10, 20, 30, 40}
		self.materials.sunset.pcs = {10, 20, 30, 40}
		self.materials.chromescape.pcs = {10, 20, 30, 40}
		self.materials.rubber.pcs = {10, 20, 30, 40}
		self.materials.error.pcs = {10, 20, 30, 40}
		self.materials.rug.pcs = {10, 20, 30, 40}
		self.materials.cushion.pcs = {10, 20, 30, 40}
		self.materials.hatred.pcs = {10, 20, 30, 40}
		self.materials.neon.pcs = {10, 20, 30, 40}
		self.materials.armygreen.pcs = {10, 20, 30, 40}
		self.materials.gunsmoke.pcs = {10, 20, 30, 40}
		self.materials.patriot.pcs = {10, 20, 30, 40}
		self.materials.redsun.pcs = {10, 20, 30, 40}
		self.materials.diamond.pcs = {10, 20, 30, 40}
		self.materials.bandages.pcs = {10, 20, 30, 40}
		self.materials.rust.pcs = {10, 20, 30, 40}
		self.materials.sand.pcs = {10, 20, 30, 40}
		self.materials.meat.pcs = {10, 20, 30, 40}
		self.materials.plywood.pcs = {10, 20, 30, 40}
		self.materials.rhino_skin.pcs = {10, 20, 30, 40}
		self.materials.rock_marble.pcs = {10, 20, 30, 40}
		self.materials.dawn.pcs = {10, 20, 30, 40}
		self.materials.prehistoric.pcs = {10, 20, 30, 40}
		self.materials.fossil.pcs = {10, 20, 30, 40}
		self.materials.feathers.pcs = {10, 20, 30, 40}
		self.materials.candlelight.pcs = {10, 20, 30, 40}
		self.materials.burn.pcs = {10, 20, 30, 40}
		self.materials.toast.pcs = {10, 20, 30, 40}
		self.materials.coal.pcs = {10, 20, 30, 40}
		self.materials.goldfever.pcs = {10, 20, 30, 40}
		self.materials.westernsunset.pcs = {10, 20, 30, 40}
		self.materials.scorpion.pcs = {10, 20, 30, 40}
		self.materials.cactus.pcs = {10, 20, 30, 40}
		self.materials.stained_glass.pcs = {10, 20, 30, 40}
		self.materials.bionic.pcs = {10, 20, 30, 40}
		self.materials.enlightment.pcs = {10, 20, 30, 40}
		self.materials.dimblue.pcs = {10, 20, 30, 40}
		self.materials.carpet.pcs = {10, 20, 30, 40}
		self.materials.casino.pcs = {10, 20, 30, 40}
		self.materials.plush.pcs = {10, 20, 30, 40}
		self.materials.stars.pcs = {10, 20, 30, 40}
		self.materials.still_waters.pcs = {10, 20, 30, 40}
		self.materials.sakura.pcs = {10, 20, 30, 40}
		self.materials.bamboo.pcs = {10, 20, 30, 40}
		self.materials.origami.pcs = {10, 20, 30, 40}
		self.materials.forged.pcs = {10, 20, 30, 40}
		self.materials.blooded.pcs = {10, 20, 30, 40}
		self.materials.chain_armor.pcs = {10, 20, 30, 40}
		self.materials.scale_armor.pcs = {10, 20, 30, 40}
		self.materials.flow.pcs = {10, 20, 30, 40}
		self.materials.sancti.pcs = {10, 20, 30, 40}
		self.materials.glade.pcs = {10, 20, 30, 40}
		self.materials.wade.pcs = {10, 20, 30, 40}
		self.materials.goateye.pcs = {10, 20, 30, 40}
		self.materials.flamingoeye.pcs = {10, 20, 30, 40}
		self.materials.hay.pcs = {10, 20, 30, 40}
		self.materials.tongue.pcs = {10, 20, 30, 40}
		self.materials.day.pcs = {10, 20, 30, 40}
		self.materials.houndstooth.pcs = {10, 20, 30, 40}
		self.materials.redwhite.pcs = {10, 20, 30, 40}
		self.materials.mushroom_cloud.pcs = {10, 20, 30, 40}
		self.materials.nebula.pcs = {10, 20, 30, 40}
		self.materials.planet.pcs = {10, 20, 30, 40}
		self.materials.rusty.pcs = {10, 20, 30, 40}
		self.materials.spaceship.pcs = {10, 20, 30, 40}
		self.materials.chromey.pcs = {10, 20, 30, 40}
		self.materials.devil_eye.pcs = {10, 20, 30, 40}
		self.materials.hotrod_red.pcs = {10, 20, 30, 40}
		self.materials.shiny_and_chrome.pcs = {10, 20, 30, 40}
		self.materials.club.pcs = {10, 20, 30, 40}
		self.materials.mist.pcs = {10, 20, 30, 40}
		self.materials.dog.pcs = {10, 20, 30, 40}
		self.materials.wheel.pcs = {10, 20, 30, 40}
		self.materials.oxidized_copper.pcs = {10, 20, 30, 40}
		self.materials.golden_hour.pcs = {10, 20, 30, 40}
		self.materials.red_velvet.pcs = {10, 20, 30, 40}
		self.materials.black_marble.pcs = {10, 20, 30, 40}
		self.materials.carbon_fiber_weave.pcs = {10, 20, 30, 40}
		self.materials.black_suede.pcs = {10, 20, 30, 40}
		self.materials.neon_blue.pcs = {10, 20, 30, 40}
		self.materials.underground_neon.pcs = {10, 20, 30, 40}
		self.materials.russian_camouflage.pcs = {10, 20, 30, 40}
		self.materials.ceramics_gzhel.pcs = {10, 20, 30, 40}
		self.materials.propaganda_palette.pcs = {10, 20, 30, 40}
		self.materials.tricolor.pcs = {10, 20, 30, 40}
		
		self.materials.bugshell.value = 4
		self.materials.carapace.value = 4
		self.materials.hardshell.value = 4
		self.materials.insectoid.value = 4
		self.materials.carbongrid.value = 5
		self.materials.cosmoline.value = 5
		self.materials.electronic.value = 5
		self.materials.blackmetal.value = 5
		self.materials.gemstone.value = 5
		self.materials.old.value = 5
		self.materials.clay.value = 5
		self.materials.parchment.value = 5
		self.materials.sparks.value = 4
		self.materials.explosive.value = 4
		self.materials.bananapeel.value = 4
		self.materials.leaf.value = 4
		self.materials.bone.value = 5
		self.materials.frost.value = 5
		self.materials.evil.value = 5
		self.materials.void.value = 5
		self.materials.sunset.value = 4
		self.materials.chromescape.value = 4
		self.materials.rubber.value = 4
		self.materials.error.value = 4
		self.materials.rug.value = 4
		self.materials.cushion.value = 4
		self.materials.hatred.value = 4
		self.materials.neon.value = 4
		self.materials.armygreen.value = 4
		self.materials.gunsmoke.value = 4
		self.materials.patriot.value = 4
		self.materials.redsun.value = 4
		self.materials.diamond.value = 6
		self.materials.bandages.value = 6
		self.materials.rust.value = 6
		self.materials.sand.value = 6
		self.materials.meat.value = 5
		self.materials.plywood.value = 5
		self.materials.rhino_skin.value = 5
		self.materials.rock_marble.value = 5
		self.materials.dawn.value = 5
		self.materials.prehistoric.value = 5
		self.materials.fossil.value = 5
		self.materials.feathers.value = 5
		self.materials.candlelight.value = 5
		self.materials.burn.value = 5
		self.materials.toast.value = 5
		self.materials.coal.value = 5
		self.materials.goldfever.value = 5
		self.materials.westernsunset.value = 5
		self.materials.scorpion.value = 5
		self.materials.cactus.value = 5
		self.materials.stained_glass.value = 5
		self.materials.bionic.value = 5
		self.materials.enlightment.value = 5
		self.materials.dimblue.value = 5
		self.materials.carpet.value = 5
		self.materials.casino.value = 5
		self.materials.plush.value = 5
		self.materials.stars.value = 5
		self.materials.still_waters.value = 5
		self.materials.sakura.value = 5
		self.materials.bamboo.value = 5
		self.materials.origami.value = 5
		self.materials.forged.value = 5
		self.materials.blooded.value = 5
		self.materials.chain_armor.value = 5
		self.materials.scale_armor.value = 5
		self.materials.flow.value = 5
		self.materials.sancti.value = 5
		self.materials.glade.value = 5
		self.materials.wade.value = 5
		self.materials.goateye.value = 5
		self.materials.flamingoeye.value = 5
		self.materials.hay.value = 5
		self.materials.tongue.value = 5
		self.materials.day.value = 5
		self.materials.houndstooth.value = 5
		self.materials.redwhite.value = 5
		self.materials.mushroom_cloud.value = 5
		self.materials.nebula.value = 5
		self.materials.planet.value = 5
		self.materials.rusty.value = 5
		self.materials.spaceship.value = 5
		self.materials.chromey.value = 5
		self.materials.devil_eye.value = 5
		self.materials.hotrod_red.value = 5
		self.materials.shiny_and_chrome.value = 5
		self.materials.club.value = 5
		self.materials.mist.value = 5
		self.materials.dog.value = 5
		self.materials.wheel.value = 5
		self.materials.oxidized_copper.value = 5
		self.materials.golden_hour.value = 5
		self.materials.red_velvet.value = 5
		self.materials.black_marble.value = 5
		self.materials.carbon_fiber_weave.value = 5
		self.materials.black_suede.value = 5
		self.materials.neon_blue.value = 5
		self.materials.underground_neon.value = 5
		self.materials.russian_camouflage.value = 5
		self.materials.ceramics_gzhel.value = 5
		self.materials.propaganda_palette.value = 5
		self.materials.tricolor.value = 5
		
	end
end
if string.lower(RequiredScript) == "lib/tweak_data/blackmarket/texturestweakdata" then
	local data = BlackMarketTweakData._init_textures
	function BlackMarketTweakData:_init_textures(tweak_data)
		data(self, tweak_data)	
		self.textures.agatha.pcs = {10, 20, 30, 40}
		self.textures.arena_logo.pcs = {10, 20, 30, 40}
		self.textures.baba_yaga.pcs = {10, 20, 30, 40}
		self.textures.banana.pcs = {10, 20, 30, 40}
		self.textures.bear_fight.pcs = {10, 20, 30, 40}
		self.textures.biker_face.pcs = {10, 20, 30, 40}
		self.textures.bsomebody.pcs = {10, 20, 30, 40}
		self.textures.bugger.pcs = {10, 20, 30, 40}
		self.textures.captainwar.pcs = {10, 20, 30, 40}
		self.textures.cards.pcs = {10, 20, 30, 40}
		self.textures.checkered_out.pcs = {10, 20, 30, 40}
		self.textures.chief.pcs = {10, 20, 30, 40}
		self.textures.chips.pcs = {10, 20, 30, 40}
		self.textures.circle_raster.pcs = {10, 20, 30, 40}
		self.textures.continental.pcs = {10, 20, 30, 40}
		self.textures.coyote.pcs = {10, 20, 30, 40}
		self.textures.cro_pattern_1.pcs = {10, 20, 30, 40}
		self.textures.cro_pattern_2.pcs = {10, 20, 30, 40}
		self.textures.cro_pattern_3.pcs = {10, 20, 30, 40}
		self.textures.cro_pattern_4.pcs = {10, 20, 30, 40}
		self.textures.daisy.pcs = {10, 20, 30, 40}
		self.textures.dazzle.pcs = {10, 20, 30, 40}
		self.textures.death.pcs = {10, 20, 30, 40}
		self.textures.deathcube.pcs = {10, 20, 30, 40}
		self.textures.deathdealer.pcs = {10, 20, 30, 40}
		self.textures.diablada.pcs = {10, 20, 30, 40}
		self.textures.dices.pcs = {10, 20, 30, 40}
		self.textures.dinoscars.pcs = {10, 20, 30, 40}
		self.textures.dinoskull.pcs = {10, 20, 30, 40}
		self.textures.dinostripes.pcs = {10, 20, 30, 40}
		self.textures.doodles.pcs = {10, 20, 30, 40}
		self.textures.emperor.pcs = {10, 20, 30, 40}
		self.textures.fenris.pcs = {10, 20, 30, 40}
		self.textures.filthythirteen.pcs = {10, 20, 30, 40}
		self.textures.fireborn.pcs = {10, 20, 30, 40}
		self.textures.flamer.pcs = {10, 20, 30, 40}
		self.textures.flammable.pcs = {10, 20, 30, 40}
		self.textures.fur.pcs = {10, 20, 30, 40}
		self.textures.giraffe.pcs = {10, 20, 30, 40}
		self.textures.goatface.pcs = {10, 20, 30, 40}
		self.textures.hawkhelm.pcs = {10, 20, 30, 40}
		self.textures.hexagons.pcs = {10, 20, 30, 40}
		self.textures.hieroglyphs.pcs = {10, 20, 30, 40}
		self.textures.hiptobepolygon.pcs = {10, 20, 30, 40}
		self.textures.hood_stripes.pcs = {10, 20, 30, 40}
		self.textures.horus.pcs = {10, 20, 30, 40}
		self.textures.hotel_pattern.pcs = {10, 20, 30, 40}
		self.textures.hotflames.pcs = {10, 20, 30, 40}
		self.textures.hotline.pcs = {10, 20, 30, 40}
		self.textures.illumigoati.pcs = {10, 20, 30, 40}
		self.textures.jimmy_phoenix.pcs = {10, 20, 30, 40}
		self.textures.koi.pcs = {10, 20, 30, 40}
		self.textures.kraken.pcs = {10, 20, 30, 40}
		self.textures.kurbits.pcs = {10, 20, 30, 40}
		self.textures.leopard.pcs = {10, 20, 30, 40}
		self.textures.liberty_flame.pcs = {10, 20, 30, 40}
		self.textures.luse.pcs = {10, 20, 30, 40}
		self.textures.mason.pcs = {10, 20, 30, 40}
		self.textures.med_pat.pcs = {10, 20, 30, 40}
		self.textures.monkeyskull.pcs = {10, 20, 30, 40}
		self.textures.muerte.pcs = {10, 20, 30, 40}
		self.textures.my_little.pcs = {10, 20, 30, 40}
		self.textures.native.pcs = {10, 20, 30, 40}
		self.textures.oneshot.pcs = {10, 20, 30, 40}
		self.textures.oni.pcs = {10, 20, 30, 40}
		self.textures.origami.pcs = {10, 20, 30, 40}
		self.textures.ornamentalcrown.pcs = {10, 20, 30, 40}
		self.textures.palmtrees.pcs = {10, 20, 30, 40}
		self.textures.pattern.pcs = {10, 20, 30, 40}
		self.textures.piety.pcs = {10, 20, 30, 40}
		self.textures.pizzaface.pcs = {10, 20, 30, 40}
		self.textures.predator.pcs = {10, 20, 30, 40}
		self.textures.prison_statement.pcs = {10, 20, 30, 40}
		self.textures.rebel.pcs = {10, 20, 30, 40}
		self.textures.red_star.pcs = {10, 20, 30, 40}
		self.textures.roman.pcs = {10, 20, 30, 40}
		self.textures.royale.pcs = {10, 20, 30, 40}
		self.textures.ruler.pcs = {10, 20, 30, 40}
		self.textures.runes.pcs = {10, 20, 30, 40}
		self.textures.russian_gamble.pcs = {10, 20, 30, 40}
		self.textures.scar_mask.pcs = {10, 20, 30, 40}
		self.textures.shutupandbleed.pcs = {10, 20, 30, 40}
		self.textures.skull_engine.pcs = {10, 20, 30, 40}
		self.textures.skull_wing.pcs = {10, 20, 30, 40}
		self.textures.smoke.pcs = {10, 20, 30, 40}
		self.textures.soundwave.pcs = {10, 20, 30, 40}
		self.textures.spartan.pcs = {10, 20, 30, 40}
		self.textures.spidereyes.pcs = {10, 20, 30, 40}
		self.textures.split.pcs = {10, 20, 30, 40}
		self.textures.squares.pcs = {10, 20, 30, 40}
		self.textures.starvr.pcs = {10, 20, 30, 40}
		self.textures.sunavatar.pcs = {10, 20, 30, 40}
		self.textures.tcn.pcs = {10, 20, 30, 40}
		self.textures.terror.pcs = {10, 20, 30, 40}
		self.textures.tire_fire.pcs = {10, 20, 30, 40}
		self.textures.totem.pcs = {10, 20, 30, 40}
		self.textures.tribalface.pcs = {10, 20, 30, 40}
		self.textures.tribalstroke.pcs = {10, 20, 30, 40}
		self.textures.tribalwave.pcs = {10, 20, 30, 40}
		self.textures.uglyrug.pcs = {10, 20, 30, 40}
		self.textures.venomous.pcs = {10, 20, 30, 40}
		self.textures.vicious.pcs = {10, 20, 30, 40}
		self.textures.warface.pcs = {10, 20, 30, 40}
		self.textures.wargod.pcs = {10, 20, 30, 40}
		self.textures.wingsofdeath.pcs = {10, 20, 30, 40}
		self.textures.youkai.pcs = {10, 20, 30, 40}

		self.textures.agatha.value = 5
		self.textures.arena_logo.value = 5
		self.textures.baba_yaga.value = 5
		self.textures.banana.value = 5
		self.textures.bear_fight.value = 5
		self.textures.biker_face.value = 5
		self.textures.bsomebody.value = 5
		self.textures.bugger.value = 5
		self.textures.captainwar.value = 5
		self.textures.cards.value = 5
		self.textures.checkered_out.value = 5
		self.textures.chief.value = 5
		self.textures.chips.value = 5
		self.textures.circle_raster.value = 5
		self.textures.continental.value = 5
		self.textures.coyote.value = 5
		self.textures.cro_pattern_1.value = 5
		self.textures.cro_pattern_2.value = 5
		self.textures.cro_pattern_3.value = 5
		self.textures.cro_pattern_4.value = 5
		self.textures.daisy.value = 5
		self.textures.dazzle.value = 5
		self.textures.death.value = 5
		self.textures.deathcube.value = 5
		self.textures.deathdealer.value = 5
		self.textures.diablada.value = 5
		self.textures.dices.value = 5
		self.textures.dinoscars.value = 5
		self.textures.dinoskull.value = 5
		self.textures.dinostripes.value = 5
		self.textures.doodles.value = 5
		self.textures.emperor.value = 5
		self.textures.fenris.value = 5
		self.textures.filthythirteen.value = 5
		self.textures.fireborn.value = 5
		self.textures.flamer.value = 5
		self.textures.flammable.value = 5
		self.textures.fur.value = 5
		self.textures.giraffe.value = 5
		self.textures.goatface.value = 5
		self.textures.hawkhelm.value = 5
		self.textures.hexagons.value = 5
		self.textures.hieroglyphs.value = 5
		self.textures.hiptobepolygon.value = 5
		self.textures.hood_stripes.value = 5
		self.textures.horus.value = 5
		self.textures.hotel_pattern.value = 5
		self.textures.hotflames.value = 5
		self.textures.hotline.value = 5
		self.textures.illumigoati.value = 5
		self.textures.jimmy_phoenix.value = 5
		self.textures.koi.value = 5
		self.textures.kraken.value = 5
		self.textures.kurbits.value = 5
		self.textures.leopard.value = 5
		self.textures.liberty_flame.value = 5
		self.textures.luse.value = 5
		self.textures.mason.value = 5
		self.textures.med_pat.value = 5
		self.textures.monkeyskull.value = 5
		self.textures.muerte.value = 5
		self.textures.my_little.value = 5
		self.textures.native.value = 5
		self.textures.oneshot.value = 5
		self.textures.oni.value = 5
		self.textures.origami.value = 5
		self.textures.ornamentalcrown.value = 5
		self.textures.palmtrees.value = 5
		self.textures.pattern.value = 5
		self.textures.piety.value = 5
		self.textures.pizzaface.value = 5
		self.textures.predator.value = 5
		self.textures.prison_statement.value = 5
		self.textures.rebel.value = 5
		self.textures.red_star.value = 5
		self.textures.roman.value = 5
		self.textures.royale.value = 5
		self.textures.ruler.value = 5
		self.textures.runes.value = 5
		self.textures.russian_gamble.value = 5
		self.textures.scar_mask.value = 5
		self.textures.shutupandbleed.value = 5
		self.textures.skull_engine.value = 5
		self.textures.skull_wing.value = 5
		self.textures.smoke.value = 5
		self.textures.soundwave.value = 5
		self.textures.spartan.value = 5
		self.textures.spidereyes.value = 5
		self.textures.split.value = 5
		self.textures.squares.value = 5
		self.textures.starvr.value = 5
		self.textures.sunavatar.value = 5
		self.textures.tcn.value = 5
		self.textures.terror.value = 5
		self.textures.tire_fire.value = 5
		self.textures.totem.value = 5
		self.textures.tribalface.value = 5
		self.textures.tribalstroke.value = 5
		self.textures.tribalwave.value = 5
		self.textures.uglyrug.value = 5
		self.textures.venomous.value = 5
		self.textures.vicious.value = 5
		self.textures.warface.value = 5
		self.textures.wargod.value = 5
		self.textures.wingsofdeath.value = 5
		self.textures.youkai.value = 5
	end
end