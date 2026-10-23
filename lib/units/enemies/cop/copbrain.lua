function CopBrain:set_attention_settings(params)
	local att_settings
	if params then
		if params.peaceful then
			att_settings = {
				"enemy_team_idle"
			}
		elseif params.cbt then
			if managers.groupai:state():enemy_weapons_hot() then
				att_settings = {
					"enemy_team_cbt"
				}
			else
				att_settings = {
					"enemy_team_cbt",
					"enemy_enemy_cbt",
					"enemy_civ_cbt"
				}
				if not self._enemy_weapons_hot_listen_id then
					self._enemy_weapons_hot_listen_id = "CopBrain" .. tostring(self._unit:key())
					managers.groupai:state():add_listener(self._enemy_weapons_hot_listen_id, {
						"enemy_weapons_hot"
					}, callback(self, self, "clbk_enemy_weapons_hot"))
				end
			end
		elseif params.corpse_cbt then
			att_settings = {
				"enemy_law_corpse_cbt",
				"enemy_team_corpse_cbt"
			}
		elseif params.corpse_sneak then
			att_settings = {
				"enemy_law_corpse_sneak",
				"enemy_team_corpse_sneak",
				"enemy_civ_cbt"
			}
		end
	end
	self._attention_params = params
	PlayerMovement.set_attention_settings(self, att_settings)
end