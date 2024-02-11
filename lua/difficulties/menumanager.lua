local data = MenuQuickplaySettingsInitiator.modify_node
function MenuQuickplaySettingsInitiator:modify_node(node)
	self._difficulties_quick = {
		"easy",
		"normal",
		"hard",
		"overkill",
		"overkill_145",
		"overkill_290",
		"easy_wish",
		"sm_wish"
	}

	return data(self, node)
end

local chill = MenuCrimeNetContactChillInitiator.modify_node
function MenuCrimeNetContactChillInitiator:modify_node(original_node, data)
	local node = chill(self, original_node, data)
	node:item("difficulty"):options()[5]._parameters.text_id = "menu_difficulty_apocalypse"
	node:item("difficulty"):options()[5]._parameters.value = "overkill_290"
	node:item("difficulty"):options()[6]._parameters.text_id = "menu_difficulty_easy_wish"
	node:item("difficulty"):options()[6]._parameters.value = "easy_wish"
	
	return node
end

local filter = MenuCrimeNetFiltersInitiator.modify_node
function MenuCrimeNetFiltersInitiator:modify_node(original_node, data)
	local node = filter(self, original_node, data)
	node:item("difficulty_filter"):options()[6]._parameters.text_id = "menu_difficulty_apocalypse"
	node:item("difficulty_filter"):options()[7]._parameters.text_id = "menu_difficulty_easy_wish"
	
	return node
end