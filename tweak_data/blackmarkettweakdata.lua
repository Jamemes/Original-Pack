BlackMarketTweakData_37 = BlackMarketTweakData_37 or class()

function BlackMarketTweakData_37:init(tweak_data)
	self:_init_colors()
	self:_init_materials()
	self:_init_textures()
	self:_init_masks()
	self:_init_characters()
	self:_init_cash()
	self:_init_xp()
	self:_init_weapon_mods(tweak_data)
	self:_init_armors()
	self:_init_deployables(tweak_data)
	self:_init_grenades()
	self:_init_melee_weapons()
end

function BlackMarketTweakData_37:print_missing_strings(skip_print_id)
	if Application:production_build() then
		local ignore_name = {"xp", "cash"}
		local ignore_desc = {
			"xp",
			"cash",
			"weapon_mods"
		}
		for id, data in pairs(self) do
			for i, d in pairs(data) do
				if id ~= "weapon_mods" or tweak_data.weapon.factory.parts[i].pc or tweak_data.weapon.factory.parts[i].pcs then
					local name_id = d.name_id
					if not table.contains(ignore_name, id) and name_id and not managers.localization:exists(name_id) then
						if skip_print_id then
							Application:debug(name_id)
						else
							Application:debug(name_id, "", "", id)
						end
					end
					local desc_id = d.desc_id
					if not table.contains(ignore_desc, id) and desc_id and not managers.localization:exists(desc_id) then
						if skip_print_id then
							Application:debug(desc_id)
						else
							Application:debug(desc_id, "", "", id)
						end
					end
				end
			end
		end
	end
end

function BlackMarketTweakData_37:_add_desc_from_name_macro(tweak_data)
	for id, data in pairs(tweak_data) do
		if data.name_id and not data.desc_id then
			data.desc_id = tostring(data.name_id) .. "_desc"
		end
		if not data.name_id then
		end
	end
end

function BlackMarketTweakData_37:_init_weapon_mods(tweak_data)
	self.weapon_mods = {}
	for id, data in pairs(tweak_data.weapon.factory.parts) do
		self.weapon_mods[id] = {
			max_in_inventory = 2,
			pc = data.pc,
			pcs = data.pcs,
			dlc = data.dlc,
			dlcs = data.dlcs,
			name_id = data.name_id,
			desc_id = data.desc_id,
			infamous = data.infamous,
			value = data.stats and data.stats.value or 1,
			weight = data.weight,
			texture_bundle_folder = data.texture_bundle_folder,
			is_a_unlockable = data.is_a_unlockable
		}
	end
	self:_add_desc_from_name_macro(self.weapon_mods)
	if Application:production_build() and managers.lootdrop then
		managers.lootdrop:add_qlvl_to_weapon_mods(self.weapon_mods)
	end
end

