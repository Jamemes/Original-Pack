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