Hooks:PostHook(PlayerDamage, "_check_chico_heal", "Classic_Skilltree.gangster_damage_dampener", function(self, attack_data)
	if attack_data and attack_data.attacker_unit and (CopDamage and CopDamage.is_gangster(attack_data.attacker_unit:base()._tweak_table)) then
		attack_data.damage = attack_data.damage * managers.player:upgrade_value("player", "gangster_damage_dampener", 1)
	end
end)