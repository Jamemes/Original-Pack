Hooks:PostHook(ElementSpawnEnemyGroup, "_finalize_values", "inf_elementspawnenemygroup_finalize", function(self)
	local groups = {}
	for name,_ in pairs(tweak_data.group_ai.enemy_spawn_groups) do
		if not table.contains(groups, name) then
			table.insert(groups, name)
		end
	end

	self._values.preferred_spawn_groups = groups
end)