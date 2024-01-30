function GenericDLCManager:give_dlc_and_verify_blackmarket()
	self:give_dlc_package()
	if managers.blackmarket then
		managers.blackmarket:tradable_dlcs()
		managers.blackmarket:verify_dlc_items()
		if not Global.blackmarket_manager.max_progress and _G.OriginalPackOptions.settings.Enable_Max_Progress then
			Global.blackmarket_manager.max_progress = true
			managers.blackmarket:max_progress()
		end
	else
		Application:error("[GenericDLCManager] _load_done(): BlackMarketManager not yet initialized!")
	end
end
