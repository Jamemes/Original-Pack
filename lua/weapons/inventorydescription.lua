WeaponDescription._stats_shown = {
	{
		round_value = true,
		name = "magazine",
		stat_name = "extra_ammo"
	},
	{
		round_value = true,
		name = "totalammo",
		stat_name = "total_ammo_mod"
	},
	{
		round_value = true,
		name = "fire_rate"
	},
	{
		name = "damage"
	},
	{
		percent = false,
		name = "spread",
		offset = true,
		revert = true
	},
	{
		percent = false,
		name = "recoil",
		offset = true,
		revert = true
	},
	{
		index = true,
		name = "concealment"
	},
	{
		percent = false,
		name = "suppression",
		offset = true
	}
}
table.insert(WeaponDescription._stats_shown, {name = "reload"})
