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
	elseif unit:base()._tweak_table == "shield" then
		self._prefix = ("l5d") .. "_"
	elseif unit:base()._tweak_table == "swat" or unit:base()._tweak_table == "heavy_swat" or unit:base()._tweak_table == "fbi_swat" or unit:base()._tweak_table == "fbi_heavy_swat" or unit:base()._tweak_table ==  "city_swat" then 
		self._prefix = ("l") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. ("d") .. "_"
	else
		self._prefix = (char_tweak.speech_prefix_p1 or "") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. (char_tweak.speech_prefix_p2 or "") .. "_"
	end

	unit:base():post_init()
end