function BlackMarketTweakData_37:_init_masks()
	self.masks = {}
	self.masks.character_locked = {}
	self.masks.character_locked.name_id = "bm_msk_character_locked"
	self.masks.character_locked.dallas = "units/payday2/masks/msk_dallas/msk_dallas"
	self.masks.character_locked.wolf = "units/payday2/masks/msk_wolf/msk_wolf"
	self.masks.character_locked.hoxton = "units/payday2/masks/msk_hoxton/msk_hoxton"
	self.masks.character_locked.chains = "units/payday2/masks/msk_chains/msk_chains"
	self.masks.skull = {}
	self.masks.skull.unit = "units/payday2/masks/msk_skull/msk_skull"
	self.masks.skull.name_id = "bm_msk_skull"
	self.masks.skull.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.skull.dlc = "preorder"
	self.masks.skull.value = 1
	self.masks.wolf_clean = {}
	self.masks.wolf_clean.unit = "units/payday2/masks/msk_wolf_clean/msk_wolf_clean"
	self.masks.wolf_clean.name_id = "bm_msk_wolf_clean"
	self.masks.wolf_clean.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.wolf_clean.infamous = true
	self.masks.wolf_clean.value = 9
	self.masks.wolf_clean.qlvl = 0
	self.masks.hoxton_clean = {}
	self.masks.hoxton_clean.unit = "units/payday2/masks/msk_hoxton_clean/msk_hoxton_clean"
	self.masks.hoxton_clean.name_id = "bm_msk_hoxton_clean"
	self.masks.hoxton_clean.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.hoxton_clean.infamous = true
	self.masks.hoxton_clean.value = 9
	self.masks.hoxton_clean.qlvl = 0
	self.masks.dallas_clean = {}
	self.masks.dallas_clean.unit = "units/payday2/masks/msk_dallas_clean/msk_dallas_clean"
	self.masks.dallas_clean.name_id = "bm_msk_dallas_clean"
	self.masks.dallas_clean.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.dallas_clean.infamous = true
	self.masks.dallas_clean.value = 10
	self.masks.dallas_clean.qlvl = 0
	self.masks.chains_clean = {}
	self.masks.chains_clean.unit = "units/payday2/masks/msk_chains_clean/msk_chains_clean"
	self.masks.chains_clean.name_id = "bm_msk_chains_clean"
	self.masks.chains_clean.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.chains_clean.infamous = true
	self.masks.chains_clean.value = 9
	self.masks.chains_clean.qlvl = 0
	self.masks.dallas = {}
	self.masks.dallas.unit = "units/payday2/masks/msk_dallas/msk_dallas"
	self.masks.dallas.name_id = "bm_msk_dallas"
	self.masks.dallas.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.dallas.infamous = true
	self.masks.dallas.value = 7
	self.masks.hoxton = {}
	self.masks.hoxton.unit = "units/payday2/masks/msk_hoxton/msk_hoxton"
	self.masks.hoxton.name_id = "bm_msk_hoxton"
	self.masks.hoxton.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.hoxton.infamous = true
	self.masks.hoxton.value = 7
	self.masks.chains = {}
	self.masks.chains.unit = "units/payday2/masks/msk_chains/msk_chains"
	self.masks.chains.name_id = "bm_msk_chains"
	self.masks.chains.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.chains.infamous = true
	self.masks.chains.value = 7
	self.masks.wolf = {}
	self.masks.wolf.unit = "units/payday2/masks/msk_wolf/msk_wolf"
	self.masks.wolf.name_id = "bm_msk_wolf"
	self.masks.wolf.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.wolf.infamous = true
	self.masks.wolf.value = 7
	self.masks.cthulhu = {}
	self.masks.cthulhu.unit = "units/payday2/masks/msk_cthulhu/msk_cthulhu"
	self.masks.cthulhu.name_id = "bm_msk_cthulhu"
	self.masks.cthulhu.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.cthulhu.infamous = true
	self.masks.cthulhu.value = 8
	self.masks.cthulhu.qlvl = 0
	self.masks.grin = {}
	self.masks.grin.unit = "units/payday2/masks/msk_grin/msk_grin"
	self.masks.grin.name_id = "bm_msk_grin"
	self.masks.grin.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.grin.infamous = true
	self.masks.grin.value = 8
	self.masks.grin.qlvl = 0
	self.masks.anonymous = {}
	self.masks.anonymous.unit = "units/payday2/masks/msk_anonymous/msk_anonymous"
	self.masks.anonymous.name_id = "bm_msk_anonymous"
	self.masks.anonymous.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.anonymous.infamous = true
	self.masks.anonymous.value = 6
	self.masks.anonymous.qlvl = 0
	self.masks.dillinger_death_mask = {}
	self.masks.dillinger_death_mask.unit = "units/payday2/masks/msk_dillinger_death_mask/msk_dillinger_death_mask"
	self.masks.dillinger_death_mask.name_id = "bm_msk_dillinger_death_mask"
	self.masks.dillinger_death_mask.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.dillinger_death_mask.infamous = true
	self.masks.dillinger_death_mask.value = 9
	self.masks.dillinger_death_mask.qlvl = 0
	self.masks.alienware = {}
	self.masks.alienware.unit = "units/payday2/masks/msk_alienware/msk_alienware"
	self.masks.alienware.name_id = "bm_msk_alienware"
	self.masks.alienware.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.alienware.value = 3
	self.masks.greek_tragedy = {}
	self.masks.greek_tragedy.unit = "units/payday2/masks/msk_greek_tragedy/msk_greek_tragedy"
	self.masks.greek_tragedy.name_id = "bm_msk_greek_tragedy"
	self.masks.greek_tragedy.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.greek_tragedy.value = 7
	self.masks.greek_tragedy.qlvl = 0
	self.masks.jaw = {}
	self.masks.jaw.unit = "units/payday2/masks/msk_jaw/msk_jaw"
	self.masks.jaw.name_id = "bm_msk_jaw"
	self.masks.jaw.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.jaw.value = 4
	self.masks.hockey = {}
	self.masks.hockey.unit = "units/payday2/masks/msk_hockey_a/msk_hockey_a_mask"
	self.masks.hockey.name_id = "bm_msk_hockey"
	self.masks.hockey.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.hockey.value = 5
	self.masks.troll = {}
	self.masks.troll.unit = "units/payday2/masks/msk_troll/msk_troll"
	self.masks.troll.name_id = "bm_msk_troll"
	self.masks.troll.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.troll.value = 3
	self.masks.gagball = {}
	self.masks.gagball.unit = "units/payday2/masks/msk_gagball/msk_gagball"
	self.masks.gagball.name_id = "bm_msk_gagball"
	self.masks.gagball.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.gagball.value = 4
	self.masks.tounge = {}
	self.masks.tounge.unit = "units/payday2/masks/msk_tounge/msk_tounge"
	self.masks.tounge.name_id = "bm_msk_tounge"
	self.masks.tounge.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.tounge.value = 2
	self.masks.zipper = {}
	self.masks.zipper.unit = "units/payday2/masks/msk_zipper/msk_zipper"
	self.masks.zipper.name_id = "bm_msk_zipper"
	self.masks.zipper.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.zipper.value = 5
	self.masks.biglips = {}
	self.masks.biglips.unit = "units/payday2/masks/msk_biglips/msk_biglips"
	self.masks.biglips.name_id = "bm_msk_biglips"
	self.masks.biglips.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.biglips.value = 3
	self.masks.clowncry = {}
	self.masks.clowncry.unit = "units/payday2/masks/msk_clowncry/msk_clowncry"
	self.masks.clowncry.name_id = "bm_msk_clowncry"
	self.masks.clowncry.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.clowncry.value = 4
	self.masks.mr_sinister = {}
	self.masks.mr_sinister.unit = "units/payday2/masks/msk_mr_sinister/msk_mr_sinister"
	self.masks.mr_sinister.name_id = "bm_msk_mr_sinister"
	self.masks.mr_sinister.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.mr_sinister.value = 5
	self.masks.clown_56 = {}
	self.masks.clown_56.unit = "units/payday2/masks/msk_clown_56/msk_clown_56"
	self.masks.clown_56.name_id = "bm_msk_clown_56"
	self.masks.clown_56.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.clown_56.value = 3
	self.masks.dripper = {}
	self.masks.dripper.unit = "units/payday2/masks/msk_dripper/msk_dripper"
	self.masks.dripper.name_id = "bm_msk_dripper"
	self.masks.dripper.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.dripper.value = 8
	self.masks.dripper.qlvl = 0
	self.masks.buha = {}
	self.masks.buha.unit = "units/payday2/masks/msk_buha/msk_buha"
	self.masks.buha.name_id = "bm_msk_buha"
	self.masks.buha.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.buha.value = 5
	self.masks.shogun = {}
	self.masks.shogun.unit = "units/payday2/masks/msk_shogun/msk_shogun"
	self.masks.shogun.name_id = "bm_msk_shogun"
	self.masks.shogun.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.shogun.value = 6
	self.masks.oni = {}
	self.masks.oni.unit = "units/payday2/masks/msk_oni/msk_oni"
	self.masks.oni.name_id = "bm_msk_oni"
	self.masks.oni.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.oni.value = 4
	self.masks.monkeybiss = {}
	self.masks.monkeybiss.unit = "units/payday2/masks/msk_monkeybiss/msk_monkeybiss"
	self.masks.monkeybiss.name_id = "bm_msk_monkeybiss"
	self.masks.monkeybiss.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.monkeybiss.value = 5
	self.masks.babyrhino = {}
	self.masks.babyrhino.unit = "units/payday2/masks/msk_babyrhino/msk_babyrhino"
	self.masks.babyrhino.name_id = "bm_msk_babyrhino"
	self.masks.babyrhino.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.babyrhino.value = 3
	self.masks.hog = {}
	self.masks.hog.unit = "units/payday2/masks/msk_hog/msk_hog"
	self.masks.hog.name_id = "bm_msk_hog"
	self.masks.hog.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.hog.value = 3
	self.masks.hog.qlvl = 0
	self.masks.outlandish_a = {}
	self.masks.outlandish_a.unit = "units/payday2/masks/msk_outlandish_a/msk_outlandish_a"
	self.masks.outlandish_a.name_id = "bm_msk_outlandish_a"
	self.masks.outlandish_a.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.outlandish_a.value = 2
	self.masks.outlandish_b = {}
	self.masks.outlandish_b.unit = "units/payday2/masks/msk_outlandish_b/msk_outlandish_b"
	self.masks.outlandish_b.name_id = "bm_msk_outlandish_b"
	self.masks.outlandish_b.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.outlandish_b.value = 3
	self.masks.outlandish_c = {}
	self.masks.outlandish_c.unit = "units/payday2/masks/msk_outlandish_c/msk_outlandish_c"
	self.masks.outlandish_c.name_id = "bm_msk_outlandish_c"
	self.masks.outlandish_c.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.outlandish_c.value = 4
	self.masks.bullet = {}
	self.masks.bullet.unit = "units/payday2/masks/msk_bullet/msk_bullet"
	self.masks.bullet.name_id = "bm_msk_bullet"
	self.masks.bullet.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.bullet.value = 3
	self.masks.shrunken = {}
	self.masks.shrunken.unit = "units/payday2/masks/msk_shrunken/msk_shrunken"
	self.masks.shrunken.name_id = "bm_msk_shrunken"
	self.masks.shrunken.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.shrunken.value = 3
	self.masks.brainiack = {}
	self.masks.brainiack.unit = "units/payday2/masks/msk_brainiack/msk_brainiack"
	self.masks.brainiack.name_id = "bm_msk_brainiack"
	self.masks.brainiack.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.brainiack.value = 6
	self.masks.zombie = {}
	self.masks.zombie.unit = "units/payday2/masks/msk_zombie/msk_zombie"
	self.masks.zombie.name_id = "bm_msk_zombie"
	self.masks.zombie.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.zombie.value = 3
	self.masks.scarecrow = {}
	self.masks.scarecrow.unit = "units/payday2/masks/msk_scarecrow/msk_scarecrow"
	self.masks.scarecrow.name_id = "bm_msk_scarecrow"
	self.masks.scarecrow.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.scarecrow.value = 7
	self.masks.scarecrow.qlvl = 0
	self.masks.mummy = {}
	self.masks.mummy.unit = "units/payday2/masks/msk_mummy/msk_mummy"
	self.masks.mummy.name_id = "bm_msk_mummy"
	self.masks.mummy.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.mummy.value = 3
	self.masks.vampire = {}
	self.masks.vampire.unit = "units/payday2/masks/msk_vampire/msk_vampire"
	self.masks.vampire.name_id = "bm_msk_vampire"
	self.masks.vampire.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.vampire.value = 2
	self.masks.day_of_the_dead = {}
	self.masks.day_of_the_dead.unit = "units/payday2/masks/msk_day_of_the_dead/msk_day_of_the_dead"
	self.masks.day_of_the_dead.name_id = "bm_msk_day_of_the_dead"
	self.masks.day_of_the_dead.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.day_of_the_dead.value = 3
	self.masks.day_of_the_dead.qlvl = 0
	self.masks.dawn_of_the_dead = {}
	self.masks.dawn_of_the_dead.unit = "units/payday2/masks/msk_dawn_of_the_dead/msk_dawn_of_the_dead"
	self.masks.dawn_of_the_dead.name_id = "bm_msk_dawn_of_the_dead"
	self.masks.dawn_of_the_dead.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.dawn_of_the_dead.value = 2
	self.masks.demon = {}
	self.masks.demon.unit = "units/payday2/masks/msk_demon/msk_demon"
	self.masks.demon.name_id = "bm_msk_demon"
	self.masks.demon.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.demon.value = 10
	self.masks.demon.qlvl = 0
	self.masks.stonekisses = {}
	self.masks.stonekisses.unit = "units/payday2/masks/msk_stonekisses/msk_stonekisses"
	self.masks.stonekisses.name_id = "bm_msk_stonekisses"
	self.masks.stonekisses.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.stonekisses.value = 4
	self.masks.demonictender = {}
	self.masks.demonictender.unit = "units/payday2/masks/msk_demonictender/msk_demonictender"
	self.masks.demonictender.name_id = "bm_msk_demonictender"
	self.masks.demonictender.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.demonictender.value = 3
	self.masks.kawaii = {}
	self.masks.kawaii.unit = "units/payday2/masks/msk_kawaii/msk_kawaii"
	self.masks.kawaii.name_id = "bm_msk_kawaii"
	self.masks.kawaii.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.kawaii.value = 3
	self.masks.irondoom = {}
	self.masks.irondoom.unit = "units/payday2/masks/msk_irondoom/msk_irondoom"
	self.masks.irondoom.name_id = "bm_msk_irondoom"
	self.masks.irondoom.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.irondoom.value = 3
	self.masks.rubber_male = {}
	self.masks.rubber_male.unit = "units/payday2/masks/msk_rubber_male/msk_rubber_male"
	self.masks.rubber_male.name_id = "bm_msk_rubber_male"
	self.masks.rubber_male.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.rubber_male.value = 3
	self.masks.rubber_female = {}
	self.masks.rubber_female.unit = "units/payday2/masks/msk_rubber_female/msk_rubber_female"
	self.masks.rubber_female.name_id = "bm_msk_rubber_female"
	self.masks.rubber_female.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.rubber_female.value = 3
	self.masks.pumpkin_king = {}
	self.masks.pumpkin_king.unit = "units/payday2/masks/msk_pumpkin_king/msk_pumpkin_king"
	self.masks.pumpkin_king.name_id = "bm_msk_pumpkin_king"
	self.masks.pumpkin_king.weight = 1000
	self.masks.pumpkin_king.got_item_weight_mod = 0.01
	self.masks.pumpkin_king.global_value = "halloween"
	self.masks.pumpkin_king.value = 5
	self.masks.pumpkin_king.qlvl = 0
	self.masks.witch = {}
	self.masks.witch.unit = "units/payday2/masks/msk_witch/msk_witch"
	self.masks.witch.name_id = "bm_msk_witch"
	self.masks.witch.weight = 1000
	self.masks.witch.got_item_weight_mod = 0.01
	self.masks.witch.global_value = "halloween"
	self.masks.witch.value = 5
	self.masks.witch.qlvl = 0
	self.masks.venomorph = {}
	self.masks.venomorph.unit = "units/payday2/masks/msk_venomorph/msk_venomorph"
	self.masks.venomorph.name_id = "bm_msk_venomorph"
	self.masks.venomorph.weight = 1000
	self.masks.venomorph.got_item_weight_mod = 0.01
	self.masks.venomorph.global_value = "halloween"
	self.masks.venomorph.value = 5
	self.masks.venomorph.qlvl = 0
	self.masks.frank = {}
	self.masks.frank.unit = "units/payday2/masks/msk_frank/msk_frank"
	self.masks.frank.name_id = "bm_msk_frank"
	self.masks.frank.weight = 1000
	self.masks.frank.got_item_weight_mod = 0.01
	self.masks.frank.global_value = "halloween"
	self.masks.frank.value = 5
	self.masks.frank.qlvl = 0
	self.masks.brazil_baby = {}
	self.masks.brazil_baby.unit = "units/payday2/masks/msk_brazil_baby/msk_brazil_baby"
	self.masks.brazil_baby.name_id = "bm_msk_brazil_baby"
	self.masks.brazil_baby.global_value = "halloween"
	self.masks.brazil_baby.value = 8
	self.masks.brazil_baby.qlvl = 0
	self.masks.baby_angry = {}
	self.masks.baby_angry.unit = "units/payday2/masks/msk_baby_angry/msk_baby_angry"
	self.masks.baby_angry.name_id = "bm_msk_baby_angry"
	self.masks.baby_angry.global_value = "halloween"
	self.masks.baby_angry.value = 8
	self.masks.baby_angry.qlvl = 0
	self.masks.baby_cry = {}
	self.masks.baby_cry.unit = "units/payday2/masks/msk_baby_cry/msk_baby_cry"
	self.masks.baby_cry.name_id = "bm_msk_baby_cry"
	self.masks.baby_cry.global_value = "halloween"
	self.masks.baby_cry.value = 8
	self.masks.baby_cry.qlvl = 0
	self.masks.baby_happy = {}
	self.masks.baby_happy.unit = "units/payday2/masks/msk_baby_happy/msk_baby_happy"
	self.masks.baby_happy.name_id = "bm_msk_baby_happy"
	self.masks.baby_happy.global_value = "halloween"
	self.masks.baby_happy.value = 8
	self.masks.baby_happy.qlvl = 0
	self.masks.heat = {}
	self.masks.heat.unit = "units/pd2_dlc1/masks/msk_hockey_b/msk_hockey_b"
	self.masks.heat.name_id = "bm_msk_heat"
	self.masks.heat.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.heat.value = 6
	self.masks.heat.dlc = "pd2_clan"
	self.masks.bear = {}
	self.masks.bear.unit = "units/payday2/masks/msk_bear/msk_bear"
	self.masks.bear.name_id = "bm_msk_bear"
	self.masks.bear.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.bear.value = 3
	self.masks.bear.qlvl = 0
	self.masks.bear.dlcs = {"pd2_clan"}
	self.masks.clinton = {}
	self.masks.clinton.unit = "units/pd2_dlc1/masks/msk_clinton/msk_clinton"
	self.masks.clinton.name_id = "bm_msk_clinton"
	self.masks.clinton.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.clinton.value = 6
	self.masks.clinton.dlc = "armored_transport"
	self.masks.clinton.texture_bundle_folder = "dlc1"
	self.masks.bush = {}
	self.masks.bush.unit = "units/pd2_dlc1/masks/msk_bush/msk_bush"
	self.masks.bush.name_id = "bm_msk_bush"
	self.masks.bush.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.bush.value = 6
	self.masks.bush.dlc = "armored_transport"
	self.masks.bush.texture_bundle_folder = "dlc1"
	self.masks.obama = {}
	self.masks.obama.unit = "units/pd2_dlc1/masks/msk_obama/msk_obama"
	self.masks.obama.name_id = "bm_msk_obama"
	self.masks.obama.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.obama.value = 6
	self.masks.obama.dlc = "armored_transport"
	self.masks.obama.texture_bundle_folder = "dlc1"
	self.masks.nixon = {}
	self.masks.nixon.unit = "units/pd2_dlc1/masks/msk_nixon/msk_nixon"
	self.masks.nixon.name_id = "bm_msk_nixon"
	self.masks.nixon.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.nixon.value = 6
	self.masks.nixon.dlc = "armored_transport"
	self.masks.nixon.texture_bundle_folder = "dlc1"
	self.masks.goat = {}
	self.masks.goat.unit = "units/pd2_dlc_dec5/masks/msk_goat/msk_goat"
	self.masks.goat.name_id = "bm_msk_goat"
	self.masks.goat.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.goat.value = 4
	self.masks.goat.texture_bundle_folder = "gage_pack"
	self.masks.goat.dlc = "gage_pack"
	self.masks.panda = {}
	self.masks.panda.unit = "units/pd2_dlc_dec5/masks/msk_panda/msk_panda"
	self.masks.panda.name_id = "bm_msk_panda"
	self.masks.panda.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.panda.value = 4
	self.masks.panda.texture_bundle_folder = "gage_pack"
	self.masks.panda.dlc = "gage_pack"
	self.masks.pitbull = {}
	self.masks.pitbull.unit = "units/pd2_dlc_dec5/masks/msk_pitbull/msk_pitbull"
	self.masks.pitbull.name_id = "bm_msk_pitbull"
	self.masks.pitbull.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.pitbull.value = 4
	self.masks.pitbull.texture_bundle_folder = "gage_pack"
	self.masks.pitbull.dlc = "gage_pack"
	self.masks.eagle = {}
	self.masks.eagle.unit = "units/pd2_dlc_dec5/masks/msk_eagle/msk_eagle"
	self.masks.eagle.name_id = "bm_msk_eagle"
	self.masks.eagle.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.eagle.value = 4
	self.masks.eagle.qlvl = 0
	self.masks.eagle.texture_bundle_folder = "gage_pack"
	self.masks.eagle.dlc = "gage_pack"
	self.masks.santa_happy = {}
	self.masks.santa_happy.unit = "units/pd2_dlc2/masks/msk_santa_happy/msk_santa_happy"
	self.masks.santa_happy.name_id = "bm_msk_santa_happy"
	self.masks.santa_happy.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.santa_happy.value = 4
	self.masks.santa_happy.dlc = "pd2_clan"
	self.masks.santa_happy.global_value = "pd2_clan"
	self.masks.santa_mad = {}
	self.masks.santa_mad.unit = "units/pd2_dlc_xmas/masks/msk_santa_mad/msk_santa_mad"
	self.masks.santa_mad.name_id = "bm_msk_santa_mad"
	self.masks.santa_mad.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.santa_mad.value = 4
	self.masks.santa_mad.dlc = "xmas_soundtrack"
	self.masks.santa_drunk = {}
	self.masks.santa_drunk.unit = "units/pd2_dlc_xmas/masks/msk_santa_drunk/msk_santa_drunk"
	self.masks.santa_drunk.name_id = "bm_msk_santa_drunk"
	self.masks.santa_drunk.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.santa_drunk.value = 4
	self.masks.santa_drunk.dlc = "xmas_soundtrack"
	self.masks.santa_surprise = {}
	self.masks.santa_surprise.unit = "units/pd2_dlc_xmas/masks/msk_santa_suprise/msk_santa_suprise"
	self.masks.santa_surprise.name_id = "bm_msk_santa_surprise"
	self.masks.santa_surprise.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.santa_surprise.value = 4
	self.masks.santa_surprise.dlc = "xmas_soundtrack"
	self.masks.aviator = {}
	self.masks.aviator.unit = "units/pd2_dlc_infamy/masks/msk_aviator/msk_aviator"
	self.masks.aviator.name_id = "bm_msk_aviator"
	self.masks.aviator.pcs = {}
	self.masks.aviator.value = 0
	self.masks.aviator.type = "glasses"
	self.masks.aviator.skip_mask_on_sequence = true
	self.masks.aviator.global_value = "infamy"
	self.masks.aviator.texture_bundle_folder = "infamous"
	self.masks.aviator.infamy_lock = "infamy_root"
	self.masks.ghost = {}
	self.masks.ghost.unit = "units/pd2_dlc_infamy/masks/msk_ghost/msk_ghost"
	self.masks.ghost.name_id = "bm_msk_ghost"
	self.masks.ghost.pcs = {}
	self.masks.ghost.value = 0
	self.masks.ghost.global_value = "infamy"
	self.masks.ghost.texture_bundle_folder = "infamous"
	self.masks.ghost.type = "helmet"
	self.masks.ghost.infamy_lock = "infamy_ghost"
	self.masks.welder = {}
	self.masks.welder.unit = "units/pd2_dlc_infamy/masks/msk_welder/msk_welder"
	self.masks.welder.name_id = "bm_msk_welder"
	self.masks.welder.pcs = {}
	self.masks.welder.value = 0
	self.masks.welder.global_value = "infamy"
	self.masks.welder.texture_bundle_folder = "infamous"
	self.masks.welder.infamy_lock = "infamy_enforcer"
	self.masks.plague = {}
	self.masks.plague.unit = "units/pd2_dlc_infamy/masks/msk_plague/msk_plague"
	self.masks.plague.name_id = "bm_msk_plague"
	self.masks.plague.pcs = {}
	self.masks.plague.value = 0
	self.masks.plague.global_value = "infamy"
	self.masks.plague.texture_bundle_folder = "infamous"
	self.masks.plague.infamy_lock = "infamy_mastermind"
	self.masks.smoker = {}
	self.masks.smoker.unit = "units/pd2_dlc_infamy/masks/msk_smoker/msk_smoker"
	self.masks.smoker.name_id = "bm_msk_smoker"
	self.masks.smoker.pcs = {}
	self.masks.smoker.value = 0
	self.masks.smoker.global_value = "infamy"
	self.masks.smoker.texture_bundle_folder = "infamous"
	self.masks.smoker.infamy_lock = "infamy_technician"
	self.masks.cloth_commander = {}
	self.masks.cloth_commander.unit = "units/pd2_dlc_gage_lmg/masks/cloth_commander/msk_cloth_commander"
	self.masks.cloth_commander.name_id = "bm_msk_cloth_commander"
	self.masks.cloth_commander.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.cloth_commander.value = 4
	self.masks.cloth_commander.qlvl = 0
	self.masks.cloth_commander.dlc = "gage_pack_lmg"
	self.masks.cloth_commander.texture_bundle_folder = "gage_pack_lmg"
	self.masks.gage_blade = {}
	self.masks.gage_blade.unit = "units/pd2_dlc_gage_lmg/masks/msk_gage_blade/msk_gage_blade"
	self.masks.gage_blade.name_id = "bm_msk_gage_blade"
	self.masks.gage_blade.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.gage_blade.value = 4
	self.masks.gage_blade.qlvl = 0
	self.masks.gage_blade.texture_bundle_folder = "gage_pack_lmg"
	self.masks.gage_blade.dlc = "gage_pack_lmg"
	self.masks.gage_rambo = {}
	self.masks.gage_rambo.unit = "units/pd2_dlc_gage_lmg/masks/msk_gage_rambo/msk_gage_rambo"
	self.masks.gage_rambo.name_id = "bm_msk_rambo"
	self.masks.gage_rambo.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.gage_rambo.value = 4
	self.masks.gage_rambo.qlvl = 0
	self.masks.gage_rambo.texture_bundle_folder = "gage_pack_lmg"
	self.masks.gage_rambo.dlc = "gage_pack_lmg"
	self.masks.gage_deltaforce = {}
	self.masks.gage_deltaforce.unit = "units/pd2_dlc_gage_lmg/masks/msk_gage_deltaforce/msk_gage_deltaforce"
	self.masks.gage_deltaforce.name_id = "bm_msk_deltaforce"
	self.masks.gage_deltaforce.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.gage_deltaforce.value = 4
	self.masks.gage_deltaforce.qlvl = 0
	self.masks.gage_deltaforce.texture_bundle_folder = "gage_pack_lmg"
	self.masks.gage_deltaforce.dlc = "gage_pack_lmg"
	self.masks.robberfly = {}
	self.masks.robberfly.unit = "units/pd2_dlc_gage_snp/masks/msk_robberfly/msk_robberfly"
	self.masks.robberfly.name_id = "bm_msk_robberfly"
	self.masks.robberfly.pcs = {}
	self.masks.robberfly.value = 0
	self.masks.robberfly.qlvl = 0
	self.masks.robberfly.texture_bundle_folder = "gage_pack_snp"
	self.masks.robberfly.dlc = "gage_pack_snp"
	self.masks.spider = {}
	self.masks.spider.unit = "units/pd2_dlc_gage_snp/masks/msk_spider/msk_spider"
	self.masks.spider.name_id = "bm_msk_spider"
	self.masks.spider.pcs = {}
	self.masks.spider.value = 0
	self.masks.spider.qlvl = 0
	self.masks.spider.texture_bundle_folder = "gage_pack_snp"
	self.masks.spider.dlc = "gage_pack_snp"
	self.masks.mantis = {}
	self.masks.mantis.unit = "units/pd2_dlc_gage_snp/masks/msk_mantis/msk_mantis"
	self.masks.mantis.name_id = "bm_msk_mantis"
	self.masks.mantis.pcs = {}
	self.masks.mantis.value = 0
	self.masks.mantis.qlvl = 0
	self.masks.mantis.texture_bundle_folder = "gage_pack_snp"
	self.masks.mantis.dlc = "gage_pack_snp"
	self.masks.wasp = {}
	self.masks.wasp.unit = "units/pd2_dlc_gage_snp/masks/msk_wasp/msk_wasp"
	self.masks.wasp.name_id = "bm_msk_wasp"
	self.masks.wasp.pcs = {}
	self.masks.wasp.value = 0
	self.masks.wasp.qlvl = 0
	self.masks.wasp.texture_bundle_folder = "gage_pack_snp"
	self.masks.wasp.dlc = "gage_pack_snp"
	self.masks.skullhard = {}
	self.masks.skullhard.unit = "units/payday2/masks/msk_skullhard/msk_skullhard"
	self.masks.skullhard.name_id = "bm_msk_skullhard"
	self.masks.skullhard.pcs = {}
	self.masks.skullhard.value = 0
	self.masks.skullhard.qlvl = 0
	self.masks.skullhard.infamous = true
	self.masks.skullveryhard = {}
	self.masks.skullveryhard.unit = "units/payday2/masks/msk_skullveryhard/msk_skullveryhard"
	self.masks.skullveryhard.name_id = "bm_msk_skullveryhard"
	self.masks.skullveryhard.pcs = {}
	self.masks.skullveryhard.value = 0
	self.masks.skullveryhard.qlvl = 0
	self.masks.skullveryhard.infamous = true
	self.masks.skulloverkill = {}
	self.masks.skulloverkill.unit = "units/payday2/masks/msk_skulloverkill/msk_skulloverkill"
	self.masks.skulloverkill.name_id = "bm_msk_skulloverkill"
	self.masks.skulloverkill.pcs = {}
	self.masks.skulloverkill.value = 0
	self.masks.skulloverkill.qlvl = 0
	self.masks.skulloverkill.infamous = true
	self.masks.skulloverkillplus = {}
	self.masks.skulloverkillplus.unit = "units/payday2/masks/msk_skulloverkillplus/msk_skulloverkillplus"
	self.masks.skulloverkillplus.name_id = "bm_msk_skulloverkillplus"
	self.masks.skulloverkillplus.pcs = {}
	self.masks.skulloverkillplus.value = 0
	self.masks.skulloverkillplus.qlvl = 0
	self.masks.skulloverkillplus.infamous = true
	self.masks.metalhead = {}
	self.masks.metalhead.unit = "units/pd2_poetry_winners/masks/veggie/msk_metalhead"
	self.masks.metalhead.name_id = "bm_msk_metalhead"
	self.masks.metalhead.pcs = {}
	self.masks.metalhead.value = 0
	self.masks.metalhead.dlc = "poetry_soundtrack"
	self.masks.metalhead.global_value = "poetry_soundtrack"
	self.masks.tcn = {}
	self.masks.tcn.unit = "units/pd2_poetry_winners/masks/tcn/msk_tcn"
	self.masks.tcn.name_id = "bm_msk_tcn"
	self.masks.tcn.pcs = {}
	self.masks.tcn.value = 0
	self.masks.tcn.dlc = "poetry_soundtrack"
	self.masks.tcn.global_value = "poetry_soundtrack"
	self.masks.surprise = {}
	self.masks.surprise.unit = "units/pd2_poetry_winners/masks/shaegro/msk_surprise"
	self.masks.surprise.name_id = "bm_msk_surprise"
	self.masks.surprise.pcs = {}
	self.masks.surprise.value = 0
	self.masks.surprise.dlc = "poetry_soundtrack"
	self.masks.surprise.global_value = "poetry_soundtrack"
	self.masks.optimist_prime = {}
	self.masks.optimist_prime.unit = "units/pd2_poetry_winners/masks/optimist_prime/msk_optimist_prime"
	self.masks.optimist_prime.name_id = "bm_msk_optimist_prime"
	self.masks.optimist_prime.pcs = {}
	self.masks.optimist_prime.value = 0
	self.masks.optimist_prime.dlc = "poetry_soundtrack"
	self.masks.optimist_prime.global_value = "poetry_soundtrack"
	self.masks.samurai = {}
	self.masks.samurai.unit = "units/payday2/masks/msk_samurai/msk_samurai"
	self.masks.samurai.name_id = "bm_msk_samurai"
	self.masks.samurai.pcs = {}
	self.masks.samurai.value = 0
	self.masks.samurai.qlvl = 0
	self.masks.samurai.infamous = true
	self.masks.twitch_orc = {}
	self.masks.twitch_orc.unit = "units/pd2_twitch_pack/masks/msk_twitch_orc/msk_twitch_orc"
	self.masks.twitch_orc.name_id = "bm_msk_twitch_orc"
	self.masks.twitch_orc.pcs = {}
	self.masks.twitch_orc.value = 0
	self.masks.twitch_orc.qlvl = 0
	self.masks.twitch_orc.texture_bundle_folder = "twitch_pack"
	self.masks.twitch_orc.dlc = "twitch_pack"
	self.masks.ancient = {}
	self.masks.ancient.unit = "units/pd2_twitch_pack/masks/msk_ancient/msk_ancient"
	self.masks.ancient.name_id = "bm_msk_ancient"
	self.masks.ancient.pcs = {}
	self.masks.ancient.value = 0
	self.masks.ancient.qlvl = 0
	self.masks.ancient.texture_bundle_folder = "twitch_pack"
	self.masks.ancient.dlc = "twitch_pack"
	self.masks.unicorn = {}
	self.masks.unicorn.unit = "units/payday2/masks/msk_unicorn/msk_unicorn"
	self.masks.unicorn.name_id = "bm_msk_unicorn"
	self.masks.unicorn.pcs = {}
	self.masks.unicorn.value = 0
	self.masks.unicorn.dlc = "pd2_clan"
	self.masks.unicorn.global_value = "pd2_clan"
	self.masks.franklin = {}
	self.masks.franklin.unit = "units/pd2_dlc_big/masks/msk_franklin/msk_franklin"
	self.masks.franklin.name_id = "bm_msk_franklin"
	self.masks.franklin.pcs = {}
	self.masks.franklin.value = 0
	self.masks.franklin.qlvl = 0
	self.masks.franklin.dlc = "big_bank"
	self.masks.franklin.texture_bundle_folder = "big_bank"
	self.masks.lincoln = {}
	self.masks.lincoln.unit = "units/pd2_dlc_big/masks/msk_lincoln/msk_lincoln"
	self.masks.lincoln.name_id = "bm_msk_lincoln"
	self.masks.lincoln.pcs = {}
	self.masks.lincoln.value = 0
	self.masks.lincoln.qlvl = 0
	self.masks.lincoln.dlc = "big_bank"
	self.masks.lincoln.texture_bundle_folder = "big_bank"
	self.masks.grant = {}
	self.masks.grant.unit = "units/pd2_dlc_big/masks/msk_grant/msk_grant"
	self.masks.grant.name_id = "bm_msk_grant"
	self.masks.grant.pcs = {}
	self.masks.grant.value = 0
	self.masks.grant.qlvl = 0
	self.masks.grant.dlc = "big_bank"
	self.masks.grant.texture_bundle_folder = "big_bank"
	self.masks.washington = {}
	self.masks.washington.unit = "units/pd2_dlc_big/masks/msk_washington/msk_washington"
	self.masks.washington.name_id = "bm_msk_washington"
	self.masks.washington.pcs = {}
	self.masks.washington.value = 0
	self.masks.washington.qlvl = 0
	self.masks.washington.dlc = "big_bank"
	self.masks.washington.texture_bundle_folder = "big_bank"
	self.masks.silverback = {}
	self.masks.silverback.unit = "units/pd2_dlc_gage_shot/masks/silverback/msk_silverback"
	self.masks.silverback.name_id = "bm_msk_silverback"
	self.masks.silverback.pcs = {}
	self.masks.silverback.value = 0
	self.masks.silverback.dlc = "gage_pack_shotgun"
	self.masks.silverback.texture_bundle_folder = "gage_pack_shotgun"
	self.masks.mandril = {}
	self.masks.mandril.unit = "units/pd2_dlc_gage_shot/masks/mandrill/msk_mandril"
	self.masks.mandril.name_id = "bm_msk_mandril"
	self.masks.mandril.pcs = {}
	self.masks.mandril.value = 0
	self.masks.mandril.dlc = "gage_pack_shotgun"
	self.masks.mandril.texture_bundle_folder = "gage_pack_shotgun"
	self.masks.skullmonkey = {}
	self.masks.skullmonkey.unit = "units/pd2_dlc_gage_shot/masks/skullmonkey/msk_skullmonkey"
	self.masks.skullmonkey.name_id = "bm_msk_skullmonkey"
	self.masks.skullmonkey.pcs = {}
	self.masks.skullmonkey.value = 0
	self.masks.skullmonkey.dlc = "gage_pack_shotgun"
	self.masks.skullmonkey.texture_bundle_folder = "gage_pack_shotgun"
	self.masks.orangutang = {}
	self.masks.orangutang.unit = "units/pd2_dlc_gage_shot/masks/orangutang/msk_orangutang"
	self.masks.orangutang.name_id = "bm_msk_orangutang"
	self.masks.orangutang.pcs = {}
	self.masks.orangutang.value = 0
	self.masks.orangutang.dlc = "gage_pack_shotgun"
	self.masks.orangutang.texture_bundle_folder = "gage_pack_shotgun"
	self.masks.galax = {}
	self.masks.galax.unit = "units/pd2_dlc_gage_assault/masks/msk_galax/msk_galax"
	self.masks.galax.name_id = "bm_msk_galax"
	self.masks.galax.pcs = {}
	self.masks.galax.value = 0
	self.masks.galax.dlc = "gage_pack_assault"
	self.masks.galax.texture_bundle_folder = "gage_pack_assault"
	self.masks.crowgoblin = {}
	self.masks.crowgoblin.unit = "units/pd2_dlc_gage_assault/masks/msk_crowgoblin/msk_crowgoblin"
	self.masks.crowgoblin.name_id = "bm_msk_crowgoblin"
	self.masks.crowgoblin.pcs = {}
	self.masks.crowgoblin.value = 0
	self.masks.crowgoblin.dlc = "gage_pack_assault"
	self.masks.crowgoblin.texture_bundle_folder = "gage_pack_assault"
	self.masks.evil = {}
	self.masks.evil.unit = "units/pd2_dlc_gage_assault/masks/msk_evil/msk_evil"
	self.masks.evil.name_id = "bm_msk_evil"
	self.masks.evil.pcs = {}
	self.masks.evil.value = 0
	self.masks.evil.dlc = "gage_pack_assault"
	self.masks.evil.texture_bundle_folder = "gage_pack_assault"
	self.masks.volt = {}
	self.masks.volt.unit = "units/pd2_dlc_gage_assault/masks/msk_volt/msk_volt"
	self.masks.volt.name_id = "bm_msk_volt"
	self.masks.volt.pcs = {}
	self.masks.volt.value = 0
	self.masks.volt.dlc = "gage_pack_assault"
	self.masks.volt.texture_bundle_folder = "gage_pack_assault"
	self.masks.white_wolf = {}
	self.masks.white_wolf.unit = "units/pd2_dlc_miami/masks/msk_white_wolf/msk_white_wolf"
	self.masks.white_wolf.name_id = "bm_msk_white_wolf"
	self.masks.white_wolf.pcs = {}
	self.masks.white_wolf.value = 0
	self.masks.white_wolf.dlc = "hl_miami"
	self.masks.white_wolf.texture_bundle_folder = "hl_miami"
	self.masks.owl = {}
	self.masks.owl.unit = "units/pd2_dlc_miami/masks/msk_owl/msk_owl"
	self.masks.owl.name_id = "bm_msk_owl"
	self.masks.owl.pcs = {}
	self.masks.owl.value = 0
	self.masks.owl.dlc = "hl_miami"
	self.masks.owl.texture_bundle_folder = "hl_miami"
	self.masks.rabbit = {}
	self.masks.rabbit.unit = "units/pd2_dlc_miami/masks/msk_rabbit/msk_rabbit"
	self.masks.rabbit.name_id = "bm_msk_rabbit"
	self.masks.rabbit.pcs = {}
	self.masks.rabbit.value = 0
	self.masks.rabbit.dlc = "hl_miami"
	self.masks.rabbit.texture_bundle_folder = "hl_miami"
	self.masks.pig = {}
	self.masks.pig.unit = "units/pd2_dlc_miami/masks/msk_pig/msk_pig"
	self.masks.pig.name_id = "bm_msk_pig"
	self.masks.pig.pcs = {}
	self.masks.pig.value = 0
	self.masks.pig.dlc = "hl_miami"
	self.masks.pig.texture_bundle_folder = "hl_miami"
	self.masks.panther = {}
	self.masks.panther.unit = "units/pd2_dlc_miami/masks/msk_panther/msk_panther"
	self.masks.panther.name_id = "bm_msk_panther"
	self.masks.panther.pcs = {}
	self.masks.panther.value = 0
	self.masks.panther.dlc = "hlm_game"
	self.masks.panther.texture_bundle_folder = "hl_miami"
	self.masks.rooster = {}
	self.masks.rooster.unit = "units/pd2_dlc_miami/masks/msk_rooster/msk_rooster"
	self.masks.rooster.name_id = "bm_msk_rooster"
	self.masks.rooster.pcs = {}
	self.masks.rooster.value = 0
	self.masks.rooster.dlc = "hlm_game"
	self.masks.rooster.texture_bundle_folder = "hl_miami"
	self.masks.horse = {}
	self.masks.horse.unit = "units/pd2_dlc_miami/masks/msk_horse/msk_horse"
	self.masks.horse.name_id = "bm_msk_horse"
	self.masks.horse.pcs = {}
	self.masks.horse.value = 0
	self.masks.horse.dlc = "hlm_game"
	self.masks.horse.texture_bundle_folder = "hl_miami"
	self.masks.tiger = {}
	self.masks.tiger.unit = "units/pd2_dlc_miami/masks/msk_tiger/msk_tiger"
	self.masks.tiger.name_id = "bm_msk_tiger"
	self.masks.tiger.pcs = {}
	self.masks.tiger.value = 0
	self.masks.tiger.dlc = "hlm_game"
	self.masks.tiger.texture_bundle_folder = "hl_miami"
	if SystemInfo:platform() == Idstring("PS3") then
		self.masks.sweettooth = {}
		self.masks.sweettooth.unit = "units/payday2/masks/msk_sweettooth/msk_sweettooth"
		self.masks.sweettooth.name_id = "bm_msk_sweettooth"
		self.masks.sweettooth.pcs = {
			10,
			20,
			30,
			40
		}
		self.masks.sweettooth.dlc = "sweettooth"
		self.masks.sweettooth.value = 1
	end
	self:_add_desc_from_name_macro(self.masks)
end

function BlackMarketTweakData_37:_init_characters()
	self.characters = {}
	self.characters.locked = {}
	self.characters.locked.fps_unit = "units/payday2/characters/fps_mover/fps_mover"
	self.characters.locked.npc_unit = "units/payday2/characters/npc_criminals_suit_1/npc_criminals_suit_1"
	self.characters.locked.menu_unit = "units/payday2/characters/npc_criminals_suit_1/npc_criminals_suit_1_menu"
	self.characters.locked.sequence = "var_material_01"
	self.characters.locked.name_id = "bm_character_locked"
	self.characters.locked.dallas = {
		sequence = "var_mtr_dallas"
	}
	self.characters.locked.wolf = {
		sequence = "var_mtr_wolf"
	}
	self.characters.locked.hoxton = {
		sequence = "var_mtr_hoxton"
	}
	self.characters.locked.chains = {
		sequence = "var_mtr_chains"
	}
	self.characters.ai_hoxton = {}
	self.characters.ai_hoxton.npc_unit = "units/payday2/characters/npc_criminals_suit_1/hoxton/npc_criminal_suit_hoxton"
	self.characters.ai_hoxton.sequence = "var_mtr_hoxton"
	self.characters.ai_hoxton.name_id = "bm_character_ai_hoxton"
	self.characters.ai_chains = {}
	self.characters.ai_chains.npc_unit = "units/payday2/characters/npc_criminals_suit_1/chains/npc_criminal_suit_chains"
	self.characters.ai_chains.sequence = "var_mtr_chains"
	self.characters.ai_chains.name_id = "bm_character_ai_chains"
	self.characters.ai_dallas = {}
	self.characters.ai_dallas.npc_unit = "units/payday2/characters/npc_criminals_suit_1/dallas/npc_criminal_suit_dallas"
	self.characters.ai_dallas.sequence = "var_mtr_dallas"
	self.characters.ai_dallas.name_id = "bm_character_ai_dallas"
	self.characters.ai_wolf = {}
	self.characters.ai_wolf.npc_unit = "units/payday2/characters/npc_criminals_suit_1/wolf/npc_criminal_suit_wolf"
	self.characters.ai_wolf.sequence = "var_mtr_wolf"
	self.characters.ai_wolf.name_id = "bm_character_ai_/wolf"
end

