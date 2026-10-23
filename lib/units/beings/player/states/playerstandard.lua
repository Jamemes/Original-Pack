function PlayerStandard:_upd_attention()
	if not self._state_data.ducking then
		self._ext_movement:set_attention_settings({
			"pl_enemy_cbt",
			"pl_team_idle_std",
			"pl_civ_cbt"
		})
	elseif self._state_data.ducking then
		local crh_attention
		if managers.groupai:state():whisper_mode() then
			crh_attention = "pl_enemy_sneak"
		else
			crh_attention = "pl_enemy_cbt_crh"
		end
		self._ext_movement:set_attention_settings({
			crh_attention,
			"pl_team_idle_std",
			"pl_civ_sneak"
		})
	end
end