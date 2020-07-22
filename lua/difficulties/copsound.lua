function CopSound:init(unit)
	self._unit = unit
	self._speak_expire_t = 0
	local char_tweak = tweak_data.character[unit:base()._tweak_table]

	self:set_voice_prefix(nil)

	local nr_variations = char_tweak.speech_prefix_count
			
	if char_tweak.speech_prefix_p1 == "l5d" then
		self._prefix = (char_tweak.speech_prefix_p1 or "") .. "_"	
	elseif self._unit:name() == Idstring("units/payday2/characters/ene_shield_1/ene_shield_1") or self._unit:name() == Idstring("units/payday2/characters/ene_shield_2/ene_shield_2") then
		self._prefix = ("l5d") .. "_"		
	elseif self._unit:name() == Idstring("units/payday2/characters/ene_swat_1/ene_swat_1") or self._unit:name() == Idstring("units/payday2/characters/ene_swat_2/ene_swat_2") then
		self._prefix = ("l") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. ("d") .. "_"	
	elseif self._unit:name() == Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1") or self._unit:name() == Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870") then
		self._prefix = ("l") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. ("d") .. "_"			
	elseif self._unit:name() == Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1") or self._unit:name() == Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2") then
		self._prefix = ("l") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. ("d") .. "_"				
	elseif self._unit:name() == Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1") or self._unit:name() == Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870") then
		self._prefix = ("l") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. ("d") .. "_"					
	elseif self._unit:name() == Idstring("units/payday2/characters/ene_zeal_swat/ene_zeal_swat") or self._unit:name() == Idstring("units/payday2/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy") then
		self._prefix = ("l") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. ("d") .. "_"				
	--husks		
	elseif self._unit:name() == Idstring("units/payday2/characters/ene_shield_1/ene_shield_1_husk") or self._unit:name() == Idstring("units/payday2/characters/ene_shield_2/ene_shield_2_husk") then
		self._prefix = ("l5d") .. "_"		
	elseif self._unit:name() == Idstring("units/payday2/characters/ene_swat_1/ene_swat_1_husk") or self._unit:name() == Idstring("units/payday2/characters/ene_swat_2/ene_swat_2_husk") then
		self._prefix = ("l") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. ("d") .. "_"	
	elseif self._unit:name() == Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1_husk") or self._unit:name() == Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870_husk") then
		self._prefix = ("l") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. ("d") .. "_"				
	elseif self._unit:name() == Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1_husk") or self._unit:name() == Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2_husk") then
		self._prefix = ("l") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. ("d") .. "_"				
	elseif self._unit:name() == Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1_husk") or self._unit:name() == Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870_husk") then
		self._prefix = ("l") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. ("d") .. "_"					
	elseif self._unit:name() == Idstring("units/payday2/characters/ene_zeal_swat/ene_zeal_swat_husk") or self._unit:name() == Idstring("units/payday2/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy_husk") then
		self._prefix = ("l") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. ("d") .. "_"	
	else
		self._prefix = (char_tweak.speech_prefix_p1 or "") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. (char_tweak.speech_prefix_p2 or "") .. "_"
	end

	unit:base():post_init()
end
