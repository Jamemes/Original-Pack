local data = Setup.init_managers
function Setup:init_managers(tweak_data)
    data(self, tweak_data)
	if not Global.game_settings.single_player then
		Global.game_settings.team_ai = false
	end
end
