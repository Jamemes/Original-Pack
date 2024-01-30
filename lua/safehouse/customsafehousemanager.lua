function CustomSafehouseManager:can_progress_trophies(id)
	if not self:unlocked() then
		return false
	end
	
	if managers.mutators:are_trophies_disabled() then
		for i, achivement_category in ipairs(self._mutator_achievement_categories) do
			local achievements = tweak_data.achievement[achivement_category]

			if achievements then
				for _, achievement_data in pairs(achievements) do
					if achievement_data.trophy_stat == id then
						return achievement_data.mutators
					end
				end
			end
		end

		return false
	end

	return true
end

function CustomSafehouseManager:set_coins(value)
	self._global.total = Application:digest_value(value, true)
end

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