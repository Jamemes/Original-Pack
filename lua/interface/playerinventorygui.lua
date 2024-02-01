Hooks:PreHook(PlayerInventoryGui, "_update_player_stats", "PlayerInventoryGui_update_player_stats", function(self)
	local player_panel = self._panel:child("player_panel")
	local info_panel = self._panel:child("info_panel")
	player_panel:set_h(285)
	self._player_box_panel:set_h(285)
	info_panel:set_y(player_panel:bottom() + 5)
end)