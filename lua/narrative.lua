if string.lower(RequiredScript) == "lib/tweak_data/narrativetweakdata" then
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
		self.contacts.the_dentist_hidden = deep_clone(self.contacts.the_dentist)
		self.contacts.the_dentist_hidden.hidden = true
		self.contacts.classic.hidden = true
		self.contacts.events.hidden = true
		self.jobs.kenaz_pro = deep_clone(self.jobs.kenaz)
		self.jobs.kenaz.contact = "the_dentist_hidden"
		
		self.jobs.branchbank_prof.name_id = "heist_branchbank_hl"
		self.jobs.rat.contact = "classic"
		self.jobs.gallery.contact = "classic"
		self.jobs.arm_for.contact = "classic"
		
		self.jobs.arm_fac.contact = "classic"
		self.jobs.arm_par.contact = "classic"
		self.jobs.arm_hcm.contact = "classic"
		self.jobs.arm_und.contact = "classic"
		self.jobs.arm_cro.contact = "classic"
		
		self.jobs.arm_fac_single = deep_clone(self.jobs.arm_fac)
		self.jobs.arm_par_single = deep_clone(self.jobs.arm_par)
		self.jobs.arm_hcm_single = deep_clone(self.jobs.arm_hcm)
		self.jobs.arm_und_single = deep_clone(self.jobs.arm_und)
		self.jobs.arm_cro_single = deep_clone(self.jobs.arm_cro)
		
		self.jobs.branchbank_pro = deep_clone(self.jobs.branchbank_prof)
		
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
			"arm_fac_single",
			"arm_par_single",
			"arm_hcm_single",
			"arm_und_single",
			"arm_cro_single"
		}
		self.jobs.arm_wrapper.load_screen = "guis/dlcs/pic/textures/loading/job_crossroads"
		
		self.jobs.arm_wrapper.contact = "bain"
		
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
			"vit",
			"bph",
			"mex",
			"mex_cooking",
			"bex",
			"pex",
			"skm_watchdogs_stage2",
			"skm_cas",
			"skm_big2",
			"skm_mallcrasher",
			"skm_arena",
			"skm_bex",
			"skm_run",
			"skm_red2",
			"skm_mus"
		}
	end
