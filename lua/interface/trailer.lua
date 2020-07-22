function BootupState:setup_intro_videos()
	local res = RenderSettings.resolution
	local safe_rect_pixels = managers.gui_data:scaled_size()
	local legal_text = managers.localization:text("legal_text")
	local item_layer = self._back_drop_gui:background_layers()
	local intro_trailer_layer = self._back_drop_gui:foreground_layers()
	table.insert(self._play_data_list, {
		word_wrap = true,
		vertical = "center",
		wrap = true,
		font_size = 24,
		padding = 200,
		fade_in = 1.25,
		fade_out = 1.25,
		can_skip = true,
		duration = 6,
		layer = item_layer,
		text = legal_text,
		font = tweak_data.menu.pd2_medium_font,
		width = safe_rect_pixels.width,
		height = safe_rect_pixels.height
	})
	table.insert(self._play_data_list, {
		video = "movies/game_intro",
		can_skip = true,
		padding = 200,
		layer = item_layer,
		width = res.x,
		height = res.y
	})
end