function CrimeNetGui:add_special_contracts(no_casino, no_quickplay)
	-- return --включение старых меток на карте для покупки контрактов, казино, гейдж и базы данных

	for index, special_contract in ipairs(tweak_data.gui.crime_net.special_contracts) do
		local skip = false

		if managers.custom_safehouse:unlocked() and special_contract.id == "challenge" or not managers.custom_safehouse:unlocked() and special_contract.id == "safehouse" then
			skip = true
		end
		skip = skip or special_contract.sp_only and not Global.game_settings.single_player
		skip = skip or special_contract.mp_only and Global.game_settings.single_player
		skip = skip or special_contract.no_session_only and managers.network:session()
		if not skip then
			self:add_special_contract(special_contract, no_casino, no_quickplay)
		end
	end
end