end
if string.lower(RequiredScript) == "lib/managers/experiencemanager" then
	function ExperienceManager:get_xp_by_params(params)
		local job_id = params.job_id
		local job_stars = params.job_stars or 0
		local difficulty_stars = params.difficulty_stars or params.risk_stars or 0
		local job_and_difficulty_stars = job_stars + difficulty_stars
		local job_data = tweak_data.narrative:job_data(job_id)
		local job_mul = job_data and job_data.experience_mul and job_data.experience_mul[difficulty_stars + 1] or 1
		local success = params.success
		local num_winners = params.num_winners or 1
		local on_last_stage = params.on_last_stage
		local personal_win = params.personal_win
		local player_stars = params.player_stars or managers.experience:level_to_stars() or 0
		local level_id = params.level_id or false
		local ignore_heat = params.ignore_heat
		local current_job_stage = params.current_stage or 1
		local days_multiplier = params.professional and tweak_data:get_value("experience_manager", "pro_day_multiplier", current_job_stage) or tweak_data:get_value("experience_manager", "day_multiplier", current_job_stage)
		local pro_job_multiplier = params.professional and tweak_data:get_value("experience_manager", "pro_job_multiplier") or 1
		local ghost_multiplier = 1 + (managers.job:get_ghost_bonus() or 0)
		local total_stars = math.min(job_stars, player_stars)
		local total_difficulty_stars = difficulty_stars
		local xp_multiplier = managers.experience:get_contract_difficulty_multiplier(total_difficulty_stars)
		local contract_xp = 0
		local total_xp = 0
		local stage_xp_dissect = 0
		local job_xp_dissect = 0
		local level_limit_dissect = 0
		local risk_dissect = 0
		local failed_level_dissect = 0
		local personal_win_dissect = 0
		local alive_crew_dissect = 0
		local skill_dissect = 0
		local base_xp = 0
		local days_dissect = 0
		local job_heat_dissect = 0
		local base_heat_dissect = 0
		local risk_heat_dissect = 0
		local ghost_dissect = 0
		local ghost_base_dissect = 0
		local ghost_risk_dissect = 0
		local infamy_dissect = 0
		local extra_bonus_dissect = 0
		local gage_assignment_dissect = 0
		local mission_xp_dissect = 0
		local pro_job_xp_dissect = 0
		local bonus_xp = 0
		local bonus_mutators_dissect = 0

		if success and on_last_stage then
			job_xp_dissect = managers.experience:get_job_xp_by_stars(total_stars) * job_mul
			level_limit_dissect = level_limit_dissect + managers.experience:get_job_xp_by_stars(job_stars) * job_mul
		end

		local static_stage_experience = level_id and tweak_data.levels[level_id].static_experience
		static_stage_experience = static_stage_experience and static_stage_experience[difficulty_stars + 1]
		stage_xp_dissect = static_stage_experience or managers.experience:get_stage_xp_by_stars(total_stars)
		level_limit_dissect = level_limit_dissect + (static_stage_experience or managers.experience:get_stage_xp_by_stars(job_stars))

		if success then
			if job_id == "jewelry_store" then mission_xp_dissect = 1500 or self:mission_xp() elseif
			job_id == "four_stores" then mission_xp_dissect = 1500 or self:mission_xp() elseif
			job_id == "mallcrasher" then mission_xp_dissect = 1929 or self:mission_xp() elseif
			job_id == "roberts" then mission_xp_dissect = 9286 or self:mission_xp() elseif
			job_id == "nightclub" then mission_xp_dissect = 2857 or self:mission_xp() elseif
			job_id == "ukrainian_job_prof" then mission_xp_dissect = 2786 or self:mission_xp() elseif
			job_id == "branchbank_deposit" then mission_xp_dissect = 4571 or self:mission_xp() elseif
			job_id == "branchbank_cash" then mission_xp_dissect = 3929 or self:mission_xp() elseif
			job_id == "branchbank_prof" then mission_xp_dissect = 5500 or self:mission_xp() elseif
			job_id == "branchbank_gold_prof" then mission_xp_dissect = 5286 or self:mission_xp() elseif
			job_id == "branchbank_pro" then mission_xp_dissect = 3929 or self:mission_xp() elseif
			job_id == "firestarter" then mission_xp_dissect = 4179 or self:mission_xp() elseif
			job_id == "firestarter_pro" then mission_xp_dissect = 8214 or self:mission_xp() elseif
			job_id == "alex" then mission_xp_dissect = 7071 or self:mission_xp() elseif
			job_id == "alex_pro" then mission_xp_dissect = 9524 or self:mission_xp() elseif
			job_id == "watchdogs" then mission_xp_dissect = 9536 or self:mission_xp() elseif
			job_id == "watchdogs_night" then mission_xp_dissect = 9536 or self:mission_xp() elseif
			job_id == "watchdogs_wrapper" then mission_xp_dissect = 9536 or self:mission_xp() elseif
			job_id == "watchdogs_wrapper_pro" then mission_xp_dissect = 11429 or self:mission_xp() elseif
			job_id == "framing_frame" then mission_xp_dissect = 5714 or self:mission_xp() elseif
			job_id == "framing_frame_pro" then mission_xp_dissect = 11786 or self:mission_xp() elseif
			job_id == "welcome_to_the_jungle_wrapper_prof" then mission_xp_dissect = 13268 or self:mission_xp() elseif
			job_id == "welcome_to_the_jungle_prof" then mission_xp_dissect = 13268 or self:mission_xp() elseif
			job_id == "welcome_to_the_jungle_night_prof" then mission_xp_dissect = 13268 or self:mission_xp() elseif
			job_id == "family" then mission_xp_dissect = 3786 or self:mission_xp() elseif
			job_id == "election_day" then mission_xp_dissect = 4286 or self:mission_xp() elseif
			job_id == "election_day_pro" then mission_xp_dissect = 7500 or self:mission_xp() elseif
			job_id == "kosugi" then mission_xp_dissect = 6000 or self:mission_xp() elseif
			job_id == "arm_wrapper" then mission_xp_dissect = 7143 or self:mission_xp() elseif
			job_id == "arm_fac" then mission_xp_dissect = 7143 or self:mission_xp() elseif
			job_id == "arm_par" then mission_xp_dissect = 7143 or self:mission_xp() elseif
			job_id == "arm_hcm" then mission_xp_dissect = 15000 or self:mission_xp() elseif
			job_id == "arm_und" then mission_xp_dissect = 7857 or self:mission_xp() elseif
			job_id == "arm_cro" then mission_xp_dissect = 15714 or self:mission_xp() elseif
			job_id == "arm_for" then mission_xp_dissect = 16429 or self:mission_xp() elseif
			job_id == "big" then mission_xp_dissect = 24286 or self:mission_xp() elseif
			job_id == "mia" then mission_xp_dissect = 8214 or self:mission_xp() elseif
			job_id == "mia_pro" then mission_xp_dissect = 10000 or self:mission_xp() elseif
			job_id == "gallery" then mission_xp_dissect = 4143 or self:mission_xp() elseif
			job_id == "hox" then mission_xp_dissect = 9286 or self:mission_xp() elseif
			job_id == "hox_pro" then mission_xp_dissect = 10357 or self:mission_xp() elseif
			job_id == "hox_3" then mission_xp_dissect = 5643 or self:mission_xp() elseif
			job_id == "pines" then mission_xp_dissect = 6357 or self:mission_xp() elseif
			job_id == "cage" then mission_xp_dissect = 3714 or self:mission_xp() elseif
			job_id == "mus" then mission_xp_dissect = 6214 or self:mission_xp() elseif
			job_id == "crojob1" then mission_xp_dissect = 7000 or self:mission_xp() elseif
			job_id == "crojob_wrapper" then mission_xp_dissect = 11429 or self:mission_xp() elseif
			job_id == "crojob2" then mission_xp_dissect = 11429 or self:mission_xp() elseif
			job_id == "crojob2_night" then mission_xp_dissect = 11429 or self:mission_xp() elseif
			job_id == "rat" then mission_xp_dissect = 5643 or self:mission_xp() elseif
			job_id == "shoutout_raid" then mission_xp_dissect = 10000 or self:mission_xp() elseif
			job_id == "arena" then mission_xp_dissect = 5786 or self:mission_xp() elseif
			job_id == "kenaz" then mission_xp_dissect = 24286 or self:mission_xp() elseif
			job_id == "kenaz_pro" then mission_xp_dissect = 26286 or self:mission_xp() elseif
			job_id == "jolly" then mission_xp_dissect = 8571 or self:mission_xp() elseif
			job_id == "red2" then mission_xp_dissect = 12858 or self:mission_xp() elseif
			job_id == "dinner" then mission_xp_dissect = 15720 or self:mission_xp() elseif
			job_id == "man" then mission_xp_dissect = 9858 or self:mission_xp() elseif
			job_id == "pal" then mission_xp_dissect = 9572 or self:mission_xp() elseif
			job_id == "run" then mission_xp_dissect = 32858 or self:mission_xp() elseif
			job_id == "nmh" then mission_xp_dissect = 17142 or self:mission_xp() elseif
			job_id == "flat" then mission_xp_dissect = 18572 or self:mission_xp() elseif
			job_id == "glace" then mission_xp_dissect = 30000 or self:mission_xp() elseif
			job_id == "cane" then mission_xp_dissect = 6500 or self:mission_xp() elseif
			job_id == "pbr" then mission_xp_dissect = 15714 or self:mission_xp() elseif
			job_id == "pbr2" then mission_xp_dissect = 8571 or self:mission_xp() elseif
			job_id == "peta" then mission_xp_dissect = 8571 or self:mission_xp() elseif
			job_id == "peta_pro" then mission_xp_dissect = 12500 or self:mission_xp() elseif
			job_id == "mad" then mission_xp_dissect = 9286 or self:mission_xp() elseif
			job_id == "dark" then mission_xp_dissect = 4143 or self:mission_xp() elseif
			job_id == "born" then mission_xp_dissect = 5000 or self:mission_xp() elseif
			job_id == "born_pro" then mission_xp_dissect = 7857 or self:mission_xp() elseif
			job_id == "chill_combat" then mission_xp_dissect = 6643 or self:mission_xp() elseif
			job_id == "friend" then mission_xp_dissect = 6929 or self:mission_xp() elseif
			job_id == "nail" then mission_xp_dissect = math.random(50000) or self:mission_xp() elseif
			job_id == "help" then mission_xp_dissect = math.random(50000) or self:mission_xp() elseif
			job_id == "haunted" then mission_xp_dissect = math.random(50000) or self:mission_xp() elseif
			job_id == "hvh" then mission_xp_dissect = math.random(50000) or self:mission_xp() elseif
			job_id == "spa" then mission_xp_dissect = 12857 or self:mission_xp() elseif
			job_id == "fish" then mission_xp_dissect = 6357 or self:mission_xp() elseif
			job_id == "moon" then mission_xp_dissect = 7000 or self:mission_xp() elseif
			job_id == "dah" then mission_xp_dissect = 30000 or self:mission_xp() elseif
			job_id == "rvd" then mission_xp_dissect = 8571 or self:mission_xp() elseif
			job_id == "rvd_pro" then mission_xp_dissect = 11071 or self:mission_xp() elseif
			job_id == "wwh" then mission_xp_dissect = 6714 or self:mission_xp() elseif
			job_id == "brb" then mission_xp_dissect = 6214 or self:mission_xp() elseif
			job_id == "tag" then mission_xp_dissect = 4357 or self:mission_xp() elseif
			job_id == "des" then mission_xp_dissect = 22857 or self:mission_xp() elseif
			job_id == "sah" then mission_xp_dissect = 5929 or self:mission_xp() elseif
			job_id == "bph" then mission_xp_dissect = 10000 or self:mission_xp() elseif
			job_id == "mex" then mission_xp_dissect = 9286 or self:mission_xp() elseif
			job_id == "mex_cooking" then mission_xp_dissect = 4643 or self:mission_xp() elseif
			job_id == "bex" then mission_xp_dissect = 9286 or self:mission_xp() elseif
			job_id == "pex" then mission_xp_dissect = 5786 or self:mission_xp() elseif
			job_id == "safehouse" then mission_xp_dissect = 1000 or self:mission_xp() elseif
			job_id == "short1" then mission_xp_dissect = 1000 or self:mission_xp() elseif
			job_id == "short2" then mission_xp_dissect = 2000 or self:mission_xp() elseif
			job_id == "skm_red2" or "skm_mus" or "skm_run" or "skm_watchdogs_stage2" or "skm_cas" or "skm_big2" or "skm_mallcrasher" or "skm_arena" or "skm_bex" then mission_xp_dissect = params.mission_xp or self:mission_xp() elseif
			job_id == "vit" then mission_xp_dissect = 50000 or self:mission_xp() else
			mission_xp_dissect = 0 or self:mission_xp() end
		end
		
		base_xp = job_xp_dissect + stage_xp_dissect + mission_xp_dissect
		pro_job_xp_dissect = math.round(base_xp * pro_job_multiplier - base_xp)
		base_xp = base_xp + pro_job_xp_dissect
		days_dissect = math.round(base_xp * days_multiplier - base_xp)
		local is_level_limited = player_stars < job_stars

		if is_level_limited then
			local diff_in_stars = job_stars - player_stars
			local tweak_multiplier = tweak_data:get_value("experience_manager", "level_limit", "pc_difference_multipliers", diff_in_stars) or 0
			local old_base_xp = base_xp
			base_xp = math.round(base_xp * tweak_multiplier)
			level_limit_dissect = base_xp - old_base_xp
		end

		contract_xp = base_xp
		risk_dissect = math.round(contract_xp * xp_multiplier)
		contract_xp = contract_xp + risk_dissect

		if not success then
			local multiplier = tweak_data:get_value("experience_manager", "stage_failed_multiplier") or 1
			failed_level_dissect = math.round(contract_xp * multiplier - contract_xp)
			contract_xp = contract_xp + failed_level_dissect
		elseif not personal_win then
			local multiplier = tweak_data:get_value("experience_manager", "in_custody_multiplier") or 1
			personal_win_dissect = math.round(contract_xp * multiplier - contract_xp)
			contract_xp = contract_xp + personal_win_dissect
		end

		total_xp = contract_xp
		local total_contract_xp = total_xp
		bonus_xp = managers.player:get_skill_exp_multiplier(managers.groupai and managers.groupai:state():whisper_mode())
		skill_dissect = math.round(total_contract_xp * bonus_xp - total_contract_xp)
		total_xp = total_xp + skill_dissect
		bonus_xp = managers.player:get_infamy_exp_multiplier()
		infamy_dissect = math.round(total_contract_xp * bonus_xp - total_contract_xp)
		total_xp = total_xp + infamy_dissect
		bonus_xp = tweak_data:get_value("experience_manager", "limited_bonus_multiplier") or 1
		extra_bonus_dissect = math.round(total_contract_xp * bonus_xp - total_contract_xp)
		total_xp = total_xp + extra_bonus_dissect

		if success then
			local num_players_bonus = num_winners and tweak_data:get_value("experience_manager", "alive_humans_multiplier", num_winners) or 1
			alive_crew_dissect = math.round(total_contract_xp * num_players_bonus - total_contract_xp)
			total_xp = total_xp + alive_crew_dissect
		end

		bonus_xp = managers.gage_assignment:get_current_experience_multiplier()
		gage_assignment_dissect = math.round(total_contract_xp * bonus_xp - total_contract_xp)
		total_xp = total_xp + gage_assignment_dissect
		ghost_dissect = math.round(total_xp * ghost_multiplier - total_xp)
		total_xp = total_xp + ghost_dissect
		local heat_xp_mul = ignore_heat and 1 or math.max(managers.job:get_job_heat_multipliers(job_id), 0)
		job_heat_dissect = math.round(total_xp * heat_xp_mul - total_xp)
		total_xp = total_xp + job_heat_dissect
		local bonus_mutators_dissect = total_xp * managers.mutators:get_experience_reduction() * -1
		total_xp = total_xp + bonus_mutators_dissect
		local dissection_table = {
			bonus_risk = math.round(risk_dissect),
			bonus_num_players = math.round(alive_crew_dissect),
			bonus_failed = math.round(failed_level_dissect),
			bonus_low_level = math.round(level_limit_dissect),
			bonus_skill = math.round(skill_dissect),
			bonus_days = math.round(days_dissect),
			bonus_pro_job = math.round(pro_job_xp_dissect),
			bonus_infamy = math.round(infamy_dissect),
			bonus_extra = math.round(extra_bonus_dissect),
			in_custody = math.round(personal_win_dissect),
			heat_xp = math.round(job_heat_dissect),
			bonus_ghost = math.round(ghost_dissect),
			bonus_gage_assignment = math.round(gage_assignment_dissect),
			bonus_mission_xp = math.round(mission_xp_dissect),
			bonus_mutators = math.round(bonus_mutators_dissect),
			stage_xp = math.round(stage_xp_dissect),
			job_xp = math.round(job_xp_dissect),
			base = math.round(base_xp),
			total = math.round(total_xp),
			last_stage = on_last_stage
		}

		if Application:production_build() then
			local rounding_error = dissection_table.total - (dissection_table.stage_xp + dissection_table.job_xp + dissection_table.bonus_risk + dissection_table.bonus_num_players + dissection_table.bonus_failed + dissection_table.bonus_skill + dissection_table.bonus_days + dissection_table.heat_xp + dissection_table.bonus_infamy + dissection_table.bonus_ghost + dissection_table.bonus_gage_assignment + dissection_table.bonus_mission_xp + dissection_table.bonus_low_level)
			dissection_table.rounding_error = rounding_error
		else
			dissection_table.rounding_error = 0
		end

		return math.round(total_xp), dissection_table
	end
