function CrimeSpreeManager:unlocked()
	return managers.experience:current_rank() >= tweak_data.crime_spree.unlock_rank
end