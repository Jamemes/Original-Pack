local data = BootupState.setup_intro_videos
function BootupState:setup_intro_videos()
	data(self)
	table.remove(self._play_data_list, 3)
end