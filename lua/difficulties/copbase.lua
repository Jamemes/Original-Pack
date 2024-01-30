local data = CopBase.default_weapon_name
function CopBase:default_weapon_name()
	return tweak_data.character:custom_weapons(self._unit) or data(self)
end
