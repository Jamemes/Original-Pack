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
		job_id == "nail" then mission_xp_dissect = 6357 or self:mission_xp() elseif
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
		job_id == "help" then mission_xp_dissect = 7857 or self:mission_xp() elseif
		job_id == "haunted" then mission_xp_dissect = 2357 or self:mission_xp() elseif
		job_id == "spa" then mission_xp_dissect = 12857 or self:mission_xp() elseif
		job_id == "fish" then mission_xp_dissect = 6357 or self:mission_xp() elseif
		job_id == "moon" then mission_xp_dissect = 7000 or self:mission_xp() elseif
		job_id == "dah" then mission_xp_dissect = 30000 or self:mission_xp() elseif
		job_id == "rvd" then mission_xp_dissect = 8571 or self:mission_xp() elseif
		job_id == "rvd_pro" then mission_xp_dissect = 11071 or self:mission_xp() elseif
		job_id == "hvh" then mission_xp_dissect = 3786 or self:mission_xp() elseif
		job_id == "wwh" then mission_xp_dissect = 6714 or self:mission_xp() elseif
		job_id == "brb" then mission_xp_dissect = 6214 or self:mission_xp() elseif
		job_id == "tag" then mission_xp_dissect = 4357 or self:mission_xp() elseif
		job_id == "des" then mission_xp_dissect = 22857 or self:mission_xp() elseif
		job_id == "sah" then mission_xp_dissect = 5929 or self:mission_xp() elseif
		job_id == "bph" then mission_xp_dissect = 10000 or self:mission_xp() elseif
		job_id == "mex" then mission_xp_dissect = 9286 or self:mission_xp() elseif
		job_id == "mex_cooking" then mission_xp_dissect = 4643 or self:mission_xp() elseif
		job_id == "bex" then mission_xp_dissect = 9286 or self:mission_xp() elseif
		job_id == "safehouse" then mission_xp_dissect = 1000 or self:mission_xp() elseif
		job_id == "short1" then mission_xp_dissect = 1000 or self:mission_xp() elseif
		job_id == "short2" then mission_xp_dissect = 2000 or self:mission_xp() elseif
		job_id == "skm_red2" or "skm_mus" or "skm_run" or "skm_watchdogs_stage2" then mission_xp_dissect = params.mission_xp or self:mission_xp() elseif
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