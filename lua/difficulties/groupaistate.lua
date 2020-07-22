-- Fix for the bug when there is too many dozers by andole
if string.lower(RequiredScript) == "lib/managers/group_ai_states/groupaistatebesiege" then

	local fixed = false
	local origfunc2 = GroupAIStateBesiege._get_special_unit_type_count
	function GroupAIStateBesiege:_get_special_unit_type_count(special_type, ...)
		if special_type == 'tank_city' or special_type == 'tank_mini' or special_type == 'tank_medic' then
			fixed = true
		end
		
		if not fixed and special_type == 'tank' then
			local res = origfunc2(self, 'tank', ...) or 0
			res = res + (origfunc2(self, 'tank_city', ...) or 0)
			res = res + (origfunc2(self, 'tank_mini', ...) or 0)
			res = res + (origfunc2(self, 'tank_medic', ...) or 0)
			return res
		end
		
		return origfunc2(self, special_type, ...)
	end

elseif string.lower(RequiredScript) == "lib/managers/group_ai_states/groupaistatebase" then

	local origfunc3 = GroupAIStateBase._init_misc_data
	function GroupAIStateBase:_init_misc_data(...)
		origfunc3(self, ...)
		self._special_unit_types = self._special_unit_types or {}
		self._special_unit_types['tank_city'] = true
		self._special_unit_types['tank_mini'] = true
		self._special_unit_types['tank_medic'] = true
	end

	local origfunc2 = GroupAIStateBase.on_simulation_started
	function GroupAIStateBase:on_simulation_started(...)
		origfunc2(self, ...)
		self._special_unit_types = self._special_unit_types or {}
		self._special_unit_types['tank_city'] = true
		self._special_unit_types['tank_mini'] = true
		self._special_unit_types['tank_medic'] = true
	end

end
