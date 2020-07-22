local data = NarrativeTweakData.init
function NarrativeTweakData:init(tweak_data)
    data(self, tweak_data)
	self.STARS[ 1 ] = { jcs = { 50, 40, 30, 20, 10 } } -- OK
	self.STARS[ 2 ] = { jcs = { 70, 60, 50, 40, 30, 20, 10 } } -- OK
	self.STARS[ 3 ] = { jcs = { 80, 70, 60, 50, 40, 30, 20, 10 } } -- OK
	self.STARS[ 4 ] = { jcs = { 90, 80, 70, 60, 50, 40, 30, 20, 10 } } -- OK
	self.STARS[ 5 ] = { jcs = { 100, 90, 80, 70, 60, 50, 40, 30, 20, 10 } } -- OK
	self.STARS[ 6 ] = { jcs = { 100, 90, 80, 70, 60, 50, 40, 30, 20, 10 } } -- OK
	self.STARS[ 7 ] = { jcs = { 100, 90, 80, 70, 60, 50, 40, 30, 20, 10 } } -- OK
	self.STARS[ 8 ] = { jcs = { 100, 90, 80, 70, 60, 50, 40, 30, 20, 10 } } -- OK
	self.STARS[ 9 ] = { jcs = { 100, 90, 80, 70, 60, 50, 40, 30, 20, 10 } } -- OK
	self.STARS[ 10 ] = { jcs = { 100, 90, 80, 70, 60, 50, 40, 30, 20, 10 } } -- OK
	self.HEATED_MAX_XP_MUL = 1.5
	self.FREEZING_MAX_XP_MUL = 0
	self.DEFAULT_HEAT = {this_job = -15, other_jobs = 10}
	self.contacts.classic.name_id = "heist_contact_bain"
	self.contacts.classic.hidden = true
	self.contacts.events.hidden = true
	self.contacts.the_dentist_hidden = deep_clone(self.contacts.the_dentist)
	self.contacts.the_dentist_hidden.hidden = true
	self.jobs.kenaz_pro = deep_clone(self.jobs.kenaz)
	self.jobs.kenaz.contact = "the_dentist_hidden"
	
	self.jobs.branchbank_prof.name_id = "heist_branchbank_hl"
	self.jobs.rat.contact = "classic"
	self.jobs.gallery.contact = "classic"
	self.jobs.arm_for.contact = "classic"
	
	self.jobs.arm_fac_single = deep_clone(self.jobs.arm_fac)
	self.jobs.arm_par_single = deep_clone(self.jobs.arm_par)
	self.jobs.arm_hcm_single = deep_clone(self.jobs.arm_hcm)
	self.jobs.arm_und_single = deep_clone(self.jobs.arm_und)
	self.jobs.arm_cro_single = deep_clone(self.jobs.arm_cro)
	
	self.jobs.branchbank_pro = deep_clone(self.jobs.branchbank_prof)
	
	self.jobs.arm_fac_single.contact = "classic"
	self.jobs.arm_par_single.contact = "classic"
	self.jobs.arm_hcm_single.contact = "classic"
	self.jobs.arm_und_single.contact = "classic"
	self.jobs.arm_cro_single.contact = "classic"
	
	self.jobs.branchbank_deposit.contact = "classic"
	self.jobs.branchbank_cash.contact = "classic"
	self.jobs.branchbank_gold_prof.contact = "classic"
	self.jobs.branchbank_prof.contact = "classic"
		
	self.jobs.watchdogs_wrapper_pro = {
		name_id = "heist_watchdogs",
		briefing_id = "heist_watchdogs_crimenet",
		contact = "hector",
		region = "dock",
		jc = 60,
		professional = true,
		region = "professional",
		chain = {
			self.stages.watchdogs_1_n,
			self.stages.watchdogs_2_d
		},
		briefing_event = "hct_watchdogs_brf_speak",
		debrief_event = "hct_watchdogs_debrief",
		crimenet_callouts = {
			"hct_watchdogs_cnc_01"
		},
		crimenet_videos = {
			"cn_watchdog1",
			"cn_watchdog2",
			"cn_watchdog3"
		},
		payout = {20000},
		contract_cost = {
			31000,
			62000,
			155000,
			310000,
			400000,
			400000,
			400000
		},
		contract_visuals = {}
	}
	self.jobs.watchdogs_night.load_screen = "guis/dlcs/pic/textures/loading/job_watchdogs_01"
	self.jobs.watchdogs_wrapper_pro.contract_visuals.min_mission_xp = {
		24000,
		24000,
		24000,
		24000,
		24000,
		24000,
		24000
	}
	self.jobs.watchdogs_wrapper_pro.contract_visuals.preview_image = {
		id = "watchdogs_01"
	}


	self.jobs.firestarter_pro = deep_clone(self.jobs.firestarter)
	self.jobs.alex_pro = deep_clone(self.jobs.alex)
	self.jobs.rvd_pro = deep_clone(self.jobs.rvd)
	
	self.jobs.framing_frame_pro = deep_clone(self.jobs.framing_frame)
	self.jobs.election_day_pro = deep_clone(self.jobs.election_day)
	self.jobs.mia_pro = deep_clone(self.jobs.mia)
	self.jobs.hox_pro = deep_clone(self.jobs.hox)
	self.jobs.peta_pro = deep_clone(self.jobs.peta)
	self.jobs.born_pro = deep_clone(self.jobs.born)	
	self.jobs.ukrainian_job_prof.professional = true
	self.jobs.branchbank_prof.professional = true
	self.jobs.branchbank_gold_prof.professional = true
	self.jobs.firestarter_pro.professional = true
	self.jobs.alex_pro.professional = true
	self.jobs.framing_frame_pro.professional = true
	self.jobs.welcome_to_the_jungle_wrapper_prof.professional = true
	self.jobs.election_day_pro.professional = true
	self.jobs.mia_pro.professional = true
	self.jobs.hox_pro.professional = true
	self.jobs.peta_pro.professional = true
	self.jobs.born_pro.professional = true
	self.jobs.dah.professional = true
	self.jobs.vit.professional = true
	self.jobs.kenaz_pro.professional = true
	self.jobs.rvd_pro.professional = true
	self.jobs.arm_for.professional = true
	
	
	self.jobs.ukrainian_job_prof.region = "professional"
	self.jobs.branchbank_prof.region = "professional"
	self.jobs.branchbank_gold_prof.region = "professional"
	self.jobs.firestarter_pro.region = "professional"
	self.jobs.alex_pro.region = "professional"
	self.jobs.framing_frame_pro.region = "professional"
	self.jobs.welcome_to_the_jungle_wrapper_prof.region = "professional"
	self.jobs.election_day_pro.region = "professional"
	self.jobs.mia_pro.region = "professional"
	self.jobs.hox_pro.region = "professional"
	self.jobs.peta_pro.region = "professional"
	self.jobs.born_pro.region = "professional"
	self.jobs.dah.region = "professional"
	self.jobs.vit.region = "professional"
	self.jobs.kenaz_pro.region = "professional"
	self.jobs.rvd_pro.region = "professional"

	self.jobs.arena.payout = {12800}
	self.jobs.rvd.payout = {19000}
	self.jobs.rvd_pro.payout = {21000}
	
	self.jobs.roberts.payout = {26000}
	self.jobs.rat.payout = {4000}
	self.jobs.jolly.payout = {48000}
	self.jobs.peta.payout = {128000}
	self.jobs.peta_pro.payout = {152000}
	self.jobs.moon.payout = {36000}
	self.jobs.alex_pro.payout = {20000}
	self.jobs.firestarter_pro.payout = {34000}
	self.jobs.watchdogs.payout = {10000}
	self.jobs.watchdogs_night.payout = {10000}
	self.jobs.watchdogs_wrapper.payout = {10000}
	self.jobs.mia_pro.payout = {25000}
	self.jobs.hox.payout = {125000}
	self.jobs.hox_pro.payout = {145000}
	self.jobs.big.payout = {12000}
	self.jobs.mad.payout = {80000}
	self.jobs.man.payout = {89000}
	self.jobs.pal.payout = {81000}
	self.jobs.dinner.payout = {54000}
	self.jobs.spa.payout = {112000}
	self.jobs.pbr2.payout = {46000}
	self.jobs.sah.payout = {26000}
	self.jobs.vit.payout = {246000}
	self.jobs.vit.payout = {246000}
	self.jobs.friend.payout = {52000}
	self.jobs.election_day_pro.payout = {25000}
	self.jobs.born.payout = {54000}
	self.jobs.born_pro.payout = {59000}
	self.jobs.red2.payout = {13000}
	self.jobs.fish.payout = {17000}
	
	
	self.jobs.cage.jc = 50
	self.jobs.arena.jc = 30
	self.jobs.roberts.jc = 50
	self.jobs.rvd.jc = 30
	self.jobs.rvd_pro.jc = 40
	self.jobs.rat.jc = 50
	self.jobs.family.jc = 20
	self.jobs.branchbank_prof.jc = 20
	self.jobs.branchbank_gold_prof.jc = 20
	self.jobs.branchbank_cash.jc = 10
	self.jobs.branchbank_deposit.jc = 10
	self.jobs.branchbank_pro.jc = 10
	self.jobs.kosugi.jc = 10
	self.jobs.arm_cro.jc = 50
	self.jobs.arm_fac.jc = 40
	self.jobs.arm_hcm.jc = 50
	self.jobs.arm_par.jc = 40
	self.jobs.arm_und.jc = 40
	self.jobs.arm_cro_single.jc = 50
	self.jobs.arm_fac_single.jc = 40
	self.jobs.arm_hcm_single.jc = 50
	self.jobs.arm_par_single.jc = 40
	self.jobs.arm_und_single.jc = 40
	self.jobs.gallery.jc = 50

	self.jobs.mallcrasher.jc = 40
	self.jobs.cane.jc = 30
	self.jobs.nightclub.jc = 20
	self.jobs.jolly.jc = 40
	self.jobs.peta.jc = 50
	self.jobs.peta_pro.jc = 60
	self.jobs.pines.jc = 30
	self.jobs.moon.jc = 20
	self.jobs.ukrainian_job_prof.jc = 20
	self.jobs.four_stores.jc = 10
	self.jobs.shoutout_raid.jc = 50

	self.jobs.alex.jc = 50
	self.jobs.alex_pro.jc = 60
	self.jobs.firestarter.jc = 40
	self.jobs.firestarter_pro.jc = 50
	
	self.jobs.big.jc = 50
	self.jobs.mia.jc = 30
	self.jobs.mia_pro.jc = 40
	self.jobs.kenaz.jc = 60
	self.jobs.kenaz_pro.jc = 70
	self.jobs.hox_3.jc = 20
	self.jobs.hox_pro.jc = 50
	self.jobs.hox_pro.jc = 60
	
	self.jobs.mad.jc = 50
	
	self.jobs.run.jc = 50
	self.jobs.glace.jc = 70
	self.jobs.flat.jc = 60
	self.jobs.dah.jc = 80
	self.jobs.nmh.jc = 50
	self.jobs.red2.jc = 50
	self.jobs.man.jc = 50
	self.jobs.pal.jc = 50
	self.jobs.dinner.jc = 50
	
	self.jobs.spa.jc = 40
	self.jobs.fish.jc = 40
	self.jobs.vit.jc = 90
	self.jobs.brb.jc = 30
	self.jobs.wwh.jc = 40
	self.jobs.tag.jc = 40
	self.jobs.pbr2.jc = 40
	self.jobs.pbr.jc = 50
	self.jobs.des.jc = 60

	self.jobs.crojob1.jc = 40
	self.jobs.crojob_wrapper.jc = 70
	
	self.jobs.election_day.jc = 20
	self.jobs.election_day_pro.jc = 30
	self.jobs.framing_frame_pro.jc = 60
	self.jobs.born_pro.jc = 40
	
	self.jobs.haunted.jc = 60
	self.jobs.nail.jc = 50
	self.jobs.hvh.jc = 40
	self.jobs.help.jc = 50
	
	
		
	self.jobs.arm_wrapper = deep_clone(self.jobs.arm_und)
	self.jobs.arm_wrapper.name_id = "heist_arm"
	self.jobs.arm_wrapper.chain = {}
	self.jobs.arm_wrapper.jc = 50
	self.jobs.arm_wrapper.job_wrapper = {
		"arm_fac",
		"arm_par",
		"arm_hcm",
		"arm_und",
		"arm_cro"
	}

	self.jobs.bex.jc = 40
	
	
	self._jobs_index = {
		"jewelry_store",
		"four_stores",
		"nightclub",
		"mallcrasher",
		"roberts",
		"ukrainian_job_prof",
		"branchbank_deposit",
		"branchbank_cash",
		"branchbank_prof",
		"branchbank_gold_prof",
		"branchbank_pro",
		"firestarter",
		"firestarter_pro",
		"alex",
		"alex_pro",
		"watchdogs_wrapper",
		"watchdogs_wrapper_pro",
		"watchdogs",
		"watchdogs_night",
		"framing_frame",
		"framing_frame_pro",
		"welcome_to_the_jungle_wrapper_prof",
		"welcome_to_the_jungle_prof",
		"welcome_to_the_jungle_night_prof",
		"family",
		"election_day",
		"election_day_pro",
		"kosugi",
		"arm_wrapper",
		"arm_fac_single",
		"arm_par_single",
		"arm_hcm_single",
		"arm_und_single",
		"arm_cro_single",
		"arm_fac",
		"arm_par",
		"arm_hcm",
		"arm_und",
		"arm_cro",
		"arm_for",
		"big",
		"mia",
		"mia_pro",
		"gallery",
		"hox",
		"hox_pro",
		"hox_3",
		"pines",
		"cage",
		"mus",
		"crojob1",
		"crojob_wrapper",
		"crojob2",
		"crojob2_night",
		"rat",
		"shoutout_raid",
		"arena",
		"kenaz",
		"kenaz_pro",
		"jolly",
		"red2",
		"dinner",
		"nail",
		"cane",
		"pbr",
		"pbr2",
		"peta",
		"peta_pro",
		"pal",
		"man",
		"mad",
		"dark",
		"born",
		"born_pro",
		"chill",
		"chill_combat",
		"friend",
		"flat",
		"help",
		"haunted",
		"spa",
		"fish",
		"moon",
		"run",
		"glace",
		"dah",
		"rvd",
		"rvd_pro",
		"crime_spree",
		"hvh",
		"wwh",
		"brb",
		"tag",
		"des",
		"nmh",
		"sah",
		"skm_mus",
		"skm_red2",
		"skm_run",
		"skm_watchdogs_stage2",
		"vit",
		"bph",
		"mex",
		"mex_cooking",
		"bex"
	}
end