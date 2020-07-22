local data = CharacterTweakData.init
function CharacterTweakData:init(tweak_data)
    data(self, tweak_data)
	self.presets.move_speed.very_slow_but_faster = {
		stand = {
			walk = {
				ntl = {
					fwd = 220,
					strafe = 170,
					bwd = 144
				},
				hos = {
					fwd = 220,
					strafe = 170,
					bwd = 144
				},
				cbt = {
					fwd = 220,
					strafe = 170,
					bwd = 144
				}
			},
			run = {
				hos = {
					fwd = 220,
					strafe = 190,
					bwd = 144
				},
				cbt = {
					fwd = 220,
					strafe = 150,
					bwd = 156
				}
			}
		},
		crouch = {
			walk = {
				hos = {
					fwd = 220,
					strafe = 170,
					bwd = 144
				},
				cbt = {
					fwd = 220,
					strafe = 170,
					bwd = 144
				}
			},
			run = {
				hos = {
					fwd = 220,
					strafe = 190,
					bwd = 144
				},
				cbt = {
					fwd = 220,
					strafe = 150,
					bwd = 156
				}
			}
		}
	}
	self.presets.hurt_severities.tough_light_hurt_and_fire = {
		tase = true,
		bullet = {
			health_reference = 1,
			zones = {
				{
					light = 1
				}
			}
		},
		explosion = {
			health_reference = 1,
			zones = {
				{
					moderate = 0.75,
					explode = 1
				}
			}
		},
		melee = {
			health_reference = 1,
			zones = {
				{
					light = 1
				}
			}
		},
		fire = {
			health_reference = 1,
			zones = {
				{
					fire = 1
				}
			}
		},
		poison = {
			health_reference = 1,
			zones = {
				{
					none = 1
				}
			}
		}
	}
	self.presets.hurt_severities.weak_light_hurt_and_fire = {
		tase = true,
		bullet = {
			health_reference = 1,
			zones = {
				{
					light = 1
				}
			}
		},
		explosion = {
			health_reference = 1,
			zones = {
				{
					heavy = 1
				}
			}
		},
		melee = {
			health_reference = 1,
			zones = {
				{
					light = 1
				}
			}
		},
		fire = {
			health_reference = 1,
			zones = {
				{
					fire = 1
				}
			}
		},
		poison = {
			health_reference = 1,
			zones = {
				{
					none = 1
				}
			}
		}
	}
	self.russian.move_speed = self.presets.move_speed.fast
	self.german.move_speed = self.presets.move_speed.fast
	self.spanish.move_speed = self.presets.move_speed.fast
	self.american.move_speed = self.presets.move_speed.fast
	self.jowi.move_speed = self.presets.move_speed.fast
	self.old_hoxton.move_speed = self.presets.move_speed.fast
	self.female_1.move_speed = self.presets.move_speed.fast
	self.dragan.move_speed = self.presets.move_speed.fast
	self.jacket.move_speed = self.presets.move_speed.fast
	self.bonnie.move_speed = self.presets.move_speed.fast
	self.sokol.move_speed = self.presets.move_speed.fast
	self.dragon.move_speed = self.presets.move_speed.fast
	self.bodhi.move_speed = self.presets.move_speed.fast
	self.jimmy.move_speed = self.presets.move_speed.fast
	self.sydney.move_speed = self.presets.move_speed.fast
	self.wild.move_speed = self.presets.move_speed.fast
	self.chico.move_speed = self.presets.move_speed.fast
	self.max.move_speed = self.presets.move_speed.fast
	self.joy.move_speed = self.presets.move_speed.fast
	self.myh.move_speed = self.presets.move_speed.fast
	self.ecp_female.move_speed = self.presets.move_speed.fast
	self.ecp_male.move_speed = self.presets.move_speed.fast
	self.presets.gang_member_damage.hurt_severity.bullet = {
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
	self.presets.gang_member_damage.MIN_DAMAGE_INTERVAL = 0
	self.presets.weapon.normal.is_pistol.melee_dmg = 8
	self.presets.weapon.normal.akimbo_pistol.melee_dmg = 8
	self.presets.weapon.normal.is_rifle.melee_dmg = 8
	self.presets.weapon.normal.is_bullpup.melee_dmg = 8
	self.presets.weapon.normal.is_shotgun_pump.melee_dmg = 8
	self.presets.weapon.normal.is_shotgun_mag.melee_dmg = 8
	self.presets.weapon.normal.is_smg.melee_dmg = 8
	self.presets.weapon.normal.is_revolver.melee_dmg = 8
	self.presets.weapon.normal.mini.melee_dmg = 8
	self.presets.weapon.normal.is_lmg.melee_dmg = 8
	
	self.presets.weapon.expert.is_rifle.focus_delay = 2
	self.presets.weapon.expert.is_rifle.focus_dis = 300
	self.presets.weapon.expert.is_rifle.RELOAD_SPEED = 1.2
	self.presets.weapon.expert.is_rifle.melee_dmg = 20
	self.presets.weapon.expert.is_rifle.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 6,
			recoil = {0.4, 0.8},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.55, 0.95},
			dmg_mul = 5.75,
			recoil = {0.45, 0.8},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.525, 0.8},
			dmg_mul = 5.75,
			recoil = {0.35, 0.75},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 2000,
			acc = {0.5, 0.7},
			dmg_mul = 5.5,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 3000,
			acc = {0.2, 0.4},
			dmg_mul = 5.25,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		}
	}
	self.presets.weapon.expert.is_bullpup.melee_dmg = 20
	self.presets.weapon.expert.is_shotgun_pump.focus_delay = 2
	self.presets.weapon.expert.is_shotgun_pump.RELOAD_SPEED = 1.2
	self.presets.weapon.expert.is_shotgun_pump.melee_dmg = 20
	self.presets.weapon.expert.is_shotgun_pump.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.95},
			dmg_mul = 6.5,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.5, 0.9},
			dmg_mul = 5.5,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.4, 0.75},
			dmg_mul = 4,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.1, 0.55},
			dmg_mul = 3.5,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.35},
			dmg_mul = 2.5,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.expert.is_smg.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 5,
			recoil = {0.5, 0.6},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.5, 0.85},
			dmg_mul = 4,
			recoil = {0.5, 0.65},
			mode = {
				0,
				1,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.3, 0.65},
			dmg_mul = 3.5,
			recoil = {0.55, 0.85},
			mode = {
				2,
				1,
				3,
				0
			}
		},
		{
			r = 2000,
			acc = {0.35, 0.55},
			dmg_mul = 3,
			recoil = {0.65, 1},
			mode = {
				2,
				1,
				3,
				0
			}
		},
		{
			r = 3000,
			acc = {0.2, 0.35},
			dmg_mul = 2.5,
			recoil = {0.65, 1.2},
			mode = {
				4,
				1,
				0,
				0
			}
		}
	}
	
	self.presets.surrender = {
		always = {
			base_chance = 1
		},
		never = {
			base_chance = 0
		},
		easy = {
			base_chance = 0.75,
			significant_chance = 0.1,
			violence_timeout = 2,
			reasons = {
				pants_down = 1,
				isolated = 0.1,
				weapon_down = 0.8,
				health = {
					[1] = 0.2,
					[0.3] = 1
				}
			},
			factors = {
				unaware_of_aggressor = 0.08,
				enemy_weap_cold = 0.15,
				flanked = 0.07,
				aggressor_dis = {
					[300.0] = 0.15,
					[1000.0] = 0.02
				}
			}
		},
		normal = {
			base_chance = 0.5,
			significant_chance = 0.2,
			violence_timeout = 2,
			reasons = {
				health = {
					[1] = 0,
					[0.5] = 0.5
				}
			},
			factors = {
				unaware_of_aggressor = 0.1,
				enemy_weap_cold = 0.11,
				flanked = 0.05,
				aggressor_dis = {
					[300.0] = 0.1,
					[1000.0] = 0
				}
			}
		},
		hard = {
			base_chance = 0.35,
			significant_chance = 0.25,
			violence_timeout = 2,
			reasons = {
				pants_down = 0.8,
				weapon_down = 0.2,
				health = {
					[1] = 0,
					[0.35] = 0.5
				}
			},
			factors = {
				enemy_weap_cold = 0.05,
				unaware_of_aggressor = 0.1,
				flanked = 0.04,
				isolated = 0.1,
				aggressor_dis = {
					[300.0] = 0.1,
					[1000.0] = 0
				}
			}
		},
		special = {
			base_chance = 0.25,
			significant_chance = 0.25,
			violence_timeout = 2,
			reasons = {
				pants_down = 0.6,
				weapon_down = 0.02,
				health = {
					[0.5] = 0,
					[0.2] = 0.25
				}
			},
			factors = {
				enemy_weap_cold = 0.05,
				unaware_of_aggressor = 0.02,
				isolated = 0.05,
				flanked = 0.015
			}
		}
	}
	self.security.HEALTH_INIT = 3
	self.security.headshot_dmg_mul = self.security.HEALTH_INIT / 1
	self.gensec.surrender = self.presets.surrender.hard
	self.gensec.HEALTH_INIT = 6
	self.gensec.headshot_dmg_mul = self.gensec.HEALTH_INIT / 1
	self.gensec.surrender = self.presets.surrender.hard
	self.cop.HEALTH_INIT = 3
	self.cop.headshot_dmg_mul = self.cop.HEALTH_INIT / 1
	self.cop.surrender = self.presets.surrender.normal
	self.fbi.HEALTH_INIT = 5
	self.fbi.headshot_dmg_mul = self.fbi.HEALTH_INIT / 1
	self.fbi.surrender = self.presets.surrender.normal
	self.swat.HEALTH_INIT = 8
	self.swat.headshot_dmg_mul = self.swat.HEALTH_INIT / 2
	self.swat.surrender = self.presets.surrender.hard
	self.heavy_swat.HEALTH_INIT = 10
	self.heavy_swat.headshot_dmg_mul = self.heavy_swat.HEALTH_INIT / 6
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
	self.gangster.HEALTH_INIT = 4
	self.gangster.headshot_dmg_mul = self.gangster.HEALTH_INIT / 1
	self.tank.HEALTH_INIT = 550
	self.tank.headshot_dmg_mul = self.tank.HEALTH_INIT / 24
	self.tank.damage.explosion_damage_mul = 1
	self.tank.move_speed = self.presets.move_speed.very_slow
	self.tank.damage.hurt_severity = self.presets.hurt_severities.only_light_hurt_and_fire
	self.tank.weapon.is_shotgun_mag.FALLOFF[1].dmg_mul = 3
	self.tank.ecm_hurts.ears = {min_duration = 7, max_duration = 9}
	self.tank.chatter = {
		aggressive = true,
		retreat = true,
		go_go = true,
		contact = true,
		entrance = true
	}
	self.spooc.headshot_dmg_mul = self.spooc.HEALTH_INIT / 14
	self.shield.HEALTH_INIT = 10
	self.shield.headshot_dmg_mul = self.shield.HEALTH_INIT / 6
	self.shield.move_speed = self.presets.move_speed.fast
	self.shield.weapon.is_smg.FALLOFF[2].dmg_mul = 3
	self.shield.weapon.is_smg.FALLOFF[3].dmg_mul = 2
	self.shield.weapon.is_smg.FALLOFF[4].dmg_mul = 1
	self.taser.HEALTH_INIT = 36
	self.taser.headshot_dmg_mul = self.taser.HEALTH_INIT / 20
	
