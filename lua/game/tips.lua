function TipsTweakData:init()
	self.tips = {
		{cat_index = 1,		image = "crimenet_heists",			consoles = true, category = "op_gameplay"},
		{cat_index = 2,		image = "enemy_flashbang",			consoles = true, category = "op_gameplay"},
		{cat_index = 3,		image = "enemy_medic",				consoles = true, category = "op_gameplay"},
		{cat_index = 4,		image = "enemy_guards",				consoles = true, category = "op_gameplay"},
		{cat_index = 5,		image = "general_pagers",			consoles = true, category = "op_gameplay"},
		{cat_index = 6,		image = "general_pagers",			consoles = true, category = "op_gameplay"},
		{cat_index = 7,		image = "tactics_stealth",			consoles = true, category = "op_gameplay"},
		{cat_index = 8,		image = "tactics_ghost",			consoles = true, category = "op_gameplay"},
		{cat_index = 9,		image = "general_hostages",			consoles = true, category = "op_gameplay"},
		{cat_index = 10,	image = "enemy_guards",				consoles = true, category = "op_gameplay"},
		{cat_index = 11,	image = "weapon_tripmine",			consoles = true, category = "op_gameplay"},
		{cat_index = 12,	image = "crimenet_heists",			consoles = true, category = "op_gameplay"},
		{cat_index = 13,	image = "general_drill",			consoles = true, category = "op_gameplay"},
		{cat_index = 14,	image = "tactics_casingmode",		consoles = true, category = "op_gameplay"},
		{cat_index = 15,	image = "tactics_bagweight",		consoles = true, category = "op_gameplay"},
		{cat_index = 16,	image = "general_cameras",			consoles = true, category = "op_gameplay"},
		{cat_index = 17,	image = "tactics_revive",			consoles = true, category = "op_gameplay"},
		{cat_index = 18,	image = "tactics_cover",			consoles = true, category = "op_gameplay"},
		{cat_index = 19,	image = "general_perks",			consoles = true, category = "op_gameplay"},
		{cat_index = 20,	image = "general_wanted_poster",	consoles = true, category = "op_gameplay"},
		{cat_index = 21,	image = "crimenet_difficulty",		consoles = true, category = "op_gameplay"},
		{cat_index = 22,	image = "general_achievements",		consoles = true, category = "op_gameplay"},
		{cat_index = 23,	image = "crimenet_safehouse",		consoles = true, category = "op_gameplay"},
		{cat_index = 24,	image = "weapon_sniper",			consoles = true, category = "op_gameplay"},
		{cat_index = 25,	image = "enemy_zeal",				consoles = true, category = "op_gameplay"},
		{cat_index = 26,	image = "tactics_stealth",			consoles = true, category = "op_gameplay"},
		{cat_index = 27,	image = "heist_events",				consoles = true, category = "op_gameplay"},
		{cat_index = 28,	image = "equipment_ammobag",		consoles = true, category = "op_gameplay"},
		{cat_index = 29,	image = "weapon_explosives",		consoles = true, category = "op_gameplay"},
		{cat_index = 30,	image = "general_escapes",			consoles = true, category = "op_gameplay"},
		{cat_index = 31,	image = "general_hostages",			consoles = true, category = "op_gameplay"},
		{cat_index = 32,	image = "general_cleanercosts",		consoles = true, category = "op_gameplay"},
		{cat_index = 33,	image = "weapon_gadgets",			consoles = true, category = "op_gameplay"}
	}
	self.category_totals = {}

	for _, tip in ipairs(self.tips) do
		if not self.category_totals[tip.category] or self.category_totals[tip.category] < tip.cat_index then
			self.category_totals[tip.category] = tip.cat_index
		end
	end
end