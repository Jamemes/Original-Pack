--==Реплики издают шум==--
function PlayerStandard:say_line(sound_name, skip_alert)
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	self._unit:sound():say(sound_name, true, false)
	skip_alert = skip_alert or managers.groupai:state():whisper_mode()
	local alert_rad = tweak_data.whisper_alert_radius
	local new_alert = {
		"vo_cbt",
		self._unit:movement():m_head_pos(),
		alert_rad,
		self._unit:movement():SO_access(),
		self._unit
	}
	if difficulty == "easy_wish" or difficulty == "sm_wish" then
		managers.groupai:state():propagate_alert(new_alert)
	end
end
--==Бег в определенном радиусе будет тревожить гражданских/охранников.==--
Hooks:PreHook(PlayerStandard, "_update_movement", "PlayerStandard_update_movement", function(self, t)
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	local cur_pos = pos_new or self._pos
	local move_dis = mvector3.distance_sq(cur_pos, self._last_sent_pos)
	if not self:_on_zipline() and (move_dis > 22500 or move_dis > 400 and (t - self._last_sent_pos_t > 1.5 or not pos_new)) then
		self._ext_network:send("action_walk_nav_point", cur_pos)
		mvector3.set(self._last_sent_pos, cur_pos)
		self._last_sent_pos_t = t
		if self._move_dir and self._running and not self._state_data.ducking and not managers.groupai:state():enemy_weapons_hot() then
			local alert_epicenter = mvector3.copy(self._last_sent_pos)
			mvector3.set_z(alert_epicenter, alert_epicenter.z + 150)
			local alert_rad = (tweak_data.footstep_alert_radius) * mvector3.length(self._move_dir)
			local footstep_alert = {
				"footstep",
				alert_epicenter,
				alert_rad,
				managers.groupai:state():get_unit_type_filter("civilians_enemies"),
				self._unit
			}
			if difficulty_index > 3 then
				managers.groupai:state():propagate_alert(footstep_alert)
			end
		end
	end
end)