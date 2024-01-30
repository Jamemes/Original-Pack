local BaseInteractionExt_original = BaseInteractionExt.interact
function BaseInteractionExt:interact(player)

	if not self:can_interact(player) then BaseInteractionExt_original(self, player) return end
	if Global.game_settings and 
	Global.game_settings.level_id == "arm_fac" or
	Global.game_settings.level_id == "arm_par" or
	Global.game_settings.level_id == "arm_hcm" or
	Global.game_settings.level_id == "arm_und" or
	Global.game_settings.level_id == "arm_cro" then
		if self.tweak_data == "take_confidential_folder_event" then
			managers.job:set_next_interupt_stage("arm_for")
		end
	end

	BaseInteractionExt_original(self, player)
end