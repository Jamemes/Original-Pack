function PlayerManager:critical_hit_chance()
	local multiplier = 0
	local weapon_unit = self:equipped_weapon_unit()

	if weapon_unit then
		local weapon = weapon_unit:base()

		if weapon and weapon:fire_mode() == "single" and weapon:is_category("smg", "assault_rifle", "snp") then
			multiplier = multiplier + self:upgrade_value("player", "critical_hit_chance", 0)
		end
	end
	multiplier = multiplier + self:upgrade_value("weapon", "critical_hit_chance", 0)
	multiplier = multiplier + self:team_upgrade_value("critical_hit", "chance", 0)
	multiplier = multiplier + self:get_hostage_bonus_multiplier("critical_hit") - 1
	multiplier = multiplier + managers.player:temporary_upgrade_value("temporary", "unseen_strike", 1) - 1
	multiplier = multiplier + self._crit_mul - 1
	local detection_risk_add_crit_chance = managers.player:upgrade_value("player", "detection_risk_add_crit_chance")
	multiplier = multiplier + self:get_value_from_risk_upgrade(detection_risk_add_crit_chance)

	return multiplier
end