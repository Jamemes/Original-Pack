function TripMineBase:_raycast()
	local ray = self._unit:raycast("ray", self._ray_from_pos, self._ray_to_pos, "slot_mask", self._slotmask, "ray_type", "trip_mine body")
	
	if ray and ray.unit and ray.unit:base() then
		ray.unit:base().trip_mine = true
	end
	
	return ray
end