end

function CharacterTweakData:_multiply_all_hp(hp_mul, hs_mul)
	self.security.HEALTH_INIT = self.security.HEALTH_INIT * hp_mul
	self.cop.HEALTH_INIT = self.cop.HEALTH_INIT * hp_mul
	self.fbi.HEALTH_INIT = self.fbi.HEALTH_INIT * hp_mul
	self.swat.HEALTH_INIT = self.swat.HEALTH_INIT * hp_mul
	self.heavy_swat.HEALTH_INIT = self.heavy_swat.HEALTH_INIT * hp_mul
	self.fbi_heavy_swat.HEALTH_INIT = self.fbi_heavy_swat.HEALTH_INIT * hp_mul
	self.sniper.HEALTH_INIT = self.sniper.HEALTH_INIT * hp_mul
	self.gangster.HEALTH_INIT = self.gangster.HEALTH_INIT * hp_mul
	self.biker.HEALTH_INIT = self.biker.HEALTH_INIT * hp_mul
	self.tank.HEALTH_INIT = self.tank.HEALTH_INIT * hp_mul
	self.tank_mini.HEALTH_INIT = self.tank_mini.HEALTH_INIT * hp_mul
	self.tank_medic.HEALTH_INIT = self.tank_medic.HEALTH_INIT * hp_mul
	self.spooc.HEALTH_INIT = self.spooc.HEALTH_INIT * hp_mul
	self.shadow_spooc.HEALTH_INIT = self.shadow_spooc.HEALTH_INIT * hp_mul
	self.shield.HEALTH_INIT = self.shield.HEALTH_INIT * hp_mul
	self.phalanx_minion.HEALTH_INIT = self.phalanx_minion.HEALTH_INIT * hp_mul
	self.phalanx_vip.HEALTH_INIT = self.phalanx_vip.HEALTH_INIT * hp_mul
	self.taser.HEALTH_INIT = self.taser.HEALTH_INIT * hp_mul
	self.city_swat.HEALTH_INIT = self.city_swat.HEALTH_INIT * hp_mul
	self.biker_escape.HEALTH_INIT = self.biker_escape.HEALTH_INIT * hp_mul
	self.fbi_swat.HEALTH_INIT = self.fbi_swat.HEALTH_INIT * hp_mul
	self.tank_hw.HEALTH_INIT = self.tank_hw.HEALTH_INIT * hp_mul
	self.medic.HEALTH_INIT = self.medic.HEALTH_INIT * hp_mul
	self.bolivian.HEALTH_INIT = self.bolivian.HEALTH_INIT * hp_mul
	self.bolivian_indoors.HEALTH_INIT = self.bolivian_indoors.HEALTH_INIT * hp_mul
	self.bolivian_indoors_mex.HEALTH_INIT = self.bolivian_indoors_mex.HEALTH_INIT * hp_mul
	self.drug_lord_boss.HEALTH_INIT = self.drug_lord_boss.HEALTH_INIT * hp_mul
	self.drug_lord_boss_stealth.HEALTH_INIT = self.drug_lord_boss_stealth.HEALTH_INIT * hp_mul

	if self.security.headshot_dmg_mul then
		self.security.headshot_dmg_mul = self.security.headshot_dmg_mul * hs_mul
	end

	if self.cop.headshot_dmg_mul then
		self.cop.headshot_dmg_mul = self.cop.headshot_dmg_mul * hs_mul
	end

	if self.fbi.headshot_dmg_mul then
		self.fbi.headshot_dmg_mul = self.fbi.headshot_dmg_mul * hs_mul
	end

	if self.swat.headshot_dmg_mul then
		self.swat.headshot_dmg_mul = self.swat.headshot_dmg_mul * hs_mul
	end

	if self.heavy_swat.headshot_dmg_mul then
		self.heavy_swat.headshot_dmg_mul = self.heavy_swat.headshot_dmg_mul * hs_mul
	end

	if self.fbi_heavy_swat.headshot_dmg_mul then
		self.fbi_heavy_swat.headshot_dmg_mul = self.fbi_heavy_swat.headshot_dmg_mul * hs_mul
	end

	if self.sniper.headshot_dmg_mul then
		self.sniper.headshot_dmg_mul = self.sniper.headshot_dmg_mul * hs_mul
	end

	if self.gangster.headshot_dmg_mul then
		self.gangster.headshot_dmg_mul = self.gangster.headshot_dmg_mul * hs_mul
	end

	if self.biker.headshot_dmg_mul then
		self.biker.headshot_dmg_mul = self.biker.headshot_dmg_mul * hs_mul
	end

	if self.tank.headshot_dmg_mul then
		self.tank.headshot_dmg_mul = self.tank.headshot_dmg_mul * hs_mul
	end

	if self.shadow_spooc.headshot_dmg_mul then
		self.shadow_spooc.headshot_dmg_mul = self.shadow_spooc.headshot_dmg_mul * hs_mul
	end

	if self.spooc.headshot_dmg_mul then
		self.spooc.headshot_dmg_mul = self.spooc.headshot_dmg_mul * hs_mul
	end

	if self.shield.headshot_dmg_mul then
		self.shield.headshot_dmg_mul = self.shield.headshot_dmg_mul * hs_mul
	end

	if self.phalanx_minion.headshot_dmg_mul then
		self.phalanx_minion.headshot_dmg_mul = self.phalanx_minion.headshot_dmg_mul * hs_mul
	end

	if self.phalanx_vip.headshot_dmg_mul then
		self.phalanx_vip.headshot_dmg_mul = self.phalanx_vip.headshot_dmg_mul * hs_mul
	end

	if self.taser.headshot_dmg_mul then
		self.taser.headshot_dmg_mul = self.taser.headshot_dmg_mul * hs_mul
	end

	if self.biker_escape.headshot_dmg_mul then
		self.biker_escape.headshot_dmg_mul = self.biker_escape.headshot_dmg_mul * hs_mul
	end

	if self.city_swat.headshot_dmg_mul then
		self.city_swat.headshot_dmg_mul = self.city_swat.headshot_dmg_mul * hs_mul
	end

	if self.fbi_swat.headshot_dmg_mul then
		self.fbi_swat.headshot_dmg_mul = self.fbi_swat.headshot_dmg_mul * hs_mul
	end

	if self.tank_hw.headshot_dmg_mul then
		self.tank_hw.headshot_dmg_mul = self.tank_hw.headshot_dmg_mul * hs_mul
	end

	if self.medic.headshot_dmg_mul then
		self.medic.headshot_dmg_mul = self.medic.headshot_dmg_mul * hs_mul
	end

	if self.drug_lord_boss.headshot_dmg_mul then
		self.drug_lord_boss.headshot_dmg_mul = self.drug_lord_boss.headshot_dmg_mul * hs_mul
	end

	if self.bolivian.headshot_dmg_mul then
		self.bolivian.headshot_dmg_mul = self.bolivian.headshot_dmg_mul * hs_mul
	end

	if self.bolivian_indoors.headshot_dmg_mul then
		self.bolivian_indoors.headshot_dmg_mul = self.bolivian_indoors.headshot_dmg_mul * hs_mul
	end

	if self.bolivian_indoors_mex.headshot_dmg_mul then
		self.bolivian_indoors_mex.headshot_dmg_mul = self.bolivian_indoors_mex.headshot_dmg_mul * hs_mul
	end

	if self.tank_medic.headshot_dmg_mul then
		self.tank_medic.headshot_dmg_mul = self.tank_medic.headshot_dmg_mul * hs_mul
	end

	if self.tank_mini.headshot_dmg_mul then
		self.tank_mini.headshot_dmg_mul = self.tank_mini.headshot_dmg_mul * hs_mul
	end
