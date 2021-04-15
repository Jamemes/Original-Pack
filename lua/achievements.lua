if string.lower(RequiredScript) == "lib/tweak_data/achievementstweakdata" then
	local data = AchievementsTweakData.init
	function AchievementsTweakData:init(tweak_data)
		data(self, tweak_data)

		for id, ach in pairs(self.complete_heist_achievements) do
			if table.size(ach) == 3 then
				if ach.job ~= nil or ach.jobs ~= nil or ach.level_id ~= nil or ach.levels ~= nil then
					if ach.difficulty and ach.story == nil then
						if table.size(ach.difficulty) == 6 then
							ach.difficulty = {"hard"}
						elseif table.size(ach.difficulty) == 5 then
							ach.difficulty = {"overkill"}
						elseif table.size(ach.difficulty) == 4 then
							ach.difficulty = {"overkill_145"}
						elseif table.size(ach.difficulty) == 3 then
							ach.difficulty = {"easy_wish"}
						elseif table.size(ach.difficulty) == 2 then
							ach.difficulty = {"overkill_290"}
						end
					end
				end
			end
			
			local jobs_index = tweak_data.narrative._jobs_index
			
			if ach.jobs then
				for i = 1, #ach.jobs do
					local job_id = ach.jobs[i] .. "_pro"
					for i = 1, #jobs_index do
						if jobs_index[i] == job_id then
							table.insert(ach.jobs, job_id)
						end
					end
				end
			end
			
			local job_id = ach.job and ach.job .. "_pro" or ""
			for i = 1, #jobs_index do
				if jobs_index[i] == job_id then
					ach.jobs = {ach.job, job_id}
					ach.job = nil
				end
			end
			
			local arm_heists = {
				"arm_cro",
				"arm_und",
				"arm_hcm",
				"arm_fac",
				"arm_par",
				"arm_for"
			}
			for i = 1, #arm_heists do
				if ach.job == arm_heists[i] then
					ach.levels = {ach.job}
					ach.job = nil
				end
				if ach.jobs then
					if ach.jobs[i] == arm_heists[i] then
						ach.levels = ach.jobs
						ach.jobs = nil
					end
				end
			end
	
			for i = 1, 6 do
				if ach.job == "branchbank_prof" then
					ach.jobs = {ach.job, "branchbank_pro"}
					ach.job = nil
				end
				if ach.jobs then
					if ach.jobs[i] == "branchbank_prof" then
						table.insert(ach.jobs, "branchbank_pro")
					end
				end
			end
		end
		
		for _, ach in pairs(self.complete_heist_stats_achievements) do
			if ach.difficulty then
				if table.size(ach.difficulty) == 6 then
					ach.difficulty = {"hard"}
				elseif table.size(ach.difficulty) == 5 then
					ach.difficulty = {"overkill"}
				elseif table.size(ach.difficulty) == 4 then
					ach.difficulty = {"overkill_145"}
				elseif table.size(ach.difficulty) == 3 then
					ach.difficulty = {"easy_wish"}
				elseif table.size(ach.difficulty) == 2 then
					ach.difficulty = {"overkill_290"}
				end
			end
		end
		
		for _, ach in pairs(self.enemy_melee_hit_achievements) do
			local jobs_index = tweak_data.narrative._jobs_index
			local job_id = ach.job and ach.job .. "_pro" or ""
			for i = 1, #jobs_index do
				if ach.jobs then
					for i = 1, #ach.jobs do
						local job_id = ach.jobs[i] .. "_pro"
						for i = 1, #jobs_index do
							if jobs_index[i] == job_id then
								table.insert(ach.jobs, job_id)
							end
						end
					end
				end
				if jobs_index[i] == job_id then
					ach.jobs = {ach.job, job_id}
					ach.job = nil
				end
			end
		end
		
		self.loot_cash_achievements.trophy_tfturret.jobs = nil
		self.loot_cash_achievements.trophy_tfturret.levels = {"arm_for"}
		self.loot_cash_achievements.daily_heirloom.jobs = {"kosugi", "kosugi_pro"}
		self.loot_cash_achievements.story_shadow_raid_bags.jobs = {"kosugi", "kosugi_pro"}
		self.four_mask_achievements.go_bananas.jobs = {"alex", "alex_pro"}
		self.four_mask_achievements.guy_with_gun_now_with_night_jobs.jobs = {"watchdogs_wrapper_pro", "watchdogs_wrapper", "watchdogs", "watchdogs_night"}
		self.four_mask_achievements.wind_of_change.jobs = {"hox", "hox_pro"}
		self.enemy_melee_hit_achievements.hurting_people.jobs = {"mia", "mia_pro"}
		self.complete_heist_achievements.nbm_1.difficulty = {"normal"}
		self.complete_heist_achievements.trk_lr_0.difficulty = {"normal"}
		self.complete_heist_achievements.ckr_1.difficulty = {"normal"}
		self.complete_heist_achievements.trk_pn_0.difficulty = {"normal"}
	end
