local data = GenericDLCManager.give_dlc_and_verify_blackmarket
function GenericDLCManager:give_dlc_and_verify_blackmarket()
	data(self)

	if managers.blackmarket then
		if not Global.blackmarket_manager.max_progress and _G.OPG.settings.max_progress then
			Global.blackmarket_manager.max_progress = true
			managers.blackmarket:max_progress()
		end
	end
end

function GenericDLCManager:has_mrwi_deck_equipped_mimicing()
	return false
end