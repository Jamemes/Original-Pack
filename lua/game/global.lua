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
if not managers.job:is_level_ghostable_required(managers.job:current_level_id()) and managers.job:is_level_ghostable(managers.job:current_level_id()) and not managers.groupai:state():whisper_mode() and not managers.job:is_current_job_professional() and Global.game_settings.job_plan == 2 then
	if Input:keyboard():down(Idstring("f5")) then
		managers.vote:_restart_counter()
	end
end