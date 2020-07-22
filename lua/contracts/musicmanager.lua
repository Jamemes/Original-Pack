-- local data = MusicManager.jukebox_default_tracks
-- function MusicManager:jukebox_default_tracks(tweak_data)
    -- data(self, tweak_data)
	-- local default_options = {}
	-- default_options.heist_branchbank_hl = "track_03"
	-- default_options.heist_arm = "all"
	-- if managers.dlc:has_dlc_or_soundtrack_or_cce("armored_transport") then
		-- default_options.heist_arm = "track_09"
	-- end

-- end
function MusicManager:jukebox_default_tracks()
	local default_options = {
		heist_friend = "all",
		heist_nail = "track_36",
		heist_dinner = "track_35",
		heist_election_day2 = "track_05",
		heist_arm_fac = "all",
		heistlost = "resultscreen_lose",
		heist_born2 = "all",
		heist_welcome_to_the_jungle2 = "track_06",
		heist_mia2 = "all",
		heist_mia1 = "all",
		heist_crojob2 = "all",
		escape = "track_16",
		heist_nightclub = "track_05",
		heist_arm_hcm = "all",
		heist_framing_frame1 = "track_05",
		heist_moon = "track_49",
		heist_dah = "track_55",
		heist_framing_frame2 = "track_08",
		heist_roberts = "track_10",
		heist_mex = "track_65",
		heist_man = "all",
		heist_cane = "track_39",
		heist_mus = "all",
		heist_flat = "track_47_gen",
		heist_help = "track_48",
		heist_election_day1 = "track_04",
		heist_arm_for = "all",
		loadout = "loadout_music",
		heist_rat = "track_08",
		heist_family = "track_04",
		heist_arm_und = "all",
		heist_mex_cooking = "track_65",
		heist_glace = "track_53",
		heist_wwh = "track_54",
		heist_jewelry_store = "track_01",
		heist_watchdogs1 = "track_02",
		heist_born1 = "all",
		heist_rvd1 = "track_57",
		heist_rvd2 = "track_58",
		heist_des = "track_60",
		heist_pines = "track_23",
		mainmenu = "menu_music",
		credits = "criminals_ambition",
		heist_run = "track_52",
		heist_crojob1 = "all",
		heist_bph = "track_62_lcv",
		heist_nmh = "track_63",
		heist_vit = "track_64_lcv",
		heist_welcome_to_the_jungle1 = "track_04",
		heist_sah = "music_tag",
		heist_firestarter3 = "track_02",
		heist_spa = "all",
		heist_bex = "track_68",
		heist_alex1 = "track_08",
		heist_dark = "music_dark",
		heist_kenaz_full = "all",
		heist_framing_frame3 = "track_03",
		heist_alex3 = "track_02",
		heist_tag = "music_tag",
		heistfinish = "music_loot_drop",
		heist_gallery = "track_05",
		heist_mallcrasher = "track_03",
		heist_cage = "track_26",
		heist_hox_3 = "track_27",
		heist_alex2 = "track_07",
		heist_haunted = "track_22",
		heist_mad = "track_44",
		heist_fish = "music_fish",
		heist_branchbank = "track_03",
		heist_hvh = "track_56",
		heist_red2 = "track_31",
		heist_shoutout_raid = "track_28",
		heist_hox1 = "track_20",
		heist_brb = "track_59",
		heist_arm_cro = "all",
		heist_arm = "all",
		heist_pbr = "all",
		heist_big = "all",
		heist_peta2 = "all",
		heist_hox2 = "track_21",
		heist_branchbank_deposit = "track_01",
		heist_branchbank_hl = "track_03",
		heist_peta1 = "all",
		heist_arm_par = "all",
		heist_four_stores = "track_01",
		heist_pbr2 = "all",
		heist_jolly = "track_30",
		heist_ukrainian_job = "track_07",
		heist_watchdogs2 = "track_06",
		heist_branchbank_cash = "track_07",
		heistresult = "resultscreen_win",
		heist_firestarter1 = "track_08",
		heist_branchbank_gold = "track_04",
		heist_firestarter2 = "track_06",
		heist_kosugi = "kosugi_music",
		heist_pal = "all"
	}

	if managers.dlc:has_dlc_or_soundtrack_or_cce("armored_transport") then
		default_options.heist_arm_cro = "track_09"
		default_options.heist_arm_hcm = "track_09"
		default_options.heist_arm_fac = "track_09"
		default_options.heist_arm_par = "track_09"
		default_options.heist_arm_for = "track_09"
		default_options.heist_arm_und = "track_09"
		default_options.heist_arm = "track_09"
	end

	if managers.dlc:has_dlc_or_soundtrack_or_cce("big_bank") then
		default_options.heist_big = "track_14"
	end

	if managers.dlc:has_dlc_or_soundtrack_or_cce("hl_miami") then
		default_options.heist_mia1 = "track_18"
		default_options.heist_mia2 = "track_19"
	end

	if managers.dlc:has_dlc_or_soundtrack_or_cce("hope_diamond") then
		default_options.heist_mus = "track_24"
	end

	if managers.dlc:has_dlc_or_soundtrack_or_cce("the_bomb") then
		default_options.heist_crojob1 = "track_25"
		default_options.heist_crojob2 = "track_25"
	end

	if managers.dlc:has_dlc_or_soundtrack_or_cce("kenaz") then
		default_options.heist_kenaz_full = "track_29"
	end

	if managers.dlc:has_dlc_or_soundtrack_or_cce("berry") then
		default_options.heist_pbr = "track_37"
	end

	if managers.dlc:has_dlc_or_soundtrack_or_cce("berry") then
		default_options.heist_pbr2 = "track_38"
	end

	if managers.dlc:has_dlc_or_soundtrack_or_cce("peta") then
		default_options.heist_peta1 = "track_40"
		default_options.heist_peta2 = "track_41"
	end

	if managers.dlc:has_dlc_or_soundtrack_or_cce("pal") then
		default_options.heist_man = "track_43"
		default_options.heist_pal = "track_42"
	end

	if managers.dlc:has_dlc_or_soundtrack_or_cce("born") then
		default_options.heist_born1 = "track_45"
		default_options.heist_born2 = "track_46"
	end

	if managers.dlc:has_dlc_or_soundtrack_or_cce("friend") then
		default_options.heist_friend = "track_50"
	end

	if managers.dlc:has_dlc_or_soundtrack_or_cce("spa") then
		default_options.heist_spa = "track_51"
	end

	return default_options
end