function BlackMarketTweakData_37:_init_colors()
	self.colors = {}
	local white = Color.white
	local black = Color.black
	local red = Color.red
	local green = Color.green
	local blue = Color.blue
	local yellow = Color.yellow
	local magenta = Color(255, 255, 0, 255) / 255
	local cyan = Color(255, 0, 255, 255) / 255
	local light_gray = Color(255, 191, 191, 191) / 255
	local gray = Color(255, 128, 128, 128) / 255
	local dark_gray = Color(255, 64, 64, 64) / 255
	local blood_red = Color(255, 138, 17, 9) / 255
	local orange = Color(255, 255, 94, 15) / 255
	local light_brown = Color(255, 204, 115, 35) / 255
	local bright_yellow = Color(255, 255, 207, 76) / 255
	local lime_green = Color(255, 0, 166, 81) / 255
	local purple = Color(255, 154, 68, 220) / 255
	local pink = Color(255, 255, 122, 230) / 255
	local brown = Color(255, 128, 70, 13) / 255
	local navy_blue = Color(255, 40, 52, 86) / 255
	local matte_blue = Color(255, 56, 97, 168) / 255
	local olive_green = Color(255, 72, 90, 50) / 255
	local gray_blue = Color(255, 12, 68, 84) / 255
	local light_blue = Color(255, 126, 198, 238) / 255
	local bone_white = Color(255, 255, 238, 151) / 255
	local turquoise = Color(255, 0, 209, 157) / 255
	local matte_purple = Color(255, 107, 84, 144) / 255
	local coral_red = Color(255, 213, 36, 53) / 255
	local leaf_green = Color(255, 104, 191, 54) / 255
	local dark_green = Color(255, 7, 61, 9) / 255
	local warm_yellow = Color(255, 250, 157, 7) / 255
	local dark_red = Color(255, 110, 15, 22) / 255
	local cobalt_blue = Color(255, 0, 93, 199) / 255
	local toxic_green = Color(255, 167, 248, 87) / 255
	local nothing = Color(0, 0, 0, 0) / 255
	self.colors.white_solid = {}
	self.colors.white_solid.colors = {white, white}
	self.colors.white_solid.name_id = "bm_clr_white_solid"
	self.colors.white_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.white_solid.value = 7
	self.colors.black_solid = {}
	self.colors.black_solid.colors = {black, black}
	self.colors.black_solid.name_id = "bm_clr_black_solid"
	self.colors.black_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.black_solid.infamous = true
	self.colors.black_solid.value = 10
	self.colors.red_solid = {}
	self.colors.red_solid.colors = {red, red}
	self.colors.red_solid.name_id = "bm_clr_red_solid"
	self.colors.red_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.red_solid.value = 5
	self.colors.blue_solid = {}
	self.colors.blue_solid.colors = {blue, blue}
	self.colors.blue_solid.name_id = "bm_clr_blue_solid"
	self.colors.blue_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.blue_solid.value = 8
	self.colors.green_solid = {}
	self.colors.green_solid.colors = {green, green}
	self.colors.green_solid.name_id = "bm_clr_green_solid"
	self.colors.green_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.green_solid.value = 8
	self.colors.cyan_solid = {}
	self.colors.cyan_solid.colors = {cyan, cyan}
	self.colors.cyan_solid.name_id = "bm_clr_cyan_solid"
	self.colors.cyan_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.cyan_solid.value = 8
	self.colors.magenta_solid = {}
	self.colors.magenta_solid.colors = {magenta, magenta}
	self.colors.magenta_solid.name_id = "bm_clr_magenta_solid"
	self.colors.magenta_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.magenta_solid.infamous = true
	self.colors.magenta_solid.value = 7
	self.colors.yellow_solid = {}
	self.colors.yellow_solid.colors = {yellow, yellow}
	self.colors.yellow_solid.name_id = "bm_clr_yellow_solid"
	self.colors.yellow_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.yellow_solid.value = 6
	self.colors.light_gray_solid = {}
	self.colors.light_gray_solid.colors = {light_gray, light_gray}
	self.colors.light_gray_solid.name_id = "bm_clr_light_gray_solid"
	self.colors.light_gray_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.light_gray_solid.value = 7
	self.colors.dark_gray_solid = {}
	self.colors.dark_gray_solid.colors = {dark_gray, dark_gray}
	self.colors.dark_gray_solid.name_id = "bm_clr_dark_gray_solid"
	self.colors.dark_gray_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.dark_gray_solid.infamous = true
	self.colors.dark_gray_solid.value = 8
	self.colors.gray_solid = {}
	self.colors.gray_solid.colors = {gray, gray}
	self.colors.gray_solid.name_id = "bm_clr_gray_solid"
	self.colors.gray_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.gray_solid.value = 6
	self.colors.pink_solid = {}
	self.colors.pink_solid.colors = {pink, pink}
	self.colors.pink_solid.name_id = "bm_clr_pink_solid"
	self.colors.pink_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.pink_solid.infamous = true
	self.colors.pink_solid.value = 7
	self.colors.purple_solid = {}
	self.colors.purple_solid.colors = {purple, purple}
	self.colors.purple_solid.name_id = "bm_clr_purple_solid"
	self.colors.purple_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.purple_solid.value = 8
	self.colors.blood_red_solid = {}
	self.colors.blood_red_solid.colors = {blood_red, blood_red}
	self.colors.blood_red_solid.name_id = "bm_clr_blood_red_solid"
	self.colors.blood_red_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.blood_red_solid.infamous = true
	self.colors.blood_red_solid.value = 9
	self.colors.orange_solid = {}
	self.colors.orange_solid.colors = {orange, orange}
	self.colors.orange_solid.name_id = "bm_clr_orange_solid"
	self.colors.orange_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.orange_solid.value = 8
	self.colors.light_brown_solid = {}
	self.colors.light_brown_solid.colors = {light_brown, light_brown}
	self.colors.light_brown_solid.name_id = "bm_clr_light_brown_solid"
	self.colors.light_brown_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.light_brown_solid.value = 6
	self.colors.brown_solid = {}
	self.colors.brown_solid.colors = {brown, brown}
	self.colors.brown_solid.name_id = "bm_clr_brown_solid"
	self.colors.brown_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.brown_solid.value = 8
	self.colors.navy_blue_solid = {}
	self.colors.navy_blue_solid.colors = {navy_blue, navy_blue}
	self.colors.navy_blue_solid.name_id = "bm_clr_navy_blue_solid"
	self.colors.navy_blue_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.navy_blue_solid.infamous = true
	self.colors.navy_blue_solid.value = 7
	self.colors.light_blue_solid = {}
	self.colors.light_blue_solid.colors = {light_blue, light_blue}
	self.colors.light_blue_solid.name_id = "bm_clr_light_blue_solid"
	self.colors.light_blue_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.light_blue_solid.value = 5
	self.colors.leaf_green_solid = {}
	self.colors.leaf_green_solid.colors = {leaf_green, leaf_green}
	self.colors.leaf_green_solid.name_id = "bm_clr_leaf_green_solid"
	self.colors.leaf_green_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.leaf_green_solid.value = 8
	self.colors.warm_yellow_solid = {}
	self.colors.warm_yellow_solid.colors = {warm_yellow, warm_yellow}
	self.colors.warm_yellow_solid.name_id = "bm_clr_warm_yellow_solid"
	self.colors.warm_yellow_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.warm_yellow_solid.infamous = true
	self.colors.warm_yellow_solid.value = 6
	self.colors.dark_red_solid = {}
	self.colors.dark_red_solid.colors = {dark_red, dark_red}
	self.colors.dark_red_solid.name_id = "bm_clr_dark_red_solid"
	self.colors.dark_red_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.dark_red_solid.value = 5
	self.colors.dark_green_solid = {}
	self.colors.dark_green_solid.colors = {dark_green, dark_green}
	self.colors.dark_green_solid.name_id = "bm_clr_dark_green_solid"
	self.colors.dark_green_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.dark_green_solid.infamous = true
	self.colors.dark_green_solid.value = 6
	self.colors.nothing = {}
	self.colors.nothing.colors = {nothing, nothing}
	self.colors.nothing.name_id = "bm_clr_nothing"
	self.colors.nothing.value = 0
	self.colors.black_white = {}
	self.colors.black_white.colors = {black, white}
	self.colors.black_white.name_id = "bm_clr_black_white"
	self.colors.black_white.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.black_white.infamous = true
	self.colors.black_white.value = 3
	self.colors.red_black = {}
	self.colors.red_black.colors = {red, black}
	self.colors.red_black.name_id = "bm_clr_red_black"
	self.colors.red_black.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.red_black.dlc = "preorder"
	self.colors.red_black.value = 1
	self.colors.yellow_blue = {}
	self.colors.yellow_blue.colors = {yellow, blue}
	self.colors.yellow_blue.name_id = "bm_clr_yellow_blue"
	self.colors.yellow_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.yellow_blue.value = 5
	self.colors.red_blue = {}
	self.colors.red_blue.colors = {red, blue}
	self.colors.red_blue.name_id = "bm_clr_red_blue"
	self.colors.red_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.red_blue.value = 2
	self.colors.light_gray_dark_gray = {}
	self.colors.light_gray_dark_gray.colors = {light_gray, dark_gray}
	self.colors.light_gray_dark_gray.name_id = "bm_clr_light_gray_dark_gray"
	self.colors.light_gray_dark_gray.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.light_gray_dark_gray.value = 3
	self.colors.magenta_cyan = {}
	self.colors.magenta_cyan.colors = {magenta, cyan}
	self.colors.magenta_cyan.name_id = "bm_clr_magenta_cyan"
	self.colors.magenta_cyan.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.magenta_cyan.value = 4
	self.colors.green_red = {}
	self.colors.green_red.colors = {green, red}
	self.colors.green_red.name_id = "bm_clr_green_red"
	self.colors.green_red.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.green_red.value = 2
	self.colors.orange_blue = {}
	self.colors.orange_blue.colors = {orange, blue}
	self.colors.orange_blue.name_id = "bm_clr_orange_blue"
	self.colors.orange_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.orange_blue.value = 3
	self.colors.green_olive_green = {}
	self.colors.green_olive_green.colors = {green, olive_green}
	self.colors.green_olive_green.name_id = "bm_clr_green_olive_green"
	self.colors.green_olive_green.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.green_olive_green.value = 4
	self.colors.yellow_orange = {}
	self.colors.yellow_orange.colors = {yellow, orange}
	self.colors.yellow_orange.name_id = "bm_clr_yellow_orange"
	self.colors.yellow_orange.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.yellow_orange.value = 2
	self.colors.light_brown_matte_blue = {}
	self.colors.light_brown_matte_blue.colors = {light_brown, matte_blue}
	self.colors.light_brown_matte_blue.name_id = "bm_clr_light_brown_matte_blue"
	self.colors.light_brown_matte_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.light_brown_matte_blue.value = 3
	self.colors.turquoise_purple = {}
	self.colors.turquoise_purple.colors = {turquoise, purple}
	self.colors.turquoise_purple.name_id = "bm_clr_turquoise_purple"
	self.colors.turquoise_purple.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.turquoise_purple.value = 2
	self.colors.orange_gray_blue = {}
	self.colors.orange_gray_blue.colors = {orange, gray_blue}
	self.colors.orange_gray_blue.name_id = "bm_clr_orange_gray_blue"
	self.colors.orange_gray_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.orange_gray_blue.value = 4
	self.colors.coral_red_matte_blue = {}
	self.colors.coral_red_matte_blue.colors = {coral_red, matte_blue}
	self.colors.coral_red_matte_blue.name_id = "bm_clr_coral_red_matte_blue"
	self.colors.coral_red_matte_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.coral_red_matte_blue.value = 3
	self.colors.toxic_green_dark_green = {}
	self.colors.toxic_green_dark_green.colors = {toxic_green, dark_green}
	self.colors.toxic_green_dark_green.name_id = "bm_clr_toxic_green_dark_green"
	self.colors.toxic_green_dark_green.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.toxic_green_dark_green.value = 4
	self.colors.warm_yellow_matte_purple = {}
	self.colors.warm_yellow_matte_purple.colors = {warm_yellow, matte_purple}
	self.colors.warm_yellow_matte_purple.name_id = "bm_clr_warm_yellow_matte_purple"
	self.colors.warm_yellow_matte_purple.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.warm_yellow_matte_purple.value = 3
	self.colors.bright_yellow_brown = {}
	self.colors.bright_yellow_brown.colors = {bright_yellow, brown}
	self.colors.bright_yellow_brown.name_id = "bm_clr_bright_yellow_brown"
	self.colors.bright_yellow_brown.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.bright_yellow_brown.value = 2
	self.colors.coral_red_lime_green = {}
	self.colors.coral_red_lime_green.colors = {coral_red, lime_green}
	self.colors.coral_red_lime_green.name_id = "bm_clr_coral_red_lime_green"
	self.colors.coral_red_lime_green.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.coral_red_lime_green.value = 3
	self.colors.white_matte_blue = {}
	self.colors.white_matte_blue.colors = {white, matte_blue}
	self.colors.white_matte_blue.name_id = "bm_clr_white_matte_blue"
	self.colors.white_matte_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.white_matte_blue.value = 4
	self.colors.red_dark_red = {}
	self.colors.red_dark_red.colors = {red, dark_red}
	self.colors.red_dark_red.name_id = "bm_clr_red_dark_red"
	self.colors.red_dark_red.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.red_dark_red.value = 2
	self.colors.bone_white_magenta = {}
	self.colors.bone_white_magenta.colors = {bone_white, magenta}
	self.colors.bone_white_magenta.name_id = "bm_clr_bone_white_magenta"
	self.colors.bone_white_magenta.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.bone_white_magenta.value = 3
	self.colors.cobalt_blue_navy_blue = {}
	self.colors.cobalt_blue_navy_blue.colors = {cobalt_blue, navy_blue}
	self.colors.cobalt_blue_navy_blue.name_id = "bm_clr_cobalt_blue_navy_blue"
	self.colors.cobalt_blue_navy_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.cobalt_blue_navy_blue.value = 4
	self.colors.toxic_green_leaf_green = {}
	self.colors.toxic_green_leaf_green.colors = {toxic_green, leaf_green}
	self.colors.toxic_green_leaf_green.name_id = "bm_clr_toxic_green_leaf_green"
	self.colors.toxic_green_leaf_green.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.toxic_green_leaf_green.value = 2
	self.colors.light_brown_brown = {}
	self.colors.light_brown_brown.colors = {light_brown, brown}
	self.colors.light_brown_brown.name_id = "bm_clr_light_brown_brown"
	self.colors.light_brown_brown.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.light_brown_brown.value = 3
	self.colors.bright_yellow_turquoise = {}
	self.colors.bright_yellow_turquoise.colors = {bright_yellow, turquoise}
	self.colors.bright_yellow_turquoise.name_id = "bm_clr_bright_yellow_turquoise"
	self.colors.bright_yellow_turquoise.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.bright_yellow_turquoise.value = 4
	self.colors.light_blue_gray_blue = {}
	self.colors.light_blue_gray_blue.colors = {light_blue, gray_blue}
	self.colors.light_blue_gray_blue.name_id = "bm_clr_light_blue_gray_blue"
	self.colors.light_blue_gray_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.light_blue_gray_blue.value = 3
	self.colors.pink_matte_purple = {}
	self.colors.pink_matte_purple.colors = {pink, matte_purple}
	self.colors.pink_matte_purple.name_id = "bm_clr_pink_matte_purple"
	self.colors.pink_matte_purple.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.pink_matte_purple.value = 2
	self.colors.bone_white_purple = {}
	self.colors.bone_white_purple.colors = {bone_white, purple}
	self.colors.bone_white_purple.name_id = "bm_clr_bone_white_purple"
	self.colors.bone_white_purple.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.bone_white_purple.value = 4
	self.colors.light_blue_cobalt_blue = {}
	self.colors.light_blue_cobalt_blue.colors = {light_blue, cobalt_blue}
	self.colors.light_blue_cobalt_blue.name_id = "bm_clr_light_blue_cobalt_blue"
	self.colors.light_blue_cobalt_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.light_blue_cobalt_blue.value = 3
	self.colors.coral_red_gray_blue = {}
	self.colors.coral_red_gray_blue.colors = {coral_red, gray_blue}
	self.colors.coral_red_gray_blue.name_id = "bm_clr_coral_red_gray_blue"
	self.colors.coral_red_gray_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.coral_red_gray_blue.value = 2
	self.colors.leaf_green_blood_red = {}
	self.colors.leaf_green_blood_red.colors = {leaf_green, blood_red}
	self.colors.leaf_green_blood_red.name_id = "bm_clr_leaf_green_blood_red"
	self.colors.leaf_green_blood_red.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.leaf_green_blood_red.value = 3
	self.colors.cobalt_blue_pink = {}
	self.colors.cobalt_blue_pink.colors = {cobalt_blue, pink}
	self.colors.cobalt_blue_pink.name_id = "bm_clr_cobalt_blue_pink"
	self.colors.cobalt_blue_pink.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.cobalt_blue_pink.value = 2
	self.colors.bright_yellow_olive_green = {}
	self.colors.bright_yellow_olive_green.colors = {bright_yellow, olive_green}
	self.colors.bright_yellow_olive_green.name_id = "bm_clr_bright_yellow_olive_green"
	self.colors.bright_yellow_olive_green.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.bright_yellow_olive_green.value = 1
	self.colors.bone_white_light_blue = {}
	self.colors.bone_white_light_blue.colors = {bone_white, light_blue}
	self.colors.bone_white_light_blue.name_id = "bm_clr_bone_white_light_blue"
	self.colors.bone_white_light_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.bone_white_light_blue.value = 1
	self.colors.coral_red_dark_red = {}
	self.colors.coral_red_dark_red.colors = {coral_red, dark_red}
	self.colors.coral_red_dark_red.name_id = "bm_clr_coral_red_dark_red"
	self.colors.coral_red_dark_red.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.coral_red_dark_red.value = 2
	self.colors.turquoise_pink = {}
	self.colors.turquoise_pink.colors = {turquoise, pink}
	self.colors.turquoise_pink.name_id = "bm_clr_turquoise_pink"
	self.colors.turquoise_pink.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.turquoise_pink.value = 1
	self.colors.white_brown = {}
	self.colors.white_brown.colors = {white, brown}
	self.colors.white_brown.name_id = "bm_clr_white_brown"
	self.colors.white_brown.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.white_brown.value = 1
	self.colors.blue_light_blue = {}
	self.colors.blue_light_blue.colors = {blue, light_blue}
	self.colors.blue_light_blue.name_id = "bm_clr_blue_light_blue"
	self.colors.blue_light_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.blue_light_blue.value = 2
	self.colors.toxic_green_matte_purple = {}
	self.colors.toxic_green_matte_purple.colors = {toxic_green, matte_purple}
	self.colors.toxic_green_matte_purple.name_id = "bm_clr_toxic_green_matte_purple"
	self.colors.toxic_green_matte_purple.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.toxic_green_matte_purple.value = 2
	self.colors.orange_matte_blue = {}
	self.colors.orange_matte_blue.colors = {orange, matte_blue}
	self.colors.orange_matte_blue.name_id = "bm_clr_orange_matte_blue"
	self.colors.orange_matte_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.orange_matte_blue.value = 3
	self.colors.warm_yellow_navy_blue = {}
	self.colors.warm_yellow_navy_blue.colors = {warm_yellow, navy_blue}
	self.colors.warm_yellow_navy_blue.name_id = "bm_clr_warm_yellow_navy_blue"
	self.colors.warm_yellow_navy_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.warm_yellow_navy_blue.value = 3
	self.colors.bright_yellow_dark_gray = {}
	self.colors.bright_yellow_dark_gray.colors = {bright_yellow, dark_gray}
	self.colors.bright_yellow_dark_gray.name_id = "bm_clr_bright_yellow_dark_gray"
	self.colors.bright_yellow_dark_gray.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.bright_yellow_dark_gray.value = 2
	self.colors.white_magenta = {}
	self.colors.white_magenta.colors = {white, magenta}
	self.colors.white_magenta.name_id = "bm_clr_white_magenta"
	self.colors.white_magenta.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.white_magenta.value = 4
	self.colors.cyan_purple = {}
	self.colors.cyan_purple.colors = {cyan, purple}
	self.colors.cyan_purple.name_id = "bm_clr_cyan_purple"
	self.colors.cyan_purple.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.cyan_purple.value = 5
	self.colors.white_black = {}
	self.colors.white_black.colors = {white, black}
	self.colors.white_black.name_id = "bm_clr_white_black"
	self.colors.white_black.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.white_black.infamous = true
	self.colors.white_black.value = 3
	self.colors.light_gray_blood_red = {}
	self.colors.light_gray_blood_red.colors = {light_gray, blood_red}
	self.colors.light_gray_blood_red.name_id = "bm_clr_light_gray_blood_red"
	self.colors.light_gray_blood_red.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.light_gray_blood_red.value = 6
	self.colors.blood_red_white = {}
	self.colors.blood_red_white.colors = {blood_red, white}
	self.colors.blood_red_white.name_id = "bm_clr_blood_red_white"
	self.colors.blood_red_white.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.blood_red_white.infamous = true
	self.colors.blood_red_white.value = 6
	self.colors.bone_white_navy_blue = {}
	self.colors.bone_white_navy_blue.colors = {bone_white, navy_blue}
	self.colors.bone_white_navy_blue.name_id = "bm_clr_bone_white_navy_blue"
	self.colors.bone_white_navy_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.bone_white_navy_blue.value = 5
	self.colors.warm_yellow_olive_green = {}
	self.colors.warm_yellow_olive_green.colors = {warm_yellow, olive_green}
	self.colors.warm_yellow_olive_green.name_id = "bm_clr_warm_yellow_olive_green"
	self.colors.warm_yellow_olive_green.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.warm_yellow_olive_green.value = 4
	self.colors.cyan_orange = {}
	self.colors.cyan_orange.colors = {cyan, orange}
	self.colors.cyan_orange.name_id = "bm_clr_cyan_orange"
	self.colors.cyan_orange.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.cyan_orange.value = 3
	self.colors.dark_gray_orange = {}
	self.colors.dark_gray_orange.colors = {dark_gray, orange}
	self.colors.dark_gray_orange.name_id = "bm_clr_dark_gray_orange"
	self.colors.dark_gray_orange.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.dark_gray_orange.value = 2
	self.colors.light_brown_navy_blue = {}
	self.colors.light_brown_navy_blue.colors = {light_brown, navy_blue}
	self.colors.light_brown_navy_blue.name_id = "bm_clr_light_brown_navy_blue"
	self.colors.light_brown_navy_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.light_brown_navy_blue.value = 2
	self.colors.orange_purple = {}
	self.colors.orange_purple.colors = {orange, purple}
	self.colors.orange_purple.name_id = "bm_clr_orange_purple"
	self.colors.orange_purple.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.orange_purple.value = 2
	self.colors.light_blue_brown = {}
	self.colors.light_blue_brown.colors = {light_blue, brown}
	self.colors.light_blue_brown.name_id = "bm_clr_light_blue_brown"
	self.colors.light_blue_brown.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.light_blue_brown.value = 3
	self.colors.green_blood_red = {}
	self.colors.green_blood_red.colors = {green, blood_red}
	self.colors.green_blood_red.name_id = "bm_clr_green_blood_red"
	self.colors.green_blood_red.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.green_blood_red.value = 4
	self.colors.cyan_blue = {}
	self.colors.cyan_blue.colors = {cyan, blue}
	self.colors.cyan_blue.name_id = "bm_clr_cyan_blue"
	self.colors.cyan_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.cyan_blue.value = 5
	self.colors.yellow_orange = {}
	self.colors.yellow_orange.colors = {yellow, orange}
	self.colors.yellow_orange.name_id = "bm_clr_yellow_orange"
	self.colors.yellow_orange.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.yellow_orange.value = 6
	self.colors.light_gray_dark_gray = {}
	self.colors.light_gray_dark_gray.colors = {light_gray, dark_gray}
	self.colors.light_gray_dark_gray.name_id = "bm_clr_light_gray_dark_gray"
	self.colors.light_gray_dark_gray.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.light_gray_dark_gray.value = 2
	self.colors.gray_black = {}
	self.colors.gray_black.colors = {gray, black}
	self.colors.gray_black.name_id = "bm_clr_gray_black"
	self.colors.gray_black.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.gray_black.value = 3
	self.colors.white_dark_gray = {}
	self.colors.white_dark_gray.colors = {white, dark_gray}
	self.colors.white_dark_gray.name_id = "bm_clr_white_dark_gray"
	self.colors.white_dark_gray.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.white_dark_gray.value = 6
	self.colors.white_brown = {}
	self.colors.white_brown.colors = {white, brown}
	self.colors.white_brown.name_id = "bm_clr_white_brown"
	self.colors.white_brown.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.white_brown.value = 3
	self.colors.white_navy_blue = {}
	self.colors.white_navy_blue.colors = {white, navy_blue}
	self.colors.white_navy_blue.name_id = "bm_clr_white_navy_blue"
	self.colors.white_navy_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.white_navy_blue.value = 4
	self.colors.white_purple = {}
	self.colors.white_purple.colors = {white, purple}
	self.colors.white_purple.name_id = "bm_clr_white_purple"
	self.colors.white_purple.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.white_purple.value = 2
	self.colors.black_coral_red = {}
	self.colors.black_coral_red.colors = {black, coral_red}
	self.colors.black_coral_red.name_id = "bm_clr_black_coral_red"
	self.colors.black_coral_red.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.black_coral_red.value = 3
	self.colors.black_orange = {}
	self.colors.black_orange.colors = {black, orange}
	self.colors.black_orange.name_id = "bm_clr_black_orange"
	self.colors.black_orange.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.black_orange.value = 4
	self.colors.black_cobalt_blue = {}
	self.colors.black_cobalt_blue.colors = {black, cobalt_blue}
	self.colors.black_cobalt_blue.name_id = "bm_clr_black_cobalt_blue"
	self.colors.black_cobalt_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.black_cobalt_blue.value = 2
	self.colors.black_leaf_green = {}
	self.colors.black_leaf_green.colors = {black, leaf_green}
	self.colors.black_leaf_green.name_id = "bm_clr_black_leaf_green"
	self.colors.black_leaf_green.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.black_leaf_green.value = 3
	self.colors.red_white = {}
	self.colors.red_white.colors = {red, white}
	self.colors.red_white.name_id = "bm_clr_red_white"
	self.colors.red_white.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.red_white.value = 4
	self.colors.leaf_green_white = {}
	self.colors.leaf_green_white.colors = {leaf_green, white}
	self.colors.leaf_green_white.name_id = "bm_clr_leaf_green_white"
	self.colors.leaf_green_white.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.leaf_green_white.value = 2
	self.colors.orange_white = {}
	self.colors.orange_white.colors = {orange, white}
	self.colors.orange_white.name_id = "bm_clr_orange_white"
	self.colors.orange_white.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.orange_white.value = 3
	self.colors.cobalt_blue_white = {}
	self.colors.cobalt_blue_white.colors = {cobalt_blue, white}
	self.colors.cobalt_blue_white.name_id = "bm_clr_cobalt_blue_white"
	self.colors.cobalt_blue_white.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.cobalt_blue_white.value = 4
	self.colors.warm_yellow_white = {}
	self.colors.warm_yellow_white.colors = {warm_yellow, white}
	self.colors.warm_yellow_white.name_id = "bm_clr_warm_yellow_white"
	self.colors.warm_yellow_white.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.warm_yellow_white.value = 3
	self.colors.black_bright_yellow = {}
	self.colors.black_bright_yellow.colors = {black, bright_yellow}
	self.colors.black_bright_yellow.name_id = "bm_clr_black_bright_yellow"
	self.colors.black_bright_yellow.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.black_bright_yellow.value = 2
	self.colors.warm_yellow_bright_yellow = {}
	self.colors.warm_yellow_bright_yellow.colors = {warm_yellow, bright_yellow}
	self.colors.warm_yellow_bright_yellow.name_id = "bm_clr_warm_yellow_bright_yellow"
	self.colors.warm_yellow_bright_yellow.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.warm_yellow_bright_yellow.value = 3
	self.colors.black_magenta = {}
	self.colors.black_magenta.colors = {black, magenta}
	self.colors.black_magenta.name_id = "bm_clr_black_magenta"
	self.colors.black_magenta.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.black_magenta.value = 4
	self.colors.navy_blue_light_blue = {}
	self.colors.navy_blue_light_blue.colors = {navy_blue, light_blue}
	self.colors.navy_blue_light_blue.name_id = "bm_clr_navy_blue_light_blue"
	self.colors.navy_blue_light_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.navy_blue_light_blue.value = 2
	self.colors.dark_red_orange = {}
	self.colors.dark_red_orange.colors = {dark_red, orange}
	self.colors.dark_red_orange.name_id = "bm_clr_dark_red_orange"
	self.colors.dark_red_orange.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.dark_red_orange.value = 3
