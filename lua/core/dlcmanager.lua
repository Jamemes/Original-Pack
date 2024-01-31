local data = GenericDLCManager.give_dlc_and_verify_blackmarket
function GenericDLCManager:give_dlc_and_verify_blackmarket()
	data(self)

	if managers.blackmarket then
		if not Global.blackmarket_manager.max_progress and _G.OriginalPackOptions.settings.Enable_Max_Progress then
			Global.blackmarket_manager.max_progress = true
			managers.blackmarket:max_progress()
		end
	end
end
