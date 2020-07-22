local data = InfamyTweakData.init
function InfamyTweakData:init(tweak_data)
    data(self, tweak_data)
	local function digest(value)
		return Application:digest_value(value, true)
	end
	local cost_root = digest(150000000)
	local cost_first_tier = digest(200000000)
	local cost_second_tier = digest(300000000)
	local cost_third_tier = digest(400000000)
	local cost_ace = digest(500000000)
	self.ranks = {
		cost_root,
		cost_first_tier,
		cost_first_tier,
		cost_first_tier,
		cost_first_tier,
		cost_second_tier,
		cost_second_tier,
		cost_second_tier,
		cost_second_tier,
		cost_third_tier,
		cost_third_tier,
		cost_third_tier,
		cost_third_tier,
		cost_ace
	}
	
	self.tree = {
		"infamy_maskpack_destroyer",
		"infamy_xp_medium_1",
		"infamy_xp_medium_2",
		"infamy_xp_medium_3",
		"infamy_maskpack_pain",
		"infamy_xp_medium_4",
		"infamy_maskpack_balaclava",
		"infamy_mastermind",
		"infamy_maskpack_hood",
		"infamy_xp_medium_5",
		"infamy_xp_medium_6",
		"infamy_ghost",
		"infamy_root",
		"infamy_enforcer",
		"infamy_xp_medium_7",
		"infamy_xp_medium_8",
		"infamy_maskpack_daft",
		"infamy_technician",
		"infamy_maskpack_ranger",
		"infamy_xp_medium_9",
		"infamy_maskpack_lurker",
		"infamy_xp_medium_10",
		"infamy_xp_medium_11",
		"infamy_xp_medium_12",
		"infamy_maskpack_punk"
	}
	
end

