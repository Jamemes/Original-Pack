function SkirmishManager:is_unlocked()
	return managers.experience:current_rank() >= tweak_data.unlock_skirmish
end