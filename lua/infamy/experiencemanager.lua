function ExperienceManager:gui_string(level, rank, offset)
	offset = offset or 0
	local rank_string = rank > 0 and self:rank_string(rank) .. "-" or ""
	local gui_string = rank_string .. tostring(level)
	local rank_color_range = {
		start = offset,
		stop = offset + #self:rank_string(rank),
		color = tweak_data.screen_colors.infamy_color
	}
	local function change_color(start, stop, color)
		if rank > start and rank <= stop then
			rank_color_range.color = color
		end
	end
	
	change_color(0, 100, tweak_data.screen_colors.achievement_grey)
	change_color(100, 200, tweak_data.screen_colors.pro_color)
	change_color(200, 300, tweak_data.screen_colors.achievement_grey)
	change_color(300, 400, tweak_data.screen_colors.pro_color)
	change_color(400, 500, Color("BEAA00"))
	
	return gui_string, {
		rank_color_range
	}
end