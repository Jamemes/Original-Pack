if RequiredScript == "lib/units/beings/player/states/playerstandard" then
local mvec_pos_new = Vector3()
local mvec_achieved_walk_vel = Vector3()
local mvec_move_dir_normalized = Vector3()
local _update_movement_original = PlayerStandard._update_movement
local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

function PlayerStandard:_update_movement(t, dt, ...)
	local cur_pos = pos_new or self._pos
	local move_dis = mvector3.distance_sq(cur_pos, self._last_sent_pos)
	if not self:_on_zipline() and (move_dis > 22500 or move_dis > 400 and (t - self._last_sent_pos_t > 1.5 or not pos_new)) then
		self._ext_network:send("action_walk_nav_point", cur_pos)
		mvector3.set(self._last_sent_pos, cur_pos)
		self._last_sent_pos_t = t
		if self._move_dir and self._running and not self._state_data.ducking and not managers.groupai:state():enemy_weapons_hot() then
			local alert_epicenter = mvector3.copy(self._last_sent_pos)
			mvector3.set_z(alert_epicenter, alert_epicenter.z + 150)
			local alert_rad
			if difficulty_index == 7 then
				alert_rad = 1100 * mvector3.length(self._move_dir)
			else
				alert_rad = 450 * mvector3.length(self._move_dir)
			end
			local footstep_alert = {
				"footstep",
				alert_epicenter,
				alert_rad,
				managers.groupai:state():get_unit_type_filter("civilians_enemies"),
				self._unit
			}
			managers.groupai:state():propagate_alert(footstep_alert)
		end
	end
	return _update_movement_original(self, t, dt, ...)
end
end