end

function BlackMarketTweakData_37:_init_materials()
	self.materials = {}
	self.materials.plastic = {}
	self.materials.plastic.name_id = "bm_mtl_plastic"
	self.materials.plastic.texture = "units/payday2/matcaps/matcap_plastic_df"
	self.materials.plastic.value = 0
	self.materials.titanium = {}
	self.materials.titanium.name_id = "bm_mtl_titanium"
	self.materials.titanium.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.titanium.texture = "units/payday2/matcaps/matcap_titanium_df"
	self.materials.titanium.infamous = true
	self.materials.titanium.value = 5
	self.materials.mercury = {}
	self.materials.mercury.name_id = "bm_mtl_mercury"
	self.materials.mercury.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.mercury.texture = "units/payday2/matcaps/matcap_mercury_df"
	self.materials.mercury.value = 3
	self.materials.oxide_bronze = {}
	self.materials.oxide_bronze.name_id = "bm_mtl_oxide_bronze"
	self.materials.oxide_bronze.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.oxide_bronze.texture = "units/payday2/matcaps/matcap_oxide_bronze_df"
	self.materials.oxide_bronze.value = 4
	self.materials.deep_bronze = {}
	self.materials.deep_bronze.name_id = "bm_mtl_deep_bronze"
	self.materials.deep_bronze.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.deep_bronze.texture = "units/payday2/matcaps/matcap_deep_bronze_df"
	self.materials.deep_bronze.infamous = true
	self.materials.deep_bronze.value = 5
	self.materials.slime = {}
	self.materials.slime.name_id = "bm_mtl_slime"
	self.materials.slime.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.slime.texture = "units/payday2/matcaps/matcap_slime_df"
	self.materials.slime.infamous = true
	self.materials.slime.value = 2
	self.materials.gold_clean = {}
	self.materials.gold_clean.name_id = "bm_mtl_gold_clean"
	self.materials.gold_clean.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.gold_clean.texture = "units/payday2/matcaps/matcap_gold_clean_df"
	self.materials.gold_clean.infamous = true
	self.materials.gold_clean.value = 10
	self.materials.concrete1 = {}
	self.materials.concrete1.name_id = "bm_mtl_concrete1"
	self.materials.concrete1.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.concrete1.texture = "units/payday2/matcaps/matcap_concrete1_df"
	self.materials.concrete1.material_amount = 0
	self.materials.concrete1.value = 2
	self.materials.rock1 = {}
	self.materials.rock1.name_id = "bm_mtl_rock1"
	self.materials.rock1.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.rock1.texture = "units/payday2/matcaps/matcap_rock1_df"
	self.materials.rock1.material_amount = 0
	self.materials.rock1.value = 3
	self.materials.rock2 = {}
	self.materials.rock2.name_id = "bm_mtl_rock2"
	self.materials.rock2.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.rock2.texture = "units/payday2/matcaps/matcap_rock2_df"
	self.materials.rock2.material_amount = 0
	self.materials.rock2.value = 2
	self.materials.rock3 = {}
	self.materials.rock3.name_id = "bm_mtl_rock3"
	self.materials.rock3.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.rock3.texture = "units/payday2/matcaps/matcap_rock3_df"
	self.materials.rock3.material_amount = 0
	self.materials.rock3.value = 2
	self.materials.whiterock = {}
	self.materials.whiterock.name_id = "bm_mtl_whiterock"
	self.materials.whiterock.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.whiterock.texture = "units/payday2/matcaps/matcap_whiterock_df"
	self.materials.whiterock.material_amount = 0
	self.materials.whiterock.value = 3
	self.materials.metal1 = {}
	self.materials.metal1.name_id = "bm_mtl_metal1"
	self.materials.metal1.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.metal1.texture = "units/payday2/matcaps/matcap_metal1_df"
	self.materials.metal1.material_amount = 0
	self.materials.metal1.value = 6
	self.materials.cracks1 = {}
	self.materials.cracks1.name_id = "bm_mtl_cracks1"
	self.materials.cracks1.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.cracks1.texture = "units/payday2/matcaps/matcap_cracks1_df"
	self.materials.cracks1.material_amount = 0
	self.materials.cracks1.value = 2
	self.materials.wicker1 = {}
	self.materials.wicker1.name_id = "bm_mtl_wicker1"
	self.materials.wicker1.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.wicker1.texture = "units/payday2/matcaps/matcap_wicker1_df"
	self.materials.wicker1.material_amount = 0
	self.materials.wicker1.value = 3
	self.materials.scales = {}
	self.materials.scales.name_id = "bm_mtl_scales"
	self.materials.scales.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.scales.texture = "units/payday2/matcaps/matcap_scales_df"
	self.materials.scales.infamous = true
	self.materials.scales.material_amount = 0
	self.materials.scales.value = 7
	self.materials.oldbronze = {}
	self.materials.oldbronze.name_id = "bm_mtl_oldbronze"
	self.materials.oldbronze.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.oldbronze.texture = "units/payday2/matcaps/matcap_oldbronze_df"
	self.materials.oldbronze.material_amount = 0
	self.materials.oldbronze.infamous = true
	self.materials.oldbronze.value = 8
	self.materials.bark1 = {}
	self.materials.bark1.name_id = "bm_mtl_bark1"
	self.materials.bark1.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.bark1.texture = "units/payday2/matcaps/matcap_bark1_df"
	self.materials.bark1.material_amount = 0
	self.materials.bark1.value = 4
	self.materials.bark2 = {}
	self.materials.bark2.name_id = "bm_mtl_bark2"
	self.materials.bark2.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.bark2.texture = "units/payday2/matcaps/matcap_bark2_df"
	self.materials.bark2.material_amount = 0
	self.materials.bark2.value = 3
	self.materials.bark3 = {}
	self.materials.bark3.name_id = "bm_mtl_bark3"
	self.materials.bark3.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.bark3.texture = "units/payday2/matcaps/matcap_bark3_df"
	self.materials.bark3.material_amount = 0
	self.materials.bark3.value = 2
	self.materials.carbon = {}
	self.materials.carbon.name_id = "bm_mtl_carbon"
	self.materials.carbon.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.carbon.texture = "units/payday2/matcaps/matcap_carbon_df"
	self.materials.carbon.material_amount = 0
	self.materials.carbon.value = 6
	self.materials.leather = {}
	self.materials.leather.name_id = "bm_mtl_leather1"
	self.materials.leather.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.leather.texture = "units/payday2/matcaps/matcap_leather1_df"
	self.materials.leather.material_amount = 0
	self.materials.leather.value = 6
	self.materials.bloodred = {}
	self.materials.bloodred.name_id = "bm_mtl_bloodred"
	self.materials.bloodred.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.bloodred.texture = "units/payday2/matcaps/matcap_bloodred_df"
	self.materials.bloodred.value = 8
	self.materials.waterblue = {}
	self.materials.waterblue.name_id = "bm_mtl_waterblue"
	self.materials.waterblue.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.waterblue.texture = "units/payday2/matcaps/matcap_waterblue_df"
	self.materials.waterblue.value = 4
	self.materials.matteblack = {}
	self.materials.matteblack.name_id = "bm_mtl_matteblack"
	self.materials.matteblack.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.matteblack.texture = "units/payday2/matcaps/matcap_matteblack_df"
	self.materials.matteblack.value = 9
	self.materials.pianoblack = {}
	self.materials.pianoblack.name_id = "bm_mtl_pianoblack"
	self.materials.pianoblack.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.pianoblack.texture = "units/payday2/matcaps/matcap_pianoblack_df"
	self.materials.pianoblack.infamous = true
	self.materials.pianoblack.value = 10
	self.materials.twoblue = {}
	self.materials.twoblue.name_id = "bm_mtl_twoblue"
	self.materials.twoblue.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.twoblue.texture = "units/payday2/matcaps/matcap_twoblue_df"
	self.materials.twoblue.value = 6
	self.materials.rainbow = {}
	self.materials.rainbow.name_id = "bm_mtl_rainbow"
	self.materials.rainbow.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.rainbow.texture = "units/payday2/matcaps/matcap_rainbow_df"
	self.materials.rainbow.infamous = true
	self.materials.rainbow.value = 3
	self.materials.magma = {}
	self.materials.magma.name_id = "bm_mtl_magma"
	self.materials.magma.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.magma.texture = "units/payday2/matcaps/matcap_magma_df"
	self.materials.magma.value = 6
	self.materials.radioactive = {}
	self.materials.radioactive.name_id = "bm_mtl_radioactive"
	self.materials.radioactive.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.radioactive.texture = "units/payday2/matcaps/matcap_radioactive_df"
	self.materials.radioactive.infamous = true
	self.materials.radioactive.value = 7
	self.materials.bismuth = {}
	self.materials.bismuth.name_id = "bm_mtl_bismuth"
	self.materials.bismuth.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.bismuth.texture = "units/payday2/matcaps/matcap_bismuth_df"
	self.materials.bismuth.value = 3
	self.materials.greygloss = {}
	self.materials.greygloss.name_id = "bm_mtl_greygloss"
	self.materials.greygloss.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.greygloss.texture = "units/payday2/matcaps/matcap_greygloss_df"
	self.materials.greygloss.value = 5
	self.materials.finewood = {}
	self.materials.finewood.name_id = "bm_mtl_finewood"
	self.materials.finewood.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.finewood.texture = "units/payday2/matcaps/matcap_finewood_df"
	self.materials.finewood.material_amount = 0
	self.materials.finewood.value = 8
	self.materials.skin = {}
	self.materials.skin.name_id = "bm_mtl_skin"
	self.materials.skin.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.skin.texture = "units/payday2/matcaps/matcap_skin_df"
	self.materials.skin.material_amount = 0
	self.materials.skin.value = 6
	self.materials.alligator = {}
	self.materials.alligator.name_id = "bm_mtl_alligator"
	self.materials.alligator.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.alligator.texture = "units/payday2/matcaps/matcap_alligator_df"
	self.materials.alligator.material_amount = 0
	self.materials.alligator.value = 6
	self.materials.denim = {}
	self.materials.denim.name_id = "bm_mtl_denim"
	self.materials.denim.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.denim.texture = "units/payday2/matcaps/matcap_denim_df"
	self.materials.denim.material_amount = 0
	self.materials.denim.value = 2
	self.materials.candy = {}
	self.materials.candy.name_id = "bm_mtl_candy"
	self.materials.candy.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.candy.texture = "units/payday2/matcaps/matcap_candy_df"
	self.materials.candy.value = 5
	self.materials.chrome_purple = {}
	self.materials.chrome_purple.name_id = "bm_mtl_chrome_purple"
	self.materials.chrome_purple.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.chrome_purple.texture = "units/payday2/matcaps/matcap_chrome_purple_df"
	self.materials.chrome_purple.value = 5
	self.materials.hot_cold = {}
	self.materials.hot_cold.name_id = "bm_mtl_hot_cold"
	self.materials.hot_cold.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.hot_cold.texture = "units/payday2/matcaps/matcap_hot_cold_df"
	self.materials.hot_cold.value = 5
	self.materials.orchish = {}
	self.materials.orchish.name_id = "bm_mtl_orchish"
	self.materials.orchish.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.orchish.texture = "units/payday2/matcaps/matcap_orcish_df"
	self.materials.orchish.value = 5
	self.materials.cash = {}
	self.materials.cash.name_id = "bm_mtl_cash"
	self.materials.cash.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.cash.texture = "units/pd2_dlc1/matcaps/matcap_cash_df"
	self.materials.cash.material_amount = 0
	self.materials.cash.value = 5
	self.materials.cash.dlc = "armored_transport"
	self.materials.jade = {}
	self.materials.jade.name_id = "bm_mtl_jade"
	self.materials.jade.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.jade.texture = "units/pd2_dlc1/matcaps/matcap_jade_df"
	self.materials.jade.value = 5
	self.materials.jade.dlc = "armored_transport"
	self.materials.redwhiteblue = {}
	self.materials.redwhiteblue.name_id = "bm_mtl_redwhiteblue"
	self.materials.redwhiteblue.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.redwhiteblue.texture = "units/pd2_dlc1/matcaps/matcap_redwhiteblue_df"
	self.materials.redwhiteblue.value = 5
	self.materials.redwhiteblue.dlc = "armored_transport"
	self.materials.marble = {}
	self.materials.marble.name_id = "bm_mtl_marble"
	self.materials.marble.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.marble.texture = "units/pd2_dlc1/matcaps/matcap_marble_df"
	self.materials.marble.value = 5
	self.materials.marble.dlc = "armored_transport"
	self.materials.fur = {}
	self.materials.fur.name_id = "bm_mtl_fur"
	self.materials.fur.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.fur.texture = "units/pd2_dlc_dec5/matcaps/matcap_fur_df"
	self.materials.fur.material_amount = 0
	self.materials.fur.value = 5
	self.materials.fur.dlc = "gage_pack"
	self.materials.galvanized = {}
	self.materials.galvanized.name_id = "bm_mtl_galvanized"
	self.materials.galvanized.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.galvanized.texture = "units/pd2_dlc_dec5/matcaps/matcap_galvanized_df"
	self.materials.galvanized.material_amount = 0
	self.materials.galvanized.value = 5
	self.materials.galvanized.dlc = "gage_pack"
	self.materials.heavymetal = {}
	self.materials.heavymetal.name_id = "bm_mtl_heavymetal"
	self.materials.heavymetal.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.heavymetal.texture = "units/pd2_dlc_dec5/matcaps/matcap_heavymetal_df"
	self.materials.heavymetal.material_amount = 0
	self.materials.heavymetal.value = 5
	self.materials.heavymetal.dlc = "gage_pack"
	self.materials.oilmetal = {}
	self.materials.oilmetal.name_id = "bm_mtl_oilmetal"
	self.materials.oilmetal.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.oilmetal.texture = "units/pd2_dlc_dec5/matcaps/matcap_oilmetal_df"
	self.materials.oilmetal.value = 5
	self.materials.oilmetal.dlc = "gage_pack"
	self.materials.gunmetal = {}
	self.materials.gunmetal.name_id = "bm_mtl_gunmetal"
	self.materials.gunmetal.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.gunmetal.texture = "units/pd2_dlc_gage_lmg/matcaps/matcap_gunmetal_df"
	self.materials.gunmetal.value = 5
	self.materials.gunmetal.dlc = "gage_pack_lmg"
	self.materials.mud = {}
	self.materials.mud.name_id = "bm_mtl_mud"
	self.materials.mud.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.mud.texture = "units/pd2_dlc_gage_lmg/matcaps/matcap_mud_df"
	self.materials.mud.material_amount = 0
	self.materials.mud.value = 5
	self.materials.mud.dlc = "gage_pack_lmg"
	self.materials.splinter = {}
	self.materials.splinter.name_id = "bm_mtl_splinter"
	self.materials.splinter.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.splinter.texture = "units/pd2_dlc_gage_lmg/matcaps/matcap_splinter_df"
	self.materials.splinter.material_amount = 0
	self.materials.splinter.value = 5
	self.materials.splinter.dlc = "gage_pack_lmg"
	self.materials.erdl = {}
	self.materials.erdl.name_id = "bm_mtl_erdl"
	self.materials.erdl.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.erdl.texture = "units/pd2_dlc_gage_lmg/matcaps/matcap_erdl_df"
	self.materials.erdl.material_amount = 0
	self.materials.erdl.value = 5
	self.materials.erdl.dlc = "gage_pack_lmg"
	self.materials.copper = {}
	self.materials.copper.name_id = "bm_mtl_copper"
	self.materials.copper.pcs = {}
	self.materials.copper.texture = "units/pd2_dlc_infamy/matcaps/matcap_copper_df"
	self.materials.copper.material_amount = 0
	self.materials.copper.value = 0
	self.materials.copper.global_value = "infamy"
	self.materials.copper.infamy_lock = "infamy_enforcer"
	self.materials.dark_leather = {}
	self.materials.dark_leather.name_id = "bm_mtl_dark_leather"
	self.materials.dark_leather.pcs = {}
	self.materials.dark_leather.texture = "units/pd2_dlc_infamy/matcaps/matcap_dark_leather_df"
	self.materials.dark_leather.material_amount = 0
	self.materials.dark_leather.value = 0
	self.materials.dark_leather.global_value = "infamy"
	self.materials.dark_leather.infamy_lock = "infamy_mastermind"
	self.materials.sinister = {}
	self.materials.sinister.name_id = "bm_mtl_sinister"
	self.materials.sinister.pcs = {}
	self.materials.sinister.texture = "units/pd2_dlc_infamy/matcaps/matcap_sinister_df"
	self.materials.sinister.value = 0
	self.materials.sinister.global_value = "infamy"
	self.materials.sinister.infamy_lock = "infamy_ghost"
	self.materials.electric = {}
	self.materials.electric.name_id = "bm_mtl_electric"
	self.materials.electric.pcs = {}
	self.materials.electric.texture = "units/pd2_dlc_infamy/matcaps/matcap_electric_df"
	self.materials.electric.value = 0
	self.materials.electric.global_value = "infamy"
	self.materials.electric.infamy_lock = "infamy_technician"
	self.materials.bugshell = {}
	self.materials.bugshell.name_id = "bm_mtl_bugshell"
	self.materials.bugshell.pcs = {}
	self.materials.bugshell.texture = "units/pd2_dlc_gage_snp/materials/matcap_bugshell_df"
	self.materials.bugshell.material_amount = 0
	self.materials.bugshell.value = 0
	self.materials.bugshell.dlc = "gage_pack_snp"
	self.materials.carapace = {}
	self.materials.carapace.name_id = "bm_mtl_carapace"
	self.materials.carapace.pcs = {}
	self.materials.carapace.texture = "units/pd2_dlc_gage_snp/materials/matcap_carapace_df"
	self.materials.carapace.value = 0
	self.materials.carapace.dlc = "gage_pack_snp"
	self.materials.hardshell = {}
	self.materials.hardshell.name_id = "bm_mtl_hardshell"
	self.materials.hardshell.pcs = {}
	self.materials.hardshell.texture = "units/pd2_dlc_gage_snp/materials/matcap_hardshell_df"
	self.materials.hardshell.material_amount = 0
	self.materials.hardshell.value = 0
	self.materials.hardshell.dlc = "gage_pack_snp"
	self.materials.insectoid = {}
	self.materials.insectoid.name_id = "bm_mtl_insectoid"
	self.materials.insectoid.pcs = {}
	self.materials.insectoid.texture = "units/pd2_dlc_gage_snp/materials/matcap_insectoid_df"
	self.materials.insectoid.value = 0
	self.materials.insectoid.dlc = "gage_pack_snp"
	self.materials.blackmetal = {}
	self.materials.blackmetal.name_id = "bm_mtl_blackmetal"
	self.materials.blackmetal.pcs = {}
	self.materials.blackmetal.texture = "units/pd2_poetry_winners/materials/matcap_blackmetal_df"
	self.materials.blackmetal.material_amount = 0
	self.materials.blackmetal.value = 0
	self.materials.blackmetal.dlc = "poetry_soundtrack"
	self.materials.blackmetal.global_value = "poetry_soundtrack"
	self.materials.carbongrid = {}
	self.materials.carbongrid.name_id = "bm_mtl_carbongrid"
	self.materials.carbongrid.pcs = {}
	self.materials.carbongrid.texture = "units/pd2_poetry_winners/materials/matcap_carbongrid_df"
	self.materials.carbongrid.material_amount = 0
	self.materials.carbongrid.value = 0
	self.materials.carbongrid.dlc = "poetry_soundtrack"
	self.materials.carbongrid.global_value = "poetry_soundtrack"
	self.materials.cosmoline = {}
	self.materials.cosmoline.name_id = "bm_mtl_cosmoline"
	self.materials.cosmoline.pcs = {}
	self.materials.cosmoline.texture = "units/pd2_poetry_winners/materials/matcap_cosmoline_df"
	self.materials.cosmoline.value = 0
	self.materials.cosmoline.dlc = "poetry_soundtrack"
	self.materials.cosmoline.global_value = "poetry_soundtrack"
	self.materials.electronic = {}
	self.materials.electronic.name_id = "bm_mtl_electronic"
	self.materials.electronic.pcs = {}
	self.materials.electronic.texture = "units/pd2_poetry_winners/materials/matcap_electronic_df"
	self.materials.electronic.material_amount = 0
	self.materials.electronic.value = 0
	self.materials.electronic.dlc = "poetry_soundtrack"
	self.materials.electronic.global_value = "poetry_soundtrack"
	self.materials.gemstone = {}
	self.materials.gemstone.name_id = "bm_mtl_gemstone"
	self.materials.gemstone.pcs = {}
	self.materials.gemstone.texture = "units/pd2_dlc_big/matcaps/matcap_gemstone_df"
	self.materials.gemstone.value = 0
	self.materials.gemstone.dlc = "big_bank"
	self.materials.old = {}
	self.materials.old.name_id = "bm_mtl_old"
	self.materials.old.pcs = {}
	self.materials.old.texture = "units/pd2_dlc_big/matcaps/matcap_old_df"
	self.materials.old.value = 0
	self.materials.old.dlc = "big_bank"
	self.materials.clay = {}
	self.materials.clay.name_id = "bm_mtl_clay"
	self.materials.clay.pcs = {}
	self.materials.clay.texture = "units/pd2_dlc_big/matcaps/matcap_clay_df"
	self.materials.clay.material_amount = 0
	self.materials.clay.value = 0
	self.materials.clay.dlc = "big_bank"
	self.materials.parchment = {}
	self.materials.parchment.name_id = "bm_mtl_parchment"
	self.materials.parchment.pcs = {}
	self.materials.parchment.texture = "units/pd2_dlc_big/matcaps/matcap_parchment_df"
	self.materials.parchment.material_amount = 0
	self.materials.parchment.value = 0
	self.materials.parchment.dlc = "big_bank"
	self.materials.sparks = {}
	self.materials.sparks.name_id = "bm_mtl_sparks"
	self.materials.sparks.pcs = {}
	self.materials.sparks.texture = "units/pd2_dlc_gage_shot/matcaps/matcap_sparks_df"
	self.materials.sparks.value = 0
	self.materials.sparks.dlc = "gage_pack_shotgun"
	self.materials.explosive = {}
	self.materials.explosive.name_id = "bm_mtl_explosive"
	self.materials.explosive.pcs = {}
	self.materials.explosive.texture = "units/pd2_dlc_gage_shot/matcaps/matcap_explosive_df"
	self.materials.explosive.value = 0
	self.materials.explosive.dlc = "gage_pack_shotgun"
	self.materials.bananapeel = {}
	self.materials.bananapeel.name_id = "bm_mtl_bananapeel"
	self.materials.bananapeel.pcs = {}
	self.materials.bananapeel.texture = "units/pd2_dlc_gage_shot/matcaps/matcap_bananapeel_df"
	self.materials.bananapeel.material_amount = 0
	self.materials.bananapeel.value = 0
	self.materials.bananapeel.dlc = "gage_pack_shotgun"
	self.materials.leaf = {}
	self.materials.leaf.name_id = "bm_mtl_leaf"
	self.materials.leaf.pcs = {}
	self.materials.leaf.texture = "units/pd2_dlc_gage_shot/matcaps/matcap_leaf_df"
	self.materials.leaf.material_amount = 0
	self.materials.leaf.value = 0
	self.materials.leaf.dlc = "gage_pack_shotgun"
	self.materials.bone = {}
	self.materials.bone.name_id = "bm_mtl_bone"
	self.materials.bone.pcs = {}
	self.materials.bone.texture = "units/pd2_dlc_gage_assault/materials/matcap_bone_df"
	self.materials.bone.material_amount = 0
	self.materials.bone.value = 0
	self.materials.bone.dlc = "gage_pack_assault"
	self.materials.frost = {}
	self.materials.frost.name_id = "bm_mtl_frost"
	self.materials.frost.pcs = {}
	self.materials.frost.texture = "units/pd2_dlc_gage_assault/materials/matcap_frost_df"
	self.materials.frost.material_amount = 0
	self.materials.frost.value = 0
	self.materials.frost.dlc = "gage_pack_assault"
	self.materials.evil = {}
	self.materials.evil.name_id = "bm_mtl_evil"
	self.materials.evil.pcs = {}
	self.materials.evil.texture = "units/pd2_dlc_gage_assault/materials/matcap_evil_df"
	self.materials.evil.value = 0
	self.materials.evil.dlc = "gage_pack_assault"
	self.materials.void = {}
	self.materials.void.name_id = "bm_mtl_void"
	self.materials.void.pcs = {}
	self.materials.void.texture = "units/pd2_dlc_gage_assault/materials/matcap_void_df"
	self.materials.void.value = 0
	self.materials.void.dlc = "gage_pack_assault"
	self.materials.sunset = {}
	self.materials.sunset.name_id = "bm_mtl_sunset"
	self.materials.sunset.pcs = {}
	self.materials.sunset.texture = "units/pd2_dlc_miami/matcaps/matcap_sunset_df"
	self.materials.sunset.value = 0
	self.materials.sunset.dlc = "hl_miami"
	self.materials.chromescape = {}
	self.materials.chromescape.name_id = "bm_mtl_chromescape"
	self.materials.chromescape.pcs = {}
	self.materials.chromescape.texture = "units/pd2_dlc_miami/matcaps/matcap_chromescape_df"
	self.materials.chromescape.value = 0
	self.materials.chromescape.dlc = "hl_miami"
	self.materials.rubber = {}
	self.materials.rubber.name_id = "bm_mtl_rubber"
	self.materials.rubber.pcs = {}
	self.materials.rubber.texture = "units/pd2_dlc_miami/matcaps/matcap_rubber_df"
	self.materials.rubber.value = 0
	self.materials.rubber.dlc = "hl_miami"
	self.materials.error = {}
	self.materials.error.name_id = "bm_mtl_error"
	self.materials.error.pcs = {}
	self.materials.error.texture = "units/pd2_dlc_miami/matcaps/matcap_error_df"
	self.materials.error.material_amount = 0
	self.materials.error.value = 0
	self.materials.error.dlc = "hl_miami"
	self.materials.rug = {}
	self.materials.rug.name_id = "bm_mtl_rug"
	self.materials.rug.pcs = {}
	self.materials.rug.texture = "units/pd2_dlc_miami/matcaps/matcap_rug_df"
	self.materials.rug.material_amount = 0
	self.materials.rug.value = 0
	self.materials.rug.dlc = "hlm_game"
	self.materials.cushion = {}
	self.materials.cushion.name_id = "bm_mtl_cushion"
	self.materials.cushion.pcs = {}
	self.materials.cushion.texture = "units/pd2_dlc_miami/matcaps/matcap_cushion_df"
	self.materials.cushion.material_amount = 0
	self.materials.cushion.value = 0
	self.materials.cushion.dlc = "hlm_game"
	self.materials.hatred = {}
	self.materials.hatred.name_id = "bm_mtl_hatred"
	self.materials.hatred.pcs = {}
	self.materials.hatred.texture = "units/pd2_dlc_miami/matcaps/matcap_hatred_df"
	self.materials.hatred.value = 0
	self.materials.hatred.dlc = "hlm_game"
	self.materials.neon = {}
	self.materials.neon.name_id = "bm_mtl_neon"
	self.materials.neon.pcs = {}
	self.materials.neon.texture = "units/pd2_dlc_miami/matcaps/matcap_neon_df"
	self.materials.neon.value = 0
	self.materials.neon.dlc = "hlm_game"
