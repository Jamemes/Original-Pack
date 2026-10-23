Hooks:PostHook(PlayerMaskOff, "init", "Update_2.PlayerMaskOff.init", function(self, ...)
	self._mask_off_attention_settings = {
		"pl_law_susp_peaceful",
		"pl_gangster_cur_peaceful",
		"pl_team_cur_peaceful",
		"pl_civ_idle_peaceful"
	}
end)