end
if string.lower(RequiredScript) == "lib/managers/achievement/cac_customachievements" then
	local function init_cac_15()
		local trip_mine_count = 0
		local target_count = 24
		local listener_key = {}

		local function on_trip_mine_placed()
			if not Global.statistics_manager.playing_from_start then
				return
			end

			trip_mine_count = trip_mine_count + 1

			if trip_mine_count == target_count then
				if managers.groupai:state():whisper_mode() then
					managers.achievment:award("cac_15")
				end
			end
		end

		managers.player:register_message("trip_mine_placed", listener_key, on_trip_mine_placed)
	end

	local function init_cac_11_34()
		local listener_key = {}

		local function on_cop_converted(converted_unit, converting_unit)
			if not alive(converting_unit) then
				return
			end

			managers.achievment:award_progress("cac_34_stats")

			if converting_unit ~= managers.player:player_unit() then
				return
			end

			local cashier_units = {
				Idstring("units/pd2_dlc_rvd/characters/ene_female_civ_undercover/ene_female_civ_undercover"),
				Idstring("units/pd2_dlc_rvd/characters/ene_female_civ_undercover/ene_female_civ_undercover_husk")
			}
			local is_rvd = managers.job:current_job_id() == "rvd" or managers.job:current_job_id() == "rvd_pro"
			local is_cashier = table.contains(cashier_units, converted_unit:name())

			if is_rvd and is_cashier then
				managers.achievment:award("cac_11")
			end
		end

		managers.player:register_message("cop_converted", listener_key, on_cop_converted)
	end

	local data = AchievmentManager.init_cac_custom_achievements
	function AchievmentManager:init_cac_custom_achievements(self)
		data(self)
		init_cac_15()
		init_cac_11_34()
	end
end
if string.lower(RequiredScript) == "lib/managers/blackmarketmanager" then
	function BlackMarketManager:check_frog_1()
		if not managers.statistics or not managers.statistics:started_session_from_beginning() then
			return false
		end

		local frog_1_memory = managers.job:get_memory("frog_1")
		local is_correct_job = frog_1_memory ~= false and managers.job and managers.job:has_active_job() and (managers.job:current_real_job_id() == "hox" or managers.job:current_real_job_id() == "hox_pro") and table.contains({
			"overkill_145",
			"easy_wish",
			"overkill_290",
			"sm_wish"
		}, Global.game_settings.difficulty) and true or false

		if is_correct_job then
			local pass_skills, pass_primary, pass_secondary, pass_armor, peer, outfit = nil
			local all_passed = true

			if managers.network:session() then
				for _, peer in pairs(managers.network:session():all_peers()) do
					if all_passed and peer then
						if peer:is_outfit_loaded() then
							outfit = peer:blackmarket_outfit()
							pass_skills = true

							for tree, points in pairs(outfit.skills and outfit.skills.skills or {
								1
							}) do
								if tonumber(points) > 0 then
									pass_skills = false

									break
								end
							end

							pass_primary = outfit.primary.factory_id == "wpn_fps_ass_akm_gold"
							pass_secondary = outfit.secondary.factory_id == "wpn_fps_smg_thompson"
							pass_armor = outfit.armor == "level_1"
							all_passed = pass_skills and pass_primary and pass_secondary and pass_armor and true or false
						else
							all_passed = false
						end
					end
				end
			end

			frog_1_memory = all_passed

			managers.job:set_memory("frog_1", frog_1_memory)

			return frog_1_memory
		end

		managers.job:set_memory("frog_1", false)

		return false
	end
