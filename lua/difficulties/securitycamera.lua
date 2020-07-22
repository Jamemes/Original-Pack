local difficulty = Global.game_settings and Global.game_settings.difficulty
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

function SecurityCamera:update(unit, t, dt)
	self:_update_tape_loop_restarting(unit, t, dt)


	if not Network:is_server() then
		return
	end

	if difficulty_index < 7 and managers.groupai:state():is_ecm_jammer_active("camera") or self._tape_loop_expired_clbk_id or self._tape_loop_restarting_t then
		self:_destroy_all_detected_attention_object_data()
		self:_stop_all_sounds()
	elseif difficulty_index > 7 and managers.groupai:state():is_ecm_jammer_active("camera") then
		self:_upd_detection(t)
	else
		self:_upd_detection(t)
	end

	self:_upd_sound(unit, t)
end