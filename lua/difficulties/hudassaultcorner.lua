local data = HUDAssaultCorner.sync_start_assault
function HUDAssaultCorner:sync_start_assault(assault_number)
	data(self, assault_number)																																											
	if managers.job:is_current_job_professional() or managers.crime_spree:is_active() then
		self:_hide_hostages()
	end
end

local data = HUDAssaultCorner._update_assault_hud_color
function HUDAssaultCorner:_update_assault_hud_color(color)
	data(self, color)
	local assault_panel = self._hud_panel:child("assault_panel")
	local icon_assaultbox = assault_panel:child("icon_assaultbox")
	if managers.job:is_current_job_professional() or managers.crime_spree:is_active() then
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
			o:set_alpha((math.sin(t * 180)))
			
		end
	end
	
	while t > 0 do
		local dt = coroutine.yield()
		t = t - dt
		local alpha = math.round(math.abs(math.sin(t * 360 * 2)))

		icon_assaultbox:set_alpha(alpha)
	end

	local is_whisper_mode = managers.groupai and managers.groupai:state():whisper_mode()
	if not is_whisper_mode and (managers.job:is_current_job_professional() or managers.crime_spree:is_active()) then
		icon_assaultbox:animate(anim_pulse_glow)
	else
		icon_assaultbox:set_alpha(1)
	end
end

function HUDAssaultCorner:_animate_text(text_panel, bg_box, color, color_function)
	local text_list = (bg_box or self._bg_box):script().text_list
	local text_index = 0
	local texts = {}
	local padding = 10

	local function create_new_text(text_panel, text_list, text_index, texts)
		if texts[text_index] and texts[text_index].text then
			text_panel:remove(texts[text_index].text)

			texts[text_index] = nil
		end

		local text_id = text_list[text_index]
		local text_string = ""

		if type(text_id) == "string" then
			text_string = managers.localization:to_upper_text(text_id)
		elseif text_id == Idstring("risk") then
			local use_stars = true

			if managers.crime_spree:is_active() then
				text_string = text_string .. managers.localization:to_upper_text("menu_cs_level", {
					level = managers.experience:cash_string(managers.crime_spree:server_spree_level(), "")
				})
				use_stars = false
			end

			if use_stars then
				local star = managers.job:current_difficulty_stars()
				local diff_stars = star == 4 and 5 or star == 5 and 4 or star
				for i = 1, diff_stars, 1 do
					text_string = text_string .. managers.localization:get_default_macro("BTN_SKULL")
				end
			end
		end

		local mod_color = color_function and color_function() or color or self._assault_color
		local text = text_panel:text({
			vertical = "center",
			h = 10,
			w = 10,
			align = "center",
			blend_mode = "add",
			layer = 1,
			text = text_string,
			color = mod_color,
			font_size = tweak_data.hud_corner.assault_size,
			font = tweak_data.hud_corner.assault_font
		})
		local _, _, w, h = text:text_rect()

		text:set_size(w, h)

		texts[text_index] = {
			x = text_panel:w() + w * 0.5 + padding * 2,
			text = text
		}
	end

	while true do
		local dt = coroutine.yield()
		local last_text = texts[text_index]

		if last_text and last_text.text then
			if last_text.x + last_text.text:w() * 0.5 + padding < text_panel:w() then
				text_index = text_index % #text_list + 1

				create_new_text(text_panel, text_list, text_index, texts)
			end
		else
			text_index = text_index % #text_list + 1

			create_new_text(text_panel, text_list, text_index, texts)
		end

		local speed = 90

		for i, data in pairs(texts) do
			if data.text then
				data.x = data.x - dt * speed

				data.text:set_center_x(data.x)
				data.text:set_center_y(text_panel:h() * 0.5)

				if data.x + data.text:w() * 0.5 < 0 then
					text_panel:remove(data.text)

					data.text = nil
				elseif color_function then
					data.text:set_color(color_function())
				end
			end
		end
	end
end