end
if string.lower(RequiredScript) == "lib/tweak_data/preplanningtweakdata" then
	local data = PrePlanningTweakData.init
	function PrePlanningTweakData:init(tweak_data)
		data(self, tweak_data)
		self.types.escape_c4_loud.budget_cost = 6
		self.types.escape_elevator_loud.budget_cost = 6
		self.types.vault_thermite.budget_cost = 8
	end
end
if string.lower(RequiredScript) == "lib/tweak_data/assetstweakdata" then
	local data = AssetsTweakData.init
	function AssetsTweakData:init(tweak_data)
		data(self, tweak_data)
		self.risk_sm_wish.risk_lock = 5
		self.risk_death_wish.risk_lock = 6
	end
end
if string.lower(RequiredScript) == "lib/tweak_data/missiondoortweakdata" then
	local data = MissionDoorTweakData.init
	function MissionDoorTweakData:init(tweak_data)
		data(self, tweak_data)
		self.train_cargo_door.devices.drill = {
		{
			align = "a_drill",
			unit = Idstring("units/payday2/equipment/item_door_drill_small/item_door_drill_small"),
			can_jam = true,
			timer = 180
		}
	}	
	end
end
if string.lower(RequiredScript) == "lib/managers/musicmanager" then
	local data = MusicManager.jukebox_default_tracks
	function MusicManager:jukebox_default_tracks()
			local default_options = data()
			default_options.heist_branchbank_hl = "track_03"
		return default_options
	end