end
if string.lower(RequiredScript) == "lib/tweak_data/hudiconstweakdata" then
	local data = HudIconsTweakData.init
	function HudIconsTweakData:init(tweak_data)
		data(self, tweak_data)
		for i = 0, 4 do
			local d = i == 4 and 5 or i

			local function icon(id, x, y)
				self[id .. 4] = self[id .. 5]
				self[id .. d] = {texture_rect = {x, y, 85, 85}, texture = "guis/textures/pd2/achievements/diff_icons"}
			end
			
			local function column(first, second, third, fourth, fifth)
				if i == 0 then
					return first
				elseif i == 1 then
					return second
				elseif i == 2 then
					return third
				elseif i == 3 then
					return fourth
				elseif i == 4 then
					return fifth
				end
			end
			
			local id = column(0, 87, 174, 261, 348)
			icon("C_Bain_H_All_AllDiffs_D", 0, id)
			icon("C_Classics_H_All_AllDiffs_D", 87, id)
			icon("C_Event_H_All_AllDiffs_D", 174, id)
			icon("C_Hector_H_All_AllDiffs_D", 261, id) 	
			icon("C_Jimmy_H_All_AllDiffs_D", 348, id)
			icon("C_Locke_H_All_AllDiffs_D", 435, id)
			icon("C_Butcher_H_All_AllDiffs_D", 522, id)
			icon("C_Continental_H_All_AllDiffs_D", 609, id)
			icon("C_Dentist_H_All_AllDiffs_D", 696, id)
			icon("C_Elephant_H_All_AllDiffs_D", 783, id)
			icon("C_Vlad_H_All_AllDiffs_D", 870, id)
			icon("C_Bain_H_Arena_AllDiffs_D", 957, id)
			icon("C_Bain_H_ArtGallery_AllDiffs_D", 1044, id)
			icon("C_Bain_H_BankC_AllDiffs_D", 1131, id)
			icon("C_Bain_H_BankD_AllDiffs_D", 1218, id)
			icon("C_Bain_H_BankG_AllDiffs_D", 1305, id)
			icon("C_Bain_H_BankR_AllDiffs_D", 1392, id)
			-- icon("Bank_Heist_AllDiffs_D", 1479, id)
			icon("C_Bain_H_Car_AllDiffs_D", 1566, id)
			icon("C_Bain_H_CookOff_AllDiffs_D", 1653, id)
			icon("C_Bain_H_DiamondStore_AllDiffs_D", 1740, id)
			icon("C_Bain_H_GOBank_AllDiffs_D", 1827, id)
			icon("C_Bain_H_JewelryStore_AllDiffs_D", 1914, id)
			icon("C_Bain_H_ReservoirDogs_AllDiffs_D", 2001, id)
			-- icon("RvdPro_AllDiffs_D", 2088, id)
			icon("C_Bain_H_ShadowRaid_AllDiffs_D", 2175, id)
			
			local id = column(435, 522, 609, 696, 783)
			icon("C_Bain_H_TrainHeist_AllDiffs_D", 0, id)
			icon("C_Bain_H_TransportCrossroads_AllDiffs_D", 87, id)
			icon("C_Bain_H_TransportDowntown_AllDiffs_D", 174, id)
			icon("C_Bain_H_TransportHarbor_AllDiffs_D", 261, id) 
			icon("C_Bain_H_TransportPark_AllDiffs_D", 348, id)
			icon("C_Bain_H_TransportUnderpass_AllDiffs_D", 435, id)
			-- icon("Arm_AllDiffs_D", 522, id)
			icon("C_Classics_H_Counterfeit_AllDiffs_D", 609, id)
			icon("C_Classics_H_DiamondHesit_AllDiffs_D", 696, id)
			icon("C_Classics_H_FirstWorldBank_AllDiffs_D", 783, id)
			icon("C_Classics_H_GreenBridge_AllDiffs_D", 870, id)
			icon("C_Classics_H_HeatStreet_AllDiffs_D", 957, id)
			icon("C_Classics_H_NoMercy_AllDiffs_D", 1044, id)
			icon("C_Classics_H_PanicRoom_AllDiffs_D", 1131, id)
			icon("C_Classics_H_Slaughterhouse_AllDiffs_D", 1218, id)
			icon("C_Classics_H_Undercover_AllDiffs_D", 1305, id)
			icon("C_Event_H_CursedKillRoom_AllDiffs_D", 1392, id)
			icon("C_Event_H_LabRats_AllDiffs_D", 1479, id)
			icon("C_Event_H_PrisonNightmare_AllDiffs_D", 1566, id)
			icon("C_Event_H_SafeHouseNightmare_AllDiffs_D", 1653, id)
			icon("C_Hector_H_Firestarter_AllDiffs_D", 1740, id)
			-- icon("FirestarterPro_AllDiffs_D", 1827, id)
			icon("C_Hector_H_Rats_AllDiffs_D", 1914, id)
			-- icon("RatsPro_AllDiffs_D", 2001, id)
			icon("C_Hector_H_Watchdogs_AllDiffs_D", 2088, id)
			-- icon("WatchdogsPro_AllDiffs_D", 2175, id)

			local id = column(870, 957, 1044, 1131, 1218)
			icon("C_Jimmy_H_Boiling_AllDiffs_D", 0, id)
			icon("C_Jimmy_H_MurkyStation_AllDiffs_D", 87, id)
			icon("C_Locke_H_AlsDeal_AllDiffs_D", 174, id)
			icon("C_Locke_H_Beneath_AllDiffs_D", 261, id) 
			icon("C_Locke_H_BirthOfSky_AllDiffs_D", 348, id)
			icon("C_Locke_H_BorderCrossing_AllDiffs_D", 435, id)
			icon("C_Locke_H_BorderCrystals_AllDiffs_D", 522, id)
			icon("C_Locke_H_BreakinFeds_AllDiffs_D", 609, id)
			icon("C_Locke_H_BrooklynBank_AllDiffs_D", 696, id)
			icon("C_Locke_H_HellsIsland_AllDiffs_D", 783, id)
			icon("C_Locke_H_HenrysRock_AllDiffs_D", 870, id)
			icon("C_Locke_H_Shacklethorne_AllDiffs_D", 957, id)
			icon("C_Locke_H_WhiteHouse_AllDiffs_D", 1044, id)
			icon("C_Butcher_H_BombDock_AllDiffs_D", 1131, id)
			icon("C_Butcher_H_BombForest_AllDiffs_D", 1218, id)
			icon("C_Butcher_H_Scarface_AllDiffs_D", 1305, id)
			icon("C_Continental_H_Brooklyn_AllDiffs_D", 1392, id)
			icon("C_Continental_H_YachtHeist_AllDiffs_D", 1479, id)
			icon("C_Dentist_H_BigBank_AllDiffs_D", 1566, id)
			icon("C_Dentist_H_Diamond_AllDiffs_D", 1653, id)
			icon("C_Dentist_H_GoldenGrinCasino_AllDiffs_D", 1740, id)
			-- icon("HoxPro_AllDiffs_D", 1827, id)
			icon("C_Dentist_H_HotlineMiami_AllDiffs_D", 1914, id)
			-- icon("MiaPro_AllDiffs_D", 2001, id)
			icon("C_Dentist_H_HoxtonBreakout_AllDiffs_D", 2088, id)
			-- icon("KenazPro_AllDiffs_D", 2175, id)

			local id = column(1305, 1392, 1479, 1566, 1653)
			icon("C_Dentist_H_HoxtonRevenge_AllDiffs_D", 0, id)
			icon("C_Elephant_H_BigOil_AllDiffs_D", 87, id)
			icon("C_Elephant_H_Biker_AllDiffs_D", 174, id)
			-- icon("BornPro_AllDiffs_D", 261, id) 
			icon("C_Elephant_H_ElectionDay_AllDiffs_D", 348, id)
			-- icon("ElectionDayPro_AllDiffs_D", 435, id)
			icon("C_Elephant_H_FramingFrame_AllDiffs_D", 522, id)
			-- icon("FramingFramePro_AllDiffs_D", 609, id)
			icon("C_Vlad_H_Ashock_AllDiffs_D", 696, id)
			icon("C_Vlad_H_FourStores_AllDiffs_D", 783, id)
			icon("C_Vlad_H_GoatSim_AllDiffs_D", 870, id)
			-- icon("PetaPro_AllDiffs_D", 957, id)
			icon("C_Vlad_H_Mallcrasher_AllDiffs_D", 1044, id)
			icon("C_Vlad_H_Meltdown_AllDiffs_D", 1131, id)
			icon("C_Vlad_H_Nightclub_AllDiffs_D", 1218, id)
			icon("C_Vlad_H_SanMartinBank_AllDiffs_D", 1305, id)
			icon("C_Vlad_H_Santa_AllDiffs_D", 1392, id)
			icon("C_Vlad_H_StealingXmas_AllDiffs_D", 1479, id)
			icon("C_Vlad_H_Ukrainian_AllDiffs_D", 1566, id)
			icon("C_Vlad_H_XMas_AllDiffs_D", 1653, id)
			icon("C_Locke_H_BreakfastInTijuana_AllDiffs_D", 1740, id)
			icon("C_Vlad_H_BulocsMansion_AllDiffs_D", 1827, id)
			icon("C_JiuFeng_H_DragonHeist_AllDiffs_D", 1914, id)
		end
		
		local function icon(id, x, y)
			self[id] = {texture_rect = {x, y, 85, 85}, texture = "guis/textures/pd2/achievements/achievements"}
		end
		
		icon("Other_H_All_Infamy_02", 0, 	0)
		icon("Other_H_All_Infamy_03", 87, 	0)
		icon("Other_H_All_Infamy_04", 174, 	0)
		icon("Other_H_All_Infamy_05", 261, 	0)
		icon("Other_H_All_Infamy_06", 348, 	0)
		icon("Other_H_All_Infamy_07", 435, 	0)
		icon("Other_H_All_Infamy_08", 522, 	0)
		icon("Other_H_All_Infamy_09", 609, 	0)
		icon("Other_H_All_Infamy_10", 696, 	0)
		icon("Other_H_All_Infamy_11", 783, 	0)
		icon("Other_H_All_Infamy_12", 870, 	0)
		icon("Other_H_All_Infamy_13", 957, 	0)
		icon("Other_H_All_Infamy_14", 1044, 0)

		icon("C_Hector_H_Firestarter_ItsGettingHot",      	0, 		87)
		icon("C_Hector_H_Firestarter_Wasteful",           	87, 	87)
		icon("C_Elephant_H_ElectionDay_DeathWishSwinger", 	174, 	87)
		icon("C_Elephant_H_ElectionDay_Reputation",       	261, 	87)
		icon("C_Bain_H_BankVarious_SaintFrancis",         	348, 	87)
		icon("C_Bain_H_CookOff_KissTheChef",              	435, 	87)
		icon("C_Classics_H_Counterfeit_Basement",         	522, 	87)
		icon("C_Classics_H_Undercover_BlowOut",           	609, 	87)
		icon("C_Classics_H_Undercover_NotEven",           	696, 	87)
		icon("C_Hector_H_Firestarter_YouCanRun",          	783, 	87)
		icon("C_Jimmy_H_Boiling_WhenInRussia",            	870, 	87)
		icon("C_Jimmy_H_MurkyStation_Lootinh",            	957, 	87)
		icon("C_Locke_H_Beneath_Commando",                	1044,	87)

		icon("C_Locke_H_Beneath_Juggernauts",               0, 		174)
		icon("C_Locke_H_BirthOfSky_BlackTie",               87, 	174)
		icon("C_Vlad_H_Santa_SantaSlays",                   174, 	174)
		icon("Other_H_Any_C40",                             261, 	174)

	end