end

function CharacterTweakData:_set_normal()
	self:_multiply_all_hp(1, 1)

	self:_multiply_weapon_delay(self.presets.weapon.normal, 0)
	self:_multiply_weapon_delay(self.presets.weapon.good, 0)
	self:_multiply_weapon_delay(self.presets.weapon.expert, 0)
	self:_multiply_weapon_delay(self.presets.weapon.sniper, 3)
	self:_multiply_weapon_delay(self.presets.weapon.gang_member, 0)

	self.hector_boss.HEALTH_INIT = 50
	self.mobster_boss.HEALTH_INIT = 50
	self.biker_boss.HEALTH_INIT = 100
	self.chavez_boss.HEALTH_INIT = 100
	self.presets.gang_member_damage.REGENERATE_TIME = 1.5
	self.presets.gang_member_damage.REGENERATE_TIME_AWAY = 0.2
	self.presets.gang_member_damage.HEALTH_INIT = 125
	
	self:_set_characters_weapon_preset("normal")
	self.presets.weapon.gang_member.is_smg = self.presets.weapon.gang_member.is_rifle
	self.presets.weapon.gang_member.is_pistol = self.presets.weapon.gang_member.is_pistol
	self.presets.weapon.gang_member.is_revolver = self.presets.weapon.gang_member.is_pistol
	self.presets.weapon.gang_member.is_rifle = self.presets.weapon.gang_member.is_rifle
	self.presets.weapon.gang_member.is_shotgun_pump = self.presets.weapon.gang_member.is_shotgun_pump
	self.presets.weapon.gang_member.mac11 = self.presets.weapon.gang_member.is_smg
	self.presets.weapon.gang_member.rifle = deep_clone(self.presets.weapon.gang_member.is_rifle)
	self.presets.weapon.gang_member.rifle.autofire_rounds = nil
	self.presets.weapon.gang_member.akimbo_pistol = self.presets.weapon.gang_member.is_pistol
	self.presets.weapon.gang_member.is_shotgun_mag = deep_clone(self.presets.weapon.gang_member.is_shotgun_pump)
	self.flashbang_multiplier = 1
	self.concussion_multiplier = 1
