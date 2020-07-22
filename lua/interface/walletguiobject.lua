function WalletGuiObject.set_wallet(panel, layer)
	WalletGuiObject.remove_wallet()

	Global.wallet_panel = panel:panel({
		name = "WalletGuiObject",
		layer = layer or 0
	})
	local money_icon = Global.wallet_panel:bitmap({
		texture = "guis/textures/pd2/shared_wallet_symbol",
		name = "wallet_money_icon"
	})
	local level_icon = Global.wallet_panel:bitmap({
		texture = "guis/textures/pd2/shared_level_symbol",
		name = "wallet_level_icon"
	})
	local skillpoint_icon = Global.wallet_panel:bitmap({
		texture = "guis/textures/pd2/shared_skillpoint_symbol",
		name = "wallet_skillpoint_icon"
	})
	local money_text = Global.wallet_panel:text({
		name = "wallet_money_text",
		text = managers.money:total_string_no_currency(),
		font_size = tweak_data.menu.pd2_small_font_size,
		font = tweak_data.menu.pd2_small_font,
		color = tweak_data.screen_colors.text
	})
	local level_text = Global.wallet_panel:text({
		name = "wallet_level_text",
		text = tostring(managers.experience:current_level()),
		font_size = tweak_data.menu.pd2_small_font_size,
		font = tweak_data.menu.pd2_small_font,
		color = tweak_data.screen_colors.text
	})
	local skillpoint_text = Global.wallet_panel:text({
		name = "wallet_skillpoint_text",
		text = tostring(managers.skilltree:points()),
		font_size = tweak_data.menu.pd2_small_font_size,
		font = tweak_data.menu.pd2_small_font,
		color = tweak_data.screen_colors.text
	})
	local mw, mh = WalletGuiObject.make_fine_text(money_text)
	local lw, lh = WalletGuiObject.make_fine_text(level_text)
	local sw, sh = WalletGuiObject.make_fine_text(skillpoint_text)

	money_icon:set_leftbottom(2, Global.wallet_panel:h() - 2)
	money_text:set_left(money_icon:right() + 2)
	money_text:set_center_y(money_icon:center_y())
	money_text:set_y(math.round(money_text:y()))

	local max_w = money_text:right()
	local unlocked = false
	local coins = 0
	unlocked = managers.custom_safehouse:unlocked()
	coins = managers.custom_safehouse:coins()
	local coins_icon = Global.wallet_panel:bitmap({
		texture = "guis/dlcs/chill/textures/pd2/safehouse/continental_coins_symbol",
		name = "wallet_coins_icon"
	})
	local coins_text = Global.wallet_panel:text({
		name = "wallet_coins_text",
		text = managers.experience:cash_string(math.floor(coins), ""),
		font_size = tweak_data.menu.pd2_small_font_size,
		font = tweak_data.menu.pd2_small_font,
		color = tweak_data.screen_colors.text
	})
	local cw, ch = WalletGuiObject.make_fine_text(coins_text)

	coins_icon:set_leftbottom(money_text:right() + 20, Global.wallet_panel:h() - 2)
	coins_text:set_left(coins_icon:right() + 2)
	coins_text:set_center_y(coins_icon:center_y())
	coins_text:set_y(math.round(coins_text:y()))

	if unlocked then
		max_w = coins_text:right()
	end

	level_icon:set_leftbottom(2, money_icon:top() - 5)
	level_text:set_left(level_icon:right() + 2)
	level_text:set_center_y(level_icon:center_y())
	level_text:set_y(math.round(level_text:y()))
	if _G.AchievementListGui.panel_crash_protection then
		skillpoint_icon:set_leftbottom(level_icon:right() + 25, level_icon:bottom())
	else
		skillpoint_icon:set_leftbottom(2, level_icon:top() - 5)
	end
	skillpoint_text:set_left(skillpoint_icon:right() + 2)
	skillpoint_text:set_center_y(skillpoint_icon:center_y())
	skillpoint_text:set_y(math.round(skillpoint_text:y()))

	local bg_blur = Global.wallet_panel:bitmap({
		texture = "guis/textures/test_blur_df",
		name = "bg_blur",
		h = 0,
		w = 0,
		render_template = "VertexColorTexturedBlur3D",
		layer = -1
	})

	bg_blur:set_leftbottom(0, Global.wallet_panel:h())
	bg_blur:set_w(skillpoint_text:right() + 2)
	bg_blur:set_h(Global.wallet_panel:h() - money_icon:top() + 4)
	WalletGuiObject.refresh()
end

function WalletGuiObject.refresh()
	if Global.wallet_panel then
		local money_icon = Global.wallet_panel:child("wallet_money_icon")
		local level_icon = Global.wallet_panel:child("wallet_level_icon")
		local skillpoint_icon = Global.wallet_panel:child("wallet_skillpoint_icon")
		local money_text = Global.wallet_panel:child("wallet_money_text")
		local level_text = Global.wallet_panel:child("wallet_level_text")
		local skillpoint_text = Global.wallet_panel:child("wallet_skillpoint_text")

		money_text:set_text(managers.money:total_string_no_currency())
		WalletGuiObject.make_fine_text(money_text)
		money_icon:set_leftbottom(2, Global.wallet_panel:h() - 2)
		money_text:set_left(money_icon:right() + 2)
		money_text:set_center_y(money_icon:center_y())
		money_text:set_y(math.round(money_text:y()))

		local max_w = money_text:right()
		local unlocked = false
		local coins = 0
		unlocked = managers.custom_safehouse:unlocked()
		coins = managers.custom_safehouse:coins()
		local coins_icon = Global.wallet_panel:child("wallet_coins_icon")
		local coins_text = Global.wallet_panel:child("wallet_coins_text")

		if unlocked then
			coins_text:set_text(managers.experience:cash_string(math.floor(coins), ""))
			WalletGuiObject.make_fine_text(coins_text)
			coins_icon:set_leftbottom(money_text:right() + 20, Global.wallet_panel:h() - 2)
			coins_text:set_left(coins_icon:right() + 2)
			coins_text:set_center_y(coins_icon:center_y())
			coins_text:set_y(math.round(coins_text:y()))

			max_w = coins_text:right()
		end

		coins_icon:set_visible(unlocked)
		coins_text:set_visible(unlocked)
		level_text:set_text(tostring(managers.experience:current_level()))
		WalletGuiObject.make_fine_text(level_text)
		level_icon:set_leftbottom(2, money_icon:top() - 5)
		level_text:set_left(level_icon:right() + 2)
		level_text:set_center_y(level_icon:center_y())
		level_text:set_y(math.round(level_text:y()))
		skillpoint_text:set_text(tostring(managers.skilltree:points()))
		WalletGuiObject.make_fine_text(skillpoint_text)
		if _G.AchievementListGui.panel_crash_protection then
			skillpoint_icon:set_leftbottom(level_icon:right() + 25, level_icon:bottom())
		else
			skillpoint_icon:set_leftbottom(2, level_icon:top() - 5)
		end
		skillpoint_text:set_left(skillpoint_icon:right() + 2)
		skillpoint_text:set_center_y(skillpoint_icon:center_y())
		skillpoint_text:set_y(math.round(skillpoint_text:y()))
		money_icon:set_visible(true)
		level_icon:set_visible(true)
		skillpoint_icon:set_visible(managers.skilltree:points() > 0)
		money_text:set_visible(true)
		level_text:set_visible(true)
		skillpoint_text:set_visible(managers.skilltree:points() > 0)
		WalletGuiObject.refresh_blur()
	end
end