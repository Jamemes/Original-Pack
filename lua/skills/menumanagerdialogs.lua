function MenuManager:show_confirm_invest(params)
	local dialog_data = {}
	dialog_data.title = managers.localization:text("dialog_confirm_invest")
	dialog_data.text = managers.localization:text("dialog_confirm_invest_desc")
	dialog_data.focus_button = 2
	local yes_button = {}
	yes_button.text = managers.localization:text("dialog_yes")
	yes_button.callback_func = params.yes_func
	local no_button = {}
	no_button.text = managers.localization:text("dialog_no")
	no_button.callback_func = params.no_func
	no_button.cancel_button = true
	dialog_data.button_list = {yes_button, no_button}
	dialog_data.no_upper = true
	managers.system_menu:show(dialog_data)
end

function MenuManager:show_confirm_refund(params)
	local dialog_data = {}
	dialog_data.title = managers.localization:text("dialog_confirm_refund")
	dialog_data.text = managers.localization:text("dialog_confirm_refund_desc")
	dialog_data.focus_button = 2
	local yes_button = {}
	yes_button.text = managers.localization:text("dialog_yes")
	yes_button.callback_func = params.yes_func
	local no_button = {}
	no_button.text = managers.localization:text("dialog_no")
	no_button.callback_func = params.no_func
	no_button.cancel_button = true
	dialog_data.button_list = {yes_button, no_button}
	dialog_data.no_upper = true
	managers.system_menu:show(dialog_data)
end

function MenuManager:show_confirm_infamy_tree_reset(params)
	local dialog_data = {}
	dialog_data.title = managers.localization:text("menu_reset_infamy_tree")
	dialog_data.text = managers.localization:text("menu_reset_infamy_tree_desc")
	dialog_data.focus_button = 2
	local yes_button = {
		managers.menu:open_node("infamytree"),
		managers.menu:back()
	}
	yes_button.text = managers.localization:text("dialog_yes")
	yes_button.callback_func = params.yes_func
	local no_button = {}
	no_button.text = managers.localization:text("dialog_no")
	no_button.callback_func = params.no_func
	no_button.cancel_button = true
	dialog_data.button_list = {yes_button, no_button}
	dialog_data.no_upper = true
	managers.system_menu:show(dialog_data)
end

function MenuManager:show_not_enough_money_infamy_tree_reset(params)
	local dialog_data = {}
	dialog_data.title = managers.localization:text("menu_not_enough_offshore")
	dialog_data.text = managers.localization:text("menu_not_enough_offshore_desc")
	dialog_data.focus_button = 1
	local no_button = {}
	no_button.text = managers.localization:text("dialog_ok")
	no_button.callback_func = params.no_func
	no_button.cancel_button = true
	dialog_data.button_list = {no_button}
	dialog_data.no_upper = true
	managers.system_menu:show(dialog_data)
end