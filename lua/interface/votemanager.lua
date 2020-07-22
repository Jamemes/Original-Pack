function VoteManager:update(t, dt)
	local current_time = TimerManager:wall():time()
	if Network:is_server() then
		if self._timeout and current_time > self._timeout then
			local vote_count = 0
			for _, value in pairs(self._vote_response) do
				if value == 1 then
					vote_count = vote_count + 1
				end
			end
			local success = self:_host_count(true)
			self:_host_finish(success)
		end
		if self._vote_cooldown then
			for id, time in pairs(self._vote_cooldown) do
				if current_time > time then
					self._vote_cooldown[id] = nil
				end
			end
			if table.size(self._vote_cooldown) == 0 then
				self._vote_cooldown = nil
			end
		end
	end
	if self._cooldown and current_time > self._cooldown then
		self._cooldown = nil
		self:_refresh_menu()
	end
	if self._callback_counter then
		if managers.platform:presence() == "Mission_end" then
			self._callback_type = nil
		end
		if self._callback_type == "restart" then
			self._callback_counter_print = self._callback_counter_print or tweak_data.voting.restart_delay
			if self._callback_counter_print > self._callback_counter - current_time then
				managers.chat:feed_system_message(ChatManager.GAME, managers.localization:text("menu_chat_restart_timer", {
					time = self._callback_counter_print
				}))
				self._callback_counter_print = self._callback_counter_print - 1
			end
		end
		if current_time > self._callback_counter then
			if Network:is_server() and self._callback_type == "restart" then
				managers.network:session():send_to_peers("mission_ended", false, 0)
				game_state_machine:change_state_by_name("gameoverscreen")
			end
			self._callback_type = nil
			self._callback_counter = nil
			self._callback_counter_print = nil
		end
	end
end