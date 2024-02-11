local data = MoneyManager.get_bag_value
function MoneyManager:get_bag_value(carry_id, multiplier)
    local value = data(self, carry_id, multiplier)
    local job_id = managers.job:current_job_id()

	local mul_tbl = {
		0.5,
		0.75,
		1,
		1.25,
		1.5,
		1.75,
		2,
		2.25,
		2.5
	}

    if managers.loot:is_bonus_bag(carry_id) and not tweak_data.carry.small_loot[carry_id] then
        value = value * mul_tbl[math.ceil(tweak_data.narrative:job_data(job_id).jc * 0.1)]
    end

    return math.round(value)
end