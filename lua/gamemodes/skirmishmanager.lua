function SkirmishManager:is_unlocked()
	return managers.experience:current_rank() >= 3
end