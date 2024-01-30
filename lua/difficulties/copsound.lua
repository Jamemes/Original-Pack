local data = CopSound.say
function CopSound:say(sound_name, sync, skip_prefix, important, callback)
	if not sound_name then
		return
	end
	
	data(self, sound_name, sync, skip_prefix, important, callback)
end

function CopSound:init(unit)
	self._unit = unit
	self._speak_expire_t = 0
	local char_tweak = tweak_data.character[unit:base()._tweak_table]

	self:set_voice_prefix(nil)

	local nr_variations = char_tweak.speech_prefix_count
							
	if char_tweak.speech_prefix_p1 == "l5d" then
		self._prefix = (char_tweak.speech_prefix_p1 or "") .. "_"
	elseif	self._unit:name() == Idstring("units/payday2/characters/ene_shield_1/ene_shield_1") or
			self._unit:name() == Idstring("units/payday2/characters/ene_shield_1/ene_shield_1_husk") or
			self._unit:name() == Idstring("units/payday2/characters/ene_shield_2/ene_shield_2") or
			self._unit:name() == Idstring("units/payday2/characters/ene_shield_2/ene_shield_2_husk") then
			
		self._prefix = ("l5d") .. "_"
		
	elseif	self._unit:name() == Idstring("units/payday2/characters/ene_swat_1/ene_swat_1") or
			self._unit:name() == Idstring("units/payday2/characters/ene_swat_1/ene_swat_1_husk") or
			self._unit:name() == Idstring("units/payday2/characters/ene_swat_2/ene_swat_2") or
			self._unit:name() == Idstring("units/payday2/characters/ene_swat_2/ene_swat_2_husk") or
			self._unit:name() == Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1") or
			self._unit:name() == Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1_husk") or
			self._unit:name() == Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870") or
			self._unit:name() == Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870_husk") or
			self._unit:name() == Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1") or
			self._unit:name() == Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1_husk") or
			self._unit:name() == Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2") or
			self._unit:name() == Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2_husk") or
			self._unit:name() == Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1") or
			self._unit:name() == Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1_husk") or
			self._unit:name() == Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870") or
			self._unit:name() == Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870_husk") or
			self._unit:name() == Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1") or
			self._unit:name() == Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1_husk") or
			self._unit:name() == Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2") or
			self._unit:name() == Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2_husk") or
			self._unit:name() == Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3") or
			self._unit:name() == Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3_husk") or
			self._unit:name() == Idstring("units/payday2/characters/ene_city_heavy_m4/ene_city_heavy_m4") or
			self._unit:name() == Idstring("units/payday2/characters/ene_city_heavy_m4/ene_city_heavy_m4_husk") or
			self._unit:name() == Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36") or
			self._unit:name() == Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36_husk") or
			self._unit:name() == Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870") or
			self._unit:name() == Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870_husk") or
			self._unit:name() == Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy") or
			self._unit:name() == Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy_husk") or
			self._unit:name() == Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_fbi/ene_murkywater_heavy_fbi") or
			self._unit:name() == Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_fbi/ene_murkywater_heavy_fbi_husk") or
			self._unit:name() == Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36") or
			self._unit:name() == Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36_husk") or
			self._unit:name() == Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun") or
			self._unit:name() == Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun_husk") or
			self._unit:name() == Idstring("units/pd2_dlc_berry/characters/ene_murkywater_no_light/ene_murkywater_no_light") or
			self._unit:name() == Idstring("units/pd2_dlc_berry/characters/ene_murkywater_no_light/ene_murkywater_no_light_husk") or
			self._unit:name() == Idstring("units/payday2/characters/ene_murkywater_1/ene_murkywater_1") or
			self._unit:name() == Idstring("units/payday2/characters/ene_murkywater_1/ene_murkywater_1_husk") or
			self._unit:name() == Idstring("units/payday2/characters/ene_murkywater_2/ene_murkywater_2") or
			self._unit:name() == Idstring("units/payday2/characters/ene_murkywater_2/ene_murkywater_2_husk") then
			
		self._prefix = ("l") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. ("d") .. "_"
		
	else
		self._prefix = (char_tweak.speech_prefix_p1 or "") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. (char_tweak.speech_prefix_p2 or "") .. "_"
	end

	unit:base():post_init()
end