end

function CharacterTweakData:_set_hard()
	self:_multiply_all_hp(1, 1)

	self:_multiply_weapon_delay(self.presets.weapon.normal, 0)
	self:_multiply_weapon_delay(self.presets.weapon.good, 0)
	self:_multiply_weapon_delay(self.presets.weapon.expert, 0)
	self:_multiply_weapon_delay(self.presets.weapon.sniper, 3)
	self:_multiply_weapon_delay(self.presets.weapon.gang_member, 0)

	self.hector_boss.HEALTH_INIT = 100
	self.mobster_boss.HEALTH_INIT = 100
	self.biker_boss.HEALTH_INIT = 100
	self.chavez_boss.HEALTH_INIT = 100
	self.presets.gang_member_damage.REGENERATE_TIME = 2
	self.presets.gang_member_damage.REGENERATE_TIME_AWAY = 0.4

	self:_set_characters_weapon_preset("normal")

	self.presets.gang_member_damage.HEALTH_INIT = 160
	self.presets.weapon.gang_member.is_smg = self.presets.weapon.gang_member.is_rifle
	self.presets.weapon.gang_member.is_pistol = self.presets.weapon.gang_member.is_pistol
	self.presets.weapon.gang_member.is_revolver = self.presets.weapon.gang_member.is_pistol
	self.presets.weapon.gang_member.is_rifle = self.presets.weapon.gang_member.is_rifle
	self.presets.weapon.gang_member.is_shotgun_pump = self.presets.weapon.gang_member.is_shotgun_pump
	self.presets.weapon.gang_member.mac11 = self.presets.weapon.gang_member.is_smg
	self.presets.weapon.gang_member.rifle = deep_clone(self.presets.weapon.gang_member.is_rifle)
	self.presets.weapon.gang_member.rifle.autofire_rounds = nil
	self.presets.weapon.gang_member.akimbo_pistol = self.presets.weapon.gang_member.is_pistol
	self.presets.weapon.gang_member.is_shotgun_mag = deep_clone(self.presets.weapon.gang_member.is_shotgun_pump)
	self.flashbang_multiplier = 1.25
	self.concussion_multiplier = 1
	self.shadow_spooc.shadow_spooc_attack_timeout = {
		8,
		10
	}
	self.spooc.spooc_attack_timeout = {
		8,
		10
	}
	self.sniper.weapon.is_rifle.FALLOFF = {
		{
			dmg_mul = 7,
			r = 700,
			acc = {
				0.6,
				1
			},
			recoil = {
				3,
				5
			},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			dmg_mul = 6,
			r = 4000,
			acc = {
				0.5,
				0.9
			},
			recoil = {
				4,
				5
			},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			dmg_mul = 3,
			r = 10000,
			acc = {
				0,
				0.3
			},
			recoil = {
				4,
				6
			},
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

	self.hector_boss.HEALTH_INIT = 300
	self.mobster_boss.HEALTH_INIT = 300
	self.biker_boss.HEALTH_INIT = 300
	self.chavez_boss.HEALTH_INIT = 300
	self.phalanx_minion.HEALTH_INIT = 3
	self.phalanx_minion.DAMAGE_CLAMP_BULLET = 15
	self.phalanx_minion.DAMAGE_CLAMP_EXPLOSION = self.phalanx_minion.DAMAGE_CLAMP_BULLET
	self.phalanx_vip.HEALTH_INIT = 60
	self.phalanx_vip.DAMAGE_CLAMP_BULLET = 30
	self.phalanx_vip.DAMAGE_CLAMP_EXPLOSION = self.phalanx_vip.DAMAGE_CLAMP_BULLET
	self.presets.gang_member_damage.REGENERATE_TIME = 2
	self.presets.gang_member_damage.REGENERATE_TIME_AWAY = 0.6
	self.presets.gang_member_damage.HEALTH_INIT = 200
	self.presets.weapon.gang_member.is_smg = self.presets.weapon.gang_member.is_rifle
	self.presets.weapon.gang_member.is_pistol = self.presets.weapon.gang_member.is_pistol
	self.presets.weapon.gang_member.is_revolver = self.presets.weapon.gang_member.is_pistol
	self.presets.weapon.gang_member.is_rifle = self.presets.weapon.gang_member.is_rifle
	self.presets.weapon.gang_member.is_shotgun_pump = self.presets.weapon.gang_member.is_shotgun_pump
	self.presets.weapon.gang_member.mac11 = self.presets.weapon.gang_member.is_smg
	self.presets.weapon.gang_member.rifle = deep_clone(self.presets.weapon.gang_member.is_rifle)
	self.presets.weapon.gang_member.rifle.autofire_rounds = nil
	self.presets.weapon.gang_member.akimbo_pistol = self.presets.weapon.gang_member.is_pistol
	self.presets.weapon.gang_member.is_shotgun_mag = deep_clone(self.presets.weapon.gang_member.is_shotgun_pump)

	self:_set_characters_weapon_preset("good")

	self.shadow_spooc.shadow_spooc_attack_timeout = {
		6,
		8
	}
	self.spooc.spooc_attack_timeout = {
		6,
		8
	}
	self.sniper.weapon.is_rifle.FALLOFF = {
		{
			dmg_mul = 8,
			r = 700,
			acc = {
				0.7,
				1
			},
			recoil = {
				3,
				6
			},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			dmg_mul = 6,
			r = 4000,
			acc = {
				0.5,
				0.95
			},
			recoil = {
				4,
				6
			},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			dmg_mul = 3.5,
			r = 10000,
			acc = {
				0,
				0.3
			},
			recoil = {
				4,
				6
			},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.flashbang_multiplier = 1.5
	self.concussion_multiplier = 1
end

function CharacterTweakData:_set_overkill_145()
	if SystemInfo:platform() == Idstring("PS3") then
		self:_multiply_all_hp(1, 1)
	else
		self:_multiply_all_hp(1, 1)
	end

	self:_multiply_all_speeds(1.05, 1.05)

	self.hector_boss.HEALTH_INIT = 600
	self.mobster_boss.HEALTH_INIT = 600
	self.biker_boss.HEALTH_INIT = 600
	self.chavez_boss.HEALTH_INIT = 600
	self.phalanx_minion.HEALTH_INIT = 60
	self.phalanx_minion.DAMAGE_CLAMP_BULLET = 30
	self.phalanx_minion.DAMAGE_CLAMP_EXPLOSION = self.phalanx_minion.DAMAGE_CLAMP_BULLET
	self.phalanx_vip.HEALTH_INIT = 120
	self.phalanx_vip.DAMAGE_CLAMP_BULLET = 60
	self.phalanx_vip.DAMAGE_CLAMP_EXPLOSION = self.phalanx_vip.DAMAGE_CLAMP_BULLET

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

	self.shadow_spooc.shadow_spooc_attack_timeout = {
		3.5,
		5
	}
	self.spooc.spooc_attack_timeout = {
		3.5,
		5
	}
	self.sniper.weapon.is_rifle.FALLOFF = {
		{
			dmg_mul = 10,
			r = 700,
			acc = {
				0.7,
				1
			},
			recoil = {
				3,
				5
			},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			dmg_mul = 10,
			r = 4000,
			acc = {
				0.6,
				0.95
			},
			recoil = {
				3,
				5
			},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			dmg_mul = 6,
			r = 10000,
			acc = {
				0.2,
				0.5
			},
			recoil = {
				3,
				5
			},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.flashbang_multiplier = 1.75
	self.concussion_multiplier = 1
end

function CharacterTweakData:_set_overkill_290()
	if SystemInfo:platform() == Idstring("PS3") then
		self:_multiply_all_hp(1.7, 0.75)
	else
		self:_multiply_all_hp(1.7, 0.75)
	end

	self.hector_boss.HEALTH_INIT = 900
	self.mobster_boss.HEALTH_INIT = 900
	self.biker_boss.HEALTH_INIT = 900
	self.chavez_boss.HEALTH_INIT = 900

	self:_multiply_all_speeds(1.05, 1.1)
	self:_multiply_weapon_delay(self.presets.weapon.normal, 0)
	self:_multiply_weapon_delay(self.presets.weapon.good, 0)
	self:_multiply_weapon_delay(self.presets.weapon.expert, 0)
	self:_multiply_weapon_delay(self.presets.weapon.sniper, 3)
	self:_multiply_weapon_delay(self.presets.weapon.gang_member, 0)

	self.presets.gang_member_damage.REGENERATE_TIME = 1.8
	self.presets.gang_member_damage.REGENERATE_TIME_AWAY = 0.6
	self.presets.gang_member_damage.HEALTH_INIT = 300
	self.presets.weapon.gang_member.is_smg = self.presets.weapon.gang_member.is_rifle
	self.presets.weapon.gang_member.is_pistol = self.presets.weapon.gang_member.is_pistol
	self.presets.weapon.gang_member.is_revolver = self.presets.weapon.gang_member.is_pistol
	self.presets.weapon.gang_member.is_rifle = self.presets.weapon.gang_member.is_rifle
	self.presets.weapon.gang_member.is_shotgun_pump = self.presets.weapon.gang_member.is_shotgun_pump
	self.presets.weapon.gang_member.mac11 = self.presets.weapon.gang_member.is_smg
	self.presets.weapon.gang_member.rifle = deep_clone(self.presets.weapon.gang_member.is_rifle)
	self.presets.weapon.gang_member.rifle.autofire_rounds = nil
	self.presets.weapon.gang_member.akimbo_pistol = self.presets.weapon.gang_member.is_pistol
	self.presets.weapon.gang_member.is_shotgun_mag = deep_clone(self.presets.weapon.gang_member.is_shotgun_pump)

	self:_set_characters_weapon_preset("deathwish")

	self.shadow_spooc.shadow_spooc_attack_timeout = {
		3,
		4
	}
	self.spooc.spooc_attack_timeout = {
		3,
		4
	}
	self.sniper.weapon.is_rifle.FALLOFF = {
		{
			dmg_mul = 12,
			r = 700,
			acc = {
				0.7,
				1
			},
			recoil = {
				3,
				5
			},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			dmg_mul = 12,
			r = 4000,
			acc = {
				0.6,
				0.95
			},
			recoil = {
				3,
				5
			},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			dmg_mul = 12,
			r = 10000,
			acc = {
				0.2,
				0.8
			},
			recoil = {
				3,
				5
			},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.tank.weapon.is_shotgun_mag.aim_delay = {
		0,
		0
	}
	self.tank.weapon.is_shotgun_mag.focus_delay = 0
	self.tank.weapon.is_shotgun_mag.focus_dis = 200
	self.tank.weapon.is_shotgun_mag.FALLOFF = {
		{
			dmg_mul = 8,
			r = 100,
			acc = {
				0.75,
				0.9
			},
			recoil = {
				0.4,
				0.7
			},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			dmg_mul = 7.5,
			r = 500,
			acc = {
				0.75,
				0.9
			},
			recoil = {
				0.4,
				0.7
			},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			dmg_mul = 7,
			r = 1000,
			acc = {
				0.7,
				0.85
			},
			recoil = {
				0.45,
				0.8
			},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			dmg_mul = 5,
			r = 2000,
			acc = {
				0.5,
				0.65
			},
			recoil = {
				0.45,
				0.8
			},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			dmg_mul = 3.5,
			r = 3000,
			acc = {
				0.3,
				0.5
			},
			recoil = {
				1,
				1.2
			},
			mode = {
				3,
				1,
				1,
				0
			}
		}
	}
	self.tank.weapon.is_shotgun_pump.focus_dis = 200
	self.tank.weapon.is_shotgun_pump.FALLOFF[1].dmg_mul = 9
	self.tank.weapon.is_shotgun_pump.FALLOFF[2].dmg_mul = 8
	self.tank.weapon.is_shotgun_pump.FALLOFF[3].dmg_mul = 7
	self.tank.weapon.is_rifle.aim_delay = {
		0,
		0
	}
	self.tank.weapon.is_rifle.focus_delay = 0
	self.tank.weapon.is_rifle.FALLOFF = {
		{
			dmg_mul = 5,
			r = 100,
			acc = {
				0.7,
				0.9
			},
			recoil = {
				0.4,
				0.7
			},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			dmg_mul = 5,
			r = 500,
			acc = {
				0.5,
				0.75
			},
			recoil = {
				0.5,
				0.8
			},
			mode = {
				0,
				0,
				0,
				6
			}
		},
		{
			dmg_mul = 5,
			r = 1000,
			acc = {
				0.3,
				0.6
			},
			recoil = {
				1,
				1
			},
			mode = {
				0,
				0,
				2,
				6
			}
		},
		{
			dmg_mul = 5,
			r = 2000,
			acc = {
				0.25,
				0.55
			},
			recoil = {
				1,
				1
			},
			mode = {
				0,
				0,
				2,
				6
			}
		},
		{
			dmg_mul = 5,
			r = 3000,
			acc = {
				0.15,
				0.5
			},
			recoil = {
				1,
				2
			},
			mode = {
				0,
				0,
				2,
				6
			}
		}
	}
	self.tank.weapon.mini.aim_delay = {
		0,
		0
	}
	self.tank.weapon.mini.focus_delay = 0
	self.tank.weapon.mini.FALLOFF = {
		{
			dmg_mul = 5,
			r = 100,
			acc = {
				0.7,
				0.9
			},
			recoil = {
				0.4,
				0.7
			},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			dmg_mul = 5,
			r = 500,
			acc = {
				0.5,
				0.75
			},
			recoil = {
				0.5,
				0.8
			},
			mode = {
				0,
				0,
				0,
				6
			}
		},
		{
			dmg_mul = 5,
			r = 1000,
			acc = {
				0.3,
				0.6
			},
			recoil = {
				1,
				1
			},
			mode = {
				0,
				0,
				2,
				6
			}
		},
		{
			dmg_mul = 5,
			r = 2000,
			acc = {
				0.25,
				0.55
			},
			recoil = {
				1,
				1
			},
			mode = {
				0,
				0,
				2,
				6
			}
		},
		{
			dmg_mul = 5,
			r = 3000,
			acc = {
				0.15,
				0.5
			},
			recoil = {
				1,
				2
			},
			mode = {
				0,
				0,
				2,
				6
			}
		}
	}
	self.shield.weapon.is_smg.aim_delay = {
		0,
		0
	}
	self.shield.weapon.is_smg.focus_delay = 0
	self.shield.weapon.is_smg.focus_dis = 200
	self.shield.weapon.is_smg.FALLOFF = {
		{
			dmg_mul = 7,
			r = 0,
			acc = {
				0.9,
				0.95
			},
			recoil = {
				0.35,
				0.35
			},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			dmg_mul = 7,
			r = 700,
			acc = {
				0.8,
				0.8
			},
			recoil = {
				0.35,
				0.55
			},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			dmg_mul = 7,
			r = 1000,
			acc = {
				0.6,
				0.65
			},
			recoil = {
				0.35,
				0.55
			},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			dmg_mul = 7,
			r = 2000,
			acc = {
				0.5,
				0.7
			},
			recoil = {
				0.35,
				1
			},
			mode = {
				2,
				5,
				6,
				4
			}
		},
		{
			dmg_mul = 7,
			r = 3000,
			acc = {
				0.5,
				0.5
			},
			recoil = {
				0.5,
				1.2
			},
			mode = {
				6,
				4,
				2,
				0
			}
		}
	}
	self.shield.weapon.is_pistol.aim_delay = {
		0,
		0
	}
	self.shield.weapon.is_pistol.focus_delay = 0
	self.shield.weapon.is_pistol.FALLOFF = {
		{
			dmg_mul = 7.5,
			r = 0,
			acc = {
				0.6,
				0.9
			},
			recoil = {
				0.35,
				0.45
			},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			dmg_mul = 7.5,
			r = 700,
			acc = {
				0.6,
				0.8
			},
			recoil = {
				0.35,
				0.45
			},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			dmg_mul = 7.5,
			r = 1000,
			acc = {
				0.6,
				0.75
			},
			recoil = {
				0.35,
				0.45
			},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			dmg_mul = 7.5,
			r = 2000,
			acc = {
				0.6,
				0.75
			},
			recoil = {
				0.35,
				0.65
			},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			dmg_mul = 7.5,
			r = 3000,
			acc = {
				0.5,
				0.6
			},
			recoil = {
				0.35,
				1.5
			},
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
			dmg_mul = 7,
			r = 100,
			acc = {
				0.9,
				0.95
			},
			recoil = {
				0.4,
				0.4
			},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			dmg_mul = 7,
			r = 500,
			acc = {
				0.75,
				0.95
			},
			recoil = {
				0.4,
				0.5
			},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			dmg_mul = 7,
			r = 1000,
			acc = {
				0.7,
				0.9
			},
			recoil = {
				0.4,
				0.6
			},
			mode = {
				1,
				2,
				3,
				0
			}
		},
		{
			dmg_mul = 7,
			r = 2000,
			acc = {
				0.65,
				0.8
			},
			recoil = {
				0.5,
				1
			},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			dmg_mul = 7,
			r = 3000,
			acc = {
				0.55,
				0.75
			},
			recoil = {
				1,
				2
			},
			mode = {
				3,
				1,
				1,
				0
			}
		}
	}
	self.city_swat.HEALTH_INIT = 24
	self.fbi_swat.HEALTH_INIT = 13
	self.city_swat.headshot_dmg_mul = self.fbi_swat.HEALTH_INIT / 8
	self.city_swat.damage.explosion_damage_mul = 1
	self.city_swat.damage.hurt_severity = self.presets.hurt_severities.light_hurt_fire_poison
	self.phalanx_minion.HEALTH_INIT = 80
	self.phalanx_minion.DAMAGE_CLAMP_BULLET = 40
	self.phalanx_minion.DAMAGE_CLAMP_EXPLOSION = self.phalanx_minion.DAMAGE_CLAMP_BULLET
	self.phalanx_vip.HEALTH_INIT = 160
	self.phalanx_vip.DAMAGE_CLAMP_BULLET = 80
	self.phalanx_vip.DAMAGE_CLAMP_EXPLOSION = self.phalanx_vip.DAMAGE_CLAMP_BULLET
	self.flashbang_multiplier = 2
	self.concussion_multiplier = 1
end

function CharacterTweakData:_set_sm_wish()
	if SystemInfo:platform() == Idstring("PS3") then
		self:_multiply_all_hp(2, 0.75)
	else
		self:_multiply_all_hp(2, 0.75)
	end

	self.hector_boss.HEALTH_INIT = 900
	self.mobster_boss.HEALTH_INIT = 900
	self.biker_boss.HEALTH_INIT = 900
	self.chavez_boss.HEALTH_INIT = 900

	self:_multiply_all_speeds(1.05, 1.1)
	self:_multiply_weapon_delay(self.presets.weapon.normal, 0)
	self:_multiply_weapon_delay(self.presets.weapon.good, 0)
	self:_multiply_weapon_delay(self.presets.weapon.expert, 0)
	self:_multiply_weapon_delay(self.presets.weapon.sniper, 3)
	self:_multiply_weapon_delay(self.presets.weapon.gang_member, 0)

	self.presets.gang_member_damage.REGENERATE_TIME = 1.8
	self.presets.gang_member_damage.REGENERATE_TIME_AWAY = 0.6
	self.presets.gang_member_damage.HEALTH_INIT = 300
	self.presets.weapon.gang_member.is_smg = self.presets.weapon.gang_member.is_rifle
	self.presets.weapon.gang_member.is_pistol = self.presets.weapon.gang_member.is_pistol
	self.presets.weapon.gang_member.is_revolver = self.presets.weapon.gang_member.is_pistol
	self.presets.weapon.gang_member.is_rifle = self.presets.weapon.gang_member.is_rifle
	self.presets.weapon.gang_member.is_shotgun_pump = self.presets.weapon.gang_member.is_shotgun_pump
	self.presets.weapon.gang_member.mac11 = self.presets.weapon.gang_member.is_smg
	self.presets.weapon.gang_member.rifle = deep_clone(self.presets.weapon.gang_member.is_rifle)
	self.presets.weapon.gang_member.rifle.autofire_rounds = nil
	self.presets.weapon.gang_member.akimbo_pistol = self.presets.weapon.gang_member.is_pistol
	self.presets.weapon.gang_member.is_shotgun_mag = deep_clone(self.presets.weapon.gang_member.is_shotgun_pump)

	self:_set_characters_weapon_preset("deathwish")

	self.shadow_spooc.shadow_spooc_attack_timeout = {
		3,
		4
	}
	self.spooc.spooc_attack_timeout = {
		3,
		4
	}
	self.spooc.dodge_with_grenade = {
		flash = {
			duration = {
				10,
				20
			}
		},
		check = function (t, nr_grenades_used)
			local delay_till_next_use = math.lerp(17, 45, math.min(1, (nr_grenades_used or 0) / 4))
			local chance = math.lerp(1, 0.5, math.min(1, (nr_grenades_used or 0) / 10))

			if math.random() < chance then
				return true, t + delay_till_next_use
			end

			return false, t + delay_till_next_use
		end
	}
	self.sniper.HEALTH_INIT = 14
	self.sniper.weapon.is_rifle.FALLOFF = {
		{
			dmg_mul = 12,
			r = 700,
			acc = {
				0.7,
				1
			},
			recoil = {
				3,
				5
			},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			dmg_mul = 12,
			r = 4000,
			acc = {
				0.6,
				0.95
			},
			recoil = {
				3,
				5
			},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			dmg_mul = 12,
			r = 10000,
			acc = {
				0.2,
				0.8
			},
			recoil = {
				3,
				5
			},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.tank.weapon.is_shotgun_mag.aim_delay = {
		0,
		0
	}
	self.tank.weapon.is_shotgun_mag.focus_delay = 0
	self.tank.weapon.is_shotgun_mag.focus_dis = 200
	self.tank.weapon.is_shotgun_mag.FALLOFF = {
		{
			dmg_mul = 8,
			r = 100,
			acc = {
				0.75,
				0.9
			},
			recoil = {
				0.4,
				0.7
			},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			dmg_mul = 7.5,
			r = 500,
			acc = {
				0.75,
				0.9
			},
			recoil = {
				0.4,
				0.7
			},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			dmg_mul = 7,
			r = 1000,
			acc = {
				0.7,
				0.85
			},
			recoil = {
				0.45,
				0.8
			},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			dmg_mul = 5,
			r = 2000,
			acc = {
				0.5,
				0.65
			},
			recoil = {
				0.45,
				0.8
			},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			dmg_mul = 3.5,
			r = 3000,
			acc = {
				0.3,
				0.5
			},
			recoil = {
				1,
				1.2
			},
			mode = {
				3,
				1,
				1,
				0
			}
		}
	}
	self.tank.weapon.is_shotgun_pump.focus_dis = 200
	self.tank.HEALTH_INIT = 1000
	self.tank.move_speed = self.presets.move_speed.very_slow_but_faster
	self.tank.damage.hurt_severity = self.presets.hurt_severities.tough_light_hurt_and_fire
	self.tank_medic.damage.hurt_severity = self.presets.hurt_severities.weak_light_hurt_and_fire
	self.tank.weapon.is_shotgun_pump.FALLOFF[1].dmg_mul = 9
	self.tank.weapon.is_shotgun_pump.FALLOFF[2].dmg_mul = 8
	self.tank.weapon.is_shotgun_pump.FALLOFF[3].dmg_mul = 7
	self.tank.weapon.is_rifle.aim_delay = {
		0,
		0
	}
	self.tank.weapon.is_rifle.focus_delay = 0
	self.tank.weapon.is_rifle.FALLOFF = {
		{
			dmg_mul = 5,
			r = 100,
			acc = {
				0.7,
				0.9
			},
			recoil = {
				0.4,
				0.7
			},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			dmg_mul = 5,
			r = 500,
			acc = {
				0.5,
				0.75
			},
			recoil = {
				0.5,
				0.8
			},
			mode = {
				0,
				0,
				0,
				6
			}
		},
		{
			dmg_mul = 5,
			r = 1000,
			acc = {
				0.3,
				0.6
			},
			recoil = {
				1,
				1
			},
			mode = {
				0,
				0,
				2,
				6
			}
		},
		{
			dmg_mul = 5,
			r = 2000,
			acc = {
				0.25,
				0.55
			},
			recoil = {
				1,
				1
			},
			mode = {
				0,
				0,
				2,
				6
			}
		},
		{
			dmg_mul = 5,
			r = 3000,
			acc = {
				0.15,
				0.5
			},
			recoil = {
				1,
				2
			},
			mode = {
				0,
				0,
				2,
				6
			}
		}
	}
	self.tank.weapon.mini.aim_delay = {
		0,
		0
	}
	self.tank.weapon.mini.focus_delay = 0
	self.tank.weapon.mini.FALLOFF = {
		{
			dmg_mul = 5,
			r = 100,
			acc = {
				0.7,
				0.9
			},
			recoil = {
				0.4,
				0.7
			},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			dmg_mul = 5,
			r = 500,
			acc = {
				0.5,
				0.75
			},
			recoil = {
				0.5,
				0.8
			},
			mode = {
				0,
				0,
				0,
				6
			}
		},
		{
			dmg_mul = 5,
			r = 1000,
			acc = {
				0.3,
				0.6
			},
			recoil = {
				1,
				1
			},
			mode = {
				0,
				0,
				2,
				6
			}
		},
		{
			dmg_mul = 5,
			r = 2000,
			acc = {
				0.25,
				0.55
			},
			recoil = {
				1,
				1
			},
			mode = {
				0,
				0,
				2,
				6
			}
		},
		{
			dmg_mul = 5,
			r = 3000,
			acc = {
				0.15,
				0.5
			},
			recoil = {
				1,
				2
			},
			mode = {
				0,
				0,
				2,
				6
			}
		}
	}
	self.shield.weapon.is_smg.aim_delay = {
		0,
		0
	}
	self.shield.weapon.is_smg.focus_delay = 0
	self.shield.weapon.is_smg.focus_dis = 200
	self.shield.HEALTH_INIT = 34
	self.shield.weapon.is_smg.FALLOFF = {
		{
			dmg_mul = 7,
			r = 0,
			acc = {
				0.9,
				0.95
			},
			recoil = {
				0.35,
				0.35
			},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			dmg_mul = 7,
			r = 700,
			acc = {
				0.8,
				0.8
			},
			recoil = {
				0.35,
				0.55
			},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			dmg_mul = 7,
			r = 1000,
			acc = {
				0.6,
				0.65
			},
			recoil = {
				0.35,
				0.55
			},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			dmg_mul = 7,
			r = 2000,
			acc = {
				0.5,
				0.7
			},
			recoil = {
				0.35,
				1
			},
			mode = {
				2,
				5,
				6,
				4
			}
		},
		{
			dmg_mul = 7,
			r = 3000,
			acc = {
				0.5,
				0.5
			},
			recoil = {
				0.5,
				1.2
			},
			mode = {
				6,
				4,
				2,
				0
			}
		}
	}
	self.shield.weapon.is_pistol.aim_delay = {
		0,
		0
	}
	self.shield.weapon.is_pistol.focus_delay = 0
	self.shield.weapon.is_pistol.FALLOFF = {
		{
			dmg_mul = 7.5,
			r = 0,
			acc = {
				0.6,
				0.9
			},
			recoil = {
				0.35,
				0.45
			},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			dmg_mul = 7.5,
			r = 700,
			acc = {
				0.6,
				0.8
			},
			recoil = {
				0.35,
				0.45
			},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			dmg_mul = 7.5,
			r = 1000,
			acc = {
				0.6,
				0.75
			},
			recoil = {
				0.35,
				0.45
			},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			dmg_mul = 7.5,
			r = 2000,
			acc = {
				0.6,
				0.75
			},
			recoil = {
				0.35,
				0.65
			},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			dmg_mul = 7.5,
			r = 3000,
			acc = {
				0.5,
				0.6
			},
			recoil = {
				0.35,
				1.5
			},
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
			dmg_mul = 7,
			r = 100,
			acc = {
				0.9,
				0.95
			},
			recoil = {
				0.4,
				0.4
			},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			dmg_mul = 7,
			r = 500,
			acc = {
				0.75,
				0.95
			},
			recoil = {
				0.4,
				0.5
			},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			dmg_mul = 7,
			r = 1000,
			acc = {
				0.7,
				0.9
			},
			recoil = {
				0.4,
				0.6
			},
			mode = {
				1,
				2,
				3,
				0
			}
		},
		{
			dmg_mul = 7,
			r = 2000,
			acc = {
				0.65,
				0.8
			},
			recoil = {
				0.5,
				1
			},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			dmg_mul = 7,
			r = 3000,
			acc = {
				0.55,
				0.75
			},
			recoil = {
				1,
				2
			},
			mode = {
				3,
				1,
				1,
				0
			}
		}
	}
	self.shield.move_speed = self.presets.move_speed.very_fast
	self.swat.HEALTH_INIT = 34
	self.swat.damage.explosion_damage_mul = 1
	self.swat.damage.hurt_severity = self.presets.hurt_severities.light_hurt_fire_poison
	self.swat.weapon = self.presets.weapon.good
	self.swat.move_speed = self.presets.move_speed.fast
	self.swat.dodge = self.presets.dodge.athletic
	self.heavy_swat.HEALTH_INIT = 48
	self.heavy_swat.headshot_dmg_mul = self.fbi_swat.HEALTH_INIT / 8
	self.heavy_swat.damage.explosion_damage_mul = 1
	self.heavy_swat.damage.hurt_severity = self.presets.hurt_severities.light_hurt_fire_poison
	self.heavy_swat.weapon = self.presets.weapon.good
	self.heavy_swat.move_speed = self.presets.move_speed.very_fast
	self.heavy_swat.dodge = self.presets.dodge.athletic
	self.phalanx_minion.HEALTH_INIT = 80
	self.phalanx_minion.DAMAGE_CLAMP_BULLET = 40
	self.phalanx_minion.DAMAGE_CLAMP_EXPLOSION = self.phalanx_minion.DAMAGE_CLAMP_BULLET
	self.phalanx_vip.HEALTH_INIT = 160
	self.phalanx_vip.DAMAGE_CLAMP_BULLET = 80
	self.phalanx_vip.DAMAGE_CLAMP_EXPLOSION = self.phalanx_vip.DAMAGE_CLAMP_BULLET
	self.flashbang_multiplier = 2
	self.concussion_multiplier = 1
end