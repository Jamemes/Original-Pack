function MenuManager:color_range(text, color, string_text)
	local modifier_string = string_text
	local text_dissected = utf8.characters(modifier_string)
	local idsp = Idstring("#")
	local start_ci = {}
	local end_ci = {}
	local first_ci = true
	for i, c in ipairs(text_dissected) do
		if Idstring(c) == idsp then
			local next_c = text_dissected[i + 1]

			if next_c and Idstring(next_c) == idsp then
				if first_ci then
					table.insert(start_ci, i)
				else
					table.insert(end_ci, i)
				end

				first_ci = not first_ci
			end
		end
	end

	if #start_ci == #end_ci then
		for i = 1, #start_ci, 1 do
			start_ci[i] = start_ci[i] - ((i - 1) * 4 + 1)
			end_ci[i] = end_ci[i] - (i * 4 - 1)
		end
	end

	modifier_string = string.gsub(modifier_string, "##", "")
	if alive(text) then
		text:set_text(modifier_string)
		text:clear_range_color(1, utf8.len(modifier_string))

		if #start_ci ~= #end_ci then
			Application:error("CrimeNetContractGui: Not even amount of ##'s in skill description string!", #start_ci, #end_ci)
		else
			for i = 1, #start_ci, 1 do
				text:set_range_color(start_ci[i], end_ci[i], i == 1 and color)
			end
		end
	end
end

function MenuCallbackHandler:_dialog_clear_progress_yes()
	managers.menu:do_clear_progress()
	if _G.OPG.settings.max_progress then
		managers.blackmarket:max_progress()
	end
	if managers.menu_component then
		managers.menu_component:refresh_player_profile_gui()
	end
	managers.savefile:save_progress()
	managers.savefile:save_setting(true)
	Global.achievment_manager.reset_milestones = true
end
