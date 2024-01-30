local data = PlayerMaskOff.init
function PlayerMaskOff:init(unit)
	data(self, unit)
	local detection_risk = managers.blackmarket:get_suspicion_offset_of_local(tweak_data.player.SUSPICION_OFFSET_LERP or 0.75)
	detection_risk = math.round(detection_risk * 100)
	if detection_risk <= managers.player:upgrade_value("player", "guards_cant_spot_you_in_casing", 0) then
		self._mask_off_attention_settings = {}
	end
end