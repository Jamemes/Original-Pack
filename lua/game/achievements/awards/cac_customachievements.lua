local function init_cac_15()
	local trip_mine_count = 0
	local target_count = 24
	local listener_key = {}

	local function on_trip_mine_placed()
		if not Global.statistics_manager.playing_from_start then
			return
		end

		trip_mine_count = trip_mine_count + 1

		if trip_mine_count == target_count then
			if managers.groupai:state():whisper_mode() then
				managers.achievment:award("cac_15")
			end
		end
	end

	managers.player:register_message("trip_mine_placed", listener_key, on_trip_mine_placed)
end

local function init_cac_11_34()
	local listener_key = {}

	local function on_cop_converted(converted_unit, converting_unit)
		if not alive(converting_unit) then
			return
		end

		managers.achievment:award_progress("cac_34_stats")

		if converting_unit ~= managers.player:player_unit() then
			return
		end

		local cashier_units = {
			Idstring("units/pd2_dlc_rvd/characters/ene_female_civ_undercover/ene_female_civ_undercover"),
			Idstring("units/pd2_dlc_rvd/characters/ene_female_civ_undercover/ene_female_civ_undercover_husk")
		}
		local is_rvd = managers.job:current_job_id() == "rvd" or managers.job:current_job_id() == "rvd_pro"
		local is_cashier = table.contains(cashier_units, converted_unit:name())

		if is_rvd and is_cashier then
			managers.achievment:award("cac_11")
		end
	end

	managers.player:register_message("cop_converted", listener_key, on_cop_converted)
end

local data = AchievmentManager.init_cac_custom_achievements
function AchievmentManager:init_cac_custom_achievements(self)
    data(self)
	init_cac_15()
	init_cac_11_34()
end
