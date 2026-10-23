function PlayerArrested:_enter(enter_data)
	self._ext_movement:set_attention_settings({
		"pl_enemy_cur_peaceful",
		"pl_team_cur_peaceful",
		"pl_civ_cbt"
	})
	if Network:is_server() and self._ext_movement:nav_tracker() then
		managers.groupai:state():on_player_weapons_hot()
	end
end