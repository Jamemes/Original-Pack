function CustomSafehouseManager:unlocked()
	return Global.mission_manager.has_played_tutorial and (tweak_data.safehouse.rank_limit <= managers.experience:current_rank())
end