end
if string.lower(RequiredScript) == "core/lib/managers/mission/coreelementrandom" then
	core:module("CoreElementRandom")
	core:import("CoreMissionScriptElement")
	core:import("CoreTable")

	ElementRandom = ElementRandom or class(CoreMissionScriptElement.MissionScriptElement)

	if not Global.game_settings or not Global.game_settings.level_id == "framing_frame_1" or not Global.game_settings.level_id == "gallery" or not ElementRandom then
		return
	end

	local _F_ElementRandom_on_executed = ElementRandom.on_executed

	function ElementRandom:on_executed(...)
		if Global.game_settings and Global.game_settings.level_id == "gallery" and self._id and self._id == 100515 then
			if not self._values.enabled then
				return
			end
			self._unused_randoms = {}
			for i, element_data in ipairs(self._original_on_executed) do
				if not self._values.ignore_disabled or self._values.ignore_disabled and self:get_mission_element(element_data.id):enabled() then
					table.insert(self._unused_randoms, i)
				end
			end
			self._values.on_executed = {}
			local amount = 5 + math.random(4)
			for i = 1, math.min(amount, #self._original_on_executed) do
				table.insert(self._values.on_executed, self._original_on_executed[self:_get_random_elements()])
			end
			ElementRandom.super.on_executed(self, ...)
			return
		end
		if Global.game_settings and Global.game_settings.level_id == "framing_frame_1" and self._id and self._id == 100515 then
			if not self._values.enabled then
				return
			end
			self._unused_randoms = {}
			for i, element_data in ipairs(self._original_on_executed) do
				if not self._values.ignore_disabled or self._values.ignore_disabled and self:get_mission_element(element_data.id):enabled() then
					table.insert(self._unused_randoms, i)
				end
			end
			self._values.on_executed = {}
			local amount = 5 + math.random(4)
			for i = 1, math.min(amount, #self._original_on_executed) do
				table.insert(self._values.on_executed, self._original_on_executed[self:_get_random_elements()])
			end
			ElementRandom.super.on_executed(self, ...)
			return
		end
		return _F_ElementRandom_on_executed(self, ...)
	end
end
if string.lower(RequiredScript) == "lib/units/interactions/interactionext" then

    local BaseInteractionExt_original = BaseInteractionExt.interact
    function BaseInteractionExt:interact(player)

	    if not self:can_interact(player) then BaseInteractionExt_original(self, player) return end
		if Global.game_settings and 
		Global.game_settings.level_id == "arm_fac" or
		Global.game_settings.level_id == "arm_par" or
		Global.game_settings.level_id == "arm_hcm" or
		Global.game_settings.level_id == "arm_und" or
		Global.game_settings.level_id == "arm_cro" then
			if self.tweak_data == "take_confidential_folder_event" then
				managers.job:set_next_interupt_stage("arm_for")
			end
		end

	    BaseInteractionExt_original(self, player)
    end

elseif string.lower(RequiredScript) == "lib/network/handlers/unitnetworkhandler" then

    local _o_sync_teammate_progress = UnitNetworkHandler.sync_teammate_progress
    function UnitNetworkHandler:sync_teammate_progress(type_index, enabled, tweak_data_id, timer, success, sender)
	    _o_sync_teammate_progress(self, type_index, enabled, tweak_data_id, timer, success, sender)
		if Global.game_settings and 
		Global.game_settings.level_id == "arm_fac" or
		Global.game_settings.level_id == "arm_par" or
		Global.game_settings.level_id == "arm_hcm" or
		Global.game_settings.level_id == "arm_und" or
		Global.game_settings.level_id == "arm_cro" then
			if tweak_data_id == "take_confidential_folder_event" and success == true then
				managers.job:set_next_interupt_stage("arm_for")
			end
		end
    end
end
if RequiredScript == 'lib/managers/group_ai_states/groupaistatebase' then
	local id = Global.game_settings.level_id
	function GroupAIStateBase:set_reason_called(called_reason)
		self._called_reason = self._called_reason or called_reason
		if not managers.job:is_current_job_professional() then
			if Global.game_settings.job_plan == 2 then
				if id == "kosugi" or
				id == "cage" or
				id == "dark" or
				id == "fish" or
				id == "tag" or
				id == "election_day_3" or
				id == "election_day_3_skip1" or
				id == "election_day_3_skip2" or
				id == "welcome_to_the_jungle_2" or
				id == "watchdogs_1" or
				id == "watchdogs_2" or
				id == "watchdogs_1_night" or
				id == "watchdogs_2_day" or
				id == "alex_1" or
				id == "alex_2" or
				id == "alex_3" or
				id == "escape_cafe" or
				id == "escape_park" or
				id == "escape_cafe_day" or
				id == "escape_park_day" or
				id == "escape_street" or
				id == "escape_overpass" or
				id == "escape_garage" or
				id == "escape_overpass_night" or
				id == "arm_fac" or
				id == "arm_par" or
				id == "arm_hcm" or
				id == "arm_cro" or
				id == "arm_und" or
				id == "mia_1" or
				id == "mia_2" or
				id == "mia2_new" or
				id == "hox_1" or
				id == "hox_2" or
				id == "pines" or
				id == "crojob3" or
				id == "crojob3_night" or
				id == "rat" or
				id == "shoutout_raid" or
				id == "driving_escapes_industry_day" or
				id == "driving_escapes_city_day" or
				id == "jolly" or
				id == "cane" or
				id == "dinner" or
				id == "pbr" or
				id == "pbr2" or
				id == "peta" or
				id == "peta2" or
				id == "pal" or
				id == "nail" or
				id == "man" or
				id == "mad" or
				id == "born" or
				id == "chew" or
				id == "flat" or
				id == "help" or
				id == "haunted" or
				id == "moon" or
				id == "spa" or
				id == "run" or
				id == "glace" or
				id == "rvd1" or
				id == "rvd2" or
				id == "hvh" or
				id == "wwh" or
				id == "brb" or
				id == "des" or
				id == "nmh" or
				id == "bph" or
				id == "mex_cooking" then
				elseif id == "framing_frame_1" or
				id == "framing_frame_2" or
				id == "election_day_1" or
				id == "election_day_2" or
				id == "firestarter_1" or
				id == "firestarter_2" or
				id == "firestarter_3" or
				id == "ukrainian_job" or
				id == "four_stores" or
				id == "mallcrasher" or
				id == "nightclub" or
				id == "branchbank" or
				id == "crojob2" or
				id == "arm_for" or
				id == "big" or
				id == "gallery" or
				id == "kenaz" or
				id == "red2" or
				id == "friend" or
				id == "sah" or
				id == "pex" or
				id == "mex" or
				id == "bex" then
					managers.chat:feed_system_message(ChatManager.GAME, managers.localization:text("ingame_restart_available") or "Offline")
				else
					managers.vote:_restart_counter()
				end
			end
		end
	end
elseif RequiredScript == 'lib/managers/chatmanager' then
	local id = Global.game_settings.level_id
	local restart = {"!r*", "!re*", "!res*", "!rest*", "!resta*", "!restar*", "!restart*"}
	local _receive_message_original = ChatManager._receive_message
	function ChatManager:_receive_message(channel_id, name, message, ...)
		for i, msg in ipairs(restart) do
			if message:match("^" .. msg .. "$") then
				if not managers.groupai:state():whisper_mode() then
					if Global.game_settings.job_plan == 2 then
						if not managers.job:is_current_job_professional() then
							if id == "framing_frame_1" or
							id == "framing_frame_2" or
							id == "election_day_1" or
							id == "election_day_2" or
							id == "firestarter_1" or
							id == "firestarter_2" or
							id == "firestarter_3" or
							id == "ukrainian_job" or
							id == "four_stores" or
							id == "mallcrasher" or
							id == "nightclub" or
							id == "branchbank" or
							id == "crojob2" or
							id == "arm_for" or
							id == "big" or
							id == "gallery" or
							id == "kenaz" or
							id == "red2" or
							id == "friend" or
							id == "sah" or
							id == "pex" or
							id == "mex" or
							id == "bex" then
								managers.vote:_restart_counter()
							end
						end
					end
				end
			end
		end
		return _receive_message_original(self, channel_id, name, message, ...)
	end
end