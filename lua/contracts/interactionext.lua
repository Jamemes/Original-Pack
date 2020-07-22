local data = BaseInteractionExt.init
function BaseInteractionExt:init(tweak_data)
    data(self, tweak_data)
	local multiplier = 1
	if Global.game_settings and 
		Global.game_settings.level_id == "arm_fac" or
		Global.game_settings.level_id == "arm_par" or
		Global.game_settings.level_id == "arm_hcm" or
		Global.game_settings.level_id == "arm_und" or
		Global.game_settings.level_id == "arm_cro"
	and self.tweak_data == "take_confidential_folder_event" then
		multiplier = multiplier
		managers.job:set_next_interupt_stage("arm_for")
	end
end