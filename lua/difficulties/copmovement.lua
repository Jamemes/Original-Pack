local data = CopMovement.post_init
function CopMovement:post_init()
	data(self, unit)
	
	local greens = {
		"units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1",
		"units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1",
		"units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2",
		"units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_2/ene_murkywater_bulldozer_2",
		"units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870",
		"units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870"
	}
	local blacks = {
		"units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2",
		"units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2",
		"units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3",
		"units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_3/ene_murkywater_bulldozer_3",
		"units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga",
		"units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_saiga/ene_swat_dozer_policia_federale_saiga"
	}

	for _, path in pairs(greens) do
		if self._unit:name() == Idstring(path) or self._unit:name() == Idstring(path .. "_husk") then
			self._action_common_data.char_tweak = tweak_data.character.tank_green
		end
	end
	for _, path in pairs(blacks) do
		if self._unit:name() == Idstring(path) or self._unit:name() == Idstring(path .. "_husk") then
			self._action_common_data.char_tweak = tweak_data.character.tank_black
		end
	end
end