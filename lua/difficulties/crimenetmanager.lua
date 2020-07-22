function CrimeNetGui:add_special_contracts(no_casino, no_quickplay)
	-- return --включение старых меток на карте для покупки контрактов, казино, гейдж и базы данных

	for index, special_contract in ipairs(tweak_data.gui.crime_net.special_contracts) do
		local skip = false

		if managers.custom_safehouse:unlocked() and special_contract.id == "challenge" or not managers.custom_safehouse:unlocked() and special_contract.id == "safehouse" then
			skip = true
		end
		skip = skip or special_contract.sp_only and not Global.game_settings.single_player
		skip = skip or special_contract.mp_only and Global.game_settings.single_player
		skip = skip or special_contract.no_session_only and managers.network:session()
		if not skip then
			self:add_special_contract(special_contract, no_casino, no_quickplay)
		end
	end
end

function CrimeNetManager:_get_jobs_by_jc() --Выпадение контрактов на ДВ и ниже
	local t = {}
	local plvl = managers.experience:current_level()
	local prank = managers.experience:current_rank()

	for _, job_id in ipairs(tweak_data.narrative:get_jobs_index()) do
		local is_cooldown_ok = managers.job:check_ok_with_cooldown(job_id)
		local is_not_wrapped = not tweak_data.narrative.jobs[job_id].wrapped_to_job
		local dlc = tweak_data.narrative:job_data(job_id).dlc
		local is_not_dlc_or_got = not dlc or managers.dlc:is_dlc_unlocked(dlc)
		local pass_all_tests = is_cooldown_ok and is_not_wrapped and is_not_dlc_or_got
		pass_all_tests = pass_all_tests and not tweak_data.narrative:is_job_locked(job_id)

		if pass_all_tests then
			local job_data = tweak_data.narrative:job_data(job_id)
			local start_difficulty = job_data.professional and 1 or 0
			local num_difficulties = Global.SKIP_OVERKILL_290 and 5 or job_data.professional and 6 or 6

			for i = start_difficulty, num_difficulties, 1 do
				local job_jc = math.clamp(job_data.jc + i * 10, 0, 100)
				local difficulty_id = 2 + i
				local difficulty = tweak_data:index_to_difficulty(difficulty_id)
				local level_lock = tweak_data.difficulty_level_locks[difficulty_id] or 0
				local level_lock_infamy = tweak_data.difficulty_level_locks_infamy[difficulty_id] or 0
			
				if prank >= 1 then
					if level_lock_infamy <= plvl then
						t[job_jc] = t[job_jc] or {}

						table.insert(t[job_jc], {
							job_id = job_id,
							difficulty_id = difficulty_id,
							difficulty = difficulty,
							marker_dot_color = job_data.marker_dot_color or nil,
							color_lerp = job_data.color_lerp or nil
						})
					end
				elseif prank < 1 then
					if level_lock <= plvl then
						t[job_jc] = t[job_jc] or {}

						table.insert(t[job_jc], {
							job_id = job_id,
							difficulty_id = difficulty_id,
							difficulty = difficulty,
							marker_dot_color = job_data.marker_dot_color or nil,
							color_lerp = job_data.color_lerp or nil
						})
					end
				end
			end
		else
			print("SKIP DUE TO COOLDOWN OR THE JOB IS WRAPPED INSIDE AN OTHER JOB", job_id)
		end
	end

	return t
end

function CrimeNetManager:_setup() --Выпадение рандомных контрактов с сохраненным фильтром сложности
	if self._presets then
		return
	end
	self._presets = {}
	local plvl = managers.experience:current_level()
	local player_stars = math.clamp(math.ceil((plvl + 1) / 10), 1, 10)
	local stars = player_stars
	local jc = math.lerp(0, 100, stars / 10)
	local jcs = tweak_data.narrative.STARS[stars].jcs
	local no_jcs = #jcs
	local chance_curve = tweak_data.narrative.STARS_CURVES[player_stars]
	local start_chance = tweak_data.narrative.JC_CHANCE
	local jobs_by_jc = self:_get_jobs_by_jc()
	local no_picks = self:_number_of_jobs(jcs, jobs_by_jc)
	local j = 0
	local tests = 0
	while j < no_picks do
		for i = 1, no_jcs, 1 do
			local chance = nil
			chance = no_jcs - 1 == 0 and 1 or math.lerp(start_chance, 1, math.pow((i - 1) / (no_jcs - 1), chance_curve))
			if not jobs_by_jc[jcs[i]] then
				
			elseif #jobs_by_jc[jcs[i]] == 0 then
				
			else
				local job_data = nil
				job_data = self._debug_mass_spawning and jobs_by_jc[jcs[i]][math.random(#jobs_by_jc[jcs[i]])] or table.remove(jobs_by_jc[jcs[i]], math.random(#jobs_by_jc[jcs[i]]))
				local job_tweak = tweak_data.narrative:job_data(job_data.job_id)
				local chance_multiplier = job_tweak and job_tweak.spawn_chance_multiplier or 1
				job_data.chance = chance * chance_multiplier
				-- local difficulty_filter_index = managers.user:get_setting("crimenet_filter_difficulty")

				-- if difficulty_filter_index > 0 then
					-- job_data.difficulty = tweak_data:index_to_difficulty(difficulty_filter_index)
					-- job_data.difficulty_id = difficulty_filter_index
				-- end

				table.insert(self._presets, job_data)

				j = j + 1
				break
			end
		end
		tests = tests + 1
		if self._debug_mass_spawning then
			if tweak_data.gui.crime_net.debug_options.mass_spawn_limit <= tests then
				break
			end
		elseif no_picks <= tests then
			break
		end
	end
	local old_presets = self._presets
	self._presets = {}
	while #old_presets > 0 do
		table.insert(self._presets, table.remove(old_presets, math.random(#old_presets)))
	end
end
function CrimeNetManager:update_difficulty_filter() --Выпадение рандомных контрактов с сохраненным фильтром сложности
	if self._presets then
		local difficulty_filter_index = managers.user:get_setting("crimenet_filter_difficulty")

		if difficulty_filter_index > 0 then
			local difficulty_name = tweak_data:index_to_difficulty(difficulty_filter_index)

			for _, job_data in ipairs(self._presets) do
				job_data.difficulty = difficulty_name
				-- job_data.difficulty_id = difficulty_filter_index
			end
		else
			self._presets = nil

			self:_setup()
		end
	end
end

Hooks:PreHook(CrimeNetGui, "update_job_gui", "four_skulls", function(data, job, inside) --4 черепа на контрактах в краймнете
	local stars_panel = job.side_panel:child("stars_panel")
	stars_panel:set_w(44)
end)