end
if string.lower(RequiredScript) == "lib/managers/menu/achievementlistgui" then
	local data = AchievementListItem.init
	function AchievementListItem:init(...)
		data(self, ...)
		local id = self._data.key
		local info = self._data.info
		self._info = info or {}
		local awarded = self._info.awarded
		if awarded then
			managers.achievment:track(id, false)
			managers.achievment:force_track(id, false)
			self._highlight:set_visible(self._info.forced)
		end
	end
end
if string.lower(RequiredScript) == "lib/managers/achievmentmanager" then

	function AchievmentManager:add_heist_success_award_progress(id)
		local new_progress = (managers.job:get_memory(id, true) or 0) + 1

		managers.job:set_memory(id, new_progress, true)

		self._mission_end_achievements[id] = {
			stat = true,
			progress = new_progress
		}
		self._mission_end_achievements[id] = {}
	end
	function AchievmentManager:get_tracked_fill(max)
		max = max or self.MAX_TRACKED

		if #self._forced == max then
			return self._forced
		end

		local list = table.list_copy(self._forced)
		
		return list
	end

	CustomAchiHandler = CustomAchiHandler or {}

	CustomAchiHandler.achievements = {}

	CustomAchiHandler.allowed_to_save = true

	function CustomAchiHandler:initialized_callback(clbk)
		CustomAchiHandler.init_callback = clbk
	end

	function CustomAchiHandler:init()
		Steam:sa_handler():init()
	end

	function CustomAchiHandler:initialized()
		return Steam:sa_handler():initialized()
	end

	function CustomAchiHandler:clear_achievement(id)
		return Steam:sa_handler():clear_achievement(id)
	end

	function CustomAchiHandler:clear_all_stats(param)
		return Steam:sa_handler():clear_all_stats(param)
	end

	function CustomAchiHandler:has_achievement(id)
		if CustomAchiHandler.achievements[id] then
			return CustomAchiHandler.achievements[id].awarded
		end
	end

	function CustomAchiHandler:achievement_unlock_time(id)
		if CustomAchiHandler.achievements[id] then
			return CustomAchiHandler.achievements[id].received
		end
	end

	function CustomAchiHandler:friends_with_achievement(id, callback)
		return Steam:sa_handler():friends_with_achievement(id, callback)
	end

	function CustomAchiHandler:achievement_achieved_percent(id)
		return Steam:sa_handler():achievement_achieved_percent(id)
	end

	function CustomAchiHandler:achievement_store_callback(clbk)
		return Steam:sa_handler():achievement_store_callback(clbk)
	end

	function CustomAchiHandler:set_achievement(id)
		CustomAchiHandler.current_achievement = id
		if not Steam:sa_handler():has_achievement(id) then
			return
		end
	end
	
	local function SaveData()
		local progress = _G.OriginalPackOptions.settings.Enable_Test and 'Achievements_OP_TEST.txt' or _G.OriginalPackOptions.settings.Enable_Max_Progress and 'Achievements_OP_MAX.txt' or 'Achievements_OP.txt'
		local file = io.open(SavePath .. progress, "w")
		if file then
			file:write(json.encode({ achievements = CustomAchiHandler.achievements, stats = CustomAchiHandler.stats or {} }))
			file:close()
		end
	end

	function CustomAchiHandler:store_data()
		local id = CustomAchiHandler.current_achievement or ''
		
		if CustomAchiHandler.achievements[id] and not CustomAchiHandler.achievements[id].awarded then
			local new_data = { awarded = true, received = os.time() }
			CustomAchiHandler.achievements[id] = new_data
			
			if managers.achievment.achievments[id] then
				managers.achievment.achievments[id].awarded = true
				managers.achievment:_give_reward(id)
			end
		end
		
		if CustomAchiHandler.allowed_to_save then
			CustomAchiHandler.allowed_to_save = false
			DelayedCalls:Add('CustomAchiHandler_save_'..id, 0.5, function()
				SaveData()
			
				CustomAchiHandler.allowed_to_save = true
			end)
		end
		
		if not Steam:sa_handler():has_achievement(id) then
			Steam:sa_handler():store_data()
		end
	end

	function AchievmentManager:check_autounlock_achievements()
	end

	local save_orig = AchievmentManager.save
	function AchievmentManager:save(...)
		if CustomAchiHandler.needs_saving then
			SaveData()
			CustomAchiHandler.needs_saving = nil
		end
		save_orig(self, ...)
	end

	local init_fin_orig = AchievmentManager.init_finalize
	function AchievmentManager:init_finalize(...)
		init_fin_orig(self, ...)
		local progress = _G.OriginalPackOptions.settings.Enable_Test and 'Achievements_OP_TEST.txt' or _G.OriginalPackOptions.settings.Enable_Max_Progress and 'Achievements_OP_MAX.txt' or 'Achievements_OP.txt'

		for k,v in pairs(self.achievments) do
			CustomAchiHandler.achievements[k] = { awarded = false, received = 0 }
		end
		
		local file = io.open(SavePath .. progress, "r")
		if file then
			local data = json.decode(file:read("*all")) or {}
			file:close()
			
			for k,v in pairs(data.achievements or {}) do
				CustomAchiHandler.achievements[k] = v
				if self.achievments[k] and v.awarded then
					self.achievments[k].awarded = true
					self.achievments[k].unlock_time = v.received
				end
			end
			
			CustomAchiHandler.stats = CustomAchiHandler.stats or {}
			for k,v in pairs(data.stats or {}) do
				CustomAchiHandler.stats[k] = v
			end
		end
		
		if CustomAchiHandler.init_callback then
			CustomAchiHandler.init_callback("success")
		end
	end

	function AchievmentManager:init()
		self.exp_awards = {
			b = 1500,
			a = 500,
			c = 5000,
			none = 0
		}
		self.script_data = {}

		if SystemInfo:platform() == Idstring("WIN32") then
			if SystemInfo:distribution() == Idstring("STEAM") then
				self.oldest_achievement_callback_handler = CoreEvent.CallbackEventHandler:new()
				AchievmentManager.do_award = AchievmentManager.award_steam

				if not Global.achievment_manager then
					self:_parse_achievments("Steam")

	-------------------------------------------------------------
					self.handler = CustomAchiHandler
	-------------------------------------------------------------

					self.handler:initialized_callback(AchievmentManager.fetch_achievments)
					self.handler:init()

					Global.achievment_manager = {
						handler = self.handler,
						achievments = self.achievments
					}
				else
				
	---------------------------------------------------------------------
					self.handler = CustomAchiHandler
					Global.achievment_manager.handler = CustomAchiHandler
	---------------------------------------------------------------------

					self.achievments = Global.achievment_manager.achievments
				end
			else
				AchievmentManager.do_award = AchievmentManager.award_none

				self:_parse_achievments()

				if not Global.achievment_manager then
					Global.achievment_manager = {
						achievments = self.achievments
					}
				end

				self.achievments = Global.achievment_manager.achievments
			end
		elseif SystemInfo:platform() == Idstring("PS3") then
			if not Global.achievment_manager then
				Global.achievment_manager = {
					trophy_requests = {}
				}
			end

			self:_parse_achievments("PSN")

			AchievmentManager.do_award = AchievmentManager.award_psn
		elseif SystemInfo:platform() == Idstring("PS4") then
			if not Global.achievment_manager then
				self:_parse_achievments("PS4")

				Global.achievment_manager = {
					trophy_requests = {},
					achievments = self.achievments
				}
			else
				self.achievments = Global.achievment_manager.achievments
			end

			AchievmentManager.do_award = AchievmentManager.award_psn
		elseif SystemInfo:platform() == Idstring("X360") then
			self:_parse_achievments("X360")

			AchievmentManager.do_award = AchievmentManager.award_x360
		elseif SystemInfo:platform() == Idstring("XB1") then
			if not Global.achievment_manager then
				self:_parse_achievments("XB1")

				Global.achievment_manager = {
					achievments = self.achievments
				}
			else
				self.achievments = Global.achievment_manager.achievments
			end

			AchievmentManager.do_award = AchievmentManager.award_x360
		else
			Application:error("[AchievmentManager:init] Unsupported platform")
		end

		self._forced = Global.achievment_manager.forced or {}
		Global.achievment_manager.forced = self._forced
		self._recent_data = Global.achievment_manager.recent_time or {
			time = os.time() - 1
		}
		Global.achievment_manager.recent_time = self._recent_data
		self._with_progress = {}
		self._recent_progress = {}

		for id, data in pairs(self.achievments) do
			local v = tweak_data.achievement.visual[id]

			if v and v.progress then
				self._with_progress[id] = {
					info = data,
					visual = v,
					id = id
				}
			end
		end

		self._milestones = Global.achievment_manager.milestones_OP
		self._current_milestone = Global.achievment_manager.current_milestone_OP

		if not self._milestones or Global.achievment_manager.reset_milestones then
			self._milestones = deep_clone(tweak_data.achievement.milestones)
			Global.achievment_manager.milestones_OP = self._milestones
			self._current_milestone = self._milestones[1]
			Global.achievment_manager.reset_milestones = false
		end

		self._mission_end_achievements = {}
	end
