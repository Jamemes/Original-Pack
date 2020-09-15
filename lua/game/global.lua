if not managers.job:is_level_ghostable_required(managers.job:current_level_id()) and managers.job:is_level_ghostable(managers.job:current_level_id()) and not managers.groupai:state():whisper_mode() and not managers.job:is_current_job_professional() and Global.game_settings.job_plan == 2 then
	if Input:keyboard():down(Idstring("f5")) then
		managers.vote:_restart_counter()
	end
end