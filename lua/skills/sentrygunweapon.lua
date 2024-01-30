local data = SentryGunWeapon.setup
function SentryGunWeapon:setup(setup_data)
	data(self, setup_data)
	local sentry_gun_silent = managers.player:selected_equipment_id() == "sentry_gun_silent"
	if sentry_gun_silent then
		self._use_armor_piercing = true
		self._slow_fire_rate = true
		self._current_damage_mul = 3
		self._fire_rate_reduction = 3.5
		self._spread_mul = 0.5
	end
end