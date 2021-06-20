if managers.custom_safehouse:unlocked() then
	if not managers.achievment.achievments.flat_5.awarded then
		managers.achievment:award("tip_the_scales")
	end
end
if managers.money:offshore() > tweak_data.max_offshore then
	managers.money:_set_offshore(tweak_data.max_offshore)
end
if managers.money:total() > tweak_data.max_spending_cash then
	managers.money:_set_total(tweak_data.max_spending_cash)
end
if managers.custom_safehouse:coins() > tweak_data.max_coins then
	managers.custom_safehouse:set_coins(tweak_data.max_coins)
end

if tweak_data.narrative.contacts[tweak_data.narrative:job_data(managers.job:current_job_id()).contact].hidden and Global.game_settings.difficulty == "sm_wish" then
	Global.game_settings.one_down = true
end