local data = CopDamage.get_damage_type
function CopDamage:get_damage_type(damage_percent, category)
	local dmg = damage_percent / self._HEALTH_GRANULARITY
	local tweak_name = self._unit:base() and self._unit:base().char_tweak_name and self._unit:base():char_tweak_name()

	if dmg > 0.25 and category == "bullet" then
		return "heavy_hurt"
	elseif dmg > 0.25 and category == "melee" then
		return "expl_hurt"
	elseif dmg > 0.25 and category == "explosion" and tweak_name == "tank" then
		return "heavy_hurt"
	end

	return data(self, damage_percent, category)
end