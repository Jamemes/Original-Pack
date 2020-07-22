local hate = Global.game_settings.difficulty == "sm_wish" and tweak_data.hate_multipler or 1
if string.lower(RequiredScript) == "lib/units/beings/player/states/playerstandard" then
	--==Соседи будут звонить в полицию через некоторое время, после того был издан шум определенного радиуса. (Радиус по умолчанию - 2450)==--
	Hooks:PreHook(PlayerStandard, "_update_movement", "PlayerStandard_update_movement", function(self, t)
		local cur_pos = pos_new or self._pos
		local move_dis = mvector3.distance_sq(cur_pos, self._last_sent_pos)
		if not self:_on_zipline() and (move_dis > 22500 or move_dis > 400 and (t - self._last_sent_pos_t > 1.5 or not pos_new)) then
			self._ext_network:send("action_walk_nav_point", cur_pos)
			mvector3.set(self._last_sent_pos, cur_pos)
			self._last_sent_pos_t = t
			if self._move_dir and self._running and not self._state_data.ducking and not managers.groupai:state():enemy_weapons_hot() then
				local alert_epicenter = mvector3.copy(self._last_sent_pos)
				mvector3.set_z(alert_epicenter, alert_epicenter.z + 150)
				local alert_rad = (tweak_data.footstep_alert_radius * hate) * mvector3.length(self._move_dir)
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
	end)
elseif string.lower(RequiredScript) == "lib/managers/group_ai_states/groupaistatebase" then
	--==Соседи будут звонить в полицию через некоторое время, после того был издан шум определенного радиуса. (Радиус по умолчанию - 2450)==--
	Hooks:PreHook(GroupAIStateBase, "propagate_alert", "GroupAIStateBase_propagate_alert", function(self, alert_data)
		local alert_type = alert_data[1]
		local alert_epicenter = alert_data[2]
		local alert_radius = alert_data[3]
		local listeners_by_type = self._alert_listeners[alert_type]
		local live_neighbourhood = Global.game_settings.level_id == "welcome_to_the_jungle_1" or Global.game_settings.level_id == "welcome_to_the_jungle_1_night" or Global.game_settings.job_plan == 1 or Global.game_settings.difficulty == "sm_wish"
		local neighbour_ear = tweak_data.neighbours_alert_radius_trigger / hate
		if live_neighbourhood then
			if listeners_by_type and alert_epicenter then
				if alert_radius > neighbour_ear then
					function GroupAIStateBase:_on_neighbours_called()
						managers.groupai:state():on_police_called("sys_csgo_gunfire")
					end
					if managers.groupai:state():whisper_mode() then
						managers.enemy:add_delayed_clbk(nil, callback(self, self, "_on_neighbours_called"), self._t + tweak_data.neighbours_trigger_delay)
					end
				end
			end
		end
	end)
elseif string.lower(RequiredScript) == "lib/managers/gameplaycentralmanager" then
	--==Тревога нпс от хлопков пуль прилетевшей в стену\поверхность==--
	Hooks:PreHook(GamePlayCentralManager, "_play_bullet_hit", "GamePlayCentralManager_play_bullet_hit", function(self, params)
		local hit_pos = params.col_ray.position
		local need_sound = not params.no_sound and World:in_view_with_options(hit_pos, 4000, 0, 0)
		local need_effect = World:in_view_with_options(hit_pos, 20, 100, 5000)
		local need_decal = not self._block_bullet_decals and not params.no_decal and need_effect and World:in_view_with_options(hit_pos, 3000, 0, 0)
		if need_sound and need_effect and need_decal and alive(params.col_ray.unit) then
			local alert_event = {
				"aggression",
				hit_pos,
				tweak_data.bullet_hit_alert_radius * hate,
				managers.groupai:state():get_unit_type_filter("civilians_enemies"),
				params.col_ray.unit
			}
			managers.groupai:state():propagate_alert(alert_event)
		end
	end)
elseif string.lower(RequiredScript) == "lib/units/props/drill" then
	--==Зона тревоги нпс от дрели==--
	local investigate_zone = tweak_data.drill_investigate_zone --Зона "проверки" шума дрели, чтобы охранник шел к источнику звука. (Радиус по умолчанию - 500)
	Hooks:PreHook(Drill, "_set_alert_state", "Drill_set_alert_state", function(self, state)
		if state then
			if not self.is_hacking_device then
				self:drill_alert_noise()
			end
		end
	end)
	function Drill:drill_alert_noise()
		local alert_event = {
			"aggression",
			self._unit:position(),
			self._alert_radius - investigate_zone,
			managers.groupai:state():get_unit_type_filter("civilians_enemies"),
			self._unit
		}
		managers.groupai:state():propagate_alert(alert_event)
	end
	--==Удержание зоны тревоги нпс во время работы дрели через "проверку" охранников==--
	Hooks:PreHook(Drill, "clbk_investigate_SO_verification", "Drill_clbk_investigate_SO_verification", function(self, candidate_unit)
		local candidate_listen_pos = candidate_unit:movement():m_head_pos()
		local sound_source_pos = self._unit:position()
		local ray = self._unit:raycast("ray", candidate_listen_pos, sound_source_pos, "slot_mask", managers.slot:get_mask("AI_visibility"), "ray_type", "ai_vision", "report")

		if ray then
			local my_dis = mvector3.distance(candidate_listen_pos, sound_source_pos)
			if my_dis > (self._alert_radius or 900) * 0.5 then
					local alert_event = {
						"aggression",
						self._unit:position(),
						self._alert_radius - investigate_zone,
						managers.groupai:state():get_unit_type_filter("civilians_enemies"),
						self._unit
					}
					managers.groupai:state():propagate_alert(alert_event)
				return
			end
		end
	end)
end

