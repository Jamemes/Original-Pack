local data = PlayerManager.total_body_bags
function PlayerManager:total_body_bags()
	local addend = 0
	if Global.game_settings.level_id == "short1_stage1" then
		addend = addend + 1 
	end
	return data(self) + addend
end

PlayerManager.walking_bleedout = 0
function PlayerManager:health_skill_multiplier()
	local multiplier = 1
	multiplier = multiplier + self:upgrade_value("player", "fugitive_tier_health_multiplier", 1) - 1
	multiplier = multiplier + self:upgrade_value("player", "health_multiplier", 1) - 1
	multiplier = multiplier + self:upgrade_value("player", "passive_health_multiplier", 1) - 1
	multiplier = multiplier + self:team_upgrade_value("health", "passive_multiplier", 1) - 1
	multiplier = multiplier + self:get_hostage_bonus_multiplier("health") - 1
	multiplier = multiplier - self:upgrade_value("player", "health_decrease", 0)
	if self:num_local_minions() > 0 then
		multiplier = multiplier + self:upgrade_value("player", "minion_master_health_multiplier", 1) - 1
	end
	return multiplier
end

function PlayerManager:movement_speed_multiplier(speed_state, bonus_multiplier, upgrade_level, health_ratio)
	local multiplier = 1.00000001
	if PlayerManager.walking_bleedout > 0 then
		local maxed = 1 - tweak_data.upgrades.walking_bleedout_walk_speed_penalty
		local wb_ttr = managers.player:upgrade_value("player", "walking_bleedout_ticks_to_ressurection", 10^10)
		local pm_wb =  (wb_ttr - PlayerManager.walking_bleedout)
		local total = (maxed - (maxed / wb_ttr * pm_wb))
		multiplier = multiplier + (tweak_data.upgrades.walking_bleedout_walk_speed_penalty + total) - 1
	end
	local armor_penalty = self:mod_movement_penalty(self:body_armor_value("movement", upgrade_level, 1))
	multiplier = multiplier + armor_penalty - 1
	if bonus_multiplier then
		multiplier = multiplier + bonus_multiplier - 1
	end
	if speed_state then
		multiplier = multiplier + self:upgrade_value("player", speed_state .. "_speed_multiplier", 1) - 1
	end
	multiplier = multiplier + self:get_hostage_bonus_multiplier("speed") - 1
	multiplier = multiplier + self:upgrade_value("player", "movement_speed_multiplier", 1) - 1
	if self:num_local_minions() > 0 then
		multiplier = multiplier + self:upgrade_value("player", "minion_master_speed_multiplier", 1) - 1
	end
	if self:has_category_upgrade("player", "secured_bags_speed_multiplier") then
		local bags = 0
		bags = bags + (managers.loot:get_secured_mandatory_bags_amount() or 0)
		bags = bags + (managers.loot:get_secured_bonus_bags_amount() or 0)
		multiplier = multiplier + bags * (self:upgrade_value("player", "secured_bags_speed_multiplier", 1) - 1)
	end
	if managers.player:has_activate_temporary_upgrade("temporary", "berserker_damage_multiplier") then
		multiplier = multiplier * (tweak_data.upgrades.berserker_movement_speed_multiplier or 1)
	end
	if health_ratio then
		local damage_health_ratio = self:get_damage_health_ratio(health_ratio, "movement_speed")
		multiplier = multiplier * (1 + managers.player:upgrade_value("player", "movement_speed_damage_health_ratio_multiplier", 0) * damage_health_ratio)
	end
	local damage_speed_multiplier = managers.player:temporary_upgrade_value("temporary", "damage_speed_multiplier", managers.player:temporary_upgrade_value("temporary", "team_damage_speed_multiplier_received", 1))
	multiplier = multiplier * damage_speed_multiplier
	return multiplier
end

function PlayerManager:add_cable_ties()
end