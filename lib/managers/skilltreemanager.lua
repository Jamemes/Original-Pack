function SkillTreeManager:skill_cost(tier, skill_level, skill_cost)
	return 0
end

function SkillTreeManager:_create_tree_data(tree_id)
	self._global.trees[tree_id] = {
		unlocked = false,
		points_spent = Application:digest_value(0, true)
	}
end

function SkillTreeManager:unlock_tree(tree)
	if self._global.trees[tree].unlocked then
		Application:error("Tree", tree, "allready unlocked")
		return
	end
	local skill_id = tweak_data.skilltree.trees[tree].skill
	local to_unlock = managers.skilltree:next_skill_step(skill_id)
	local total_points, points = managers.skilltree:get_skill_points(skill_id, to_unlock)
	local skill = tweak_data.skilltree.skills[skill_id][to_unlock]
	if not skill or not skill.cost then
		print("[SkillTreeManager:unlock_tree] skill tree: \"" .. tostring(skill_id) .. "\" is missing cost!")
	end
	if total_points > self:points() then
		return
	end
	self._global.trees[tree].unlocked = true
	self:_spend_points(tree, nil, total_points, points)
end

function SkillTreeManager:get_skill_points(skill, index)
	local points = tweak_data.skilltree.skills[skill][index] and tweak_data.skilltree.skills[skill][index].cost and Application:digest_value(tweak_data.skilltree.skills[skill][index].cost, false) or 0
	local total_points = points
	if points > 0 then
		for _, tree in ipairs(tweak_data.skilltree.trees) do
			if tree.skill == skill then
				local unlocked = self:trees_unlocked()
				if unlocked < #tweak_data.skilltree.unlock_tree_cost then
					total_points = points + Application:digest_value(tweak_data.skilltree.unlock_tree_cost[unlocked + 1], false)
				end
			else
			end
		end
	end
	return total_points, points
end
	
function SkillTreeManager:switch_skills(selected_skill_switch)
	if selected_skill_switch == self._global.selected_skill_switch then
		return
	end
	
	if not self._global.skill_switches[selected_skill_switch] then
		return
	end
	
	if not self._global.skill_switches[selected_skill_switch].unlocked then
		return
	end

	if self:is_skill_switch_suspended(self._global.skill_switches[selected_skill_switch]) then
		return
	end
	
	local function unaquire_skill(skill_id)
		local progress_data = self._global.skills[skill_id]
		local skill_data = tweak_data.skilltree.skills[skill_id]
		for i = progress_data.unlocked, 1, -1 do
			local step_data = skill_data[i]
			local upgrades = step_data.upgrades
			if upgrades then
				for i = #upgrades, 1, -1 do
					local upgrade = upgrades[i]
					managers.upgrades:unaquire(upgrade, UpgradesManager.AQUIRE_STRINGS[2] .. "_" .. tostring(skill_id))
				end
			end
		end
	end

	for tree, data in pairs(tweak_data.skilltree.trees) do
		local tree_data = tweak_data.skilltree.trees[tree]
		for i = #tree_data.tiers, 1, -1 do
			local tier = tree_data.tiers[i]
			for _, skill in ipairs(tier) do
				unaquire_skill(skill)
			end
		end
		unaquire_skill(tree_data.skill)
	end
	self._global.selected_skill_switch = selected_skill_switch
	local data = self._global.skill_switches[self._global.selected_skill_switch]
	self._global.points = data.points
	self._global.trees = data.trees
	self._global.skills = data.skills
	for tree_id, tree_data in pairs(self._global.trees) do
		if tree_data.unlocked and not tweak_data.skilltree.trees[tree_id].dlc then
			local skill_id = tweak_data.skilltree.trees[tree_id].skill
			local skill = tweak_data.skilltree.skills[skill_id]
			local skill_data = self._global.skills[skill_id]
			for i = 1, skill_data.unlocked do
				self:_aquire_skill(skill[i], skill_id, true)
			end
			for tier, skills in pairs(tweak_data.skilltree.trees[tree_id].tiers) do
				for _, skill_id in ipairs(skills) do
					local skill = tweak_data.skilltree.skills[skill_id]
					local skill_data = self._global.skills[skill_id]
					for i = 1, skill_data.unlocked do
						self:_aquire_skill(skill[i], skill_id, true)
					end
				end
			end
		end
	end
	self:set_current_specialization(self:digest_value(data.specialization, false), 1)
	MenuCallbackHandler:_update_outfit_information()
	
	return true
