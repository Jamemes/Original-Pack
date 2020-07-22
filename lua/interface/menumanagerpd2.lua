function MenuQuickplaySettingsInitiator:modify_node(node)
	local stealth_item = node:item("quickplay_settings_stealth")
	local loud_item = node:item("quickplay_settings_loud")
	local stealth_on = managers.user:get_setting("quickplay_stealth")
	local loud_on = managers.user:get_setting("quickplay_loud")
	local prank = managers.experience:current_rank()
	if prank >= 15 then
		self._difficulties_quick = {
			"easy",
			"normal",
			"hard",
			"overkill",
			"overkill_145",
			"overkill_290"
		}
	elseif prank >= 11 then
		self._difficulties_quick = {
			"easy",
			"normal",
			"hard",
			"overkill",
			"overkill_145",
			"overkill_290",
			"sm_wish"
		}
	else
		self._difficulties_quick = {
			"easy",
			"normal",
			"hard",
			"overkill",
			"overkill_145",
			"overkill_290"
		}
	end
	stealth_item:set_value(stealth_on and "on" or "off")
	loud_item:set_value(loud_on and "on" or "off")
	stealth_item:set_parameter("loud", loud_item)
	loud_item:set_parameter("stealth", stealth_item)
	node:item("quickplay_settings_level_min"):set_max(tweak_data.quickplay.max_level_diff[1])
	node:item("quickplay_settings_level_min"):set_value(Global.crimenet and Global.crimenet.quickplay and Global.crimenet.quickplay.level_diff_min or tweak_data.quickplay.default_level_diff[1])
	node:item("quickplay_settings_level_max"):set_max(tweak_data.quickplay.max_level_diff[2])
	node:item("quickplay_settings_level_max"):set_value(Global.crimenet and Global.crimenet.quickplay and Global.crimenet.quickplay.level_diff_max or tweak_data.quickplay.default_level_diff[2])

	local mutators_item = node:item("quickplay_settings_mutators")
	local mutators_on = managers.user:get_setting("quickplay_mutators")

	mutators_item:set_value(mutators_on and "on" or "off")

	local difficulty_item = node:item("quickplay_settings_difficulty")

	if not difficulty_item then
		local options = {
			{
				value = "any",
				text_id = "menu_any",
				_meta = "option"
			}
		}

		for _, difficulty in ipairs(self._difficulties_quick) do
			if difficulty ~= "easy" then
				table.insert(options, {
					_meta = "option",
					text_id = tweak_data.difficulty_name_ids[difficulty],
					value = difficulty
				})
			end
		end

		difficulty_item = self:create_multichoice(node, options, {
			callback = "quickplay_difficulty",
			name = "quickplay_settings_difficulty",
			help_id = "menu_quickplay_settings_difficulty",
			text_id = "menu_quickplay_settings_difficulty"
		}, 1)
	end

	if Global.crimenet and Global.crimenet.quickplay and Global.crimenet.quickplay.difficulty then
		difficulty_item:set_value(Global.crimenet.quickplay.difficulty)
	else
		difficulty_item:set_value("any")
	end

	return node
end
