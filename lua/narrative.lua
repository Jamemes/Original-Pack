if string.lower(RequiredScript) == "lib/tweak_data/narrativetweakdata" then
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
end
if string.lower(RequiredScript) == "lib/managers/experiencemanager" then
	function ExperienceManager:new_xp(value)
		local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
		local difficulty_index = tweak_data:difficulty_to_index(difficulty)
		if value == "loose_money" then
			local loose_money = math.floor(managers.loot:get_real_total_small_loot_value() / (tweak_data.loose_money_exp_convertation_amount * managers.player:upgrade_value("player", "reduce_loose_money_exp_convertation_amount_mul", 1)))
			return loose_money >= tweak_data.max_loose_money_boost and tweak_data.max_loose_money_boost or loose_money
		end
		if value == "killed_civs" then
			local mul = difficulty_index < 5 and tweak_data.killed_civs_penalty[1] or difficulty_index < 6 and tweak_data.killed_civs_penalty[2] or tweak_data.killed_civs_penalty[3]
			local killed_mul = managers.statistics:session_total_civilian_kills() * mul
			return killed_mul >= 100 and 100 or killed_mul
		end
		return 0
	end
	
	local data = ExperienceManager.get_xp_by_params
	function ExperienceManager:get_xp_by_params(params)
		local job_id = params.job_id
		local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
		local diff = tweak_data:difficulty_to_index(difficulty)
		local current_job_stage = params.current_stage or 1
		local loot_exp = 1 + managers.loot:get_secured_bonus_bags_amount() * 0.1
		local waves = managers.skirmish:is_skirmish() and managers.skirmish:current_wave_number() or 1
		params.mission_xp = (tweak_data.narrative:job_data(job_id).jc * 225) / current_job_stage * waves
		
		local function job_xp(job, value)
			if job_id == job then
				params.mission_xp = params.mission_xp * value
			end
		end
		
		job_xp("rat", loot_exp)
		job_xp("pal", loot_exp)
		job_xp("red2", loot_exp)
		job_xp("mex_cooking", loot_exp)
		job_xp("nail", loot_exp)
		job_xp("hvh", loot_exp)
		
		job_xp("run", 2)
		job_xp("glace", 2)
		job_xp("flat", 2)
		job_xp("dah", 2)
		job_xp("nmh", 2)
		job_xp("red2", 2)
		job_xp("man", 2)
		job_xp("pal", 2)
		job_xp("dinner", 2)
		
		job_xp("vit", 3)
		job_xp("bph", 3)
		job_xp("des", 3)
		job_xp("pbr", 3)
		job_xp("pbr2", 2)
		job_xp("brb", 2)
		
		job_xp("arm_for", 2)
		
		-- if managers.skirmish:current_wave_number() < 1 then
			-- local mul = Global.game_settings.one_down and tweak_data.easy_mode_exp_penalty * 0.01 or 1
			-- params.mission_xp = params.mission_xp * mul
		-- end
		
		local loose_money = math.floor(managers.loot:get_real_total_small_loot_value() / tweak_data.loose_money_exp_convertation_amount) >= tweak_data.max_loose_money_boost and tweak_data.max_loose_money_boost or math.floor(managers.loot:get_real_total_small_loot_value() / tweak_data.loose_money_exp_convertation_amount)
		local mul = 1 + (loose_money * 0.01)
		params.mission_xp = params.mission_xp * mul
		
		local kill_mul = tweak_data.killed_civs_penalty
		local diff_mul = diff < 5 and kill_mul[1] * 0.01 or diff < 6 and kill_mul[2] * 0.01 or kill_mul[3] * 0.01
		local kills = managers.statistics:session_total_civilian_kills()
		local mul = 1 - (kills * diff_mul)
		params.mission_xp = mul < 0 and 0 or params.mission_xp * mul
		
		return data(self, params)
	end
	
end
if string.lower(RequiredScript) == "lib/managers/hud/hudstageendscreen" then
	local data = HUDStageEndScreen.stage_experience_init
	function HUDStageEndScreen:stage_experience_init(t, dt)
		if self._data.gained == 0  then
			self._lp_text:show()
			self._lp_circle:show()
			self._lp_backpanel:child("bg_progress_circle"):show()
			self._lp_forepanel:child("level_progress_text"):show()
			self._lp_text:set_text(tostring(self._data.start_t.level))
			self._lp_circle:set_color(Color(1, 1, 1))
			managers.menu_component:post_event("box_tick")
			
			self:step_stage_to_end()
			return
		end
		data(self, t, dt)
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
		self.risk_death_wish.risk_lock = 4
		self.risk_easy_wish.risk_lock = 5
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
if string.lower(RequiredScript) == "lib/managers/menumanager" then
	local data = MenuCallbackHandler.restart_level_visible
	function MenuCallbackHandler:restart_level_visible()
		if managers.skirmish:current_wave_number() < 1 and managers.job:is_level_ghostable(managers.job:current_level_id()) and not managers.groupai:state():whisper_mode() then
			return data(self)
		end
	end

	local data = MenuCallbackHandler.restart_vote_visible
	function MenuCallbackHandler:restart_vote_visible()
		if managers.skirmish:current_wave_number() < 1 and managers.job:is_level_ghostable(managers.job:current_level_id()) and not managers.groupai:state():whisper_mode() then
			return data(self)
		end
	end
end
if string.lower(RequiredScript) == "lib/managers/votemanager" then
	local data = VoteManager.update
	function VoteManager:update(t, dt)
		data(self, t, dt)
		local current_time = TimerManager:wall():time()
		if self._callback_counter then
			if current_time > self._callback_counter - 0.01 then
				if Network:is_server() and self._callback_type == "restart" then
					managers.network:session():send_to_peers("mission_ended", false, 0)
					game_state_machine:change_state_by_name("gameoverscreen")
				end
			end
		end
	end
end