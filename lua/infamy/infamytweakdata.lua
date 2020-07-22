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
	self.items.infamy_mastermind.desc_params.xpboost = "1%"
	self.items.infamy_enforcer.desc_params.xpboost = "1%"
	self.items.infamy_technician.desc_params.xpboost = "1%"
	self.items.infamy_ghost.desc_params.xpboost = "1%"
	self.items.infamy_mastermind.upgrades.infamous_xp = 1.01
	self.items.infamy_enforcer.upgrades.infamous_xp = 1.01
	self.items.infamy_technician.upgrades.infamous_xp = 1.01
	self.items.infamy_ghost.upgrades.infamous_xp = 1.01
	
	self.items.infamy_maskpack_destroyer.desc_params.xpboost = "3.5%"
	self.items.infamy_maskpack_pain.desc_params.xpboost = "3.5%"
	self.items.infamy_maskpack_balaclava.desc_params.xpboost = "3.5%"
	self.items.infamy_maskpack_hood.desc_params.xpboost = "3.5%"
	self.items.infamy_maskpack_daft.desc_params.xpboost = "3.5%"
	self.items.infamy_maskpack_ranger.desc_params.xpboost = "3.5%"
	self.items.infamy_maskpack_lurker.desc_params.xpboost = "3.5%"
	self.items.infamy_maskpack_punk.desc_params.xpboost = "3.5%"
	self.items.infamy_maskpack_destroyer.upgrades.infamous_xp = 1.035
	self.items.infamy_maskpack_pain.upgrades.infamous_xp = 1.035
	self.items.infamy_maskpack_balaclava.upgrades.infamous_xp = 1.035
	self.items.infamy_maskpack_hood.upgrades.infamous_xp = 1.035
	self.items.infamy_maskpack_daft.upgrades.infamous_xp = 1.035
	self.items.infamy_maskpack_ranger.upgrades.infamous_xp = 1.035
	self.items.infamy_maskpack_lurker.upgrades.infamous_xp = 1.035
	self.items.infamy_maskpack_punk.upgrades.infamous_xp = 1.035
	
	self.items.infamy_xp_medium_1.desc_params.xpboost = "5%"
	self.items.infamy_xp_medium_2.desc_params.xpboost = "5%"
	self.items.infamy_xp_medium_3.desc_params.xpboost = "5%"
	self.items.infamy_xp_medium_4.desc_params.xpboost = "5%"
	self.items.infamy_xp_medium_5.desc_params.xpboost = "5%"
	self.items.infamy_xp_medium_6.desc_params.xpboost = "5%"
	self.items.infamy_xp_medium_7.desc_params.xpboost = "5%"
	self.items.infamy_xp_medium_8.desc_params.xpboost = "5%"
	self.items.infamy_xp_medium_9.desc_params.xpboost = "5%"
	self.items.infamy_xp_medium_10.desc_params.xpboost = "5%"
	self.items.infamy_xp_medium_11.desc_params.xpboost = "5%"
	self.items.infamy_xp_medium_12.desc_params.xpboost = "5%"
	self.items.infamy_xp_medium_1.upgrades.infamous_xp = 1.05
	self.items.infamy_xp_medium_2.upgrades.infamous_xp = 1.05
	self.items.infamy_xp_medium_3.upgrades.infamous_xp = 1.05
	self.items.infamy_xp_medium_4.upgrades.infamous_xp = 1.05
	self.items.infamy_xp_medium_5.upgrades.infamous_xp = 1.05
	self.items.infamy_xp_medium_6.upgrades.infamous_xp = 1.05
	self.items.infamy_xp_medium_7.upgrades.infamous_xp = 1.05
	self.items.infamy_xp_medium_8.upgrades.infamous_xp = 1.05
	self.items.infamy_xp_medium_9.upgrades.infamous_xp = 1.05
	self.items.infamy_xp_medium_10.upgrades.infamous_xp = 1.05
	self.items.infamy_xp_medium_11.upgrades.infamous_xp = 1.05
	self.items.infamy_xp_medium_12.upgrades.infamous_xp = 1.05
end

