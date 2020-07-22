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