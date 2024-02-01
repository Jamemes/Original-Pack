local data = MenuCallbackHandler.restart_level_visible
function MenuCallbackHandler:restart_level_visible()
	if managers.skirmish:current_wave_number() < 1 and managers.job:is_level_ghostable(managers.job:current_level_id()) and not managers.groupai:state():whisper_mode() then
		return data(self)
	end
end

local data = MenuCallbackHandler.restart_vote_visible
function MenuCallbackHandler:restart_vote_visible()
	if managers.skirmish:current_wave_number() < 1 and managers.job:is_level_ghostable(managers.job:current_level_id()) and not managers.groupai:state():whisper_mode() then
		return data(self)
	end
end

function MenuCallbackHandler:accept_skirmish_contract(item)
	local node = item:parameters().gui_node.node

	managers.menu:active_menu().logic:navigate_back(true)
	managers.menu:active_menu().logic:navigate_back(true)

	local job_id = (node:parameters().menu_component_data or {}).job_id
	local job_data = {
		difficulty = "hard",
		customize_contract = true,
		job_id = job_id or managers.skirmish:random_skirmish_job_id(),
		difficulty_id = tweak_data:difficulty_to_index("hard")
	}

	managers.job:on_buy_job(job_data.job_id, job_data.difficulty_id or 1)

	if Global.game_settings.single_player then
		MenuCallbackHandler:start_single_player_job(job_data)
	else
		MenuCallbackHandler:start_job(job_data)
	end
end

function MenuCallbackHandler:accept_skirmish_weekly_contract(item)
	managers.menu:active_menu().logic:navigate_back(true)

	local weekly_skirmish = managers.skirmish:active_weekly()
	local job_data = {
		difficulty = "hard",
		weekly_skirmish = true,
		job_id = weekly_skirmish.id
	}

	if Global.game_settings.single_player then
		MenuCallbackHandler:start_single_player_job(job_data)
	else
		MenuCallbackHandler:start_job(job_data)
	end
end