end

function SkillTreeManager:_setup_skill_switches()
	self._global.skill_switches = {}
	local switch_data
	for i = 1, #tweak_data.skilltree.skill_switches do
		self._global.skill_switches[i] = {
			unlocked = i == 1,
			name = nil,
			points = Application:digest_value(0, true),
			specialization = false
		}
		switch_data = self._global.skill_switches[i]
		switch_data.trees = {}
		for tree, data in pairs(tweak_data.skilltree.trees) do
			switch_data.trees[tree] = {
				unlocked = false,
				points_spent = Application:digest_value(0, true)
			}
		end
		switch_data.skills = {}
		for skill_id, data in pairs(tweak_data.skilltree.skills) do
			switch_data.skills[skill_id] = {
				unlocked = 0,
				total = #data
			}
		end
	end
end

function SkillTreeManager:_spend_points(tree, tier, points, points_tier)
	local pre_unlocked_tier = self:current_max_tier(tree)
	managers.money:on_skillpoint_spent(tree, tier, points)
	self:_set_points(self:points() - points)
	self:_set_points_spent(tree, self:points_spent(tree) + points_tier)
	local post_unlocked_tier = self:current_max_tier(tree)
	if not tier or pre_unlocked_tier < post_unlocked_tier then
		self:_on_tier_unlocked(tree, post_unlocked_tier)
	end
	self:_on_points_spent(tree, points)
end

function SkillTreeManager:unlock(tree, skill_id)
	if not self._global.trees[tree].unlocked then
		Application:error("Cannot unlock skill", skill_id, "in tree", tree, ". Tree is locked")
		return
	end
	if self._global.skills[skill_id].unlocked >= self._global.skills[skill_id].total then
		Application:error("No more steps to unlock in skill", skill_id)
		return
	end
	local talent = tweak_data.skilltree.skills[skill_id]
	local prerequisites = talent.prerequisites or {}
	for _, prerequisite in ipairs(prerequisites) do
		local unlocked = managers.skilltree:skill_step(prerequisite)
		if unlocked and unlocked == 0 then
			return
		end
	end
	local to_unlock = managers.skilltree:next_skill_step(skill_id)
	local skill = talent[to_unlock]
	local total_points, points = managers.skilltree:get_skill_points(skill_id, to_unlock)
	if total_points > self:points() then
		return
	end
	self._global.skills[skill_id].unlocked = to_unlock
	local tier
	for i, tier_skills in ipairs(tweak_data.skilltree.trees[tree].tiers) do
		if table.contains(tier_skills, skill_id) then
			tier = i
		else
		end
	end
	self:_spend_points(tree, tier, total_points, points)
	self:_aquire_skill(skill, skill_id)
	self:_on_skill_unlocked(tree, skill_id)
	if SystemInfo:platform() == Idstring("WIN32") then
		managers.statistics:publish_skills_to_steam()
	end
end

function SkillTreeManager:_on_tier_unlocked(tree, tier)
	local skill_id = tweak_data.skilltree.trees[tree].skill
	local to_unlock = managers.skilltree:next_skill_step(skill_id)
	while tier >= to_unlock do
		local skill = tweak_data.skilltree.skills[skill_id][to_unlock]
		if not skill then
			print("SkillTreeManager:_on_tier_unlocked: No tier upgrade at tier", tier, "for tree", tree)
			break
		end
		self._global.skills[skill_id].unlocked = to_unlock
		self:_aquire_skill(skill, skill_id)
		self:_on_skill_unlocked(tree, skill_id)
		to_unlock = managers.skilltree:next_skill_step(skill_id)
	end
	managers.menu_component:on_tier_unlocked(tree, tier)
end

function SkillTreeManager:_on_skill_unlocked(tree, skill_id)
	managers.menu_component:on_skill_unlocked(tree, skill_id)
end

function SkillTreeManager:_unlock(tree, skill_id)
	local skill = tweak_data.skills.definitions[skill_id]
	self:_aquire_skill(skill, skill_id)
