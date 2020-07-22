SkillTreeManager.VERSION = 10
local get_skill_costs = function()
	local t = {
		{1, 3},
		{1, 3},
		{1, 3},
		{1, 3},
		{4, 8},
		{4, 8},
		{4, 8}
	}
	return t
end

function SkillTreeManager:skill_cost(tier, skill_level, skill_cost)
	local t = skill_cost or get_skill_costs()

	return t[tier][skill_level]
end

function SkillTreeManager:_points_spent_skill(tier, skill_id)
	local points = 0
	local skill_costs = get_skill_costs()
	local skill_level = self._global.skills[skill_id].unlocked

	if skill_level and skill_level >= 1 then
		for j = skill_level, 1, -1 do
			points = points + self:skill_cost(tier, j, skill_costs)
		end
	end

	return points
end

function SkillTreeManager:get_points_spent_in_tier(tier, tier_idx)
	local skills = self._global.skills
	local skill_costs = get_skill_costs()
	local points = 0

	for i = 1, #tier, 1 do
		local skill_level = skills[tier[i]].unlocked

		if skill_level and skill_level >= 1 then
			for j = skill_level, 1, -1 do
				points = points + self:skill_cost(tier_idx, j, skill_costs)
			end
		end
	end

	return points
end

function SkillTreeManager:get_points_spent_until_tier(tiers, target_tier_idx)
	local skills = self._global.skills
	local skill_costs = get_skill_costs()
	local points = 0

	for i = 1, target_tier_idx, 1 do
		for j = 1, #tiers[i], 1 do
			local skill_level = skills[tiers[i][j]].unlocked

			if skill_level and skill_level >= 1 then
				for k = skill_level, 1, -1 do
					points = points + self:skill_cost(i, k, skill_costs)
				end
			end
		end
	end

	return points
end

