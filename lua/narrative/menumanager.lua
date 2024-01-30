local data = MenuCallbackHandler.restart_level_visible
function MenuCallbackHandler:restart_level_visible()
	if managers.skirmish:current_wave_number() < 1 and managers.job:is_level_ghostable(managers.job:current_level_id()) and not managers.groupai:state():whisper_mode() then
		return data(self)
	end
end

local data = MenuCallbackHandler.restart_vote_visible
function MenuCallbackHandler:restart_vote_visible()
	if managers.skirmish:current_wave_number() < 1 and managers.job:is_level_ghostable(managers.job:current_level_id()) and not managers.groupai:state():whisper_mode() then
		return data(self)
	end
end