end

function BlackMarketTweakData_37:_init_textures()
	self.textures = {}
	self.textures.no_color_no_material = {}
	self.textures.no_color_no_material.name_id = "bm_txt_no_color_no_material"
	self.textures.no_color_no_material.texture = "units/payday2/masks/shared_textures/patterns/pattern_no_color_no_material_df"
	self.textures.no_color_no_material.value = 0
	self.textures.no_color_full_material = {}
	self.textures.no_color_full_material.name_id = "bm_txt_no_color_full_material"
	self.textures.no_color_full_material.texture = "units/payday2/masks/shared_textures/patterns/pattern_no_color_full_material_df"
	self.textures.no_color_full_material.value = 1
	self.textures.big_skull = {}
	self.textures.big_skull.name_id = "bm_txt_big_skull"
	self.textures.big_skull.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.big_skull.texture = "units/payday2/masks/shared_textures/patterns/pattern_big_skull_df"
	self.textures.big_skull.value = 4
	self.textures.eightball = {}
	self.textures.eightball.name_id = "bm_txt_eightball"
	self.textures.eightball.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.eightball.texture = "units/payday2/masks/shared_textures/patterns/pattern_eightball_df"
	self.textures.eightball.value = 8
	self.textures.zebra = {}
	self.textures.zebra.name_id = "bm_txt_zebra"
	self.textures.zebra.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.zebra.texture = "units/payday2/masks/shared_textures/patterns/pattern_zebra_df"
	self.textures.zebra.value = 3
	self.textures.overkill = {}
	self.textures.overkill.name_id = "bm_txt_overkill"
	self.textures.overkill.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.overkill.texture = "units/payday2/masks/shared_textures/patterns/pattern_overkill_df"
	self.textures.overkill.infamous = true
	self.textures.overkill.value = 10
	self.textures.spawn = {}
	self.textures.spawn.name_id = "bm_txt_spawn"
	self.textures.spawn.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.spawn.texture = "units/payday2/masks/shared_textures/patterns/pattern_spawn_df"
	self.textures.spawn.infamous = true
	self.textures.spawn.value = 4
	self.textures.marv = {}
	self.textures.marv.name_id = "bm_txt_marv"
	self.textures.marv.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.marv.texture = "units/payday2/masks/shared_textures/patterns/pattern_marv_df"
	self.textures.marv.value = 5
	self.textures.starbreeze = {}
	self.textures.starbreeze.name_id = "bm_txt_starbreeze"
	self.textures.starbreeze.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.starbreeze.texture = "units/payday2/masks/shared_textures/patterns/pattern_starbreeze_df"
	self.textures.starbreeze.value = 3
	self.textures.cobrakai = {}
	self.textures.cobrakai.name_id = "bm_txt_cobrakai"
	self.textures.cobrakai.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.cobrakai.texture = "units/payday2/masks/shared_textures/patterns/pattern_cobrakai_df"
	self.textures.cobrakai.infamous = true
	self.textures.cobrakai.value = 4
	self.textures.flames = {}
	self.textures.flames.name_id = "bm_txt_flames"
	self.textures.flames.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.flames.texture = "units/payday2/masks/shared_textures/patterns/pattern_flames_df"
	self.textures.flames.value = 6
	self.textures.tribal = {}
	self.textures.tribal.name_id = "bm_txt_tribal"
	self.textures.tribal.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.tribal.texture = "units/payday2/masks/shared_textures/patterns/pattern_tribal_df"
	self.textures.tribal.value = 7
	self.textures.skull = {}
	self.textures.skull.name_id = "bm_txt_skull"
	self.textures.skull.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.skull.texture = "units/payday2/masks/shared_textures/patterns/pattern_skull_df"
	self.textures.skull.value = 8
	self.textures.arrow = {}
	self.textures.arrow.name_id = "bm_txt_arrow"
	self.textures.arrow.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.arrow.texture = "units/payday2/masks/shared_textures/patterns/pattern_arrow_df"
	self.textures.arrow.value = 3
	self.textures.usa = {}
	self.textures.usa.name_id = "bm_txt_usa"
	self.textures.usa.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.usa.texture = "units/payday2/masks/shared_textures/patterns/pattern_usa_df"
	self.textures.usa.value = 5
	self.textures.unionjack = {}
	self.textures.unionjack.name_id = "bm_txt_unionjack"
	self.textures.unionjack.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.unionjack.texture = "units/payday2/masks/shared_textures/patterns/pattern_unionjack_df"
	self.textures.unionjack.value = 6
	self.textures.fleur = {}
	self.textures.fleur.name_id = "bm_txt_fleur"
	self.textures.fleur.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.fleur.texture = "units/payday2/masks/shared_textures/patterns/pattern_fleur_df"
	self.textures.fleur.value = 7
	self.textures.hearts = {}
	self.textures.hearts.name_id = "bm_txt_hearts"
	self.textures.hearts.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.hearts.texture = "units/payday2/masks/shared_textures/patterns/pattern_hearts_df"
	self.textures.hearts.value = 4
	self.textures.electric = {}
	self.textures.electric.name_id = "bm_txt_electric"
	self.textures.electric.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.electric.texture = "units/payday2/masks/shared_textures/patterns/pattern_electric_df"
	self.textures.electric.value = 3
	self.textures.electric.infamous = true
	self.textures.puzzle = {}
	self.textures.puzzle.name_id = "bm_txt_puzzle"
	self.textures.puzzle.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.puzzle.texture = "units/payday2/masks/shared_textures/patterns/pattern_puzzle_df"
	self.textures.puzzle.value = 5
	self.textures.swe_camo = {}
	self.textures.swe_camo.name_id = "bm_txt_swe_camo"
	self.textures.swe_camo.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.swe_camo.texture = "units/payday2/masks/shared_textures/patterns/pattern_swe_camo_df"
	self.textures.swe_camo.value = 6
	self.textures.japan = {}
	self.textures.japan.name_id = "bm_txt_japan"
	self.textures.japan.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.japan.texture = "units/payday2/masks/shared_textures/patterns/pattern_japan_df"
	self.textures.japan.value = 7
	self.textures.celtic1 = {}
	self.textures.celtic1.name_id = "bm_txt_celtic1"
	self.textures.celtic1.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.celtic1.texture = "units/payday2/masks/shared_textures/patterns/pattern_celtic1_df"
	self.textures.celtic1.value = 3
	self.textures.dragon_full = {}
	self.textures.dragon_full.name_id = "bm_txt_dragon_full"
	self.textures.dragon_full.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.dragon_full.texture = "units/payday2/masks/shared_textures/patterns/pattern_dragon_full_df"
	self.textures.dragon_full.infamous = true
	self.textures.dragon_full.value = 9
	self.textures.dragon_split = {}
	self.textures.dragon_split.name_id = "bm_txt_dragon_split"
	self.textures.dragon_split.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.dragon_split.texture = "units/payday2/masks/shared_textures/patterns/pattern_dragon_split_df"
	self.textures.dragon_split.value = 5
	self.textures.horizon_circle = {}
	self.textures.horizon_circle.name_id = "bm_txt_horizon_circle"
	self.textures.horizon_circle.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.horizon_circle.texture = "units/payday2/masks/shared_textures/patterns/pattern_horizon_circle_df"
	self.textures.horizon_circle.value = 4
	self.textures.tribal2 = {}
	self.textures.tribal2.name_id = "bm_txt_tribal2"
	self.textures.tribal2.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.tribal2.texture = "units/payday2/masks/shared_textures/patterns/pattern_tribal2_df"
	self.textures.tribal2.value = 8
	self.textures.vertical = {}
	self.textures.vertical.name_id = "bm_txt_vertical"
	self.textures.vertical.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.vertical.texture = "units/payday2/masks/shared_textures/patterns/pattern_vertical_df"
	self.textures.vertical.value = 4
	self.textures.celtic2 = {}
	self.textures.celtic2.name_id = "bm_txt_celtic2"
	self.textures.celtic2.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.celtic2.texture = "units/payday2/masks/shared_textures/patterns/pattern_celtic2_df"
	self.textures.celtic2.value = 2
	self.textures.beast = {}
	self.textures.beast.name_id = "bm_txt_beast"
	self.textures.beast.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.beast.texture = "units/payday2/masks/shared_textures/patterns/pattern_beast_df"
	self.textures.beast.value = 3
	self.textures.headshot = {}
	self.textures.headshot.name_id = "bm_txt_headshot"
	self.textures.headshot.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.headshot.texture = "units/payday2/masks/shared_textures/patterns/pattern_headshot_df"
	self.textures.headshot.value = 5
	self.textures.circuit = {}
	self.textures.circuit.name_id = "bm_txt_circuit"
	self.textures.circuit.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.circuit.texture = "units/payday2/masks/shared_textures/patterns/pattern_circuit_df"
	self.textures.circuit.value = 3
	self.textures.paint1 = {}
	self.textures.paint1.name_id = "bm_txt_paint1"
	self.textures.paint1.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.paint1.texture = "units/payday2/masks/shared_textures/patterns/pattern_paint1_df"
	self.textures.paint1.value = 2
	self.textures.chains = {}
	self.textures.chains.name_id = "bm_txt_chains"
	self.textures.chains.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.chains.texture = "units/payday2/masks/shared_textures/patterns/pattern_chains_df"
	self.textures.chains.value = 4
	self.textures.yinyang = {}
	self.textures.yinyang.name_id = "bm_txt_yinyang"
	self.textures.yinyang.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.yinyang.texture = "units/payday2/masks/shared_textures/patterns/pattern_yinyang_df"
	self.textures.yinyang.value = 6
	self.textures.rorschach = {}
	self.textures.rorschach.name_id = "bm_txt_rorschach"
	self.textures.rorschach.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.rorschach.texture = "units/payday2/masks/shared_textures/patterns/pattern_rorschach_df"
	self.textures.rorschach.infamous = true
	self.textures.rorschach.value = 6
	self.textures.zipper = {}
	self.textures.zipper.name_id = "bm_txt_zipper"
	self.textures.zipper.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.zipper.texture = "units/payday2/masks/shared_textures/patterns/pattern_zipper_df"
	self.textures.zipper.value = 2
	self.textures.daniel = {}
	self.textures.daniel.name_id = "bm_txt_daniel"
	self.textures.daniel.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.daniel.texture = "units/payday2/masks/shared_textures/patterns/pattern_daniel_df"
	self.textures.daniel.value = 2
	self.textures.ouroboros = {}
	self.textures.ouroboros.name_id = "bm_txt_ouroboros"
	self.textures.ouroboros.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.ouroboros.texture = "units/payday2/masks/shared_textures/patterns/pattern_ouroboros_df"
	self.textures.ouroboros.value = 7
	self.textures.ouro = {}
	self.textures.ouro.name_id = "bm_txt_ouro"
	self.textures.ouro.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.ouro.texture = "units/payday2/masks/shared_textures/patterns/pattern_ouro_df"
	self.textures.ouro.value = 5
	self.textures.cat = {}
	self.textures.cat.name_id = "bm_txt_cat"
	self.textures.cat.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.cat.texture = "units/payday2/masks/shared_textures/patterns/pattern_cat_df"
	self.textures.cat.infamous = true
	self.textures.cat.value = 6
	self.textures.clown = {}
	self.textures.clown.name_id = "bm_txt_clown"
	self.textures.clown.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.clown.texture = "units/payday2/masks/shared_textures/patterns/pattern_clown_df"
	self.textures.clown.value = 2
	self.textures.paint2 = {}
	self.textures.paint2.name_id = "bm_txt_ouroboros"
	self.textures.paint2.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.paint2.texture = "units/payday2/masks/shared_textures/patterns/pattern_paint2_df"
	self.textures.paint2.value = 2
	self.textures.spider = {}
	self.textures.spider.name_id = "bm_txt_spider"
	self.textures.spider.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.spider.texture = "units/payday2/masks/shared_textures/patterns/pattern_spider_df"
	self.textures.spider.value = 7
	self.textures.target = {}
	self.textures.target.name_id = "bm_txt_target"
	self.textures.target.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.target.texture = "units/payday2/masks/shared_textures/patterns/pattern_target_df"
	self.textures.target.value = 5
	self.textures.illuminati = {}
	self.textures.illuminati.name_id = "bm_txt_illuminati"
	self.textures.illuminati.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.illuminati.texture = "units/payday2/masks/shared_textures/patterns/pattern_illuminati_df"
	self.textures.illuminati.value = 7
	self.textures.hypnotic = {}
	self.textures.hypnotic.name_id = "bm_txt_hypnotic"
	self.textures.hypnotic.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.hypnotic.texture = "units/payday2/masks/shared_textures/patterns/pattern_hypnotic_df"
	self.textures.hypnotic.value = 3
	self.textures.hexagon = {}
	self.textures.hexagon.name_id = "bm_txt_hexagon"
	self.textures.hexagon.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.hexagon.texture = "units/payday2/masks/shared_textures/patterns/pattern_hexagon_df"
	self.textures.hexagon.value = 4
	self.textures.messatsu = {}
	self.textures.messatsu.name_id = "bm_txt_messatsu"
	self.textures.messatsu.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.messatsu.texture = "units/payday2/masks/shared_textures/patterns/pattern_messatsu_df"
	self.textures.messatsu.value = 2
	self.textures.shazam = {}
	self.textures.shazam.name_id = "bm_txt_shazam"
	self.textures.shazam.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.shazam.texture = "units/payday2/masks/shared_textures/patterns/pattern_shazam_df"
	self.textures.shazam.value = 2
	self.textures.emblem1 = {}
	self.textures.emblem1.name_id = "bm_txt_emblem1"
	self.textures.emblem1.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.emblem1.texture = "units/payday2/masks/shared_textures/patterns/pattern_emblem1_df"
	self.textures.emblem1.value = 1
	self.textures.emblem2 = {}
	self.textures.emblem2.name_id = "bm_txt_emblem2"
	self.textures.emblem2.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.emblem2.texture = "units/payday2/masks/shared_textures/patterns/pattern_emblem2_df"
	self.textures.emblem2.value = 2
	self.textures.emblem3 = {}
	self.textures.emblem3.name_id = "bm_txt_emblem3"
	self.textures.emblem3.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.emblem3.texture = "units/payday2/masks/shared_textures/patterns/pattern_emblem3_df"
	self.textures.emblem3.value = 3
	self.textures.swirl = {}
	self.textures.swirl.name_id = "bm_txt_swirl"
	self.textures.swirl.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.swirl.texture = "units/payday2/masks/shared_textures/patterns/pattern_swirl_df"
	self.textures.swirl.value = 4
	self.textures.kabuki1 = {}
	self.textures.kabuki1.name_id = "bm_txt_kabuki1"
	self.textures.kabuki1.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.kabuki1.texture = "units/payday2/masks/shared_textures/patterns/pattern_kabuki1_df"
	self.textures.kabuki1.value = 5
	self.textures.ultimaterobber = {}
	self.textures.ultimaterobber.name_id = "bm_txt_ultimaterobber"
	self.textures.ultimaterobber.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.ultimaterobber.texture = "units/payday2/masks/shared_textures/patterns/pattern_ultimaterobber_df"
	self.textures.ultimaterobber.infamous = true
	self.textures.ultimaterobber.value = 6
	self.textures.nuclear = {}
	self.textures.nuclear.name_id = "bm_txt_nuclear"
	self.textures.nuclear.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.nuclear.texture = "units/payday2/masks/shared_textures/patterns/pattern_nuclear_df"
	self.textures.nuclear.value = 7
	self.textures.gearhead = {}
	self.textures.gearhead.name_id = "bm_txt_gearhead"
	self.textures.gearhead.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.gearhead.texture = "units/payday2/masks/shared_textures/patterns/pattern_gearhead_df"
	self.textures.gearhead.value = 6
	self.textures.atom = {}
	self.textures.atom.name_id = "bm_txt_atom"
	self.textures.atom.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.atom.texture = "units/payday2/masks/shared_textures/patterns/pattern_atom_df"
	self.textures.atom.value = 5
	self.textures.hand = {}
	self.textures.hand.name_id = "bm_txt_hand"
	self.textures.hand.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.hand.texture = "units/payday2/masks/shared_textures/patterns/pattern_hand_df"
	self.textures.hand.value = 4
	self.textures.scars = {}
	self.textures.scars.name_id = "bm_txt_scars"
	self.textures.scars.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.scars.texture = "units/payday2/masks/shared_textures/patterns/pattern_scars_df"
	self.textures.scars.value = 3
	self.textures.pirate = {}
	self.textures.pirate.name_id = "bm_txt_pirate"
	self.textures.pirate.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.pirate.texture = "units/payday2/masks/shared_textures/patterns/pattern_pirate_df"
	self.textures.pirate.value = 2
	self.textures.foot = {}
	self.textures.foot.name_id = "bm_txt_foot"
	self.textures.foot.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.foot.texture = "units/payday2/masks/shared_textures/patterns/pattern_foot_df"
	self.textures.foot.value = 7
	self.textures.star = {}
	self.textures.star.name_id = "bm_txt_star"
	self.textures.star.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.star.texture = "units/payday2/masks/shared_textures/patterns/pattern_star_df"
	self.textures.star.value = 8
	self.textures.portal = {}
	self.textures.portal.name_id = "bm_txt_portal"
	self.textures.portal.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.portal.texture = "units/payday2/masks/shared_textures/patterns/pattern_portal_df"
	self.textures.portal.value = 6
	self.textures.aperture = {}
	self.textures.aperture.name_id = "bm_txt_aperture"
	self.textures.aperture.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.aperture.texture = "units/payday2/masks/shared_textures/patterns/pattern_aperture_df"
	self.textures.aperture.value = 5
	self.textures.girlsandboys = {}
	self.textures.girlsandboys.name_id = "bm_txt_girlsandboys"
	self.textures.girlsandboys.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.girlsandboys.texture = "units/payday2/masks/shared_textures/patterns/pattern_girlsandboys_df"
	self.textures.girlsandboys.value = 4
	self.textures.loverboy = {}
	self.textures.loverboy.name_id = "bm_txt_loverboy"
	self.textures.loverboy.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.loverboy.texture = "units/payday2/masks/shared_textures/patterns/pattern_loverboy_df"
	self.textures.loverboy.value = 3
	self.textures.cogs = {}
	self.textures.cogs.name_id = "bm_txt_cogs"
	self.textures.cogs.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.cogs.texture = "units/payday2/masks/shared_textures/patterns/pattern_cogs_df"
	self.textures.cogs.value = 4
	self.textures.ace = {}
	self.textures.ace.name_id = "bm_txt_ace"
	self.textures.ace.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.ace.texture = "units/payday2/masks/shared_textures/patterns/pattern_ace_df"
	self.textures.ace.infamous = true
	self.textures.ace.value = 5
	self.textures.compass = {}
	self.textures.compass.name_id = "bm_txt_compass"
	self.textures.compass.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.compass.texture = "units/payday2/masks/shared_textures/patterns/pattern_compass_df"
	self.textures.compass.value = 2
	self.textures.fan = {}
	self.textures.fan.name_id = "bm_txt_fan"
	self.textures.fan.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.fan.dlc = "preorder"
	self.textures.fan.texture = "units/payday2/masks/shared_textures/patterns/pattern_fan_df"
	self.textures.fan.value = 1
	self.textures.pd2 = {}
	self.textures.pd2.name_id = "bm_txt_pd2"
	self.textures.pd2.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.pd2.texture = "units/payday2/masks/shared_textures/patterns/pattern_pd2_df"
	self.textures.pd2.value = 4
	self.textures.fingerprint = {}
	self.textures.fingerprint.name_id = "bm_txt_fingerprint"
	self.textures.fingerprint.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.fingerprint.texture = "units/payday2/masks/shared_textures/patterns/pattern_fingerprint_df"
	self.textures.fingerprint.infamous = true
	self.textures.fingerprint.value = 3
	self.textures.biohazard = {}
	self.textures.biohazard.name_id = "bm_txt_biohazard"
	self.textures.biohazard.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.biohazard.texture = "units/payday2/masks/shared_textures/patterns/pattern_biohazard_df"
	self.textures.biohazard.value = 2
	self.textures.tf2 = {}
	self.textures.tf2.name_id = "bm_txt_tf2"
	self.textures.tf2.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.tf2.texture = "units/payday2/masks/shared_textures/patterns/pattern_tf2_df"
	self.textures.tf2.value = 3
	self.textures.cake = {}
	self.textures.cake.name_id = "bm_txt_cake"
	self.textures.cake.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.cake.texture = "units/payday2/masks/shared_textures/patterns/pattern_cake_df"
	self.textures.cake.value = 4
	self.textures.companioncube = {}
	self.textures.companioncube.name_id = "bm_txt_companioncube"
	self.textures.companioncube.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.companioncube.texture = "units/payday2/masks/shared_textures/patterns/pattern_companioncube_df"
	self.textures.companioncube.value = 6
	self.textures.two = {}
	self.textures.two.name_id = "bm_txt_two"
	self.textures.two.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.two.texture = "units/payday2/masks/shared_textures/patterns/pattern_two_df"
	self.textures.two.value = 5
	self.textures.striped = {}
	self.textures.striped.name_id = "bm_txt_striped"
	self.textures.striped.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.striped.texture = "units/payday2/masks/shared_textures/patterns/pattern_striped_df"
	self.textures.striped.value = 3
	self.textures.solidfirst = {}
	self.textures.solidfirst.name_id = "bm_txt_solidfirst"
	self.textures.solidfirst.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.solidfirst.texture = "units/payday2/masks/shared_textures/patterns/pattern_solidfirst_df"
	self.textures.solidfirst.infamous = true
	self.textures.solidfirst.value = 6
	self.textures.solidsecond = {}
	self.textures.solidsecond.name_id = "bm_txt_solidsecond"
	self.textures.solidsecond.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.solidsecond.texture = "units/payday2/masks/shared_textures/patterns/pattern_solidsecond_df"
	self.textures.solidsecond.infamous = true
	self.textures.solidsecond.value = 6
	self.textures.mantis = {}
	self.textures.mantis.name_id = "bm_txt_mantis"
	self.textures.mantis.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.mantis.texture = "units/payday2/masks/shared_textures/patterns/pattern_mantis_df"
	self.textures.mantis.value = 7
	self.textures.bite = {}
	self.textures.bite.name_id = "bm_txt_bite"
	self.textures.bite.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.bite.texture = "units/payday2/masks/shared_textures/patterns/pattern_bite_df"
	self.textures.bite.value = 3
	self.textures.wtf = {}
	self.textures.wtf.name_id = "bm_txt_wtf"
	self.textures.wtf.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.wtf.texture = "units/payday2/masks/shared_textures/patterns/pattern_wtf_df"
	self.textures.wtf.value = 4
	self.textures.bloodsucker = {}
	self.textures.bloodsucker.name_id = "bm_txt_bloodsucker"
	self.textures.bloodsucker.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.bloodsucker.texture = "units/payday2/masks/shared_textures/patterns/pattern_bloodsucker_df"
	self.textures.bloodsucker.value = 2
	self.textures.hawk = {}
	self.textures.hawk.name_id = "bm_txt_hawk"
	self.textures.hawk.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.hawk.texture = "units/payday2/masks/shared_textures/patterns/pattern_hawk_df"
	self.textures.hawk.value = 4
	self.textures.magnet = {}
	self.textures.magnet.name_id = "bm_txt_magnet"
	self.textures.magnet.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.magnet.texture = "units/payday2/masks/shared_textures/patterns/pattern_magnet_df"
	self.textures.magnet.value = 2
	self.textures.diamond = {}
	self.textures.diamond.name_id = "bm_txt_diamond"
	self.textures.diamond.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.diamond.texture = "units/payday2/masks/shared_textures/patterns/pattern_diamond_df"
	self.textures.diamond.value = 3
	self.textures.luchador = {}
	self.textures.luchador.name_id = "bm_txt_luchador"
	self.textures.luchador.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.luchador.texture = "units/payday2/masks/shared_textures/patterns/pattern_luchador_df"
	self.textures.luchador.value = 1
	self.textures.maskedfalcon = {}
	self.textures.maskedfalcon.name_id = "bm_txt_maskedfalcon"
	self.textures.maskedfalcon.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.maskedfalcon.texture = "units/payday2/masks/shared_textures/patterns/pattern_maskedfalcon_df"
	self.textures.maskedfalcon.value = 3
	self.textures.grayson = {}
	self.textures.grayson.name_id = "bm_txt_grayson"
	self.textures.grayson.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.grayson.texture = "units/payday2/masks/shared_textures/patterns/pattern_grayson_df"
	self.textures.grayson.value = 2
	self.textures.sidestripe = {}
	self.textures.sidestripe.name_id = "bm_txt_sidestripe"
	self.textures.sidestripe.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.sidestripe.texture = "units/payday2/masks/shared_textures/patterns/pattern_sidestripe_df"
	self.textures.sidestripe.value = 5
	self.textures.gradient = {}
	self.textures.gradient.name_id = "bm_txt_gradient"
	self.textures.gradient.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.gradient.texture = "units/payday2/masks/shared_textures/patterns/pattern_gradient_df"
	self.textures.gradient.value = 4
	self.textures.spikes = {}
	self.textures.spikes.name_id = "bm_txt_spikes"
	self.textures.spikes.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.spikes.texture = "units/payday2/masks/shared_textures/patterns/pattern_spikes_df"
	self.textures.spikes.value = 3
	self.textures.barbarian = {}
	self.textures.barbarian.name_id = "bm_txt_barbarian"
	self.textures.barbarian.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.barbarian.texture = "units/payday2/masks/shared_textures/patterns/pattern_barbarian_df"
	self.textures.barbarian.value = 2
	self.textures.reaper = {}
	self.textures.reaper.name_id = "bm_txt_reaper"
	self.textures.reaper.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.reaper.texture = "units/payday2/masks/shared_textures/patterns/pattern_reaper_df"
	self.textures.reaper.value = 4
	self.textures.whiner = {}
	self.textures.whiner.name_id = "bm_txt_whiner"
	self.textures.whiner.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.whiner.texture = "units/payday2/masks/shared_textures/patterns/pattern_whiner_df"
	self.textures.whiner.value = 3
	self.textures.emblem4 = {}
	self.textures.emblem4.name_id = "bm_txt_emblem4"
	self.textures.emblem4.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.emblem4.texture = "units/payday2/masks/shared_textures/patterns/pattern_emblem4_df"
	self.textures.emblem4.value = 2
	self.textures.daft_heart = {}
	self.textures.daft_heart.name_id = "bm_txt_daft_heart"
	self.textures.daft_heart.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.daft_heart.texture = "units/payday2/masks/shared_textures/patterns/pattern_daft_heart_df"
	self.textures.daft_heart.value = 3
	self.textures.anarchy = {}
	self.textures.anarchy.name_id = "bm_txt_anarchy"
	self.textures.anarchy.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.anarchy.texture = "units/payday2/masks/shared_textures/patterns/pattern_anarchy_df"
	self.textures.anarchy.value = 4
	self.textures.molecule = {}
	self.textures.molecule.name_id = "bm_txt_molecule"
	self.textures.molecule.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.molecule.texture = "units/payday2/masks/shared_textures/patterns/pattern_molecule_df"
	self.textures.molecule.value = 3
	self.textures.fleur2 = {}
	self.textures.fleur2.name_id = "bm_txt_fleur2"
	self.textures.fleur2.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.fleur2.texture = "units/payday2/masks/shared_textures/patterns/pattern_fleur2_df"
	self.textures.fleur2.infamous = true
	self.textures.fleur2.value = 3
	self.textures.trekronor = {}
	self.textures.trekronor.name_id = "bm_txt_trekronor"
	self.textures.trekronor.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.trekronor.texture = "units/payday2/masks/shared_textures/patterns/pattern_trekronor_df"
	self.textures.trekronor.value = 2
	self.textures.raster = {}
	self.textures.raster.name_id = "bm_txt_raster"
	self.textures.raster.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.raster.texture = "units/payday2/masks/shared_textures/patterns/pattern_raster_df"
	self.textures.raster.value = 1
	self.textures.flag = {}
	self.textures.flag.name_id = "bm_txt_flag"
	self.textures.flag.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.flag.texture = "units/payday2/masks/shared_textures/patterns/pattern_flag_df"
	self.textures.flag.value = 4
	self.textures.cracker = {}
	self.textures.cracker.name_id = "bm_txt_cracker"
	self.textures.cracker.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.cracker.texture = "units/payday2/masks/shared_textures/patterns/pattern_cracker_df"
	self.textures.cracker.value = 4
	self.textures.hellish = {}
	self.textures.hellish.name_id = "bm_txt_hellish"
	self.textures.hellish.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.hellish.texture = "units/payday2/masks/shared_textures/patterns/pattern_hellish_df"
	self.textures.hellish.value = 4
	self.textures.poison = {}
	self.textures.poison.name_id = "bm_txt_poison"
	self.textures.poison.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.poison.texture = "units/payday2/masks/shared_textures/patterns/pattern_poison_df"
	self.textures.poison.value = 4
	self.textures.yggdrasil = {}
	self.textures.yggdrasil.name_id = "bm_txt_yggdrasil"
	self.textures.yggdrasil.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.yggdrasil.texture = "units/payday2/masks/shared_textures/patterns/pattern_yggdrasil_df"
	self.textures.yggdrasil.value = 4
	self.textures.pumpgrin = {}
	self.textures.pumpgrin.name_id = "bm_txt_pumpgrin"
	self.textures.pumpgrin.weight = 2
	self.textures.pumpgrin.texture = "units/payday2/masks/shared_textures/patterns/pattern_pumpgrin_df"
	self.textures.pumpgrin.global_value = "halloween"
	self.textures.pumpgrin.value = 5
	self.textures.shout = {}
	self.textures.shout.name_id = "bm_txt_shout"
	self.textures.shout.weight = 2
	self.textures.shout.texture = "units/payday2/masks/shared_textures/patterns/pattern_shout_df"
	self.textures.shout.global_value = "halloween"
	self.textures.shout.value = 5
	self.textures.webbed = {}
	self.textures.webbed.name_id = "bm_txt_webbed"
	self.textures.webbed.weight = 2
	self.textures.webbed.texture = "units/payday2/masks/shared_textures/patterns/pattern_webbed_df"
	self.textures.webbed.global_value = "halloween"
	self.textures.webbed.value = 5
	self.textures.hannibalistic = {}
	self.textures.hannibalistic.name_id = "bm_txt_hannibalistic"
	self.textures.hannibalistic.weight = 2
	self.textures.hannibalistic.texture = "units/payday2/masks/shared_textures/patterns/pattern_hannibalistic_df"
	self.textures.hannibalistic.global_value = "halloween"
	self.textures.hannibalistic.value = 5
	self.textures.stitches = {}
	self.textures.stitches.name_id = "bm_txt_stitches"
	self.textures.stitches.weight = 2
	self.textures.stitches.texture = "units/payday2/masks/shared_textures/patterns/pattern_stitches_df"
	self.textures.stitches.global_value = "halloween"
	self.textures.stitches.value = 4
	self.textures.doomweaver = {}
	self.textures.doomweaver.name_id = "bm_txt_doomweaver"
	self.textures.doomweaver.weight = 2
	self.textures.doomweaver.texture = "units/payday2/masks/shared_textures/patterns/pattern_doomweaver_df"
	self.textures.doomweaver.global_value = "halloween"
	self.textures.doomweaver.value = 4
	self.textures.racestripes = {}
	self.textures.racestripes.name_id = "bm_txt_racestripes"
	self.textures.racestripes.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.racestripes.texture = "units/pd2_dlc1/masks/patterns/pattern_racestripes_df"
	self.textures.racestripes.value = 4
	self.textures.racestripes.dlc = "armored_transport"
	self.textures.americaneagle = {}
	self.textures.americaneagle.name_id = "bm_txt_americaneagle"
	self.textures.americaneagle.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.americaneagle.texture = "units/pd2_dlc1/masks/patterns/pattern_americaneagle_df"
	self.textures.americaneagle.value = 4
	self.textures.americaneagle.dlc = "armored_transport"
	self.textures.stars = {}
	self.textures.stars.name_id = "bm_txt_stars"
	self.textures.stars.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.stars.texture = "units/pd2_dlc1/masks/patterns/pattern_stars_df"
	self.textures.stars.value = 4
	self.textures.stars.dlc = "armored_transport"
	self.textures.forestcamo = {}
	self.textures.forestcamo.name_id = "bm_txt_forestcamo"
	self.textures.forestcamo.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.forestcamo.texture = "units/pd2_dlc1/masks/patterns/pattern_forestcamo_df"
	self.textures.forestcamo.value = 4
	self.textures.forestcamo.dlc = "armored_transport"
	self.textures.army = {}
	self.textures.army.name_id = "bm_txt_army"
	self.textures.army.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.army.texture = "units/pd2_dlc_dec5/masks/patterns/pattern_army_df"
	self.textures.army.value = 4
	self.textures.army.dlc = "gage_pack"
	self.textures.commando = {}
	self.textures.commando.name_id = "bm_txt_commando"
	self.textures.commando.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.commando.texture = "units/pd2_dlc_dec5/masks/patterns/pattern_commando_df"
	self.textures.commando.value = 4
	self.textures.commando.dlc = "gage_pack"
	self.textures.hunter = {}
	self.textures.hunter.name_id = "bm_txt_hunter"
	self.textures.hunter.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.hunter.texture = "units/pd2_dlc_dec5/masks/patterns/pattern_hunter_df"
	self.textures.hunter.value = 4
	self.textures.hunter.dlc = "gage_pack"
	self.textures.digitalcamo = {}
	self.textures.digitalcamo.name_id = "bm_txt_digitalcamo"
	self.textures.digitalcamo.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.digitalcamo.texture = "units/pd2_dlc_dec5/masks/patterns/pattern_digitalcamo_df"
	self.textures.digitalcamo.value = 4
	self.textures.digitalcamo.dlc = "gage_pack"
	self.textures.ribcage = {}
	self.textures.ribcage.name_id = "bm_txt_ribcage"
	self.textures.ribcage.pcs = {}
	self.textures.ribcage.texture = "units/pd2_dlc_infamy/masks/patterns/pattern_ribcage_df"
	self.textures.ribcage.value = 0
	self.textures.ribcage.global_value = "infamy"
	self.textures.ribcage.infamy_lock = "infamy_ghost"
	self.textures.toto = {}
	self.textures.toto.name_id = "bm_txt_toto"
	self.textures.toto.pcs = {}
	self.textures.toto.texture = "units/pd2_dlc_infamy/masks/patterns/pattern_toto_df"
	self.textures.toto.value = 0
	self.textures.toto.global_value = "infamy"
	self.textures.toto.infamy_lock = "infamy_technician"
	self.textures.imperial = {}
	self.textures.imperial.name_id = "bm_txt_imperial"
	self.textures.imperial.pcs = {}
	self.textures.imperial.texture = "units/pd2_dlc_infamy/masks/patterns/pattern_imperial_df"
	self.textures.imperial.value = 0
	self.textures.imperial.global_value = "infamy"
	self.textures.imperial.infamy_lock = "infamy_mastermind"
	self.textures.fatman = {}
	self.textures.fatman.name_id = "bm_txt_fatman"
	self.textures.fatman.pcs = {}
	self.textures.fatman.texture = "units/pd2_dlc_infamy/masks/patterns/pattern_fatman_df"
	self.textures.fatman.value = 0
	self.textures.fatman.global_value = "infamy"
	self.textures.fatman.infamy_lock = "infamy_enforcer"
	self.textures.styx = {}
	self.textures.styx.name_id = "bm_txt_styx"
	self.textures.styx.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.styx.texture = "units/pd2_dlc_gage_lmg/masks/patterns/styx_df"
	self.textures.styx.value = 4
	self.textures.styx.dlc = "gage_pack_lmg"
	self.textures.fingerpaint = {}
	self.textures.fingerpaint.name_id = "bm_txt_fingerpaint"
	self.textures.fingerpaint.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.fingerpaint.texture = "units/pd2_dlc_gage_lmg/masks/patterns/fingerpaint_df"
	self.textures.fingerpaint.value = 4
	self.textures.fingerpaint.dlc = "gage_pack_lmg"
	self.textures.fighter = {}
	self.textures.fighter.name_id = "bm_txt_fighter"
	self.textures.fighter.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.fighter.texture = "units/pd2_dlc_gage_lmg/masks/patterns/fighter_df"
	self.textures.fighter.value = 4
	self.textures.fighter.dlc = "gage_pack_lmg"
	self.textures.warrior = {}
	self.textures.warrior.name_id = "bm_txt_warrior"
	self.textures.warrior.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.warrior.texture = "units/pd2_dlc_gage_lmg/masks/patterns/warrior_df"
	self.textures.warrior.value = 4
	self.textures.warrior.dlc = "gage_pack_lmg"
	self.textures.bugger = {}
	self.textures.bugger.name_id = "bm_txt_bugger"
	self.textures.bugger.pcs = {}
	self.textures.bugger.texture = "units/pd2_dlc_gage_snp/patterns/pattern_bugger_df"
	self.textures.bugger.value = 0
	self.textures.bugger.dlc = "gage_pack_snp"
	self.textures.spidereyes = {}
	self.textures.spidereyes.name_id = "bm_txt_spidereyes"
	self.textures.spidereyes.pcs = {}
	self.textures.spidereyes.texture = "units/pd2_dlc_gage_snp/patterns/pattern_spidereyes_df"
	self.textures.spidereyes.value = 0
	self.textures.spidereyes.dlc = "gage_pack_snp"
	self.textures.venomous = {}
	self.textures.venomous.name_id = "bm_txt_venomous"
	self.textures.venomous.pcs = {}
	self.textures.venomous.texture = "units/pd2_dlc_gage_snp/patterns/pattern_venomous_df"
	self.textures.venomous.value = 0
	self.textures.venomous.dlc = "gage_pack_snp"
	self.textures.wingsofdeath = {}
	self.textures.wingsofdeath.name_id = "bm_txt_wingsofdeath"
	self.textures.wingsofdeath.pcs = {}
	self.textures.wingsofdeath.texture = "units/pd2_dlc_gage_snp/patterns/pattern_wingsofdeath_df"
	self.textures.wingsofdeath.value = 0
	self.textures.wingsofdeath.dlc = "gage_pack_snp"
	self.textures.deathcube = {}
	self.textures.deathcube.name_id = "bm_txt_deathcube"
	self.textures.deathcube.pcs = {}
	self.textures.deathcube.texture = "units/pd2_poetry_winners/patterns/pattern_deathcube_df"
	self.textures.deathcube.value = 0
	self.textures.deathcube.dlc = "poetry_soundtrack"
	self.textures.deathcube.global_value = "poetry_soundtrack"
	self.textures.tcn = {}
	self.textures.tcn.name_id = "bm_txt_tcn"
	self.textures.tcn.pcs = {}
	self.textures.tcn.texture = "units/pd2_poetry_winners/patterns/pattern_tcn_df"
	self.textures.tcn.value = 0
	self.textures.tcn.dlc = "poetry_soundtrack"
	self.textures.tcn.global_value = "poetry_soundtrack"
	self.textures.tribalstroke = {}
	self.textures.tribalstroke.name_id = "bm_txt_tribalstroke"
	self.textures.tribalstroke.pcs = {}
	self.textures.tribalstroke.texture = "units/pd2_poetry_winners/patterns/pattern_tribalstroke_df"
	self.textures.tribalstroke.value = 0
	self.textures.tribalstroke.dlc = "poetry_soundtrack"
	self.textures.tribalstroke.global_value = "poetry_soundtrack"
	self.textures.kraken = {}
	self.textures.kraken.name_id = "bm_txt_kraken"
	self.textures.kraken.pcs = {}
	self.textures.kraken.texture = "units/pd2_poetry_winners/patterns/pattern_kraken_df"
	self.textures.kraken.value = 0
	self.textures.kraken.dlc = "poetry_soundtrack"
	self.textures.kraken.global_value = "poetry_soundtrack"
	self.textures.roman = {}
	self.textures.roman.name_id = "bm_txt_roman"
	self.textures.roman.pcs = {}
	self.textures.roman.texture = "units/pd2_dlc_big/masks/patterns/pattern_roman_df"
	self.textures.roman.value = 0
	self.textures.roman.dlc = "big_bank"
	self.textures.wargod = {}
	self.textures.wargod.name_id = "bm_txt_wargod"
	self.textures.wargod.pcs = {}
	self.textures.wargod.texture = "units/pd2_dlc_big/masks/patterns/pattern_wargod_df"
	self.textures.wargod.value = 0
	self.textures.wargod.dlc = "big_bank"
	self.textures.spartan = {}
	self.textures.spartan.name_id = "bm_txt_spartan"
	self.textures.spartan.pcs = {}
	self.textures.spartan.texture = "units/pd2_dlc_big/masks/patterns/pattern_spartan_df"
	self.textures.spartan.value = 0
	self.textures.spartan.dlc = "big_bank"
	self.textures.ruler = {}
	self.textures.ruler.name_id = "bm_txt_ruler"
	self.textures.ruler.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.ruler.texture = "units/pd2_dlc_big/masks/patterns/pattern_ruler_df"
	self.textures.ruler.value = 0
	self.textures.ruler.dlc = "big_bank"
	self.textures.banana = {}
	self.textures.banana.name_id = "bm_txt_banana"
	self.textures.banana.pcs = {}
	self.textures.banana.texture = "units/pd2_dlc_gage_shot/patterns/pattern_banana_df"
	self.textures.banana.value = 0
	self.textures.banana.dlc = "gage_pack_shotgun"
	self.textures.chief = {}
	self.textures.chief.name_id = "bm_txt_chief"
	self.textures.chief.pcs = {}
	self.textures.chief.texture = "units/pd2_dlc_gage_shot/patterns/pattern_chief_df"
	self.textures.chief.value = 0
	self.textures.chief.dlc = "gage_pack_shotgun"
	self.textures.monkeyskull = {}
	self.textures.monkeyskull.name_id = "bm_txt_monkeyskull"
	self.textures.monkeyskull.pcs = {}
	self.textures.monkeyskull.texture = "units/pd2_dlc_gage_shot/patterns/pattern_monkeyskull_df"
	self.textures.monkeyskull.value = 0
	self.textures.monkeyskull.dlc = "gage_pack_shotgun"
	self.textures.terror = {}
	self.textures.terror.name_id = "bm_txt_terror"
	self.textures.terror.pcs = {}
	self.textures.terror.texture = "units/pd2_dlc_gage_shot/patterns/pattern_terror_df"
	self.textures.terror.value = 0
	self.textures.terror.dlc = "gage_pack_shotgun"
	self.textures.muerte = {}
	self.textures.muerte.name_id = "bm_txt_muerte"
	self.textures.muerte.pcs = {}
	self.textures.muerte.texture = "units/pd2_dlc_gage_assault/masks/patterns/pattern_muerte_df"
	self.textures.muerte.value = 0
	self.textures.muerte.dlc = "gage_pack_assault"
	self.textures.emperor = {}
	self.textures.emperor.name_id = "bm_txt_emperor"
	self.textures.emperor.pcs = {}
	self.textures.emperor.texture = "units/pd2_dlc_gage_assault/masks/patterns/pattern_emperor_df"
	self.textures.emperor.value = 0
	self.textures.emperor.dlc = "gage_pack_assault"
	self.textures.vicious = {}
	self.textures.vicious.name_id = "bm_txt_vicious"
	self.textures.vicious.pcs = {}
	self.textures.vicious.texture = "units/pd2_dlc_gage_assault/masks/patterns/pattern_vicious_df"
	self.textures.vicious.value = 0
	self.textures.vicious.dlc = "gage_pack_assault"
	self.textures.death = {}
	self.textures.death.name_id = "bm_txt_death"
	self.textures.death.pcs = {}
	self.textures.death.texture = "units/pd2_dlc_gage_assault/masks/patterns/pattern_death_df"
	self.textures.death.value = 0
	self.textures.death.dlc = "gage_pack_assault"
	self.textures.doodles = {}
	self.textures.doodles.name_id = "bm_txt_doodles"
	self.textures.doodles.pcs = {}
	self.textures.doodles.texture = "units/pd2_dlc_miami/masks/patterns/pattern_doodles_df"
	self.textures.doodles.value = 0
	self.textures.doodles.dlc = "hl_miami"
	self.textures.doodles.texture_bundle_folder = "hl_miami"
	self.textures.hiptobepolygon = {}
	self.textures.hiptobepolygon.name_id = "bm_txt_hiptobepolygon"
	self.textures.hiptobepolygon.pcs = {}
	self.textures.hiptobepolygon.texture = "units/pd2_dlc_miami/masks/patterns/pattern_hiptobepolygon_df"
	self.textures.hiptobepolygon.value = 0
	self.textures.hiptobepolygon.dlc = "hl_miami"
	self.textures.hiptobepolygon.texture_bundle_folder = "hl_miami"
	self.textures.palmtrees = {}
	self.textures.palmtrees.name_id = "bm_txt_palmtrees"
	self.textures.palmtrees.pcs = {}
	self.textures.palmtrees.texture = "units/pd2_dlc_miami/masks/patterns/pattern_palmtrees_df"
	self.textures.palmtrees.value = 0
	self.textures.palmtrees.dlc = "hl_miami"
	self.textures.palmtrees.texture_bundle_folder = "hl_miami"
	self.textures.bsomebody = {}
	self.textures.bsomebody.name_id = "bm_txt_bsomebody"
	self.textures.bsomebody.pcs = {}
	self.textures.bsomebody.texture = "units/pd2_dlc_miami/masks/patterns/pattern_bsomebody_df"
	self.textures.bsomebody.value = 0
	self.textures.bsomebody.dlc = "hl_miami"
	self.textures.bsomebody.texture_bundle_folder = "hl_miami"
	self.textures.hotline = {}
	self.textures.hotline.name_id = "bm_txt_hotline"
	self.textures.hotline.pcs = {}
	self.textures.hotline.texture = "units/pd2_dlc_miami/masks/patterns/pattern_hotline_df"
	self.textures.hotline.value = 0
	self.textures.hotline.dlc = "hlm_game"
	self.textures.hotline.texture_bundle_folder = "hl_miami"
	self.textures.leopard = {}
	self.textures.leopard.name_id = "bm_txt_leopard"
	self.textures.leopard.pcs = {}
	self.textures.leopard.texture = "units/pd2_dlc_miami/masks/patterns/pattern_leopard_df"
	self.textures.leopard.value = 0
	self.textures.leopard.dlc = "hlm_game"
	self.textures.leopard.texture_bundle_folder = "hl_miami"
	self.textures.shutupandbleed = {}
	self.textures.shutupandbleed.name_id = "bm_txt_shutupandbleed"
	self.textures.shutupandbleed.pcs = {}
	self.textures.shutupandbleed.texture = "units/pd2_dlc_miami/masks/patterns/pattern_shutupandbleed_df"
	self.textures.shutupandbleed.value = 0
	self.textures.shutupandbleed.dlc = "hlm_game"
	self.textures.shutupandbleed.texture_bundle_folder = "hl_miami"
	self.textures.uglyrug = {}
	self.textures.uglyrug.name_id = "bm_txt_uglyrug"
	self.textures.uglyrug.pcs = {}
	self.textures.uglyrug.texture = "units/pd2_dlc_miami/masks/patterns/pattern_uglyrug_df"
	self.textures.uglyrug.value = 0
	self.textures.uglyrug.dlc = "hlm_game"
	self.textures.uglyrug.texture_bundle_folder = "hl_miami"
