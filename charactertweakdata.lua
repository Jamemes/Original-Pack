local data = CharacterTweakData._init_security
function CharacterTweakData:_init_security(presets)
	presets.hurt_severities.only_light_hurt.bullet.zones = {{ light = 1 }}
	presets.hurt_severities.only_light_hurt.explosion.zones = {{ light = 1 }}
	presets.hurt_severities.only_light_hurt.melee.zones = {{ light = 1 }}
	presets.hurt_severities.only_light_hurt.melee.zones = {{ light = 1 }}
	presets.hurt_severities.only_poison_and_light_hurt = deep_clone(presets.hurt_severities.only_light_hurt)
	presets.hurt_severities.only_poison_and_light_hurt.poison = {
		health_reference = 1,
		zones = {
			{
				poison = 1
			}
		}
	}
	presets.hurt_severities.only_explosion_and_light_hurt = deep_clone(presets.hurt_severities.only_light_hurt)
	presets.hurt_severities.only_explosion_and_light_hurt.explosion = {
		health_reference = "current",
		zones = {
			{
				explode = 1
			}
		}
	}
	presets.hurt_severities.base.melee.zones[1] = {
		health_limit = 0.3,
		none = 0.3,
		light = 0.7,
		moderate = 0,
		heavy = 0
	}
	presets.hurt_severities.base.melee.zones[2] = {
		health_limit = 0.8,
		light = 1,
		moderate = 0,
		heavy = 0
	}
	presets.hurt_severities.base.melee.zones[3] = {
		health_limit = 0.9,
		light = 0.6,
		moderate = 0.2,
		heavy = 0.2
	}
	presets.hurt_severities.base.melee.zones[4] = {
		light = 0,
		moderate = 0,
		heavy = 9
	}
	presets.hurt_severities.base_no_poison = deep_clone(presets.hurt_severities.base)
	presets.hurt_severities.base_no_poison.poison = {
		health_reference = 1,
		zones = {
			{
				none = 1
			}
		}
	}
	presets.gang_member_damage.BLEED_OUT_HEALTH_INIT = 10
	presets.gang_member_damage.hurt_severity.bullet = {
		health_reference = "current",
		zones = {
			{
				health_limit = 0.4,
				none = 0.3,
				light = 0.6,
				moderate = 0.1
			},
			{
				health_limit = 0.7,
				none = 0.1,
				light = 0.7,
				moderate = 0.2
			},
			{
				none = 0.1,
				light = 0.5,
				moderate = 0.3,
				heavy = 0.1
			}
		}
	}
	presets.gang_member_damage.MIN_DAMAGE_INTERVAL = 0
	presets.weapon.normal.is_pistol.melee_dmg = 8
	presets.weapon.normal.is_rifle.melee_dmg = 8
	presets.weapon.normal.is_bullpup.melee_dmg = 8
	presets.weapon.normal.is_shotgun_pump.melee_dmg = 8
	presets.weapon.normal.is_shotgun_mag.melee_dmg = 8
	presets.weapon.normal.is_smg.melee_dmg = 8
	presets.weapon.normal.is_revolver.melee_dmg = 8
	presets.weapon.normal.is_lmg.melee_dmg = 8
	presets.weapon.normal.is_flamethrower.melee_dmg = 8
	presets.weapon.good.is_pistol.melee_dmg = presets.weapon.normal.is_pistol.melee_dmg
	presets.weapon.expert.is_pistol.melee_dmg = presets.weapon.normal.is_pistol.melee_dmg
	presets.weapon.expert.is_rifle.focus_delay = 2
	presets.weapon.expert.is_rifle.focus_dis = 300
	presets.weapon.expert.is_rifle.RELOAD_SPEED = 1.2
	presets.weapon.expert.is_rifle.melee_dmg = 20
	presets.weapon.expert.is_rifle.FALLOFF[1].dmg_mul = 6
	presets.weapon.expert.is_rifle.FALLOFF[2].dmg_mul = 5.75
	presets.weapon.expert.is_rifle.FALLOFF[2].acc = {0.55, 0.95}
	presets.weapon.expert.is_rifle.FALLOFF[3].dmg_mul = 5.75
	presets.weapon.expert.is_rifle.FALLOFF[3].acc = {0.525, 0.8}
	presets.weapon.expert.is_rifle.FALLOFF[4].dmg_mul = 5.5
	presets.weapon.expert.is_rifle.FALLOFF[4].acc = {0.5, 0.7}
	presets.weapon.expert.is_rifle.FALLOFF[5].dmg_mul = 5.25
	presets.weapon.expert.is_rifle.FALLOFF[5].acc = {0.2, 0.4}
	presets.weapon.expert.is_bullpup = presets.weapon.expert.is_rifle
	presets.weapon.expert.is_shotgun_mag.RELOAD_SPEED = 1.2
	presets.weapon.expert.is_shotgun_mag.melee_dmg = 20
	presets.weapon.expert.is_shotgun_mag.FALLOFF[1].dmg_mul = 6.5
	presets.weapon.expert.is_shotgun_mag.FALLOFF[1].acc = {0.6, 0.95}
	presets.weapon.expert.is_shotgun_mag.FALLOFF[2].dmg_mul = 5.5
	presets.weapon.expert.is_shotgun_mag.FALLOFF[2].acc = {0.5, 0.9}
	presets.weapon.expert.is_shotgun_mag.FALLOFF[3].dmg_mul = 4
	presets.weapon.expert.is_shotgun_mag.FALLOFF[3].acc = {0.4, 0.75}
	presets.weapon.expert.is_shotgun_mag.FALLOFF[4].dmg_mul = 3.5
	presets.weapon.expert.is_shotgun_mag.FALLOFF[4].acc = {0.1, 0.55}
	presets.weapon.expert.is_shotgun_mag.FALLOFF[5].dmg_mul = 2.5
	presets.weapon.expert.is_shotgun_mag.FALLOFF[5].acc = {0.1, 0.35}
	presets.weapon.expert.is_shotgun_mag = presets.weapon.expert.is_shotgun_pump
	presets.surrender.easy = {
		base_chance = 0.75,
		significant_chance = 0.1,
		violence_timeout = 2,
		reasons = {
			health = {
				[1] = 0.2,
				[0.3] = 1
			},
			weapon_down = 0.8,
			pants_down = 1,
			isolated = 0.1
		},
		factors = {
			flanked = 0.07,
			unaware_of_aggressor = 0.08,
			enemy_weap_cold = 0.15,
			aggressor_dis = {
				[1000] = 0.02,
				[300] = 0.15
			}
		}
	}
	presets.surrender.normal = {
		base_chance = 0.5,
		significant_chance = 0.2,
		violence_timeout = 2,
		reasons = {
			health = {
				[1] = 0,
				[0.5] = 0.5
			},
			weapon_down = 0.5,
			pants_down = 1,
			isolated = 0.08
		},
		factors = {
			flanked = 0.05,
			unaware_of_aggressor = 0.1,
			enemy_weap_cold = 0.11,
			aggressor_dis = {
				[1000] = 0,
				[300] = 0.1
			}
		}
	}
	presets.enemy_chatter.cop = {
		aggressive = true,
		retreat = true,
		go_go = true,
		contact = true,
		suppress = true
	}
	
	data(self, presets)
