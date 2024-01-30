local old_init = GroupAITweakData.init
function GroupAITweakData:init(tweak_data)
	old_init(self, tweak_data)
	
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	local access_type_walk_only = {walk = true}
	local access_type_all = {acrobatic = true, walk = true}
	local is_console = SystemInfo:platform() ~= Idstring("WIN32")
	self.ai_tick_rate = 0

	--[[
	notes:
	radius seems to do nothing, game theory how many cops in a radius can say a certain chatter (should test this)
	max_nr how many chatter calls can go off at once
	duration ??? longer ones i grabbed from v009/pdth
	interval is cooldown
	group_min how many cops need to be in a group for the line to play
	queue what call is used in chatter
	]]--
	self.enemy_chatter.csalpha = {
		radius = 6000,
		max_nr = 1,
		duration = {3, 4},
		interval = {2, 4},
		group_min = 0,
		queue = "gr2a"
	}
	self.enemy_chatter.csbravo = {
		radius = 6000,
		max_nr = 1,
		duration = {3, 4},
		interval = {2, 4},
		group_min = 0,
		queue = "gr2b"
	}
	self.enemy_chatter.cscharlie = {
		radius = 6000,
			max_nr = 1,
			duration = {3, 4},
		interval = {2, 4},
		group_min = 0,
			queue = "gr2c"
	}
	self.enemy_chatter.csdelta = {
		radius = 6000,
			max_nr = 1,
			duration = {3, 4},
		interval = {2, 4},
		group_min = 0,
			queue = "gr2d"
	}
	self.enemy_chatter.hrtalpha = {
		radius = 6000,
			max_nr = 1,
			duration = {3, 4},
		interval = {2, 4},
		group_min = 0,
		queue = "gr1a"
	}
	self.enemy_chatter.hrtbravo = {
		radius = 6000,
			max_nr = 1,
			duration = {3, 4},
		interval = {2, 4},
		group_min = 0,
			queue = "gr1b"
	}
	self.enemy_chatter.hrtcharlie = {
		radius = 6000,
			max_nr = 1,
			duration = {3, 4},
		interval = {2, 4},
		group_min = 0,
			queue = "gr1c"
	}
	self.enemy_chatter.hrtdelta = {
		radius = 6000,
			max_nr = 1,
			duration = {3, 4},
		interval = {2, 4},
		group_min = 0,
			queue = "gr1d"
	}
	self.enemy_chatter.aggressive = {
		radius = 700,
		max_nr = 10,
		duration = {3, 4},
		interval = {1.5, 2},
		group_min = 0,
		queue = "g90"
	}
	self.enemy_chatter.aggressive_assault = {--cops use less idle chatter during assaults 
		radius = 700,
		max_nr = 10,
		duration = {3, 4},
		interval = {2, 2.5},
		group_min = 0,
		queue = "g90"
	}
	self.enemy_chatter.open_fire = {
		radius = 1000,
		max_nr = 10,
		duration = {2, 4},
		interval = {0.75, 1.5},
		group_min = 0,
		queue = "att"
	}
	self.enemy_chatter.aggressive_captain = {
		radius = 700,
		max_nr = 20,
		duration = {2, 4},
		interval = {0.75, 1.5},
		group_min = 0,
		queue = "a05"
	}			
	self.enemy_chatter.retreat = {
		radius = 700,
		max_nr = 3,
		duration = {2, 4},
		interval = {2, 4},
		group_min = 0,
		queue = "m01"
	}		
	self.enemy_chatter.deathguard = { --this isnt actually kill lines those are done in playerdamage
		radius = 700,
		max_nr = 5,
		duration = {2, 4},
		interval = {2, 3},
		group_min = 0,
		queue = "r01"
	}
	self.enemy_chatter.contact = {
		radius = 700,
		max_nr = 5,
		duration = {1, 3},
		interval = {0.75, 1.5},
		group_min = 2,
		queue = "c01"
	}
	self.enemy_chatter.clear = {
		radius = 700,
		max_nr = 3,
		duration = {60, 60},
		interval = {0.75, 1.5},
		group_min = 2,
		queue = "clr"
	}
	self.enemy_chatter.clear_whisper = {
		radius = 700,
		max_nr = 2,
		duration = {60, 60},
		interval = {5, 5},
		group_min = 0,
		queue = "a05"
	}		
	self.enemy_chatter.clear_whisper_2 = {
		radius = 700,
		max_nr = 2,
		duration = {60, 60},
		interval = {5, 5},
		group_min = 0,
		queue = "a06"
	}		
	self.enemy_chatter.go_go = {
		radius =  1000,
		max_nr = 20,
		duration = {2, 2},
		interval = {0.75, 1},
		group_min = 0,
		queue = "mov"
	}
	self.enemy_chatter.push = {
		radius = 1000,
		max_nr = 20,
		duration = {2, 4},
		interval = {0.75, 1.5},
		group_min = 0,
		queue = "pus"
	}
	self.enemy_chatter.reload = {
		radius = 700,
		max_nr = 3,
		duration = {2, 4},
		interval = {15, 15},
		group_min = 0,
		queue = "rrl"
	}
	self.enemy_chatter.look_for_angle = {
		radius = 700,
		max_nr = 20,
		duration = {2, 4},
		interval = {0.75, 1.5},
		group_min = 0,
		queue = "t01"
	}
	self.enemy_chatter.ready = {
		radius = 1000,
		max_nr = 20,
		duration = {2, 4},
		interval = {0.75, 1.5},
		group_min = 0,
		queue = "rdy"
	}
	self.enemy_chatter.smoke = {
		radius = 1000,
		max_nr = 3,
		duration = {2, 2},
		interval = {0.1, 0.1},
		group_min = 0,
		queue = "d01"
	}
	self.enemy_chatter.flash_grenade = {
		radius = 1000,
		max_nr = 3,
		duration = {2, 2},
		interval = {0.1, 0.1},
		group_min = 0,
		queue = "d02"
	}
	self.enemy_chatter.ecm = {
		radius = 1000,
		max_nr = 20,
		duration = {2, 4},
		interval = {0.75, 1.5},
		group_min = 0,
		queue = "ch3"
	}
	self.enemy_chatter.saw = {
		radius = 1000,
		max_nr = 20,
		duration = {2, 4},
		interval = {0.75, 1.5},
		group_min = 0,
		queue = "ch4"
	}
	self.enemy_chatter.trip_mines = {
		radius = 1000,
		max_nr = 20,
		duration = {2, 4},
		interval = {0.75, 1.5},
		group_min = 0,
		queue = "ch1"
	}
	self.enemy_chatter.sentry = {
		radius = 1000,
		max_nr = 20,
		duration = {2, 4},
		interval = {0.75, 1.5},
		group_min = 0,
		queue = "ch2"
	}
	self.enemy_chatter.incomming_captain = {
		radius = 1500,
		max_nr = 1,
		duration = {10, 10},
		interval = {0.5, 1},
		group_min = 0,
		queue = "att"
	}
	self.enemy_chatter.incomming_gren = {
		radius = 1500,
		max_nr = 1,
		duration = {10, 10},
		interval = {0.5, 1},
		group_min = 0,
		queue = "bak"
	}
	self.enemy_chatter.incomming_tank = {
		radius = 1500,
		max_nr = 1,
		duration = {10, 10},
		interval = {0.5, 1},
		group_min = 0,
		queue = "lk3b"
	}
	self.enemy_chatter.incomming_spooc = {
		radius = 1200,
		max_nr = 1,
		duration = {10, 10},
		interval = {0.5, 1},
		group_min = 0,
		queue = "r01"
	}
	self.enemy_chatter.incomming_shield = {
		radius = 1500,
		max_nr = 1,
		duration = {10, 10},
		interval = {0.5, 1},
		group_min = 0,
		queue = "pos"
	}
	self.enemy_chatter.incomming_taser = {
		radius = 1500,
		max_nr = 1,
		duration = {60, 60},
		interval = {0.5, 1},
		group_min = 0,
		queue = "bak"
	}
	self.enemy_chatter.heal_chatter = {
		radius = 700,
		max_nr = 10,
		duration = {2, 4},
		interval = {1.5, 3.5},
		group_min = 0,
		queue = "heal"
	}	
	self.enemy_chatter.heal_chatter_winters = {
		radius = 700,
		max_nr = 10,
		duration = {2, 4},
		interval = {8.5, 10.5},
		group_min = 0,
		queue = "a05"
	}	

	if difficulty_index <= 2 then
		self.special_unit_spawn_limits = {
			tank = 1,
			taser = 1,
			spooc = 0,
			shield = 2
		}
	elseif difficulty_index == 3 then
		self.special_unit_spawn_limits = {
			tank = 1,
			taser = 2,
			spooc = 1,
			shield = 4
		}
	elseif difficulty_index == 4 then
		self.special_unit_spawn_limits = {
			tank = 3,
			taser = 4,
			spooc = 2,
			shield = 5
		}
	elseif difficulty_index == 5 then
		self.special_unit_spawn_limits = {
			tank = 3,
			taser = 4,
			spooc = 3,
			shield = 5
		}
	else
		self.special_unit_spawn_limits = {
			medic = 2,
			tank = 3,
			taser = 4,
			spooc = 4,
			shield = 5
		}
	end

	local fbi_swat_2 = Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2")
	local fbi_heavy_1 = Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1")
	local city_swat_1 = Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1")
	local city_swat_2 = Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2")
	local city_heavy_g36 = Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36")
	local shield_1 = Idstring("units/payday2/characters/ene_shield_1/ene_shield_1")
	local city_shield = Idstring("units/payday2/characters/ene_city_shield/ene_city_shield")
	local bulldozer_1 = Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1")
	local bulldozer_2 = Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2")
	local bulldozer_3 = Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3")
	
	local murkywater_secret_service = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_secret_service/ene_murkywater_secret_service")

	local secret_service_1 = Idstring("units/pd2_dlc_gitgud/characters/ene_secret_service_1/ene_secret_service_1")
	local secret_service_2 = Idstring("units/pd2_dlc_gitgud/characters/ene_secret_service_2/ene_secret_service_2")
	local zeal_swat_light = Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_light/ene_zeal_swat_light")
	local zeal_swat = Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat")
	local zeal_swat_heavy_op = Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_op/ene_zeal_swat_heavy_op")
	local zeal_swat_heavy = Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy")
	local zeal_shield = Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield")
	local zeal_tazer = Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer")
	local zeal_cloaker = Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker")
	local zeal_bulldozer_1 = Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer")
	local zeal_bulldozer_2 = Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2")
	local zeal_bulldozer_3 = Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3")
	local zeal_bulldozer_minigun = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun")

	local akan_fbi_swat_r870 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870")
	local akan_tank_r870 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870")
	local akan_tank_saiga = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga")
	local akan_tank_rpk_lmg = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg")

	local bulldozer_hvh_1 = Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1")
	local bulldozer_hvh_2 = Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2")
	local bulldozer_hvh_3 = Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3")
	
	local murkywater_heavy_g36 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36")
	local murkywater_city = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_city_g36/ene_murkywater_city_g36")
	local murkywater_city_shotgun = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_city_g36/ene_murkywater_city_shotgun")
	local murkywater_tank_1 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_2/ene_murkywater_bulldozer_2")
	local murkywater_tank_2 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_3/ene_murkywater_bulldozer_3")
	local murkywater_tank_3 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_4/ene_murkywater_bulldozer_4")
	local murkywater_tank_mini = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_1/ene_murkywater_bulldozer_1")

	local policia_01 = Idstring("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01")
	local policia_02 = Idstring("units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02")
	local fbi_bex_1 = Idstring("units/pd2_dlc_bex/characters/ene_fbi_bex_1/ene_fbi_bex_1")
	local fbi_bex_2 = Idstring("units/pd2_dlc_bex/characters/ene_fbi_bex_2/ene_fbi_bex_2")
	local heavy_policia_federale_fbi = Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi/ene_swat_heavy_policia_federale_fbi")
	local policia_federale_city_g36 = Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_g36/ene_swat_policia_federale_city_g36")
	local policia_federale_city_shotgun = Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_g36/ene_swat_policia_federale_city_shotgun")
	local dozer_policia_federale_1 = Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870")
	local dozer_policia_federale_2 = Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_saiga/ene_swat_dozer_policia_federale_saiga")
	local dozer_policia_federale_3 = Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_m249/ene_swat_dozer_policia_federale_m249")
	local dozer_policia_federale_mini = Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_minigun/ene_swat_dozer_policia_federale_minigun")
	
	self.unit_categories.CS_cop_C45_R870.unit_types.murkywater = {murkywater_secret_service}
	self.unit_categories.CS_cop_stealth_MP5.unit_types.murkywater = {secret_service_1}
	self.unit_categories.FBI_suit_C45_M4.unit_types.murkywater = {secret_service_1}
	self.unit_categories.FBI_suit_M4_MP5.unit_types.murkywater = {
		secret_service_1, 
		murkywater_secret_service
	}
	self.unit_categories.FBI_suit_stealth_MP5.unit_types.murkywater = {murkywater_secret_service}	
	self.unit_categories.FBI_heavy_G36.unit_types.murkywater = {murkywater_heavy_g36}
	self.unit_categories.FBI_heavy_G36_w.unit_types.murkywater = {murkywater_heavy_g36}		
			
	self.unit_categories.CS_cop_C45_R870.unit_types.federales = {policia_01}
	self.unit_categories.CS_cop_stealth_MP5.unit_types.federales = {policia_02}
	self.unit_categories.FBI_suit_C45_M4.unit_types.federales = {
		fbi_bex_1,
		secret_service_1
	}
	self.unit_categories.FBI_suit_M4_MP5.unit_types.federales = {
		secret_service_1, 
		fbi_bex_2
	}
	self.unit_categories.FBI_suit_stealth_MP5.unit_types.federales = {fbi_bex_2}
	self.unit_categories.FBI_heavy_G36_w.unit_types.federales = {heavy_policia_federale_fbi}
	self.unit_categories.FBI_heavy_G36.unit_types.federales = {heavy_policia_federale_fbi}
	
	if difficulty_index < 6 then
		self.unit_categories.FBI_tank.unit_types.america = {
			bulldozer_1,
			bulldozer_2
		}
		self.unit_categories.FBI_tank.unit_types.russia = {
			akan_tank_r870,
			akan_tank_saiga
		}
		self.unit_categories.FBI_tank.unit_types.zombie = {
			bulldozer_hvh_1,
			bulldozer_hvh_2
		}
		self.unit_categories.FBI_tank.unit_types.murkywater = {
			murkywater_tank_1,
			murkywater_tank_2
		}
		self.unit_categories.FBI_tank.unit_types.federales = {
			dozer_policia_federale_1,
			dozer_policia_federale_2
		}
		self.unit_categories.FBI_heavy_G36.unit_types.federales = {heavy_policia_federale_fbi}
	end
		
	if difficulty_index > 5 then
		self.unit_categories.FBI_swat_M4.unit_types.zombie = {city_swat_1}
		self.unit_categories.FBI_swat_M4.unit_types.murkywater = {murkywater_city}
		self.unit_categories.FBI_swat_M4.unit_types.federales = {policia_federale_city_g36}
	end
	
	if difficulty == "overkill_290" then
		self.unit_categories.FBI_swat_R870.unit_types.america = {fbi_swat_2}
		self.unit_categories.FBI_heavy_G36.unit_types.america = {fbi_heavy_1}
		self.unit_categories.FBI_shield.unit_types.america = {shield_1}
		self.unit_categories.FBI_tank.unit_types.america = {
			bulldozer_2,
			bulldozer_3
		}
		self.unit_categories.FBI_swat_R870.unit_types.russia = {akan_fbi_swat_r870}
		self.unit_categories.FBI_tank.unit_types.russia = {
			akan_tank_saiga,
			akan_tank_rpk_lmg
		}
		self.unit_categories.FBI_tank.unit_types.zombie = {
			bulldozer_hvh_2,
			bulldozer_hvh_3
		}
		self.unit_categories.FBI_tank.unit_types.murkywater = {
			murkywater_tank_2,
			murkywater_tank_3
		}
		self.unit_categories.FBI_tank.unit_types.federales = {
			dozer_policia_federale_2,
			dozer_policia_federale_3
		}
	elseif difficulty == "easy_wish" then
		self.unit_categories.FBI_swat_R870.unit_types.america = {city_swat_2}
		self.unit_categories.FBI_heavy_G36_w.unit_types.america = {city_heavy_g36}
		self.unit_categories.FBI_tank.unit_types.america = {
			bulldozer_1,
			bulldozer_2,
			bulldozer_3
		}
		self.unit_categories.FBI_tank.unit_types.russia = {
			akan_tank_r870,
			akan_tank_saiga,
			akan_tank_rpk_lmg
		}
		self.unit_categories.FBI_swat_R870.unit_types.zombie = {city_swat_2}
		self.unit_categories.FBI_heavy_G36.unit_types.zombie = {city_heavy_g36}
		self.unit_categories.FBI_heavy_G36_w.unit_types.zombie = {city_heavy_g36}
		self.unit_categories.FBI_shield.unit_types.zombie = {city_shield}
		self.unit_categories.FBI_tank.unit_types.zombie = {
			bulldozer_hvh_1,
			bulldozer_hvh_2,
			bulldozer_hvh_3
		}
		self.unit_categories.FBI_swat_R870.unit_types.murkywater = {murkywater_city_shotgun}
		self.unit_categories.FBI_tank.unit_types.murkywater = {
			murkywater_tank_1,
			murkywater_tank_2,
			murkywater_tank_3
		}
		self.unit_categories.FBI_swat_R870.unit_types.federales = {policia_federale_city_shotgun}
		self.unit_categories.FBI_tank.unit_types.federales = {
			dozer_policia_federale_1,
			dozer_policia_federale_2,
			dozer_policia_federale_3
		}
	elseif difficulty == "sm_wish" then
		local zeal_dozers = {
			zeal_bulldozer_1,
			zeal_bulldozer_2,
			zeal_bulldozer_3,
			zeal_bulldozer_minigun
		}
		self.unit_categories.FBI_swat_R870.unit_types.america = {zeal_swat_light}
		self.unit_categories.FBI_heavy_G36_w.unit_types.america = {zeal_swat_heavy_op}
		self.unit_categories.FBI_tank.unit_types.america = zeal_dozers
		self.unit_categories.FBI_tank.unit_types.russia = {
			akan_tank_r870,
			akan_tank_saiga,
			akan_tank_rpk_lmg,
			zeal_bulldozer_minigun
		}
		self.unit_categories.FBI_swat_R870.unit_types.zombie = {zeal_swat_light}
		self.unit_categories.FBI_swat_M4.unit_types.zombie = {zeal_swat}
		self.unit_categories.FBI_heavy_G36.unit_types.zombie = {zeal_swat_heavy}
		self.unit_categories.FBI_heavy_G36_w.unit_types.zombie = {zeal_swat_heavy_op}
		self.unit_categories.FBI_shield.unit_types.zombie = {zeal_shield}
		self.unit_categories.CS_tazer.unit_types.zombie = {zeal_tazer}
		self.unit_categories.spooc.unit_types.zombie = {zeal_cloaker}
		self.unit_categories.FBI_tank.unit_types.zombie = zeal_dozers
		self.unit_categories.FBI_swat_R870.unit_types.murkywater = {murkywater_city_shotgun}
		self.unit_categories.FBI_tank.unit_types.murkywater = {
			murkywater_tank_1,
			murkywater_tank_2,
			murkywater_tank_3,
			murkywater_tank_mini
		}
		self.unit_categories.FBI_swat_R870.unit_types.federales = {policia_federale_city_shotgun}
		self.unit_categories.FBI_tank.unit_types.federales = {
			dozer_policia_federale_1,
			dozer_policia_federale_2,
			dozer_policia_federale_3,
			dozer_policia_federale_mini
		}
	end
		
	if difficulty == "easy_wish" or difficulty == "sm_wish" then
		local secret_service = {
			secret_service_1,
			secret_service_2
		}
		self.unit_categories.FBI_suit_M4_MP5.unit_types.america = {murkywater_secret_service}
		self.unit_categories.FBI_suit_stealth_MP5.unit_types.america = secret_service
		self.unit_categories.FBI_suit_M4_MP5.unit_types.zombie = {murkywater_secret_service}
		self.unit_categories.FBI_suit_stealth_MP5.unit_types.zombie = secret_service
	end
	
	self._tactics = {
		CS_cop = {
			"provide_coverfire",
			"provide_support",
			"ranged_fire",
			"groupcsr"
		},
		CS_cop_stealth = {
			"flank",
			"provide_coverfire",
			"provide_support"
		},
		CS_swat_rifle = {
			"smoke_grenade",
			"charge",
			"provide_coverfire",
			"provide_support",
			"ranged_fire",
			"deathguard",
			"groupcsr"
		},
		CS_swat_shotgun = {
			"smoke_grenade",
			"charge",
			"provide_coverfire",
			"provide_support",
			"shield_cover",
			"groupcsr"
		},
		CS_swat_heavy = {
			"smoke_grenade",
			"charge",
			"flash_grenade",
			"provide_coverfire",
			"provide_support",
			"groupcsr"
		},
		CS_shield = {
			"charge",
			"provide_coverfire",
			"provide_support",
			"shield",
			"deathguard"
		},
		CS_swat_rifle_flank = {
			"flank",
			"flash_grenade",
			"smoke_grenade",
			"charge",
			"provide_coverfire",
			"provide_support"
		},
		CS_swat_shotgun_flank = {
			"flank",
			"flash_grenade",
			"smoke_grenade",
			"charge",
			"provide_coverfire",
			"provide_support"
		},
		CS_swat_heavy_flank = {
			"flank",
			"flash_grenade",
			"smoke_grenade",
			"charge",
			"provide_coverfire",
			"provide_support",
			"shield_cover"
		},
		CS_shield_flank = {
			"flank",
			"charge",
			"flash_grenade",
			"provide_coverfire",
			"provide_support",
			"shield"
		},
		CS_tazer = {
			"flank",
			"charge",
			"flash_grenade",
			"shield_cover",
			"murder"
		},
		CS_sniper = {
			"ranged_fire",
			"provide_coverfire",
			"provide_support"
		},
		FBI_suit = {
			"flank",
			"ranged_fire",
			"flash_grenade",
			"grouphrtr"
		},
		FBI_suit_stealth = {
			"provide_coverfire",
			"provide_support",
			"flash_grenade",
			"flank",
			"grouphrtr"
		},
		FBI_swat_rifle = {
			"smoke_grenade",
			"flash_grenade",
			"provide_coverfire",
			"charge",
			"provide_support",
			"ranged_fire",
			"groupcsr"
		},
		FBI_swat_shotgun = {
			"smoke_grenade",
			"flash_grenade",
			"charge",
			"provide_coverfire",
			"provide_support",
			"groupcsr"
		},
		FBI_heavy = {
			"smoke_grenade",
			"flash_grenade",
			"charge",
			"provide_coverfire",
			"provide_support",
			"shield_cover",
			"deathguard",
			"groupcsr"
		},
		FBI_shield = {
			"smoke_grenade",
			"charge",
			"provide_coverfire",
			"provide_support",
			"shield",
			"deathguard"
		},
		FBI_swat_rifle_flank = {
			"flank",
			"smoke_grenade",
			"flash_grenade",
			"charge",
			"provide_coverfire",
			"provide_support"
		},
		FBI_swat_shotgun_flank = {
			"flank",
			"smoke_grenade",
			"flash_grenade",
			"charge",
			"provide_coverfire",
			"provide_support"
		},
		FBI_heavy_flank = {
			"flank",
			"smoke_grenade",
			"flash_grenade",
			"charge",
			"provide_coverfire",
			"provide_support",
			"shield_cover"
		},
		FBI_shield_flank = {
			"flank",
			"smoke_grenade",
			"flash_grenade",
			"charge",
			"provide_coverfire",
			"provide_support",
			"shield"
		},
		FBI_tank = {
			"charge",
			"deathguard",
			"shield_cover",
			"smoke_grenade"
		},
		Phalanx_minion = {
			"smoke_grenade",
			"charge",
			"provide_coverfire",
			"provide_support",
			"shield",
			"deathguard"
		},
		Phalanx_vip = {
			"smoke_grenade",
			"charge",
			"provide_coverfire",
			"provide_support",
			"shield",
			"deathguard"
		},
		spooc = {
			"charge",
			"shield_cover",
			"smoke_grenade"
		}
	}
	self.enemy_spawn_groups.CS_defend_a = {
		amount = {3, 4},
		spawn = {
			{
				unit = "CS_cop_C45_R870",
				freq = 1,
				tactics = self._tactics.CS_cop,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.CS_defend_b = {
		amount = {3, 4},
		spawn = {
			{
				unit = "CS_swat_MP5",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.CS_cop,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.CS_defend_c = {
		amount = {3, 4},
		spawn = {
			{
				unit = "CS_heavy_M4",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.CS_cop,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.CS_cops = {
		amount = {3, 4},
		spawn = {
			{
				unit = "CS_cop_C45_R870",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.CS_cop,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.CS_stealth_a = {
		amount = {2, 3},
		spawn = {
			{
				unit = "CS_cop_stealth_MP5",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.CS_cop_stealth,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.CS_swats = {
		amount = {3, 4},
		spawn = {
			{
				unit = "CS_swat_MP5",
				freq = 1,
				tactics = self._tactics.CS_swat_rifle,
				rank = 2
			},
			{
				unit = "CS_swat_R870",
				freq = 0.5,
				amount_max = 2,
				tactics = self._tactics.CS_swat_shotgun,
				rank = 1
			},
			{
				unit = "CS_swat_MP5",
				freq = 0.33,
				tactics = self._tactics.CS_swat_rifle_flank,
				rank = 3
			}
		}
	}
	self.enemy_spawn_groups.CS_heavys = {
		amount = {3, 4},
		spawn = {
			{
				unit = "CS_heavy_M4",
				freq = 1,
				tactics = self._tactics.CS_swat_rifle,
				rank = 2
			},
			{
				unit = "CS_heavy_M4",
				freq = 0.35,
				tactics = self._tactics.CS_swat_rifle_flank,
				rank = 3
			}
		}
	}
	self.enemy_spawn_groups.CS_shields = {
		amount = {3, 4},
		spawn = {
			{
				unit = "CS_shield",
				freq = 1,
				amount_min = 1,
				amount_max = 2,
				tactics = self._tactics.CS_shield,
				rank = 3
			},
			{
				unit = "CS_cop_stealth_MP5",
				freq = 0.5,
				amount_max = 1,
				tactics = self._tactics.CS_cop_stealth,
				rank = 1
			},
			{
				unit = "CS_heavy_M4_w",
				freq = 0.75,
				amount_max = 1,
				tactics = self._tactics.CS_swat_heavy,
				rank = 2
			}
		}
	}	
	if difficulty_index < 6 then
		self.enemy_spawn_groups.CS_tazers = {
			amount = {1, 3},
			spawn = {
				{
					unit = "CS_tazer",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.CS_tazer,
					rank = 2
				},
				{
					unit = "CS_swat_MP5",
					freq = 1,
					amount_max = 2,
					tactics = self._tactics.CS_cop_stealth,
					rank = 1
				}
			}
		}
	else
		self.enemy_spawn_groups.CS_tazers = {
			amount = {4, 4},
			spawn = {
				{
					unit = "CS_tazer",
					freq = 1,
					amount_min = 3,
					tactics_ = self._tactics.CS_tazer,
					rank = 1
				},
				{
					unit = "FBI_shield",
					freq = 1,
					amount_min = 2,
					amount_max = 3,
					tactics = self._tactics.FBI_shield,
					rank = 3
				},
				{
					unit = "FBI_heavy_G36",
					freq = 1,
					amount_max = 2,
					tactics = self._tactics.FBI_swat_rifle,
					rank = 1
				}
			}
		}
	end
	self.enemy_spawn_groups.CS_tanks = {
		amount = {1, 2},
		spawn = {
			{
				unit = "FBI_tank",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.FBI_tank,
				rank = 2
			},
			{
				unit = "CS_tazer",
				freq = 0.5,
				amount_max = 1,
				tactics = self._tactics.CS_tazer,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.FBI_defend_a = {
		amount = {3, 3},
		spawn = {
			{
				unit = "FBI_suit_C45_M4",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.FBI_suit,
				rank = 2
			},
			{
				unit = "CS_cop_C45_R870",
				freq = 1,
				tactics = self._tactics.FBI_suit,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.FBI_defend_b = {
		amount = {3, 3},
		spawn = {
			{
				unit = "FBI_suit_M4_MP5",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.FBI_suit,
				rank = 2
			},
			{
				unit = "FBI_swat_M4",
				freq = 1,
				tactics = self._tactics.FBI_suit,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.FBI_defend_c = {
		amount = {3, 3},
		spawn = {
			{
				unit = "FBI_swat_M4",
				freq = 1,
				tactics = self._tactics.FBI_suit,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.FBI_defend_d = {
		amount = {2, 3},
		spawn = {
			{
				unit = "FBI_heavy_G36",
				freq = 1,
				tactics = self._tactics.FBI_suit,
				rank = 1
			}
		}
	}
	if difficulty_index < 6 then
		self.enemy_spawn_groups.FBI_stealth_a = {
			amount = {2, 3},
			spawn = {
				{
					unit = "FBI_suit_stealth_MP5",
					freq = 1,
					amount_min = 1,
					tactics = self._tactics.FBI_suit_stealth,
					rank = 1
				},
				{
					unit = "CS_tazer",
					freq = 1,
					amount_max = 2,
					tactics = self._tactics.CS_tazer,
					rank = 2
				}
			}
		}
	else
		self.enemy_spawn_groups.FBI_stealth_a = {
			amount = {3, 4},
			spawn = {
				{
					unit = "FBI_suit_stealth_MP5",
					freq = 1,
					amount_min = 1,
					tactics = self._tactics.FBI_suit_stealth,
					rank = 2
				},
				{
					unit = "CS_tazer",
					freq = 1,
					amount_max = 2,
					tactics = self._tactics.CS_tazer,
					rank = 1
				}
			}
		}
	end
	if difficulty_index < 6 then
		self.enemy_spawn_groups.FBI_stealth_b = {
			amount = {2, 3},
			spawn = {
				{
					unit = "FBI_suit_stealth_MP5",
					freq = 1,
					amount_min = 1,
					tactics = self._tactics.FBI_suit_stealth,
					rank = 1
				},
				{
					unit = "FBI_suit_M4_MP5",
					freq = 0.75,
					tactics = self._tactics.FBI_suit,
					rank = 2
				}
			}
		}
	else
		self.enemy_spawn_groups.FBI_stealth_b = {
			amount = {4, 4},
			spawn = {
				{
					unit = "FBI_suit_stealth_MP5",
					freq = 1,
					amount_min = 1,
					tactics = self._tactics.FBI_suit_stealth,
					rank = 1
				},
				{
					unit = "FBI_suit_M4_MP5",
					freq = 0.75,
					tactics = self._tactics.FBI_suit_stealth,
					rank = 2
				}
			}
		}
	end
	if difficulty_index < 6 then
		self.enemy_spawn_groups.FBI_swats = {
			amount = {3, 4},
			spawn = {
				{
					unit = "FBI_swat_M4",
					freq = 1,
					amount_min = 1,
					tactics = self._tactics.FBI_swat_rifle,
					rank = 2
				},
				{
					unit = "FBI_swat_M4",
					freq = 0.75,
					tactics = self._tactics.FBI_swat_rifle_flank,
					rank = 3
				},
				{
					unit = "FBI_swat_R870",
					freq = 0.5,
					amount_max = 2,
					tactics = self._tactics.FBI_swat_shotgun,
					rank = 1
				},
				{
					unit = "spooc",
					freq = 0.15,
					amount_max = 2,
					tactics = self._tactics.spooc,
					rank = 1
				}
			}
		}
	else
		self.enemy_spawn_groups.FBI_swats = {
			amount = {3, 4},
			spawn = {
				{
					unit = "FBI_swat_M4",
					freq = 1,
					amount_min = 3,
					tactics = self._tactics.FBI_swat_rifle,
					rank = 1
				},
				{
					unit = "FBI_suit_M4_MP5",
					freq = 1,
					tactics = self._tactics.FBI_swat_rifle_flank,
					rank = 2
				},
				{
					unit = "FBI_swat_R870",
					amount_min = 2,
					freq = 1,
					tactics = self._tactics.FBI_swat_shotgun,
					rank = 3
				}
			}
		}
	end
	if difficulty_index < 6 then
		self.enemy_spawn_groups.FBI_heavys = {
			amount = {2, 3},
			spawn = {
				{
					unit = "FBI_heavy_G36",
					freq = 1,
					tactics = self._tactics.FBI_swat_rifle,
					rank = 1
				},
				{
					unit = "FBI_heavy_G36",
					freq = 0.75,
					tactics = self._tactics.FBI_swat_rifle_flank,
					rank = 2
				},
				{
					unit = "CS_tazer",
					freq = 0.25,
					amount_max = 1,
					tactics = self._tactics.CS_tazer,
					rank = 3
				}
			}
		}
	else
		self.enemy_spawn_groups.FBI_heavys = {
			amount = {3, 4},
			spawn = {
				{
					unit = "FBI_heavy_G36_w",
					freq = 1,
					amount_min = 4,
					tactics = self._tactics.FBI_swat_rifle,
					rank = 1
				},
				{
					unit = "FBI_swat_M4",
					freq = 1,
					amount_min = 3,
					tactics = self._tactics.FBI_heavy_flank,
					rank = 2
				}
			}
		}
	end
	if difficulty_index == 8 then
		self.enemy_spawn_groups.FBI_shields = {
			amount = {3, 4},
			spawn = {
				{
					unit = "FBI_shield",
					freq = 1,
					amount_min = 3,
					amount_max = 4,
					tactics = self._tactics.FBI_shield,
					rank = 3
				},
				{
					unit = "FBI_suit_stealth_MP5",
					freq = 1,
					amount_min = 1,
					tactics = self._tactics.FBI_suit_stealth,
					rank = 1
				},
				{
					unit = "spooc",
					freq = 0.15,
					amount_max = 2,
					tactics = self._tactics.spooc,
					rank = 1
				},
				{
					unit = "medic_R870",
					freq = 0.75,
					amount_min = 2,
					tactics = self._tactics.CS_swat_heavy,
					rank = 2
				},
				{
					unit = "CS_tazer",
					freq = 0.75,
					amount_min = 2,
					tactics = self._tactics.CS_swat_heavy,
					rank = 2
				}
			}
		}
	elseif difficulty_index < 6 then
		self.enemy_spawn_groups.FBI_shields = {
			amount = {3, 4},
			spawn = {
				{
					unit = "FBI_shield",
					freq = 1,
					amount_min = 1,
					amount_max = 2,
					tactics = self._tactics.FBI_shield_flank,
					rank = 3
				},
				{
					unit = "CS_tazer",
					freq = 0.75,
					amount_max = 1,
					tactics = self._tactics.CS_tazer,
					rank = 2
				},
				{
					unit = "FBI_heavy_G36",
					freq = 0.5,
					amount_max = 1,
					tactics = self._tactics.FBI_swat_rifle_flank,
					rank = 1
				}
			}
		}
	else
		self.enemy_spawn_groups.FBI_shields = {
			amount = {3, 4},
			spawn = {
				{
					unit = "FBI_shield",
					freq = 1,
					amount_min = 3,
					amount_max = 4,
					tactics = self._tactics.FBI_shield,
					rank = 3
				},
				{
					unit = "FBI_suit_stealth_MP5",
					freq = 1,
					amount_min = 1,
					tactics = self._tactics.FBI_suit_stealth,
					rank = 1
				},
				{
					unit = "spooc",
					freq = 0.15,
					amount_max = 2,
					tactics = self._tactics.spooc,
					rank = 1
				},
				{
					unit = "CS_tazer",
					freq = 0.75,
					amount_min = 2,
					tactics = self._tactics.CS_swat_heavy,
					rank = 2
				}
			}
		}
	end
	if difficulty_index < 6 then
		self.enemy_spawn_groups.FBI_tanks = {
			amount = {3, 4},
			spawn = {
				{
					unit = "FBI_tank",
					freq = 1,
					amount_max = 1,
					tactics = self._tactics.FBI_tank,
					rank = 1
				},
				{
					unit = "FBI_shield",
					freq = 0.5,
					amount_min = 1,
					amount_max = 2,
					tactics = self._tactics.FBI_shield_flank,
					rank = 3
				},
				{
					unit = "FBI_heavy_G36_w",
					freq = 0.75,
					amount_min = 1,
					tactics = self._tactics.FBI_heavy_flank,
					rank = 1
				}
			}
		}
	else
		self.enemy_spawn_groups.FBI_tanks = {
			amount = {4, 4},
			spawn = {
				{
					unit = "FBI_tank",
					freq = 1,
					amount_min = 2,
					tactics = self._tactics.FBI_tank,
					rank = 3
				},
				{
					unit = "FBI_shield",
					freq = 1,
					amount_min = 1,
					amount_max = 2,
					tactics = self._tactics.FBI_shield,
					rank = 3
				},
				{
					unit = "CS_tazer",
					freq = 0.75,
					amount_min = 1,
					tactics = self._tactics.FBI_swat_rifle,
					rank = 2
				}
			}
		}
	end

	if difficulty_index < 6 then
		self.smoke_and_flash_grenade_timeout = {10, 20}
	else
		self.smoke_and_flash_grenade_timeout = {4, 6}
	end
	
	if managers.job and managers.job:is_current_job_professional() then
		self.flash_grenade.timer = 0
	else
		if difficulty_index == 8 then
			self.flash_grenade.timer = 0.5
		elseif difficulty_index >= 5 then
			self.flash_grenade.timer = 1
		else
			self.flash_grenade.timer = 2
		end
	end
	
	if difficulty_index <= 2 then
		self.besiege.recurring_group_SO = {
			recurring_cloaker_spawn = {
				interval = {180, 300},
				retire_delay = 30
			},
			recurring_spawn_1 = {
				interval = {30, 60}
			}
		}
	elseif difficulty_index == 3 then
		self.besiege.recurring_group_SO = {
			recurring_cloaker_spawn = {
				interval = {60, 120},
				retire_delay = 30
			},
			recurring_spawn_1 = {
				interval = {30, 60}
			}
		}
	elseif difficulty_index == 4 then
		self.besiege.recurring_group_SO = {
			recurring_cloaker_spawn = {
				interval = {45, 60},
				retire_delay = 30
			},
			recurring_spawn_1 = {
				interval = {30, 60}
			}
		}
	elseif difficulty_index == 5 then
		self.besiege.recurring_group_SO = {
			recurring_cloaker_spawn = {
				interval = {20, 40},
				retire_delay = 30
			},
			recurring_spawn_1 = {
				interval = {30, 60}
			}
		}
	else
		self.besiege.recurring_group_SO = {
			recurring_cloaker_spawn = {
				interval = {20, 40},
				retire_delay = 30
			},
			recurring_spawn_1 = {
				interval = {30, 60}
			}
		}
	end
	
	self.besiege.assault.sustain_duration_min = {0, 80, 120}
	self.besiege.assault.sustain_duration_max = {0, 80, 120}
	if difficulty_index <= 2 then
		self.besiege.assault.delay = {80, 70, 30}
	elseif difficulty_index == 3 then         
		self.besiege.assault.delay = {45, 35, 20}
	elseif difficulty_index == 4 then         
		self.besiege.assault.delay = {40, 30, 20}
	elseif difficulty_index == 5 then         
		self.besiege.assault.delay = {30, 20, 15}
	else                                      
		self.besiege.assault.delay = {20, 15, 10}
	end
	if is_console then
		self.besiege.assault.force = 		{0, 4, 7}
		self.besiege.assault.force_pool = 	{0, 60, 100}
	else                                        
		self.besiege.assault.force = 		{0, 5, 7}
		self.besiege.assault.force_pool = 	{0, 20, 50}
	end
	
	if difficulty_index <= 2 then
		self.besiege.assault.groups = {
			CS_swats = 		{0,		1, 		0.85},
			CS_shields = 	{0,		0, 		0.15},
			single_spooc = 	{0,		0, 		0 	}
		}
	elseif difficulty_index == 3 then
		self.besiege.assault.groups = {
			CS_swats = 		{0,		1, 		0 	},
			CS_heavys = 	{0,		0.2, 	0.7 },
			CS_shields = 	{0,		0.02, 	0.2 },
			CS_tazers = 	{0,		0.05, 	0.15},
			CS_tanks = 		{0,		0.01, 	0.05},
			single_spooc = 	{0,		0, 		0 	}
		}
	elseif difficulty_index == 4 then
		self.besiege.assault.groups = {
			FBI_swats = 	{0.1, 		1, 			1	},
			FBI_heavys = 	{0.05,		0.25, 		0.5	},
			FBI_shields = 	{0.1, 		0.2, 		0.2	},
			FBI_tanks = 	{0, 		0.1, 		0.15},
			FBI_spoocs = 	{0, 		0.1, 		0.2	},
			CS_tazers = 	{0.05,		0.15, 		0.2	},
			single_spooc = 	{0, 		0, 			0	}
		}
	elseif difficulty_index == 5 then
		self.besiege.assault.groups = {
			FBI_swats = 	{0.2, 	1, 		1 	},
			FBI_heavys = 	{0.1, 	0.5, 	0.75},
			FBI_shields = 	{0.1, 	0.3, 	0.4 },
			FBI_tanks = 	{0, 	0.25, 	0.3 },
			CS_tazers = 	{0.1, 	0.25, 	0.25},
			single_spooc =	{0, 	0, 		0 	}
		}
	else
		self.besiege.assault.groups = {
			FBI_swats = 	{0.2,	0.8, 		0.8 },
			FBI_heavys = 	{0.1,	0.3, 		0.4 },
			FBI_shields = 	{0.1,	0.5, 		0.4 },
			FBI_tanks = 	{0.1,	0.5, 		0.5 },
			CS_tazers = 	{0.1,	0.5, 		0.45},
			FBI_spoocs = 	{0, 	0.45,		0.45},
			single_spooc = 	{1, 	1, 			1	}
		}
	end
	if difficulty_index <= 2 then
		self.besiege.reenforce.groups = {
			CS_defend_a = {1,	0.2,	0},
			CS_defend_b = {0,	1,		1}
		}
	elseif difficulty_index == 3 then
		self.besiege.reenforce.groups = {
			CS_defend_a = {1,	0,	0},
			CS_defend_b = {2,	1,	0},
			CS_defend_c = {0,	0,	1}
		}
	elseif difficulty_index == 4 then
		self.besiege.reenforce.groups = {
			CS_defend_a = 	{1,		0,		0},
			CS_defend_b = 	{2,		1,		0},
			CS_defend_c = 	{0,		0,		1},
			FBI_defend_a = 	{0,		1,		0},
			FBI_defend_b = 	{0,		0,		1}
		}
	elseif difficulty_index == 5 then
		self.besiege.reenforce.groups = {
			CS_defend_a = 	{0.1,	0,		0},
			FBI_defend_b = 	{1, 	1,		0},
			FBI_defend_c = 	{0, 	1,		0},
			FBI_defend_d = 	{0, 	0,		1}
		}
	else
		self.besiege.reenforce.groups = {
			CS_defend_a = 	{0.1,	0,		0},
			FBI_defend_b = 	{1, 	1,		0},
			FBI_defend_c = 	{0, 	1,		0},
			FBI_defend_d = 	{0, 	0,		1}
		}
	end
	if difficulty_index <= 2 then
		self.besiege.recon.groups = {
			CS_stealth_a = 	{1,		1,	0},
			CS_swats = 		{0,		1,	1},
			single_spooc = 	{0,		0,	0}
		}
	elseif difficulty_index == 3 then
		self.besiege.recon.groups = {
			CS_stealth_a = 	{1,		0, 		0	},
			CS_swats = 		{0,		1, 		1	},
			CS_tazers = 	{0,		0.1,	0.15},
			FBI_stealth_b = {0,		0, 		0.1	},
			single_spooc = 	{0,		0, 		0	}
		}
	elseif difficulty_index == 4 then
		self.besiege.recon.groups = {
			FBI_stealth_a = {1,		0.5,	0},
			FBI_stealth_b = {0,		0, 		1},
			single_spooc = 	{0,		0, 		0}
		}
	elseif difficulty_index == 5 then
		self.besiege.recon.groups = {
			FBI_stealth_a = {0.5, 		1, 		1},
			FBI_stealth_b = {0.25,		0.5,	1},
			single_spooc = 	{0, 		0, 		0}
		}
	else
		self.besiege.recon.groups = {
			FBI_stealth_a = {0.5, 	1, 		1},
			FBI_stealth_b = {0.25, 	0.5,	1},
			single_spooc = 	{0, 	0, 		0}
		}
	end
	
	self.phalanx.spawn_chance = {
		decrease = 0,
		start = 0,
		respawn_delay = 0,
		increase = 0,
		max = 0
	}
	
	self.street = deep_clone(self.besiege)
	self.safehouse = deep_clone(self.besiege)
end