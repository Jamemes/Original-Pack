local data = VoteManager.update
function VoteManager:update(t, dt)
	data(self, t, dt)
	local current_time = TimerManager:wall():time()
	if self._callback_counter then
		if current_time > self._callback_counter - 0.01 then
			if Network:is_server() and self._callback_type == "restart" then
				managers.network:session():send_to_peers("mission_ended", false, 0)
				game_state_machine:change_state_by_name("gameoverscreen")
			end
		end
	end
end