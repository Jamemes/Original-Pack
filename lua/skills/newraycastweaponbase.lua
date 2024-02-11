function NewRaycastWeaponBase:reload_speed_multiplier()
	if self._current_reload_speed_multiplier then
		return self._current_reload_speed_multiplier
	end

	local multiplier = 1

	for _, category in ipairs(self:weapon_tweak_data().categories) do
		multiplier = multiplier + 1 - managers.player:upgrade_value(category, "reload_speed_multiplier", 1)
	end

	if PlayerManager.walking_bleedout > 0 then
		local maxed = tweak_data.upgrades.walking_bleedout_post_reload_speed_penalty
		local wb_ttr = managers.player:upgrade_value("player", "walking_bleedout_ticks_to_ressurection", 120)
		local pm_wb =  (wb_ttr - PlayerManager.walking_bleedout)
		local total = (maxed - (maxed / wb_ttr * pm_wb))
		multiplier = multiplier * (tweak_data.upgrades.walking_bleedout_reload_speed_penalty - total)
	end
	
	multiplier = multiplier + 1 - managers.player:upgrade_value("weapon", "passive_reload_speed_multiplier", 1)
	multiplier = multiplier + 1 - managers.player:upgrade_value(self._name_id, "reload_speed_multiplier", 1)

	if self._setup and alive(self._setup.user_unit) and self._setup.user_unit:movement() then
		local morale_boost_bonus = self._setup.user_unit:movement():morale_boost()

		if morale_boost_bonus then
			multiplier = multiplier + 1 - morale_boost_bonus.reload_speed_bonus
		end

		if self._setup.user_unit:movement():next_reload_speed_multiplier() then
			multiplier = multiplier + 1 - self._setup.user_unit:movement():next_reload_speed_multiplier()
		end
	end

	if managers.player:has_activate_temporary_upgrade("temporary", "reload_weapon_faster") then
		multiplier = multiplier + 1 - managers.player:temporary_upgrade_value("temporary", "reload_weapon_faster", 1)
	end

	if managers.player:has_activate_temporary_upgrade("temporary", "single_shot_fast_reload") then
		multiplier = multiplier + 1 - managers.player:temporary_upgrade_value("temporary", "single_shot_fast_reload", 1)
	end

	multiplier = multiplier + 1 - managers.player:get_property("shock_and_awe_reload_multiplier", 1)
	multiplier = multiplier + 1 - managers.player:get_temporary_property("bloodthirst_reload_speed", 1)
	multiplier = multiplier + 1 - managers.player:upgrade_value("team", "crew_faster_reload", 1)
	multiplier = self:_convert_add_to_mul(multiplier)
	multiplier = multiplier * self:reload_speed_stat()
	multiplier = managers.modifiers:modify_value("WeaponBase:GetReloadSpeedMultiplier", multiplier)

	return multiplier
end

local data = NewRaycastWeaponBase._update_bullet_objects
function NewRaycastWeaponBase:_update_bullet_objects(ammo_func)
	data(self, ammo_func)
	local user_unit = self._setup and self._setup.user_unit
	local current_state = alive(user_unit) and user_unit:movement() and user_unit:movement()._current_state
	local chance_value = current_state and current_state:in_steelsight() and managers.player:upgrade_value("player", "shotgun_steelsight_shield_knock") or managers.player:upgrade_value("player", "shotgun_shield_knock") or 0
	self._shield_knock = math.random() <= chance_value and self:is_category("shotgun")
end

function NewRaycastWeaponBase:get_add_head_shot_mul()
	if self:is_category("smg", "assault_rifle") and self._fire_mode == Idstring("single") then
		return managers.player:upgrade_value("weapon", "automatic_head_shot_add", nil)
	end

	return nil
end

function NewRaycastWeaponBase:fire_rate_multiplier()
	local weapon_unit = managers.player:equipped_weapon_unit()
	local mul = self._fire_rate_multiplier
	if weapon_unit and weapon_unit:base():fire_mode() == "single" and weapon_unit:base():is_category("smg", "assault_rifle", "snp") then
		mul = mul + managers.player:upgrade_value("player", "single_shot_fire_rate_mul")
	end
	return mul
end