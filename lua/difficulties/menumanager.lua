function MenuManager:close_menu(menu_name)
	self:post_event("menu_exit")

	Application:set_pause(false)
	self:post_event("game_resume")
	SoundDevice:set_rtpc("ingame_sound", 1)

	MenuManager.super.close_menu(self, menu_name)
end

function MenuManager:toggle_menu_state()
	if self._is_start_menu then
		return
	end

	if self._heister_interaction then
		return
	end

	if managers.hud:chat_focus() then
		return
	end

	if (not Application:editor() or Global.running_simulation) and not managers.system_menu:is_active() then
		if self:is_open("menu_pause") then
			if not self:is_pc_controller() or self:is_in_root("menu_pause") then
				self:close_menu("menu_pause")
				managers.savefile:save_setting(true)
			end
		elseif (not self:active_menu() or #self:active_menu().logic._node_stack == 1 or not managers.menu:active_menu().logic:selected_node() or managers.menu:active_menu().logic:selected_node():parameters().allow_pause_menu) and managers.menu_component:input_focus() ~= 1 then
			self:open_menu("menu_pause")

		if managers.network:session() and managers.network:session():amount_of_players() == 1 then
				Application:set_pause(true)
				self:post_event("game_pause_in_game_menu")
				SoundDevice:set_rtpc("ingame_sound", 0)

				local player_unit = managers.player:player_unit()

				if alive(player_unit) and player_unit:movement():current_state().update_check_actions_paused then
					player_unit:movement():current_state():update_check_actions_paused()
				end
			end
		end
	end
end

local data = MenuCallbackHandler.is_contract_difficulty_allowed
function MenuCallbackHandler:is_contract_difficulty_allowed(item)
	if item:value() == 6 or item:value() == 8 then
		return false
	end

	return data(self, item)
end