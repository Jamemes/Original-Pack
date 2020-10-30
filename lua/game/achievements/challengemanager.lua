function ChallengeManager:can_progress_challenges()
	if Global.game_settings.one_down then
		return false
	end
	return true
end