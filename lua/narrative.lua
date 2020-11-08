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
		
		self.contacts.classic.hidden = true
		self.contacts.events.hidden = true
		self.contacts.the_dentist_hidden.hidden = true
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
		
		self.jobs.kosugi_pro = deep_clone(self.jobs.kosugi)
		
		self.jobs.branchbank_deposit.contact = "classic"
		self.jobs.branchbank_cash.contact = "classic"
		self.jobs.branchbank_gold_prof.contact = "classic"
		self.jobs.branchbank_prof.contact = "classic"
		self.jobs.kosugi_pro.contact = "classic"
			
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
		self.jobs.kosugi_pro.professional = true
		
		
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
		self.jobs.kosugi_pro.region = "professional"

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
		self.jobs.dah.payout = {5000}
		
		
		self.jobs.cage.jc = 50
		self.jobs.arena.jc = 40
		self.jobs.roberts.jc = 50
		self.jobs.rvd.jc = 40
		self.jobs.rvd_pro.jc = 50
		self.jobs.rat.jc = 50
		self.jobs.family.jc = 20
		self.jobs.branchbank_prof.jc = 50
		self.jobs.branchbank_gold_prof.jc = 30
		self.jobs.branchbank_cash.jc = 20
		self.jobs.branchbank_deposit.jc = 20
		self.jobs.branchbank_pro.jc = 10
		self.jobs.kosugi.jc = 10
		self.jobs.kosugi_pro.jc = 50
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
		self.jobs.mia.jc = 40
		self.jobs.mia_pro.jc = 50
		self.jobs.kenaz.jc = 60
		self.jobs.kenaz_pro.jc = 70
		self.jobs.hox_3.jc = 30
		self.jobs.hox.jc = 50
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
		self.jobs.fish.jc = 50
		
		self.jobs.vit.jc = 90
		self.jobs.brb.jc = 30
		self.jobs.brb.jc = 60
		self.jobs.wwh.jc = 40
		self.jobs.tag.jc = 40
		self.jobs.pbr2.jc = 50
		self.jobs.pbr.jc = 60
		self.jobs.des.jc = 60
		self.jobs.sah.jc = 20

		self.jobs.crojob1.jc = 40
		self.jobs.crojob_wrapper.jc = 70
		self.jobs.friend.jc = 60
		
		self.jobs.election_day.jc = 30
		self.jobs.election_day_pro.jc = 40
		self.jobs.framing_frame_pro.jc = 60
		self.jobs.born_pro.jc = 40
		
		local rarity = {
			1, 1, 1, 1, 1, 1, 1, 1, 1,
			2, 2, 2, 2, 2, 2, 2, 2,
			3, 3, 3, 3, 3, 3, 3,
			4, 4, 4, 4, 4, 4,
			5, 5, 5, 5, 5,
			6, 6, 6, 6,
			7, 7, 7,
			8, 8,
			9
		}
		self.jobs.haunted.jc = rarity[math.random(45)] * 10
		self.jobs.nail.jc = rarity[math.random(45)] * 10
		self.jobs.hvh.jc = rarity[math.random(45)] * 10
		self.jobs.help.jc = rarity[math.random(45)] * 10
		
		local rand = {true, false, false, false, false}
		self.jobs.haunted.professional = rand[math.random(5)]
		self.jobs.nail.professional = rand[math.random(5)]
		self.jobs.hvh.professional = rand[math.random(5)]
		self.jobs.help.professional = rand[math.random(5)]
		
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
			"kosugi_pro",
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
		local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
		local difficulty_index = tweak_data:difficulty_to_index(difficulty)
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
		local killed_civs_dissect = 0
		local loose_money_dissect = 0
		local easy_mode_dissect = 0

		if success and on_last_stage then
			job_xp_dissect = managers.experience:get_job_xp_by_stars(total_stars) * job_mul
			level_limit_dissect = level_limit_dissect + managers.experience:get_job_xp_by_stars(job_stars) * job_mul
		end

		local static_stage_experience = level_id and tweak_data.levels[level_id].static_experience
		static_stage_experience = static_stage_experience and static_stage_experience[difficulty_stars + 1]
		stage_xp_dissect = static_stage_experience or managers.experience:get_stage_xp_by_stars(total_stars)
		level_limit_dissect = level_limit_dissect + (static_stage_experience or managers.experience:get_stage_xp_by_stars(job_stars))

		if success then
			if job_id == "skm_watchdogs_stage2"				then mission_xp_dissect = 20000 * (managers.skirmish:current_wave_number() or 9)	 or self:mission_xp() elseif
			job_id == "skm_cas"								then mission_xp_dissect = 20000 * (managers.skirmish:current_wave_number() or 9)	 or self:mission_xp() elseif
			job_id == "skm_big2"							then mission_xp_dissect = 20000 * (managers.skirmish:current_wave_number() or 9)	 or self:mission_xp() elseif
			job_id == "skm_mallcrasher"						then mission_xp_dissect = 20000 * (managers.skirmish:current_wave_number() or 9)	 or self:mission_xp() elseif
			job_id == "skm_arena"							then mission_xp_dissect = 20000 * (managers.skirmish:current_wave_number() or 9)	 or self:mission_xp() elseif
			job_id == "skm_bex"								then mission_xp_dissect = 20000 * (managers.skirmish:current_wave_number() or 9)	 or self:mission_xp() elseif
			job_id == "skm_run"								then mission_xp_dissect = 20000 * (managers.skirmish:current_wave_number() or 9)	 or self:mission_xp() elseif
			job_id == "skm_red2"							then mission_xp_dissect = 20000 * (managers.skirmish:current_wave_number() or 9)	 or self:mission_xp() elseif
			job_id == "skm_mus"								then mission_xp_dissect = 20000 * (managers.skirmish:current_wave_number() or 9)	 or self:mission_xp() elseif
			job_id == "jewelry_store"						then mission_xp_dissect = 1500	 or self:mission_xp() elseif
			job_id == "four_stores"							then mission_xp_dissect = 1500	 or self:mission_xp() elseif
			job_id == "mallcrasher"							then mission_xp_dissect = 1929	 or self:mission_xp() elseif
			job_id == "roberts"								then mission_xp_dissect = 18572	 or self:mission_xp() elseif
			job_id == "nightclub"							then mission_xp_dissect = 2857	 or self:mission_xp() elseif
			job_id == "ukrainian_job_prof"					then mission_xp_dissect = 2786	 or self:mission_xp() elseif
			job_id == "branchbank_deposit"					then mission_xp_dissect = 4571	 or self:mission_xp() elseif
			job_id == "branchbank_cash"						then mission_xp_dissect = 3929	 or self:mission_xp() elseif
			job_id == "branchbank_prof"						then mission_xp_dissect = 5500	 or self:mission_xp() elseif
			job_id == "branchbank_gold_prof"				then mission_xp_dissect = 5286	 or self:mission_xp() elseif
			job_id == "branchbank_pro"						then mission_xp_dissect = 3929	 or self:mission_xp() elseif
			job_id == "firestarter"							then mission_xp_dissect = 4179	 or self:mission_xp() elseif
			job_id == "firestarter_pro"						then mission_xp_dissect = 8214	 or self:mission_xp() elseif
			job_id == "alex"								then mission_xp_dissect = 7071	 or self:mission_xp() elseif
			job_id == "alex_pro"							then mission_xp_dissect = 9524	 or self:mission_xp() elseif
			job_id == "watchdogs"							then mission_xp_dissect = 9536	 or self:mission_xp() elseif
			job_id == "watchdogs_night"						then mission_xp_dissect = 9536	 or self:mission_xp() elseif
			job_id == "watchdogs_wrapper"					then mission_xp_dissect = 9536	 or self:mission_xp() elseif
			job_id == "watchdogs_wrapper_pro"				then mission_xp_dissect = 11429	 or self:mission_xp() elseif
			job_id == "framing_frame"						then mission_xp_dissect = 5714	 or self:mission_xp() elseif
			job_id == "framing_frame_pro"					then mission_xp_dissect = 11786	 or self:mission_xp() elseif
			job_id == "welcome_to_the_jungle_wrapper_prof"	then mission_xp_dissect = 13268	 or self:mission_xp() elseif
			job_id == "welcome_to_the_jungle_prof"			then mission_xp_dissect = 13268	 or self:mission_xp() elseif
			job_id == "welcome_to_the_jungle_night_prof"	then mission_xp_dissect = 13268	 or self:mission_xp() elseif
			job_id == "family"								then mission_xp_dissect = 3786	 or self:mission_xp() elseif
			job_id == "election_day"						then mission_xp_dissect = 4286	 or self:mission_xp() elseif
			job_id == "election_day_pro"					then mission_xp_dissect = 7500	 or self:mission_xp() elseif
			job_id == "kosugi"								then mission_xp_dissect = 6000	 or self:mission_xp() elseif
			job_id == "kosugi_pro"							then mission_xp_dissect = 9000	 or self:mission_xp() elseif
			job_id == "arm_wrapper"							then mission_xp_dissect = 7143	 or self:mission_xp() elseif
			job_id == "arm_fac_single"						then mission_xp_dissect = 7143	 or self:mission_xp() elseif
			job_id == "arm_par_single"						then mission_xp_dissect = 7143	 or self:mission_xp() elseif
			job_id == "arm_hcm_single"						then mission_xp_dissect = 15000	 or self:mission_xp() elseif
			job_id == "arm_und_single"						then mission_xp_dissect = 7857	 or self:mission_xp() elseif
			job_id == "arm_cro_single"						then mission_xp_dissect = 15714	 or self:mission_xp() elseif
			job_id == "arm_fac"								then mission_xp_dissect = 7143	 or self:mission_xp() elseif
			job_id == "arm_par"								then mission_xp_dissect = 7143	 or self:mission_xp() elseif
			job_id == "arm_hcm"								then mission_xp_dissect = 15000	 or self:mission_xp() elseif
			job_id == "arm_und"								then mission_xp_dissect = 7857	 or self:mission_xp() elseif
			job_id == "arm_cro"								then mission_xp_dissect = 15714	 or self:mission_xp() elseif
			job_id == "arm_for"								then mission_xp_dissect = 32858	 or self:mission_xp() elseif
			job_id == "big"									then mission_xp_dissect = 29143	 or self:mission_xp() elseif
			job_id == "mia"									then mission_xp_dissect = 8214	 or self:mission_xp() elseif
			job_id == "mia_pro"								then mission_xp_dissect = 10000	 or self:mission_xp() elseif
			job_id == "gallery"								then mission_xp_dissect = 4143	 or self:mission_xp() elseif
			job_id == "hox"									then mission_xp_dissect = 9286	 or self:mission_xp() elseif
			job_id == "hox_pro"								then mission_xp_dissect = 10357	 or self:mission_xp() elseif
			job_id == "hox_3"								then mission_xp_dissect = 8464	 or self:mission_xp() elseif
			job_id == "pines"								then mission_xp_dissect = 12714	 or self:mission_xp() elseif
			job_id == "cage"								then mission_xp_dissect = 3714	 or self:mission_xp() elseif
			job_id == "mus"									then mission_xp_dissect = 12428	 or self:mission_xp() elseif
			job_id == "crojob1"								then mission_xp_dissect = 14000	 or self:mission_xp() elseif
			job_id == "crojob_wrapper"						then mission_xp_dissect = 28572	 or self:mission_xp() elseif
			job_id == "crojob2"								then mission_xp_dissect = 28572	 or self:mission_xp() elseif
			job_id == "crojob2_night"						then mission_xp_dissect = 28572	 or self:mission_xp() elseif
			job_id == "rat"									then mission_xp_dissect = 5643	 or self:mission_xp() elseif
			job_id == "shoutout_raid"						then mission_xp_dissect = 20000	 or self:mission_xp() elseif
			job_id == "arena"								then mission_xp_dissect = 11572	 or self:mission_xp() elseif
			job_id == "kenaz"								then mission_xp_dissect = 24286	 or self:mission_xp() elseif
			job_id == "kenaz_pro"							then mission_xp_dissect = 26286	 or self:mission_xp() elseif
			job_id == "jolly"								then mission_xp_dissect = 17142	 or self:mission_xp() elseif
			job_id == "red2"								then mission_xp_dissect = 25716	 or self:mission_xp() elseif
			job_id == "dinner"								then mission_xp_dissect = 23580	 or self:mission_xp() elseif
			job_id == "man"									then mission_xp_dissect = 19716	 or self:mission_xp() elseif
			job_id == "pal"									then mission_xp_dissect = 19144	 or self:mission_xp() elseif
			job_id == "run"									then mission_xp_dissect = 32858	 or self:mission_xp() elseif
			job_id == "nmh"									then mission_xp_dissect = 34284	 or self:mission_xp() elseif
			job_id == "flat"								then mission_xp_dissect = 18572	 or self:mission_xp() elseif
			job_id == "glace"								then mission_xp_dissect = 30000	 or self:mission_xp() elseif
			job_id == "cane"								then mission_xp_dissect = 13000	 or self:mission_xp() elseif
			job_id == "pbr"									then mission_xp_dissect = 23571	 or self:mission_xp() elseif
			job_id == "pbr2"								then mission_xp_dissect = 12856	 or self:mission_xp() elseif
			job_id == "peta"								then mission_xp_dissect = 8571	 or self:mission_xp() elseif
			job_id == "peta_pro"							then mission_xp_dissect = 12500	 or self:mission_xp() elseif
			job_id == "mad"									then mission_xp_dissect = 13929	 or self:mission_xp() elseif
			job_id == "dark"								then mission_xp_dissect = 4143	 or self:mission_xp() elseif
			job_id == "born"								then mission_xp_dissect = 10000	 or self:mission_xp() elseif
			job_id == "born_pro"							then mission_xp_dissect = 15714	 or self:mission_xp() elseif
			job_id == "chill_combat"						then mission_xp_dissect = 6643	 or self:mission_xp() elseif
			job_id == "friend"								then mission_xp_dissect = 20787	 or self:mission_xp() elseif
			job_id == "spa"									then mission_xp_dissect = 12857	 or self:mission_xp() elseif
			job_id == "fish"								then mission_xp_dissect = 9535	 or self:mission_xp() elseif
			job_id == "moon"								then mission_xp_dissect = 14000	 or self:mission_xp() elseif
			job_id == "dah"									then mission_xp_dissect = 30000	 or self:mission_xp() elseif
			job_id == "rvd"									then mission_xp_dissect = 8571	 or self:mission_xp() elseif
			job_id == "rvd_pro"								then mission_xp_dissect = 11071	 or self:mission_xp() elseif
			job_id == "wwh"									then mission_xp_dissect = 13428	 or self:mission_xp() elseif
			job_id == "brb"									then mission_xp_dissect = 12428	 or self:mission_xp() elseif
			job_id == "tag"									then mission_xp_dissect = 8714	 or self:mission_xp() elseif
			job_id == "des"									then mission_xp_dissect = 34285	 or self:mission_xp() elseif
			job_id == "sah"									then mission_xp_dissect = 8893	 or self:mission_xp() elseif
			job_id == "bph"									then mission_xp_dissect = 30000	 or self:mission_xp() elseif
			job_id == "mex"									then mission_xp_dissect = 9286	 or self:mission_xp() elseif
			job_id == "mex_cooking"							then mission_xp_dissect = 4643	 or self:mission_xp() elseif
			job_id == "bex"									then mission_xp_dissect = 9286	 or self:mission_xp() elseif
			job_id == "pex"									then mission_xp_dissect = 5786	 or self:mission_xp() elseif
			job_id == "safehouse"							then mission_xp_dissect = 1000	 or self:mission_xp() elseif
			job_id == "short1"								then mission_xp_dissect = 1000	 or self:mission_xp() elseif
			job_id == "short2"								then mission_xp_dissect = 2000	 or self:mission_xp() elseif
			job_id == "vit"									then mission_xp_dissect = 50000	 or self:mission_xp() elseif
			job_id == "nail"								then mission_xp_dissect = tweak_data.narrative:job_data(job_id).jc * math.random(600)	 or self:mission_xp() elseif
			job_id == "help"								then mission_xp_dissect = tweak_data.narrative:job_data(job_id).jc * math.random(600)	 or self:mission_xp() elseif
			job_id == "haunted"								then mission_xp_dissect = tweak_data.narrative:job_data(job_id).jc * math.random(600)	 or self:mission_xp() elseif
			job_id == "hvh"									then mission_xp_dissect = tweak_data.narrative:job_data(job_id).jc * math.random(600)	 or self:mission_xp() else
			mission_xp_dissect = params.mission_xp or self:mission_xp() end
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

		local loose_money = math.floor(managers.loot:get_real_total_small_loot_value() / tweak_data.loose_money_exp_convertation_amount) >= tweak_data.max_loose_money_boost and tweak_data.max_loose_money_boost or math.floor(managers.loot:get_real_total_small_loot_value() / tweak_data.loose_money_exp_convertation_amount)
		bonus_xp = 1 + (loose_money * 0.01) or 1
		loose_money_dissect = math.round(total_xp * bonus_xp - total_xp)
		total_xp = total_xp + loose_money_dissect
		
		bonus_xp = Global.game_settings.one_down and (tweak_data.easy_mode_exp_penalty >= 100 and 0 or 1 - (tweak_data.easy_mode_exp_penalty * 0.01)) or 1
		local easy_mode_dissect = math.round(total_xp * bonus_xp - total_xp)
		total_xp = total_xp + easy_mode_dissect
		
		local mul = difficulty_index < 5 and tweak_data.killed_civs_penalty[1] * 0.01 or difficulty_index < 6 and tweak_data.killed_civs_penalty[2] * 0.01 or tweak_data.killed_civs_penalty[3] * 0.01
		local killed_mul = managers.statistics:session_total_civilian_kills() * mul
		bonus_xp = killed_mul >= 1 and 0 or 1 - killed_mul
		local killed_civs_dissect = math.round(total_xp * bonus_xp - total_xp)
		total_xp = total_xp + killed_civs_dissect
		
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
			loose_money_collected = math.round(loose_money_dissect),
			easy_mode = math.round(easy_mode_dissect),
			killed_civs = math.round(killed_civs_dissect),
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
if string.lower(RequiredScript) == "lib/managers/hud/hudstageendscreen" then
	local function make_fine_text(text)
		local x, y, w, h = text:text_rect()

		text:set_size(w, h)
		text:set_position(math.round(text:x()), math.round(text:y()))

		return x, y, w, h
	end
		function HUDStageEndScreen:stage_experience_init(t, dt)
		local data = self._data

		self._lp_text:show()
		self._lp_circle:show()
		self._lp_backpanel:child("bg_progress_circle"):show()
		self._lp_forepanel:child("level_progress_text"):show()
		
		if data.gained == 0  then
			self._lp_text:set_text(tostring(data.start_t.level))
			self._lp_circle:set_color(Color(1, 1, 1))
			managers.menu_component:post_event("box_tick")
			
			self:step_stage_to_end()
			return
		end

		self._lp_circle:set_alpha(0)
		self._lp_backpanel:child("bg_progress_circle"):set_alpha(0)
		self._lp_text:set_alpha(0)

		self._bonuses_panel = self._lp_forepanel:panel({
			y = 10,
			x = self._lp_xp_gained:x(),
			w = self._lp_forepanel:w() - self._lp_xp_gained:left() - 10,
			h = self._lp_xp_gained:top() - 10
		})
		self._anim_exp_bonus = nil
		local bonus_params = {
			panel = self._bonuses_panel,
			color = tweak_data.screen_colors.text,
			title = managers.localization:to_upper_text("menu_experience"),
			bonus = 0
		}
		local exp = self:_create_bonus(bonus_params)

		exp:child("sign"):hide()

		self._experience_text_panel = exp

		self._experience_text_panel:set_alpha(0)

		self._experience_added = 0
		self._bonuses = {}

		if data.bonuses.stage_xp and data.bonuses.stage_xp ~= 0 then
			bonus_params.title = managers.localization:to_upper_text("menu_es_base_xp_stage")
			bonus_params.bonus = data.bonuses.stage_xp
			local stage = self:_create_bonus(bonus_params)

			stage:set_right(0)
			stage:set_top(exp:bottom())
			table.insert(self._bonuses, {
				stage,
				bonus_params.bonus
			})
		end

		local job = nil

		if data.bonuses.last_stage and data.bonuses.job_xp ~= 0 then
			bonus_params.title = managers.localization:to_upper_text("menu_es_base_xp_job")
			bonus_params.bonus = data.bonuses.job_xp
			job = self:_create_bonus(bonus_params)

			job:set_right(0)
			job:set_top(exp:bottom())
			table.insert(self._bonuses, {
				job,
				bonus_params.bonus
			})
		end

		local heat_xp = self._bonuses.heat_xp or 0
		local heat = managers.job:last_known_heat() or managers.job:has_active_job() and managers.job:get_job_heat(managers.job:current_job_id()) or 0
		local heat_color = managers.job:get_heat_color(heat)
		local bonuses_list = {
			"bonus_mission_xp",
			"bonus_days",
			"bonus_pro_job",
			"bonus_low_level",
			"bonus_risk",
			"bonus_failed",
			"in_custody",
			"bonus_num_players",
			"bonus_skill",
			"bonus_infamy",
			"bonus_gage_assignment",
			"bonus_extra",
			"bonus_ghost",
			"heat_xp",
			"bonus_mutators",
			"loose_money_collected",
			"easy_mode",
			"killed_civs"
		}
		local bonuses_params = {
			bonus_mission_xp = {
				color = tweak_data.screen_colors.text,
				title = managers.localization:to_upper_text("menu_es_mission_xp_bonus")
			},
			bonus_days = {
				color = tweak_data.screen_colors.text,
				title = managers.localization:to_upper_text("menu_es_day_bonus")
			},
			bonus_pro_job = {
				color = tweak_data.screen_colors.text,
				title = managers.localization:to_upper_text("menu_es_pro_job_bonus")
			},
			bonus_low_level = {
				color = tweak_data.screen_colors.important_1,
				title = managers.localization:to_upper_text("menu_es_alive_low_level_bonus")
			},
			bonus_risk = {
				color = tweak_data.screen_colors.risk,
				title = managers.localization:to_upper_text("menu_es_risk_bonus")
			},
			bonus_failed = {
				color = tweak_data.screen_colors.important_1,
				title = managers.localization:to_upper_text("menu_es_alive_failed_bonus")
			},
			in_custody = {
				color = tweak_data.screen_colors.important_1,
				title = managers.localization:to_upper_text("menu_es_in_custody_reduction")
			},
			bonus_num_players = {
				color = tweak_data.screen_colors.risk,
				title = managers.localization:to_upper_text("menu_es_alive_players_bonus")
			},
			bonus_skill = {
				color = tweak_data.screen_colors.button_stage_2,
				title = managers.localization:to_upper_text("menu_es_skill_bonus")
			},
			bonus_infamy = {
				color = tweak_data.lootdrop.global_values.infamy.color,
				title = managers.localization:to_upper_text("menu_es_infamy_bonus")
			},
			bonus_gage_assignment = {
				color = tweak_data.screen_colors.button_stage_2,
				title = managers.localization:to_upper_text("menu_es_gage_assignment_bonus")
			},
			bonus_extra = {
				color = tweak_data.screen_colors.button_stage_2,
				title = managers.localization:to_upper_text("menu_es_extra_bonus")
			},
			bonus_ghost = {
				color = tweak_data.screen_colors.ghost_color,
				title = managers.localization:to_upper_text("menu_es_ghost_bonus")
			},
			heat_xp = {
				color = heat_color,
				title = managers.localization:to_upper_text(heat >= 0 and "menu_es_heat_bonus" or "menu_es_heat_reduction")
			},
			bonus_mutators = {
				color = tweak_data.screen_colors.important_1,
				title = managers.localization:to_upper_text("menu_mutators_reduction_exp")
			},
			loose_money_collected = {
				color = tweak_data.screen_colors.friend_color,
				title = managers.localization:to_upper_text("menu_loose_money_collected_exp")
			},
			easy_mode = {
				color = tweak_data.screen_colors.important_1,
				title = managers.localization:to_upper_text("menu_one_down")
			},
			killed_civs = {
				color = tweak_data.screen_colors.important_1,
				title = managers.localization:to_upper_text("menu_killed_civs_reduction_exp")
			}
		}

		for i, func_name in ipairs(bonuses_list) do
			local bonus = data.bonuses[func_name] or 0

			if bonus ~= 0 then
				bonus_params.color = bonuses_params[func_name] and bonuses_params[func_name].color or Color.purple
				bonus_params.title = bonuses_params[func_name] and bonuses_params[func_name].title or "ERR: " .. func_name
				bonus_params.bonus = bonus
				local b = self:_create_bonus(bonus_params)

				b:set_right(0)
				b:set_top(exp:bottom())
				table.insert(self._bonuses, {
					b,
					bonus_params.bonus
				})
			end
		end

		local delay = 0.8
		local y = 0
		local sum_text = self._lp_forepanel:text({
			text = "= ",
			name = "sum_text",
			alpha = 1,
			align = "right",
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size
		})

		make_fine_text(sum_text)
		sum_text:set_righttop(self._lp_xp_gain:left(), self._lp_xp_gain:top())
		sum_text:hide()

		self._sum_text = sum_text

		self._lp_circle:set_color(Color(data.start_t.current / data.start_t.total, 1, 1))

		self._wait_t = 0.5
		self._start_ramp_up_t = 1
		self._ramp_up_timer = 0

		managers.menu_component:post_event("box_tick")
		self:step_stage_up()
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
		self.reinforced_door_single.devices.c4[1].unit = Idstring("units/payday2/equipment/gen_equipment_shape_charge/gen_equipment_shape_charge")
		self.keycard_door_single.devices.c4[1].unit = Idstring("units/payday2/equipment/gen_equipment_shape_charge/gen_equipment_shape_charge")
		self.keycard_door_single.devices.c4[2].unit = Idstring("units/payday2/equipment/gen_equipment_shape_charge/gen_equipment_shape_charge")
		self.cage_door_deluxe.devices.c4[1].unit = Idstring("units/payday2/equipment/gen_equipment_shape_charge/gen_equipment_shape_charge")
		self.cage_door_deluxe_non_jamming.devices.c4[1].unit = Idstring("units/payday2/equipment/gen_equipment_shape_charge/gen_equipment_shape_charge")
	end
end
if string.lower(RequiredScript) == "lib/managers/musicmanager" then
	local data = MusicManager.jukebox_default_tracks
	function MusicManager:jukebox_default_tracks()
			local default_options = data()
			default_options.heist_branchbank_hl = "track_03"
			default_options.loadout = "preplanning_music_old"
			if managers.dlc:has_dlc_or_soundtrack_or_cce("armored_transport") then
				default_options.heist_arm = "track_09"
			end
			
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
		if managers.job:is_level_ghostable(managers.job:current_level_id()) and not managers.groupai:state():whisper_mode() and not managers.job:is_current_job_professional() and Global.game_settings.job_plan == 2 then
			managers.chat:feed_system_message(ChatManager.GAME, managers.localization:text("ingame_restart_available") or "Offline")
		end
	end
end