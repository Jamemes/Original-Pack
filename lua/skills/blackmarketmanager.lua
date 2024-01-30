function BlackMarketManager:unlock_overpowered_weapons()
	return managers.experience:current_level() >= 85, "bm_menu_unlock_overpowered"
end

function BlackMarketManager:unlock_akimbo_pistols()
	return managers.player:has_category_upgrade("player", "unlock_akimbo_pistols"), "bm_menu_unlock_akimbo"
end

function BlackMarketManager:unlock_akimbo_shotguns()
	return managers.player:has_category_upgrade("player", "unlock_akimbo_shotguns"), "bm_menu_unlock_gunzerker"
end

function BlackMarketManager:unlock_akimbo_smg()
	return managers.player:has_category_upgrade("player", "unlock_akimbo_smg"), "bm_menu_unlock_gunzerker"
end
					
function BlackMarketManager:recoil_multiplier(name, categories, silencer, blueprint, is_moving)
	local multiplier = 1

	local weapon_unit = managers.player:equipped_weapon_unit()
	if weapon_unit and weapon_unit:base():fire_mode() == "single" and weapon_unit:base():is_category("smg", "assault_rifle", "snp") then
		if not is_moving then
			multiplier = multiplier + 1 - managers.player:upgrade_value("player", "recoil_not_moving_mul", 1)
		end
		if managers.player:player_unit():movement()._current_state:in_steelsight() then
			multiplier = multiplier + 1 - managers.player:upgrade_value("player", "recoil_not_moving_aim_mul", 1)
		end
	end

	for _, category in ipairs(categories) do
		multiplier = multiplier + 1 - managers.player:upgrade_value(category, "recoil_multiplier", 1)
		multiplier = multiplier + 1 - managers.player:upgrade_value(category, "passive_recoil_multiplier", 1)
	end
	if managers.player:player_unit() and managers.player:player_unit():character_damage():is_suppressed() then
		for _, category in ipairs(categories) do
			if managers.player:has_team_category_upgrade(category, "suppression_recoil_multiplier") then
				multiplier = multiplier + 1 - managers.player:team_upgrade_value(category, "suppression_recoil_multiplier", 1)
			end
		end

		if managers.player:has_team_category_upgrade("weapon", "suppression_recoil_multiplier") then
			multiplier = multiplier + 1 - managers.player:team_upgrade_value("weapon", "suppression_recoil_multiplier", 1)
		end
	else
		for _, category in ipairs(categories) do
			if managers.player:has_team_category_upgrade(category, "recoil_multiplier") then
				multiplier = multiplier + 1 - managers.player:team_upgrade_value(category, "recoil_multiplier", 1)
			end
		end

		if managers.player:has_team_category_upgrade("weapon", "recoil_multiplier") then
			multiplier = multiplier + 1 - managers.player:team_upgrade_value("weapon", "recoil_multiplier", 1)
		end
	end

	multiplier = multiplier + 1 - managers.player:upgrade_value(name, "recoil_multiplier", 1)
	multiplier = multiplier + 1 - managers.player:upgrade_value("weapon", "passive_recoil_multiplier", 1)
	multiplier = multiplier + 1 - managers.player:upgrade_value("player", "recoil_multiplier", 1)
	if silencer then
		multiplier = multiplier + 1 - managers.player:upgrade_value("weapon", "silencer_recoil_multiplier", 1)

		for _, category in ipairs(categories) do
			multiplier = multiplier + 1 - managers.player:upgrade_value(category, "silencer_recoil_multiplier", 1)
		end
	end
	if blueprint and self:is_weapon_modified(managers.weapon_factory:get_factory_id_by_weapon_id(name), blueprint) then
		multiplier = multiplier + 1 - managers.player:upgrade_value("weapon", "modded_recoil_multiplier", 1)
	end
	return self:_convert_add_to_mul(multiplier)
end

function BlackMarketManager:damage_addend(name, categories, silencer, detection_risk, current_state, blueprint)
	local value = 0

	local category = tweak_data.weapon[name].use_data.selection_index
	if silencer and category == 1 then
		value = value + managers.player:upgrade_value("player", "secondary_silencer_damage_addend", 0)
	end
	
	if tweak_data.weapon[name] and tweak_data.weapon[name].ignore_damage_upgrades then
		return value
	end
	value = value + managers.player:upgrade_value("player", "damage_addend", 0)
	value = value + managers.player:upgrade_value("weapon", "damage_addend", 0)
	value = value + managers.player:upgrade_value(name, "damage_addend", 0)
	for _, category in ipairs(categories) do
		value = value + managers.player:upgrade_value(category, "damage_addend", 0)
	end
	return value
end