end

function SkillTreeManager:_aquire_skill(skill, skill_id, loading)
	if skill and skill.upgrades then
		for _, upgrade in ipairs(skill.upgrades) do
			managers.upgrades:aquire(upgrade, loading, UpgradesManager.AQUIRE_STRINGS[2] .. "_" .. tostring(skill_id))
		end
	end
end

function SkillTreeManager:_reset_skilltree(tree, forced_respec_multiplier)
	self:_set_points_spent(tree, 0)
	self._global.trees[tree].unlocked = false
	managers.money:on_respec_skilltree(tree, forced_respec_multiplier)
	local tree_data = tweak_data.skilltree.trees[tree]
	for i = #tree_data.tiers, 1, -1 do
		local tier = tree_data.tiers[i]
		for _, skill in ipairs(tier) do
			self:_unaquire_skill(skill)
		end
	end
	self:_unaquire_skill(tree_data.skill)
end

function SkillTreeManager:_verify_loaded_data(points_aquired_during_load)
	local level_points = managers.experience:current_level()
	local assumed_points = level_points + points_aquired_during_load

	for i, switch_data in ipairs(self._global.skill_switches) do
		local points = assumed_points

		for skill_id, data in pairs(clone(switch_data.skills)) do
			if not tweak_data.skilltree.skills[skill_id] then
				print("[SkillTreeManager:_verify_loaded_data] Skill doesn't exists", skill_id, ", removing loaded data.", "skill_switch", i)

				switch_data.skills[skill_id] = nil
			end
		end

		for tree_id, data in pairs(clone(switch_data.trees)) do
			if not tweak_data.skilltree.trees[tree_id] then
				print("[SkillTreeManager:_verify_loaded_data] Tree doesn't exists", tree_id, ", removing loaded data.", "skill switch", i)

				switch_data.trees[tree_id] = nil
			end
		end

		for tree_id, data in pairs(clone(switch_data.trees)) do
			local points_spent = math.max(Application:digest_value(data.points_spent, false), 0)
			data.points_spent = Application:digest_value(points_spent, true)
			points = points - points_spent
		end

		local unlocked = self:trees_unlocked(switch_data.trees)

		while unlocked > 0 do
			unlocked = unlocked - 1
		end

		switch_data.points = Application:digest_value(points, true)
	end

	for i = 1, #self._global.skill_switches do
		if self._global.skill_switches[i] and Application:digest_value(self._global.skill_switches[i].points or 0, false) < 0 then
			local switch_data = self._global.skill_switches[i]

			if self._global.skill_switches[self._global.selected_skill_switch] and self._global.skill_switches[self._global.selected_skill_switch] == switch_data then
				self._global.selected_skill_switch = 1
			end

			switch_data.points = Application:digest_value(0, true)
		end
	end

	if not self._global.skill_switches[self._global.selected_skill_switch] then
		self._global.selected_skill_switch = 1
	end

	local data = self._global.skill_switches[self._global.selected_skill_switch]
	self._global.points = data.points
	self._global.trees = data.trees
	self._global.skills = data.skills

	for tree_id, tree_data in pairs(self._global.trees) do
		if tree_data.unlocked and not tweak_data.skilltree.trees[tree_id].dlc then
			local skill_id = tweak_data.skilltree.trees[tree_id].skill
			local skill = tweak_data.skilltree.skills[skill_id]
			local skill_data = self._global.skills[skill_id]
			for i = 1, skill_data.unlocked do
				self:_aquire_skill(skill[i], skill_id, true)
			end
			for tier, skills in pairs(tweak_data.skilltree.trees[tree_id].tiers) do
				for _, skill_id in ipairs(skills) do
					local skill = tweak_data.skilltree.skills[skill_id]
					local skill_data = self._global.skills[skill_id]

					for i = 1, skill_data.unlocked do
						self:_aquire_skill(skill[i], skill_id, true)
					end
				end
			end
		end
	end

	local specialization_tweak = tweak_data.skilltree.specializations
	local points, points_left, data = nil
	local total_points_spent = 0
	local current_specialization = self:digest_value(self._global.specializations.current_specialization, false, 1)
	local spec_data = specialization_tweak[current_specialization]

	if not spec_data or spec_data.dlc and not managers.dlc:is_dlc_unlocked(spec_data.dlc) then
		local old_specialization = self._global.specializations.current_specialization
		current_specialization = 1
		self._global.specializations.current_specialization = self:digest_value(current_specialization, true, 1)

		for i, switch_data in ipairs(self._global.skill_switches) do
			if switch_data.specialization == old_specialization then
				switch_data.specialization = self._global.specializations.current_specialization
			end
		end
	end

	for tree, data in ipairs(self._global.specializations) do
		if specialization_tweak[tree] then
			points = self:digest_value(data.points_spent, false)
			points_left = points

			for tier, spec_data in ipairs(specialization_tweak[tree]) do
				if spec_data.cost <= points_left then
					points_left = points_left - spec_data.cost
					if data.choices then
						local multi_choice = spec_data.multi_choice
						local choice_index = data.choices[tier] and self:digest_value(data.choices[tier], false)

						if not multi_choice or not choice_index or not multi_choice[choice_index] then
							if multi_choice and multi_choice[1] then
								data.choices[tier] = self:digest_value(1, true)
								choice_index = 1
							else
								data.choices[tier] = nil
								choice_index = nil
							end
						end
					end

					if tree == current_specialization then
						for _, upgrade in ipairs(spec_data.upgrades) do
							managers.upgrades:aquire(upgrade, true, UpgradesManager.AQUIRE_STRINGS[3] .. tostring(current_specialization))
						end

						if multi_choice and choice_index then
							for _, upgrade in ipairs(multi_choice[choice_index].upgrades) do
								managers.upgrades:aquire(upgrade, true, UpgradesManager.AQUIRE_STRINGS[7] .. tostring(current_specialization))
							end
						end
					end

					if tier == #specialization_tweak[tree] then
						data.tiers.current_tier = self:digest_value(tier, true)
						data.tiers.max_tier = self:digest_value(#specialization_tweak[tree], true)
						data.tiers.next_tier_data = false
					end
				else
					data.tiers.current_tier = self:digest_value(tier - 1, true)
					data.tiers.max_tier = self:digest_value(#specialization_tweak[tree], true)
					data.tiers.next_tier_data = {
						current_points = self:digest_value(points_left, true),
						points = self:digest_value(spec_data.cost, true)
					}
					points_left = 0

					break
				end
			end

			data.points_spent = self:digest_value(points - points_left, true)
			total_points_spent = total_points_spent + points - points_left
		end
	end

	total_points_spent = total_points_spent + self:digest_value(self._global.specializations.points, false)

	if self:digest_value(self._global.specializations.total_points, false) ~= total_points_spent then
		Application:error("[SkillTreeManager] Specialization points do not match up, reseting everything!!!")
		self:reset_specializations()
	else
		local max_points = self:digest_value(self._global.specializations.max_points, false)
		local points = self:digest_value(self._global.specializations.points, false)

		if max_points < total_points_spent or max_points < points then
			self._global.specializations.total_points = self:digest_value(max_points, true)
			self._global.specializations.points = self:digest_value(math.max(total_points_spent - max_points, 0), true)
			self._global.specializations.points_present = self:digest_value(0, true)
			self._global.specializations.xp_present = self:digest_value(0, true)
			self._global.specializations.xp_leftover = self:digest_value(0, true)
		end
	end
end

if type(SkillTreeManager.max_points_for_current_level) == "nil" then
	function SkillTreeManager:max_points_for_current_level()
		local rep_upgrade_points = 0

		for _, rep_upgrade in ipairs(managers.upgrades:aquired_by_category("rep_upgrade")) do
			local value = tweak_data.upgrades.definitions[rep_upgrade] and tweak_data.upgrades.definitions[rep_upgrade].value or 0
			rep_upgrade_points = rep_upgrade_points + value
		end

		return managers.experience:current_level() + rep_upgrade_points
	end

	function SkillTreeManager:is_skill_switch_suspended(switch_data)
		return self:max_points_for_current_level() < self:total_points_spent(switch_data)
	end

	function SkillTreeManager:total_points_spent(switch_data)
		local points = 0

		for tree, data in pairs(tweak_data.skilltree.trees) do
			points = points + self:points_spent(tree, switch_data)
		end

		return points
	end
end