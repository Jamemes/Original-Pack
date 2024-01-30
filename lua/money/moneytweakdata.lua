local data = MoneyTweakData.init
function MoneyTweakData:init(tweak_data)
	data(self, tweak_data)
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	if difficulty == "easy_wish" or difficulty == "sm_wish" then
		self.killing_civilian_deduction = self._create_value_table(10000, 250000, 10, true, 2)
	else
		self.killing_civilian_deduction = self._create_value_table(2000, 50000, 10, true, 2)
	end
	
	local smallest_cashout = (self.stage_completion[1] + self.job_completion[1]) * self.offshore_rate
	local biggest_weapon_mod_cost = math.round(self.biggest_cashout * 0.5)
	local smallest_weapon_mod_cost = math.round(smallest_cashout * 3)
	self.modify_weapon_cost = self._create_value_table(smallest_weapon_mod_cost, biggest_weapon_mod_cost, 10, true, 1.2)

	self.bag_values.meth = 3250
	self.bag_values.gold = 2200
	self.bag_values.warhead = 2300
	self.bag_values.safe = 2300
	self.bag_values.hope_diamond = 7500
	self.bag_values.drk_bomb_part = 2250
	self.bag_values.weapon_scar = 1000
	self.bag_values.weapon_glock = 1000
	self.bag_values.toothbrush = 3000
	self.bag_values.counterfeit_money = 1650
	self.bag_values.cro_loot = 3300
	self.bag_values.drone_control_helmet = 6000
	self.bag_values.meth_half = 3250
	self.bag_values.weapon = 1900
	self.bag_values.weapons = 1900
	self.bag_values.shells = 1400
	self.bag_values.turret = 7500
	self.bag_values.red_diamond = 40000
	self.bag_values.mus_artifact_bag = 1500
	self.bag_values.stones = 2200
	self.bag_values.sah_artifact_bag = 500
	self.bag_values.old_wine = 400
	
	self.loot_drop_cash.cash10 = 100000 * 2
	self.loot_drop_cash.cash20 = 100000 * 4
	self.loot_drop_cash.cash30 = 100000 * 6
	self.loot_drop_cash.cash40 = 100000 * 8
	self.loot_drop_cash.cash50 = 100000 * 9
	self.loot_drop_cash.cash60 = 100000 * 10
	self.loot_drop_cash.cash70 = 100000 * 11
	self.loot_drop_cash.cash80 = 100000 * 12
	self.loot_drop_cash.cash90 = 100000 * 13
	self.loot_drop_cash.cash100 = 100000 * 14
	self.skill_switch_cost = {
		{spending = 0, offshore = 0},
		{spending = 0, offshore = 0},
		{spending = 30000000, offshore = 80000000},
		{spending = 40000000, offshore = 90000000},
		{spending = 50000000, offshore = 110000000},
		{spending = 60000000, offshore = 120000000},
		{spending = 70000000, offshore = 130000000},
		{spending = 80000000, offshore = 140000000},
		{spending = 90000000, offshore = 150000000},
		{spending = 100000000, offshore = 160000000},
		{spending = 110000000, offshore = 170000000},
		{spending = 120000000, offshore = 180000000},
		{spending = 130000000, offshore = 190000000},
		{spending = 140000000, offshore = 200000000},
		{spending = 150000000, offshore = 210000000}
	}
	self.buy_premium_multiplier = {
		easy = 0.5,
		normal = 0.75,
		hard = 1.25,
		overkill = 1.5,
		overkill_145 = 2,
		overkill_290 = 4,
		easy_wish = 7,
		sm_wish = 10
	}
	self.buy_premium_static_fee = {
		easy = 100000,
		normal = 100000,
		hard = 150000,
		overkill = 200000,
		overkill_145 = 300000,
		overkill_290 = 760000,
		easy_wish = 1000000,
		sm_wish = 1300000
	}
end