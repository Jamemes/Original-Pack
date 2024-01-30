function WalletGuiObject.set_old_position()
	local money_icon = Global.wallet_panel:child("wallet_money_icon")
	local level_icon = Global.wallet_panel:child("wallet_level_icon")
	local level_text = Global.wallet_panel:child("wallet_level_text")
	local skillpoint_icon = Global.wallet_panel:child("wallet_skillpoint_icon")
	local skillpoint_text = Global.wallet_panel:child("wallet_skillpoint_text")
	local coins_text = Global.wallet_panel:child("wallet_coins_text")
	local money_text = Global.wallet_panel:child("wallet_money_text")
	
	level_icon:set_leftbottom(2, money_icon:top() - 5)
	level_text:set_left(level_icon:right() + 2)
	level_text:set_center_y(level_icon:center_y())
	if _G.AchievementListGui.panel_crash_protection then
		skillpoint_icon:set_leftbottom(level_icon:right() + 25, level_icon:bottom())
	else
		skillpoint_icon:set_leftbottom(2, level_icon:top() - 5)
	end
	skillpoint_text:set_left(skillpoint_icon:right() + 2)
	skillpoint_text:set_center_y(skillpoint_icon:center_y())
	skillpoint_text:set_y(math.round(skillpoint_text:y()))
end

local data = WalletGuiObject.set_wallet
function WalletGuiObject.set_wallet(panel, layer)
	data(panel, layer)
	WalletGuiObject.set_old_position()
end

local data = WalletGuiObject.refresh
function WalletGuiObject.refresh()
	data()
	WalletGuiObject.set_old_position()
end