end

function CharacterTweakData:_set_normal()
	self:_multiply_all_hp(1, 1)
	self:_multiply_weapon_delay(self.presets.weapon.normal, 0)
	self:_multiply_weapon_delay(self.presets.weapon.good, 0)
	self:_multiply_weapon_delay(self.presets.weapon.expert, 0)
	self:_multiply_weapon_delay(self.presets.weapon.sniper, 3)
	self:_multiply_weapon_delay(self.presets.weapon.gang_member, 0)
	self.presets.gang_member_damage.REGENERATE_TIME = 1.5
	self.presets.gang_member_damage.REGENERATE_TIME_AWAY = 0.2
	self.presets.gang_member_damage.HEALTH_INIT = 125
	self:_set_characters_weapon_preset("normal")
	self.flashbang_multiplier = 1
end

function CharacterTweakData:_set_hard()
	self:_multiply_all_hp(1, 1)
	self:_multiply_weapon_delay(self.presets.weapon.normal, 0)
	self:_multiply_weapon_delay(self.presets.weapon.good, 0)
	self:_multiply_weapon_delay(self.presets.weapon.expert, 0)
	self:_multiply_weapon_delay(self.presets.weapon.sniper, 3)
	self:_multiply_weapon_delay(self.presets.weapon.gang_member, 0)
	self.presets.gang_member_damage.REGENERATE_TIME = 2
	self.presets.gang_member_damage.REGENERATE_TIME_AWAY = 0.4
	self:_set_characters_weapon_preset("normal")
	self.presets.gang_member_damage.HEALTH_INIT = 160
	self.flashbang_multiplier = 1.25
	self.spooc.spooc_attack_timeout = {8, 10}
	self.sniper.weapon.is_rifle.FALLOFF = {
		{
			r = 700,
			acc = {0.6, 1},
			dmg_mul = 7,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.9},
			dmg_mul = 6,
			recoil = {4, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0, 0.3},
			dmg_mul = 3,
			recoil = {4, 6},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
end

function CharacterTweakData:_set_overkill()
	self:_multiply_all_hp(1, 1)
	self:_multiply_weapon_delay(self.presets.weapon.normal, 0)
	self:_multiply_weapon_delay(self.presets.weapon.good, 0)
	self:_multiply_weapon_delay(self.presets.weapon.expert, 0)
	self:_multiply_weapon_delay(self.presets.weapon.sniper, 3)
	self:_multiply_weapon_delay(self.presets.weapon.gang_member, 0)
	self.presets.gang_member_damage.REGENERATE_TIME = 2
	self.presets.gang_member_damage.REGENERATE_TIME_AWAY = 0.6
	self.presets.gang_member_damage.HEALTH_INIT = 200
	self:_set_characters_weapon_preset("good")
	self:_set_characters_weapon_preset("good")
	self.spooc.spooc_attack_timeout = {6, 8}
	self.sniper.weapon.is_rifle.FALLOFF = {
		{
			r = 700,
			acc = {0.7, 1},
			dmg_mul = 8,
			recoil = {3, 6},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.95},
			dmg_mul = 6,
			recoil = {4, 6},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0, 0.3},
			dmg_mul = 3.5,
			recoil = {4, 6},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.flashbang_multiplier = 1.5
end

function CharacterTweakData:_set_overkill_145()
	self:_multiply_all_hp(1, 1)
	self:_multiply_all_speeds(1.05, 1.05)
	self:_multiply_weapon_delay(self.presets.weapon.normal, 0)
	self:_multiply_weapon_delay(self.presets.weapon.good, 0)
	self:_multiply_weapon_delay(self.presets.weapon.expert, 0)
	self:_multiply_weapon_delay(self.presets.weapon.sniper, 3)
	self:_multiply_weapon_delay(self.presets.weapon.gang_member, 0)
	self.presets.gang_member_damage.REGENERATE_TIME = 2
	self.presets.gang_member_damage.REGENERATE_TIME_AWAY = 0.6
	self.presets.gang_member_damage.HEALTH_INIT = 250
	self:_set_characters_weapon_preset("expert")
	self.spooc.spooc_attack_timeout = {3.5, 5}
	self.sniper.weapon.is_rifle.FALLOFF = {
		{
			r = 700,
			acc = {0.7, 1},
			dmg_mul = 10,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.6, 0.95},
			dmg_mul = 10,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.2, 0.5},
			dmg_mul = 5,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.flashbang_multiplier = 1.75
end

function CharacterTweakData:_set_overkill_290()
	self:_multiply_all_hp(1.7, 0.75)
	self:_multiply_all_speeds(1.05, 1.1)
	self:_multiply_weapon_delay(self.presets.weapon.normal, 0)
	self:_multiply_weapon_delay(self.presets.weapon.good, 0)
	self:_multiply_weapon_delay(self.presets.weapon.expert, 0)
	self:_multiply_weapon_delay(self.presets.weapon.sniper, 3)
	self:_multiply_weapon_delay(self.presets.weapon.gang_member, 0)
	self.presets.gang_member_damage.REGENERATE_TIME = 1.8
	self.presets.gang_member_damage.REGENERATE_TIME_AWAY = 0.6
	self.presets.gang_member_damage.HEALTH_INIT = 300
	self:_set_characters_weapon_preset("deathwish")
	self.spooc.spooc_attack_timeout = {3, 4}
	self.sniper.weapon.is_rifle.FALLOFF = {
		{
			r = 700,
			acc = {0.7, 1},
			dmg_mul = 12,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.6, 0.95},
			dmg_mul = 12,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.2, 0.8},
			dmg_mul = 12,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.tank.weapon.is_shotgun_mag.aim_delay = {0, 0}
	self.tank.weapon.is_shotgun_mag.focus_delay = 0
	self.tank.weapon.is_shotgun_mag.FALLOFF = {
		{
			r = 100,
			acc = {0.75, 0.9},
			dmg_mul = 8,
			recoil = {0.4, 0.7},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.75, 0.9},
			dmg_mul = 7.5,
			recoil = {0.4, 0.7},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.7, 0.85},
			dmg_mul = 7,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 2000,
			acc = {0.5, 0.65},
			dmg_mul = 5,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 3000,
			acc = {0.3, 0.5},
			dmg_mul = 3.5,
			recoil = {1, 1.2},
			mode = {
				3,
				1,
				1,
				0
			}
		}
	}
	self.tank.weapon.is_shotgun_pump.FALLOFF[1].dmg_mul = 9
	self.tank.weapon.is_shotgun_pump.FALLOFF[2].dmg_mul = 8
	self.tank.weapon.is_shotgun_pump.FALLOFF[3].dmg_mul = 7
	self.tank.weapon.is_lmg.FALLOFF = {
		{
			r = 100,
			acc = {0.7, 0.9},
			dmg_mul = 5,
			recoil = {0.4, 0.7},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 500,
			acc = {0.5, 0.75},
			dmg_mul = 5,
			recoil = {0.5, 0.8},
			mode = {
				0,
				0,
				0,
				6
			}
		},
		{
			r = 1000,
			acc = {0.3, 0.6},
			dmg_mul = 5,
			recoil = {1, 1},
			mode = {
				0,
				0,
				2,
				6
			}
		},
		{
			r = 2000,
			acc = {0.25, 0.55},
			dmg_mul = 5,
			recoil = {1, 1},
			mode = {
				0,
				0,
				2,
				6
			}
		},
		{
			r = 3000,
			acc = {0.15, 0.5},
			dmg_mul = 5,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		}
	}
	self.tank.weapon.is_lmg.aim_delay = {0, 0}
	self.tank.weapon.is_lmg.focus_delay = 0
	self.shield.weapon.is_smg.aim_delay = {0, 0}
	self.shield.weapon.is_smg.focus_delay = 0
	self.shield.weapon.is_smg.FALLOFF = {
		{
			r = 0,
			acc = {0.9, 0.95},
			dmg_mul = 7,
			recoil = {0.35, 0.35},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 700,
			acc = {0.8, 0.8},
			dmg_mul = 7,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 1000,
			acc = {0.6, 0.65},
			dmg_mul = 7,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 2000,
			acc = {0.5, 0.7},
			dmg_mul = 7,
			recoil = {0.35, 1},
			mode = {
				2,
				5,
				6,
				4
			}
		},
		{
			r = 3000,
			acc = {0.5, 0.5},
			dmg_mul = 7,
			recoil = {0.5, 1.2},
			mode = {
				6,
				4,
				2,
				0
			}
		}
	}
	self.shield.weapon.is_pistol.aim_delay = {0, 0}
	self.shield.weapon.is_pistol.focus_delay = 0
	self.shield.weapon.is_pistol.FALLOFF = {
		{
			r = 0,
			acc = {0.6, 0.9},
			dmg_mul = 7.5,
			recoil = {0.35, 0.45},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 700,
			acc = {0.6, 0.8},
			dmg_mul = 7.5,
			recoil = {0.35, 0.45},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.6, 0.75},
			dmg_mul = 7.5,
			recoil = {0.35, 0.45},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.6, 0.75},
			dmg_mul = 7.5,
			recoil = {0.35, 0.65},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.5, 0.6},
			dmg_mul = 7.5,
			recoil = {0.35, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.taser.weapon.is_rifle.FALLOFF = {
		{
			r = 100,
			acc = {0.9, 0.95},
			dmg_mul = 7,
			recoil = {0.4, 0.4},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.75, 0.95},
			dmg_mul = 7,
			recoil = {0.4, 0.5},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.7, 0.9},
			dmg_mul = 7,
			recoil = {0.4, 0.6},
			mode = {
				1,
				2,
				3,
				0
			}
		},
		{
			r = 2000,
			acc = {0.65, 0.8},
			dmg_mul = 7,
			recoil = {0.5, 1},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 3000,
			acc = {0.55, 0.75},
			dmg_mul = 7,
			recoil = {1, 2},
			mode = {
				3,
				1,
				1,
				0
			}
		}
	}
	self.city_swat.HEALTH_INIT = 24
	self.city_swat.headshot_dmg_mul = self.fbi_swat.HEALTH_INIT / 8
	self.city_swat.damage.explosion_damage_mul = 0.8
	self.city_swat.damage.hurt_severity = self.presets.hurt_severities.only_light_hurt
	self.shield.weapon.is_smg.focus_dis = 200
	self.tank.weapon.is_shotgun_mag.focus_dis = 200
	self.tank.weapon.is_shotgun_pump.focus_dis = 200
	self.flashbang_multiplier = 2
