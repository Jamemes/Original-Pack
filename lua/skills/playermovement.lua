function PlayerMovement:is_SPOOC_attack_allowed()
	if self._unit:character_damage():get_mission_blocker("invulnerable") or self._unit:character_damage().swansong then
		return false
	end
	
	if self._current_state_name == "driving" then
		return false
	end
	
	if PlayerManager.walking_bleedout > 0 then
		return false
	end
	
	return true
end

function PlayerMovement:is_taser_attack_allowed()
	if self._unit:character_damage():get_mission_blocker("invulnerable") or self._current_state_name == "driving" or self._unit:base().parachuting then
		return false
	end
	
	if PlayerManager.walking_bleedout > 0 then
		return false
	end
	
	return true
end