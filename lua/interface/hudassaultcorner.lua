function HUDAssaultCorner:sync_start_assault(assault_number)
	if self._point_of_no_return or self._casing then
		return
	end

	local color = self._assault_color

	if self._assault_mode == "phalanx" then
		color = self._vip_assault_color
	end

	self:_update_assault_hud_color(color)
	self:set_assault_wave_number(assault_number)

	self:_set_hostage_offseted(true)
	self._start_assault_after_hostage_offset = true
		
	if managers.job:is_current_job_professional() then
		self:_hide_hostages()
	end
end
function HUDAssaultCorner:_update_assault_hud_color(color)
	self._current_assault_color = color

	self._bg_box:child("left_top"):set_color(color)
	self._bg_box:child("left_bottom"):set_color(color)
	self._bg_box:child("right_top"):set_color(color)
	self._bg_box:child("right_bottom"):set_color(color)

	local assault_panel = self._hud_panel:child("assault_panel")
	local icon_assaultbox = assault_panel:child("icon_assaultbox")

	if managers.job:is_current_job_professional() then
		icon_assaultbox:set_color(tweak_data.screen_colors.pro_color)
	else
		icon_assaultbox:set_color(color)
	end
end

function HUDAssaultCorner:_show_icon_assaultbox(icon_assaultbox)
	local TOTAL_T = 2
	local t = TOTAL_T
	local anim_pulse_glow = function(o)
		local t = 0
		local dt = 0
		while true do
			dt = coroutine.yield()
			t = (t + dt * 0.5) % 1
			o:set_alpha((math.sin(t * 180) * 0.7 + 0.2) * 1)
			
		end
	end
	
	while t > 0 do
		local dt = coroutine.yield()
		t = t - dt
		local alpha = math.round(math.abs(math.sin(t * 360 * 2)))

		icon_assaultbox:set_alpha(alpha)
	end

	if managers.job:is_current_job_professional() then
		icon_assaultbox:animate(anim_pulse_glow)
	else
		icon_assaultbox:set_alpha(1)
	end
end