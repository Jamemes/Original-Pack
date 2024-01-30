local data = AttentionTweakData.init
function AttentionTweakData:init(tweak_data)
	data(self, tweak_data)
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	if difficulty == "easy_wish" or difficulty == "sm_wish" then
		self.settings.pl_mask_off_foe_combatant.max_range = 600 * 3
		self.settings.pl_mask_off_foe_non_combatant.max_range = 600 * 3
		self.settings.pl_mask_on_foe_combatant_whisper_mode_stand.max_range = 2000 * 3
		self.settings.pl_mask_on_foe_combatant_whisper_mode_crouch.max_range = 1200 * 3
		self.settings.pl_mask_on_foe_non_combatant_whisper_mode_crouch.max_range = 1500 * 3
		self.settings.civ_all_peaceful.max_range = 2000 * 3
	end
end