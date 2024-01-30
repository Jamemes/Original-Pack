function CrimeSpreeManager:unlocked()
	return managers.experience:current_rank() >= tweak_data.unlock_crimespree
end