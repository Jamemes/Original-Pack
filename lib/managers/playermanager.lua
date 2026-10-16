local data = PlayerManager.on_killshot
function PlayerManager:on_killshot(killed_unit, variant, headshot, weapon_id)
	data(self, killed_unit, variant, headshot, weapon_id)
	
	local player_damage = self:player_unit():character_damage()
	local weapon_pistol = weapon_id and tweak_data.weapon and tweak_data.weapon[weapon_id] and tweak_data.weapon[weapon_id].categories and table.contains(tweak_data.weapon[weapon_id].categories, "pistol")
	if weapon_pistol and managers.player:has_category_upgrade("player", "pistol_revive_from_bleed_out") and player_damage:bleed_out() and player_damage:consume_messiah_charge() then
		player_damage:revive(true)
	end
end

local data = PlayerManager.update_deployable_equipment_amount_to_peers
function PlayerManager:update_deployable_equipment_amount_to_peers(equipment, amount)
	local equipments_available = self._global.equipment or {}
	if managers.player:has_category_upgrade("player", "carry_sentry_and_trip") and equipments_available.sentry_gun and equipments_available.trip_mine and amount == 0 then
		if equipment == "trip_mine" and not self:has_equipment("sentry_gun") then
			self:add_equipment({equipment = "sentry_gun"})
			self:select_next_item()
			return
		elseif equipment == "sentry_gun" and not self:has_equipment("trip_mine") then
			self:add_equipment({equipment = "trip_mine"})
			self:select_next_item()
			return
		end
	end
	
	data(self, equipment, amount)
end