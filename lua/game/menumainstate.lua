local data = MenuMainState.at_enter
function MenuMainState:at_enter(old_state)
	MenuCallbackHandler.got_spooked = function(self, item)
		_G.OriginalPackOptions.settings.Spooky = true
		_G.OriginalPackOptions:Save()
	end
	local dialog_data = {
		focus_button = 1,
		title = "",
		text = "menu_spooky_text",
		texture = false
	}
	local blank = {}
	local no_button = {
		text = managers.localization:text("menu_spooky_no")
	}
	local yes_button = {
		text = managers.localization:text("menu_spooky_yes"),
		callback_func = MenuCallbackHandler.got_spooked
	}
	dialog_data.button_list = {
		blank,
		no_button,
		blank,
		blank,
		yes_button
	}
	
	dialog_data.video = "movies/177"
	dialog_data.video_loop = true
	
	if not _G.OriginalPackOptions.settings.Spooky then
		if not has_invite and not managers.network:session() then
			-- managers.menu:show_video_message_dialog(dialog_data)
		end
	end
	data(self, old_state)
end