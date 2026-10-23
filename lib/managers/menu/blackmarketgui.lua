function BlackMarketGui:_start_page_data()
	local data = {}
	table.insert(data, {
		name = "bm_menu_primaries",
		category = "primaries",
		on_create_func_name = "populate_primaries",
		override_slots = {3, 3},
		identifier = self.identifiers.weapon
	})
	table.insert(data, {
		name = "bm_menu_secondaries",
		category = "secondaries",
		on_create_func_name = "populate_secondaries",
		override_slots = {3, 3},
		identifier = self.identifiers.weapon
	})
	table.insert(data, {
		name = "bm_menu_armors",
		category = "armors",
		on_create_func_name = "populate_armors",
		override_slots = {4, 2},
		identifier = self.identifiers.armor
	})
	table.insert(data, {
		name = "bm_menu_deployables",
		category = "deployables",
		override_slots = {3, 3},
		on_create_func_name = "populate_deployables",
		identifier = Idstring("deployable")
	})
	if not managers.network:session() then
		table.insert(data, {
			name = "bm_menu_characters",
			category = "characters",
			on_create_func_name = "populate_characters",
			override_slots = {2, 2},
			identifier = self.identifiers.character
		})
	end
	data.topic_id = "menu_inventory"
	self:_cleanup_blackmarket()
	return data
end