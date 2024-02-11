local data = NarrativeTweakData.init
function NarrativeTweakData:init(tweak_data)
	data(self, tweak_data)
	
	self.STARS[1] = {jcs = {50, 40, 30, 20, 10 }} -- OK
	self.STARS[2] = {jcs = {70, 60, 50, 40, 30, 20, 10 }} -- OK
	self.STARS[3] = {jcs = {80, 70, 60, 50, 40, 30, 20, 10 }} -- OK
	self.STARS[4] = {jcs = {90, 80, 70, 60, 50, 40, 30, 20, 10 }} -- OK
	self.STARS[5] = {jcs = {100, 90, 80, 70, 60, 50, 40, 30, 20, 10 }} -- OK
	self.STARS[6] = {jcs = {100, 90, 80, 70, 60, 50, 40, 30, 20, 10 }} -- OK
	self.STARS[7] = {jcs = {100, 90, 80, 70, 60, 50, 40, 30, 20, 10 }} -- OK
	self.STARS[8] = {jcs = {100, 90, 80, 70, 60, 50, 40, 30, 20, 10 }} -- OK
	self.STARS[9] = {jcs = {100, 90, 80, 70, 60, 50, 40, 30, 20, 10 }} -- OK
	self.STARS[10] = {jcs = {100, 90, 80, 70, 60, 50, 40, 30, 20, 10 }} -- OK
	self.HEATED_MAX_XP_MUL = 1.5
	self.FREEZING_MAX_XP_MUL = 0
	self.DEFAULT_HEAT = {this_job = -15, other_jobs = 10}
	self.contacts.the_dentist_hidden = deep_clone(self.contacts.the_dentist)
	
	self.contacts.the_dentist_hidden.hidden = true
	self.jobs.kenaz_pro = deep_clone(self.jobs.kenaz)
	self.jobs.kenaz.contact = "the_dentist_hidden"
	
	self.jobs.branchbank_prof.name_id = "heist_branchbank_hl"
	
	self.jobs.arm_fac_single = deep_clone(self.jobs.arm_fac)
	self.jobs.arm_par_single = deep_clone(self.jobs.arm_par)
	self.jobs.arm_hcm_single = deep_clone(self.jobs.arm_hcm)
	self.jobs.arm_und_single = deep_clone(self.jobs.arm_und)
	self.jobs.arm_cro_single = deep_clone(self.jobs.arm_cro)
	self.jobs.branchbank_pro = deep_clone(self.jobs.branchbank_prof)
	self.jobs.kosugi_pro = deep_clone(self.jobs.kosugi)
	
	local friday_13 = os.date("%A %d") == "Friday 13"
	local halloween = os.date("%B %d") == "October 31"
	local pdth_release = os.date("%B %d") == "October 20"
	local pd2_release = os.date("%B %d") == "August 13"
	
	if not halloween and not friday_13 then
		self.contacts.events.hidden = true
	end
	
	if not pdth_release and not pd2_release then
		self.contacts.classic.name_id = "heist_contact_bain"
		self.contacts.classic.hidden = true
		self.jobs.rat.contact = "classic"
		self.jobs.gallery.contact = "classic"
		self.jobs.arm_for.contact = "classic"
		self.jobs.arm_fac.contact = "classic"
		self.jobs.arm_par.contact = "classic"
		self.jobs.arm_hcm.contact = "classic"
		self.jobs.arm_und.contact = "classic"
		self.jobs.arm_cro.contact = "classic"
		self.jobs.branchbank_deposit.contact = "classic"
		self.jobs.branchbank_cash.contact = "classic"
		self.jobs.branchbank_gold_prof.contact = "classic"
		self.jobs.branchbank_prof.contact = "classic"
		self.jobs.kosugi_pro.contact = "classic"
	end
		
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
	self.jobs.fex.professional = true

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
	self.jobs.firestarter.payout = {34000}
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
	
	math.randomseed(os.date("%d") * 1000)
		
	local rand = {true, false, false, false, false}
	self.jobs.haunted.professional = rand[math.random(5)]
	self.jobs.nail.professional = rand[math.random(5)]
	self.jobs.hvh.professional = rand[math.random(5)]
	self.jobs.help.professional = rand[math.random(5)]
	
	self.jobs.arm_wrapper = deep_clone(self.jobs.arm_und)
	self.jobs.arm_wrapper.name_id = "heist_arm"
	self.jobs.arm_wrapper.chain = {}
	self.jobs.arm_wrapper.job_wrapper = {
		"arm_fac_single",
		"arm_par_single",
		"arm_hcm_single",
		"arm_und_single",
		"arm_cro_single"
	}
	self.jobs.arm_wrapper.load_screen = "guis/dlcs/pic/textures/loading/job_crossroads"
	
	self.jobs.arm_wrapper.contact = "bain"

	table.insert(self._jobs_index, "arm_wrapper")
	table.insert(self._jobs_index, "arm_fac_single")
	table.insert(self._jobs_index, "arm_par_single")
	table.insert(self._jobs_index, "arm_hcm_single")
	table.insert(self._jobs_index, "arm_und_single")
	table.insert(self._jobs_index, "arm_cro_single")
	table.insert(self._jobs_index, "branchbank_pro")
	table.insert(self._jobs_index, "firestarter_pro")
	table.insert(self._jobs_index, "alex_pro")
	table.insert(self._jobs_index, "watchdogs_wrapper_pro")
	table.insert(self._jobs_index, "framing_frame_pro")
	table.insert(self._jobs_index, "election_day_pro")
	table.insert(self._jobs_index, "kosugi_pro")
	table.insert(self._jobs_index, "mia_pro")
	table.insert(self._jobs_index, "hox_pro")
	table.insert(self._jobs_index, "kenaz_pro")
	table.insert(self._jobs_index, "peta_pro")
	table.insert(self._jobs_index, "born_pro")
	table.insert(self._jobs_index, "rvd_pro")
	
	self.jobs.cage.jc = 50
	self.jobs.arena.jc = 40
	self.jobs.roberts.jc = 50
	self.jobs.rvd.jc = 40
	self.jobs.family.jc = 20
	self.jobs.branchbank_pro.jc = 10
	self.jobs.kosugi.jc = 10
	self.jobs.arm_cro_single.jc = 50
	self.jobs.arm_fac_single.jc = 40
	self.jobs.arm_hcm_single.jc = 50
	self.jobs.arm_par_single.jc = 40
	self.jobs.arm_und_single.jc = 40

	self.jobs.mallcrasher.jc = 40
	self.jobs.cane.jc = 30
	self.jobs.nightclub.jc = 20
	self.jobs.jolly.jc = 40
	self.jobs.peta.jc = 50
	self.jobs.pines.jc = 30
	self.jobs.moon.jc = 20
	self.jobs.ukrainian_job_prof.jc = 20
	self.jobs.four_stores.jc = 10
	self.jobs.shoutout_raid.jc = 50
	self.jobs.fex.jc = 50
	
	self.jobs.alex.jc = 50
	self.jobs.firestarter.jc = 40
	
	self.jobs.big.jc = 50
	self.jobs.mia.jc = 40
	self.jobs.hox_3.jc = 30
	self.jobs.hox.jc = 50
	
	self.jobs.mad.jc = 50
	
	self.jobs.spa.jc = 40
	self.jobs.fish.jc = 50
	
	self.jobs.vit.jc = 90
	self.jobs.brb.jc = 30
	self.jobs.bph.jc = 60
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
	
	self.jobs.arm_wrapper.jc = 50
	self.jobs.bex.jc = 40
	
	self.jobs.haunted.jc = math.random(9) * 10
	self.jobs.nail.jc = math.random(9) * 10
	self.jobs.hvh.jc = math.random(9) * 10
	self.jobs.help.jc = math.random(9) * 10
	
	local rarity = {
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		1, 1, 1,
		2, 2,
		3, 
		4
	}

	for id, _ in pairs(self.jobs) do
		contracts = self.jobs[id]
		if contracts.jc then
			if contracts.jc <= 30 then
				contracts.jc = contracts.jc + (rarity[math.random(17)] * 10)
			end
			if contracts.jc <= 60 then
				contracts.jc = contracts.jc + (rarity[math.random(14)] * 10)
			end
			
			self.jobs.firestarter_pro.jc = self.jobs.firestarter.jc + 10
			self.jobs.alex_pro.jc = self.jobs.alex.jc + 10
			self.jobs.framing_frame_pro.jc = self.jobs.framing_frame.jc + 10
			self.jobs.election_day_pro.jc = self.jobs.election_day.jc + 10
			self.jobs.mia_pro.jc = self.jobs.mia.jc + 10
			self.jobs.hox_pro.jc = self.jobs.hox.jc + 10
			self.jobs.peta_pro.jc = self.jobs.peta.jc + 10
			self.jobs.born_pro.jc = self.jobs.born.jc + 10
			self.jobs.kenaz_pro.jc = self.jobs.kenaz.jc + 10
			self.jobs.rvd_pro.jc = self.jobs.rvd.jc + 10
			
			if contracts.jc > 90 then
				contracts.professional = true
				contracts.jc = 90
			end
		end
		if contracts.professional then
			contracts.region = "professional"
		end
	end

	self.jobs.branchbank_prof.jc = math.random(4, 5) * 10
	self.jobs.branchbank_gold_prof.jc = math.random(3, 5) * 10
	self.jobs.branchbank_cash.jc = math.random(2, 5) * 10
	self.jobs.branchbank_deposit.jc = math.random(4, 6) * 10
	self.jobs.kosugi_pro.jc = math.random(3, 6) * 10
	self.jobs.arm_cro.jc = math.random(5, 9) * 10
	self.jobs.arm_fac.jc = math.random(4, 7) * 10
	self.jobs.arm_hcm.jc = math.random(5, 7) * 10
	self.jobs.arm_par.jc = math.random(4, 7) * 10
	self.jobs.arm_und.jc = math.random(4, 7) * 10
	self.jobs.gallery.jc = math.random(3, 7) * 10
	self.jobs.kenaz.jc = math.random(6, 9) * 10
	self.jobs.rat.jc = math.random(4, 8) * 10

	self.jobs.run.jc = math.random(5, 9) * 10
	self.jobs.glace.jc = math.random(7, 9) * 10
	self.jobs.flat.jc = math.random(6, 9) * 10
	self.jobs.dah.jc = math.random(7, 9) * 10
	self.jobs.nmh.jc = math.random(5, 9) * 10
	self.jobs.red2.jc = math.random(4, 9) * 10
	self.jobs.man.jc = math.random(5, 9) * 10
	self.jobs.pal.jc = math.random(5, 9) * 10
	self.jobs.dinner.jc = math.random(5, 9) * 10
end
