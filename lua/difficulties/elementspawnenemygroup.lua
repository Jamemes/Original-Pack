Hooks:PostHook(ElementSpawnEnemyGroup, "_finalize_values", "inf_elementspawnenemygroup_finalize", function(self)
	local groups = {}
	local disallowed = {
		"tac_shield_wall_charge",
		"tac_bull_rush",
		"tac_shield_wall",
		"tac_tazer_charge",
		"tac_shield_wall_ranged",
		"tac_swat_rifle_flank",
		"tac_tazer_flanking",
		"marshal_squad",
		"Phalanx"
	}
	
	for name, _ in pairs(tweak_data.group_ai.enemy_spawn_groups) do
		if not table.contains(groups, name) and not table.contains(disallowed, name) then
			table.insert(groups, name)
		end
	end
	
	if self._values.preferred_spawn_groups and not table.contains(self._values.preferred_spawn_groups, "single_spooc") then
		self._values.preferred_spawn_groups = groups
	end
end)
