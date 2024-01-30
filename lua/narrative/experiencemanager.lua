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
	
	if managers.groupai and not managers.groupai:state():whisper_mode() then
		local current_buff = diff > 5 and 0.1 or 0.05
		local mul = Global.game_settings.one_down and 1 + managers.skirmish:current_wave_number() * 0.1 or 1
		params.mission_xp = params.mission_xp * mul
	end
	
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
