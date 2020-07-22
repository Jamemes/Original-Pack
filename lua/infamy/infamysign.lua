function MenuSceneGui:update(t, dt)
	if self._shown_infamy_text_t then
		if self._shown_infamy_text_t <= t then
			self._shown_infamy_text_t = nil
			local current_rank = managers.experience:current_rank()
			self._infamy_increased_text = self._panel:text({
				vertical = "top",
				align = "center",
				layer = 1,
				text = managers.localization:to_upper_text(
				current_rank == 10 and "menu_infamy_jack_reached" or
				current_rank == 11 and "menu_infamy_queen_reached" or
				current_rank == 12 and "menu_infamy_king_reached" or
				current_rank == 13 and "menu_infamy_ace_reached" or
				current_rank >= 14 and "menu_infamy_fool_reached" or
				current_rank == 0 and "menu_infamy_rank_reached" or "menu_infamy_rank_increased", {
					infamy_rank = tostring(current_rank + 1)
				}),
				font = tweak_data.menu.pd2_large_font,
				font_size = tweak_data.menu.pd2_large_font_size
			})

			self._infamy_increased_text:move(0, self._panel:h() * 0.1)
		end
	elseif managers.menu_scene:infamy_card_shown() and not alive(self._infamy_increased_text) then
		self._shown_infamy_text_t = t + 4
	end

	if alive(self._infamy_increased_text) then
		-- Nothing
	end

	if managers.menu:is_pc_controller() then
		return
	end

	if mvector3.is_zero(self._left_axis_vector) then
		managers.menu_scene:stop_controller_move()
	else
		local x = mvector3.x(self._left_axis_vector)
		local y = mvector3.y(self._left_axis_vector)

		managers.menu_scene:controller_move(x * dt, y * dt)
	end

	if mvector3.is_zero(self._right_axis_vector) then
		managers.menu_scene:stop_controller_zoom()
	else
		local x = mvector3.x(self._right_axis_vector)
		local y = mvector3.y(self._right_axis_vector)

		managers.menu_scene:controller_zoom(x * dt, y * dt)
	end
end