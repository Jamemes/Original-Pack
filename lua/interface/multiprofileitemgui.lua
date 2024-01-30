local data = MultiProfileItemGui.init
function MultiProfileItemGui:init(ws, panel)
	data(self, ws, panel)
	if managers.experience:current_rank() < tweak_data.unlock_profiles then
		self._panel:hide()
	else
		self._panel:show()
	end
end

local data = MultiProfileItemGui.mouse_moved
function MultiProfileItemGui:mouse_moved(x, y)
	if managers.experience:current_rank() < tweak_data.unlock_profiles then
		return
	end
	return data(self, x, y)
end

local data = MultiProfileItemGui.key_press
function MultiProfileItemGui:key_press(o, k)
	if not self._editing and not managers.experience:current_rank() < tweak_data.unlock_profiles then
		return
	end
	data(self, o, k)
end

local data = MultiProfileItemGui.key_release
function MultiProfileItemGui:key_release(o, k)
	if not self._editing and not managers.experience:current_rank() < tweak_data.unlock_profiles then
		return
	end
	data(self, o, k)
end