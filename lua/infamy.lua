if string.lower(RequiredScript) == "lib/units/props/infamycardgui" then
	function InfamyCardGui:custom_symbol(panel, y, x, w, h, rotation)
		local rank = managers.experience:current_rank()
		local icon_color = (Color.white - (managers.experience:rank_icon_color(rank) or Color(0, 0, 0))):with_alpha(1)
		local hun = rank >= 401 and 300 or rank >= 301 and 225 or rank >= 201 and 150 or rank >= 101 and 75 or 0
		local symbol = panel:bitmap({
			align = "center",
			y = y,
			x = x,
			rotation = rotation or 0,
			layer = 1,
			blend_mode = "sub",
			texture = "guis/textures/pd2/infamous_symbol_hq",
			texture_rect = {
				0 + hun,
				0,
				75,
				95
			},
			color = icon_color,
			w = w or 50,
			h = h or 65
		})
		symbol:set_render_template(Idstring("OverlayVertexColorTextured"))
	end
	function InfamyCardGui:show_rank(rank)
		local hun = rank >= 500 and 500 or rank >= 400 and 400 or rank >= 300 and 300 or rank >= 200 and 200 or rank >= 100 and 100 or 0
		if rank == 1 + hun then
		else
			self:clear_gui()
			if self._unit:damage() then
				self._unit:damage():run_sequence_simple("enable_card_blank")
			end
		end
		
		local rank_icon, icon_texture_rect = managers.experience:rank_icon_data(rank)
		local icon_color = (Color.white - (managers.experience:rank_icon_color(rank) or Color(0, 0, 0))):with_alpha(1)
		local tx, ty, tw, th = unpack(icon_texture_rect)
		local icon_w = 30
		local icon_h = 30
		local top = 22
		local left_top_icon = self._icon_gui:bitmap({
			y = 9 + top,
			x = 4,
			blend_mode = "sub",
			texture = rank_icon,
			texture_rect = {
				tx,
				ty,
				tw,
				th
			},
			color = icon_color,
			w = icon_w,
			h = icon_h
		})
	
		local font = tweak_data.menu.pd2_medium_font
		local font_size = tweak_data.menu.pd2_medium_font_size * 1.2
		local rank_string = tostring(managers.experience:current_rank() + 1)
		local rank_text_top = self._text_gui:text({
			vertical = "center",
			align = "center",
			blend_mode = "sub",
			layer = 1,
			font = font,
			font_size = font_size,
			text = rank_string,
			color = icon_color
		})
		
		ExtendedPanel.make_fine_text(rank_text_top)
		rank_text_top:set_center_x(left_top_icon:center())
		rank_text_top:set_render_template(Idstring("OverlayText"))
		local right_bottom_icon = self._icon_gui:bitmap({
			blend_mode = "sub",
			texture = rank_icon,
			texture_rect = {
				tx + tw,
				ty + th,
				-tw,
				-th
			},
			color = icon_color,
			x = self._icon_gui:w() - 3 - icon_w,
			y = self._icon_gui:h() - 7 - icon_h - top,
			w = icon_w,
			h = icon_h
		})
		
		local rank_text_bottom = self._text_gui:text({
			blend_mode = "sub",
			rotation = 180,
			layer = 1,
			font = font,
			font_size = font_size,
			text = rank_string,
			color = icon_color,
			vertical = "center",
			align = "center"
		})

		ExtendedPanel.make_fine_text(rank_text_bottom)
		rank_text_bottom:set_bottom(right_bottom_icon:top() + 12)
		rank_text_bottom:set_center_x(right_bottom_icon:center())
		rank_text_bottom:set_render_template(Idstring("OverlayText"))
		
		
		local panel, h, w = self._icon_gui, self._icon_gui:h(), self._icon_gui:w()
		local r1 = rank == 1 + hun 
		local r2 = rank == 2 + hun 
		local r3 = rank == 3 + hun 
		local r4 = rank == 4 + hun 
		local r5 = rank == 5 + hun 
		local r6 = rank == 6 + hun 
		local r7 = rank == 7 + hun 
		local r8 = rank == 8 + hun 
		local r9 = rank == 9 + hun 
		local r10 = rank == 10 + hun
		local r11 = rank == 11 + hun
		local r12 = rank == 12 + hun
		local r13 = rank == 13 + hun
		local r14 = rank >= 14 + hun
		
		local counter = rank_string - hun - 14
		local cards = r1 and "1" or 
		r2 and "2" or 
		r3 and "3" or 
		r4 and "4" or 
		r5 and "5" or 
		r6 and "6" or 
		r7 and "7" or 
		r8 and "8" or 
		r9 and "9" or 
		r10 and "10" or 
		r11 and "J" or 
		r12 and "Q" or 
		r13 and "K" or 
		r14 and counter or
		hun and "A"
		
		
		rank_text_bottom:set_text(cards)
		rank_text_top:set_text(cards)
		
		if r1 then
			rank_text_bottom:hide()
			rank_text_top:hide()
		end
		
		if r3 or r5 then
			InfamyCardGui:custom_symbol(panel, h * 0.4, w * 0.38)
		end

		if r2 then
			InfamyCardGui:custom_symbol(panel, h * 0.25, w * 0.38)
			InfamyCardGui:custom_symbol(panel, h * 0.55, w * 0.38)
		elseif r3 then
			InfamyCardGui:custom_symbol(panel, h * 0.15, w * 0.38)
			InfamyCardGui:custom_symbol(panel, h * 0.65, w * 0.38)
		elseif r4 or r5 then
			InfamyCardGui:custom_symbol(panel, h * 0.17, w * 0.21)
			InfamyCardGui:custom_symbol(panel, h * 0.63, w * 0.21)
			InfamyCardGui:custom_symbol(panel, h * 0.17, w * 0.56)
			InfamyCardGui:custom_symbol(panel, h * 0.63, w * 0.56)
		elseif r6 then
			InfamyCardGui:custom_symbol(panel, h * 0.18, w * 0.23, 37, 52)
			InfamyCardGui:custom_symbol(panel, h * 0.42, w * 0.23, 37, 52)
			InfamyCardGui:custom_symbol(panel, h * 0.66, w * 0.23, 37, 52)
			InfamyCardGui:custom_symbol(panel, h * 0.18, w * 0.59, 37, 52)
			InfamyCardGui:custom_symbol(panel, h * 0.42, w * 0.59, 37, 52)
			InfamyCardGui:custom_symbol(panel, h * 0.66, w * 0.59, 37, 52)
		elseif r7 or r8 then
			InfamyCardGui:custom_symbol(panel, h * 0.30, w * 0.41, 37, 52)
			if r8 then
				InfamyCardGui:custom_symbol(panel, h * 0.54, w * 0.41, 37, 52)
			end
			InfamyCardGui:custom_symbol(panel, h * 0.16, w * 0.20, 37, 52)
			InfamyCardGui:custom_symbol(panel, h * 0.41, w * 0.20, 37, 52)
			InfamyCardGui:custom_symbol(panel, h * 0.66, w * 0.20, 37, 52)
			InfamyCardGui:custom_symbol(panel, h * 0.16, w * 0.61, 37, 52)
			InfamyCardGui:custom_symbol(panel, h * 0.41, w * 0.61, 37, 52)
			InfamyCardGui:custom_symbol(panel, h * 0.66, w * 0.61, 37, 52)
		elseif r9 or r10 then
			if r9 then
				InfamyCardGui:custom_symbol(panel, h * 0.42, w * 0.41, 37, 52)
			end
			if r10 then
				InfamyCardGui:custom_symbol(panel, h * 0.23, w * 0.41, 37, 52)
				InfamyCardGui:custom_symbol(panel, h * 0.62, w * 0.41, 37, 52)
			end
			InfamyCardGui:custom_symbol(panel, h * 0.14, w * 0.19, 37, 52)
			InfamyCardGui:custom_symbol(panel, h * 0.33, w * 0.19, 37, 52)
			InfamyCardGui:custom_symbol(panel, h * 0.52, w * 0.19, 37, 52)
			InfamyCardGui:custom_symbol(panel, h * 0.71, w * 0.19, 37, 52)
			InfamyCardGui:custom_symbol(panel, h * 0.14, w * 0.62, 37, 52)
			InfamyCardGui:custom_symbol(panel, h * 0.33, w * 0.62, 37, 52)
			InfamyCardGui:custom_symbol(panel, h * 0.52, w * 0.62, 37, 52)
			InfamyCardGui:custom_symbol(panel, h * 0.71, w * 0.62, 37, 52)
		end
		local suit = rank > 500 and 500 or rank > 400 and 400 or rank > 300 and 300 or rank > 200 and 200 or rank > 100 and 100 or 0
		if r14 or rank == hun then
			local hun = rank >= 401 and 300 or rank >= 301 and 225 or rank >= 201 and 150 or rank >= 101 and 75 or 0
			local ace = panel:bitmap({
				align = "center",
				rotation = 360,
				layer = 1,
				blend_mode = "sub",
				texture = "guis/textures/pd2/infamous_symbol_hq",
				texture_rect = {
					0 + hun,
					0,
					75,
					95
				},
				color = icon_color,
				alpha = 1,
				w = 32 + ((rank - suit) * 0.6),
				h = 47 + ((rank - suit) * 0.7)
			})
			ace:set_center_x(self._text_gui:center())
			ace:set_center_y(self._text_gui:center() * 1.55)
			ace:set_render_template(Idstring("OverlayVertexColorTextured"))
		end
			
		if r11 or r12 or r13 then
			local tops = panel:bitmap({
				texture = "guis/textures/pd2/cards",
				align = "center",
				texture_rect = {
					r12 and 120 or r13 and 240 or 0,
					rank > 300 and 570 or rank > 200 and 380 or rank > 100 and 190 or 0,
					120,
					190
				},
				w = 140,
				h = 270,
				rotation = 360
			})
			tops:set_center_x(self._text_gui:center())
			tops:set_center_y(self._text_gui:center() * 1.55)
			tops:set_render_template(Idstring("OverlayVertexColorTextured"))
			InfamyCardGui:custom_symbol(panel, self._text_gui:center() * 0.42, self._text_gui:center() * 0.39, 32, 47)
			InfamyCardGui:custom_symbol(panel, self._text_gui:center() * 2.25, self._text_gui:center() * 1.25, 32, 47, 180)
		end
	end
end
if string.lower(RequiredScript) == "lib/managers/experiencemanager" then
	function ExperienceManager:infamy_suit_color(rank)
		return rank > 400 and Color.yellow or rank > 300 and Color.red or rank > 200 and Color.grey or rank > 100 and Color.red or Color.grey
	end
	function ExperienceManager:gui_string(level, rank, offset)
		offset = offset or 0
		local icon_color = ExperienceManager:infamy_suit_color(rank)
		local rank_string = rank > 0 and self:rank_string(rank) .. "-" or ""
		local gui_string = rank_string .. tostring(level)
		local rank_color_range = {
			start = utf8.len(rank_string) - utf8.len(rank_string) + offset,
			stop = rank > 100 and utf8.len(rank_string) + offset - 1 or 0,
			color = icon_color
		}

		return gui_string, {
			rank_color_range
		}
	end
end
if string.lower(RequiredScript) == "lib/tweak_data/infamynewtweakdata" then
	local data = InfamyTweakData.init
	function InfamyTweakData:init()
		data(self, tweak_data)
		self.infamy_icons[5].color = Color("BEAA00")
	end
end