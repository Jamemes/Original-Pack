local difficulty = Global.game_settings and Global.game_settings.difficulty
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

function SecurityCamera:update(unit, t, dt)
	self:_update_tape_loop_restarting(unit, t, dt)


	if not Network:is_server() then
		return
	end

	if self._tape_loop_expired_clbk_id or self._tape_loop_restarting_t then
		self:_destroy_all_detected_attention_object_data()
		self:_stop_all_sounds()
	else
		self:_upd_detection(t)
	end

	self:_upd_sound(unit, t)
end

function SecurityCamera:_upd_detect_attention_objects(t)
	local detected_obj = self._detected_attention_objects
	local my_key = self._u_key
	local my_pos = self._pos
	local my_fwd = self._look_fwd
	local det_delay = self._detection_delay
	local no_titan_cameras = Global.game_settings.level_id == "roberts"

	for u_key, attention_info in pairs(detected_obj) do
		if t >= attention_info.next_verify_t then
			attention_info.next_verify_t = t + (attention_info.identified and attention_info.verified and attention_info.settings.verification_interval * 1.3 or attention_info.settings.verification_interval * 0.3)

			if not attention_info.identified then
				local noticable = nil
				local angle, dis_multiplier = self:_detection_angle_and_dis_chk(my_pos, my_fwd, attention_info.handler, attention_info.settings, attention_info.handler:get_detection_m_pos())

				if angle then
					local attention_pos = attention_info.handler:get_detection_m_pos()
					local vis_ray = self._unit:raycast("ray", my_pos, attention_pos, "slot_mask", self._visibility_slotmask, "ray_type", "ai_vision")

					if not vis_ray or vis_ray.unit:key() == u_key then
						noticable = true
					end
				end

				local delta_prog = nil
				local dt = t - attention_info.prev_notice_chk_t

				if noticable then
					if angle == -1 then
						delta_prog = 1
					else
						local min_delay = det_delay[1]
						local max_delay = det_delay[2]
						local angle_mul_mod = 0.15 * math.min(angle / self._cone_angle, 1)
						local dis_mul_mod = 0.85 * dis_multiplier
						local notice_delay_mul = attention_info.settings.notice_delay_mul or 1

						if attention_info.settings.detection and attention_info.settings.detection.delay_mul then
							notice_delay_mul = notice_delay_mul * attention_info.settings.detection.delay_mul
						end

						local notice_delay_modified = math.lerp(min_delay * notice_delay_mul, max_delay, dis_mul_mod + angle_mul_mod)
						delta_prog = notice_delay_modified > 0 and dt / notice_delay_modified or 1
					end
				else
					delta_prog = det_delay[2] > 0 and -dt / det_delay[2] or -1
				end
				if difficulty_index == 7 and managers.groupai:state():is_ecm_jammer_active("camera") then
					if Global.game_settings and no_titan_cameras then
						attention_info.notice_progress = attention_info.notice_progress + delta_prog * 0.05
					else
						attention_info.notice_progress = attention_info.notice_progress + delta_prog * 0.3
					end
				elseif managers.groupai:state():is_ecm_jammer_active("camera") then
					attention_info.notice_progress = attention_info.notice_progress + delta_prog * 0.05
				elseif difficulty_index == 7 then
					attention_info.notice_progress = attention_info.notice_progress + delta_prog * 3
				else
					attention_info.notice_progress = attention_info.notice_progress + delta_prog
				end

				if attention_info.notice_progress > 1 then
					attention_info.notice_progress = nil
					attention_info.prev_notice_chk_t = nil
					attention_info.identified = true
					attention_info.release_t = t + attention_info.settings.release_delay
					attention_info.identified_t = t
					noticable = true

					if AIAttentionObject.REACT_SCARED <= attention_info.settings.reaction then
						managers.groupai:state():on_criminal_suspicion_progress(attention_info.unit, self._unit, true)
					end
				elseif attention_info.notice_progress < 0 then
					self:_destroy_detected_attention_object_data(attention_info)

					noticable = false
				else
					noticable = attention_info.notice_progress
					attention_info.prev_notice_chk_t = t

					if AIAttentionObject.REACT_SCARED <= attention_info.settings.reaction then
						managers.groupai:state():on_criminal_suspicion_progress(attention_info.unit, self._unit, noticable)
					end
				end

				if noticable ~= false and attention_info.settings.notice_clbk then
					attention_info.settings.notice_clbk(self._unit, noticable)
				end
			end

			if attention_info.identified then
				attention_info.nearly_visible = nil
				local verified, vis_ray = nil
				local attention_pos = attention_info.handler:get_detection_m_pos()
				local dis = mvector3.distance(my_pos, attention_info.m_pos)

				if dis < self._range * 1.2 then
					local detect_pos = nil

					if attention_info.is_husk_player and attention_info.unit:anim_data().crouch then
						detect_pos = self._tmp_vec1

						mvector3.set(detect_pos, attention_info.m_pos)
						mvector3.add(detect_pos, tweak_data.player.stances.default.crouched.head.translation)
					else
						detect_pos = attention_pos
					end

					local in_FOV = self:_detection_angle_chk(my_pos, my_fwd, detect_pos, 0.8)

					if in_FOV then
						vis_ray = self._unit:raycast("ray", my_pos, detect_pos, "slot_mask", self._visibility_slotmask, "ray_type", "ai_vision")

						if not vis_ray or vis_ray.unit:key() == u_key then
							verified = true
						end
					end

					attention_info.verified = verified
				end

				attention_info.dis = dis

				if verified then
					attention_info.release_t = nil
					attention_info.verified_t = t

					mvector3.set(attention_info.verified_pos, attention_pos)

					attention_info.last_verified_pos = mvector3.copy(attention_pos)
					attention_info.verified_dis = dis
				elseif attention_info.release_t and attention_info.release_t < t then
					self:_destroy_detected_attention_object_data(attention_info)
				else
					attention_info.release_t = attention_info.release_t or t + attention_info.settings.release_delay
				end
			end
		end
	end
end