end

function BlackMarketTweakData_37:_init_cash()
	self.cash = {}
	self.cash.cash10 = {}
	self.cash.cash10.name_id = "bm_csh_cash10"
	self.cash.cash10.value_id = "cash10"
	self.cash.cash10.multiplier = 1
	self.cash.cash10.pcs = {10, 40}
	self.cash.cash20 = {}
	self.cash.cash20.name_id = "bm_csh_cash20"
	self.cash.cash20.value_id = "cash20"
	self.cash.cash20.multiplier = 1
	self.cash.cash20.pcs = {20, 40}
	self.cash.cash30 = {}
	self.cash.cash30.name_id = "bm_csh_cash30"
	self.cash.cash30.multiplier = 1
	self.cash.cash30.value_id = "cash30"
	self.cash.cash30.pcs = {30, 40}
	self.cash.cash40 = {}
	self.cash.cash40.name_id = "bm_csh_cash40"
	self.cash.cash40.multiplier = 1
	self.cash.cash40.value_id = "cash40"
	self.cash.cash40.pcs = {
		20,
		30,
		40
	}
	self.cash.cash50 = {}
	self.cash.cash50.name_id = "bm_csh_cash50"
	self.cash.cash50.multiplier = 1
	self.cash.cash50.value_id = "cash50"
	self.cash.cash50.pcs = {
		30,
		40,
		50
	}
	self.cash.cash60 = {}
	self.cash.cash60.name_id = "bm_csh_cash60"
	self.cash.cash60.value_id = "cash60"
	self.cash.cash60.multiplier = 1
	self.cash.cash60.pcs = {
		40,
		50,
		60
	}
	self.cash.cash70 = {}
	self.cash.cash70.name_id = "bm_csh_cash70"
	self.cash.cash70.value_id = "cash70"
	self.cash.cash70.multiplier = 1
	self.cash.cash70.pcs = {
		50,
		60,
		70
	}
	self.cash.cash80 = {}
	self.cash.cash80.name_id = "bm_csh_cash80"
	self.cash.cash80.value_id = "cash80"
	self.cash.cash80.multiplier = 1
	self.cash.cash80.pcs = {
		60,
		70,
		80
	}
	self.cash.cash90 = {}
	self.cash.cash90.name_id = "bm_csh_cash90"
	self.cash.cash90.value_id = "cash90"
	self.cash.cash90.multiplier = 1
	self.cash.cash90.pcs = {
		70,
		80,
		90
	}
	self.cash.cash100 = {}
	self.cash.cash100.name_id = "bm_csh_cash100"
	self.cash.cash100.value_id = "cash100"
	self.cash.cash100.multiplier = 1
	self.cash.cash100.pcs = {
		80,
		90,
		100
	}
	self.cash.cash_preorder = {}
	self.cash.cash_preorder.name_id = "bm_csh_cash_preorder"
	self.cash.cash_preorder.value_id = "cash_preorder"
	self.cash.cash_preorder.multiplier = 1.2
	self.cash.cash_preorder.dlc = "preorder"
