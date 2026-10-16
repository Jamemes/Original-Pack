local data = GamePlayCentralManager.auto_highlight_enemy
function GamePlayCentralManager:auto_highlight_enemy(unit, use_player_upgrades)
	if unit:base() and unit:base().trip_mine then
		use_player_upgrades = managers.player:has_category_upgrade("trip_mine", "marked_enemy_extra_damage")
	end
	
	data(self, unit, use_player_upgrades)
	
	if unit:base() and unit:base().trip_mine and managers.player:has_category_upgrade("trip_mine", "marked_enemy_extra_damage") then
		unit:contour():add("mark_enemy_damage_bonus", true, 1)
	end
end