end

Hooks:PostHook(CharacterTweakData, "_multiply_all_hp", "OrPack.CharacterTweakData._multiply_all_hp", function(self, hp_mul, hs_mul)
	local guard = {
		"cop",
		"security",
		"security_undominatable",
		"mute_security_undominatable",
		"security_mex",
		"security_mex_no_pager"
	}

	for _, unit in pairs(guard) do
		self[unit].HEALTH_INIT = self[unit].HEALTH_INIT * hp_mul
	end
end)

Hooks:PostHook(CharacterTweakData, "init", "OrPack.CharacterTweakData.init", function(self)
	local guard = {
		"security",
		"security_undominatable",
		"mute_security_undominatable",
		"security_mex",
		"security_mex_no_pager"
	}
	for _, unit in pairs(guard) do
		self[unit].HEALTH_INIT = 3
		self[unit].headshot_dmg_mul = self[unit].HEALTH_INIT / 1
	end

	self.gensec.HEALTH_INIT = 6
	self.gensec.headshot_dmg_mul = self.gensec.HEALTH_INIT / 1
	self.gensec.surrender = self.presets.surrender.hard
	self.cop.HEALTH_INIT = 3
	self.cop.headshot_dmg_mul = self.cop.HEALTH_INIT / 1
	self.cop.surrender = self.presets.surrender.normal
	self.cop_scared.HEALTH_INIT = self.cop.HEALTH_INIT
	self.cop_scared.headshot_dmg_mul = self.cop.headshot_dmg_mul
	self.cop_scared.surrender = self.cop.surrender
	self.cop_female.HEALTH_INIT = self.cop.HEALTH_INIT
	self.cop_female.headshot_dmg_mul = self.cop.headshot_dmg_mul
	self.cop_female.surrender = self.cop.surrender
	self.fbi.HEALTH_INIT = 5
	self.fbi.headshot_dmg_mul = self.fbi.HEALTH_INIT / 1
	self.fbi.surrender = self.presets.surrender.normal
	self.fbi_female.HEALTH_INIT = self.fbi.HEALTH_INIT
	self.fbi_female.headshot_dmg_mul = self.fbi.headshot_dmg_mul
	self.fbi_female.surrender = self.fbi.surrender
	self.swat.headshot_dmg_mul = self.swat.HEALTH_INIT / 2
	self.swat.surrender = self.presets.surrender.hard
	self.heavy_swat.HEALTH_INIT = 10
	self.heavy_swat.headshot_dmg_mul = self.heavy_swat.HEALTH_INIT / 6
	self.heavy_swat.damage.explosion_damage_mul = 0.9
	self.heavy_swat.surrender = self.presets.surrender.hard
	self.fbi_swat.HEALTH_INIT = 13
	self.fbi_swat.headshot_dmg_mul = self.fbi_swat.HEALTH_INIT / 4
	self.fbi_swat.surrender = self.presets.surrender.hard
	self.fbi_heavy_swat.HEALTH_INIT = 20
	self.fbi_heavy_swat.headshot_dmg_mul = self.fbi_heavy_swat.HEALTH_INIT / 10
	self.fbi_heavy_swat.surrender = self.presets.surrender.hard
	self.city_swat.HEALTH_INIT = 13
	self.city_swat.headshot_dmg_mul = self.city_swat.HEALTH_INIT / 4
	self.city_swat.surrender = self.presets.surrender.hard
	self.sniper.headshot_dmg_mul = self.sniper.HEALTH_INIT / 2

	local gangsters = {
		"gangster",
		"biker",
		"biker_female",
		"triad",
		"triad_boss_no_armor",
		"biker_escape",
		"mobster",
		"bolivian_indoors_mex",
		"bolivian"
	}
	for _, unit in pairs(gangsters) do
		self[unit].HEALTH_INIT = 4
		self[unit].headshot_dmg_mul = self[unit].HEALTH_INIT / 1
	end

	self.mobster_boss.headshot_dmg_mul = 4
	self.mobster_boss.ecm_vulnerability = 0.85
	self.biker_boss.headshot_dmg_mul = 4
	self.biker_boss.ecm_vulnerability = 0.85
	self.chavez_boss.headshot_dmg_mul = 4
	self.chavez_boss.ecm_vulnerability = 0.85
	self.hector_boss_no_armor.HEALTH_INIT = self.fbi.HEALTH_INIT
	self.hector_boss_no_armor.headshot_dmg_mul = self.fbi.headshot_dmg_mul
	self.drug_lord_boss.headshot_dmg_mul = 4
	self.drug_lord_boss.ecm_vulnerability = 0.85
	self.drug_lord_boss_stealth.headshot_dmg_mul = 4
	self.drug_lord_boss_stealth.ecm_vulnerability = 0.85
	self.tank.weapon.is_shotgun_mag.FALLOFF[1].dmg_mul = 3
	self.tank.weapon.is_shotgun_mag.FALLOFF[2].dmg_mul = 1.75
	self.tank.weapon.is_shotgun_mag.FALLOFF[3].dmg_mul = 1.5
	self.tank.weapon.is_shotgun_mag.FALLOFF[4].dmg_mul = 1.25
	self.tank.weapon.is_shotgun_mag.FALLOFF[5].dmg_mul = 1
	self.tank.HEALTH_INIT = 550
	self.tank.headshot_dmg_mul = self.tank.HEALTH_INIT / 24
	self.tank.damage.explosion_damage_mul = 1
	self.tank.move_speed = self.presets.move_speed.very_slow
	self.tank.chatter.go_go = true
	self.spooc.headshot_dmg_mul = self.spooc.HEALTH_INIT / 14
	self.shadow_spooc.headshot_dmg_mul = self.shadow_spooc.HEALTH_INIT / 14
	self.shield.HEALTH_INIT = 10
	self.shield.headshot_dmg_mul = self.shield.HEALTH_INIT / 6
	self.shield.move_speed = self.presets.move_speed.fast
	self.shield.weapon.is_smg.FALLOFF[2].dmg_mul = 3
	self.shield.weapon.is_smg.FALLOFF[3].dmg_mul = 2
	self.shield.weapon.is_smg.FALLOFF[4].dmg_mul = 2
	self.shield.weapon.is_smg.FALLOFF[5].dmg_mul = 1
	self.shield.weapon.is_pistol.FALLOFF[2].dmg_mul = 1.5
	self.shield.weapon.is_pistol.FALLOFF[3].dmg_mul = 1.25
	self.shield.weapon.is_pistol.FALLOFF[4].dmg_mul = 1
	self.shield.weapon.is_pistol.FALLOFF[5].dmg_mul = 1
	self.taser.weapon.is_rifle.tase_distance = 1500
	self.taser.weapon.is_rifle.aim_delay_tase = {0, 0}
	self.taser.weapon.is_rifle.FALLOFF[2].dmg_mul = 1.5
	self.taser.HEALTH_INIT = 36
	self.taser.headshot_dmg_mul = self.taser.HEALTH_INIT / 20
	self.taser.chatter.go_go = true

	local civilians = {
		"civilian",
		"civilian_mariachi",
		"civilian_no_penalty",
		"melee_box",
		"bank_manager",
		"escort_sand",
	}
	for _, unit in pairs(civilians) do
		self[unit].hostage_move_speed = 1
		self[unit].ecm_vulnerability = 0.8
	end

	self.bank_manager.scare_intimidate = -2
	self.bank_manager.submission_intimidate = 60
	self.bank_manager.escort.scared_duration = 45
	self.bank_manager.escort.shot_scare = 25
	self.bank_manager.escort.yell_scare = -25
	self.bank_manager.escort.yell_timeout = 2

	local team_ai_tweak_names = {
		"russian",
		"german",
		"spanish",
		"american",
		"jowi",
		"old_hoxton",
		"female_1",
		"dragan",
		"jacket",
		"bonnie",
		"sokol",
		"dragon",
		"bodhi",
		"jimmy",
		"sydney",
		"wild",
		"chico",
		"max",
		"joy",
		"myh",
		"ecp_female",
		"ecp_male"
	}
	for _, unit in pairs(team_ai_tweak_names) do
		self[unit].move_speed = self.presets.move_speed.fast
	end
end)