function MenuManager:show_confirm_respec_skilltree(params)
	local tree_name = managers.localization:text(tweak_data.skilltree.trees[params.tree].name_id)
	local dialog_data = {
		title = managers.localization:text("dialog_skills_respec_title"),
		text = managers.localization:text("dialog_respec_skilltree", {
			tree = tree_name
		}),
		focus_button = 2
	}
	local yes_button = {
		text = managers.localization:text("dialog_yes"),
		callback_func = params.yes_func
	}
	local no_button = {
		text = managers.localization:text("dialog_no"),
		callback_func = params.no_func,
		cancel_button = true
	}
	dialog_data.button_list = {
		yes_button,
		no_button
	}
	dialog_data.no_upper = true

	managers.system_menu:show(dialog_data)
end