local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local mvec1 = Vector3()
local mvec2 = Vector3()
local mvec_l_dir = Vector3()
function WeaponLaser:update(unit, t, dt)
	local rotation = self._custom_rotation or self._laser_obj:rotation()
	mrotation.y(rotation, mvec_l_dir)
	local from = mvec1
	if self._custom_position then
		mvector3.set(from, self._laser_obj:local_position())
		mvector3.rotate_with(from, rotation)
		mvector3.add(from, self._custom_position)
	else
		mvector3.set(from, self._laser_obj:position())
	end
	local to = mvec2
	mvector3.set(to, mvec_l_dir)
	mvector3.multiply(to, self._max_distance)
	mvector3.add(to, from)
	local ray = self._unit:raycast("ray", from, to, "slot_mask", self._slotmask, self._ray_ignore_units and "ignore_unit" or nil, self._ray_ignore_units)
	if ray then
		if not self._is_npc then
			self._light:set_spot_angle_end(self._spot_angle_end)
			self._spot_angle_end = math.lerp(1, 18, ray.distance / self._max_distance)
			self._light_glow:set_spot_angle_end(math.lerp(8, 80, ray.distance / self._max_distance))
			local scale = (math.clamp(ray.distance, self._max_distance - self._scale_distance, self._max_distance) - (self._max_distance - self._scale_distance)) / self._scale_distance
			scale = 1 - scale
			self._light:set_multiplier(scale)
			self._light_glow:set_multiplier(scale * 0.1)
		end
		self._brush:cylinder(ray.position, from, self._is_npc and 0.5 or 0.25)
		local pos = mvec1
		mvector3.set(pos, mvec_l_dir)
		mvector3.multiply(pos, 50)
		mvector3.negate(pos)
		mvector3.add(pos, ray.position)
		self._light:set_final_position(pos)
		self._light_glow:set_final_position(pos)
	else
		self._light:set_final_position(to)
		self._light_glow:set_final_position(to)
		self._brush:cylinder(from, to, self._is_npc and 0.5 or 0.25)
	end
	if ray then
		local pos = mvec1
		--==Лазерный целеуказатель может потревожить нпс если светить им в глаза или рядом с головой==--
		local alert_event = {
			"aggression",
			pos,
			75,
			managers.groupai:state():get_unit_type_filter("civilians_enemies"),
			unit
		}
		if difficulty == "easy_wish" or difficulty == "sm_wish" then
			managers.groupai:state():propagate_alert(alert_event)
		end
	end
	self._custom_position = nil
	self._custom_rotation = nil
end