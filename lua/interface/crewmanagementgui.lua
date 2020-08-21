if string.lower(RequiredScript) == "lib/managers/menu/crewmanagementgui" then
	function CrewManagementGui:populate_skill(params, data, gui)end
	function CrewManagementGui:populate_ability(henchman_index, data, gui)end
	function CrewManagementGui:create_ability_button(panel, index)end
	function CrewManagementGui:create_skill_button(panel, index)end
	function CrewManagementGui:create_weapon_button(panel, index)end
elseif string.lower(RequiredScript) == "lib/managers/blackmarketmanager" then
	function BlackMarketManager:is_weapon_category_allowed_for_crew(weapon_category)
		return
	end
end