end
if string.lower(RequiredScript) == "lib/network/matchmaking/networkaccountsteam" then
	CustomAchiHandler = CustomAchiHandler or {}
	CustomAchiHandler.stats = CustomAchiHandler.stats or {}

	local get_stat_orig = NetworkAccountSTEAM.get_stat
	function NetworkAccountSTEAM:get_stat(key, ...)
		local res = get_stat_orig(key, ...)
		
		if CustomAchiHandler.stats[key] then
			return CustomAchiHandler.stats[key]
		else
			CustomAchiHandler.stats[key] = 0
			return 0
		end
	end

	local publish_orig = NetworkAccountSTEAM.publish_statistics
	function NetworkAccountSTEAM:publish_statistics(stats, ...)
		if debug.getinfo(2).name == 'award_progress' then
			for k,v in pairs(stats) do
				CustomAchiHandler.stats[k] = CustomAchiHandler.stats[k] + v.value
			end
			CustomAchiHandler.needs_saving = true
		end
		publish_orig(self, stats, ...)
	end
end
if string.lower(RequiredScript) == "lib/managers/statisticsmanager" then
	CustomAchiHandler = CustomAchiHandler or {}
	CustomAchiHandler.stats = CustomAchiHandler.stats or {}

	local completed_orig = StatisticsManager.completed_job
	function StatisticsManager:completed_job(job_id, difficulty, require_one_down, ...)
		local res = completed_orig(self, job_id, difficulty, require_one_down, ...)
		
		local myid = job_id..'_'..difficulty
		if require_one_down then
			myid = myid..'_od'
		end
		
		if CustomAchiHandler.stats[myid] then
			return math.max(res - CustomAchiHandler.stats[myid], 0)
		else
			CustomAchiHandler.stats[myid] = res
			return 0
		end
	end
end