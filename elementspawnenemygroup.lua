Hooks:PostHook(ElementSpawnEnemyGroup, "_finalize_values", "inf_elementspawnenemygroup_finalize", function(self)
	PrintTable(self._values.preferred_spawn_groups)
end)