if RequiredScript == 'lib/tweak_data/customsafehousetweakdata' then
	local data = CustomSafehouseTweakData.init
	function CustomSafehouseTweakData:init(tweak_data)
		data(self, tweak_data)
		self.prices = {
			rooms = {
				0,
				1,
				3
			},
			weapon_mod = 12,
			event_weapon_mod = 18,
			crew_boost = 1337,
			crew_ability = 1337
		}
		self.rewards = {
			initial = self.prices.rooms[2] * 1,
			challenge = 1,
			daily_complete = 1,
			raid = 2,
			experience_ratio = 3900000
		}
	end
elseif RequiredScript == 'lib/managers/customsafehousemanager' then
	function CustomSafehouseManager:unlocked()
		return Global.mission_manager.has_played_tutorial and (tweak_data.unlock_safehouse <= managers.experience:current_rank())
	end
	function CustomSafehouseManager:add_coins(amount, reason)
		local new_total = self:total_coins_earned() + amount
		local new_current = self:coins() + amount
		Global.custom_safehouse_manager.total = Application:digest_value(new_current, true)
		Global.custom_safehouse_manager.total_collected = Application:digest_value(new_total, true)

		print("[Safehouse] adding coins to safehouse: ", amount, Application:digest_value(self._global.total, false))

		reason = reason or "generic"

		Telemetry:send_on_player_economy_event(reason, "coin", amount, "earn")

		if managers.statistics then
			managers.statistics:aquired_coins(amount)
		end
	end
end