end

function BlackMarketTweakData_37:_init_xp()
	self.xp = {}
	self.xp.xp10 = {}
	self.xp.xp10.name_id = "bm_exp_xp10"
	self.xp.xp10.value_id = "xp10"
	self.xp.xp10.multiplier = 1
	self.xp.xp10.pcs = {10, 40}
	self.xp.xp20 = {}
	self.xp.xp20.name_id = "bm_exp_xp20"
	self.xp.xp20.value_id = "xp20"
	self.xp.xp20.multiplier = 1
	self.xp.xp20.pcs = {20, 40}
	self.xp.xp30 = {}
	self.xp.xp30.name_id = "bm_exp_xp30"
	self.xp.xp30.multiplier = 1
	self.xp.xp30.value_id = "xp30"
	self.xp.xp30.pcs = {30, 40}
	self.xp.xp40 = {}
	self.xp.xp40.name_id = "bm_exp_xp40"
	self.xp.xp40.multiplier = 1
	self.xp.xp40.value_id = "xp40"
	self.xp.xp40.pcs = {
		20,
		30,
		40
	}
	self.xp.xp50 = {}
	self.xp.xp50.name_id = "bm_exp_xp50"
	self.xp.xp50.multiplier = 1
	self.xp.xp50.value_id = "xp50"
	self.xp.xp50.pcs = {
		30,
		40,
		50
	}
	self.xp.xp60 = {}
	self.xp.xp60.name_id = "bm_exp_xp60"
	self.xp.xp60.value_id = "xp60"
	self.xp.xp60.multiplier = 1
	self.xp.xp60.pcs = {
		40,
		50,
		60
	}
	self.xp.xp70 = {}
	self.xp.xp70.name_id = "bm_exp_xp70"
	self.xp.xp70.value_id = "xp70"
	self.xp.xp70.multiplier = 1
	self.xp.xp70.pcs = {
		50,
		60,
		70
	}
	self.xp.xp80 = {}
	self.xp.xp80.name_id = "bm_exp_xp80"
	self.xp.xp80.value_id = "xp80"
	self.xp.xp80.multiplier = 1
	self.xp.xp80.pcs = {
		60,
		70,
		80
	}
	self.xp.xp90 = {}
	self.xp.xp90.name_id = "bm_exp_xp90"
	self.xp.xp90.value_id = "xp90"
	self.xp.xp90.multiplier = 1
	self.xp.xp90.pcs = {
		70,
		80,
		90
	}
	self.xp.xp100 = {}
	self.xp.xp100.name_id = "bm_exp_xp100"
	self.xp.xp100.value_id = "xp100"
	self.xp.xp100.multiplier = 1
	self.xp.xp100.pcs = {
		80,
		90,
		100
	}
end

function BlackMarketTweakData_37:_init_armors()
	self.armors = {}
	self.armors.level_1 = {}
	self.armors.level_1.name_id = "bm_armor_level_1"
	self.armors.level_1.sequence = "var_model_01"
	self.armors.level_1.upgrade_level = 1
	self.armors.level_2 = {}
	self.armors.level_2.name_id = "bm_armor_level_2"
	self.armors.level_2.sequence = "var_model_02"
	self.armors.level_2.upgrade_level = 2
	self.armors.level_3 = {}
	self.armors.level_3.name_id = "bm_armor_level_3"
	self.armors.level_3.sequence = "var_model_03"
	self.armors.level_3.upgrade_level = 3
	self.armors.level_4 = {}
	self.armors.level_4.name_id = "bm_armor_level_4"
	self.armors.level_4.sequence = "var_model_04"
	self.armors.level_4.upgrade_level = 4
	self.armors.level_5 = {}
	self.armors.level_5.name_id = "bm_armor_level_5"
	self.armors.level_5.sequence = "var_model_05"
	self.armors.level_5.upgrade_level = 5
	self.armors.level_6 = {}
	self.armors.level_6.name_id = "bm_armor_level_6"
	self.armors.level_6.sequence = "var_model_06"
	self.armors.level_6.upgrade_level = 6
	self.armors.level_7 = {}
	self.armors.level_7.name_id = "bm_armor_level_7"
	self.armors.level_7.sequence = "var_model_07"
	self.armors.level_7.upgrade_level = 7
	self:_add_desc_from_name_macro(self.armors)
end

function BlackMarketTweakData_37:_init_deployables(tweak_data)
	self.deployables = {}
	self.deployables.doctor_bag = {}
	self.deployables.doctor_bag.name_id = "bm_equipment_doctor_bag"
	self.deployables.ammo_bag = {}
	self.deployables.ammo_bag.name_id = "bm_equipment_ammo_bag"
	self.deployables.ecm_jammer = {}
	self.deployables.ecm_jammer.name_id = "bm_equipment_ecm_jammer"
	self.deployables.sentry_gun = {}
	self.deployables.sentry_gun.name_id = "bm_equipment_sentry_gun"
	self.deployables.trip_mine = {}
	self.deployables.trip_mine.name_id = "bm_equipment_trip_mine"
	self:_add_desc_from_name_macro(self.deployables)
end

function BlackMarketTweakData_37:_init_grenades()
	self.grenades = {}
	self.grenades.frag = {}
	self.grenades.frag.name_id = "bm_grenade_frag"
	self.grenades.frag.unit = "units/payday2/weapons/wpn_frag_grenade/wpn_frag_grenade"
	self.grenades.frag.unit_dummy = "units/payday2/weapons/wpn_frag_grenade/wpn_frag_grenade_husk"
	self.grenades.frag.sprint_unit = "units/payday2/weapons/wpn_frag_grenade/wpn_frag_grenade_sprint"
	self.grenades.frag.icon = "frag_grenade"
	self.grenades.frag.dlc = "gage_pack"
	self.grenades.launcher_frag = {}
	self.grenades.launcher_frag.name_id = "bm_launcher_frag"
	self.grenades.launcher_frag.unit = "units/pd2_dlc_gage_assault/weapons/wpn_launcher_frag_grenade/wpn_launcher_frag_grenade"
	self.grenades.launcher_frag.weapon_id = "gre_m79"
	self.grenades.launcher_frag.no_cheat_count = true
	self.grenades.launcher_frag.impact_detonation = true
	self.grenades.launcher_frag.time_cheat = 1
end

