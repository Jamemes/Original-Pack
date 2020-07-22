local num = "1.1.1"

local version = "Version " .. num

function MenuNodeMainGui:_add_version_string()
	if alive(self._version_string) then
		self._version_string:parent():remove(self._version_string)

		self._version_string = nil
	end
	
	if alive(self._vanilla_version_string) then
		self._vanilla_version_string:parent():remove(self._vanilla_version_string)

		self._vanilla_version_string = nil
	end

	if Application:debug_enabled() or SystemInfo:platform() == Idstring("WIN32") then
		local vanilla_version = Application:version()
		self._vanilla_version_string = self.ws:panel():text({
			name = "vanilla_version_string",
			vertical = "bottom",
			align = "right",
			alpha = 0.5,
			text = vanilla_version,
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size
		})
		self._version_string = self.ws:panel():text({
			name = "version_string",
			vertical = "bottom",
			align = "left",
			alpha = 1,
			text = version,
			font = tweak_data.menu.pd2_large_font,
			font_size = 26
		})
		self._original_pack_logo = self.ws:panel():bitmap({
			texture = "guis/textures/menu_original_pack_logo",
			w = 504 / 2.1,
			h = 177 / 2.1,
			y = 102 * 6,
			rotation = 360
		})
		local function fade_in(o)
			local from = Color(0, 1, 1, 1)
			local to = Color(1, 1, 1, 1)
			local t = 0

			o:set_color(from)

			while t < 6 do
				local dt = coroutine.yield()
				t = t + dt
			end

			t = 0

			while t < 1 do
				local dt = coroutine.yield()
				t = t + dt

				o:set_color(from * (1 - t) + to * t)
			end

			o:set_color(to)
		end
		local function fade_out(o)
			local from = Color(1, 1, 1, 1)
			local to = Color(0, 1, 1, 1)
			local t = 0

			o:set_color(from)

			while t < 6 do
				local dt = coroutine.yield()
				t = t + dt
			end

			t = 0

			while t < 1 do
				local dt = coroutine.yield()
				t = t + dt

				o:set_color(from * (1 - t) + to * t)
			end

			o:set_color(to)
		end

		self._original_pack_logo:animate(fade_out)
		self._version_string:animate(fade_in)
		self._vanilla_version_string:animate(fade_in)
	end
end