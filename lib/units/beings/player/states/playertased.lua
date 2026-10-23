function PlayerTased:_enter(enter_data)
	self._unit:base():set_slot(self._unit, 2)
	self._unit:camera():camera_unit():base():set_target_tilt(0)
	self._ext_movement:set_attention_settings({
		"pl_enemy_cbt",
		"pl_team_idle_std",
		"pl_civ_cbt"
	})
	if Network:is_server() and self._ext_movement:nav_tracker() then
		managers.groupai:state():on_player_weapons_hot()
	end
end