function BlackMarketTweakData_37:_init_melee_weapons()
	self.melee_weapons = {}
	self.melee_weapons.weapon = {}
	self.melee_weapons.weapon.name_id = "bm_melee_weapon"
	self.melee_weapons.weapon.type = "weapon"
	self.melee_weapons.weapon.unit = nil
	self.melee_weapons.weapon.animation = nil
	self.melee_weapons.weapon.instant = true
	self.melee_weapons.weapon.free = true
	self.melee_weapons.weapon.stats = {}
	self.melee_weapons.weapon.stats.min_damage = 1.5
	self.melee_weapons.weapon.stats.max_damage = 1.5
	self.melee_weapons.weapon.stats.min_damage_effect = 1.75
	self.melee_weapons.weapon.stats.max_damage_effect = 1.75
	self.melee_weapons.weapon.stats.charge_time = 0
	self.melee_weapons.weapon.stats.range = 150
	self.melee_weapons.weapon.stats.weapon_type = "blunt"
	self.melee_weapons.weapon.expire_t = 0.6
	self.melee_weapons.weapon.repeat_expire_t = 0.6
	self.melee_weapons.weapon.sounds = {}
	self.melee_weapons.weapon.sounds.hit_body = "melee_hit_body"
	self.melee_weapons.weapon.sounds.hit_gen = "melee_hit_gen"
	self.melee_weapons.fists = {}
	self.melee_weapons.fists.name_id = "bm_melee_fists"
	self.melee_weapons.fists.type = "fists"
	self.melee_weapons.fists.unit = nil
	self.melee_weapons.fists.animation = nil
	self.melee_weapons.fists.free = true
	self.melee_weapons.fists.stats = {}
	self.melee_weapons.fists.stats.min_damage = 1
	self.melee_weapons.fists.stats.max_damage = 3
	self.melee_weapons.fists.stats.min_damage_effect = 5.35
	self.melee_weapons.fists.stats.max_damage_effect = 2.89
	self.melee_weapons.fists.stats.charge_time = 1
	self.melee_weapons.fists.stats.range = 150
	self.melee_weapons.fists.stats.remove_weapon_movement_penalty = true
	self.melee_weapons.fists.stats.weapon_type = "blunt"
	self.melee_weapons.fists.anim_global_param = "melee_fist"
	self.melee_weapons.fists.anim_attack_vars = {
		"var1",
		"var2",
		"var3",
		"var4"
	}
	self.melee_weapons.fists.expire_t = 1
	self.melee_weapons.fists.repeat_expire_t = 0.55
	self.melee_weapons.fists.melee_damage_delay = 0.2
	self.melee_weapons.fists.melee_charge_shaker = "player_melee_charge_fist"
	self.melee_weapons.fists.sounds = {}
	self.melee_weapons.fists.sounds.equip = "fist_equip"
	self.melee_weapons.fists.sounds.hit_air = "fist_hit_air"
	self.melee_weapons.fists.sounds.hit_gen = "fist_hit_gen"
	self.melee_weapons.fists.sounds.hit_body = "fist_hit_body"
	self.melee_weapons.fists.sounds.charge = "fist_charge"
	self.melee_weapons.fists.stats.concealment = 30
	self.melee_weapons.kabar = {}
	self.melee_weapons.kabar.name_id = "bm_melee_kabar"
	self.melee_weapons.kabar.type = "knife"
	self.melee_weapons.kabar.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_mel_kabar/wpn_fps_mel_kabar"
	self.melee_weapons.kabar.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_mel_kabar/wpn_third_mel_kabar"
	self.melee_weapons.kabar.animation = nil
	self.melee_weapons.kabar.dlc = "gage_pack_lmg"
	self.melee_weapons.kabar.texture_bundle_folder = "gage_pack_lmg"
	self.melee_weapons.kabar.stats = {}
	self.melee_weapons.kabar.stats.min_damage = 1.5
	self.melee_weapons.kabar.stats.max_damage = 7
	self.melee_weapons.kabar.stats.min_damage_effect = 0.7
	self.melee_weapons.kabar.stats.max_damage_effect = 0.525
	self.melee_weapons.kabar.stats.charge_time = 1.8
	self.melee_weapons.kabar.stats.range = 185
	self.melee_weapons.kabar.stats.remove_weapon_movement_penalty = true
	self.melee_weapons.kabar.stats.weapon_type = "sharp"
	self.melee_weapons.kabar.anim_global_param = "melee_knife"
	self.melee_weapons.kabar.anim_attack_vars = {
		"var1",
		"var2",
		"var3",
		"var4"
	}
	self.melee_weapons.kabar.repeat_expire_t = 0.6
	self.melee_weapons.kabar.expire_t = 1.1
	self.melee_weapons.kabar.melee_damage_delay = 0.1
	self.melee_weapons.kabar.sounds = {}
	self.melee_weapons.kabar.sounds.equip = "knife_equip"
	self.melee_weapons.kabar.sounds.hit_air = "knife_hit_air"
	self.melee_weapons.kabar.sounds.hit_gen = "knife_hit_gen"
	self.melee_weapons.kabar.sounds.hit_body = "knife_hit_body"
	self.melee_weapons.kabar.sounds.charge = "knife_charge"
	self.melee_weapons.kabar.stats.concealment = 29
	self.melee_weapons.rambo = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.rambo.name_id = "bm_melee_rambo"
	self.melee_weapons.rambo.type = "knife"
	self.melee_weapons.rambo.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_mel_rambo/wpn_fps_mel_rambo"
	self.melee_weapons.rambo.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_mel_rambo/wpn_third_mel_rambo"
	self.melee_weapons.rambo.stats.min_damage = 2.2
	self.melee_weapons.rambo.stats.max_damage = 10
	self.melee_weapons.rambo.stats.min_damage_effect = 0.61
	self.melee_weapons.rambo.stats.max_damage_effect = 0.4
	self.melee_weapons.rambo.anim_global_param = "melee_knife2"
	self.melee_weapons.rambo.repeat_expire_t = 0.5
	self.melee_weapons.rambo.expire_t = 1
	self.melee_weapons.rambo.stats.charge_time = 2
	self.melee_weapons.rambo.stats.range = 200
	self.melee_weapons.rambo.stats.concealment = 29
	self.melee_weapons.gerber = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.gerber.name_id = "bm_melee_gerber"
	self.melee_weapons.gerber.type = "knife"
	self.melee_weapons.gerber.anim_global_param = "melee_knife2"
	self.melee_weapons.gerber.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_mel_dmf/wpn_fps_mel_dmf"
	self.melee_weapons.gerber.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_mel_dmf/wpn_third_mel_dmf"
	self.melee_weapons.gerber.anim_global_param = "melee_knife2"
	self.melee_weapons.gerber.repeat_expire_t = 0.5
	self.melee_weapons.gerber.expire_t = 1
	self.melee_weapons.gerber.stats.min_damage = 2
	self.melee_weapons.gerber.stats.max_damage = 5.2
	self.melee_weapons.gerber.stats.min_damage_effect = 1
	self.melee_weapons.gerber.stats.max_damage_effect = 0.58
	self.melee_weapons.gerber.stats.charge_time = 1.3
	self.melee_weapons.gerber.stats.range = 160
	self.melee_weapons.gerber.stats.concealment = 30
	self.melee_weapons.kampfmesser = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.kampfmesser.name_id = "bm_melee_kampfmesser"
	self.melee_weapons.kampfmesser.type = "knife"
	self.melee_weapons.kampfmesser.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_mel_km2000/wpn_fps_mel_km2000"
	self.melee_weapons.kampfmesser.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_mel_km2000/wpn_third_mel_km2000"
	self.melee_weapons.kampfmesser.stats.min_damage = 1.5
	self.melee_weapons.kampfmesser.stats.max_damage = 7.5
	self.melee_weapons.kampfmesser.stats.min_damage_effect = 1
	self.melee_weapons.kampfmesser.stats.max_damage_effect = 0.445
	self.melee_weapons.kampfmesser.stats.charge_time = 1.5
	self.melee_weapons.kampfmesser.stats.range = 185
	self.melee_weapons.kampfmesser.stats.concealment = 29
	self.melee_weapons.brass_knuckles = deep_clone(self.melee_weapons.fists)
	self.melee_weapons.brass_knuckles.name_id = "bm_melee_brass_knuckles"
	self.melee_weapons.brass_knuckles.free = nil
	self.melee_weapons.brass_knuckles.type = "fists"
	self.melee_weapons.brass_knuckles.dlc = "pd2_clan"
	self.melee_weapons.brass_knuckles.align_objects = {
		"a_weapon_left",
		"a_weapon_right"
	}
	self.melee_weapons.brass_knuckles.unit = "units/payday2/weapons/wpn_fps_mel_brassknuckle/wpn_fps_mel_brassknuckle"
	self.melee_weapons.brass_knuckles.third_unit = "units/payday2/weapons/wpn_fps_mel_brassknuckle/wpn_third_mel_brassknuckle"
	self.melee_weapons.brass_knuckles.stats.min_damage = 1.5
	self.melee_weapons.brass_knuckles.stats.max_damage = 3.5
	self.melee_weapons.brass_knuckles.stats.min_damage_effect = 3.7
	self.melee_weapons.brass_knuckles.stats.max_damage_effect = 2.675
	self.melee_weapons.brass_knuckles.stats.charge_time = 1.3
	self.melee_weapons.brass_knuckles.stats.range = 150
	self.melee_weapons.brass_knuckles.sounds.hit_gen = "knuckles_hit_gen"
	self.melee_weapons.brass_knuckles.sounds.hit_body = "knuckles_hit_body"
	self.melee_weapons.brass_knuckles.stats.concealment = 30
	self.melee_weapons.tomahawk = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.tomahawk.name_id = "bm_melee_tomahawk"
	self.melee_weapons.tomahawk.dlc = "gage_pack_shotgun"
	self.melee_weapons.tomahawk.texture_bundle_folder = "gage_pack_shotgun"
	self.melee_weapons.tomahawk.anim_global_param = "melee_axe"
	self.melee_weapons.tomahawk.type = "axe"
	self.melee_weapons.tomahawk.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.tomahawk.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_mel_tomahawk/wpn_fps_mel_tomahawk"
	self.melee_weapons.tomahawk.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_mel_tomahawk/wpn_third_mel_tomahawk"
	self.melee_weapons.tomahawk.stats.weapon_type = "sharp"
	self.melee_weapons.tomahawk.stats.min_damage = 4
	self.melee_weapons.tomahawk.stats.max_damage = 6.64
	self.melee_weapons.tomahawk.stats.min_damage_effect = 0.5
	self.melee_weapons.tomahawk.stats.max_damage_effect = 0.6
	self.melee_weapons.tomahawk.stats.charge_time = 2.2
	self.melee_weapons.tomahawk.stats.range = 225
	self.melee_weapons.tomahawk.expire_t = 1.1
	self.melee_weapons.tomahawk.repeat_expire_t = 0.8
	self.melee_weapons.tomahawk.attack_allowed_expire_t = 0.1
	self.melee_weapons.tomahawk.sounds = {}
	self.melee_weapons.tomahawk.sounds.equip = "tomahawk_equip"
	self.melee_weapons.tomahawk.sounds.hit_air = "tomahawk_hit_air"
	self.melee_weapons.tomahawk.sounds.hit_gen = "tomahawk_hit_gen"
	self.melee_weapons.tomahawk.sounds.hit_body = "tomahawk_hit_body"
	self.melee_weapons.tomahawk.sounds.charge = "tomahawk_charge"
	self.melee_weapons.tomahawk.stats.concealment = 26
	self.melee_weapons.baton = deep_clone(self.melee_weapons.tomahawk)
	self.melee_weapons.baton.name_id = "bm_melee_baton"
	self.melee_weapons.baton.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_mel_baton/wpn_fps_mel_baton"
	self.melee_weapons.baton.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_mel_baton/wpn_third_mel_baton"
	self.melee_weapons.baton.stats.weapon_type = "blunt"
	self.melee_weapons.baton.stats.min_damage = 0.68
	self.melee_weapons.baton.stats.max_damage = 1.68
	self.melee_weapons.baton.stats.min_damage_effect = 12
	self.melee_weapons.baton.stats.max_damage_effect = 8.8
	self.melee_weapons.baton.stats.charge_time = 2
	self.melee_weapons.baton.stats.range = 250
	self.melee_weapons.baton.stats.weapon_type = "blunt"
	self.melee_weapons.baton.sounds = {}
	self.melee_weapons.baton.sounds.equip = "baton_equip"
	self.melee_weapons.baton.sounds.hit_air = "baton_hit_air"
	self.melee_weapons.baton.sounds.hit_gen = "baton_hit_gen"
	self.melee_weapons.baton.sounds.hit_body = "baton_hit_body"
	self.melee_weapons.baton.sounds.charge = "baton_charge"
	self.melee_weapons.baton.stats.concealment = 30
	self.melee_weapons.shovel = deep_clone(self.melee_weapons.tomahawk)
	self.melee_weapons.shovel.name_id = "bm_melee_shovel"
	self.melee_weapons.shovel.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_mel_combat/wpn_fps_mel_combat"
	self.melee_weapons.shovel.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_mel_combat/wpn_third_mel_combat"
	self.melee_weapons.shovel.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.shovel.stats.weapon_type = "blunt"
	self.melee_weapons.shovel.stats.min_damage = 1.34
	self.melee_weapons.shovel.stats.max_damage = 2.64
	self.melee_weapons.shovel.stats.min_damage_effect = 4.75
	self.melee_weapons.shovel.stats.max_damage_effect = 5.06
	self.melee_weapons.shovel.stats.charge_time = 2.2
	self.melee_weapons.shovel.stats.range = 250
	self.melee_weapons.shovel.stats.weapon_type = "blunt"
	self.melee_weapons.shovel.sounds = {}
	self.melee_weapons.shovel.sounds.equip = "shovel_equip"
	self.melee_weapons.shovel.sounds.hit_air = "shovel_hit_air"
	self.melee_weapons.shovel.sounds.hit_gen = "shovel_hit_gen"
	self.melee_weapons.shovel.sounds.hit_body = "shovel_hit_body"
	self.melee_weapons.shovel.sounds.charge = "shovel_charge"
	self.melee_weapons.shovel.stats.concealment = 24
	self.melee_weapons.becker = deep_clone(self.melee_weapons.tomahawk)
	self.melee_weapons.becker.name_id = "bm_melee_becker"
	self.melee_weapons.becker.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_mel_tac/wpn_fps_mel_tac"
	self.melee_weapons.becker.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_mel_tac/wpn_third_mel_tac"
	self.melee_weapons.becker.stats.min_damage = 1.68
	self.melee_weapons.becker.stats.max_damage = 11.68
	self.melee_weapons.becker.stats.min_damage_effect = 0.4
	self.melee_weapons.becker.stats.max_damage_effect = 0.345
	self.melee_weapons.becker.stats.charge_time = 3
	self.melee_weapons.becker.stats.range = 200
	self.melee_weapons.becker.repeat_expire_t = 0.6
	self.melee_weapons.becker.sounds = {}
	self.melee_weapons.becker.sounds.equip = "becker_equip"
	self.melee_weapons.becker.sounds.hit_air = "becker_hit_air"
	self.melee_weapons.becker.sounds.hit_gen = "becker_hit_gen"
	self.melee_weapons.becker.sounds.hit_body = "becker_hit_body"
	self.melee_weapons.becker.sounds.charge = "knife_charge"
	self.melee_weapons.becker.stats.concealment = 28
	self.melee_weapons.moneybundle = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.moneybundle.name_id = "bm_melee_moneybundle"
	self.melee_weapons.moneybundle.dlc = "pd2_clan"
	self.melee_weapons.moneybundle.texture_bundle_folder = "pd2_million"
	self.melee_weapons.moneybundle.free = nil
	self.melee_weapons.moneybundle.anim_global_param = "melee_axe"
	self.melee_weapons.moneybundle.type = "axe"
	self.melee_weapons.moneybundle.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.moneybundle.unit = "units/pd2_million/weapons/wpn_fps_mel_moneybundle/wpn_fps_mel_moneybundle"
	self.melee_weapons.moneybundle.third_unit = "units/pd2_million/weapons/wpn_third_mel_moneybundle/wpn_third_mel_moneybundle"
	self.melee_weapons.moneybundle.stats.weapon_type = "blunt"
	self.melee_weapons.moneybundle.stats.min_damage = 0.2
	self.melee_weapons.moneybundle.stats.max_damage = 1
	self.melee_weapons.moneybundle.stats.min_damage_effect = 15
	self.melee_weapons.moneybundle.stats.max_damage_effect = 10
	self.melee_weapons.moneybundle.stats.charge_time = 1
	self.melee_weapons.moneybundle.stats.range = 150
	self.melee_weapons.moneybundle.stats.weapon_type = "blunt"
	self.melee_weapons.moneybundle.sounds = {}
	self.melee_weapons.moneybundle.repeat_expire_t = 0.5
	self.melee_weapons.moneybundle.sounds.equip = "cash_equip"
	self.melee_weapons.moneybundle.sounds.hit_air = "cash_hit_air"
	self.melee_weapons.moneybundle.sounds.hit_gen = "cash_hit_gen"
	self.melee_weapons.moneybundle.sounds.hit_body = "cash_hit_body"
	self.melee_weapons.moneybundle.sounds.charge = "cash_charge"
	self.melee_weapons.moneybundle.stats.concealment = 30
	self.melee_weapons.barbedwire = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.barbedwire.name_id = "bm_melee_baseballbat"
	self.melee_weapons.barbedwire.dlc = "pd2_clan"
	self.melee_weapons.barbedwire.texture_bundle_folder = "washington_reveal"
	self.melee_weapons.barbedwire.free = nil
	self.melee_weapons.barbedwire.anim_global_param = "melee_baseballbat"
	self.melee_weapons.barbedwire.type = "axe"
	self.melee_weapons.barbedwire.align_objects = {
		"a_weapon_left"
	}
	self.melee_weapons.barbedwire.unit = "units/pd2_washington_reveal/weapons/wpn_fps_mel_barbedwire/wpn_fps_mel_barbedwire"
	self.melee_weapons.barbedwire.third_unit = "units/pd2_washington_reveal/weapons/wpn_fps_mel_barbedwire/wpn_third_mel_barbedwire"
	self.melee_weapons.barbedwire.stats.weapon_type = "blunt"
	self.melee_weapons.barbedwire.stats.min_damage = 4
	self.melee_weapons.barbedwire.stats.max_damage = 6.64
	self.melee_weapons.barbedwire.stats.min_damage_effect = 4
	self.melee_weapons.barbedwire.stats.max_damage_effect = 3.2
	self.melee_weapons.barbedwire.stats.charge_time = 3
	self.melee_weapons.barbedwire.stats.range = 275
	self.melee_weapons.barbedwire.stats.weapon_type = "blunt"
	self.melee_weapons.barbedwire.sounds = {}
	self.melee_weapons.barbedwire.repeat_expire_t = 1
	self.melee_weapons.barbedwire.expire_t = 1.2
	self.melee_weapons.barbedwire.sounds.equip = "bat_equip"
	self.melee_weapons.barbedwire.sounds.hit_air = "bat_hit_air"
	self.melee_weapons.barbedwire.sounds.hit_gen = "bat_hit_gen"
	self.melee_weapons.barbedwire.sounds.hit_body = "bat_hit_body"
	self.melee_weapons.barbedwire.sounds.charge = "bat_charge"
	self.melee_weapons.barbedwire.melee_damage_delay = 0.2
	self.melee_weapons.barbedwire.stats.concealment = 21
	self.melee_weapons.x46 = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.x46.name_id = "bm_melee_x46"
	self.melee_weapons.x46.type = "knife"
	self.melee_weapons.x46.dlc = "gage_pack_assault"
	self.melee_weapons.x46.texture_bundle_folder = "gage_pack_assault"
	self.melee_weapons.x46.align_objects = {
		"a_weapon_left"
	}
	self.melee_weapons.x46.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_mel_x46/wpn_fps_mel_x46"
	self.melee_weapons.x46.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_mel_x46/wpn_third_mel_x46"
	self.melee_weapons.x46.stats.min_damage = 2.5
	self.melee_weapons.x46.stats.max_damage = 6
	self.melee_weapons.x46.stats.min_damage_effect = 1
	self.melee_weapons.x46.stats.max_damage_effect = 1
	self.melee_weapons.x46.stats.charge_time = 1.5
	self.melee_weapons.x46.stats.range = 185
	self.melee_weapons.x46.stats.concealment = 30
	self.melee_weapons.dingdong = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.dingdong.name_id = "bm_melee_dingdong"
	self.melee_weapons.dingdong.anim_global_param = "melee_baseballbat"
	self.melee_weapons.dingdong.type = "axe"
	self.melee_weapons.dingdong.dlc = "gage_pack_assault"
	self.melee_weapons.dingdong.texture_bundle_folder = "gage_pack_assault"
	self.melee_weapons.dingdong.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.dingdong.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_mel_dingdong/wpn_fps_mel_dingdong"
	self.melee_weapons.dingdong.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_mel_dingdong/wpn_third_mel_dingdong"
	self.melee_weapons.dingdong.stats.weapon_type = "blunt"
	self.melee_weapons.dingdong.stats.min_damage = 3
	self.melee_weapons.dingdong.stats.max_damage = 9.2
	self.melee_weapons.dingdong.stats.min_damage_effect = 4
	self.melee_weapons.dingdong.stats.max_damage_effect = 3.2
	self.melee_weapons.dingdong.stats.charge_time = 2.5
	self.melee_weapons.dingdong.stats.range = 275
	self.melee_weapons.dingdong.stats.weapon_type = "blunt"
	self.melee_weapons.dingdong.sounds = {}
	self.melee_weapons.dingdong.repeat_expire_t = 1
	self.melee_weapons.dingdong.expire_t = 1.2
	self.melee_weapons.dingdong.sounds.equip = "ding_dong_equip"
	self.melee_weapons.dingdong.sounds.hit_air = "ding_dong_hit_air"
	self.melee_weapons.dingdong.sounds.hit_gen = "ding_dong_hit_gen"
	self.melee_weapons.dingdong.sounds.hit_body = "ding_dong_hit_body"
	self.melee_weapons.dingdong.sounds.charge = "knife_charge"
	self.melee_weapons.dingdong.melee_damage_delay = 0.2
	self.melee_weapons.dingdong.stats.concealment = 20
	self.melee_weapons.bayonet = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.bayonet.name_id = "bm_melee_bayonet"
	self.melee_weapons.bayonet.type = "knife"
	self.melee_weapons.bayonet.dlc = "gage_pack_assault"
	self.melee_weapons.bayonet.texture_bundle_folder = "gage_pack_assault"
	self.melee_weapons.bayonet.align_objects = {
		"a_weapon_left"
	}
	self.melee_weapons.bayonet.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_mel_bayonet/wpn_fps_mel_bayonet"
	self.melee_weapons.bayonet.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_mel_bayonet/wpn_third_mel_bayonet"
	self.melee_weapons.bayonet.anim_global_param = "melee_knife2"
	self.melee_weapons.bayonet.repeat_expire_t = 0.5
	self.melee_weapons.bayonet.expire_t = 1
	self.melee_weapons.bayonet.stats.min_damage = 2
	self.melee_weapons.bayonet.stats.max_damage = 8
	self.melee_weapons.bayonet.stats.min_damage_effect = 1
	self.melee_weapons.bayonet.stats.max_damage_effect = 0.445
	self.melee_weapons.bayonet.stats.charge_time = 1.5
	self.melee_weapons.bayonet.stats.range = 185
	self.melee_weapons.bayonet.stats.concealment = 29
	self.melee_weapons.bullseye = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.bullseye.name_id = "bm_melee_bullseye"
	self.melee_weapons.bullseye.anim_global_param = "melee_axe"
	self.melee_weapons.bullseye.type = "axe"
	self.melee_weapons.bullseye.dlc = "gage_pack_assault"
	self.melee_weapons.bullseye.texture_bundle_folder = "gage_pack_assault"
	self.melee_weapons.bullseye.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.bullseye.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_mel_bullseye/wpn_fps_mel_bullseye"
	self.melee_weapons.bullseye.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_mel_bullseye/wpn_third_mel_bullseye"
	self.melee_weapons.bullseye.sounds = {}
	self.melee_weapons.bullseye.sounds.equip = "bullseye_equip"
	self.melee_weapons.bullseye.sounds.hit_air = "bullseye_hit_air"
	self.melee_weapons.bullseye.sounds.hit_gen = "bullseye_hit_gen"
	self.melee_weapons.bullseye.sounds.hit_body = "bullseye_hit_body"
	self.melee_weapons.bullseye.sounds.charge = "bullseye_charge"
	self.melee_weapons.bullseye.stats.min_damage = 3
	self.melee_weapons.bullseye.stats.max_damage = 8
	self.melee_weapons.bullseye.stats.min_damage_effect = 0.5
	self.melee_weapons.bullseye.stats.max_damage_effect = 0.6
	self.melee_weapons.bullseye.stats.charge_time = 1.6
	self.melee_weapons.bullseye.stats.range = 185
	self.melee_weapons.bullseye.stats.concealment = 27
	self.melee_weapons.baseballbat = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.baseballbat.name_id = "bm_melee_bat"
	self.melee_weapons.baseballbat.anim_global_param = "melee_baseballbat_miami"
	self.melee_weapons.baseballbat.dlc = "hl_miami"
	self.melee_weapons.baseballbat.texture_bundle_folder = "hl_miami"
	self.melee_weapons.baseballbat.type = "axe"
	self.melee_weapons.baseballbat.align_objects = {
		"a_weapon_left"
	}
	self.melee_weapons.baseballbat.unit = "units/pd2_dlc_miami/weapons/wpn_fps_mel_baseballbat/wpn_fps_mel_baseballbat"
	self.melee_weapons.baseballbat.third_unit = "units/pd2_dlc_miami/weapons/wpn_fps_mel_baseballbat/wpn_third_mel_baseballbat"
	self.melee_weapons.baseballbat.sounds = {}
	self.melee_weapons.baseballbat.sounds.equip = "bat_equip"
	self.melee_weapons.baseballbat.sounds.hit_air = "bat_hit_air"
	self.melee_weapons.baseballbat.sounds.hit_gen = "baseballbat_hit_gen"
	self.melee_weapons.baseballbat.sounds.hit_body = "baseballbat_hit_body"
	self.melee_weapons.baseballbat.sounds.charge = "bat_charge"
	self.melee_weapons.baseballbat.stats.min_damage = 3.5
	self.melee_weapons.baseballbat.stats.max_damage = 6
	self.melee_weapons.baseballbat.stats.min_damage_effect = 4
	self.melee_weapons.baseballbat.stats.max_damage_effect = 3.2
	self.melee_weapons.baseballbat.stats.charge_time = 2.4
	self.melee_weapons.baseballbat.stats.range = 250
	self.melee_weapons.baseballbat.stats.concealment = 24
	self.melee_weapons.baseballbat.repeat_expire_t = 0.9
	self.melee_weapons.baseballbat.expire_t = 1.2
	self.melee_weapons.baseballbat.melee_damage_delay = 0.2
	self.melee_weapons.cleaver = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.cleaver.name_id = "bm_melee_cleaver"
	self.melee_weapons.cleaver.anim_global_param = "melee_cleaver"
	self.melee_weapons.cleaver.dlc = "hl_miami"
	self.melee_weapons.cleaver.texture_bundle_folder = "hl_miami"
	self.melee_weapons.cleaver.type = "axe"
	self.melee_weapons.cleaver.align_objects = {
		"a_weapon_left"
	}
	self.melee_weapons.cleaver.unit = "units/pd2_dlc_miami/weapons/wpn_fps_mel_cleaver/wpn_fps_mel_cleaver"
	self.melee_weapons.cleaver.third_unit = "units/pd2_dlc_miami/weapons/wpn_fps_mel_cleaver/wpn_third_mel_cleaver"
	self.melee_weapons.cleaver.sounds = {}
	self.melee_weapons.cleaver.sounds.equip = "cleaver_equip"
	self.melee_weapons.cleaver.sounds.hit_air = "cleaver_hit_air"
	self.melee_weapons.cleaver.sounds.hit_gen = "cleaver_hit_gen"
	self.melee_weapons.cleaver.sounds.hit_body = "cleaver_hit_body"
	self.melee_weapons.cleaver.sounds.charge = "cleaver_charge"
	self.melee_weapons.cleaver.stats.min_damage = 3
	self.melee_weapons.cleaver.stats.max_damage = 9.5
	self.melee_weapons.cleaver.stats.min_damage_effect = 0.5
	self.melee_weapons.cleaver.stats.max_damage_effect = 0.6
	self.melee_weapons.cleaver.stats.charge_time = 2.5
	self.melee_weapons.cleaver.stats.range = 185
	self.melee_weapons.cleaver.stats.concealment = 26
	self.melee_weapons.fireaxe = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.fireaxe.name_id = "bm_melee_fireaxe"
	self.melee_weapons.fireaxe.anim_global_param = "melee_fireaxe"
	self.melee_weapons.fireaxe.dlc = "hl_miami"
	self.melee_weapons.fireaxe.texture_bundle_folder = "hl_miami"
	self.melee_weapons.fireaxe.type = "axe"
	self.melee_weapons.fireaxe.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.fireaxe.unit = "units/pd2_dlc_miami/weapons/wpn_fps_mel_fireaxe/wpn_fps_mel_fireaxe"
	self.melee_weapons.fireaxe.third_unit = "units/pd2_dlc_miami/weapons/wpn_fps_mel_fireaxe/wpn_third_mel_fireaxe"
	self.melee_weapons.fireaxe.sounds = {}
	self.melee_weapons.fireaxe.sounds.equip = "fire_axe_equip"
	self.melee_weapons.fireaxe.sounds.hit_air = "fire_axe_hit_air"
	self.melee_weapons.fireaxe.sounds.hit_gen = "fire_axe_hit_gen"
	self.melee_weapons.fireaxe.sounds.hit_body = "fire_axe_hit_body"
	self.melee_weapons.fireaxe.sounds.charge = "knife_charge"
	self.melee_weapons.fireaxe.stats.min_damage = 9
	self.melee_weapons.fireaxe.stats.max_damage = 14
	self.melee_weapons.fireaxe.stats.min_damage_effect = 1
	self.melee_weapons.fireaxe.stats.max_damage_effect = 1
	self.melee_weapons.fireaxe.stats.charge_time = 3.5
	self.melee_weapons.fireaxe.stats.range = 275
	self.melee_weapons.fireaxe.stats.concealment = 20
	self.melee_weapons.fireaxe.repeat_expire_t = 1.6
	self.melee_weapons.fireaxe.expire_t = 1.8
	self.melee_weapons.fireaxe.melee_damage_delay = 0.4
	self.melee_weapons.machete = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.machete.name_id = "bm_melee_machete"
	self.melee_weapons.machete.anim_global_param = "melee_machete"
	self.melee_weapons.machete.dlc = "hl_miami"
	self.melee_weapons.machete.texture_bundle_folder = "hl_miami"
	self.melee_weapons.machete.type = "axe"
	self.melee_weapons.machete.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.machete.unit = "units/pd2_dlc_miami/weapons/wpn_fps_mel_machete/wpn_fps_mel_machete"
	self.melee_weapons.machete.third_unit = "units/pd2_dlc_miami/weapons/wpn_fps_mel_machete/wpn_third_mel_machete"
	self.melee_weapons.machete.sounds = {}
	self.melee_weapons.machete.sounds.equip = "machete_equip"
	self.melee_weapons.machete.sounds.hit_air = "machete_hit_air"
	self.melee_weapons.machete.sounds.hit_gen = "machete_hit_gen"
	self.melee_weapons.machete.sounds.hit_body = "machete_hit_body"
	self.melee_weapons.machete.sounds.charge = "machete_charge"
	self.melee_weapons.machete.stats.min_damage = 4
	self.melee_weapons.machete.stats.max_damage = 8.5
	self.melee_weapons.machete.stats.min_damage_effect = 0.5
	self.melee_weapons.machete.stats.max_damage_effect = 0.6
	self.melee_weapons.machete.stats.charge_time = 2.7
	self.melee_weapons.machete.stats.range = 225
	self.melee_weapons.machete.expire_t = 1.1
	self.melee_weapons.machete.repeat_expire_t = 0.8
	self.melee_weapons.machete.stats.concealment = 24
	self.melee_weapons.briefcase = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.briefcase.name_id = "bm_melee_briefcase"
	self.melee_weapons.briefcase.anim_global_param = "melee_briefcase"
	self.melee_weapons.briefcase.dlc = "hlm_game"
	self.melee_weapons.briefcase.texture_bundle_folder = "hl_miami"
	self.melee_weapons.briefcase.type = "axe"
	self.melee_weapons.briefcase.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.briefcase.unit = "units/pd2_dlc_miami/weapons/wpn_fps_mel_briefcase/wpn_fps_mel_briefcase"
	self.melee_weapons.briefcase.third_unit = "units/pd2_dlc_miami/weapons/wpn_fps_mel_briefcase/wpn_third_mel_briefcase"
	self.melee_weapons.briefcase.sounds = {}
	self.melee_weapons.briefcase.sounds.equip = "suitcase_equip"
	self.melee_weapons.briefcase.sounds.hit_air = "suitcase_hit_air"
	self.melee_weapons.briefcase.sounds.hit_gen = "suitcase_hit_gen"
	self.melee_weapons.briefcase.sounds.hit_body = "suitcase_hit_body"
	self.melee_weapons.briefcase.sounds.charge = "suitcase_charge"
	self.melee_weapons.briefcase.stats.min_damage = 0.68
	self.melee_weapons.briefcase.stats.max_damage = 1.68
	self.melee_weapons.briefcase.stats.min_damage_effect = 10
	self.melee_weapons.briefcase.stats.max_damage_effect = 10
	self.melee_weapons.briefcase.stats.charge_time = 2
	self.melee_weapons.briefcase.stats.range = 185
	self.melee_weapons.briefcase.stats.concealment = 30
	self.melee_weapons.briefcase.repeat_expire_t = 1
	self.melee_weapons.briefcase.expire_t = 1.2
	self.melee_weapons.briefcase.melee_damage_delay = 0.2
	self:_add_desc_from_name_macro(self.melee_weapons)
end
