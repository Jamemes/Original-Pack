if string.lower(RequiredScript) == "lib/tweak_data/weapontweakdata" then
	local data = WeaponTweakData.init
	function WeaponTweakData:init(tweak_data)
		data(self, tweak_data)
		self.benelli_npc.usage = "is_shotgun_pump_rapid"
		self.mp9_npc.DAMAGE = 0.5
	end
	
	function WeaponTweakData:_set_normal()
	end

	function WeaponTweakData:_set_hard()
	end

	function WeaponTweakData:_set_overkill()
	end

	function WeaponTweakData:_set_overkill_145()
		self.saiga_npc.DAMAGE = 5
	end

	function WeaponTweakData:_set_overkill_290()
		self.saiga_npc.DAMAGE = 5
		self.scar_npc.DAMAGE = 3
		self.rpk_lmg_npc.DAMAGE = 3
	end

	function WeaponTweakData:_set_easy_wish()
		self.mp9_npc.DAMAGE = 1
		self.asval_smg_npc.DAMAGE = 2
		self.ump_npc.DAMAGE = 2
		self.saiga_npc.DAMAGE = 5
		self.saiga_npc.CLIP_AMMO_MAX = 22
		self.scar_npc.DAMAGE = 4
		self.rpk_lmg_npc.DAMAGE = 3
	end

	function WeaponTweakData:_set_sm_wish()
		self.mp9_npc.DAMAGE = 1
		self.asval_smg_npc.DAMAGE = 2
		self.ump_npc.DAMAGE = 2
		self.saiga_npc.DAMAGE = 5
		self.saiga_npc.CLIP_AMMO_MAX = 22
		self.scar_npc.DAMAGE = 4
		self.rpk_lmg_npc.DAMAGE = 3
	end
end
if string.lower(RequiredScript) == "lib/tweak_data/charactertweakdata" then
	local data = CharacterTweakData.init
	function CharacterTweakData:init(tweak_data)
		data(self, tweak_data)
		
		self.security.chatter = {
			aggressive = true,
			contact = true,
			clear = true,
			clear_whisper = true,
			clear_whisper_2 = true,
			reload = true,
			look_for_angle = true,
			ecm = true,
			saw = true,
			trip_mines = true,
			sentry = true,
			suppress = true
		}
		self.gensec.chatter = {
			aggressive = true,
			contact = true,
			clear = true,
			clear_whisper = true,
			clear_whisper_2 = true,
			reload = true,
			look_for_angle = true,
			ecm = true,
			saw = true,
			trip_mines = true,
			sentry = true,
			suppress = true
		}
		self.cop.chatter = {
			incomming_captain = true,
			incomming_tank = true,
			incomming_spooc = true,
			incomming_shield = true,
			incomming_taser = true,
			entry = true,
			aggressive = true,
			aggressive_assault = true,
			retreat = true,
			contact = true,
			clear = true,
			clear_whisper = true,
			go_go = true,
			push = true,
			reload = true,
			look_for_angle = true,
			ecm = true,
			saw = true,
			trip_mines = true,
			sentry = true,
			ready = true,
			smoke = true,
			flash_grenade = true,
			follow_me = true,
			deathguard = true,
			open_fire = true,
			suppress = true
		}
		self.fbi.chatter = {
			incomming_captain = true,
			incomming_tank = true,
			incomming_spooc = true,
			incomming_shield = true,
			incomming_taser = true,
			entry = true,
			aggressive = true,
			aggressive_assault = true,
			retreat = true,
			contact = true,
			clear = true,
			clear_whisper = true,
			go_go = true,
			push = true,
			reload = true,
			look_for_angle = true,
			ecm = true,
			saw = true,
			trip_mines = true,
			sentry = true,
			ready = true,
			smoke = true,
			flash_grenade = true,
			follow_me = true,
			deathguard = true,
			open_fire = true,
			suppress = true
		}
		self.swat.chatter = {
			incomming_captain = true,
			incomming_tank = true,
			incomming_spooc = true,
			incomming_shield = true,
			incomming_taser = true,
			entry = true,
			aggressive = true,
			aggressive_assault = true,
			retreat = true,
			contact = true,
			clear = true,
			clear_whisper = true,
			go_go = true,
			push = true,
			reload = true,
			look_for_angle = true,
			ecm = true,
			saw = true,
			trip_mines = true,
			sentry = true,
			ready = true,
			smoke = true,
			flash_grenade = true,
			follow_me = true,
			deathguard = true,
			open_fire = true,
			suppress = true
		}
		self.heavy_swat.chatter = {
			incomming_captain = true,
			incomming_tank = true,
			incomming_spooc = true,
			incomming_shield = true,
			incomming_taser = true,
			entry = true,
			aggressive = true,
			aggressive_assault = true,
			retreat = true,
			contact = true,
			clear = true,
			clear_whisper = true,
			go_go = true,
			push = true,
			reload = true,
			look_for_angle = true,
			ecm = true,
			saw = true,
			trip_mines = true,
			sentry = true,
			ready = true,
			smoke = true,
			flash_grenade = true,
			follow_me = true,
			deathguard = true,
			open_fire = true,
			suppress = true
		}
		self.fbi_swat.chatter = {
			incomming_captain = true,
			incomming_tank = true,
			incomming_spooc = true,
			incomming_shield = true,
			incomming_taser = true,
			entry = true,
			aggressive = true,
			aggressive_assault = true,
			retreat = true,
			contact = true,
			clear = true,
			clear_whisper = true,
			go_go = true,
			push = true,
			reload = true,
			look_for_angle = true,
			ecm = true,
			saw = true,
			trip_mines = true,
			sentry = true,
			ready = true,
			smoke = true,
			flash_grenade = true,
			follow_me = true,
			deathguard = true,
			open_fire = true,
			suppress = true
		}
		self.fbi_heavy_swat.chatter = {
			incomming_captain = true,
			incomming_tank = true,
			incomming_spooc = true,
			incomming_shield = true,
			incomming_taser = true,
			entry = true,
			aggressive = true,
			aggressive_assault = true,
			retreat = true,
			contact = true,
			clear = true,
			clear_whisper = true,
			go_go = true,
			push = true,
			reload = true,
			look_for_angle = true,
			ecm = true,
			saw = true,
			trip_mines = true,
			sentry = true,
			ready = true,
			smoke = true,
			flash_grenade = true,
			follow_me = true,
			deathguard = true,
			open_fire = true,
			suppress = true
		}
		self.city_swat.chatter = {
			incomming_captain = true,
			incomming_tank = true,
			incomming_spooc = true,
			incomming_shield = true,
			incomming_taser = true,
			entry = true,
			aggressive = true,
			aggressive_assault = true,
			retreat = true,
			contact = true,
			clear = true,
			clear_whisper = true,
			go_go = true,
			push = true,
			reload = true,
			look_for_angle = true,
			ecm = true,
			saw = true,
			trip_mines = true,
			sentry = true,
			ready = true,
			smoke = true,
			flash_grenade = true,
			follow_me = true,
			deathguard = true,
			open_fire = true,
			suppress = true
		}
		self.tank.chatter = {
			aggressive = true,
			retreat = true,
			go_go = true,
			contact = true,
			entrance = true
		}
		self.shield.chatter = {
			incomming_captain = true,
			incomming_tank = true,
			incomming_spooc = true,
			incomming_taser = true,
			entry = true,
			follow_me = true,
			aggressive_assault = true,
			retreat = true,
			go_go = true,
			push = true,
			clear = true,
			reload = true
		}
		
		self.presets.gang_member_damage.MIN_DAMAGE_INTERVAL = 0
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
		self.presets.weapon.gang_member.is_pistol.FALLOFF = {
			{
				dmg_mul = 2,
				r = 300,
				acc = {
					1,
					1
				},
				recoil = {
					0.25,
					0.45
				},
				mode = {
					0.1,
					0.3,
					4,
					7
				}
			},
			{
				dmg_mul = 1,
				r = 10000,
				acc = {
					1,
					1
				},
				recoil = {
					2,
					3
				},
				mode = {
					0.1,
					0.3,
					4,
					7
				}
			}
		}
		self.presets.weapon.gang_member.is_rifle.FALLOFF = {
			{
				dmg_mul = 2,
				r = 300,
				acc = {
					1,
					1
				},
				recoil = {
					0.25,
					0.45
				},
				mode = {
					0.1,
					0.3,
					4,
					7
				}
			},
			{
				dmg_mul = 1,
				r = 10000,
				acc = {
					1,
					1
				},
				recoil = {
					2,
					3
				},
				mode = {
					0.1,
					0.3,
					4,
					7
				}
			}
		}
		self.presets.weapon.gang_member.is_sniper.FALLOFF = {
			{
				dmg_mul = 4,
				r = 500,
				acc = {
					1,
					1
				},
				recoil = {
					1,
					1
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 4,
				r = 1000,
				acc = {
					1,
					1
				},
				recoil = {
					1,
					1
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 4,
				r = 2500,
				acc = {
					0.95,
					1
				},
				recoil = {
					1,
					1
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 2,
				r = 4000,
				acc = {
					0.9,
					0.95
				},
				recoil = {
					1,
					1
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 2,
				r = 10000,
				acc = {
					0.85,
					0.9
				},
				recoil = {
					1,
					1
				},
				mode = {
					1,
					0,
					0,
					0
				}
			}
		}
		self.presets.weapon.gang_member.is_lmg.FALLOFF = {
			{
				dmg_mul = 2,
				r = 100,
				acc = {
					1,
					1
				},
				recoil = {
					0.25,
					0.45
				},
				mode = {
					0,
					0,
					0,
					1
				}
			},
			{
				dmg_mul = 1.5,
				r = 1000,
				acc = {
					0.85,
					0.9
				},
				recoil = {
					0.4,
					0.65
				},
				mode = {
					0,
					0,
					0,
					1
				}
			},
			{
				dmg_mul = 1,
				r = 2000,
				acc = {
					0.6,
					0.8
				},
				recoil = {
					0.8,
					1.25
				},
				mode = {
					0,
					0,
					0,
					1
				}
			},
			{
				dmg_mul = 0.5,
				r = 3000,
				acc = {
					0.5,
					0.7
				},
				recoil = {
					0.8,
					1.25
				},
				mode = {
					0,
					0,
					0,
					1
				}
			},
			{
				dmg_mul = 0.3,
				r = 4000,
				acc = {
					0.02,
					0.25
				},
				recoil = {
					1,
					2
				},
				mode = {
					0,
					0,
					0,
					1
				}
			},
			{
				dmg_mul = 0.1,
				r = 10000,
				acc = {
					0.01,
					0.1
				},
				recoil = {
					2,
					3
				},
				mode = {
					0,
					0,
					0,
					1
				}
			}
		}
		self.presets.weapon.gang_member.is_shotgun_pump.FALLOFF = {
			{
				dmg_mul = 2,
				r = 300,
				acc = {
					1,
					1
				},
				recoil = {
					0.25,
					0.45
				},
				mode = {
					0.1,
					0.3,
					4,
					7
				}
			},
			{
				dmg_mul = 1,
				r = 10000,
				acc = {
					1,
					1
				},
				recoil = {
					2,
					3
				},
				mode = {
					0.1,
					0.3,
					4,
					7
				}
			}
		}
		self.presets.weapon.gang_member.is_shotgun_mag.FALLOFF = {
			{
				dmg_mul = 2,
				r = 100,
				acc = {
					1,
					1
				},
				recoil = {
					0.1,
					0.1
				},
				mode = {
					1,
					1,
					4,
					6
				}
			},
			{
				dmg_mul = 2,
				r = 500,
				acc = {
					1,
					1
				},
				recoil = {
					0.1,
					0.1
				},
				mode = {
					1,
					1,
					4,
					5
				}
			},
			{
				dmg_mul = 1,
				r = 1000,
				acc = {
					0.85,
					0.95
				},
				recoil = {
					0.1,
					0.15
				},
				mode = {
					1,
					2,
					4,
					4
				}
			},
			{
				dmg_mul = 0.75,
				r = 2000,
				acc = {
					0.75,
					0.9
				},
				recoil = {
					0.25,
					0.45
				},
				mode = {
					1,
					4,
					4,
					1
				}
			},
			{
				dmg_mul = 0.25,
				r = 3000,
				acc = {
					0.4,
					0.7
				},
				recoil = {
					0.4,
					0.5
				},
				mode = {
					4,
					2,
					1,
					0
				}
			},
			{
				dmg_mul = 0.1,
				r = 10000,
				acc = {
					0.05,
					0.2
				},
				recoil = {
					0.5,
					1
				},
				mode = {
					2,
					1,
					0,
					0
				}
			}
		}

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
		self.presets.surrender.easy = {
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
		self.presets.surrender.normal = {
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
		self.presets.surrender.very_hard = {
			base_chance = 0.07,
			significant_chance = 0.05,
			violence_timeout = 1,
			reasons = {
				pants_down = 0.4,
				weapon_down = 0.1,
				health = {
					[1.0] = 0,
					[0.2] = 0.1
				}
			},
			factors = {
				enemy_weap_cold = 0.03,
				unaware_of_aggressor = 0.07,
				flanked = 0.02,
				isolated = 0.07,
				aggressor_dis = {
					[300.0] = 0.07,
					[1000.0] = 0
				}
			}
		}
		self.presets.surrender.special = {base_chance = 0}
		
		self.presets.move_speed.very_slow_but_faster = {
			stand = {
				walk = 	{ntl = {fwd = 220, strafe = 170, bwd = 144},		hos = {fwd = 220, strafe = 170, bwd = 144},	cbt = {fwd = 220, strafe = 170, bwd = 144}},
				run = 	{hos = {fwd = 220, strafe = 190, bwd = 144},		cbt = {fwd = 220, strafe = 150, bwd = 156}}
			},
			crouch = {
				walk = 	{hos = {fwd = 220, strafe = 170, bwd = 144},		cbt = {fwd = 220, strafe = 170, bwd = 144}},
				run = 	{hos = {fwd = 220, strafe = 190, bwd = 144},		cbt = {fwd = 220, strafe = 150, bwd = 156}}
			}
		}
		self.presets.hurt_severities.tank_mk1 = deep_clone(self.presets.hurt_severities.only_light_hurt_and_fire)
		self.presets.weapon.normal.is_shotgun_pump_rapid = deep_clone(self.presets.weapon.normal.is_shotgun_pump)
		self.presets.weapon.normal.is_shotgun_pump_rapid.FALLOFF[2].recoil = {0.4, 0.7}
		self.presets.weapon.normal.is_shotgun_pump_rapid.FALLOFF[3].recoil = {0.45, 0.8}
		self.presets.weapon.normal.is_shotgun_pump_rapid.FALLOFF[4].recoil = {0.45, 0.8}
		self.presets.weapon.good.is_shotgun_pump_rapid = deep_clone(self.presets.weapon.good.is_shotgun_pump)
		self.presets.weapon.good.is_shotgun_pump_rapid.FALLOFF[2].recoil = {0.4, 0.7}
		self.presets.weapon.good.is_shotgun_pump_rapid.FALLOFF[3].recoil = {0.45, 0.8}
		self.presets.weapon.good.is_shotgun_pump_rapid.FALLOFF[4].recoil = {0.45, 0.8}
		self.presets.weapon.expert.is_shotgun_pump_rapid = deep_clone(self.presets.weapon.expert.is_shotgun_pump)
		self.presets.weapon.expert.is_shotgun_pump_rapid.FALLOFF[2].recoil = {0.4, 0.7}
		self.presets.weapon.expert.is_shotgun_pump_rapid.FALLOFF[3].recoil = {0.45, 0.8}
		self.presets.weapon.expert.is_shotgun_pump_rapid.FALLOFF[4].recoil = {0.45, 0.8}
		self.presets.weapon.deathwish.is_shotgun_pump_rapid = deep_clone(self.presets.weapon.deathwish.is_shotgun_pump)
		self.presets.weapon.deathwish.is_shotgun_pump_rapid.FALLOFF[2].recoil = {0.4, 0.7}
		self.presets.weapon.deathwish.is_shotgun_pump_rapid.FALLOFF[3].recoil = {0.45, 0.8}
		self.presets.weapon.deathwish.is_shotgun_pump_rapid.FALLOFF[4].recoil = {0.45, 0.8}
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
		self.presets.weapon.expert.is_shotgun_pump.focus_delay = 2
		self.presets.weapon.expert.is_shotgun_pump.RELOAD_SPEED = 1.2
		self.presets.weapon.expert.is_shotgun_pump.melee_dmg = 20
		self.presets.weapon.expert.is_shotgun_pump.FALLOFF[1].acc = {0.6, 0.95}
		self.presets.weapon.expert.is_shotgun_pump.FALLOFF[2].acc = {0.5, 0.9}
		self.presets.weapon.expert.is_shotgun_pump.FALLOFF[3].acc = {0.4, 0.75}
		self.presets.weapon.expert.is_shotgun_pump.FALLOFF[4].acc = {0.1, 0.55}
		self.presets.weapon.expert.is_shotgun_pump.FALLOFF[5].acc = {0.1, 0.35}
		self.presets.weapon.expert.is_shotgun_pump.FALLOFF[1].dmg_mul = 6.5
		self.presets.weapon.expert.is_shotgun_pump.FALLOFF[2].dmg_mul = 5.5
		self.presets.weapon.expert.is_shotgun_pump.FALLOFF[3].dmg_mul = 4
		self.presets.weapon.expert.is_shotgun_pump.FALLOFF[4].dmg_mul = 3.5
		self.presets.weapon.expert.is_shotgun_pump.FALLOFF[5].dmg_mul = 2.5
		self.presets.weapon.expert.is_rifle.focus_delay = 2
		self.presets.weapon.expert.is_rifle.focus_dis = 300
		self.presets.weapon.expert.is_rifle.RELOAD_SPEED = 1.2
		self.presets.weapon.expert.is_rifle.melee_dmg = 20
		self.presets.weapon.expert.is_rifle.FALLOFF[1].dmg_mul = 6
		self.presets.weapon.expert.is_rifle.FALLOFF[2].dmg_mul = 5.75
		self.presets.weapon.expert.is_rifle.FALLOFF[2].acc = {0.55, 0.95}
		self.presets.weapon.expert.is_rifle.FALLOFF[3].dmg_mul = 5.75
		self.presets.weapon.expert.is_rifle.FALLOFF[3].acc = {0.525, 0.8}
		self.presets.weapon.expert.is_rifle.FALLOFF[4].dmg_mul = 5.5
		self.presets.weapon.expert.is_rifle.FALLOFF[4].acc = {0.5, 0.7}
		self.presets.weapon.expert.is_rifle.FALLOFF[5].acc = {0.2, 0.4}
		self.presets.weapon.expert.is_rifle.FALLOFF[5].dmg_mul = 5.25
		self.presets.hurt_severities.unit = deep_clone(self.presets.hurt_severities.base)
		self.presets.hurt_severities.tank_mk1 = deep_clone(self.presets.hurt_severities.only_light_hurt_and_fire)
		self.presets.hurt_severities.tank_mk2 = deep_clone(self.presets.hurt_severities.only_light_hurt_and_fire)
		self.presets.hurt_severities.unit_mk2 = deep_clone(self.presets.hurt_severities.only_fire_and_poison_hurts)
		self.presets.hurt_severities.only_fire_and_poison_hurts.bullet.zones = {{light = 1}}
		self.presets.hurt_severities.only_fire_and_poison_hurts.explosion.zones = {{light = 1}}
		self.presets.hurt_severities.only_fire_and_poison_hurts.melee.zones = {{light = 1}}
		self.presets.hurt_severities.tank_mk2.explosion.zones = {{light = 1}}
		self.presets.hurt_severities.tank_mk1.explosion.zones = {{light = 1}}
		
		self.presets.hurt_severities.base.melee.zones = {{light = 1}}
		
		self.security.HEALTH_INIT = 3
		self.security.headshot_dmg_mul = self.security.HEALTH_INIT / 1
		self.security.damage.hurt_severity = self.presets.hurt_severities.unit
		self.security_mex.headshot_dmg_mul = self.security.headshot_dmg_mul
		self.security_mex.HEALTH_INIT = self.security.HEALTH_INIT
		self.security_mex.damage.hurt_severity = self.presets.hurt_severities.unit
		
		self.gensec.HEALTH_INIT = 6
		self.gensec.headshot_dmg_mul = self.gensec.HEALTH_INIT / 1
		self.gensec.surrender = self.presets.surrender.hard
		self.gensec.damage.hurt_severity = self.presets.hurt_severities.unit
		
		self.cop.HEALTH_INIT = 3
		self.cop.headshot_dmg_mul = self.cop.HEALTH_INIT / 1
		self.cop.surrender = self.presets.surrender.normal
		self.cop.damage.hurt_severity = self.presets.hurt_severities.unit
		
		self.fbi.HEALTH_INIT = 5
		self.fbi.headshot_dmg_mul = self.fbi.HEALTH_INIT / 1
		self.fbi.surrender = self.presets.surrender.normal
		self.fbi.damage.hurt_severity = self.presets.hurt_severities.unit
		
		self.swat.HEALTH_INIT = 8
		self.swat.headshot_dmg_mul = self.swat.HEALTH_INIT / 2
		self.swat.surrender = self.presets.surrender.hard
		self.swat.damage.hurt_severity = self.presets.hurt_severities.unit
			
		self.heavy_swat.HEALTH_INIT = 10
		self.heavy_swat.headshot_dmg_mul = self.heavy_swat.HEALTH_INIT / 6
		self.heavy_swat.surrender = self.presets.surrender.hard
		self.heavy_swat.damage.hurt_severity = self.presets.hurt_severities.unit
				
		self.fbi_swat.HEALTH_INIT = 13
		self.fbi_swat.headshot_dmg_mul = self.fbi_swat.HEALTH_INIT / 4
		self.fbi_swat.surrender = self.presets.surrender.hard
		self.fbi_swat.damage.hurt_severity = self.presets.hurt_severities.unit
			
		self.fbi_heavy_swat.HEALTH_INIT = 20
		self.fbi_heavy_swat.headshot_dmg_mul = self.fbi_heavy_swat.HEALTH_INIT / 10
		self.fbi_heavy_swat.surrender = self.presets.surrender.hard
		self.fbi_heavy_swat.damage.hurt_severity = self.presets.hurt_severities.unit
			
		self.city_swat.HEALTH_INIT = 13
		self.city_swat.headshot_dmg_mul = self.city_swat.HEALTH_INIT / 4
		self.city_swat.surrender = self.presets.surrender.hard
		self.city_heavy_swat = deep_clone(self.city_swat)
		
		self.sniper.headshot_dmg_mul = self.sniper.HEALTH_INIT / 2
			
		self.gangster.HEALTH_INIT = 4
		self.gangster.headshot_dmg_mul = self.gangster.HEALTH_INIT / 1
		self.gangster.damage.hurt_severity = self.presets.hurt_severities.unit
			
		self.tank.HEALTH_INIT = 550
		self.tank.headshot_dmg_mul = self.tank.HEALTH_INIT / 24
		self.tank.damage.explosion_damage_mul = 1
		self.tank.move_speed = self.presets.move_speed.very_slow
		self.tank.damage.hurt_severity = self.presets.hurt_severities.tank_mk1
		self.tank.ecm_hurts.ears = {min_duration = 7, max_duration = 9}
		self.tank.weapon.is_shotgun_mag.FALLOFF[1].dmg_mul = 3
		self.tank_mini.headshot_dmg_mul = self.tank_mini.HEALTH_INIT / 75
		self.tank_green = deep_clone(self.tank)
		self.tank_black = deep_clone(self.tank)
		self.tank_city = deep_clone(self.tank)
		
		self.spooc.headshot_dmg_mul = self.spooc.HEALTH_INIT / 14
			
		self.shield.HEALTH_INIT = 10
		self.shield.headshot_dmg_mul = self.shield.HEALTH_INIT / 6
		self.shield.move_speed = self.presets.move_speed.fast
		self.shield.weapon.is_smg.FALLOFF[2].dmg_mul = 3
		self.shield.weapon.is_smg.FALLOFF[3].dmg_mul = 2
		self.shield.weapon.is_smg.FALLOFF[4].dmg_mul = 1
			
		self.taser.HEALTH_INIT = 36
		self.taser.headshot_dmg_mul = self.taser.HEALTH_INIT / 20
		self.taser.damage.hurt_severity = self.presets.hurt_severities.unit
	end
	
	function CharacterTweakData:_set_normal()
		self:_multiply_all_hp(1, 1)

		self:_multiply_weapon_delay(self.presets.weapon.normal, 0)
		self:_multiply_weapon_delay(self.presets.weapon.good, 0)
		self:_multiply_weapon_delay(self.presets.weapon.expert, 0)
		self:_multiply_weapon_delay(self.presets.weapon.sniper, 3)
		self:_multiply_weapon_delay(self.presets.weapon.gang_member, 0)

		self.hector_boss.weapon.is_shotgun_mag.FALLOFF = {
			{
				dmg_mul = 0.22,
				r = 200,
				acc = {
					0.6,
					0.9
				},
				recoil = {
					0.4,
					0.7
				},
				mode = {
					0,
					1,
					2,
					1
				}
			},
			{
				dmg_mul = 0.18,
				r = 500,
				acc = {
					0.6,
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
				dmg_mul = 0.15,
				r = 1000,
				acc = {
					0.4,
					0.8
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
				dmg_mul = 0.13,
				r = 2000,
				acc = {
					0.4,
					0.55
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
				dmg_mul = 0.1,
				r = 3000,
				acc = {
					0.1,
					0.35
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
		self.hector_boss.HEALTH_INIT = 50
		self.mobster_boss.HEALTH_INIT = 50
		self.biker_boss.HEALTH_INIT = 100
		self.chavez_boss.HEALTH_INIT = 100
		self.presets.gang_member_damage.REGENERATE_TIME = 1.5
		self.presets.gang_member_damage.REGENERATE_TIME_AWAY = 0.2
		self.presets.gang_member_damage.HEALTH_INIT = 125

		self:_set_characters_weapon_preset("normal")
		self.flashbang_multiplier = 1
		self.concussion_multiplier = 1
	end
	
	function CharacterTweakData:_set_hard()
		self:_multiply_all_hp(1.32, 1)
		self:_multiply_weapon_delay(self.presets.weapon.normal, 0)
		self:_multiply_weapon_delay(self.presets.weapon.good, 0)
		self:_multiply_weapon_delay(self.presets.weapon.expert, 0)
		self:_multiply_weapon_delay(self.presets.weapon.sniper, 3)
		self:_multiply_weapon_delay(self.presets.weapon.gang_member, 0)

		self.hector_boss.weapon.is_shotgun_mag.FALLOFF = {
			{
				dmg_mul = 0.44,
				r = 200,
				acc = {
					0.6,
					0.9
				},
				recoil = {
					0.4,
					0.7
				},
				mode = {
					0,
					1,
					2,
					1
				}
			},
			{
				dmg_mul = 0.35,
				r = 500,
				acc = {
					0.6,
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
				dmg_mul = 0.3,
				r = 1000,
				acc = {
					0.4,
					0.8
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
				dmg_mul = 0.25,
				r = 2000,
				acc = {
					0.4,
					0.55
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
				dmg_mul = 0.2,
				r = 3000,
				acc = {
					0.1,
					0.35
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
		self.hector_boss.HEALTH_INIT = 100
		self.mobster_boss.HEALTH_INIT = 100
		self.biker_boss.HEALTH_INIT = 100
		self.chavez_boss.HEALTH_INIT = 100
		self.presets.gang_member_damage.REGENERATE_TIME = 2
		self.presets.gang_member_damage.REGENERATE_TIME_AWAY = 0.4

		self:_set_characters_weapon_preset("normal")

		self.presets.gang_member_damage.HEALTH_INIT = 160
		self.flashbang_multiplier = 1.25
		self.concussion_multiplier = 1
		self.shadow_spooc.shadow_spooc_attack_timeout = {8, 10}
		self.spooc.spooc_attack_timeout = {8, 10}
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
		
		self.taser.HEALTH_INIT = 36
		self.spooc.HEALTH_INIT = 60
		self.tank_green.HEALTH_INIT = 550
		self.tank_black.HEALTH_INIT = 550
		self.shield.HEALTH_INIT = self.fbi_swat.HEALTH_INIT
		self.shield.headshot_dmg_mul = self.fbi_swat.headshot_dmg_mul
	end

	function CharacterTweakData:_set_overkill()
		self:_multiply_all_hp(1.32, 1)
		self:_multiply_weapon_delay(self.presets.weapon.normal, 0)
		self:_multiply_weapon_delay(self.presets.weapon.good, 0)
		self:_multiply_weapon_delay(self.presets.weapon.expert, 0)
		self:_multiply_weapon_delay(self.presets.weapon.sniper, 3)
		self:_multiply_weapon_delay(self.presets.weapon.gang_member, 0)

		self.hector_boss.weapon.is_shotgun_mag.FALLOFF = {
			{
				dmg_mul = 1.1,
				r = 200,
				acc = {
					0.6,
					0.9
				},
				recoil = {
					0.4,
					0.7
				},
				mode = {
					0,
					1,
					2,
					1
				}
			},
			{
				dmg_mul = 0.88,
				r = 500,
				acc = {
					0.6,
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
				dmg_mul = 0.75,
				r = 1000,
				acc = {
					0.4,
					0.8
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
				dmg_mul = 0.63,
				r = 2000,
				acc = {
					0.4,
					0.55
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
				dmg_mul = 0.5,
				r = 3000,
				acc = {
					0.1,
					0.35
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
		self.hector_boss.HEALTH_INIT = 300
		self.mobster_boss.HEALTH_INIT = 300
		self.biker_boss.HEALTH_INIT = 300
		self.chavez_boss.HEALTH_INIT = 300
		self.presets.gang_member_damage.REGENERATE_TIME = 2
		self.presets.gang_member_damage.REGENERATE_TIME_AWAY = 0.6
		self.presets.gang_member_damage.HEALTH_INIT = 200

		self:_set_characters_weapon_preset("good")

		self.shadow_spooc.shadow_spooc_attack_timeout = {6, 8}
		self.spooc.spooc_attack_timeout = {6, 8}
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
		
		self.taser.HEALTH_INIT = 36
		self.spooc.HEALTH_INIT = 60
		self.tank_green.HEALTH_INIT = 550
		self.tank_black.HEALTH_INIT = 550
		self.shield.HEALTH_INIT = self.fbi_swat.HEALTH_INIT
		self.shield.headshot_dmg_mul = self.fbi_swat.headshot_dmg_mul
		self.shield.HEALTH_INIT = self.fbi_swat.HEALTH_INIT
		self.shield.headshot_dmg_mul = self.fbi_swat.headshot_dmg_mul
	end
	
	function CharacterTweakData:_set_overkill_145()
		if SystemInfo:platform() == Idstring("PS3") then
			self:_multiply_all_hp(1.32, 1)
		else
			self:_multiply_all_hp(1.32, 1)
		end
		
		self.hector_boss.weapon.is_shotgun_mag.FALLOFF = {
			{
				dmg_mul = 2.2,
				r = 200,
				acc = {
					0.6,
					0.9
				},
				recoil = {
					0.4,
					0.7
				},
				mode = {
					0,
					1,
					2,
					1
				}
			},
			{
				dmg_mul = 1.75,
				r = 500,
				acc = {
					0.6,
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
				dmg_mul = 1.5,
				r = 1000,
				acc = {
					0.4,
					0.8
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
				dmg_mul = 1.25,
				r = 2000,
				acc = {
					0.4,
					0.55
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
				dmg_mul = 1,
				r = 3000,
				acc = {
					0.1,
					0.35
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
		self.hector_boss.HEALTH_INIT = 600
		self.mobster_boss.HEALTH_INIT = 600
		self.biker_boss.HEALTH_INIT = 1800
		self.chavez_boss.HEALTH_INIT = 600

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
		
		self.taser.HEALTH_INIT = 36
		self.spooc.HEALTH_INIT = 60
		self.tank_green.HEALTH_INIT = 550
		self.tank_black.HEALTH_INIT = 550
		self.shield.HEALTH_INIT = self.fbi_swat.HEALTH_INIT
		self.shield.headshot_dmg_mul = self.fbi_swat.headshot_dmg_mul
	end

	function CharacterTweakData:_set_overkill_290()
		if SystemInfo:platform() == Idstring("PS3") then
			self:_multiply_all_hp(1.7, 0.75)
		else
			self:_multiply_all_hp(1.7, 0.75)
		end

		self.hector_boss.weapon.is_shotgun_mag.FALLOFF = {
			{
				dmg_mul = 3.14,
				r = 200,
				acc = {
					0.6,
					0.9
				},
				recoil = {
					0.4,
					0.7
				},
				mode = {
					0,
					1,
					2,
					1
				}
			},
			{
				dmg_mul = 2.5,
				r = 500,
				acc = {
					0.6,
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
				dmg_mul = 2.1,
				r = 1000,
				acc = {
					0.4,
					0.8
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
				dmg_mul = 1.8,
				r = 2000,
				acc = {
					0.4,
					0.55
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
				dmg_mul = 1.4,
				r = 3000,
				acc = {
					0.1,
					0.35
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
		self.hector_boss.HEALTH_INIT = 900
		self.mobster_boss.HEALTH_INIT = 900
		self.biker_boss.HEALTH_INIT = 3000
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
		self.city_swat.headshot_dmg_mul = self.fbi_swat.HEALTH_INIT / 8
		self.city_swat.damage.explosion_damage_mul = 0.8
		self.city_swat.damage.hurt_severity = self.presets.hurt_severities.only_light_hurt_and_fire
		self.flashbang_multiplier = 2
		self.concussion_multiplier = 1
	end
	
	local data = CharacterTweakData._set_overkill_290
	function CharacterTweakData:_set_easy_wish()
		data(self)
		self.tank_green.HEALTH_INIT = 550
		self.tank_black.HEALTH_INIT = 775
		self.tank_city.HEALTH_INIT = 935
		self.tank_green.move_speed = self.presets.move_speed.slow
		self.tank_black.move_speed = self.presets.move_speed.very_slow_but_faster
		
		self.fbi_heavy_swat.HEALTH_INIT = 43
		self.fbi_heavy_swat.move_speed = self.presets.move_speed.fast
		self.fbi_heavy_swat.damage.explosion_damage_mul = 0.8
		self.fbi_heavy_swat.damage.hurt_severity = self.presets.hurt_severities.only_light_hurt_and_fire
		
		self.shield.HEALTH_INIT = self.city_swat.HEALTH_INIT
		self.shield.move_speed = self.presets.move_speed.very_fast
		self.shield.headshot_dmg_mul = self.city_swat.headshot_dmg_mul
		self.shield.damage.explosion_damage_mul = 0.8
		self.gensec.melee_weapon = "knife_1"
		self.fbi.melee_weapon = "knife_1"
	end
	
	function CharacterTweakData:_set_sm_wish()
		data(self)
		self.swat = self.city_swat
		self.heavy_swat = self.city_heavy_swat
		self.shield.HEALTH_INIT = self.city_swat.HEALTH_INIT
		self.tank_green.HEALTH_INIT = 550
		self.tank_black.HEALTH_INIT = 775
		self.tank_city.HEALTH_INIT = 935
		self.tank_mini.HEALTH_INIT = 1200
		
		if SystemInfo:platform() == Idstring("PS3") then
			self:_multiply_all_hp(1.2, 0.9)
		else
			self:_multiply_all_hp(1.2, 0.9)
		end
		
		self.civilian.move_speed = self.presets.move_speed.very_fast
		self.civilian_female.move_speed = self.presets.move_speed.very_fast
		self.bank_manager.move_speed = self.presets.move_speed.very_fast
		self.cop.move_speed = self.presets.move_speed.lightning
		self.fbi.move_speed = self.presets.move_speed.lightning
		self.fbi_swat.move_speed = self.presets.move_speed.lightning
		self.swat.move_speed = self.presets.move_speed.very_fast
		self.heavy_swat.move_speed = self.presets.move_speed.normal
		self.shield.move_speed = self.presets.move_speed.very_fast
		self.tank_green.move_speed = self.presets.move_speed.slow
		self.tank_black.move_speed = self.presets.move_speed.very_slow_but_faster
		self.tank_mini.move_speed = self.presets.move_speed.very_slow
		
		self.security.damage.hurt_severity = self.presets.hurt_severities.light_hurt_fire_poison
		self.security_mex.damage.hurt_severity = self.presets.hurt_severities.light_hurt_fire_poison
		self.cop.damage.hurt_severity = self.presets.hurt_severities.light_hurt_fire_poison
		self.gangster.damage.hurt_severity = self.presets.hurt_severities.light_hurt_fire_poison
		self.fbi_swat.damage.hurt_severity = self.presets.hurt_severities.light_hurt_fire_poison
		self.fbi_heavy_swat.damage.hurt_severity = self.presets.hurt_severities.light_hurt_fire_poison
		self.heavy_swat.damage.hurt_severity = self.presets.hurt_severities.light_hurt_fire_poison
		self.swat.damage.hurt_severity = self.presets.hurt_severities.light_hurt_fire_poison
		self.fbi.damage.hurt_severity = self.presets.hurt_severities.light_hurt_fire_poison
		self.gensec.damage.hurt_severity = self.presets.hurt_severities.light_hurt_fire_poison
		self.city_heavy_swat.damage.hurt_severity = self.presets.hurt_severities.only_light_hurt_and_fire
		self.taser.damage.hurt_severity = self.presets.hurt_severities.unit_mk2
		self.spooc.damage.hurt_severity = self.presets.hurt_severities.unit_mk2
		
		self.swat.damage.explosion_damage_mul = 0.75
		self.heavy_swat.damage.explosion_damage_mul = 0.75
		self.fbi_swat.damage.explosion_damage_mul = 0.75
		self.fbi_heavy_swat.damage.explosion_damage_mul = 0.75
		self.city_swat.damage.explosion_damage_mul = 0.75
		self.city_heavy_swat.damage.explosion_damage_mul = 0.75
		
		self.shield.HEALTH_INIT = self.city_swat.HEALTH_INIT
		self.cop.headshot_dmg_mul = self.gensec.headshot_dmg_mul
		self.security.headshot_dmg_mul = self.gensec.headshot_dmg_mul
		self.security_mex.headshot_dmg_mul = self.gensec.headshot_dmg_mul
		self.shield.headshot_dmg_mul = self.city_swat.headshot_dmg_mul
		self.fbi_swat.headshot_dmg_mul = self.spooc.headshot_dmg_mul
		self.city_heavy_swat.headshot_dmg_mul = self.city_swat.headshot_dmg_mul
		self.heavy_swat.headshot_dmg_mul = self.city_heavy_swat.headshot_dmg_mul * 0.5
		self.tank_mini.headshot_dmg_mul = self.tank.headshot_dmg_mul * 0.7
		self.fbi_heavy_swat.HEALTH_INIT = 48
		self.city_heavy_swat.HEALTH_INIT = 52
		self.gensec.melee_weapon = "knife_1"
		self.fbi.melee_weapon = "knife_1"
		
		self.security.no_arrest = true
		self.security_mex.no_arrest = true
		self.cop.no_arrest = true
		self.gensec.no_arrest = true
		self.fbi.no_arrest = true
		self.swat.no_arrest = true
		self.heavy_swat.no_arrest = true
		self.fbi_swat.no_arrest = true
		self.fbi_heavy_swat.no_arrest = true
		self.city_heavy_swat.no_arrest = true
		
		self.cop.dodge = self.presets.dodge.athletic
		self.heavy_swat.dodge = self.presets.dodge.athletic
		self.fbi_heavy_swat.dodge = self.presets.dodge.athletic
		self.city_heavy_swat.dodge = self.presets.dodge.athletic
		
		self.security.surrender = self.presets.surrender.hard
		self.security_mex.surrender = self.presets.surrender.hard
		self.cop.surrender = self.presets.surrender.hard
		self.fbi.surrender = self.presets.surrender.hard
		self.gensec.surrender = self.presets.surrender.hard
		
		self.swat.surrender = self.presets.surrender.very_hard
		self.heavy_swat.surrender = self.presets.surrender.very_hard
		self.city_swat.surrender = self.presets.surrender.very_hard
		self.fbi_swat.surrender = self.presets.surrender.very_hard
		self.fbi_heavy_swat.surrender = self.presets.surrender.very_hard
		self.city_heavy_swat.surrender = self.presets.surrender.very_hard
	
		self.tank_green.steal_loot = true
		
		self.spooc.dodge_with_grenade = {
			flash = {duration = {4, 6}},
			check = function (t, nr_grenades_used)
				local delay_till_next_use = math.lerp(17, 45, math.min(1, (nr_grenades_used or 0) / 4))
				local chance = math.lerp(1, 0.5, math.min(1, (nr_grenades_used or 0) / 10))

				if math.random() < chance then
					return true, t + delay_till_next_use
				end

				return false, t + delay_till_next_use
			end
		}
	end
	
	local data = CharacterTweakData._multiply_all_hp
	function CharacterTweakData:_multiply_all_hp(hp_mul, hs_mul)
		data(self, hp_mul, hs_mul)
		self.security.HEALTH_INIT = self.security.HEALTH_INIT * hp_mul
		self.security_mex.HEALTH_INIT = self.security_mex.HEALTH_INIT * hp_mul
		self.cop.HEALTH_INIT = self.cop.HEALTH_INIT * hp_mul
		self.gensec.HEALTH_INIT = self.gensec.HEALTH_INIT * hp_mul
		
		self.tank_green.HEALTH_INIT = self.tank_green.HEALTH_INIT * hp_mul
		self.tank_black.HEALTH_INIT = self.tank_black.HEALTH_INIT * hp_mul
		self.tank_city.HEALTH_INIT = self.tank_city.HEALTH_INIT * hp_mul
		
		if self.security.headshot_dmg_mul then
			self.security.headshot_dmg_mul = self.security.headshot_dmg_mul * hs_mul
		end
		if self.security_mex.headshot_dmg_mul then
			self.security_mex.headshot_dmg_mul = self.security_mex.headshot_dmg_mul * hs_mul
		end
		if self.cop.headshot_dmg_mul then
			self.cop.headshot_dmg_mul = self.cop.headshot_dmg_mul * hs_mul
		end
		if self.gensec.headshot_dmg_mul then
			self.gensec.headshot_dmg_mul = self.gensec.headshot_dmg_mul * hs_mul
		end
		if self.tank_green.headshot_dmg_mul then
			self.tank_green.headshot_dmg_mul = self.tank_green.headshot_dmg_mul * hs_mul
		end
		if self.tank_black.headshot_dmg_mul then
			self.tank_black.headshot_dmg_mul = self.tank_black.headshot_dmg_mul * hs_mul
		end
		if self.tank_city.headshot_dmg_mul then
			self.tank_city.headshot_dmg_mul = self.tank_city.headshot_dmg_mul * hs_mul
		end
		
	end

	function CharacterTweakData:custom_weapons(unit)
		local name = unit:name()
		local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
		local difficulty_index = tweak_data:difficulty_to_index(difficulty)
		local raging_bull = Idstring("units/payday2/weapons/wpn_npc_raging_bull/wpn_npc_raging_bull")
		local beretta = Idstring("units/payday2/weapons/wpn_npc_beretta92/wpn_npc_beretta92")
		local benelli = Idstring("units/payday2/weapons/wpn_npc_benelli/wpn_npc_benelli")
		local c45 = Idstring("units/payday2/weapons/wpn_npc_c45/wpn_npc_c45")
		local g36 = Idstring("units/payday2/weapons/wpn_npc_g36/wpn_npc_g36")
		local m4 = Idstring("units/payday2/weapons/wpn_npc_m4/wpn_npc_m4")
		local mp5 = Idstring("units/payday2/weapons/wpn_npc_mp5/wpn_npc_mp5")
		local mp5_spook = Idstring("units/payday2/weapons/wpn_npc_mp5_tactical/wpn_npc_mp5_tactical")
		local scar = Idstring("units/payday2/weapons/wpn_npc_scar_murkywater/wpn_npc_scar_murkywater")
		local ump = Idstring("units/payday2/weapons/wpn_npc_ump/wpn_npc_ump")
		local asval = Idstring("units/pd2_dlc_mad/weapons/wpn_npc_asval/wpn_npc_asval")
		local rpk = Idstring("units/pd2_dlc_mad/weapons/wpn_npc_rpk/wpn_npc_rpk")
		
		math.randomseed(TimerManager:game():time() * 1500)
		
		local weapons = {g36, ump}
		local city_swat = {
			"units/payday2/characters/ene_city_swat_1/ene_city_swat_1",
			"units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"
		}
		for _, units in pairs(city_swat) do
			if name == Idstring(units) or name == Idstring(units .. "_husk") then
				return weapons[math.random(2)]
			end
		end
		
		local weapons = {scar, asval}
		local city_military = {
			"units/pd2_dlc_bph/characters/ene_murkywater_city_g36/ene_murkywater_city_g36",
			"units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_g36/ene_swat_policia_federale_city_g36"
		}
		for _, units in pairs(city_military) do
			if name == Idstring(units) or name == Idstring(units .. "_husk") then
				return weapons[math.random(2)]
			end
		end
		
		local scar_rifles = {
			"units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy",
			"units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi/ene_swat_heavy_policia_federale_fbi",
			"units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_g36/ene_swat_heavy_policia_federale_fbi_g36",
			"units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36",
			"units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic",
			"units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun",
			"units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_1/ene_murkywater_bulldozer_1",
			"units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_minigun/ene_swat_dozer_policia_federale_minigun"
		}
		for _, units in pairs(scar_rifles) do
			if name == Idstring(units) or name == Idstring(units .. "_husk") then
				if difficulty == "easy_wish" or difficulty == "sm_wish" then
					return scar
				else
					return m4
				end
			end
		end
		
		local weapons = {rpk, asval}
		local units = "units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass"
		if name == Idstring(units) or name == Idstring(units .. "_husk") then
			return weapons[math.random(2)]
		end

		local units = "units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870/ene_akan_fbi_swat_dw_r870"
		if name == Idstring(units) or name == Idstring(units .. "_husk") then
			return benelli
		end
		
		local units = "units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36"
		if name == Idstring(units) or name == Idstring(units .. "_husk") then
			return rpk
		end	
		
		local units = "units/pd2_dlc_mad/characters/ene_akan_cs_cop_asval_smg/ene_akan_cs_cop_asval_smg"
		if name == Idstring(units) or name == Idstring(units .. "_husk") then
			if difficulty == "sm_wish" then
				return scar
			end
		end
				
		local weapons = {beretta, c45, raging_bull}
		local secret_service = {
			"units/pd2_dlc_gitgud/characters/ene_secret_service_2/ene_secret_service_2",
			"units/pd2_dlc_bex/characters/ene_fbi_bex_1/ene_fbi_bex_1"
		}
		for _, units in pairs(secret_service) do
			if name == Idstring(units) or name == Idstring(units .. "_husk") then
				return weapons[math.random(3)]
			end
		end
		
		local weapons = {mp5, mp5_spook, ump}
		local units = "units/pd2_dlc_gitgud/characters/ene_secret_service_1/ene_secret_service_1"
		if name == Idstring(units) or name == Idstring(units .. "_husk") then
			return weapons[math.random(2)]
		end
		
		local weapons = {scar, m4, benelli}
		local secret_swat = {
			"units/pd2_dlc_bph/characters/ene_murkywater_secret_service/ene_murkywater_secret_service",
			"units/pd2_dlc_bex/characters/ene_fbi_bex_2/ene_fbi_bex_2"
		}
		for _, units in pairs(secret_swat) do
			if name == Idstring(units) or name == Idstring(units .. "_husk") then
				if difficulty == "easy_wish" or difficulty == "sm_wish" then
					return weapons[math.random(3)]
				else
					return m4
				end
			end
		end
		
		return
	end

	local origin_charmap = CharacterTweakData.character_map
	function CharacterTweakData:character_map() -- thanks fuglore
		local char_map = origin_charmap(self)
		char_map.op_gitgud = {
			path = "units/pd2_dlc_gitgud/characters/",
			list = {
				"ene_zeal_swat_heavy_op",
				"ene_zeal_swat_light",
				"ene_secret_service_1",
				"ene_secret_service_2"
			}
		}
		char_map.op_bph = {
			path = "units/pd2_dlc_bph/characters/",
			list = {
				"ene_murkywater_secret_service",
				"ene_murkywater_heavy_fbi",
				"ene_murkywater_city_g36"
			}
		}
		char_map.op_bex = {
			path = "units/pd2_dlc_bex/characters/",
			list = {
				"ene_fbi_bex_1",
				"ene_fbi_bex_2",
				"ene_swat_policia_federale_fbi_r870",
				"ene_swat_policia_federale_city_g36"
			}
		}
		return char_map
	end
end
if string.lower(RequiredScript) == "lib/tweak_data/groupaitweakdata" then
	old_init = GroupAITweakData.init
	function GroupAITweakData:init(tweak_data)
		old_init(self, tweak_data)
		
		local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
		local difficulty_index = tweak_data:difficulty_to_index(difficulty)
		local access_type_walk_only = {walk = true}
		local access_type_all = {acrobatic = true, walk = true}
		local is_console = SystemInfo:platform() ~= Idstring("WIN32")
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
		
		if difficulty_index == 8 then
			self.flash_grenade.timer = 0.5
		elseif difficulty_index >= 5 then
			self.flash_grenade.timer = 1
		else
			self.flash_grenade.timer = 2
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
	end
end
if string.lower(RequiredScript) == "lib/units/enemies/cop/copmovement" then
	local data = CopMovement.post_init
	function CopMovement:post_init()
		data(self, unit)
		
		local greens = {
			"units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1",
			"units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1",
			"units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2",
			"units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_2/ene_murkywater_bulldozer_2",
			"units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870",
			"units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870"
		}
		local blacks = {
			"units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2",
			"units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2",
			"units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3",
			"units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_3/ene_murkywater_bulldozer_3",
			"units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga",
			"units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_saiga/ene_swat_dozer_policia_federale_saiga"
		}

		for _, path in pairs(greens) do
			if self._unit:name() == Idstring(path) or self._unit:name() == Idstring(path .. "_husk") then
				self._action_common_data.char_tweak = tweak_data.character.tank_green
			end
		end
		for _, path in pairs(blacks) do
			if self._unit:name() == Idstring(path) or self._unit:name() == Idstring(path .. "_husk") then
				self._action_common_data.char_tweak = tweak_data.character.tank_black
			end
		end
	end
end
if string.lower(RequiredScript) == "lib/units/enemies/cop/copbase" then
	local data = CopBase.default_weapon_name
	function CopBase:default_weapon_name()
		return tweak_data.character:custom_weapons(self._unit) or data(self)
	end
end
if string.lower(RequiredScript) == "lib/units/enemies/cop/copdamage" then
	local data = CopDamage.init
	function CopDamage:init(unit)
		data(self, unit)
		local greens = {
			"units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1",
			"units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1",
			"units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2",
			"units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_2/ene_murkywater_bulldozer_2",
			"units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870",
			"units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870"
		}
		local blacks = {
			"units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2",
			"units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2",
			"units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3",
			"units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_3/ene_murkywater_bulldozer_3",
			"units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga",
			"units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_saiga/ene_swat_dozer_policia_federale_saiga"
		}
		local skulls = {
			"units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3",
			"units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3",
			"units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer",
			"units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_4/ene_murkywater_bulldozer_4",
			"units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg",
			"units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_m249/ene_swat_dozer_policia_federale_m249"
		}
		
		for _, path in pairs(greens) do
			if self._unit:name() == Idstring(path) or self._unit:name() == Idstring(path .. "_husk") then
				self._HEALTH_INIT = tweak_data.character.tank_green.HEALTH_INIT
				self._health = self._HEALTH_INIT
			end
		end
		for _, path in pairs(blacks) do
			if self._unit:name() == Idstring(path) or self._unit:name() == Idstring(path .. "_husk") then
				self._HEALTH_INIT = tweak_data.character.tank_black.HEALTH_INIT
				self._health = self._HEALTH_INIT
			end
		end
		for _, path in pairs(skulls) do
			if self._unit:name() == Idstring(path) or self._unit:name() == Idstring(path .. "_husk") then
				self._HEALTH_INIT = tweak_data.character.tank_city.HEALTH_INIT
				self._health = self._HEALTH_INIT
			end
		end
	end
	
	local hurt = tweak_data.character.presets.hurt_severities
	local data = CopDamage.damage_explosion
	function CopDamage:damage_explosion(attack_data)
		local damage = attack_data.damage
		if damage >= 100 then
			if self._health_ratio > 0.9 then
				hurt.tank_mk1.explosion.zones = {{moderate = 1}}
				hurt.tank_mk2.explosion.zones = {{explode = 1}}
			else
				hurt.tank_mk1.explosion.zones = {{heavy = 1}}
				hurt.tank_mk2.explosion.zones = {{moderate = 1}}
			end
		elseif damage >= 10 then
			if self._health_ratio > 0.3 then
				hurt.tank_mk1.explosion.zones = {{explode = 1}}
				hurt.tank_mk2.explosion.zones = {{light = 1}}
			else
				hurt.tank_mk1.explosion.zones = {{heavy = 1}}
				hurt.tank_mk2.explosion.zones = {{explode = 1}}
			end
		else
			if self._health_ratio > 0.25 then
				hurt.tank_mk1.explosion.zones = {{light = 1}}
			else
				hurt.tank_mk1.explosion.zones = {{explode = 1}}
			end
			hurt.tank_mk2.explosion.zones = {{light = 1}}
		end
		return data(self, attack_data)
	end
	
	local data = CopDamage.damage_bullet
	function CopDamage:damage_bullet(attack_data)
		local damage = attack_data.damage
		if damage >= 100 then
			hurt.tank_mk1.bullet.zones = {{heavy = 1}}
			hurt.tank_mk2.bullet.zones = {{explode = 1}}
		else
			hurt.tank_mk1.bullet.zones = {{light = 1}}
			hurt.tank_mk2.bullet.zones = {{light = 1}}
		end
		return data(self, attack_data)
	end
	
	local data = CopDamage.damage_melee
	function CopDamage:damage_melee(attack_data)
		local damage_effect = attack_data.damage_effect
		
		for _, all_hurts in pairs(hurt) do
			if damage_effect >= 15 then
				all_hurts.melee.zones = {{explode = 1}}
			elseif damage_effect >= 11 then
				all_hurts.melee.zones = {{moderate = 1, heavy = 0.3}}
			elseif damage_effect >= 5 then
				all_hurts.melee.zones = {{light = 1, moderate = 0.3}}
			else
				all_hurts.melee.zones = {{light = 1}}
			end
			
			if damage_effect >= 15 then
				hurt.tank_mk2.melee.zones = {{explode = 1}}
				hurt.tank_mk1.melee.zones = {{moderate = 1}}
				hurt.light_hurt_fire_poison.melee.zones = {{moderate = 1}}
				hurt.only_fire_and_poison_hurts.melee.zones = {{heavy = 1}}
				hurt.unit_mk2.melee.zones = {{moderate = 1}}
			elseif damage_effect >= 13 then
				hurt.only_explosion_hurts.melee.zones = {{explode = 1}}
				hurt.only_fire_and_poison_hurts.melee.zones = {{moderate = 1}}
				hurt.tank_mk1.melee.zones = {{explode = 1}}
			else
				hurt.tank_mk2.melee.zones = {{light = 1}}
				hurt.tank_mk1.melee.zones = {{light = 1}}
				hurt.light_hurt_fire_poison.melee.zones = {{light = 1}}
				hurt.only_fire_and_poison_hurts.melee.zones = {{light = 1}}
				hurt.only_explosion_hurts.melee.zones = {{none = 1}}
				hurt.unit_mk2.melee.zones = {{light = 1}}
			end
			
		end
		
		return data(self, attack_data)
	end
end
if string.lower(RequiredScript) == "lib/units/enemies/cop/actions/upper_body/copactionshoot" then
	local data = CopActionShoot.update
	function CopActionShoot:update(t)
		data(self, t)
		if not self._ext_anim.reload and not self._ext_anim.equip and not self._ext_anim.melee then
			if self._weapon_base:clip_empty() then
				if self._autofiring then
					self._weapon_base:stop_autofire()
					self._ext_movement:play_redirect("up_idle")

					self._autofiring = nil
					self._autoshots_fired = nil
				end

				local res = CopActionReload._play_reload(self)

				if res then
					self._machine:set_speed(res, self._reload_speed)
				end

				if Network:is_server() then
					managers.network:session():send_to_peers("reload_weapon_cop", self._unit)
				end
			end
		end
	end
end
if string.lower(RequiredScript) == "lib/units/enemies/cop/actions/upper_body/copactionhurt" then
	function CopActionHurt:init(action_desc, common_data)
		self._common_data = common_data
		self._ext_movement = common_data.ext_movement
		self._ext_inventory = common_data.ext_inventory
		self._ext_anim = common_data.ext_anim
		self._body_part = action_desc.body_part
		self._unit = common_data.unit
		self._machine = common_data.machine
		self._attention = common_data.attention
		self._action_desc = action_desc
		local t = TimerManager:game():time()
		local tweak_table = self._unit:base()._tweak_table
		local is_civilian = CopDamage.is_civilian(tweak_table)
		local is_female = (self._machine:get_global("female") or 0) == 1
		local crouching = self._unit:anim_data().crouch or self._unit:anim_data().hurt and self._machine:get_parameter(self._machine:segment_state(Idstring("base")), "crh") > 0
		local redir_res = nil
		local action_type = action_desc.hurt_type
		local ignite_character = action_desc.ignite_character
		local start_dot_dance_antimation = action_desc.fire_dot_data and action_desc.fire_dot_data.start_dot_dance_antimation

		if action_type == "knock_down" then
			action_type = "heavy_hurt"
		end

		if action_type == "fatal" then
			redir_res = self._ext_movement:play_redirect("fatal")

			if not redir_res then
				debug_pause("[CopActionHurt:init] fatal redirect failed in", self._machine:segment_state(Idstring("base")))

				return
			end

			managers.hud:set_mugshot_downed(self._unit:unit_data().mugshot_id)
		elseif action_desc.variant == "tase" then
			redir_res = self._ext_movement:play_redirect("tased")

			if not redir_res then
				debug_pause("[CopActionHurt:init] tased redirect failed in", self._machine:segment_state(Idstring("base")))

				return
			end

			managers.hud:set_mugshot_tased(self._unit:unit_data().mugshot_id)
		elseif action_type == "fire_hurt" or action_type == "light_hurt" and action_desc.variant == "fire" then
			local char_tweak = tweak_data.character[self._unit:base()._tweak_table]
			local use_animation_on_fire_damage = nil

			if char_tweak.use_animation_on_fire_damage == nil then
				use_animation_on_fire_damage = true
			else
				use_animation_on_fire_damage = char_tweak.use_animation_on_fire_damage
			end

			if start_dot_dance_antimation then
				if ignite_character == "dragonsbreath" then
					self:_dragons_breath_sparks()
				end

				if self._unit:character_damage() ~= nil and self._unit:character_damage().get_last_time_unit_got_fire_damage ~= nil then
					local last_fire_recieved = self._unit:character_damage():get_last_time_unit_got_fire_damage()

					if last_fire_recieved == nil or t - last_fire_recieved > 1 then
						if use_animation_on_fire_damage then
							redir_res = self._ext_movement:play_redirect("fire_hurt")
							local dir_str = nil
							local fwd_dot = action_desc.direction_vec:dot(common_data.fwd)

							if fwd_dot < 0 then
								local hit_pos = action_desc.hit_pos
								local hit_vec = (hit_pos - common_data.pos):with_z(0):normalized()

								if mvector3.dot(hit_vec, common_data.right) > 0 then
									dir_str = "r"
								else
									dir_str = "l"
								end
							else
								dir_str = "bwd"
							end

							self._machine:set_parameter(redir_res, dir_str, 1)
						end

						self._unit:character_damage():set_last_time_unit_got_fire_damage(t)
					end
				end
			end
		elseif action_type == "taser_tased" then
			local char_tweak = tweak_data.character[self._unit:base()._tweak_table]

			if (char_tweak.can_be_tased == nil or char_tweak.can_be_tased) and self._unit:brain() and self._unit:brain()._current_logic_name ~= "intimidated" then
				redir_res = self._ext_movement:play_redirect("taser")
				local variant = self:_pseudorandom(4)
				local dir_str = nil

				if variant == 1 then
					dir_str = "var1"
				elseif variant == 2 then
					dir_str = "var2"
				elseif variant == 3 then
					dir_str = "var3"
				elseif variant == 4 then
					dir_str = "var4"
				else
					dir_str = "fwd"
				end

				self._machine:set_parameter(redir_res, dir_str, 1)
			end
		elseif action_type == "light_hurt" then
			if not self._ext_anim.upper_body_active or self._ext_anim.upper_body_empty or self._ext_anim.recoil then
				redir_res = self._ext_movement:play_redirect(action_type)

				if not redir_res then
					debug_pause("[CopActionHurt:init] light_hurt redirect failed in", self._machine:segment_state(Idstring("upper_body")))

					return
				end

				local dir_str = nil
				local fwd_dot = action_desc.direction_vec:dot(common_data.fwd)

				if fwd_dot < 0 then
					local hit_pos = action_desc.hit_pos
					local hit_vec = (hit_pos - common_data.pos):with_z(0):normalized()

					if mvector3.dot(hit_vec, common_data.right) > 0 then
						dir_str = "r"
					else
						dir_str = "l"
					end
				else
					dir_str = "bwd"
				end

				self._machine:set_parameter(redir_res, dir_str, 1)

				local height_str = self._ext_movement:m_com().z < action_desc.hit_pos.z and "high" or "low"

				self._machine:set_parameter(redir_res, height_str, 1)
			end

			self._expired = true

			return true
		elseif action_type == "concussion" then
			redir_res = self._ext_movement:play_redirect("concussion_stun")
			local rnd_max = 9
			local rnd_anim = self:_pseudorandom(rnd_max)
			local rnd_anim_str = "var" .. tostring(rnd_anim)

			self._machine:set_parameter(redir_res, rnd_anim_str, 1)

			self._sick_time = t + 3
		elseif action_type == "hurt_sick" then
			local ecm_hurts_table = self._common_data.char_tweak.ecm_hurts

			if not ecm_hurts_table then
				debug_pause_unit(self._unit, "[CopActionHurt:init] Unit missing ecm_hurts in Character Tweak Data", self._unit)

				return
			end

			redir_res = self._ext_movement:play_redirect("hurt_sick")

			if not redir_res then
				debug_pause("[CopActionHurt:init] hurt_sick redirect failed in", self._machine:segment_state(Idstring("base")))

				return
			end

			local is_cop = true

			if is_civilian then
				is_cop = false
			end

			local sick_variants = {}

			for i, d in pairs(ecm_hurts_table) do
				table.insert(sick_variants, i)
			end

			local variant = sick_variants[self:_pseudorandom(#sick_variants)]
			local duration_diff = ecm_hurts_table[variant].max_duration - ecm_hurts_table[variant].min_duration
			local duration = ecm_hurts_table[variant].min_duration + duration_diff * self:_pseudorandom()

			for _, hurt_sick in ipairs(sick_variants) do
				self._machine:set_global(hurt_sick, hurt_sick == variant and 1 or 0)
			end

			self._sick_time = t + duration
		elseif action_type == "poison_hurt" then
			redir_res = self._ext_movement:play_redirect("hurt_poison")

			if not redir_res then
				debug_pause("[CopActionHurt:init] hurt_sick redirect failed in", self._machine:segment_state(Idstring("base")))

				return
			end

			self._sick_time = t + 2
		elseif action_type == "bleedout" then
			redir_res = self._ext_movement:play_redirect("bleedout")

			if not redir_res then
				debug_pause("[CopActionHurt:init] bleedout redirect failed in", self._machine:segment_state(Idstring("base")))

				return
			end
		elseif action_type == "death" and action_desc.variant == "fire" then
			local variant = 1
			local variant_count = #CopActionHurt.fire_death_anim_variants_length or 5

			if variant_count > 1 then
				variant = self:_pseudorandom(variant_count)
			end

			if not self._ext_movement:died_on_rope() then
				redir_res = self._ext_movement:play_redirect("death_fire")

				if not redir_res then
					debug_pause("[CopActionHurt:init] death_fire redirect failed in", self._machine:segment_state(Idstring("base")))

					return
				end

				for i = 1, variant_count, 1 do
					local state_value = 0

					if i == variant then
						state_value = 1
					end

					self._machine:set_parameter(redir_res, "var" .. tostring(i), state_value)
				end
			else
				self:force_ragdoll()
			end

			self:_start_enemy_fire_effect_on_death(variant)
			managers.fire:check_achievemnts(self._unit, t)
		elseif action_type == "death" and action_desc.variant == "poison" then
			self:force_ragdoll()
		elseif action_type == "death" and (self._ext_anim.run and self._ext_anim.move_fwd or self._ext_anim.sprint) and not common_data.char_tweak.no_run_death_anim then
			redir_res = self._ext_movement:play_redirect("death_run")

			if not redir_res then
				debug_pause("[CopActionHurt:init] death_run redirect failed in", self._machine:segment_state(Idstring("base")))

				return
			end

			local variant = self.running_death_anim_variants[is_female and "female" or "male"] or 1

			if variant > 1 then
				variant = self:_pseudorandom(variant)
			end

			self._machine:set_parameter(redir_res, "var" .. tostring(variant), 1)
		elseif action_type == "death" and (self._ext_anim.run or self._ext_anim.ragdoll) and self:_start_ragdoll() then
			self.update = self._upd_ragdolled
		elseif action_type == "heavy_hurt" and (self._ext_anim.run or self._ext_anim.sprint) and not common_data.is_suppressed and not crouching then
			redir_res = self._ext_movement:play_redirect("heavy_run")

			if not redir_res then
				debug_pause("[CopActionHurt:init] heavy_run redirect failed in", self._machine:segment_state(Idstring("base")))

				return
			end

			local variant = self.running_hurt_anim_variants.fwd or 1

			if variant > 1 then
				variant = self:_pseudorandom(variant)
			end

			self._machine:set_parameter(redir_res, "var" .. tostring(variant), 1)
		else
			local variant, height, old_variant, old_info = nil

			if (action_type == "hurt" or action_type == "heavy_hurt") and self._ext_anim.hurt then
				for i = 1, self.hurt_anim_variants_highest_num, 1 do
					if self._machine:get_parameter(self._machine:segment_state(Idstring("base")), "var" .. i) then
						old_variant = i

						break
					end
				end

				if old_variant ~= nil then
					old_info = {
						fwd = self._machine:get_parameter(self._machine:segment_state(Idstring("base")), "fwd"),
						bwd = self._machine:get_parameter(self._machine:segment_state(Idstring("base")), "bwd"),
						l = self._machine:get_parameter(self._machine:segment_state(Idstring("base")), "l"),
						r = self._machine:get_parameter(self._machine:segment_state(Idstring("base")), "r"),
						high = self._machine:get_parameter(self._machine:segment_state(Idstring("base")), "high"),
						low = self._machine:get_parameter(self._machine:segment_state(Idstring("base")), "low"),
						crh = self._machine:get_parameter(self._machine:segment_state(Idstring("base")), "crh"),
						mod = self._machine:get_parameter(self._machine:segment_state(Idstring("base")), "mod"),
						hvy = self._machine:get_parameter(self._machine:segment_state(Idstring("base")), "hvy")
					}
				end
			end

			local redirect = action_type

			if action_type == "shield_knock" then
				local rand = self:_pseudorandom(CopActionHurt.shield_knock_variants, 0)
				redirect = "shield_knock_var" .. tostring(rand)
			end

			if redirect then
				redir_res = self._ext_movement:play_redirect(redirect)
			else
				Application:stack_dump_error("There's no redirect in CopActionHurt!")
			end

			if not redir_res then
				debug_pause_unit(self._unit, "[CopActionHurt:init]", redirect, "redirect failed in", self._machine:segment_state(Idstring("base")), self._unit)

				return
			end

			if action_desc.variant ~= "bleeding" then
				local nr_variants = self._ext_anim.base_nr_variants
				local death_type = nil

				if nr_variants then
					variant = self:_pseudorandom(nr_variants)
				else
					local fwd_dot = action_desc.direction_vec:dot(common_data.fwd)
					local right_dot = action_desc.direction_vec:dot(common_data.right)
					local dir_str = nil

					if math.abs(right_dot) < math.abs(fwd_dot) then
						if fwd_dot < 0 then
							dir_str = "fwd"
						else
							dir_str = "bwd"
						end
					elseif right_dot > 0 then
						dir_str = "l"
					else
						dir_str = "r"
					end

					self._machine:set_parameter(redir_res, dir_str, 1)

					local hit_z = action_desc.hit_pos.z
					height = self._ext_movement:m_com().z < hit_z and "high" or "low"

					if action_type == "death" then
						if is_civilian then
							death_type = "normal"
						else
							death_type = action_desc.death_type
						end

						if is_female then
							variant = self.death_anim_fe_variants[death_type][crouching and "crouching" or "not_crouching"][dir_str][height]
						else
							variant = self.death_anim_variants[death_type][crouching and "crouching" or "not_crouching"][dir_str][height]
						end

						if variant > 1 then
							variant = self:_pseudorandom(variant)
						end
					elseif action_type ~= "shield_knock" and action_type ~= "counter_tased" and action_type ~= "taser_tased" then
						if old_variant and (old_info[dir_str] == 1 and old_info[height] == 1 and old_info.mod == 1 and action_type == "hurt" or old_info.hvy == 1 and action_type == "heavy_hurt") then
							variant = old_variant
						end

						if not variant then
							if action_type == "expl_hurt" then
								variant = self.hurt_anim_variants[action_type][dir_str]
							else
								variant = self.hurt_anim_variants[action_type].not_crouching[dir_str][height]
							end

							if variant > 1 then
								variant = self:_pseudorandom(variant)
							end
						end
					elseif action_type == "shield_knock" then
						-- Nothing
					end
				end

				variant = variant or 1

				if variant then
					self._machine:set_parameter(redir_res, "var" .. tostring(variant), 1)
				end

				if height then
					self._machine:set_parameter(redir_res, height, 1)
				end

				if crouching then
					self._machine:set_parameter(redir_res, "crh", 1)
				end

				if action_type == "hurt" then
					self._machine:set_parameter(redir_res, "mod", 1)
				elseif action_type == "heavy_hurt" then
					self._machine:set_parameter(redir_res, "hvy", 1)
				elseif action_type == "death" and (death_type or action_desc.death_type) == "heavy" and not is_civilian then
					self._machine:set_parameter(redir_res, "heavy", 1)
				elseif action_type == "expl_hurt" then
					self._machine:set_parameter(redir_res, "expl", 1)
				end
			end
		end

		if self._ext_anim.upper_body_active and not self._ragdolled then
			self._ext_movement:play_redirect("up_idle")
		end

		self._last_vel_z = 0
		self._hurt_type = action_type
		self._variant = action_desc.variant
		self._body_part = action_desc.body_part

		if action_type == "bleedout" then
			self.update = self._upd_bleedout
			self._shoot_t = t + 1

			if Network:is_server() then
				self._ext_inventory:equip_selection(1, true)
			end

			local weapon_unit = self._ext_inventory:equipped_unit()
			self._weapon_base = weapon_unit:base()
			local weap_tweak = weapon_unit:base():weapon_tweak_data()
			local weapon_usage_tweak = common_data.char_tweak.weapon[weap_tweak.usage]
			self._weapon_unit = weapon_unit
			self._weap_tweak = weap_tweak
			self._w_usage_tweak = weapon_usage_tweak
			self._reload_speed = weapon_usage_tweak.RELOAD_SPEED
			self._spread = weapon_usage_tweak.spread
			self._falloff = weapon_usage_tweak.FALLOFF
			self._head_modifier_name = Idstring("look_head")
			self._arm_modifier_name = Idstring("aim_r_arm")
			self._head_modifier = self._machine:get_modifier(self._head_modifier_name)
			self._arm_modifier = self._machine:get_modifier(self._arm_modifier_name)
			self._aim_vec = mvector3.copy(common_data.fwd)
			self._anim = redir_res

			if not self._shoot_history then
				self._shoot_history = {
					focus_error_roll = self:_pseudorandom(360),
					focus_start_t = t,
					focus_delay = weapon_usage_tweak.focus_delay,
					m_last_pos = common_data.pos + common_data.fwd * 500
				}
			end
		elseif action_type == "hurt_sick" or action_type == "poison_hurt" or action_type == "concussion" then
			self.update = self._upd_sick
		elseif action_desc.variant == "tase" then
			-- Nothing
		elseif self._ragdolled then
			-- Nothing
		elseif self._unit:anim_data().skip_force_to_graph then
			self.update = self._upd_empty
		else
			self.update = self._upd_hurt
		end

		local shoot_chance = nil

		if self._ext_inventory and not self._weapon_dropped and common_data.char_tweak.shooting_death and not self._ext_movement:cool() and t - self._ext_movement:not_cool_t() > 3 then
			local weapon_unit = self._ext_inventory:equipped_unit()

			if weapon_unit then
				if action_type == "counter_tased" or action_type == "taser_tased" then
					weapon_unit:base():on_reload()

					shoot_chance = 1
				elseif action_type == "death" or action_type == "hurt" or action_type == "heavy_hurt" then
					shoot_chance = 0.1
				end
			end
		end

		if shoot_chance then
			local equipped_weapon = self._ext_inventory:equipped_unit()
			local rand = self:_pseudorandom()

			if equipped_weapon and (not equipped_weapon:base().clip_empty or not equipped_weapon:base():clip_empty()) and rand <= shoot_chance then
				self._weapon_unit = equipped_weapon

				self._unit:movement():set_friendly_fire(true)

				self._friendly_fire = true

				if equipped_weapon:base():weapon_tweak_data().auto then
					equipped_weapon:base():start_autofire()

					self._shooting_hurt = true
				else
					self._delayed_shooting_hurt_clbk_id = "shooting_hurt" .. tostring(self._unit:key())

					managers.enemy:add_delayed_clbk(self._delayed_shooting_hurt_clbk_id, callback(self, self, "clbk_shooting_hurt"), TimerManager:game():time() + math.lerp(0.2, 0.4, self:_pseudorandom()))
				end
			end
		end

		if not self._unit:base().nick_name then
			if action_desc.variant == "fire" then
				if tweak_table ~= "tank" and tweak_table ~= "tank_hw" and tweak_table ~= "shield" then
					if action_desc.hurt_type == "fire_hurt" and tweak_table ~= "spooc" then
						self._unit:sound():say("burnhurt")
					elseif action_desc.hurt_type == "death" then
						self._unit:sound():say("burndeath")
					end
				end	
					elseif action_type == "death" then
						self._unit:sound():say("x02a_any_3p", true)								
					elseif action_type == "counter_tased" or action_type == "taser_tased" then
						if self._unit:base():has_tag("taser") then
							self._unit:sound():say("tasered", true)		
						else
							self._unit:sound():say("x01a_any_3p", true) --so that other tased enemies actually react in pain to being tased
						end
					elseif action_type == "hurt_sick" then
						local common_cop = self._unit:base():has_tag("law") and not self._unit:base():has_tag("special")
				  
						if common_cop or self._unit:base():has_tag("shield") then
							self._unit:sound():say("ch3", true) --make cops scream in pain when affected ECM feedback
						elseif self._unit:base():has_tag("medic")then
							self._unit:sound():say("burndeath", true) --same for the medic with a similar sound, since they lack one
						elseif self._unit:base():has_tag("taser") then
							self._unit:sound():say("tasered", true) --same as his tased lines felt they fit best		
						end
					else
						self._unit:sound():say("x01a_any_3p", true)
					end

			if (tweak_table == "tank" or tweak_table == "tank_hw") and action_type == "death" then
				local unit_id = self._unit:id()

				managers.fire:remove_dead_dozer_from_overgrill(unit_id)
			end

			if Network:is_server() then
				local radius, filter_name = nil
				local default_radius = managers.groupai:state():whisper_mode() and tweak_data.upgrades.cop_hurt_alert_radius_whisper or tweak_data.upgrades.cop_hurt_alert_radius

				if action_desc.attacker_unit and alive(action_desc.attacker_unit) and action_desc.attacker_unit:base().upgrade_value then
					radius = action_desc.attacker_unit:base():upgrade_value("player", "silent_kill") or default_radius
				elseif action_desc.attacker_unit and alive(action_desc.attacker_unit) and action_desc.attacker_unit:base().is_local_player then
					radius = managers.player:upgrade_value("player", "silent_kill", default_radius)
				end

				local new_alert = {
					"vo_distress",
					common_data.ext_movement:m_head_pos(),
					radius or default_radius,
					self._unit:brain():SO_access(),
					self._unit
				}

				managers.groupai:state():propagate_alert(new_alert)
			end
		end

		if action_type == "death" or action_type == "bleedout" or action_desc.variant == "tased" or action_type == "fatal" then
			self._floor_normal = self:_get_floor_normal(common_data.pos, common_data.fwd, common_data.right)
		end

		CopActionAct._create_blocks_table(self, action_desc.blocks)
		self._ext_movement:enable_update()

		if (self._body_part == 1 or self._body_part == 2) and Network:is_server() then
			local stand_rsrv = self._unit:brain():get_pos_rsrv("stand")

			if not stand_rsrv or mvector3.distance_sq(stand_rsrv.position, common_data.pos) > 400 then
				self._unit:brain():add_pos_rsrv("stand", {
					radius = 30,
					position = mvector3.copy(common_data.pos)
				})
			end
		end

		if self:is_network_allowed(action_desc) then
			local params = {
				CopActionHurt.hurt_type_to_idx(action_desc.hurt_type),
				action_desc.body_part,
				CopActionHurt.death_type_to_idx(action_desc.death_type),
				CopActionHurt.type_to_idx(action_desc.type),
				CopActionHurt.variant_to_idx(action_desc.variant),
				action_desc.direction_vec or Vector3(),
				action_desc.hit_pos or Vector3()
			}

			self._common_data.ext_network:send("action_hurt_start", unpack(params))
		end

		return true
	end
end
if string.lower(RequiredScript) == "lib/units/enemies/cop/copsound" then
	function CopSound:init(unit)
		self._unit = unit
		self._speak_expire_t = 0
		local char_tweak = tweak_data.character[unit:base()._tweak_table]

		self:set_voice_prefix(nil)

		local nr_variations = char_tweak.speech_prefix_count
								
		if char_tweak.speech_prefix_p1 == "l5d" then
			self._prefix = (char_tweak.speech_prefix_p1 or "") .. "_"
		elseif	self._unit:name() == Idstring("units/payday2/characters/ene_shield_1/ene_shield_1") or
				self._unit:name() == Idstring("units/payday2/characters/ene_shield_1/ene_shield_1_husk") or
				self._unit:name() == Idstring("units/payday2/characters/ene_shield_2/ene_shield_2") or
				self._unit:name() == Idstring("units/payday2/characters/ene_shield_2/ene_shield_2_husk") then
				
			self._prefix = ("l5d") .. "_"
			
		elseif	self._unit:name() == Idstring("units/payday2/characters/ene_swat_1/ene_swat_1") or
				self._unit:name() == Idstring("units/payday2/characters/ene_swat_1/ene_swat_1_husk") or
				self._unit:name() == Idstring("units/payday2/characters/ene_swat_2/ene_swat_2") or
				self._unit:name() == Idstring("units/payday2/characters/ene_swat_2/ene_swat_2_husk") or
				self._unit:name() == Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1") or
				self._unit:name() == Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1_husk") or
				self._unit:name() == Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870") or
				self._unit:name() == Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870_husk") or
				self._unit:name() == Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1") or
				self._unit:name() == Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1_husk") or
				self._unit:name() == Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2") or
				self._unit:name() == Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2_husk") or
				self._unit:name() == Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1") or
				self._unit:name() == Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1_husk") or
				self._unit:name() == Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870") or
				self._unit:name() == Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870_husk") or
				self._unit:name() == Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1") or
				self._unit:name() == Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1_husk") or
				self._unit:name() == Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2") or
				self._unit:name() == Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2_husk") or
				self._unit:name() == Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3") or
				self._unit:name() == Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3_husk") or
				self._unit:name() == Idstring("units/payday2/characters/ene_city_heavy_m4/ene_city_heavy_m4") or
				self._unit:name() == Idstring("units/payday2/characters/ene_city_heavy_m4/ene_city_heavy_m4_husk") or
				self._unit:name() == Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36") or
				self._unit:name() == Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36_husk") or
				self._unit:name() == Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870") or
				self._unit:name() == Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870_husk") or
				self._unit:name() == Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy") or
				self._unit:name() == Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy_husk") or
				self._unit:name() == Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_fbi/ene_murkywater_heavy_fbi") or
				self._unit:name() == Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_fbi/ene_murkywater_heavy_fbi_husk") or
				self._unit:name() == Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36") or
				self._unit:name() == Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36_husk") or
				self._unit:name() == Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun") or
				self._unit:name() == Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun_husk") or
				self._unit:name() == Idstring("units/pd2_dlc_berry/characters/ene_murkywater_no_light/ene_murkywater_no_light") or
				self._unit:name() == Idstring("units/pd2_dlc_berry/characters/ene_murkywater_no_light/ene_murkywater_no_light_husk") or
				self._unit:name() == Idstring("units/payday2/characters/ene_murkywater_1/ene_murkywater_1") or
				self._unit:name() == Idstring("units/payday2/characters/ene_murkywater_1/ene_murkywater_1_husk") or
				self._unit:name() == Idstring("units/payday2/characters/ene_murkywater_2/ene_murkywater_2") or
				self._unit:name() == Idstring("units/payday2/characters/ene_murkywater_2/ene_murkywater_2_husk") then
				
			self._prefix = ("l") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. ("d") .. "_"
			
		else
			self._prefix = (char_tweak.speech_prefix_p1 or "") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. (char_tweak.speech_prefix_p2 or "") .. "_"
		end

		unit:base():post_init()
	end
end
if string.lower(RequiredScript) == "lib/units/enemies/cop/copbrain" then
	local reload
	if CopBrain._reload_clbks then
		reload = true
	else
		CopBrain._reload_clbks = {}
	end
	
	function CopBrain:on_suppressed(state)
		self._logic_data.is_suppressed = state or nil

		if self._current_logic.on_suppressed_state then
			self._current_logic.on_suppressed_state(self._logic_data)

			if self._logic_data.char_tweak.chatter.suppress then 
				if managers.groupai:state():chk_assault_active_atm()then
				local roll = math.rand(1, 100)
				local chance_heeeeelpp = 50
					if roll <= chance_heeeeelpp then
						self._unit:sound():say("hlp", true) 
						--log(" assault panic works")
					else --hopefully some variety here now
						self._unit:sound():say("lk3a", true) 
						--log(" assault panic works")
					end	
				else		
				   self._unit:sound():say("lk3b", true) --calmer lines for when the assault is off
				   --log("between assault panic works")
				end
			end
		end
	end	
end
if string.lower(RequiredScript) == "lib/units/enemies/cop/logics/coplogicbase" then
	function CopLogicBase._set_attention_obj(data, new_att_obj, new_reaction)
		local old_att_obj = data.attention_obj
		data.attention_obj = new_att_obj

		if new_att_obj then
			new_reaction = new_reaction or new_att_obj.settings.reaction
			new_att_obj.reaction = new_reaction
			local new_crim_rec = new_att_obj.criminal_record
			local is_same_obj, contact_chatter_time_ok = nil

			if old_att_obj then
				if old_att_obj.u_key == new_att_obj.u_key then
					is_same_obj = true
					contact_chatter_time_ok = new_crim_rec and data.t - new_crim_rec.det_t > 2

					if new_att_obj.stare_expire_t and new_att_obj.stare_expire_t < data.t then
						if new_att_obj.settings.pause then
							new_att_obj.stare_expire_t = nil
							new_att_obj.pause_expire_t = data.t + math.lerp(new_att_obj.settings.pause[1], new_att_obj.settings.pause[2], math.random())
						end
					elseif new_att_obj.pause_expire_t and new_att_obj.pause_expire_t < data.t then
						if not new_att_obj.settings.attract_chance or math.random() < new_att_obj.settings.attract_chance then
							new_att_obj.pause_expire_t = nil
							new_att_obj.stare_expire_t = data.t + math.lerp(new_att_obj.settings.duration[1], new_att_obj.settings.duration[2], math.random())
						else
							debug_pause_unit(data.unit, "skipping attraction")

							new_att_obj.pause_expire_t = data.t + math.lerp(new_att_obj.settings.pause[1], new_att_obj.settings.pause[2], math.random())
						end
					end
				else
					if old_att_obj.criminal_record then
						managers.groupai:state():on_enemy_disengaging(data.unit, old_att_obj.u_key)
					end

					if new_crim_rec then
						managers.groupai:state():on_enemy_engaging(data.unit, new_att_obj.u_key)
					end

					contact_chatter_time_ok = new_crim_rec and data.t - new_crim_rec.det_t > 15
				end
			else
				if new_crim_rec then
					managers.groupai:state():on_enemy_engaging(data.unit, new_att_obj.u_key)
				end

				contact_chatter_time_ok = new_crim_rec and data.t - new_crim_rec.det_t > 15
			end

			if not is_same_obj then
				if new_att_obj.settings.duration then
					new_att_obj.stare_expire_t = data.t + math.lerp(new_att_obj.settings.duration[1], new_att_obj.settings.duration[2], math.random())
					new_att_obj.pause_expire_t = nil
				end

				new_att_obj.acquire_t = data.t
			end

			if AIAttentionObject.REACT_SHOOT <= new_reaction and new_att_obj.verified and contact_chatter_time_ok and (data.unit:anim_data().idle or data.unit:anim_data().move) and new_att_obj.is_person and data.char_tweak.chatter.contact then	
					if data.unit:base()._tweak_table == "gensec" then
						data.unit:sound():say("a01", true)			
					elseif data.unit:base()._tweak_table == "security" then
						data.unit:sound():say("a01", true)								
					else
						data.unit:sound():say("c01", true)
					end
			end
		elseif old_att_obj and old_att_obj.criminal_record then
			managers.groupai:state():on_enemy_disengaging(data.unit, old_att_obj.u_key)
		end
	end
end
if string.lower(RequiredScript) == "lib/units/enemies/cop/logics/coplogicidle" then
	function CopLogicIdle._chk_relocate(data)
		if data.objective and data.objective.type == "follow" then
			if data.is_converted then
				if TeamAILogicIdle._check_should_relocate(data, data.internal_data, data.objective) then
					data.objective.in_place = nil

					data.logic._exit(data.unit, "travel")

					return true
				end

				return
			end

			if data.is_tied and data.objective.lose_track_dis and data.objective.lose_track_dis * data.objective.lose_track_dis < mvector3.distance_sq(data.m_pos, data.objective.follow_unit:movement():m_pos()) then
				data.brain:set_objective(nil)

				return true
			end

			local relocate = nil
			local follow_unit = data.objective.follow_unit
			local advance_pos = follow_unit:brain() and follow_unit:brain():is_advancing()
			local follow_unit_pos = advance_pos or follow_unit:movement():m_pos()

			if data.objective.relocated_to and mvector3.equal(data.objective.relocated_to, follow_unit_pos) then
				return
			end

			if data.objective.distance and data.objective.distance < mvector3.distance(data.m_pos, follow_unit_pos) then
				relocate = true
			end

			if not relocate then
				local ray_params = {
					tracker_from = data.unit:movement():nav_tracker(),
					pos_to = follow_unit_pos
				}
				local ray_res = managers.navigation:raycast(ray_params)

				if ray_res then
					relocate = true
				end
			end

			if relocate then
				data.objective.in_place = nil
				data.objective.nav_seg = follow_unit:movement():nav_tracker():nav_segment()
				data.objective.relocated_to = mvector3.copy(follow_unit_pos)

				data.logic._exit(data.unit, "travel")

				return true
			end
		end
	end
end
if string.lower(RequiredScript) == "lib/units/enemies/cop/logics/coplogictravel" then
	function CopLogicTravel.action_complete_clbk(data, action)
		local my_data = data.internal_data
		local action_type = action:type()

		if action_type == "walk" then
			if action:expired() and not my_data.starting_advance_action and my_data.coarse_path_index and not my_data.has_old_action and my_data.advancing then
				my_data.coarse_path_index = my_data.coarse_path_index + 1

				if my_data.coarse_path_index > #my_data.coarse_path then
					debug_pause_unit(data.unit, "[CopLogicTravel.action_complete_clbk] invalid coarse path index increment", data.unit, inspect(my_data.coarse_path), my_data.coarse_path_index)

					my_data.coarse_path_index = my_data.coarse_path_index - 1
				end
			end

			my_data.advancing = nil

			if my_data.moving_to_cover then
				if action:expired() then
					if my_data.best_cover then
						managers.navigation:release_cover(my_data.best_cover[1])
					end

					my_data.best_cover = my_data.moving_to_cover

					CopLogicBase.chk_cancel_delayed_clbk(my_data, my_data.cover_update_task_key)

					local high_ray = CopLogicTravel._chk_cover_height(data, my_data.best_cover[1], data.visibility_slotmask)
					my_data.best_cover[4] = high_ray
					my_data.in_cover = true
					local cover_wait_time = my_data.coarse_path_index == #my_data.coarse_path - 1 and 0.3 or 0.6 + 0.4 * math.random()

					if not CopLogicTravel._chk_close_to_criminal(data, my_data) then
						cover_wait_time = 0
					end

					my_data.cover_leave_t = data.t + cover_wait_time
				else
					managers.navigation:release_cover(my_data.moving_to_cover[1])

					if my_data.best_cover then
						local dis = mvector3.distance(my_data.best_cover[1][1], data.unit:movement():m_pos())

						if dis > 100 then
							managers.navigation:release_cover(my_data.best_cover[1])

							my_data.best_cover = nil
						end
					end
				end

				my_data.moving_to_cover = nil
			elseif my_data.best_cover then
				local dis = mvector3.distance(my_data.best_cover[1][1], data.unit:movement():m_pos())

				if dis > 100 then
					managers.navigation:release_cover(my_data.best_cover[1])

					my_data.best_cover = nil
				end
			end

			if not action:expired() then
				if my_data.processing_advance_path then
					local pathing_results = data.pathing_results

					if pathing_results and pathing_results[my_data.advance_path_search_id] then
						data.pathing_results[my_data.advance_path_search_id] = nil
						my_data.processing_advance_path = nil
					end
				elseif my_data.advance_path then
					my_data.advance_path = nil
				end

				data.unit:brain():abort_detailed_pathing(my_data.advance_path_search_id)
			end
		elseif action_type == "turn" then
			data.internal_data.turning = nil
		elseif action_type == "shoot" then
			data.internal_data.shooting = nil
		elseif action_type == "dodge" then
			local objective = data.objective
			local allow_trans, obj_failed = CopLogicBase.is_obstructed(data, objective, nil, nil)

			if allow_trans then
				local wanted_state = data.logic._get_logic_state_from_reaction(data)

				if wanted_state and wanted_state ~= data.name and obj_failed then
					if data.unit:in_slot(managers.slot:get_mask("enemies")) or data.unit:in_slot(17) then
						data.objective_failed_clbk(data.unit, data.objective)
					elseif data.unit:in_slot(managers.slot:get_mask("criminals")) then
						managers.groupai:state():on_criminal_objective_failed(data.unit, data.objective, false)
					end

					if my_data == data.internal_data then
						debug_pause_unit(data.unit, "[CopLogicTravel.action_complete_clbk] exiting without discarding objective", data.unit, inspect(data.objective))
						CopLogicBase._exit(data.unit, wanted_state)
					end
				end
			end
		end
	end

	function CopLogicTravel.chk_group_ready_to_move(data, my_data)
		local my_objective = data.objective

		if not my_objective.grp_objective then
			return true
		end

		if not CopLogicTravel._chk_close_to_criminal(data, my_data) then
			return true
		end

		local my_dis = mvector3.distance_sq(my_objective.area.pos, data.m_pos)

		if my_dis > 4000000 then
			return true
		end

		my_dis = my_dis * 1.15 * 1.15

		for u_key, u_data in pairs(data.group.units) do
			if u_key ~= data.key then
				local his_objective = u_data.unit:brain():objective()

				if his_objective and his_objective.grp_objective == my_objective.grp_objective and not his_objective.in_place then
					local his_dis = mvector3.distance_sq(his_objective.area.pos, u_data.m_pos)

					if my_dis < his_dis then
						return false
					end
				end
			end
		end

		return true
	end

	function CopLogicTravel._update_cover(ignore_this, data)
		local my_data = data.internal_data

		CopLogicBase.on_delayed_clbk(my_data, my_data.cover_update_task_key)

		local cover_release_dis = 100
		local nearest_cover = my_data.nearest_cover
		local best_cover = my_data.best_cover
		local m_pos = data.m_pos

		if not my_data.in_cover and nearest_cover and cover_release_dis < mvector3.distance(nearest_cover[1][1], m_pos) then
			managers.navigation:release_cover(nearest_cover[1])

			my_data.nearest_cover = nil
			nearest_cover = nil
		end

		if best_cover and cover_release_dis < mvector3.distance(best_cover[1][1], m_pos) then
			managers.navigation:release_cover(best_cover[1])

			my_data.best_cover = nil
			best_cover = nil
		end

		if nearest_cover or best_cover then
			CopLogicBase.add_delayed_clbk(my_data, my_data.cover_update_task_key, callback(CopLogicTravel, CopLogicTravel, "_update_cover", data), data.t + 1)
		end
	end

	function CopLogicTravel.queued_update(data)
		local my_data = data.internal_data
		data.t = TimerManager:game():time()
		my_data.close_to_criminal = nil
		local delay = CopLogicTravel._upd_enemy_detection(data)
	   
		if data.internal_data ~= my_data then
			return
		end
	   
		CopLogicTravel.upd_advance(data)
	   
		if data.internal_data ~= my_data then
			return
		end
	   
		if not delay then
			debug_pause_unit(data.unit, "crap!!!", inspect(data))
	   
			delay = 1
		end
			
		if my_data.coarse_path then
			if data.char_tweak.chatter.clear and data.unit:anim_data().idle and not ( data.attention_obj and data.attention_obj.reaction >= AIAttentionObject.REACT_COMBAT and data.attention_obj.verified_t and data.attention_obj.verified_t < 5 ) then
				if data.unit:movement():cool() then
				 local roll = math.rand(1, 100)
			  local chance_report = 50
				if roll <= chance_report then
							managers.groupai:state():chk_say_enemy_chatter( data.unit, data.m_pos, "clear_whisper" )
			else	
							managers.groupai:state():chk_say_enemy_chatter( data.unit, data.m_pos, "clear_whisper_2" )
			end	
				else
					local clearchk = math.random(1, 100)
					local say_clear = 50
					if clearchk <= say_clear then
						managers.groupai:state():chk_say_enemy_chatter( data.unit, data.m_pos, "clear" )
					else
						if not managers.groupai:state():chk_assault_active_atm() and managers.groupai:state():not_assault_0_check() then
							managers.groupai:state():chk_say_enemy_chatter( data.unit, data.m_pos, "retreat" )
						end
					end
				end
			end
		end	
		  
		CopLogicTravel.queue_update(data, data.internal_data, delay)
	end	

	function CopLogicTravel._try_anounce(data, my_data)
		local my_pos = data.m_pos
		local max_dis_sq = 500000
		local my_key = data.key
		local announce_type = data.char_tweak.announce_incomming
		
		for u_key, u_data in pairs(managers.enemy:all_enemies()) do
			if u_key ~= my_key and tweak_data.character[u_data.unit:base()._tweak_table].chatter[announce_type] and mvector3.distance_sq(my_pos, u_data.m_pos) < max_dis_sq and not u_data.unit:sound():speaking(data.t) and (u_data.unit:anim_data().idle or u_data.unit:anim_data().move) then
				managers.groupai:state():chk_say_enemy_chatter(u_data.unit, u_data.m_pos, announce_type)
				--log("announced arrival")
		
				my_data.announce_t = data.t + 15
		
				break
			end
		end
	end
end
if string.lower(RequiredScript) == "lib/units/weapons/grenades/quickflashgrenade" then

	function QuickFlashGrenade:init(unit)
		self._unit = unit
		self._state = 0
		self._armed = false

		for i, state in ipairs(QuickFlashGrenade.States) do
			if state[2] == nil then
				QuickFlashGrenade.States[i][2] = managers.job:is_current_job_professional() and 0 or tweak_data.group_ai.flash_grenade.timer
			end
		end

		if Network:is_client() then
			self:activate(self._unit:position(), tweak_data.group_ai.flash_grenade_lifetime)
		end
	end

	function QuickFlashGrenade:_beep()
	end
end
if string.lower(RequiredScript) == "lib/managers/mission/elementspawnenemygroup" then
	-- Fix for custom cop spawn groups by Iamgoofball
	-- Updated version of the fix from SC's Overhaul in Restoration mod
	groupsOLD = {
		"tac_shield_wall_charge",
		"FBI_spoocs",
		"tac_tazer_charge",
		"tac_tazer_flanking",
		"tac_shield_wall",
		"tac_swat_rifle_flank",
		"tac_shield_wall_ranged",
		"tac_bull_rush"
	}

	local job = Global.level_data and Global.level_data.level_id    

	local old_finalize_values = ElementSpawnEnemyGroup._finalize_values
	function ElementSpawnEnemyGroup:_finalize_values()
		old_finalize_values(self)
				
		local groups = self._values.preferred_spawn_groups
		-- If we have an ordinary spawn with exactly the old group elements, add all defined groups.
		if groups and #groups == #groupsOLD and table.contains_all(groups, groupsOLD) then
			for name,_ in pairs(tweak_data.group_ai.enemy_spawn_groups) do
				if not table.contains(groups, name) then
					table.insert(groups, name)
				end
			end
		end
	end
end
if string.lower(RequiredScript) == "lib/managers/group_ai_states/groupaistatebesiege" then
	function GroupAIStateBesiege:not_assault_0_check()
		if self._assault_number and self._assault_number <= 0 then
			return
		end
		
		return true
	end
		
	function GroupAIStateBesiege:chk_assault_active_atm()
		local assault_task = self._task_data.assault
		
		if assault_task and assault_task.phase == "build" or assault_task and assault_task.phase == "sustain" then
			return true
		end
		
		return
	end
		
	function GroupAIStateBesiege:_voice_groupentry(group)
		local group_leader_u_key, group_leader_u_data = self._determine_group_leader(group.units)
		if group_leader_u_data and group_leader_u_data.tactics and group_leader_u_data.char_tweak.chatter.entry then
			for i_tactic, tactic_name in ipairs(group_leader_u_data.tactics) do
				local randomgroupcallout = math.random(1, 100)
				--assign tactic-identifiers for this in groupaistatebesiege on a group-to-group basis
				--groupcs is for assault team, grouphrt is for rescue team,groupcsr/grouphrtr picks a random letter, groupany depends on whether assault is active and picks a random letter or not
				if tactic_name == "groupcs1" then
					self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "csalpha")
				elseif tactic_name == "groupcs2" then
					self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "csbravo")
				elseif tactic_name == "groupcs3" then
					self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "cscharlie")
				elseif tactic_name == "groupcs4" then
					self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "csdelta")
				elseif tactic_name == "grouphrt1" then
					self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "hrtalpha")
				elseif tactic_name == "grouphrt2" then
					self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "hrtbravo")
				elseif tactic_name == "grouphrt3" then
					self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "hrtcharlie")
				elseif tactic_name == "grouphrt4" then
					self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "hrtdelta")
				elseif tactic_name == "groupcsr" then
					if randomgroupcallout < 25 then
						self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "csalpha")
					elseif randomgroupcallout > 25 and randomgroupcallout < 50 then
						self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "csbravo")
					elseif randomgroupcallout < 74 and randomgroupcallout > 50 then
						self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "cscharlie")
					else
						self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "csdelta")
					end
				elseif tactic_name == "grouphrtr" then
					if randomgroupcallout < 25 then
						self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "hrtalpha")
					elseif randomgroupcallout > 25 and randomgroupcallout < 50 then
						self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "hrtbravo")
					elseif randomgroupcallout < 74 and randomgroupcallout > 50 then
						self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "hrtcharlie")
					else
						self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "hrtdelta")
					end
				elseif tactic_name == "groupany" then
					if self._task_data.assault.active then
						if randomgroupcallout < 25 then
							self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "csalpha")
						elseif randomgroupcallout > 25 and randomgroupcallout < 50 then
							self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "csbravo")
						elseif randomgroupcallout < 74 and randomgroupcallout > 50 then
							self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "cscharlie")
						else
							self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "csdelta")
						end
					else
						if randomgroupcallout < 25 then
							self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "hrtalpha")
						elseif randomgroupcallout > 25 and randomgroupcallout < 50 then
							self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "hrtbravo")
						elseif randomgroupcallout < 74 and randomgroupcallout > 50 then
							self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "hrtcharlie")
						else
							self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "hrtdelta")
						end
					end
				end
			end
		end
	end

	function GroupAIStateBesiege:_upd_assault_task()
		local task_data = self._task_data.assault

		if not task_data.active then
			return
		end

		local t = self._t

		self:_assign_recon_groups_to_retire()

		local force_pool = self:_get_difficulty_dependent_value(self._tweak_data.assault.force_pool) * self:_get_balancing_multiplier(self._tweak_data.assault.force_pool_balance_mul)
		local task_spawn_allowance = force_pool - (self._hunt_mode and 0 or task_data.force_spawned)

		if task_data.phase == "anticipation" then
			if task_spawn_allowance <= 0 then
				print("spawn_pool empty: -----------FADE-------------")

				task_data.phase = "fade"
				task_data.phase_end_t = t + self._tweak_data.assault.fade_duration
			elseif task_data.phase_end_t < t or self._drama_data.zone == "high" then
				self._assault_number = self._assault_number + 1

				managers.mission:call_global_event("start_assault")
				managers.hud:start_assault(self._assault_number)
				managers.groupai:dispatch_event("start_assault", self._assault_number)
				self:_set_rescue_state(false)

				task_data.phase = "build"
				task_data.phase_end_t = self._t + self._tweak_data.assault.build_duration
				task_data.is_hesitating = nil

				self:set_assault_mode(true)
				managers.trade:set_trade_countdown(false)
			else
				managers.hud:check_anticipation_voice(task_data.phase_end_t - t)
				managers.hud:check_start_anticipation_music(task_data.phase_end_t - t)

				if task_data.is_hesitating and task_data.voice_delay < self._t then
					if self._hostage_headcount > 0 then
						local best_group
						for _, group in pairs(self._groups) do
							if not best_group or group.objective.type == "reenforce_area" then
								best_group = group
							elseif best_group.objective.type ~= "reenforce_area" and group.objective.type ~= "retire" then
								best_group = group
							end
						end
						if best_group and self:_voice_delay_assault(best_group) then
							task_data.is_hesitating = nil
						end
					else
						task_data.is_hesitating = nil
					end
				end
			end
		elseif task_data.phase == "build" then
			if task_spawn_allowance <= 0 then
				task_data.phase = "fade"
				task_data.phase_end_t = t + tweak_data.group_ai.besiege.assault.fade_duration
			elseif t > task_data.phase_end_t or self._drama_data.zone == "high" then
				task_data.phase = "sustain"
				task_data.phase_end_t = t + math.lerp(self:_get_difficulty_dependent_value(tweak_data.group_ai.besiege.assault.sustain_duration_min), self:_get_difficulty_dependent_value(tweak_data.group_ai.besiege.assault.sustain_duration_max), math.random()) * self:_get_balancing_multiplier(tweak_data.group_ai.besiege.assault.sustain_duration_balance_mul)
			end
		elseif task_data.phase == "sustain" then
			if task_spawn_allowance <= 0 then
				task_data.phase = "fade"
				task_data.phase_end_t = t + tweak_data.group_ai.besiege.assault.fade_duration
			elseif t > task_data.phase_end_t and not self._hunt_mode then
				task_data.phase = "fade"
				task_data.phase_end_t = t + tweak_data.group_ai.besiege.assault.fade_duration
			end
		else
			local end_assault = false
			local enemies_left = self:_count_police_force("assault")
			if managers.skirmish:is_skirmish() or managers.job:current_job_id() == "chill_combat" then
				if not self._hunt_mode then
					local enemies_defeated_time_limit = 0
					local drama_engagement_time_limit = 0
					local min_enemies_left = 50
					local enemies_defeated = enemies_left < min_enemies_left
					local taking_too_long = t > task_data.phase_end_t + enemies_defeated_time_limit

					if enemies_defeated or taking_too_long then
						if not task_data.said_retreat then
							task_data.said_retreat = true

							self:_police_announce_retreat()
						elseif task_data.phase_end_t < t then
							local drama_pass = self._drama_data.amount < tweak_data.drama.assault_fade_end
							local engagement_pass = self:_count_criminals_engaged_force(11) <= 10
							local taking_too_long = t > task_data.phase_end_t + drama_engagement_time_limit

							if drama_pass and engagement_pass or taking_too_long then
								end_assault = true
							end
						end
					end

					if task_data.force_end or end_assault then
						print("assault task clear")

						task_data.active = nil
						task_data.phase = nil
						task_data.said_retreat = nil
						task_data.force_end = nil
						local force_regroup = task_data.force_regroup
						task_data.force_regroup = nil

						if self._draw_drama then
							self._draw_drama.assault_hist[#self._draw_drama.assault_hist][2] = t
						end

						managers.mission:call_global_event("end_assault")
						self:_begin_regroup_task(force_regroup)

						return
					end
				end
			else
				if enemies_left < 7 or t > task_data.phase_end_t + 350 then
					if t > task_data.phase_end_t - 8 and not task_data.said_retreat then
						if self._drama_data.amount < tweak_data.drama.assault_fade_end then
							task_data.said_retreat = true
							self:_police_announce_retreat()
						end
					elseif t > task_data.phase_end_t and self._drama_data.amount < tweak_data.drama.assault_fade_end and self:_count_criminals_engaged_force(4) <= 3 then
						task_data.active = nil
						task_data.phase = nil
						task_data.said_retreat = nil
						if self._draw_drama then
							self._draw_drama.assault_hist[#self._draw_drama.assault_hist][2] = t
						end
						managers.mission:call_global_event("end_assault")
						self:_begin_regroup_task()
						return
					end
				else
				end
			end
		end

		if self._drama_data.amount <= tweak_data.drama.low then
			for criminal_key, criminal_data in pairs(self._player_criminals) do
				self:criminal_spotted(criminal_data.unit)

				for group_id, group in pairs(self._groups) do
					if group.objective.charge then
						for u_key, u_data in pairs(group.units) do
							u_data.unit:brain():clbk_group_member_attention_identified(nil, criminal_key)
						end
					end
				end
			end
		end

		local primary_target_area = task_data.target_areas[1]

		if self:is_area_safe_assault(primary_target_area) then
			local target_pos = primary_target_area.pos
			local nearest_area, nearest_dis = nil

			for criminal_key, criminal_data in pairs(self._player_criminals) do
				if not criminal_data.status then
					local dis = mvector3.distance_sq(target_pos, criminal_data.m_pos)

					if not nearest_dis or dis < nearest_dis then
						nearest_dis = dis
						nearest_area = self:get_area_from_nav_seg_id(criminal_data.tracker:nav_segment())
					end
				end
			end

			if nearest_area then
				primary_target_area = nearest_area
				task_data.target_areas[1] = nearest_area
			end
		end

		local nr_wanted = task_data.force - self:_count_police_force("assault")

		if task_data.phase == "anticipation" then
			nr_wanted = nr_wanted - 5
		end

		if nr_wanted > 0 and task_data.phase ~= "fade" then
			local used_event = nil

			if task_data.use_spawn_event and task_data.phase ~= "anticipation" then
				task_data.use_spawn_event = false

				if self:_try_use_task_spawn_event(t, primary_target_area, "assault") then
					used_event = true
				end
			end

			if not used_event then
				if next(self._spawning_groups) then
					-- Nothing
				else
					local spawn_group, spawn_group_type = self:_find_spawn_group_near_area(primary_target_area, self._tweak_data.assault.groups, nil, nil, nil)

					if spawn_group then
						local grp_objective = {
							attitude = "avoid",
							stance = "hos",
							pose = "crouch",
							type = "assault_area",
							area = spawn_group.area,
							coarse_path = {
								{
									spawn_group.area.pos_nav_seg,
									spawn_group.area.pos
								}
							}
						}

						self:_spawn_in_group(spawn_group, spawn_group_type, grp_objective, task_data)
					end
				end
			end
		end

		if task_data.phase ~= "anticipation" then
			if t > task_data.use_smoke_timer then
				task_data.use_smoke = true
			end
			if self._smoke_grenade_queued and task_data.use_smoke and not self:is_smoke_grenade_active() then
				self:detonate_smoke_grenade(self._smoke_grenade_queued[1], self._smoke_grenade_queued[1], self._smoke_grenade_queued[2], self._smoke_grenade_queued[4])
				if self._smoke_grenade_queued[3] then
					self._smoke_grenade_ignore_control = true
				end
			end
		end

		self:_assign_enemy_groups_to_assault(task_data.phase)
	end

	function GroupAIStateBesiege:_set_assault_objective_to_group(group, phase)
		if not group.has_spawned then
			return
		end

		local phase_is_anticipation = phase == "anticipation"
		local current_objective = group.objective
		local approach, open_fire, push, pull_back, charge = nil
		local obstructed_area = self:_chk_group_areas_tresspassed(group)
		local group_leader_u_key, group_leader_u_data = self._determine_group_leader(group.units)
		local tactics_map = nil

		if group_leader_u_data and group_leader_u_data.tactics then
			tactics_map = {}

			for _, tactic_name in ipairs(group_leader_u_data.tactics) do
				tactics_map[tactic_name] = true
			end

			if current_objective.tactic and not tactics_map[current_objective.tactic] then
				current_objective.tactic = nil
			end

			for i_tactic, tactic_name in ipairs(group_leader_u_data.tactics) do
				if tactic_name == "deathguard" and not phase_is_anticipation then
					if current_objective.tactic == tactic_name then
						for u_key, u_data in pairs(self._char_criminals) do
							if u_data.status and current_objective.follow_unit == u_data.unit then
								local crim_nav_seg = u_data.tracker:nav_segment()

								if current_objective.area.nav_segs[crim_nav_seg] then
									return
								end
							end
						end
					end

					local closest_crim_u_data, closest_crim_dis_sq = nil

					for u_key, u_data in pairs(self._char_criminals) do
						if u_data.status then
							local closest_u_id, closest_u_data, closest_u_dis_sq = self._get_closest_group_unit_to_pos(u_data.m_pos, group.units)

							if closest_u_dis_sq and (not closest_crim_dis_sq or closest_u_dis_sq < closest_crim_dis_sq) then
								closest_crim_u_data = u_data
								closest_crim_dis_sq = closest_u_dis_sq
							end
						end
					end

					if closest_crim_u_data then
						local search_params = {
							id = "GroupAI_deathguard",
							from_tracker = group_leader_u_data.unit:movement():nav_tracker(),
							to_tracker = closest_crim_u_data.tracker,
							access_pos = self._get_group_acces_mask(group)
						}
						local coarse_path = managers.navigation:search_coarse(search_params)

						if coarse_path then
							local grp_objective = {
								distance = 800,
								type = "assault_area",
								attitude = "engage",
								tactic = "deathguard",
								moving_in = true,
								follow_unit = closest_crim_u_data.unit,
								area = self:get_area_from_nav_seg_id(coarse_path[#coarse_path][1]),
								coarse_path = coarse_path
							}
							group.is_chasing = true

							self:_set_objective_to_enemy_group(group, grp_objective)
							self:_voice_deathguard_start(group)

							return
						end
					end
				elseif tactic_name == "charge" and not current_objective.moving_out and group.in_place_t and (self._t - group.in_place_t > 15 or self._t - group.in_place_t > 4 and self._drama_data.amount <= tweak_data.drama.low) and next(current_objective.area.criminal.units) and group.is_chasing and not current_objective.charge then
					charge = true
				end
			end
		end

		local objective_area = nil

		if obstructed_area then
			if current_objective.moving_out then
				if not current_objective.open_fire then
					open_fire = true
				end
			elseif not current_objective.pushed or charge and not current_objective.charge then
				push = true
			end
		else
			local obstructed_path_index = self:_chk_coarse_path_obstructed(group)

			if obstructed_path_index then
				print("obstructed_path_index", obstructed_path_index)

				objective_area = self:get_area_from_nav_seg_id(group.coarse_path[math.max(obstructed_path_index - 1, 1)][1])
				pull_back = true
			elseif not current_objective.moving_out then
				local has_criminals_close = nil

				if not current_objective.moving_out then
					for area_id, neighbour_area in pairs(current_objective.area.neighbours) do
						if next(neighbour_area.criminal.units) then
							has_criminals_close = true

							break
						end
					end
				end

				if charge then
					push = true
				elseif not has_criminals_close or not group.in_place_t then
					approach = true
				elseif not phase_is_anticipation and not current_objective.open_fire then
					open_fire = true
				elseif not phase_is_anticipation and group.in_place_t and (group.is_chasing or not tactics_map or not tactics_map.ranged_fire or self._t - group.in_place_t > 15) then
					push = true
				elseif phase_is_anticipation and current_objective.open_fire then
					pull_back = true
				end
			end
		end

		objective_area = objective_area or current_objective.area

		if open_fire then
			local grp_objective = {
				attitude = "engage",
				pose = "stand",
				type = "assault_area",
				stance = "hos",
				open_fire = true,
				tactic = current_objective.tactic,
				area = obstructed_area or current_objective.area,
				coarse_path = {
					{
						objective_area.pos_nav_seg,
						mvector3.copy(current_objective.area.pos)
					}
				}
			}

			self:_set_objective_to_enemy_group(group, grp_objective)
			self:_voice_open_fire_start(group)
		elseif approach or push then
			local assault_area, alternate_assault_area, alternate_assault_area_from, assault_path, alternate_assault_path = nil
			local to_search_areas = {
				objective_area
			}
			local found_areas = {
				[objective_area] = "init"
			}

			repeat
				local search_area = table.remove(to_search_areas, 1)

				if next(search_area.criminal.units) then
					local assault_from_here = true

					if not push and tactics_map and tactics_map.flank then
						local assault_from_area = found_areas[search_area]

						if assault_from_area ~= "init" then
							local cop_units = assault_from_area.police.units

							for u_key, u_data in pairs(cop_units) do
								if u_data.group and u_data.group ~= group and u_data.group.objective.type == "assault_area" then
									assault_from_here = false

									if not alternate_assault_area or math.random() < 0.5 then
										local search_params = {
											id = "GroupAI_assault",
											from_seg = current_objective.area.pos_nav_seg,
											to_seg = search_area.pos_nav_seg,
											access_pos = self._get_group_acces_mask(group),
											verify_clbk = callback(self, self, "is_nav_seg_safe")
										}
										alternate_assault_path = managers.navigation:search_coarse(search_params)

										if alternate_assault_path then
											self:_merge_coarse_path_by_area(alternate_assault_path)

											alternate_assault_area = search_area
											alternate_assault_area_from = assault_from_area
										end
									end

									found_areas[search_area] = nil

									break
								end
							end
						end
					end

					if assault_from_here then
						local search_params = {
							id = "GroupAI_assault",
							from_seg = current_objective.area.pos_nav_seg,
							to_seg = search_area.pos_nav_seg,
							access_pos = self._get_group_acces_mask(group),
							verify_clbk = callback(self, self, "is_nav_seg_safe")
						}
						assault_path = managers.navigation:search_coarse(search_params)

						if assault_path then
							self:_merge_coarse_path_by_area(assault_path)

							assault_area = search_area

							break
						end
					end
				else
					for other_area_id, other_area in pairs(search_area.neighbours) do
						if not found_areas[other_area] then
							table.insert(to_search_areas, other_area)

							found_areas[other_area] = search_area
						end
					end
				end
			until #to_search_areas == 0

			if not assault_area and alternate_assault_area then
				assault_area = alternate_assault_area
				found_areas[assault_area] = alternate_assault_area_from
				assault_path = alternate_assault_path
			end

			if assault_area and assault_path then
				local assault_area = push and assault_area or found_areas[assault_area] == "init" and objective_area or found_areas[assault_area]

				if #assault_path > 2 and assault_area.nav_segs[assault_path[#assault_path - 1][1]] then
					table.remove(assault_path)
				end

				local used_grenade = nil

				if push then
					local detonate_pos = nil

					if charge then
						for c_key, c_data in pairs(assault_area.criminal.units) do
							detonate_pos = c_data.unit:movement():m_pos()

							break
						end
					end

					local first_chk = math.random() < 0.5 and self._chk_group_use_flash_grenade or self._chk_group_use_smoke_grenade
					local second_chk = first_chk == self._chk_group_use_flash_grenade and self._chk_group_use_smoke_grenade or self._chk_group_use_flash_grenade
					used_grenade = first_chk(self, group, self._task_data.assault, detonate_pos)
					used_grenade = used_grenade or second_chk(self, group, self._task_data.assault, detonate_pos)

					self:_voice_move_in_start(group)
				end

				if not push or used_grenade then
					local grp_objective = {
						type = "assault_area",
						stance = "hos",
						area = assault_area,
						coarse_path = assault_path,
						pose = push and "crouch" or "stand",
						attitude = push and "engage" or "avoid",
						moving_in = push and true or nil,
						open_fire = push or nil,
						pushed = push or nil,
						charge = charge,
						interrupt_dis = charge and 0 or nil
					}
					group.is_chasing = group.is_chasing or push

					self:_set_objective_to_enemy_group(group, grp_objective)
				end
			end
		elseif pull_back then
			self:_voice_gtfo(group)
			local retreat_area, do_not_retreat = nil

			for u_key, u_data in pairs(group.units) do
				local nav_seg_id = u_data.tracker:nav_segment()

				if current_objective.area.nav_segs[nav_seg_id] then
					retreat_area = current_objective.area

					break
				end

				if self:is_nav_seg_safe(nav_seg_id) then
					retreat_area = self:get_area_from_nav_seg_id(nav_seg_id)

					break
				end
			end

			if not retreat_area and not do_not_retreat and current_objective.coarse_path then
				local forwardmost_i_nav_point = self:_get_group_forwardmost_coarse_path_index(group)

				if forwardmost_i_nav_point then
					local nearest_safe_nav_seg_id = current_objective.coarse_path(forwardmost_i_nav_point)
					retreat_area = self:get_area_from_nav_seg_id(nearest_safe_nav_seg_id)
				end
			end

			if retreat_area then
				local new_grp_objective = {
					attitude = "avoid",
					stance = "hos",
					pose = "crouch",
					type = "assault_area",
					area = retreat_area,
					coarse_path = {
						{
							retreat_area.pos_nav_seg,
							mvector3.copy(retreat_area.pos)
						}
					}
				}
				group.is_chasing = nil

				self:_set_objective_to_enemy_group(group, new_grp_objective)
			   
				self:_voice_gtfo(group)

				return
			end
		end
	end
		
	function GroupAIStateBesiege:_voice_saw()
		for group_id, group in pairs(self._groups) do
			for u_key, u_data in pairs(group.units) do
				if u_data.char_tweak.chatter.saw then
					self:chk_say_enemy_chatter(u_data.unit, u_data.m_pos, "saw")
				else
					
				end
			end
		end
	end

	function GroupAIStateBesiege:_voice_sentry()
		for group_id, group in pairs(self._groups) do
			for u_key, u_data in pairs(group.units) do
				if u_data.char_tweak.chatter.sentry then
					self:chk_say_enemy_chatter(u_data.unit, u_data.m_pos, "sentry")
				else
					
				end
			end
		end
	end

	function GroupAIStateBesiege:_voice_looking_for_angle(group)
		for u_key, unit_data in pairs(group.units) do
			if unit_data.char_tweak.chatter.ready and self:chk_say_enemy_chatter(unit_data.unit, unit_data.m_pos, "look_for_angle") then
			else
			end
		end
	end	

	function GroupAIStateBesiege:_voice_open_fire_start(group)
		for u_key, unit_data in pairs(group.units) do
			if unit_data.char_tweak.chatter.ready and self:chk_say_enemy_chatter(unit_data.unit, unit_data.m_pos, "open_fire") then
			else
			end
		end
	end

	function GroupAIStateBesiege:_voice_push_in(group)
		for u_key, unit_data in pairs(group.units) do
			if unit_data.char_tweak.chatter.ready and self:chk_say_enemy_chatter(unit_data.unit, unit_data.m_pos, "push") then
			else
			end
		end
	end

	function GroupAIStateBesiege:_voice_gtfo(group)
		for u_key, unit_data in pairs(group.units) do
			if unit_data.char_tweak.chatter.ready and self:chk_say_enemy_chatter(unit_data.unit, unit_data.m_pos, "retreat") then
			else
			end
		end
	end

	function GroupAIStateBesiege:_voice_deathguard_start(group)
		for u_key, unit_data in pairs(group.units) do
			if unit_data.char_tweak.chatter.ready and self:chk_say_enemy_chatter(unit_data.unit, unit_data.m_pos, "deathguard") then
			else
			end
		end
	end	

	function GroupAIStateBesiege:_voice_smoke(group)
		for u_key, unit_data in pairs(group.units) do
			if unit_data.char_tweak.chatter.ready and self:chk_say_enemy_chatter(unit_data.unit, unit_data.m_pos, "smoke") then
			else
			end
		end
	end	

	function GroupAIStateBesiege:_voice_flash(group)
		for u_key, unit_data in pairs(group.units) do
			if unit_data.char_tweak.chatter.ready and self:chk_say_enemy_chatter(unit_data.unit, unit_data.m_pos, "flash_grenade") then
			else
			end
		end
	end

	-- Fix for the bug when there is too many dozers by andole
	local fixed = false
	local origfunc2 = GroupAIStateBesiege._get_special_unit_type_count
	function GroupAIStateBesiege:_get_special_unit_type_count(special_type, ...)
		if special_type == 'tank_mini' or special_type == 'tank_medic' then
			fixed = true
		end
		
		if not fixed and special_type == 'tank' then
			local res = origfunc2(self, 'tank', ...) or 0
			res = res + (origfunc2(self, 'tank_mini', ...) or 0)
			res = res + (origfunc2(self, 'tank_medic', ...) or 0)
			return res
		end
		
		return origfunc2(self, special_type, ...)
	end
end
if string.lower(RequiredScript) == "lib/managers/group_ai_states/groupaistatebase" then
	local origfunc3 = GroupAIStateBase._init_misc_data
	function GroupAIStateBase:_init_misc_data(...)
		origfunc3(self, ...)
		self._special_unit_types = self._special_unit_types or {}
		self._special_unit_types['tank_mini'] = true
		self._special_unit_types['tank_medic'] = true
	end

	local origfunc2 = GroupAIStateBase.on_simulation_started
	function GroupAIStateBase:on_simulation_started(...)
		origfunc2(self, ...)
		self._special_unit_types = self._special_unit_types or {}
		self._special_unit_types['tank_mini'] = true
		self._special_unit_types['tank_medic'] = true
	end
end
if string.lower(RequiredScript) == "lib/managers/hud/hudassaultcorner" then
	local data = HUDAssaultCorner.sync_start_assault
	function HUDAssaultCorner:sync_start_assault(assault_number)
		data(self, assault_number)																																											
		if managers.job:is_current_job_professional() or managers.crime_spree:is_active() then
			self:_hide_hostages()
		end
	end
	
	local data = HUDAssaultCorner._update_assault_hud_color
	function HUDAssaultCorner:_update_assault_hud_color(color)
		data(self, color)
		local assault_panel = self._hud_panel:child("assault_panel")
		local icon_assaultbox = assault_panel:child("icon_assaultbox")
		if managers.job:is_current_job_professional() or managers.crime_spree:is_active() then
			icon_assaultbox:set_color(tweak_data.screen_colors.pro_color)
		else
			icon_assaultbox:set_color(color)
		end
	end
	
	function HUDAssaultCorner:_show_icon_assaultbox(icon_assaultbox)
		local TOTAL_T = 2
		local t = TOTAL_T
		local anim_pulse_glow = function(o)
			local t = 0
			local dt = 0
			while true do
				dt = coroutine.yield()
				t = (t + dt * 0.5) % 1
				o:set_alpha((math.sin(t * 180)))
				
			end
		end
		
		while t > 0 do
			local dt = coroutine.yield()
			t = t - dt
			local alpha = math.round(math.abs(math.sin(t * 360 * 2)))

			icon_assaultbox:set_alpha(alpha)
		end

		local is_whisper_mode = managers.groupai and managers.groupai:state():whisper_mode()
		if not is_whisper_mode and (managers.job:is_current_job_professional() or managers.crime_spree:is_active()) then
			icon_assaultbox:animate(anim_pulse_glow)
		else
			icon_assaultbox:set_alpha(1)
		end
	end
	
	function HUDAssaultCorner:_animate_text(text_panel, bg_box, color, color_function)
		local text_list = (bg_box or self._bg_box):script().text_list
		local text_index = 0
		local texts = {}
		local padding = 10

		local function create_new_text(text_panel, text_list, text_index, texts)
			if texts[text_index] and texts[text_index].text then
				text_panel:remove(texts[text_index].text)

				texts[text_index] = nil
			end

			local text_id = text_list[text_index]
			local text_string = ""

			if type(text_id) == "string" then
				text_string = managers.localization:to_upper_text(text_id)
			elseif text_id == Idstring("risk") then
				local use_stars = true

				if managers.crime_spree:is_active() then
					text_string = text_string .. managers.localization:to_upper_text("menu_cs_level", {
						level = managers.experience:cash_string(managers.crime_spree:server_spree_level(), "")
					})
					use_stars = false
				end

				if use_stars then
					local star = managers.job:current_difficulty_stars()
					local diff_stars = star == 4 and 5 or star == 5 and 4 or star
					for i = 1, diff_stars, 1 do
						text_string = text_string .. managers.localization:get_default_macro("BTN_SKULL")
					end
				end
			end

			local mod_color = color_function and color_function() or color or self._assault_color
			local text = text_panel:text({
				vertical = "center",
				h = 10,
				w = 10,
				align = "center",
				blend_mode = "add",
				layer = 1,
				text = text_string,
				color = mod_color,
				font_size = tweak_data.hud_corner.assault_size,
				font = tweak_data.hud_corner.assault_font
			})
			local _, _, w, h = text:text_rect()

			text:set_size(w, h)

			texts[text_index] = {
				x = text_panel:w() + w * 0.5 + padding * 2,
				text = text
			}
		end

		while true do
			local dt = coroutine.yield()
			local last_text = texts[text_index]

			if last_text and last_text.text then
				if last_text.x + last_text.text:w() * 0.5 + padding < text_panel:w() then
					text_index = text_index % #text_list + 1

					create_new_text(text_panel, text_list, text_index, texts)
				end
			else
				text_index = text_index % #text_list + 1

				create_new_text(text_panel, text_list, text_index, texts)
			end

			local speed = 90

			for i, data in pairs(texts) do
				if data.text then
					data.x = data.x - dt * speed

					data.text:set_center_x(data.x)
					data.text:set_center_y(text_panel:h() * 0.5)

					if data.x + data.text:w() * 0.5 < 0 then
						text_panel:remove(data.text)

						data.text = nil
					elseif color_function then
						data.text:set_color(color_function())
					end
				end
			end
		end
	end
end
if string.lower(RequiredScript) == "lib/managers/menumanagerpd2" then
	function MenuQuickplaySettingsInitiator:modify_node(node)
		local stealth_item = node:item("quickplay_settings_stealth")
		local loud_item = node:item("quickplay_settings_loud")
		local stealth_on = managers.user:get_setting("quickplay_stealth")
		local loud_on = managers.user:get_setting("quickplay_loud")
		self._difficulties_quick = {
			"easy",
			"normal",
			"hard",
			"overkill",
			"overkill_145",
			"overkill_290"
		}
		
		stealth_item:set_value(stealth_on and "on" or "off")
		loud_item:set_value(loud_on and "on" or "off")
		stealth_item:set_parameter("loud", loud_item)
		loud_item:set_parameter("stealth", stealth_item)
		node:item("quickplay_settings_level_min"):set_max(tweak_data.quickplay.max_level_diff[1])
		node:item("quickplay_settings_level_min"):set_value(Global.crimenet and Global.crimenet.quickplay and Global.crimenet.quickplay.level_diff_min or tweak_data.quickplay.default_level_diff[1])
		node:item("quickplay_settings_level_max"):set_max(tweak_data.quickplay.max_level_diff[2])
		node:item("quickplay_settings_level_max"):set_value(Global.crimenet and Global.crimenet.quickplay and Global.crimenet.quickplay.level_diff_max or tweak_data.quickplay.default_level_diff[2])

		local mutators_item = node:item("quickplay_settings_mutators")
		local mutators_on = managers.user:get_setting("quickplay_mutators")

		mutators_item:set_value(mutators_on and "on" or "off")

		local difficulty_item = node:item("quickplay_settings_difficulty")

		if not difficulty_item then
			local options = {
				{
					value = "any",
					text_id = "menu_any",
					_meta = "option"
				}
			}

			for _, difficulty in ipairs(self._difficulties_quick) do
				if difficulty ~= "easy" then
					table.insert(options, {
						_meta = "option",
						text_id = tweak_data.difficulty_name_ids[difficulty],
						value = difficulty
					})
				end
			end

			difficulty_item = self:create_multichoice(node, options, {
				callback = "quickplay_difficulty",
				name = "quickplay_settings_difficulty",
				help_id = "menu_quickplay_settings_difficulty",
				text_id = "menu_quickplay_settings_difficulty"
			}, 1)
		end

		if Global.crimenet and Global.crimenet.quickplay and Global.crimenet.quickplay.difficulty then
			difficulty_item:set_value(Global.crimenet.quickplay.difficulty)
		else
			difficulty_item:set_value("any")
		end

		return node
	end
end
if string.lower(RequiredScript) == "lib/managers/menu/items/contractbrokerheistitem" then
	local padding = 10

	local function make_fine_text(text)
		local x, y, w, h = text:text_rect()

		text:set_size(w, h)
		text:set_position(math.round(text:x()), math.round(text:y()))
	end

	function ContractBrokerHeistItem:init(parent_panel, job_data, idx)
		self._parent = parent_panel
		self._job_data = job_data
		local job_tweak = tweak_data.narrative:job_data(job_data.job_id)
		local contact = job_tweak.contact
		local contact_tweak = tweak_data.narrative.contacts[contact]
		local narrative = tweak_data.narrative:job_data(job_data.job_id)
		self._panel = parent_panel:panel({
			halign = "grow",
			layer = 10,
			h = 90,
			x = 0,
			valign = "top",
			y = 90 * (idx - 1)
		})
		self._background = self._panel:rect({
			blend_mode = "add",
			alpha = 0.4,
			halign = "grow",
			layer = -1,
			valign = "grow",
			y = padding,
			h = self._panel:h() - padding,
			color = job_data.enabled and tweak_data.screen_colors.button_stage_3 or tweak_data.screen_colors.important_1
		})

		self._background:set_visible(false)

		local img_size = self._panel:h() - padding
		self._image_panel = self._panel:panel({
			halign = "left",
			layer = 1,
			x = 0,
			valign = "top",
			y = padding,
			w = img_size * 1.7777777777777777,
			h = img_size
		})
		local has_image = false

		if job_tweak.contract_visuals and job_tweak.contract_visuals.preview_image then
			local data = job_tweak.contract_visuals.preview_image
			local path, rect = nil

			if data.id then
				path = "guis/dlcs/" .. (data.folder or "bro") .. "/textures/pd2/crimenet/" .. data.id
				rect = data.rect
			elseif data.icon then
				path, rect = tweak_data.hud_icons:get_icon_data(data.icon)
			end

			if path and DB:has(Idstring("texture"), path) then
				self._image_panel:bitmap({
					valign = "scale",
					layer = 2,
					blend_mode = "add",
					halign = "scale",
					texture = path,
					texture_rect = rect,
					w = self._image_panel:w(),
					h = self._image_panel:h(),
					color = narrative.professional and Color(255, 255, 100, 70) / 255 or Color.white
				})

				self._image = self._image_panel:rect({
					alpha = 1,
					layer = 1,
					color = Color.black
				})
				has_image = true
			end
		end

		if not has_image then
			local color = Color.red
			local error_message = "Missing Preview Image"

			self._image_panel:rect({
				alpha = 0.4,
				layer = 1,
				color = color
			})
			self._image_panel:text({
				vertical = "center",
				wrap = true,
				align = "center",
				word_wrap = true,
				layer = 2,
				text = error_message,
				font = tweak_data.menu.pd2_small_font,
				font_size = tweak_data.menu.pd2_small_font_size
			})
			BoxGuiObject:new(self._image_panel:panel({
				layer = 100
			}), {
				sides = {
					1,
					1,
					1,
					1
				}
			})
		end

		local job_name = self._panel:text({
			layer = 1,
			vertical = "top",
			align = "left",
			halign = "left",
			valign = "top",
			text = managers.localization:to_upper_text(job_tweak.name_id),
			font = tweak_data.menu.pd2_medium_font,
			font_size = tweak_data.menu.pd2_medium_font_size,
			color = job_data.enabled and tweak_data.screen_colors.text or tweak_data.screen_colors.important_1
		})

		make_fine_text(job_name)
		job_name:set_left(self._image_panel:right() + padding * 2)
		job_name:set_top(self._panel:h() * 0.4 + padding * 0.5)
		
		local filled_star_rect = {0, 32, 32, 32}
		local job_stars = math.ceil(narrative.jc/10)
		local cy = job_name:bottom() + 8
		local sx = self._image_panel:right() + padding * 2
		local level_data = { 
				texture="guis/textures/pd2/mission_briefing/difficulty_icons", 
				texture_rect = filled_star_rect, 
				w = 16, 
				h = 16, 
				color = tweak_data.screen_colors.text, 
				alpha = 1 
		}
		for i = 1, 10 do
			local x = sx + (i - 1) * 18
			local star_data = level_data
			local star = self._panel:bitmap( star_data )
			star:set_x(x)
			star:set_center_y(math.round(cy))
			star:set_color(i > job_stars + (narrative.professional and 1 or 0) and Color.black or i > job_stars and tweak_data.screen_colors.risk or tweak_data.screen_colors.text)
		end
		
		local contact_name = self._panel:text({
			alpha = 0.8,
			vertical = "top",
			layer = 1,
			align = "left",
			halign = "left",
			valign = "top",
			text = managers.localization:to_upper_text(contact_tweak.name_id),
			font = tweak_data.menu.pd2_medium_font,
			font_size = tweak_data.menu.pd2_medium_font_size * 0.9,
			color = tweak_data.screen_colors.text
		})

		make_fine_text(contact_name)
		contact_name:set_left(job_name:left())
		contact_name:set_bottom(job_name:top())

		local dlc_name, dlc_color = self:get_dlc_name_and_color(job_tweak)
		local dlc_name = self._panel:text({
			alpha = 1,
			vertical = "top",
			layer = 1,
			align = "left",
			halign = "left",
			valign = "top",
			text = dlc_name,
			font = tweak_data.menu.pd2_medium_font,
			font_size = tweak_data.menu.pd2_medium_font_size * 0.9,
			color = dlc_color
		})

		make_fine_text(dlc_name)
		dlc_name:set_left(contact_name:right() + 5)
		dlc_name:set_bottom(job_name:top())
		
		local pro_name = self._panel:text({
			alpha = 1,
			vertical = "top",
			layer = 1,
			align = "left",
			halign = "left",
			valign = "top",
			visible = false,
			text = managers.localization:to_upper_text("cn_menu_pro_job"),
			font = tweak_data.menu.pd2_medium_font,
			font_size = tweak_data.menu.pd2_medium_font_size * 0.9,
			color = tweak_data.screen_colors.pro_color
		})

		make_fine_text(pro_name)
		if job_tweak.dlc then
			pro_name:set_left(dlc_name:right() + 5)
		else
			pro_name:set_left(contact_name:right() + 5)
		end
		pro_name:set_bottom(job_name:top())
		pro_name:set_visible(narrative.professional)
		
		if job_data.is_new then
			local new_name = self._panel:text({
				alpha = 1,
				vertical = "top",
				layer = 1,
				align = "left",
				halign = "left",
				valign = "top",
				text = managers.localization:to_upper_text("menu_new"),
				font = tweak_data.menu.pd2_medium_font,
				font_size = tweak_data.menu.pd2_medium_font_size * 0.9,
				color = Color(255, 105, 254, 59) / 255
			})

			make_fine_text(new_name)
			new_name:set_left((dlc_name:text() ~= "" and dlc_name or contact_name):right() + 5)
			new_name:set_bottom(job_name:top())
		end

		local last_played = self._panel:text({
			alpha = 0.7,
			vertical = "top",
			layer = 1,
			align = "right",
			halign = "right",
			valign = "top",
			text = self:get_last_played_text(),
			font = tweak_data.menu.pd2_medium_font,
			font_size = tweak_data.menu.pd2_medium_font_size * 0.8,
			color = tweak_data.screen_colors.text
		})

		make_fine_text(last_played)
		last_played:set_right(self._panel:right() - padding)
		last_played:set_bottom(job_name:top())

		local icons_panel = self._panel:panel({
			valign = "top",
			halign = "right",
			h = job_name:h(),
			w = self._panel:w() * 0.3
		})

		icons_panel:set_right(self._panel:right() - padding)
		icons_panel:set_top(job_name:top())

		local icon_size = icons_panel:h()
		local last_icon = nil
		self._favourite = icons_panel:bitmap({
			texture = "guis/dlcs/bro/textures/pd2/favourite",
			halign = "right",
			alpha = 0.8,
			valign = "top",
			color = Color.white,
			w = icon_size,
			h = icon_size
		})

		self._favourite:set_right(icons_panel:w())

		last_icon = self._favourite
		local day_text = icons_panel:text({
			layer = 1,
			vertical = "bottom",
			align = "right",
			halign = "right",
			valign = "top",
			text = self:get_heist_day_text(),
			font = tweak_data.menu.pd2_medium_font,
			font_size = tweak_data.menu.pd2_medium_font_size * 0.9,
			color = tweak_data.screen_colors.text
		})

		make_fine_text(day_text)
		day_text:set_right(last_icon:left() - 5)
		day_text:set_bottom(icons_panel:h())

		last_icon = day_text
		local length_icon = icons_panel:text({
			layer = 1,
			vertical = "bottom",
			align = "right",
			halign = "right",
			valign = "top",
			text = self:get_heist_day_icon(),
			font = tweak_data.menu.pd2_medium_font,
			font_size = tweak_data.menu.pd2_medium_font_size * 0.8,
			color = tweak_data.screen_colors.text
		})

		make_fine_text(length_icon)
		length_icon:set_right(last_icon:left() - padding)
		length_icon:set_top(2)

		last_icon = length_icon

		if self:is_stealthable() then
			local stealth = icons_panel:text({
				layer = 1,
				vertical = "top",
				align = "right",
				halign = "right",
				valign = "top",
				text = managers.localization:get_default_macro("BTN_GHOST"),
				font = tweak_data.menu.pd2_medium_font,
				font_size = tweak_data.menu.pd2_medium_font_size,
				color = tweak_data.screen_colors.text
			})

			make_fine_text(stealth)
			stealth:set_right(last_icon:left() - padding)

			last_icon = stealth
		end

		self:refresh()
	end
end
if string.lower(RequiredScript) == "lib/managers/hud/newhudstatsscreen" then
	local tiny_font = tweak_data.menu.pd2_tiny_font
	local large_font = tweak_data.menu.pd2_large_font
	local medium_font = tweak_data.menu.pd2_medium_font
	local tiny_font_size = tweak_data.menu.pd2_tiny_font_size
	local small_font_size = tweak_data.menu.pd2_small_font_size
	local medium_font_size = tweak_data.menu.pd2_medium_font_size
	local safehouse = Global.game_settings and Global.game_settings.level_id == "safehouse"
	local new_safehouse = Global.game_settings and Global.game_settings.level_id == "chill"

	function HUDStatsScreen:recreate_left()
		if safehouse or new_safehouse then
			self._left:set_visible(false)
			return
		end
		self._left:set_w(417)
		self._left:clear()
		self._left:bitmap({
			texture = "guis/textures/test_blur_df",
			layer = -1,
			render_template = "VertexColorTexturedBlur3D",
			valign = "grow",
			w = self._left:w(),
			h = self._left:h()
		})

		local lb = HUDBGBox_create(self._left, {}, {
			blend_mode = "normal",
			color = Color.white
		})

		lb:child("bg"):set_color(Color(0, 0, 0):with_alpha(0.75))
		lb:child("bg"):set_alpha(1)
		
		local pad = 8
		local x, y = managers.gui_data:corner_safe_to_full(0, 0)
		local loot_wrapper_panel = self._left:panel({
			name = "loot_wrapper_panel",
			visible = true,
			x = 0,
			layer = 1,
			y = 0 + math.round(managers.gui_data:full_scaled_size().height / 1.84),
			h = math.round(managers.gui_data:full_scaled_size().height / 2),
			w = self._left:w()
		})

		loot_wrapper_panel:set_valign("center")

		local secured_loot_title = loot_wrapper_panel:text({
			valign = "center",
			name = "secured_loot_title",
			h = 32,
			w = 512,
			align = "left",
			vertical = "top",
			layer = 1,
			color = Color.white,
			font_size = tweak_data.hud_stats.loot_title_size,
			font = tweak_data.hud_stats.objectives_font,
			text = utf8.to_upper(managers.localization:text("hud_secured_loot"))
		})

		secured_loot_title:set_position(math.round(x), 0)
		managers.hud:make_fine_text(secured_loot_title)

		local mission_bags_title = loot_wrapper_panel:text({
			valign = "center",
			name = "mission_bags_title",
			h = 32,
			w = 512,
			align = "left",
			vertical = "top",
			layer = 1,
			color = Color.white,
			font_size = tweak_data.hud_stats.loot_size,
			font = tweak_data.hud_stats.objectives_font,
			text = utf8.to_upper(managers.localization:text("hud_mission_bags"))
		})

		mission_bags_title:set_position(math.round(x + pad), secured_loot_title:bottom())
		managers.hud:make_fine_text(mission_bags_title)

		local mission_bags_panel = loot_wrapper_panel:panel({
			y = 0,
			name = "mission_bags_panel",
			h = 44,
			visible = true,
			x = 0,
			w = self._left:w()
		})

		mission_bags_panel:set_lefttop(mission_bags_title:leftbottom())
		mission_bags_panel:set_position(mission_bags_panel:x(), mission_bags_panel:y())

		local mission_bags_payout = loot_wrapper_panel:text({
			valign = "center",
			name = "mission_bags_payout",
			h = 32,
			w = 512,
			align = "left",
			vertical = "top",
			text = "",
			layer = 1,
			color = Color.white,
			font_size = tweak_data.hud_stats.loot_size,
			font = tweak_data.hud_stats.objectives_font
		})

		mission_bags_payout:set_text(utf8.to_upper(managers.localization:text("hud_bonus_bags_payout", {
			MONEY = managers.experience:cash_string(0)
		})))
		mission_bags_payout:set_position(mission_bags_title:left(), mission_bags_panel:bottom())
		managers.hud:make_fine_text(mission_bags_payout)
		mission_bags_payout:set_w(loot_wrapper_panel:w())

		local bonus_bags_title = loot_wrapper_panel:text({
			valign = "center",
			name = "bonus_bags_title",
			h = 32,
			w = 512,
			align = "left",
			vertical = "top",
			layer = 1,
			color = Color.white,
			font_size = tweak_data.hud_stats.loot_size,
			font = tweak_data.hud_stats.objectives_font,
			text = utf8.to_upper(managers.localization:text("hud_bonus_bags"))
		})

		bonus_bags_title:set_position(math.round(x + pad), mission_bags_payout:bottom() + 4)
		managers.hud:make_fine_text(bonus_bags_title)

		local bonus_bags_panel = loot_wrapper_panel:panel({
			y = 0,
			name = "bonus_bags_panel",
			h = 44,
			visible = true,
			x = 0,
			w = self._left:w()
		})

		bonus_bags_panel:set_lefttop(bonus_bags_title:leftbottom())
		bonus_bags_panel:set_position(bonus_bags_panel:x(), bonus_bags_panel:y())
		bonus_bags_panel:grow(-bonus_bags_panel:x(), 0)

		local bonus_bags_payout = loot_wrapper_panel:text({
			valign = "center",
			name = "bonus_bags_payout",
			h = 32,
			w = 512,
			align = "left",
			vertical = "top",
			text = "",
			layer = 1,
			color = Color.white,
			font_size = tweak_data.hud_stats.loot_size,
			font = tweak_data.hud_stats.objectives_font
		})

		bonus_bags_payout:set_text(utf8.to_upper(managers.localization:text("hud_bonus_bags_payout", {
			MONEY = managers.experience:cash_string(0)
		})))
		bonus_bags_payout:set_position(bonus_bags_title:left(), bonus_bags_panel:bottom())
		managers.hud:make_fine_text(bonus_bags_payout)
		bonus_bags_payout:set_w(loot_wrapper_panel:w())

		local instant_cash_title = loot_wrapper_panel:text({
			valign = "center",
			name = "instant_cash_title",
			h = 32,
			w = 512,
			align = "left",
			vertical = "top",
			layer = 1,
			color = Color.white,
			font_size = tweak_data.hud_stats.loot_size,
			font = tweak_data.hud_stats.objectives_font,
			text = utf8.to_upper(managers.localization:text("hud_instant_cash"))
		})

		instant_cash_title:set_position(math.round(x + pad), bonus_bags_payout:bottom() + 4)
		managers.hud:make_fine_text(instant_cash_title)

		local instant_cash_text = loot_wrapper_panel:text({
			valign = "center",
			name = "instant_cash_text",
			h = 32,
			w = 512,
			align = "left",
			vertical = "top",
			layer = 1,
			color = Color.white,
			font_size = tweak_data.hud_stats.loot_size,
			font = tweak_data.hud_stats.objectives_font,
			text = managers.experience:cash_string(0)
		})

		instant_cash_text:set_position(instant_cash_title:left(), instant_cash_title:bottom())
		managers.hud:make_fine_text(instant_cash_text)
		instant_cash_text:set_w(loot_wrapper_panel:w())
		self:_update_stats_screen_loot(self._left:child("loot_wrapper_panel"))
		local num_forced = #managers.achievment:get_force_tracked()
		local mutators_active = managers.mutators:are_mutators_active()
		if num_forced >= 1 and not mutators_active then
			self:_create_tracked_list(self._left)
		elseif mutators_active then
			self:_create_mutators_list(self._left)
		else
			self:_create_objectives_list(self._left)
		end
	end

	function HUDStatsScreen:recreate_right()
		if safehouse or new_safehouse then
			self._right:set_visible(false)
			return
		end
		self._right:set_w(417)
		self._right:clear()
		local blur = self._right:bitmap({
			texture = "guis/textures/test_blur_df",
			layer = -1,
			render_template = "VertexColorTexturedBlur3D",
			valign = "grow",
			w = self._right:w(),
			h = self._right:h()
		})

		local rb = HUDBGBox_create(self._right, {}, {
			blend_mode = "normal",
			color = Color.white
		})
		rb:child("bg"):set_color(Color(0, 0, 0):with_alpha(0.75))
		rb:child("bg"):set_alpha(1)
		
		local placer = UiPlacer:new(20, 13, 0, 8)
		local job_data = managers.job:current_job_data()
		local level_data = managers.job:current_level_data()
		local stage_data = managers.job:current_stage_data()
		local job_chain = managers.job:current_job_chain_data()
		local is_whisper_mode = managers.groupai and managers.groupai:state():whisper_mode()
		local level_tweak = tweak_data.levels[managers.job:current_level_id()]
		local narrator = level_tweak.narrator or "bain"
		local briefing_id = stage_data.briefing_id or level_data.briefing_id
		
		if stage_data then
			local job_chain = managers.job:current_job_chain_data()
			local day = managers.job:current_stage()
			local days = job_chain and #job_chain or 0
			local day_title = self._right:fine_text({
				font = tweak_data.hud_stats.objectives_font,
				font_size = tweak_data.hud_stats.loot_size,
				text = managers.localization:to_upper_text("hud_days_title", {
					DAY = day,
					DAYS = days
				}),
				
				rotation = 360
			})
			placer:add_right(day_title)
			
			if managers.crime_spree:is_active() then
				day_title:set_text(managers.localization:to_upper_text("menu_es_crime_spree_summary"))
				day_title:set_color(tweak_data.screen_colors.crime_spree_risk)
			end
			if managers.job:is_level_ghostable(managers.job:current_level_id()) then
				local ghost_color = is_whisper_mode and Color.white or tweak_data.screen_colors.important_1
				local ghost = placer:add_right(self._right:bitmap({
					texture = "guis/textures/pd2/cn_minighost",
					name = "ghost_icon",
					h = 16,
					blend_mode = "add",
					w = 16,
					color = ghost_color
				}))

				if managers.crime_spree:is_active() then
					ghost:set_alpha(0)
				end
				ghost:set_center_y(day_title:center_y())
			end
			placer:new_row(8, 1)

			local level_data = managers.job:current_level_data()

			if level_data then
				placer:add_bottom(self._right:fine_text({
					font = large_font,
					font_size = tweak_data.hud_stats.objectives_title_size,
					text = managers.skirmish:is_skirmish() and managers.localization:to_upper_text("menu_cn_skirmish") or managers.localization:to_upper_text(level_data.name_id),
					color = managers.skirmish:is_skirmish() and tweak_data.screen_colors.skirmish_color or tweak_data.screen_colors.text
				}))
				if managers.job:is_current_job_professional() then
					placer:add_right(self._right:fine_text({
						font = large_font,
						font_size = tweak_data.hud_stats.loot_size + 1,
						text = managers.localization:to_upper_text("cn_menu_pro_job"),
						color = tweak_data.screen_colors.pro_color
					}), 7, 90)
				end
			end
			
			if not managers.crime_spree:is_active() then
				placer:new_row(8, 1)
				local paygrade_header = placer:add_bottom(self._right:fine_text({
					font = medium_font,
					font_size = tweak_data.hud_stats.loot_size,
					text = managers.localization:to_upper_text("cn_menu_contract_paygrade_header"),
					color = tweak_data.screen_colors.text
				}), 0)
				placer:add_right(self._right:fine_text({
					font = medium_font,
					font_size = tweak_data.hud_stats.loot_size,
					text = "",
					color = tweak_data.screen_colors.text
				}), 3)
				
				local sx = paygrade_header:right() + 8
				local job_stars = managers.job:current_job_stars()
				local difficulty_stars = managers.job:current_difficulty_stars()
				local diff = difficulty_stars == 5 and difficulty_stars - 1 or difficulty_stars == 4 and difficulty_stars + 1 or difficulty_stars
				local job_and_diff_stars = job_stars + diff
				local hate_risk = difficulty_stars == 6 and 3 or difficulty_stars == 5 and 1 or difficulty_stars == 4 and 2 or 0
				local edge = 10

				local level_data = { 
					texture = "guis/textures/pd2/mission_briefing/difficulty_icons", 
					texture_rect = {0, 32, 32, 32}, 
					w = 16, 
					h = 16,
					alpha = 1 
				}
				for i = 1, 15 do
					local x = sx + (i - 1) * 18
					local is_risk = i > job_stars
					local star_data = level_data

					local star = self._right:bitmap(star_data)
					star:set_color(((i > (job_and_diff_stars > edge and job_and_diff_stars or edge)) and Color.green:with_alpha(0)) or ((i > job_and_diff_stars) and Color.black:with_alpha(0.5)) or ((i > job_and_diff_stars - hate_risk) and tweak_data.screen_colors.pro_color) or ((i > job_stars) and tweak_data.screen_colors.risk) or Color.white)
					star:set_x(x)
					star:set_center_y(math.round(paygrade_header:center_y()) - 1)
				end
			end
			placer:new_row(8, 1)
			placer:add_bottom(self._right:fine_text({
				font = medium_font,
				font_size = tweak_data.hud_stats.loot_size,
				text = managers.skirmish:is_skirmish() and managers.localization:to_upper_text("cn_menu_skirmish_contract_waves_header") or managers.localization:to_upper_text("menu_lobby_difficulty_title"),
				color = tweak_data.screen_colors.text
			}), 0)
			if job_data then
				local str = managers.localization:text("menu_cs_level", {
					level = managers.experience:cash_string(managers.crime_spree:server_spree_level(), "")
				})
				local job_stars = managers.job:current_job_stars()
				local difficulty_stars = managers.job:current_difficulty_stars()
				local difficulty = tweak_data.difficulties[difficulty_stars + 2] or 1
				
				local difficulty_string = managers.localization:to_upper_text(tweak_data.difficulty_name_ids[difficulty])
				local difficulty_text = self._right:fine_text({
					name = "difficulty_text",
					font = medium_font,
					font_size = tweak_data.hud_stats.loot_size,
					text = difficulty_string,
					color = difficulty_stars > 0 and tweak_data.screen_colors.risk or tweak_data.screen_colors.text
				})
				if managers.crime_spree:is_active() then
					difficulty_text:set_text(str)
					difficulty_text:set_color(tweak_data.screen_colors.crime_spree_risk)
				else
					difficulty_text:set_text(difficulty_string)
					difficulty_text:set_color(difficulty_stars > 0 and tweak_data.screen_colors.risk or tweak_data.screen_colors.text)
				end
				if Global.game_settings.one_down then
					local one_down_string = difficulty_string .. "  " .. "##" .. managers.localization:to_upper_text("menu_one_down") .. "##"
					managers.menu:color_range(
						difficulty_text,
						tweak_data.screen_colors.one_down,
						one_down_string
					)
				end

				local _, _, tw, th = difficulty_text:text_rect()

				difficulty_text:set_size(tw, th)
				placer:add_right((difficulty_text), 4)
			end

			placer:new_row(8, 0)
			
			if not managers.crime_spree:is_active() then
				local payout = managers.localization:text("hud_day_payout", {
					MONEY = managers.experience:cash_string(managers.money:get_potential_payout_from_current_stage())
				})

				placer:add_bottom(self._right:fine_text({
					keep_w = true,
					font = tweak_data.hud_stats.objectives_font,
					font_size = tweak_data.hud_stats.loot_size,
					text = payout
				}), 0)
			end
			
			placer:new_row(8, 20)
			placer:add_bottom(self._right:fine_text({
				keep_w = true,
				font = tweak_data.hud_stats.objective_desc_font,
				font_size = tweak_data.hud_stats.day_description_size + 2,
				text = managers.localization:to_upper_text("menu_description_" .. narrator)
			}), 0)
			placer:new_row(8, 0)
			local desc_panel = placer:add_bottom(self._right:panel({
				y = 0,
				h = self._right:h() / 2,
				w = self._right:w() / 1.15 - 2,
				x = 0
			}))

			local text = desc_panel:text({
				wrap = true,
				text = managers.localization:text(briefing_id),
				font = tweak_data.hud_stats.objective_desc_font,
				font_size = tweak_data.hud_stats.day_description_size,
				w = 350
			})
			managers.hud:make_fine_text(text)
			local _, _, _, h = text:text_rect()

			while h > desc_panel:h() - text:top() do
				text:set_font_size(text:font_size() * 0.99)

				_, _, _, h = text:text_rect()
			end
			placer:new_row()
			self:extended_inventory()
		end
		local extended_inventory_panel = self._right:child("extended_inventory_panel")
		if not alive(extended_inventory_panel) then
			if not managers.crime_spree:is_active() then
				self:exp_progress()
			end
		end
	end

	function HUDStatsScreen:recreate_bottom()
		if managers.crime_spree:is_active() then
			return
		end
		self._bottom:clear()
		self._bottom:bitmap({
			texture = "guis/textures/test_blur_df",
			layer = -1,
			render_template = "VertexColorTexturedBlur3D",
			valign = "grow",
			w = self._bottom:w(),
			h = self._bottom:h()
		})

		local rb = HUDBGBox_create(self._bottom, {}, {
			blend_mode = "normal",
			color = Color.white
		})

		rb:child("bg"):set_color(Color(0, 0, 0):with_alpha(0.75))
		rb:child("bg"):set_alpha(1)
		local extended_inventory_panel = self._right:child("extended_inventory_panel")
		if alive(extended_inventory_panel) then
			self:exp_progress()
		end
	end
		
	function HUDStatsScreen:update(t, dt)
		local difficulty_text = self._right:child("difficulty_text")
		local job_data = managers.job:current_job_data()
		if managers.skirmish:is_skirmish() then
			difficulty_text:set_text(managers.skirmish:is_skirmish() and tostring(managers.skirmish:current_wave_number()))
			difficulty_text:set_color(managers.skirmish:current_wave_number() >= 7 and tweak_data.screen_colors.skirmish_color or managers.skirmish:current_wave_number() >= 5 and tweak_data.screen_colors.heat_warm_color or managers.skirmish:current_wave_number() >= 3 and tweak_data.screen_colors.risk or tweak_data.screen_colors.text)
		end
				
		local is_whisper_mode = managers.groupai and managers.groupai:state():whisper_mode()
		for _, v in pairs(self._tracked_items or {}) do
			v:update_progress()
		end
		local extended_inventory_panel = self._right:child("extended_inventory_panel")
		local side = alive(extended_inventory_panel) and self._bottom or self._right
		if not alive(extended_inventory_panel) then
			self._bottom:hide()
		else
			self._bottom:show()
		end

		local profile_wrapper_panel = side:child("profile_wrapper_panel")
		if alive(profile_wrapper_panel) then
			local gain_xp_text = profile_wrapper_panel:child("gain_xp_text")
			if alive(gain_xp_text) then
				local gain_xp = managers.experience:get_xp_dissected(true, 0, true)
				local text = managers.localization:to_upper_text("hud_potential_xp", {
					XP = managers.money:add_decimal_marks_to_string(tostring(gain_xp))
				})
				gain_xp_text:set_text(text)
			end
		end
		
		local accuracy_panel = self._right:child("accuracy_panel")
		if alive(accuracy_panel) then
			accuracy_panel:child("accuracy_counter"):set_text(managers.statistics:session_hit_accuracy() .. "%")
		end
		
		local kill_panel = self._right:child("kill_panel")
		if alive(kill_panel) then
			local kill_counter = kill_panel:child("kill_counter")
			kill_counter:set_text(managers.statistics:session_total_kills() < 10 and "00" .. managers.statistics:session_total_kills() or managers.statistics:session_total_kills() < 100 and "0" .. managers.statistics:session_total_kills() or managers.statistics:session_total_kills())
			kill_counter:set_range_color(0, managers.statistics:session_total_kills() <= 0 and 3 or managers.statistics:session_total_kills() < 10 and 2 or managers.statistics:session_total_kills() < 100 and 1 or 0, tweak_data.screen_colors.text:with_alpha(0.6))
		end
		
		local pager_panel = self._right:child("pager_panel")
		if alive(pager_panel) and  managers.job:is_level_ghostable(managers.job:current_level_id()) and is_whisper_mode or lvl == "welcome_to_the_jungle_2" and is_whisper_mode then
			local pager_counter = pager_panel:child("pager_counter")
			local pagers_used = managers.groupai:state():get_nr_successful_alarm_pager_bluffs()
			local max_pagers_data = managers.player:has_category_upgrade("player", "corpse_alarm_pager_bluff") and tweak_data.player.alarm_pager.bluff_success_chance_w_skill or tweak_data.player.alarm_pager.bluff_success_chance
			local max_num_pagers = #max_pagers_data

			for i, chance in ipairs(max_pagers_data) do
				if chance == 0 then
					max_num_pagers = i - 1

					break
				end
			end
			pager_counter:set_text(pagers_used .. "/" .. max_num_pagers)
			pager_counter:set_range_color(0, 1, pagers_used >= max_num_pagers and tweak_data.screen_colors.pro_color or pagers_used == 0 and tweak_data.screen_colors.text:with_alpha(0.6) or tweak_data.screen_colors.text)
		end
	end

	function HUDStatsScreen:_create_objectives_list()
		local placer = UiPlacer:new(31, 0, 0, 8)
		
		placer:add_bottom(self._left:fine_text({
			vertical = "top",
			align = "left",
			font_size = tweak_data.hud_stats.objectives_title_size,
			font = tweak_data.hud_stats.objectives_font,
			text = managers.localization:to_upper_text("hud_objective")
		}), 13)
		placer:new_row(8, -1)

		local row_w = self._left:w() - placer:current_left() * 2

		for i, data in pairs(managers.objectives:get_active_objectives()) do
			placer:add_bottom(self._left:fine_text({
				word_wrap = true,
				wrap = true,
				align = "left",
				text = utf8.to_upper(data.text),
				font = tweak_data.hud.medium_font,
				font_size = tweak_data.hud.active_objective_title_font_size,
				w = row_w
			}))
			local objective_desc = self._left:fine_text({
				name = "objective_desc",
				word_wrap = true,
				wrap = true,
				font_size = 24,
				align = "left",
				text = "",
				font = tweak_data.hud_stats.objective_desc_font,
				w = row_w
			})
			placer:add_bottom(objective_desc)
		end
	end

	function HUDStatsScreen:_create_tracked_list(panel)
		local placer = UiPlacer:new(10, 10, 0, 8)
		local tracked = managers.achievment:get_tracked_fill()
		self._tracked_items = {}
		local placer = UiPlacer:new(0, placer:most().bottom, 0, 0)
		local with_bg = true

		for _, id in pairs(tracked) do
			local t = placer:add_row(HudTrackedAchievement:new(self._left, id, with_bg), 0, 0)

			if t._progress and t._progress.update and table.contains({
				"realtime",
				"second"
			}, t._progress.update) then
				table.insert(self._tracked_items, t)
			end

			with_bg = not with_bg
		end
	end

	function HUDStatsScreen:_create_mutators_list(panel)
		local placer = UiPlacer:new(10, 10)

		placer:add_bottom(self._left:fine_text({
			text = managers.localization:to_upper_text("menu_mutators"),
			font = large_font,
			font_size = tweak_data.hud_stats.objectives_title_size
		}))

		for i, active_mutator in ipairs(managers.mutators:active_mutators()) do
			placer:add_row(self._left:fine_text({
				text = active_mutator.mutator:name(),
				font = tweak_data.hud_stats.objectives_font,
				font_size = tweak_data.hud_stats.day_description_size
			}), 8, 2)
		end
	end

	function HUDStatsScreen:_update_stats_screen_loot(loot_wrapper_panel)
		local mandatory_bags_data = managers.loot:get_mandatory_bags_data()
		local secured_amount = managers.loot:get_secured_mandatory_bags_amount()
		local x = nil
		local bag_texture, bag_rect = tweak_data.hud_icons:get_icon_data("bag_icon")
		local mission_amount = managers.loot:get_secured_mandatory_bags_amount()
		local mission_vis = mission_amount > 0 or secured_amount > 0
		local mission_bags_panel = loot_wrapper_panel:child("mission_bags_panel")

		mission_bags_panel:clear()

		if mandatory_bags_data and mandatory_bags_data.amount then
			if mandatory_bags_data.amount > 18 then
				local x = 0
				local bag = mission_bags_panel:bitmap({
					name = "bag1",
					alpha = 0.25,
					texture = bag_texture,
					texture_rect = bag_rect,
					x = x
				})
				local bag_text = mission_bags_panel:text({
					name = "bag_amount",
					text = " x" .. tostring(mandatory_bags_data.amount - mission_amount),
					font_size = tweak_data.menu.pd2_small_font_size,
					font = tweak_data.menu.pd2_small_font
				})

				managers.hud:make_fine_text(bag_text)
				bag_text:set_left(bag:right())
				bag_text:set_center_y(math.round(bag:center_y()))

				local bag_gotten = mission_bags_panel:bitmap({
					name = "bag1",
					texture = bag_texture,
					texture_rect = bag_rect,
					x = x
				})
				local bag_text_gotten = mission_bags_panel:text({
					name = "bag_amount",
					text = " x" .. tostring(mission_amount),
					font_size = tweak_data.menu.pd2_small_font_size,
					font = tweak_data.menu.pd2_small_font
				})

				managers.hud:make_fine_text(bag_text_gotten)
				bag_gotten:set_left(bag_text:right() + 10)
				bag_text_gotten:set_left(bag_gotten:right())
				bag_text_gotten:set_center_y(math.round(bag_gotten:center_y()))
			else
				local x = 0
				local y = 0

				for i = 1, mandatory_bags_data.amount, 1 do
					local alpha = i <= secured_amount and 1 or 0.25

					mission_bags_panel:bitmap({
						name = "bag" .. i,
						texture = bag_texture,
						texture_rect = bag_rect,
						x = x,
						y = y,
						alpha = alpha
					})

					x = x + 32

					if x >= 288 then
						x = 0
						y = 22
					end
				end
			end
		end

		local bonus_amount = managers.loot:get_secured_bonus_bags_amount()
		local bonus_vis = bonus_amount > 0 or secured_amount > 0 or managers.loot:get_secured_bonus_bags_amount(true) > 0
		local bonus_bags_title = loot_wrapper_panel:child("bonus_bags_title")

		bonus_bags_title:set_alpha(bonus_vis and 1 or 0.5)

		local bonus_bags_panel = loot_wrapper_panel:child("bonus_bags_panel")

		bonus_bags_panel:clear()

		if bonus_amount >= 10 then
			local x = 0
			local bag = bonus_bags_panel:bitmap({
				name = "bag1",
				texture = bag_texture,
				texture_rect = bag_rect,
				x = x
			})
			local bag_text = bonus_bags_panel:text({
				name = "bag_amount",
				text = " x" .. tostring(bonus_amount),
				font_size = tweak_data.menu.pd2_small_font_size,
				font = tweak_data.menu.pd2_small_font
			})

			managers.hud:make_fine_text(bag_text)
			bag_text:set_left(bag:right())
			bag_text:set_center_y(math.round(bag:center_y()))
		else
			for i = 1, bonus_amount, 1 do
				local x = (i - 1) * 32

				bonus_bags_panel:bitmap({
					name = "bag" .. i,
					texture = bag_texture,
					texture_rect = bag_rect,
					x = x
				})
			end
		end

		local mandatory_cash = managers.money:get_secured_mandatory_bags_money()
		local mission_bags_payout = loot_wrapper_panel:child("mission_bags_payout")

		mission_bags_payout:set_visible(mission_vis)
		mission_bags_payout:set_text(utf8.to_upper(managers.localization:text("hud_bonus_bags_payout", {
			MONEY = managers.experience:cash_string(mandatory_cash)
		})))

		local bonus_cash = managers.money:get_secured_bonus_bags_money()
		local bonus_bags_payout = loot_wrapper_panel:child("bonus_bags_payout")

		bonus_bags_payout:set_visible(bonus_vis)
		bonus_bags_payout:set_text(utf8.to_upper(managers.localization:text("hud_bonus_bags_payout", {
			MONEY = managers.experience:cash_string(bonus_cash or 0)
		})))

		local instant_cash = managers.loot:get_real_total_small_loot_value()
		local instant_vis = instant_cash > 0
		local instant_cash_title = loot_wrapper_panel:child("instant_cash_title")

		instant_cash_title:set_alpha(instant_vis and 1 or 0.5)

		local instant_cash_text = loot_wrapper_panel:child("instant_cash_text")

		instant_cash_text:set_text(utf8.to_upper(managers.experience:cash_string(instant_cash)))
		instant_cash_text:set_alpha(instant_vis and 1 or 0.5)
	end

	function HUDStatsScreen:extended_inventory()
		local lvl = Global.game_settings and Global.game_settings.level_id
		local ach = managers.achievment.achievments
		local accuracy_requirements = ach.flat_5.forced and lvl == "flat" or ach.ovk_7.forced or ach.gage4_5.forced
		local kill_requirements = ach.ovk_7.forced or ach.gage4_5.forced
		local is_whisper_mode = managers.groupai and managers.groupai:state():whisper_mode()
		local extended = UiPlacer:new(36, (self._right:h() / 1.05) + 19, 0, 8)
		extended:new_row(0, 0)
		
		local extended_inventory_panel
		local accuracy_panel
		local kill_panel
		local pager_panel
		local body_bags_panel
		
		if _G.OriginalPackOptions.settings.Anlways_Show_Body_Bags or is_whisper_mode then
			body_bags_panel = extended:add_top(self._right:panel({name = "body_bags_panel", h = 19, w = self._right:w() / 1.2}))
		end
		
		if managers.job:is_level_ghostable(managers.job:current_level_id()) and is_whisper_mode or lvl == "welcome_to_the_jungle_2" and is_whisper_mode then
			pager_panel = extended:add_top(self._right:panel({name = "pager_panel", h = 19, w = self._right:w() / 1.2}), 5)
		end
		
		if _G.OriginalPackOptions.settings.Anlways_Show_Kills or kill_requirements then
			kill_panel = extended:add_top(self._right:panel({name = "kill_panel", h = 19, w = self._right:w() / 1.2}), 5)
		end
		
		if _G.OriginalPackOptions.settings.Anlways_Show_Accuracy or accuracy_requirements then
			accuracy_panel = extended:add_top(self._right:panel({name = "accuracy_panel", h = 19, w = self._right:w() / 1.2}), 5)
		end
		
		if alive(body_bags_panel) or alive(pager_panel) or alive(kill_panel) or alive(accuracy_panel) then
			extended_inventory_panel = extended:add_top(self._right:panel({name = "extended_inventory_panel", h = 26, w = self._right:w() / 1.2}))
			extended_inventory_panel:text({
				x = -1,
				align = "right",
				text = managers.localization:to_upper_text("hud_extended_inventory"),
				font_size = tweak_data.hud_stats.loot_title_size,
				font = tweak_data.hud_stats.objectives_font
			})
		end
		
		if alive(accuracy_panel) then
			local accuracy_title = accuracy_panel:text({
				align = "right",
				x = -53,
				text = managers.localization:to_upper_text("menu_accuracy"),
				font_size = tweak_data.hud_stats.loot_title_size - 6,
				font = tweak_data.hud_stats.objectives_font
			})
			accuracy_panel:bitmap({
				rotation = 360,
				x = accuracy_panel:w() - 44,
				w = 19,
				h = 19,
				texture = "guis/textures/pd2/skilltree/op_icons_atlas",
				texture_rect = {
					424,
					356,
					20,
					20
				}
			})
			local accuracy_counter = accuracy_panel:text({
				rotation = 360,
				align = "center",
				x = (accuracy_panel:w() / 2) - 6,
				text = "",
				name = "accuracy_counter",
				font_size = 20,
				alpha = 1,
				font = "fonts/font_medium_mf",
				color = tweak_data.screen_colors.text
			})
		end
		
		if alive(kill_panel) then
			local kill_title = kill_panel:text({
				align = "right",
				x = -53,
				text = managers.localization:to_upper_text("menu_kills"),
				font_size = tweak_data.hud_stats.loot_title_size - 6,
				font = tweak_data.hud_stats.objectives_font
			})
			kill_panel:bitmap({
				rotation = 360,
				x = kill_panel:w() - 44,
				w = 21,
				h = 21,
				texture = "guis/textures/pd2/hud_difficultymarkers",
				texture_rect = {
					0,
					0,
					32,
					32
				}
			})
			local kill_counter = kill_panel:text({
				rotation = 360,
				align = "center",
				x = (kill_panel:w() / 2) - 9,
				text = "",
				name = "kill_counter",
				font_size = 20,
				alpha = 1,
				font = "fonts/font_medium_mf",
				color = tweak_data.screen_colors.text
			})
		end
		
		if alive(pager_panel) then
			local pagers_texture, pagers_rect = tweak_data.hud_icons:get_icon_data("pagers_used")
			local pager_title = pager_panel:text({
				align = "right",
				x = -53,
				text = managers.localization:to_upper_text("hud_stats_pagers_used"),
				font_size = tweak_data.hud_stats.loot_title_size - 6,
				font = tweak_data.hud_stats.objectives_font
			})
			local pager_icon = pager_panel:bitmap({
				rotation = 360,
				x = pager_panel:w() - 44,
				w = 21,
				h = 20,
				texture = pagers_texture,
				texture_rect = pagers_rect
			})
			if managers.player:has_category_upgrade("player", "corpse_alarm_pager_bluff") then
				pager_icon:set_color(tweak_data.screen_colors.skill_color)
			end
			local pager_counter = pager_panel:text({
				x = 2,
				rotation = 360,
				align = "right",
				text = "",
				name = "pager_counter",
				font_size = 22,
				alpha = 1,
				font = "fonts/font_medium_mf",
				color = tweak_data.screen_colors.text
			})
		end
		
		if alive(body_bags_panel) then
			local body_texture, body_rect = tweak_data.hud_icons:get_icon_data("equipment_body_bag")
			local body_bags = managers.player:get_body_bags_amount()
			local body_bags_title = body_bags_panel:text({
				align = "right",
				x = -53,
				text = managers.localization:to_upper_text("hud_body_bags"),
				font_size = tweak_data.hud_stats.loot_title_size - 6,
				font = tweak_data.hud_stats.objectives_font
			})
			body_bags_panel:bitmap({
				rotation = 360,
				x = body_bags_panel:w() - 44,
				w = 21,
				h = 20,
				texture = body_texture,
				texture_rect = body_rect
			})
			local body_bags_count = body_bags_panel:text({
				align = "right",
				text = 10 >= body_bags and "0" .. body_bags,
				name = "body_bags_count",
				font_size = 22,
				alpha = 1,
				font = "fonts/font_medium_mf",
				color = tweak_data.screen_colors.text
			})
			body_bags_count:set_range_color(0, body_bags >= 1 and 1 or 2, body_bags < 10 and tweak_data.screen_colors.text:with_alpha(0.6) or tweak_data.screen_colors.text:with_alpha(0))
		end
	end

	function HUDStatsScreen:exp_progress()
		local extended_inventory_panel = self._right:child("extended_inventory_panel")
		local side = alive(extended_inventory_panel) and self._bottom or self._right
		
		local offset = alive(extended_inventory_panel) and 10 or 20
		local profile_wrapper_panel = side:panel({name = "profile_wrapper_panel", x = offset, y = -14})
		
		local next_level_data = managers.experience:next_level_data() or {}
		local bg_ring = profile_wrapper_panel:bitmap({
			texture = "guis/textures/pd2/level_ring_small",
			w = 64,
			h = 64,
			alpha = 0.4,
			color = Color.black
		})
		local exp_ring = profile_wrapper_panel:bitmap({
			texture = "guis/textures/pd2/level_ring_small",
			h = 64,
			render_template = "VertexColorTexturedRadial",
			w = 64,
			blend_mode = "add",
			rotation = 360,
			layer = 1,
			color = Color((next_level_data.current_points or 1) / (next_level_data.points or 1), 1, 1)
		})

		bg_ring:set_bottom(profile_wrapper_panel:h())
		exp_ring:set_bottom(profile_wrapper_panel:h())

		local gain_xp = managers.experience:get_xp_dissected(true, 0, true)
		local at_max_level = managers.experience:current_level() == managers.experience:level_cap()
		local can_lvl_up = not at_max_level and gain_xp >= next_level_data.points - next_level_data.current_points
		local progress = (next_level_data.current_points or 1) / (next_level_data.points or 1)
		local gain_progress = (gain_xp or 1) / (next_level_data.points or 1)
		local exp_gain_ring = profile_wrapper_panel:bitmap({
			texture = "guis/textures/pd2/level_ring_potential_small",
			h = 64,
			render_template = "VertexColorTexturedRadial",
			w = 64,
			blend_mode = "normal",
			rotation = 360,
			layer = 2,
			color = Color(gain_progress, 1, 0)
		})

		exp_gain_ring:rotate(360 * progress)
		exp_gain_ring:set_center(exp_ring:center())

		local level_text = profile_wrapper_panel:text({
			name = "level_text",
			font = tweak_data.menu.pd2_medium_font,
			font_size = tweak_data.hud_stats.day_description_size,
			text = tostring(managers.experience:current_level()),
			color = tweak_data.screen_colors.text
		})

		managers.hud:make_fine_text(level_text)
		level_text:set_center(exp_ring:center())

		if at_max_level then
			local text = managers.localization:to_upper_text("hud_at_max_level")
			local at_max_level_text = profile_wrapper_panel:text({
				name = "at_max_level_text",
				text = text,
				font_size = tweak_data.menu.pd2_small_font_size,
				font = tweak_data.menu.pd2_small_font,
				color = tweak_data.hud_stats.potential_xp_color
			})

			managers.hud:make_fine_text(at_max_level_text)
			at_max_level_text:set_left(math.round(exp_ring:right() + 4))
			at_max_level_text:set_center_y(math.round(exp_ring:center_y()) + 0)
		else
			local next_level_in = profile_wrapper_panel:text({
				text = "",
				name = "next_level_in",
				font_size = tweak_data.menu.pd2_small_font_size,
				font = tweak_data.menu.pd2_small_font,
				color = tweak_data.screen_colors.text
			})
			local points = next_level_data.points - next_level_data.current_points

			next_level_in:set_text(utf8.to_upper(managers.localization:text("menu_es_next_level") .. " " .. managers.money:add_decimal_marks_to_string(tostring(points))))
			managers.hud:make_fine_text(next_level_in)
			next_level_in:set_left(math.round(exp_ring:right() + 4))
			next_level_in:set_center_y(math.round(exp_ring:center_y()) - 20)
			local text = managers.localization:to_upper_text("hud_potential_xp", {
				XP = managers.money:add_decimal_marks_to_string(tostring(gain_xp))
			})
			local gain_xp_text = profile_wrapper_panel:text({
				name = "gain_xp_text",
				text = text .. "								",
				font_size = tweak_data.menu.pd2_small_font_size,
				font = tweak_data.menu.pd2_small_font,
				color = tweak_data.hud_stats.potential_xp_color
			})

			managers.hud:make_fine_text(gain_xp_text)
			gain_xp_text:set_left(math.round(exp_ring:right() + 4))
			gain_xp_text:set_center_y(math.round(exp_ring:center_y()) + 0)

			if can_lvl_up then
				local text = managers.localization:to_upper_text("hud_potential_level_up")
				local potential_level_up_text = profile_wrapper_panel:text({
					vertical = "center",
					name = "potential_level_up_text",
					blend_mode = "normal",
					align = "left",
					layer = 3,
					visible = can_lvl_up,
					text = text,
					font_size = tweak_data.menu.pd2_small_font_size,
					font = tweak_data.menu.pd2_small_font,
					color = tweak_data.hud_stats.potential_xp_color
				})

				managers.hud:make_fine_text(potential_level_up_text)
				potential_level_up_text:set_left(math.round(exp_ring:right() + 4))
				potential_level_up_text:set_center_y(math.round(exp_ring:center_y()) + 20)
				potential_level_up_text:animate(callback(self, self, "_animate_text_pulse"), exp_gain_ring, exp_ring, bg_ring)
			end
		end

		local track_text = side:fine_text({
			text = managers.localization:to_upper_text("menu_es_playing_track") .. " " .. managers.music:current_track_string(),
			font_size = tweak_data.menu.pd2_small_font_size,
			font = tweak_data.menu.pd2_small_font,
			color = tweak_data.screen_colors.text
		})
		track_text:set_leftbottom(offset + 4, exp_ring:top() - 28)
	end

	local original_init = HUDStatsScreen.init
	function HUDStatsScreen:init(...)
		original_init(self, ...)
		self._full_hud_panel = managers.hud:script(managers.hud.STATS_SCREEN_FULLSCREEN).panel
		self._bottom = ExtendedPanel:new(self, {
			w = 407,
			h = 127
		})
		self._bottom:set_center_x(self._full_hud_panel:center_x())
		self._bottom:set_bottom(self._full_hud_panel:bottom() - 10)
		self:recreate_bottom()
	end

	function HUDStatsScreen:show()
		self:recreate_left()
		self:recreate_right()
		self:recreate_bottom()

		local safe = managers.hud.STATS_SCREEN_SAFERECT
		local full = managers.hud.STATS_SCREEN_FULLSCREEN

		managers.hud:show(full)

		local left_panel = self._left
		local right_panel = self._right
		local bottom_panel = self._bottom

		left_panel:stop()

		local teammates_panel = managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2).panel:child("teammates_panel")
		local objectives_panel = managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2).panel:child("objectives_panel")
		local chat_panel = managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2).panel:child("chat_panel")

		left_panel:animate(callback(self, self, "_animate_show_stats_left_panel"), right_panel, bottom_panel, teammates_panel, objectives_panel, chat_panel)
	end

	local original_init = HUDStatsScreen._animate_show_stats_left_panel
	function HUDStatsScreen:_animate_show_stats_left_panel(...)
		original_init(self, ...)
		self._full_hud_panel = managers.hud:script(managers.hud.STATS_SCREEN_FULLSCREEN).panel
		self._bottom:set_center_x(self._full_hud_panel:center_x())
		self._bottom:set_bottom(self._full_hud_panel:bottom() - 10)
	end

	function HUDStatsScreen:bottom()
		self._full_hud_panel = managers.hud:script(managers.hud.STATS_SCREEN_FULLSCREEN).panel
		self._bottom:set_center_x(self._full_hud_panel:center_x())
		self._bottom:set_bottom(self._full_hud_panel:bottom() - 10)
	end

	function HUDStatsScreen:_animate_text_pulse(text, exp_gain_ring, exp_ring, bg_ring)
		local t = 0
		local c = text:color()
		local w, h = text:size()
		local cx, cy = text:center()
		local ecx, ecy = exp_gain_ring:center()

		while true do
			local dt = coroutine.yield()
			t = t + dt
			local alpha = math.abs(math.sin(t * 180 * 1))

			text:set_size(math.lerp(w * 2, w, alpha), math.lerp(h * 2, h, alpha))
			text:set_font_size(math.lerp(25, tweak_data.menu.pd2_small_font_size, alpha * alpha))
			text:set_center_y(cy)
			exp_gain_ring:set_size(math.lerp(72, 64, alpha * alpha), math.lerp(72, 64, alpha * alpha))
			exp_gain_ring:set_center(ecx, ecy)
			exp_ring:set_size(exp_gain_ring:size())
			exp_ring:set_center(exp_gain_ring:center())
			bg_ring:set_size(exp_gain_ring:size())
			bg_ring:set_center(exp_gain_ring:center())
		end
	end

	function HUDStatsScreen:on_ext_inventory_changed()
		self:recreate_left()
		self:recreate_right()
		self:recreate_bottom()
	end
end
if string.lower(RequiredScript) == "lib/managers/hud/hudstageendscreen" then
	local data = HUDStageEndScreen.init
	function HUDStageEndScreen:init(hud, workspace)
		data(self, hud, workspace)
		if not managers.crime_spree:is_active() then
			self._foreground_layer_safe:child("pg_text"):set_visible(false)
			self._paygrade_panel:clear()
			
			local filled_star_rect = {0, 32, 32, 32}
			local num_stars = 0
			local x = 0
			local y = 4
			local risk_color = tweak_data.screen_colors.risk
			local job_stars = managers.job:current_job_stars()
			local difficulty_stars = managers.job:current_difficulty_stars()
			local diff = difficulty_stars == 5 and difficulty_stars - 1 or difficulty_stars == 4 and difficulty_stars + 1 or difficulty_stars
			local job_and_diff_stars = job_stars + diff
			local hate_risk = difficulty_stars == 6 and 3 or difficulty_stars == 5 and 1 or difficulty_stars == 4 and 2 or 0

			local pg_text = self._foreground_layer_safe:text({
				name = "pg_text",
				vertical = "center",
				h = 32,
				align = "right",
				text = utf8.to_upper(managers.localization:text("cn_menu_contract_paygrade_header")),
				y = 60,
				font_size = tweak_data.menu.pd2_medium_font_size,
				font = tweak_data.menu.pd2_medium_font,
				color = tweak_data.screen_colors.text
			})
			
			for i = 1, job_and_diff_stars do
				local is_risk = i > job_stars
				
				local star = self._paygrade_panel:bitmap({
					texture = "guis/textures/pd2/"..(hate_risk > 1 and i == hate_risk and "risklevel_deathwish_easywish_blackscreen" or i == hate_risk - 2 and "risklevel_deathwish_sm_blackscreen" or i <= hate_risk and "risklevel_deathwish_blackscreen" or i <= diff and "risklevel_blackscreen" or "mission_briefing/difficulty_icons"),
					texture_rect = i > diff and filled_star_rect,
					w = i > diff and 23 or 32,
					h = i > diff and 23 or 32,
					color = tweak_data.screen_colors.text,
					rotation = 360,
					alpha = 1
				})
				star:set_position(x + 4 * 35, i <= diff and y - 2.5 or y + 2)
				star:set_color((i > diff) and Color.white or risk_color)
				local pos = x - star:w()
				x = i == diff and pos + 8 or i <= diff and pos + 4 or pos - 4
				num_stars = num_stars + 1
				pg_text:set_righttop(self._paygrade_panel:right() - 20 - (diff * 28) - (job_stars * 27), self._paygrade_panel:top() + 3)
			end
		end
	end
end
if string.lower(RequiredScript) == "lib/managers/hud/hudblackscreen" then
	function HUDBlackScreen:_set_job_data()
		if not managers.job:has_active_job() then
			return
		end

		local job_panel = self._blackscreen_panel:panel({
			y = 0,
			name = "job_panel",
			halign = "grow",
			visible = true,
			layer = 1,
			valign = "grow"
		})
		local risk_panel = job_panel:panel({})
		local last_risk_level = nil
		local blackscreen_risk_textures = tweak_data.gui.blackscreen_risk_textures

		local difficulty_stars = managers.job:current_difficulty_stars()
		local diff = difficulty_stars == 5 and difficulty_stars - 1 or difficulty_stars == 4 and difficulty_stars + 1 or difficulty_stars
		for i = 1, diff, 1 do
			local difficulty_name = tweak_data.difficulties[i + 2]
			local texture = managers.job:current_difficulty_stars() == 5 and i == 4 and blackscreen_risk_textures["overkill_290"] or blackscreen_risk_textures[difficulty_name] or "guis/textures/pd2/risklevel_blackscreen"
			last_risk_level = risk_panel:bitmap({
				texture = texture,
				color = tweak_data.screen_colors.risk
			})

			last_risk_level:move((i - 1) * last_risk_level:w(), 0)
		end

		if last_risk_level then
			risk_panel:set_size(last_risk_level:right(), last_risk_level:bottom())
			risk_panel:set_center(job_panel:w() / 2, job_panel:h() / 2)
			risk_panel:set_position(math.round(risk_panel:x()), math.round(risk_panel:y()))
			local risk_text = job_panel:text({
				vertical = "bottom",
				align = "center",
				text = managers.localization:to_upper_text(tweak_data.difficulty_name_id),
				font = tweak_data.menu.pd2_large_font,
				font_size = tweak_data.menu.pd2_small_large_size,
				color = tweak_data.screen_colors.risk
			})

			risk_text:set_bottom(risk_panel:top())
			risk_text:set_center_x(risk_panel:center_x())
		else
			risk_panel:set_size(64, 64)
			risk_panel:set_center_x(job_panel:w() / 2)
			risk_panel:set_bottom(job_panel:h() / 2)
			risk_panel:set_position(math.round(risk_panel:x()), math.round(risk_panel:y()))
		end
	end
end
if string.lower(RequiredScript) == "lib/managers/hud/hudmissionbriefing" then
	local data = HUDMissionBriefing.init
	function HUDMissionBriefing:init(hud, workspace)
		data(self, hud, workspace)
		if not managers.crime_spree:is_active() then
			self._foreground_layer_one:child("pg_text"):set_visible(false)
			self._foreground_layer_one:child("job_overview_text"):set_visible(false)
			self._paygrade_panel:clear()
			
			local filled_star_rect = { 0, 32, 32, 32 }
			local num_stars = 0
			local x = 0
			local y = 4
			local risk_color = tweak_data.screen_colors.risk
			local job_stars = managers.job:current_job_stars()
			local difficulty_stars = managers.job:current_difficulty_stars()
			local diff = difficulty_stars == 5 and difficulty_stars - 1 or difficulty_stars == 4 and difficulty_stars + 1 or difficulty_stars
			local job_and_diff_stars = job_stars + diff
			local hate_risk = difficulty_stars == 6 and 3 or difficulty_stars == 5 and 1 or difficulty_stars == 4 and 2 or 0

			local pg_text = self._foreground_layer_one:text({
				name = "pg_text",
				vertical = "center",
				h = 32,
				align = "right",
				text = utf8.to_upper(managers.localization:text("cn_menu_contract_paygrade_header")),
				y = 60,
				font_size = tweak_data.menu.pd2_medium_font_size,
				font = tweak_data.menu.pd2_medium_font,
				color = tweak_data.screen_colors.text
			})
			
			for i = 1, job_and_diff_stars do
				local is_risk = i > job_stars
				
				local star = self._paygrade_panel:bitmap({
					texture = "guis/textures/pd2/"..(hate_risk > 1 and i == hate_risk and "risklevel_deathwish_easywish_blackscreen" or i == hate_risk - 2 and "risklevel_deathwish_sm_blackscreen" or i <= hate_risk and "risklevel_deathwish_blackscreen" or i <= diff and "risklevel_blackscreen" or "mission_briefing/difficulty_icons"),
					texture_rect = i > diff and filled_star_rect,
					w = i > diff and 23 or 32,
					h = i > diff and 23 or 32,
					color = tweak_data.screen_colors.text,
					rotation = 360,
					alpha = 1
				})
				star:set_position(x + 4 * 35, i <= diff and y - 2.5 or y + 2)
				star:set_color((i > diff) and Color.white or risk_color)
				local pos = x - star:w()
				x = i == diff and pos + 8 or i <= diff and pos + 4 or pos - 4
				num_stars = num_stars + 1
				pg_text:set_righttop(self._paygrade_panel:right() - 20 - (diff * 28) - (job_stars * 27), self._paygrade_panel:top() + 3)
			end
			
			local job_overview_text = self._foreground_layer_one:text({
				name = "job_overview_text",
				vertical = "bottom",
				align = "left",
				text = utf8.to_upper(managers.localization:text("menu_job_overview")),
				h = tweak_data.menu.pd2_medium_font_size,
				font_size = tweak_data.menu.pd2_medium_font_size,
				font = tweak_data.menu.pd2_medium_font,
				color = tweak_data.screen_colors.text
			})
			local _, _, w, h = job_overview_text:text_rect()

			job_overview_text:set_size(w, h)
			job_overview_text:set_leftbottom(self._job_schedule_panel:left(), pg_text:bottom() - ((Global.game_settings.one_down and job_and_diff_stars > 10 or job_and_diff_stars > 13) and 35 or 0))
			job_overview_text:set_y(math.round(job_overview_text:y()))
			
			if Global.game_settings.one_down then
				local one_down_text = self._foreground_layer_one:child("one_down_text")
				one_down_text:set_lefttop(job_overview_text:right() + 10, job_overview_text:top())
			end
		end
	end
end
if string.lower(RequiredScript) == "lib/managers/menu/ingamecontractgui" then
	function IngameContractGui:init(ws, node)
		local padding = SystemInfo:platform() == Idstring("WIN32") and 10 or 5
		self._panel = ws:panel():panel({
			w = math.round(ws:panel():w() * 0.6),
			h = math.round(ws:panel():h() * 1)
		})

		self._panel:set_y(CoreMenuRenderer.Renderer.border_height + tweak_data.menu.pd2_large_font_size - 5)
		self._panel:grow(0, -(self._panel:y() + tweak_data.menu.pd2_medium_font_size))

		self._node = node
		local job_data = managers.job:current_job_data()
		local job_chain = managers.job:current_job_chain_data()

		if job_data and managers.job:current_job_id() == "safehouse" and Global.mission_manager.saved_job_values.playedSafeHouseBefore then
			self._panel:set_visible(false)
		end

		local contract_text = self._panel:text({
			text = "",
			vertical = "bottom",
			rotation = 360,
			layer = 1,
			font = tweak_data.menu.pd2_large_font,
			font_size = tweak_data.menu.pd2_large_font_size,
			color = tweak_data.screen_colors.text
		})

		contract_text:set_text(self:get_text("cn_menu_contract_header") .. " " .. (job_data and self:get_text(job_data.name_id) or ""))
		contract_text:set_bottom(5)

		local text_panel = self._panel:panel({
			layer = 1,
			w = self._panel:w() - padding * 2,
			h = self._panel:h() - padding * 2
		})

		text_panel:set_left(padding)
		text_panel:set_top(padding)

		local briefing_title = text_panel:text({
			text = "",
			font = tweak_data.menu.pd2_medium_font,
			font_size = tweak_data.menu.pd2_medium_font_size,
			color = tweak_data.screen_colors.text
		})

		briefing_title:set_text(self:get_text("menu_briefing"))
		managers.hud:make_fine_text(briefing_title)

		local font_size = tweak_data.menu.pd2_small_font_size
		local text = job_data and managers.localization:text(job_data.briefing_id) or ""
		local briefing_description = text_panel:text({
			name = "briefing_description",
			vertical = "top",
			h = 128,
			wrap = true,
			align = "left",
			word_wrap = true,
			text = text,
			font = tweak_data.menu.pd2_small_font,
			font_size = font_size,
			color = tweak_data.screen_colors.text
		})
		local _, _, _, h = briefing_description:text_rect()

		briefing_description:set_h(h)
		briefing_description:set_top(briefing_title:bottom())

		local is_job_ghostable = managers.job:is_job_ghostable(managers.job:current_job_id())

		if is_job_ghostable then
			local min_ghost_bonus, max_ghost_bonus = managers.job:get_job_ghost_bonus(managers.job:current_job_id())
			local min_ghost = math.round(min_ghost_bonus * 100)
			local max_ghost = math.round(max_ghost_bonus * 100)
			local min_string, max_string = nil

			if min_ghost == 0 and min_ghost_bonus ~= 0 then
				min_string = string.format("%0.2f", math.abs(min_ghost_bonus * 100))
			else
				min_string = tostring(math.abs(min_ghost))
			end

			if max_ghost == 0 and max_ghost_bonus ~= 0 then
				max_string = string.format("%0.2f", math.abs(max_ghost_bonus * 100))
			else
				max_string = tostring(math.abs(max_ghost))
			end

			local ghost_bonus_string = min_ghost_bonus == max_ghost_bonus and min_string or min_string .. "-" .. max_string
			local ghostable_text = text_panel:text({
				blend_mode = "add",
				vertical = "top",
				wrap = true,
				align = "left",
				wrap_word = true,
				text = managers.localization:to_upper_text("menu_ghostable_job", {
					bonus = ghost_bonus_string
				}),
				font_size = tweak_data.menu.pd2_small_font_size,
				font = tweak_data.menu.pd2_small_font,
				color = tweak_data.screen_colors.ghost_color
			})

			ghostable_text:set_position(briefing_description:x(), briefing_description:bottom() + padding)
			managers.hud:make_fine_text(ghostable_text)
		end

		local modifiers_text = text_panel:text({
			name = "modifiers_text",
			align = "left",
			vertical = "top",
			text = managers.localization:to_upper_text("menu_cn_modifiers"),
			font = tweak_data.menu.pd2_small_font,
			font_size = font_size,
			color = tweak_data.screen_colors.text
		})

		managers.hud:make_fine_text(modifiers_text)
		modifiers_text:set_bottom(text_panel:h() * 0.5)
		
		local modifiers_amount = 0
		local next_top = modifiers_text:bottom()
		local one_down_warning_text = nil
		local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
		local difficulty_index = tweak_data:difficulty_to_index(difficulty)
		local current_buff = difficulty_index > 5 and 10 or 5
		
		if Global.game_settings.one_down then
			local additional_desc = ""
			if managers.skirmish:current_wave_number() > 0 then
				additional_desc = ". " .. managers.localization:to_upper_text("menu_one_down_additional") .. " " .. managers.skirmish:current_wave_number() .. ". " .. managers.localization:to_upper_text("menu_one_down_additional_2") .. " " .. managers.skirmish:current_wave_number() * current_buff .. "%"
			end
			one_down_warning_text = text_panel:text({
				name = "one_down_warning_text",
				text = managers.localization:to_upper_text("menu_one_down") .. additional_desc,
				font = tweak_data.menu.pd2_small_font,
				font_size = tweak_data.menu.pd2_small_font_size,
				color = tweak_data.screen_colors.pro_color
			})

			managers.hud:make_fine_text(one_down_warning_text)
			one_down_warning_text:set_left(10)
			modifiers_amount = modifiers_amount + 1
		end
	
		local job_heat_mul = managers.job:get_job_heat_multipliers(managers.job:current_job_id()) - 1
		local job_heat = math.round(job_heat_mul * 100)
		local job_heat_string = tostring(math.abs(job_heat))
		local is_job_heated = job_heat ~= 0 or job_heat_mul ~= 0

		if job_heat == 0 and job_heat_mul ~= 0 then
			job_heat_string = string.format("%0.2f", math.abs(job_heat_mul * 100))
		end

		local ghost_bonus_mul = managers.job:get_ghost_bonus()
		local job_ghost = math.round(ghost_bonus_mul * 100)
		local job_ghost_string = tostring(math.abs(job_ghost))
		local has_ghost_bonus = managers.job:has_ghost_bonus()

		if job_ghost == 0 and ghost_bonus_mul ~= 0 then
			job_ghost_string = string.format("%0.2f", math.abs(ghost_bonus_mul * 100))
		end

		local ghost_warning_text = nil

		if has_ghost_bonus then
			local ghost_color = tweak_data.screen_colors.ghost_color
			ghost_warning_text = text_panel:text({
				name = "ghost_color_warning_text",
				vertical = "top",
				word_wrap = true,
				wrap = true,
				align = "left",
				blend_mode = "normal",
				text = managers.localization:to_upper_text("menu_ghost_bonus", {
					exp_bonus = job_ghost_string
				}),
				font = tweak_data.menu.pd2_small_font,
				font_size = tweak_data.menu.pd2_small_font_size,
				color = ghost_color
			})

			managers.hud:make_fine_text(ghost_warning_text)
			ghost_warning_text:set_left(10)
			modifiers_amount = modifiers_amount + 1
		end

		local heat_warning_text = nil
		local heat_color = managers.job:get_job_heat_color(managers.job:current_job_id())

		if is_job_heated then
			local job_heat_text_id = "menu_heat_" .. (job_heat_mul > 0 and "warm" or job_heat_mul < 0 and "cold" or "ok")
			heat_warning_text = text_panel:text({
				name = "heat_warning_text",
				vertical = "top",
				word_wrap = true,
				wrap = true,
				align = "left",
				text = managers.localization:to_upper_text(job_heat_text_id, {
					job_heat = job_heat_string
				}),
				font = tweak_data.menu.pd2_small_font,
				font_size = font_size,
				color = heat_color
			})

			managers.hud:make_fine_text(heat_warning_text)
			heat_warning_text:set_left(10)
			modifiers_amount = modifiers_amount + 1
		end

		local pro_warning_text = nil

		if managers.job:is_current_job_professional() then
			pro_warning_text = text_panel:text({
				name = "pro_warning_text",
				vertical = "top",
				h = 128,
				wrap = true,
				align = "left",
				word_wrap = true,
				text = self:get_text("menu_pro_warning"),
				font = tweak_data.menu.pd2_small_font,
				font_size = font_size,
				color = tweak_data.screen_colors.pro_color
			})

			managers.hud:make_fine_text(pro_warning_text)
			pro_warning_text:set_h(pro_warning_text:h())
			pro_warning_text:set_left(10)
			modifiers_amount = modifiers_amount + 1
		end
		local killed_civ_text = nil
		
		if managers.statistics:session_total_civilian_kills() > 0 then
			killed_civ_text = text_panel:text({
				name = "killed_civ_text",
				vertical = "top",
				h = 128,
				wrap = true,
				align = "left",
				word_wrap = true,
				text = self:get_text("menu_killed_civs") .. managers.experience:new_xp("killed_civs") .. "%.",
				font = tweak_data.menu.pd2_small_font,
				font_size = font_size,
				color = tweak_data.screen_colors.pro_color
			})

			managers.hud:make_fine_text(killed_civ_text)
			killed_civ_text:set_h(killed_civ_text:h())
			killed_civ_text:set_left(10)
			modifiers_amount = modifiers_amount + 1
		end

		local gage_courier_text = nil
		local collected_packages = managers.gage_assignment:count_all_units() - managers.gage_assignment:count_active_units()
		if collected_packages > 0 then
			gage_courier_text = text_panel:text({
				name = "gage_courier_text",
				vertical = "top",
				h = 128,
				wrap = true,
				align = "left",
				word_wrap = true,
				text = self:get_text("menu_collected_packages") .. math.floor(5 / managers.gage_assignment:count_all_units() * collected_packages) .. "%.",
				font = tweak_data.menu.pd2_small_font,
				font_size = font_size,
				color = tweak_data.screen_colors.button_stage_2
			})
			managers.hud:make_fine_text(gage_courier_text)
			gage_courier_text:set_h(gage_courier_text:h())
			gage_courier_text:set_left(10)
			modifiers_amount = modifiers_amount + 1
		end
		
		local loose_money_text = nil
		local loose_money_exp = managers.experience:new_xp("loose_money")
		if loose_money_exp > 0 then
			loose_money_text = text_panel:text({
				name = "loose_money_text",
				vertical = "top",
				h = 128,
				wrap = true,
				align = "left",
				word_wrap = true,
				text = self:get_text("menu_loose_money") .. loose_money_exp .. "%.",
				font = tweak_data.menu.pd2_small_font,
				font_size = font_size,
				color = tweak_data.screen_colors.friend_color
			})
			managers.hud:make_fine_text(loose_money_text)
			loose_money_text:set_h(loose_money_text:h())
			loose_money_text:set_left(10)
			modifiers_amount = modifiers_amount + 1
		end
		
		local mul = modifiers_amount < 5 and 0 or modifiers_amount < 6 and 3 or modifiers_amount < 7 and 5 or 7

		if alive(modifiers_text) then
			modifiers_text:set_font_size(modifiers_text:font_size() - (mul / 2))
		end
		if alive(one_down_warning_text) then
			one_down_warning_text:set_top(next_top)
			next_top = one_down_warning_text:bottom() - mul
			one_down_warning_text:set_font_size(one_down_warning_text:font_size() - mul)
		end
		if alive(pro_warning_text) then
			pro_warning_text:set_top(next_top)
			next_top = pro_warning_text:bottom() - mul
			pro_warning_text:set_font_size(pro_warning_text:font_size() - mul)
		end
		if alive(killed_civ_text) then
			killed_civ_text:set_top(next_top)
			next_top = killed_civ_text:bottom() - mul
			killed_civ_text:set_font_size(killed_civ_text:font_size() - mul)
		end
		if alive(heat_warning_text) then
			heat_warning_text:set_top(next_top)
			next_top = heat_warning_text:bottom() - mul
			heat_warning_text:set_font_size(heat_warning_text:font_size() - mul)
		end
		if alive(ghost_warning_text) then
			ghost_warning_text:set_top(next_top)
			next_top = ghost_warning_text:bottom() - mul
			ghost_warning_text:set_font_size(ghost_warning_text:font_size() - mul)
		end
		if alive(gage_courier_text) then
			gage_courier_text:set_top(next_top)
			next_top = gage_courier_text:bottom() - mul
			gage_courier_text:set_font_size(gage_courier_text:font_size() - mul)
		end
		if alive(loose_money_text) then
			loose_money_text:set_top(next_top)
			next_top = loose_money_text:bottom() - mul
			loose_money_text:set_font_size(loose_money_text:font_size() - mul)
		end
		self._modifiers_amount = modifiers_amount
		next_top = next_top + 5
		
		modifiers_text:set_visible(heat_warning_text or loose_money_text or gage_courier_text or killed_civ_text or pro_warning_text or ghost_warning_text or one_down_warning_text)

		local risk_color = tweak_data.screen_colors.risk
		local risk_title = text_panel:text({
			font = tweak_data.menu.pd2_small_font,
			font_size = font_size,
			text = self:get_text("menu_risk"),
			color = risk_color
		})

		managers.hud:make_fine_text(risk_title)
		risk_title:set_top(next_top)
		risk_title:set_visible(job_data and true or false)

		local menu_risk_id = "menu_risk_pd"

		if Global.game_settings.difficulty == "hard" then
			menu_risk_id = "menu_risk_swat"
		elseif Global.game_settings.difficulty == "overkill" then
			menu_risk_id = "menu_risk_fbi"
		elseif Global.game_settings.difficulty == "overkill_145" then
			menu_risk_id = "menu_risk_special"
		elseif Global.game_settings.difficulty == "easy_wish" then
			menu_risk_id = "menu_risk_easy_wish"
		elseif Global.game_settings.difficulty == "overkill_290" then
			menu_risk_id = "menu_risk_elite"
		elseif Global.game_settings.difficulty == "sm_wish" then
			menu_risk_id = "menu_risk_sm_wish"
		end

		local risk_stats_panel = text_panel:panel({
			name = "risk_stats_panel"
		})

		risk_stats_panel:set_h(risk_title:h() + 5)

		if job_data then
			local job_stars = managers.job:current_job_stars()
			local job_and_difficulty_stars = managers.job:current_job_and_difficulty_stars()
			local difficulty_stars = managers.job:current_difficulty_stars()
			local diff = difficulty_stars == 5 and difficulty_stars - 1 or difficulty_stars == 4 and difficulty_stars + 1 or difficulty_stars
			local job_id = managers.job:current_job_id()
			local rsx = 15
			local risks = {
				"risk_pd",
				"risk_swat",
				"risk_fbi",
				"risk_death_squad"
			}
			
			if not Global.SKIP_OVERKILL_290 then
				if diff == 5 or diff == 6 then
					table.insert(risks, "risk_easy_wish")
				end
				table.insert(risks, "risk_murder_squad")
				if diff == 6 then
					table.insert(risks, "risk_sm_wish")
				end
			end

			local max_y = 0
			local max_x = 0
			
			self.difficulties = {
				"easy",
				"normal",
				"hard",
				"overkill",
				"overkill_145",
				"overkill_290",
				"easy_wish",
				"sm_wish"
			}
			local function index_to_difficulty(index)
				return self.difficulties[index]
			end
			for i, name in ipairs(risks) do
				if i ~= 1 then
					local texture, rect = tweak_data.hud_icons:get_icon_data(name)
					local active = i <= diff + 1
					local color = active and i ~= 1 and risk_color or tweak_data.screen_colors.text
					local alpha = active and 1 or 0.25
					local risk = text_panel:bitmap({
						y = 0,
						x = 0,
						texture = texture,
						texture_rect = rect,
						alpha = alpha,
						color = color
					})

					risk:set_x(rsx)
					risk:set_top(math.round(risk_title:bottom()))

					rsx = rsx + risk:w() + 2
					local stat = managers.statistics:completed_job(job_id, index_to_difficulty(i + 1))
					local risk_stat = risk_stats_panel:text({
						align = "center",
						name = name,
						font = tweak_data.menu.pd2_small_font,
						font_size = font_size,
						text = tostring(stat)
					})

					managers.hud:make_fine_text(risk_stat)
					risk_stat:set_world_center_x(risk:world_center_x())

					local this_difficulty = i == diff + 1
					active = i <= diff + 1
					color = active and risk_color or Color.white

					if this_difficulty then
						alpha = 1
					elseif active then
						alpha = 0.5
					else
						alpha = 0.25
					end

					risk_stat:set_color(color)
					risk_stat:set_alpha(alpha)

					max_y = math.max(max_y, risk:bottom())
					max_x = math.max(max_x, risk:right() + 5)
					max_x = math.max(max_x, risk_stat:right() + risk_stats_panel:left() + 10)
				end
			end

			risk_stats_panel:set_top(math.round(max_y + 2))

			local stat = managers.statistics:completed_job(job_id, tweak_data:index_to_difficulty(diff + 2))
			local risk_text = text_panel:text({
				name = "risk_text",
				wrap = true,
				align = "left",
				vertical = "top",
				word_wrap = true,
				x = max_x,
				w = text_panel:w() - max_x,
				h = text_panel:h(),
				text = self:get_text(menu_risk_id) .. " " .. managers.localization:to_upper_text("menu_stat_job_completed", {
					stat = tostring(stat)
				}) .. " ",
				font = tweak_data.hud_stats.objective_desc_font,
				font_size = font_size,
				color = risk_color
			})

			risk_text:set_top(math.round(risk_title:bottom() + 4))
			risk_text:set_h(risk_stats_panel:bottom() - risk_text:top())

			local show_max = self._node and self._node:parameters().show_potential_max or false
			local potential_rewards_title = text_panel:text({
				blend_mode = "add",
				font = tweak_data.menu.pd2_small_font,
				font_size = font_size,
				text = self:get_text(show_max and "menu_potential_rewards_max" or "menu_potential_rewards_min", {
					BTN_Y = managers.localization:btn_macro("menu_modify_item")
				}),
				color = managers.menu:is_pc_controller() and tweak_data.screen_colors.button_stage_3 or tweak_data.screen_colors.text
			})

			managers.hud:make_fine_text(potential_rewards_title)
			potential_rewards_title:set_top(risk_stats_panel:bottom() + 4)
			
			local paygrade_title = text_panel:text({
				x = 10,
				font = tweak_data.menu.pd2_small_font,
				font_size = font_size,
				text = managers.localization:to_upper_text("cn_menu_contract_paygrade_header"),
				color = tweak_data.screen_colors.text
			})

			managers.hud:make_fine_text(paygrade_title)
			paygrade_title:set_top(math.round(potential_rewards_title:bottom()))
			
			local jobpay_title = text_panel:text({
				x = 10,
				font = tweak_data.menu.pd2_small_font,
				font_size = font_size,
				text = managers.localization:to_upper_text("cn_menu_contract_jobpay_header"),
				color = tweak_data.screen_colors.text
			})

			managers.hud:make_fine_text(jobpay_title)
			jobpay_title:set_top(math.round(paygrade_title:bottom()))

			local experience_title = text_panel:text({
				x = 10,
				font = tweak_data.menu.pd2_small_font,
				font_size = font_size,
				text = self:get_text("menu_experience"),
				color = tweak_data.screen_colors.text
			})

			managers.hud:make_fine_text(experience_title)
			experience_title:set_top(math.round(jobpay_title:bottom()))

			self._potential_rewards_title = potential_rewards_title
			self._jobpay_title = jobpay_title
			self._experience_title = experience_title
			self._text_panel = text_panel
			self._rewards_panel = text_panel:panel({
				name = "rewards_panel"
			})
			self._potential_show_max = show_max

			self:set_potential_rewards(show_max)
			
			-- Stars
			local filled_star_rect = {0, 32, 32, 32}
			local empty_star_rect = {32, 32, 32, 32}
			local cy = paygrade_title:center_y()
			local sx = paygrade_title:right() + 8
			local job_and_diff_stars = job_stars + diff
			local edge = 10
			local hate_risk = difficulty_stars == 6 and 3 or difficulty_stars == 5 and 1 or difficulty_stars == 4 and 2 or 0
			
			local level_data = { 
					texture="guis/textures/pd2/mission_briefing/difficulty_icons", 
					texture_rect = filled_star_rect, 
					w = 18, 
					h = 18,
					alpha = 1 
			}
			for i = 1, 15 do
				local x = sx + (i - 1) * 18
				local is_risk = i > job_stars
				local star_data = level_data

				local star = text_panel:bitmap(star_data)
				star:set_color(((i > (job_and_diff_stars > edge and job_and_diff_stars or edge)) and Color.green:with_alpha(0)) or ((i > job_and_diff_stars) and Color.black:with_alpha(0.5)) or ((i > job_and_diff_stars - hate_risk) and tweak_data.screen_colors.pro_color) or ((i > job_stars) and risk_color) or Color.white)
				star:set_x(x)
				star:set_center_y(math.round(cy))
			end
			
		end

		self:_rec_round_object(self._panel)

		self._sides = BoxGuiObject:new(self._panel, {
			sides = {
				1,
				1,
				1,
				1
			}
		})
	end
end
if string.lower(RequiredScript) == "lib/managers/menu/contractboxgui" then
	function ContractBoxGui:create_contract_box()
		if not managers.network:session() then
			return
		end

		if self._contract_panel and alive(self._contract_panel) then
			self._panel:remove(self._contract_panel)
		end

		if self._contract_text_header and alive(self._contract_text_header) then
			self._panel:remove(self._contract_text_header)
		end

		if alive(self._panel:child("pro_text")) then
			self._panel:remove(self._panel:child("pro_text"))
		end

		self._contract_panel = nil
		self._contract_text_header = nil
		local contact_data = managers.job:current_contact_data()
		local job_data = managers.job:current_job_data()
		local job_chain = managers.job:current_job_chain_data()
		local job_id = managers.job:current_job_id()
		local job_tweak = tweak_data.levels[job_id]
		self._contract_panel = self._panel:panel({
			name = "contract_box_panel",
			h = 100,
			layer = 0,
			w = self._panel:w() * 0.35
		})

		self._contract_panel:rect({
			halign = "grow",
			valign = "grow",
			layer = -1,
			color = Color(0.5, 0, 0, 0)
		})

		local font = tweak_data.menu.pd2_small_font
		local font_size = tweak_data.menu.pd2_small_font_size

		if contact_data then
			self._contract_text_header = self._panel:text({
				blend_mode = "add",
				text = utf8.to_upper(managers.localization:text(contact_data.name_id) .. ": " .. managers.localization:text(job_data.name_id)),
				h = tweak_data.menu.pd2_medium_font_size,
				font_size = tweak_data.menu.pd2_medium_font_size,
				font = tweak_data.menu.pd2_medium_font,
				color = tweak_data.screen_colors.text
			})
			local length_text_header = self._contract_panel:text({
				text = managers.localization:to_upper_text("cn_menu_contract_length_header"),
				font_size = font_size,
				font = font,
				color = tweak_data.screen_colors.text
			})
			local risk_text_header = self._contract_panel:text({
				text = managers.localization:to_upper_text("menu_lobby_difficulty_title"),
				font_size = font_size,
				font = font,
				color = tweak_data.screen_colors.text
			})
			local exp_text_header = self._contract_panel:text({
				text = managers.localization:to_upper_text("menu_experience"),
				font_size = font_size,
				font = font,
				color = tweak_data.screen_colors.text
			})
			local payout_text_header = self._contract_panel:text({
				text = managers.localization:to_upper_text("cn_menu_contract_jobpay_header"),
				font_size = font_size,
				font = font,
				color = tweak_data.screen_colors.text
			})
			local paygrade_text_header = self._contract_panel:text({
				text = managers.localization:to_upper_text("cn_menu_contract_paygrade_header"),
				font_size = font_size,
				font = font,
				color = tweak_data.screen_colors.text
			})
			local _, _, tw, th = self._contract_text_header:text_rect()

			self._contract_text_header:set_size(tw, th)

			local w = 0
			local _, _, tw, th = length_text_header:text_rect()
			w = math.max(w, tw)

			length_text_header:set_size(tw, th)

			local _, _, tw, th = risk_text_header:text_rect()
			w = math.max(w, tw)

			risk_text_header:set_size(tw, th)

			local _, _, tw, th = exp_text_header:text_rect()
			w = math.max(w, tw)

			exp_text_header:set_size(tw, th)

			local _, _, tw, th = payout_text_header:text_rect()
			w = math.max(w, tw)

			payout_text_header:set_size(tw, th)
		
			local _, _, tw, th = paygrade_text_header:text_rect()
			w = math.max(w, tw)
			
			paygrade_text_header:set_size(tw, th)
				
			w = w + 10

			length_text_header:set_right(w)
			paygrade_text_header:set_right(w)
			risk_text_header:set_right(w)
			exp_text_header:set_right(w)
			payout_text_header:set_right(w)
			paygrade_text_header:set_top(10)
			risk_text_header:set_top(paygrade_text_header:bottom())
			length_text_header:set_top(risk_text_header:bottom())
			exp_text_header:set_top(length_text_header:bottom())
			payout_text_header:set_top(exp_text_header:bottom())

			local length_text = self._contract_panel:text({
				vertical = "top",
				align = "left",
				text = #job_chain > 1 and managers.localization:to_upper_text("cn_menu_contract_length", {stages = #job_chain}) or managers.localization:to_upper_text("cn_menu_contract_day", {stages = #job_chain}),
				font_size = font_size,
				font = font,
				color = tweak_data.screen_colors.text
			})

			length_text:set_position(length_text_header:right() + 5, length_text_header:top())

			local _, _, tw, th = length_text:text_rect()
			w = math.max(w, tw)

			length_text:set_size(tw, th)

			if managers.job:is_job_ghostable(managers.job:current_job_id()) then
				local ghost_icon = self._contract_panel:bitmap({
					blend_mode = "add",
					texture = "guis/textures/pd2/cn_minighost",
					h = 18,
					w = 18,
					color = tweak_data.screen_colors.ghost_color
				})

				ghost_icon:set_center_y(length_text:center_y())
				ghost_icon:set_left(length_text:right())
			end

			local filled_star_rect = {0, 32, 32, 32}
			local empty_star_rect = {32, 32, 32, 32}
			local job_stars = managers.job:current_job_stars()
			local difficulty_stars = managers.job:current_difficulty_stars()
			local diff = difficulty_stars == 5 and difficulty_stars - 1 or difficulty_stars == 4 and difficulty_stars + 1 or difficulty_stars
			local job_and_difficulty_stars = job_stars + diff
			local risk_color = tweak_data.screen_colors.risk
			local cy = paygrade_text_header:center_y()
			local sx = paygrade_text_header:right() + 5
			local edge = 10
			local hate_risk = difficulty_stars == 6 and 3 or difficulty_stars == 5 and 1 or difficulty_stars == 4 and 2 or 0
			
			local level_data = { 
					texture="guis/textures/pd2/mission_briefing/difficulty_icons", 
					texture_rect = filled_star_rect, 
					w = 16, 
					h = 16,
					alpha = 1 
			}
			for i = 1, 15 do
				local x = sx + (i - 1) * 18
				local is_risk = i > job_stars
				local star_data = level_data

				local star = self._contract_panel:bitmap(star_data)
				star:set_color(((i > (job_and_difficulty_stars > edge and job_and_difficulty_stars or edge)) and Color.green:with_alpha(0)) or ((i > job_and_difficulty_stars) and Color.black) or ((i > job_and_difficulty_stars - hate_risk) and tweak_data.screen_colors.pro_color) or ((i > job_stars) and risk_color) or Color.white)
				star:set_x(x)
				star:set_center_y(math.round(cy))
			end
		
			local cy = risk_text_header:center_y()
			local sx = risk_text_header:right() + 5
			local difficulty = tweak_data.difficulties[difficulty_stars + 2] or 1
			local difficulty_string_id = tweak_data.difficulty_name_ids[difficulty]
			local difficulty_string = managers.localization:to_upper_text(difficulty_string_id)
			local difficulty_text = self._contract_panel:text({
				font = font,
				font_size = font_size,
				text = difficulty_string,
				color = tweak_data.screen_colors.text
			})


			local _, _, tw, th = difficulty_text:text_rect()

			difficulty_text:set_size(tw, th)
			difficulty_text:set_x(math.round(sx))
			difficulty_text:set_center_y(cy)
			difficulty_text:set_y(math.round(difficulty_text:y()))


			if Global.game_settings.one_down then
				local one_down_text = self._contract_panel:text({
					name = "one_down_text",
					font = font,
					font_size = font_size,
					text = managers.localization:to_upper_text("menu_one_down"),
					rotation = 360,
					h = 20,
					w = 100,
					color = tweak_data.screen_colors.one_down
				})
				one_down_text:set_lefttop(difficulty_text:right() + 8, difficulty_text:top())
			end
		
			local hate_difficulties = difficulty_stars >= 4
			difficulty_text:set_color(hate_difficulties and Color(255, 255, 170, 0) / 255 or difficulty_stars > 0 and tweak_data.screen_colors.risk or tweak_data.screen_colors.text)

			local plvl = managers.experience:current_level()
			local player_stars = math.max(math.ceil(plvl / 10), 1)
			local contract_visuals = job_data.contract_visuals or {}
			local xp_min = contract_visuals.min_mission_xp and (type(contract_visuals.min_mission_xp) == "table" and contract_visuals.min_mission_xp[difficulty_stars + 1] or contract_visuals.min_mission_xp) or 0
			local total_xp_min, _ = managers.experience:get_contract_xp_by_stars(job_id, job_stars, difficulty_stars, job_data.professional, #job_chain, {
				mission_xp = xp_min
			})
			local xp_text_min = managers.money:add_decimal_marks_to_string(tostring(math.round(total_xp_min)))
			local job_xp = self._contract_panel:text({
				name = "job_xp",
				font = font,
				font_size = font_size,
				text = xp_text_min,
				rotation = 360,
				color = tweak_data.screen_colors.text
			})
			local _, _, tw, th = job_xp:text_rect()

			job_xp:set_size(tw, th)
			job_xp:set_position(math.round(exp_text_header:right() + 5), math.round(exp_text_header:top()))
			
			local risk_xp = self._contract_panel:text({
				font = font,
				font_size = font_size,
				text = " +" .. tostring(math.round(0)),
				color = risk_color
			})
			local _, _, tw, th = risk_xp:text_rect()

			risk_xp:set_size(tw, th)
			risk_xp:set_position(math.round(job_xp:right()), job_xp:top())
			risk_xp:hide()
			
			local job_ghost_mul = managers.job:get_ghost_bonus() or 0
			local ghost_xp_text = nil

			if job_ghost_mul ~= 0 then
				local job_ghost = math.round(job_ghost_mul * 100)
				local job_ghost_string = tostring(math.abs(job_ghost))
				local ghost_color = tweak_data.screen_colors.ghost_color

				if job_ghost == 0 and job_ghost_mul ~= 0 then
					job_ghost_string = string.format("%0.2f", math.abs(job_ghost_mul * 100))
				end

				local text_prefix = job_ghost_mul < 0 and "-" or "+"
				local text_string = " (" .. text_prefix .. job_ghost_string .. "%)"
				ghost_xp_text = self._contract_panel:text({
					blend_mode = "add",
					font = font,
					font_size = font_size,
					text = text_string,
					color = ghost_color
				})
				local _, _, tw, th = ghost_xp_text:text_rect()

				ghost_xp_text:set_size(tw, th)
				ghost_xp_text:set_position(math.round(risk_xp:visible() and risk_xp:right() or job_xp:right()), job_xp:top())
			end

			local job_heat = managers.job:current_job_heat() or 0
			local job_heat_mul = managers.job:heat_to_experience_multiplier(job_heat) - 1
			local heat_xp_text = nil

			if job_heat_mul ~= 0 then
				job_heat = math.round(job_heat_mul * 100)
				local job_heat_string = tostring(math.abs(job_heat))
				local heat_color = managers.job:current_job_heat_color()

				if job_heat == 0 and job_heat_mul ~= 0 then
					job_heat_string = string.format("%0.2f", math.abs(job_heat_mul * 100))
				end

				local text_prefix = job_heat_mul < 0 and "-" or "+"
				local text_string = " (" .. text_prefix .. job_heat_string .. "%)"
				heat_xp_text = self._contract_panel:text({
					blend_mode = "add",
					font = font,
					font_size = font_size,
					text = text_string,
					color = heat_color
				})
				local _, _, tw, th = heat_xp_text:text_rect()

				heat_xp_text:set_size(tw, th)
				heat_xp_text:set_position(math.round(ghost_xp_text and ghost_xp_text:right() or job_xp:right()), job_xp:top())
			end
			
			local total_payout_min, base_payout_min, risk_payout_min = managers.money:get_contract_money_by_stars(job_stars, difficulty_stars, #job_chain, managers.job:current_job_id(), managers.job:current_level_id())
			local total_payout_max, base_payout_max, risk_payout_max = managers.money:get_contract_money_by_stars(job_stars, difficulty_stars, #job_chain, managers.job:current_job_id(), managers.job:current_level_id(), {
				mandatory_bags_value = contract_visuals.mandatory_bags_value and contract_visuals.mandatory_bags_value[difficulty_stars + 1],
				bonus_bags_value = contract_visuals.bonus_bags_value and contract_visuals.bonus_bags_value[difficulty_stars + 1],
				small_value = contract_visuals.small_value and contract_visuals.small_value[difficulty_stars + 1],
				vehicle_value = contract_visuals.vehicle_value and contract_visuals.vehicle_value[difficulty_stars + 1]
			})
			local payout_text_min = managers.experience:cash_string(math.round(total_payout_min))
			local payout_text_max = managers.experience:cash_string(math.round(total_payout_max))
			local total_payout_text = total_payout_min < total_payout_max and managers.localization:text("menu_number_range", {
				min = payout_text_min,
				max = payout_text_max
			}) or payout_text_min
			local job_money = self._contract_panel:text({
				font = font,
				font_size = font_size,
				text = total_payout_text,
				color = tweak_data.screen_colors.text
			})
			local _, _, tw, th = job_money:text_rect()

			job_money:set_size(tw, th)
			job_money:set_position(math.round(payout_text_header:right() + 5), math.round(payout_text_header:top()))

			local risk_money = self._contract_panel:text({
				font = font,
				font_size = font_size,
				text = " +" .. managers.experience:cash_string(math.round(risk_payout_min)),
				color = risk_color
			})
			local _, _, tw, th = risk_money:text_rect()

			risk_money:set_size(tw, th)
			risk_money:set_position(math.round(job_money:right()), job_money:top())
			risk_money:hide()
			self._contract_panel:set_h(payout_text_header:bottom() + 10)

			if managers.mutators:are_mutators_enabled() and managers.mutators:allow_mutators_in_level(job_chain and job_chain[1] and job_chain[1].level_id) then
				local mutators_text_header = self._contract_panel:text({
					name = "mutators_text_header",
					text = managers.localization:to_upper_text("cn_menu_contract_mutators_header"),
					font_size = font_size,
					font = font,
					color = tweak_data.screen_colors.text
				})
				local _, _, tw, th = mutators_text_header:text_rect()
				w = math.max(w, tw)

				mutators_text_header:set_size(tw, th)
				mutators_text_header:set_right(w)
				mutators_text_header:set_top(payout_text_header:bottom())

				local mutators_text = self._contract_panel:text({
					name = "mutators_text",
					font = font,
					font_size = font_size,
					text = managers.localization:to_upper_text("cn_menu_contract_mutators_active"),
					color = tweak_data.screen_colors.mutators_color_text
				})
				local _, _, tw, th = mutators_text:text_rect()

				mutators_text:set_size(tw, th)
				mutators_text:set_position(math.round(mutators_text_header:right() + 5), math.round(mutators_text_header:top()))
				self._contract_panel:set_h(mutators_text:bottom() + 10)
			end
		elseif managers.menu:debug_menu_enabled() then
			local debug_start = self._contract_panel:text({
				text = "Use DEBUG START to start your level",
				y = 10,
				wrap = true,
				x = 10,
				word_wrap = true,
				font_size = font_size,
				font = font,
				color = tweak_data.screen_colors.text
			})

			debug_start:grow(-debug_start:x() - 10, debug_start:y() - 10)
		end

		self._contract_panel:set_rightbottom(self._panel:w() - 0, self._panel:h() - 60)

		if self._contract_text_header then
			self._contract_text_header:set_bottom(self._contract_panel:top())
			self._contract_text_header:set_left(self._contract_panel:left())

			local wfs_text = self._panel:child("wfs")

			if wfs_text and not managers.menu:is_pc_controller() then
				wfs_text:set_rightbottom(self._panel:w() - 20, self._contract_text_header:top())
			end
		end

		local wfs = self._panel:child("wfs")

		if wfs then
			self._contract_panel:grow(0, wfs:h() + 5)
			self._contract_panel:move(0, -(wfs:h() + 5))

			if self._contract_text_header then
				self._contract_text_header:move(0, -(wfs:h() + 5))
			end

			wfs:set_world_rightbottom(self._contract_panel:world_right() - 5, self._contract_panel:world_bottom())
		end
		if self._contract_text_header and managers.job:is_current_job_professional() then
			local pro_text = self._panel:text({
				name = "pro_text",
				text = managers.localization:to_upper_text("cn_menu_pro_job"),
				font_size = tweak_data.menu.pd2_medium_font_size,
				font = tweak_data.menu.pd2_medium_font,
				color = tweak_data.screen_colors.pro_color,
				blend_mode = "add"
			})
			local x, y, w, h = pro_text:text_rect()
			pro_text:set_size(w, h)
			pro_text:set_position(self._contract_text_header:right() + 10, self._contract_text_header:y())
		end

		if job_tweak and job_tweak.is_safehouse and not job_tweak.is_safehouse_combat then
			self._contract_text_header:set_bottom(self._contract_panel:bottom())
			self._contract_panel:set_h(0)
		end

		BoxGuiObject:new(self._contract_panel, {
			sides = {
				1,
				1,
				1,
				1
			}
		})

		for i = 1, tweak_data.max_players, 1 do
			local peer = managers.network:session():peer(i)

			if peer then
				local peer_pos = managers.menu_scene:character_screen_position(i)
				local peer_name = peer:name()

				if peer_pos then
					self:create_character_text(i, peer_pos.x, peer_pos.y, peer_name)
				end
			end
		end

		self._enabled = true
	end

	Hooks:PreHook(ContractBoxGui, "update", "ContractBoxGui_update", function(self)
		
		if self._pro_tooltip then
			local speed = 6
			local x, y = managers.mouse_pointer:modified_mouse_pos()
			local pro_text = self._panel:child("pro_text")
			
			if pro_text and pro_text:inside(x, y) then
				self._pro_tooltip:set_alpha(math.clamp(self._pro_tooltip:alpha() + speed * TimerManager:main():delta_time(), 0, 1))
			else
				self._pro_tooltip:set_alpha(math.clamp(self._pro_tooltip:alpha() - speed * TimerManager:main():delta_time(), 0, 1))
			end
		end
	end)

	function ContractBoxGui:mouse_moved(x, y)
		if not self:can_take_input() then
			return
		end

		local used = false
		local pointer = "arrow"

		if self._peers and SystemInfo:platform() == Idstring("WIN32") and MenuCallbackHandler:is_overlay_enabled() then
			for peer_id, object in pairs(self._peers) do
				if alive(object) and object:inside(x, y) then
					used = true
					pointer = "link"
				end
			end
		end
		
		if self._pro_tooltip then
			local pro_text = self._panel:child("pro_text")
			local speed = 6

			if pro_text and pro_text:inside(x, y) then
				self._pro_tooltip:set_world_right(x + 100)
				self._pro_tooltip:set_world_bottom(y)

				return true, "link"
			end
		end
		
		if self._mutators_tooltip then
			local mutators_text_header = self._contract_panel:child("mutators_text_header")
			local mutators_text = self._contract_panel:child("mutators_text")
			local speed = 6

			if mutators_text_header and mutators_text_header:inside(x, y) or mutators_text and mutators_text:inside(x, y) then
				self._mutators_tooltip:set_world_left(x)
				self._mutators_tooltip:set_world_bottom(y)

				return true, "link"
			end
		end

		return used, pointer
	end

	function ContractBoxGui:create_mutators_tooltip()
		if self._mutators_tooltip and alive(self._mutators_tooltip) then
			self._fullscreen_panel:remove(self._mutators_tooltip)

			self._mutators_tooltip = nil
			self._mutators_data = nil
		end

		if not managers.network:session() then
			return
		end

		local string_h = 12
		
		local placer = UiPlacer:new(10, 38, 0, 8)
		self._pro_tooltip = self._fullscreen_panel:panel({
			name = "pro_tooltip",
			h = 110,
			layer = 10,
			w = self._panel:w() * 0.25
		})
		self._pro_tooltip:set_w(525)
		
		local pro_title = self._pro_tooltip:text({
			y = 10,
			name = "pro_title",
			x = 10,
			font = tweak_data.menu.pd2_medium_font,
			font_size = tweak_data.menu.pd2_medium_font_size,
			text = "PRO JOB",
			color = tweak_data.screen_colors.pro_color,
			h = tweak_data.menu.pd2_medium_font_size
		})
		
		local placer = UiPlacer:new(10, 38, 0, 8)
		placer:add_bottom(self._pro_tooltip:text({
			text = "1) " .. managers.localization:text("menu_prof_mod_contract"),
			vertical = "top",
			align = "left",
			h = string_h,
			rotation = 360,
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size
		}))
		placer:add_bottom(self._pro_tooltip:text({
			text = "2) " .. managers.localization:text("menu_prof_mod_hostage"),
			vertical = "top",
			align = "left",
			h = string_h,
			rotation = 360,
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size
		}))
		placer:add_bottom(self._pro_tooltip:text({
			text = "3) " .. managers.localization:text("menu_prof_mod_flash"),
			vertical = "top",
			align = "left",
			h = string_h,
			rotation = 360,
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size
		}))
		-- placer:add_bottom(self._pro_tooltip:text({
			-- text = "4) " .. managers.localization:text("menu_prof_mod_inventory"),
			-- vertical = "top",
			-- align = "left",
			-- h = string_h,
			-- rotation = 360,
			-- font = tweak_data.menu.pd2_small_font,
			-- font_size = tweak_data.menu.pd2_small_font_size
		-- }))
		
		if managers.mutators:are_mutators_enabled() then
			self._mutators_tooltip = self._fullscreen_panel:panel({
				name = "mutator_tooltip",
				h = 100,
				layer = 10,
				w = self._panel:w() * 0.25
			})
			local mutators_title = self._mutators_tooltip:text({
				y = 10,
				name = "mutators_title",
				x = 10,
				font = tweak_data.menu.pd2_medium_font,
				font_size = tweak_data.menu.pd2_medium_font_size,
				text = managers.localization:to_upper_text("menu_cn_mutators_active"),
				h = tweak_data.menu.pd2_medium_font_size
			})
			local _y = mutators_title:bottom() + 5
			local mutators_list = {}
			self._mutators_data = deep_clone(managers.mutators:get_mutators_from_lobby_data())

			for mutator_id, mutator_data in pairs(self._mutators_data) do
				local mutator = managers.mutators:get_mutator_from_id(mutator_id)

				if mutator then
					table.insert(mutators_list, mutator)
				end
			end

			table.sort(mutators_list, function (a, b)
				return a:name() < b:name()
			end)

			for i, mutator in ipairs(mutators_list) do
				local mutator_text = self._mutators_tooltip:text({
					x = 10,
					layer = 1,
					name = "mutator_text_" .. tostring(mutator:id()),
					font = tweak_data.menu.pd2_small_font,
					font_size = tweak_data.menu.pd2_small_font_size,
					text = mutator:name(),
					y = _y,
					h = tweak_data.menu.pd2_small_font_size
				})
				_y = mutator_text:bottom() + 2
			end

			self._mutators_tooltip:set_h(_y + 10)
			self._mutators_tooltip:rect({
				alpha = 0.8,
				layer = -1,
				color = Color.black
			})
			BoxGuiObject:new(self._mutators_tooltip, {
				sides = {
					1,
					1,
					1,
					1
				}
			})
			self._mutators_tooltip:set_alpha(0)
		end
		
		self._pro_tooltip:rect({
			alpha = 0.8,
			layer = -1,
			color = Color.black
		})
		BoxGuiObject:new(self._pro_tooltip, {
			sides = {
				1,
				1,
				1,
				1
			}
		})
		self._pro_tooltip:set_alpha(0)
	end

	function ContractBoxGui:check_update_mutators_tooltip()
		local refresh_contract, refresh_tooltip = nil

			self._lobby_mutators_text:set_visible()

			local lobby_data = managers.mutators:get_mutators_from_lobby_data()

			if self._mutators_data then
				refresh_contract = self._contract_panel:child("mutators_text") == nil

				for mutator_id, mutator_data in pairs(lobby_data) do
					if self._mutators_data[mutator_id] then
						for key, value in pairs(mutator_data) do
							if self._mutators_data[mutator_id][key] ~= value then
								refresh_tooltip = true

								break
							end
						end
					else
						refresh_tooltip = true
					end
				end

				if not refresh_tooltip then
					for mutator_id, mutator_data in pairs(self._mutators_data) do
						if not lobby_data[mutator_id] then
							refresh_tooltip = true

							break
						else
							for key, value in pairs(mutator_data) do
								if lobby_data[mutator_id][key] ~= value then
									refresh_tooltip = true

									break
								end
							end
						end
					end
				end
			elseif lobby_data then
				refresh_tooltip = true
				refresh_contract = self._contract_panel:child("mutators_text") == nil
			elseif not lobby_data then
				refresh_contract = self._contract_panel:child("mutators_text") ~= nil
			end

		if refresh_contract then
			self:create_contract_box()
		end

		if refresh_tooltip then
			self:create_mutators_tooltip()
		end
	end
end
if string.lower(RequiredScript) == "lib/managers/menu/crimenetcontractgui" then
	function CrimeNetContractGui:init(ws, fullscreen_ws, node)
		self._ws = ws
		self._fullscreen_ws = fullscreen_ws
		self._panel = self._ws:panel():panel({
			layer = 51
		})
		self._fullscreen_panel = self._fullscreen_ws:panel():panel({
			layer = 50
		})

		self._fullscreen_panel:rect({
			alpha = 0.75,
			layer = 0,
			color = Color.black
		})

		self._node = node
		local job_data = self._node:parameters().menu_component_data
		self._customizable = job_data.customize_contract or false
		self._smart_matchmaking = job_data.smart_matchmaking or false
		local font_size = tweak_data.menu.pd2_small_font_size
		local font = tweak_data.menu.pd2_small_font
		local risk_color = tweak_data.screen_colors.risk
		local padding = tweak_data.gui.crime_net.contract_gui.padding
		local half_padding = 0.5 * padding
		local double_padding = 2 * padding
		local width = tweak_data.gui.crime_net.contract_gui.width
		local height = tweak_data.gui.crime_net.contract_gui.height
		local text_w = tweak_data.gui.crime_net.contract_gui.text_width
		local contact_w = tweak_data.gui.crime_net.contract_gui.contact_width
		local contact_h = contact_w / 1.7777777777777777
		local blur = self._fullscreen_panel:bitmap({
			texture = "guis/textures/test_blur_df",
			render_template = "VertexColorTexturedBlur3D",
			layer = 1,
			w = self._fullscreen_ws:panel():w(),
			h = self._fullscreen_ws:panel():h()
		})

		local function func(o)
			local start_blur = 0

			over(0.6, function (p)
				o:set_alpha(math.lerp(start_blur, 1, p))
			end)
		end

		blur:animate(func)

		self._contact_text_header = self._panel:text({
			text = " ",
			vertical = "top",
			align = "left",
			layer = 1,
			font_size = tweak_data.menu.pd2_large_font_size,
			font = tweak_data.menu.pd2_large_font,
			color = tweak_data.screen_colors.text
		})
		local x, y, w, h = self._contact_text_header:text_rect()

		self._contact_text_header:set_size(width, h)
		self._contact_text_header:set_center_x(self._panel:w() * 0.5)

		self._contract_panel = self._panel:panel({
			layer = 5,
			h = height,
			w = width,
			x = self._contact_text_header:x(),
			y = self._contact_text_header:bottom()
		})

		self._contract_panel:set_center_y(self._panel:h() * 0.5)
		self._contact_text_header:set_bottom(self._contract_panel:top())

		if self._contact_text_header:y() < 0 then
			local y_offset = -self._contact_text_header:y()

			self._contact_text_header:move(0, y_offset)
			self._contract_panel:move(0, y_offset)
		end

		if not job_data.job_id then
			local bottom = self._contract_panel:bottom()

			self._contract_panel:set_h(160)
			self._contract_panel:set_bottom(bottom)
			self._contact_text_header:set_bottom(self._contract_panel:top())

			local host_name = job_data.host_name or ""
			local num_players = job_data.num_plrs or 1
			local server_text = managers.localization:to_upper_text("menu_lobby_server_title") .. " " .. host_name
			local players_text = managers.localization:to_upper_text("menu_players_online", {
				COUNT = tostring(num_players)
			})

			self._contact_text_header:set_text(server_text .. "\n" .. players_text)
			self._contact_text_header:set_font(tweak_data.menu.pd2_medium_font_id)
			self._contact_text_header:set_font_size(tweak_data.menu.pd2_medium_font_size)

			local x, y, w, h = self._contact_text_header:text_rect()

			self._contact_text_header:set_size(width, h)
			self._contact_text_header:set_top(self._contract_panel:top())
			self._contact_text_header:move(padding, padding)
			BoxGuiObject:new(self._contract_panel, {
				sides = {
					1,
					1,
					1,
					1
				}
			})

			self._step = 1
			self._steps = {}

			return
		end

		BoxGuiObject:new(self._contract_panel, {
			sides = {
				1,
				1,
				1,
				1
			}
		})

		job_data.job_id = job_data.job_id or "ukrainian_job"
		local narrative = tweak_data.narrative:job_data(job_data.job_id)
		local narrative_chains = tweak_data.narrative:job_chain(job_data.job_id)

		self._contact_text_header:set_text(managers.localization:to_upper_text("menu_cn_contract_title", {
			job = managers.localization:text(narrative.name_id)
		}))

		local last_bottom = 0
		local contract_text = self._contract_panel:text({
			vertical = "top",
			wrap = true,
			align = "left",
			wrap_word = true,
			text = managers.localization:text(narrative.briefing_id),
			w = text_w,
			font_size = font_size,
			font = font,
			color = tweak_data.screen_colors.text,
			x = padding,
			y = padding
		})
		local _, _, _, h = contract_text:text_rect()
		local scale = 1

		if h + contract_text:top() > math.round(self._contract_panel:h() * 0.5) - font_size then
			scale = (math.round(self._contract_panel:h() * 0.5) - font_size) / (h + contract_text:top())
		end

		contract_text:set_font_size(font_size * scale)
		self:make_fine_text(contract_text)

		last_bottom = contract_text:bottom()
		local is_job_ghostable = managers.job:is_job_ghostable(job_data.job_id)

		if is_job_ghostable then
			local min_ghost_bonus, max_ghost_bonus = managers.job:get_job_ghost_bonus(job_data.job_id)
			local min_ghost = math.round(min_ghost_bonus * 100)
			local max_ghost = math.round(max_ghost_bonus * 100)
			local min_string, max_string = nil

			if min_ghost == 0 and min_ghost_bonus ~= 0 then
				min_string = string.format("%0.2f", math.abs(min_ghost_bonus * 100))
			else
				min_string = tostring(math.abs(min_ghost))
			end

			if max_ghost == 0 and max_ghost_bonus ~= 0 then
				max_string = string.format("%0.2f", math.abs(max_ghost_bonus * 100))
			else
				max_string = tostring(math.abs(max_ghost))
			end

			local ghost_bonus_string = min_ghost_bonus == max_ghost_bonus and min_string or min_string .. "-" .. max_string
			local ghostable_text = self._contract_panel:text({
				vertical = "top",
				wrap = true,
				align = "left",
				wrap_word = true,
				blend_mode = "add",
				text = managers.localization:to_upper_text("menu_ghostable_job", {
					bonus = ghost_bonus_string
				}),
				w = text_w,
				font_size = font_size,
				font = font,
				color = tweak_data.screen_colors.ghost_color
			})

			ghostable_text:set_position(contract_text:x(), last_bottom + padding)
			self:make_fine_text(ghostable_text)

			last_bottom = ghostable_text:bottom()
		end

		if tweak_data.narrative:is_job_locked(job_data.job_id) then
			local locked_text = self._contract_panel:text({
				font = tweak_data.menu.pd2_small_font,
				font_size = font_size,
				text = managers.localization:to_upper_text("bm_menu_vr_locked"),
				color = tweak_data.screen_colors.important_1
			})

			self:make_fine_text(locked_text)
			locked_text:set_position(contract_text:x(), last_bottom + padding)
		end

		local contact_panel = self._contract_panel:panel({
			w = contact_w,
			h = contact_h,
			x = text_w + double_padding,
			y = padding
		})
		local contact_image = contact_panel:rect({
			color = Color(0.3, 0, 0, 0)
		})
		local crimenet_videos = narrative.crimenet_videos

		if crimenet_videos then
			local variant = math.random(#crimenet_videos)

			contact_panel:video({
				blend_mode = "add",
				loop = true,
				video = "movies/" .. crimenet_videos[variant],
				width = contact_panel:w(),
				height = contact_panel:h(),
				color = tweak_data.screen_colors.button_stage_2
			})
		end

		local contact_text = self._contract_panel:text({
			text = managers.localization:to_upper_text(tweak_data.narrative.contacts[narrative.contact].name_id),
			font_size = font_size,
			font = font,
			color = tweak_data.screen_colors.text
		})
		local x, y, w, h = contact_text:text_rect()

		contact_text:set_size(w, h)
		contact_text:set_position(contact_panel:left(), contact_panel:bottom() + half_padding)
		BoxGuiObject:new(contact_panel, {
			sides = {
				1,
				1,
				1,
				1
			}
		})

		local modifiers_text = self._contract_panel:text({
			name = "modifiers_text",
			vertical = "top",
			align = "left",
			text = managers.localization:to_upper_text("menu_cn_modifiers"),
			font = font,
			font_size = font_size,
			x = padding,
			color = tweak_data.screen_colors.text,
			w = text_w
		})

		self:make_fine_text(modifiers_text)
		modifiers_text:set_bottom(math.round(self._contract_panel:h() * 0.5 - font_size))

		local next_top = modifiers_text:bottom()
		local one_down_active = job_data.one_down == 1

		if one_down_active then
			local one_down_warning_text = self._contract_panel:text({
				name = "one_down_warning_text",
				text = managers.localization:to_upper_text("menu_one_down"),
				font = font,
				font_size = font_size,
				color = tweak_data.screen_colors.one_down
			})

			self:make_fine_text(one_down_warning_text)
			one_down_warning_text:set_top(next_top)
			one_down_warning_text:set_left(double_padding)

			next_top = one_down_warning_text:bottom()
		end

		local ghost_bonus_mul = managers.job:get_ghost_bonus()
		local skill_bonus = managers.player:get_skill_exp_multiplier()
		local infamy_bonus = managers.player:get_infamy_exp_multiplier()
		local limited_bonus = managers.player:get_limited_exp_multiplier(job_data.job_id, nil)
		local job_ghost = math.round(ghost_bonus_mul * 100)
		local job_ghost_string = tostring(math.abs(job_ghost))
		local has_ghost_bonus = ghost_bonus_mul > 0

		if job_ghost == 0 and ghost_bonus_mul ~= 0 then
			job_ghost_string = string.format("%0.2f", math.abs(ghost_bonus_mul * 100))
		end

		local ghost_color = tweak_data.screen_colors.ghost_color
		local ghost_warning_text = self._contract_panel:text({
			name = "ghost_color_warning_text",
			vertical = "top",
			word_wrap = true,
			wrap = true,
			align = "left",
			blend_mode = "normal",
			text = managers.localization:to_upper_text("menu_ghost_bonus", {
				exp_bonus = job_ghost_string
			}),
			font = font,
			font_size = font_size,
			color = ghost_color,
			w = text_w
		})

		self:make_fine_text(ghost_warning_text)
		ghost_warning_text:set_top(next_top)
		ghost_warning_text:set_left(double_padding)
		ghost_warning_text:set_visible(has_ghost_bonus)

		if ghost_warning_text:visible() then
			next_top = ghost_warning_text:bottom()
		end

		local job_heat_value = managers.job:get_job_heat(job_data.job_id)
		local ignore_heat = job_heat_value > 0 and self._customizable
		local job_heat_mul = ignore_heat and 0 or managers.job:get_job_heat_multipliers(job_data.job_id) - 1
		local job_heat = math.round(job_heat_mul * 100)
		local job_heat_string = tostring(math.abs(job_heat))
		local is_job_heated = job_heat ~= 0 or job_heat_mul ~= 0

		if job_heat == 0 and job_heat_mul ~= 0 then
			job_heat_string = string.format("%0.2f", math.abs(job_heat_mul * 100))
		end

		self._is_job_heated = is_job_heated
		local heat_color = managers.job:get_job_heat_color(job_data.job_id)
		local heat_text_id = "menu_heat_" .. (job_heat_mul > 0 and "warm" or job_heat_mul < 0 and "cold" or "ok")
		local heat_warning_text = self._contract_panel:text({
			name = "heat_warning_text",
			vertical = "top",
			word_wrap = true,
			wrap = true,
			align = "left",
			blend_mode = "normal",
			text = managers.localization:to_upper_text(heat_text_id, {
				job_heat = job_heat_string
			}),
			font = font,
			font_size = font_size,
			color = heat_color,
			w = text_w
		})

		self:make_fine_text(heat_warning_text)
		heat_warning_text:set_top(next_top)
		heat_warning_text:set_left(double_padding)
		heat_warning_text:set_visible(is_job_heated)

		self._heat_color = heat_color

		if heat_warning_text:visible() then
			next_top = heat_warning_text:bottom()
		end
		
		local pro_warning_text = self._contract_panel:text({
			name = "pro_warning_text",
			vertical = "top",
			word_wrap = true,
			wrap = true,
			align = "left",
			blend_mode = "normal",
			text = managers.localization:to_upper_text("menu_pro_warning"),
			font = font,
			font_size = font_size,
			color = tweak_data.screen_colors.pro_color,
			w = text_w
		})

		self:make_fine_text(pro_warning_text)
		pro_warning_text:set_h(pro_warning_text:h())
		pro_warning_text:set_left(double_padding)
		pro_warning_text:set_top(next_top)
		pro_warning_text:set_visible(narrative.professional)

		if pro_warning_text:visible() then
			next_top = pro_warning_text:bottom()
		end

		local is_christmas_job = managers.job:is_christmas_job(job_data.job_id)

		if is_christmas_job then
			local holiday_potential_bonus = managers.job:get_job_christmas_bonus(job_data.job_id)
			local holiday_bonus_percentage = math.round(holiday_potential_bonus * 100)

			if holiday_bonus_percentage ~= 0 then
				local holiday_string = tostring(holiday_bonus_percentage)
				local holiday_text = self._contract_panel:text({
					vertical = "top",
					wrap = true,
					align = "left",
					wrap_word = true,
					blend_mode = "normal",
					text = managers.localization:to_upper_text("holiday_warning_text", {
						event_icon = managers.localization:get_default_macro("BTN_XMAS"),
						bonus = holiday_string
					}),
					w = text_w,
					font_size = font_size,
					font = font,
					color = tweak_data.screen_colors.event_color
				})

				holiday_text:set_position(double_padding, next_top)
				self:make_fine_text(holiday_text)

				next_top = holiday_text:bottom()
			end
		end

		modifiers_text:set_visible(heat_warning_text:visible() or one_down_active or pro_warning_text:visible() or ghost_warning_text:visible())

		local risk_title = self._contract_panel:text({
			font = font,
			font_size = font_size,
			text = managers.localization:to_upper_text("menu_risk"),
			color = risk_color,
			x = padding
		})

		self:make_fine_text(risk_title)
		risk_title:set_top(next_top)

		next_top = next_top + half_padding
		local menu_risk_id = "menu_risk_pd"

		if job_data.difficulty == "hard" then
			menu_risk_id = "menu_risk_swat"
		elseif job_data.difficulty == "overkill" then
			menu_risk_id = "menu_risk_fbi"
		elseif job_data.difficulty == "overkill_145" then
			menu_risk_id = "menu_risk_special"
		elseif job_data.difficulty == "easy_wish" then
			menu_risk_id = "menu_risk_easy_wish"
		elseif job_data.difficulty == "overkill_290" then
			menu_risk_id = "menu_risk_elite"
		elseif job_data.difficulty == "sm_wish" then
			menu_risk_id = "menu_risk_sm_wish"
		end

		local risk_stats_panel = self._contract_panel:panel({
			name = "risk_stats_panel",
			w = text_w,
			x = padding
		})

		risk_stats_panel:set_h(risk_title:h() + half_padding)

		local plvl = managers.experience:current_level()
		local player_stars = math.max(math.ceil(plvl / 10), 1)
		local job_stars = math.ceil(narrative.jc / 10)
		local difficulty_stars = job_data.difficulty_id - 2
		local diff = job_data.difficulty_id == 7 and difficulty_stars - 1 or job_data.difficulty_id == 6 and difficulty_stars + 1 or difficulty_stars
		local job_and_difficulty_stars = job_stars + difficulty_stars
		local rsx = 15
		local risks = {
			"risk_pd",
			"risk_swat",
			"risk_fbi",
			"risk_death_squad"
		}
		
		if not Global.SKIP_OVERKILL_290 then
			if job_data.difficulty == "easy_wish" or job_data.difficulty == "sm_wish" then
				table.insert(risks, "risk_easy_wish")
			end
			table.insert(risks, "risk_murder_squad")
			if job_data.difficulty == "sm_wish" then
				table.insert(risks, "risk_sm_wish")
			end
		end

		local max_x = 0
		local max_y = 0

		self.difficulties = {
			"easy",
			"normal",
			"hard",
			"overkill",
			"overkill_145",
			"overkill_290",
			"easy_wish",
			"sm_wish"
		}
		local function index_to_difficulty(index)
			return self.difficulties[index]
		end
		for i, name in ipairs(risks) do
			if i ~= 1 then
				local texture, rect = tweak_data.hud_icons:get_icon_data(name)
				local active = false
				local color = active and i ~= 1 and risk_color or Color.white
				local alpha = active and 1 or 0.25
				local risk = self._contract_panel:bitmap({
					y = 0,
					x = 0,
					name = name,
					texture = texture,
					texture_rect = rect,
					alpha = alpha,
					color = color
				})

				risk:set_x(rsx)
				risk:set_top(math.round(risk_title:bottom()))

				rsx = rsx + risk:w() + 2
				local stat = managers.statistics:completed_job(job_data.job_id, index_to_difficulty(i + 1))
				local risk_stat = risk_stats_panel:text({
					align = "center",
					name = name,
					font = font,
					font_size = font_size,
					text = tostring(stat)
				})

				self:make_fine_text(risk_stat)
				risk_stat:set_world_center_x(risk:world_center_x() - 1)
				risk_stat:set_x(math.round(risk_stat:x()))

				local this_difficulty = i == diff + 1
				active = i <= diff + 1
				color = Color.white
				alpha = 0.5

				risk_stat:set_color(color)
				risk_stat:set_alpha(alpha)

				max_y = math.max(max_y, risk:bottom())
				max_x = math.max(max_x, risk:right() + half_padding)
				max_x = math.max(max_x, risk_stat:right() + risk_stats_panel:left() + padding)
			end
		end

		risk_stats_panel:set_top(math.round(max_y + 2))

		local stat = managers.statistics:completed_job(job_id, tweak_data:index_to_difficulty(diff + 2))
		local risk_text = self._contract_panel:text({
			vertical = "top",
			name = "risk_text",
			wrap = true,
			align = "left",
			word_wrap = true,
			w = text_w - max_x,
			text = managers.localization:to_upper_text(menu_risk_id) .. " " .. managers.localization:to_upper_text("menu_stat_job_completed", {
				stat = tostring(stat)
			}) .. " ",
			font = font,
			font_size = font_size,
			color = risk_color,
			x = max_x
		})

		risk_text:set_top(math.round(risk_title:bottom()))
		risk_text:set_h(risk_stats_panel:bottom() - risk_text:top())
		risk_text:hide()

		local potential_rewards_title = self._contract_panel:text({
			blend_mode = "add",
			font = font,
			font_size = font_size,
			text = managers.localization:to_upper_text(self._customizable and "menu_potential_rewards_min" or "menu_potential_rewards", {
				BTN_Y = managers.localization:btn_macro("menu_modify_item")
			}),
			color = managers.menu:is_pc_controller() and self._customizable and tweak_data.screen_colors.button_stage_3 or tweak_data.screen_colors.text,
			x = padding
		})

		self:make_fine_text(potential_rewards_title)
		potential_rewards_title:set_top(math.round(risk_stats_panel:bottom() + 4))

		local paygrade_title = self._contract_panel:text({
			x = 20,
			font = font,
			font_size = font_size,
			text = managers.localization:to_upper_text("cn_menu_contract_paygrade_header"),
			color = tweak_data.screen_colors.text
		})

		self:make_fine_text(paygrade_title)
		paygrade_title:set_top(math.round(potential_rewards_title:bottom()))
		
		local jobpay_title = self._contract_panel:text({
			x = 20,
			font = font,
			font_size = font_size,
			text = managers.localization:to_upper_text("cn_menu_contract_jobpay_header"),
			color = tweak_data.screen_colors.text
		})

		self:make_fine_text(jobpay_title)
		jobpay_title:set_top(math.round(paygrade_title:bottom()))

		self._potential_rewards_title = potential_rewards_title
		local experience_title = self._contract_panel:text({
			x = 20,
			font = font,
			font_size = font_size,
			text = managers.localization:to_upper_text("menu_experience"),
			color = tweak_data.screen_colors.text
		})

		self:make_fine_text(experience_title)
		experience_title:set_top(math.round(jobpay_title:bottom()))

		local sx = math.max(jobpay_title:right(), experience_title:right())
		sx = sx + 8

		self._stars_sx = sx
		self._stars_cy = paygrade_title:center_y()
		
		local contract_visuals = job_data.contract_visuals or {}
		local cy = experience_title:center_y()
		local xp_min = contract_visuals.min_mission_xp and (type(contract_visuals.min_mission_xp) == "table" and contract_visuals.min_mission_xp[difficulty_stars + 1] or contract_visuals.min_mission_xp) or 0
		local total_xp, dissected_xp = managers.experience:get_contract_xp_by_stars(job_data.job_id, job_stars, difficulty_stars, narrative.professional, #narrative_chains, {
			ignore_heat = job_heat_value > 0 and self._customizable,
			mission_xp = xp_min
		})
		local base_xp, risk_xp, heat_base_xp, heat_risk_xp, ghost_base_xp, ghost_risk_xp = unpack(dissected_xp)
		local job_xp, add_xp, heat_add_xp, ghost_add_xp = self:_create_xp_appendices(sx, cy)
		cy = jobpay_title:center_y()
		local total_payout, base_payout, risk_payout = managers.money:get_contract_money_by_stars(job_stars, difficulty_stars, #narrative_chains, job_data.job_id)
		local job_cash = self._contract_panel:text({
			name = "job_cash",
			font = font,
			font_size = font_size,
			text = managers.experience:cash_string(0),
			color = tweak_data.screen_colors.text
		})

		self:make_fine_text(job_cash)
		job_cash:set_x(sx)
		job_cash:set_center_y(math.round(cy))

		local add_cash = self._contract_panel:text({
			text = "",
			name = "job_add_cash",
			font = font,
			font_size = font_size,
			color = risk_color
		})

		add_cash:set_text(" +" .. managers.experience:cash_string(math.round(0)))
		self:make_fine_text(add_cash)
		add_cash:set_x(math.round(job_cash:right()))
		add_cash:set_center_y(math.round(cy))

		local payday_money = math.round(total_payout)
		local payday_text = self._contract_panel:text({
			name = "payday_text",
			font = tweak_data.menu.pd2_large_font,
			font_size = tweak_data.menu.pd2_large_font_size,
			text = managers.localization:to_upper_text("menu_payday", {
				MONEY = managers.experience:cash_string(0)
			}),
			color = tweak_data.screen_colors.text,
			x = padding
		})

		self:make_fine_text(payday_text)
		payday_text:set_bottom(self._contract_panel:h() - padding)

		self._briefing_event = narrative.briefing_event

		if self._briefing_event then
			self._briefing_len_panel = self._contract_panel:panel({
				w = contact_image:w(),
				h = 2 * (font_size + padding)
			})

			self._briefing_len_panel:rect({
				blend_mode = "add",
				name = "duration",
				w = 0,
				halign = "grow",
				alpha = 0.6,
				valign = "grow",
				color = tweak_data.screen_colors.button_stage_3:with_alpha(0.2)
			})
			self._briefing_len_panel:text({
				blend_mode = "add",
				name = "text",
				text = "",
				layer = 1,
				font = font,
				font_size = font_size,
				color = tweak_data.screen_colors.text,
				x = padding,
				y = padding
			})

			local button_text = self._briefing_len_panel:text({
				blend_mode = "add",
				name = "button_text",
				text = " ",
				layer = 1,
				font = font,
				font_size = font_size,
				color = tweak_data.screen_colors.text,
				x = padding,
				y = padding
			})
			local _, _, _, h = button_text:text_rect()

			self._briefing_len_panel:set_h(2 * (h + padding))

			if managers.menu:is_pc_controller() then
				button_text:set_color(tweak_data.screen_colors.button_stage_3)
			end

			BoxGuiObject:new(self._briefing_len_panel, {
				sides = {
					1,
					1,
					1,
					1
				}
			})
			self._briefing_len_panel:set_position(contact_text:left(), contact_text:bottom() + padding)
		end

		self._tabs = {}
		self._pages = {}
		self._active_page = nil
		local tabs_panel = self._contract_panel:panel({
			y = 10,
			w = contact_w,
			h = contact_h,
			x = text_w + 20
		})

		tabs_panel:set_top((self._briefing_len_panel and self._briefing_len_panel:bottom() or contact_text:bottom()) + 10)
		tabs_panel:set_visible(false)

		local pages_panel = self._contract_panel:panel({})

		pages_panel:set_visible(false)

		local function add_tab(text_id)
			local prev_tab = self._tabs[#self._tabs]
			local tab_item = MenuGuiSmallTabItem:new(#self._tabs + 1, text_id, nil, self, 0, tabs_panel)

			table.insert(self._tabs, tab_item)

			if prev_tab then
				tab_item._page_panel:set_left(prev_tab:next_page_position())
			end

			if #self._tabs == 1 then
				tab_item:set_active(true)

				self._active_page = 1

				tabs_panel:set_visible(true)
				pages_panel:set_visible(true)
				tabs_panel:set_h(tab_item._page_panel:bottom())
				pages_panel:set_size(contact_w, contact_h - tabs_panel:h())
				pages_panel:set_lefttop(tabs_panel:left(), tabs_panel:bottom() - 2)
				BoxGuiObject:new(pages_panel, {
					sides = {
						1,
						1,
						2,
						1
					}
				})
				managers.menu:active_menu().input:set_force_input(true)
			end

			local page_panel = pages_panel:panel({})

			page_panel:set_visible(tab_item:is_active())
			table.insert(self._pages, page_panel)

			return page_panel
		end

		if job_data.mutators then
			managers.mutators:set_crimenet_lobby_data(job_data.mutators)

			local mutators_panel = add_tab("menu_cn_mutators_active")
			self._mutators_scroll = ScrollablePanel:new(mutators_panel, "mutators_scroll", {
				padding = 0
			})
			local _y = half_padding
			local mutators_list = {}
			local last_item = nil

			for mutator_id, mutator_data in pairs(job_data.mutators) do
				local mutator = managers.mutators:get_mutator_from_id(mutator_id)

				if mutator then
					table.insert(mutators_list, mutator)
				end
			end

			table.sort(mutators_list, function (a, b)
				return a:name() < b:name()
			end)

			for i, mutator in ipairs(mutators_list) do
				local mutator_text = self._mutators_scroll:canvas():text({
					name = "mutator_text_" .. tostring(i),
					font = tweak_data.menu.pd2_small_font,
					font_size = tweak_data.menu.pd2_small_font_size,
					text = mutator:name(),
					x = padding,
					y = _y,
					h = tweak_data.menu.pd2_small_font_size
				})
				_y = mutator_text:bottom() + 2
				last_item = mutator_text
			end

			last_item:set_h(last_item:h() + padding)
			self._mutators_scroll:update_canvas_size()
			managers.mutators:set_crimenet_lobby_data(nil)
		end

		if job_data.server == true then
			local content_panel = add_tab("menu_cn_game_settings")
			local _y = 7
			local add_back = true

			local function add_line(left_text, right_text)
				if right_text == nil or left_text == nil then
					return
				end

				if add_back then
					content_panel:rect({
						x = 8,
						layer = -1,
						y = _y,
						h = tweak_data.menu.pd2_small_font_size,
						w = content_panel:w() - 18,
						color = Color.black:with_alpha(0.7)
					})
				end

				add_back = not add_back
				left_text = managers.localization:to_upper_text(left_text)
				right_text = type(right_text) == "number" and tostring(right_text) or managers.localization:to_upper_text(right_text)
				local left = content_panel:text({
					align = "left",
					font = tweak_data.menu.pd2_small_font,
					font_size = tweak_data.menu.pd2_small_font_size,
					text = left_text,
					x = padding,
					y = _y,
					h = tweak_data.menu.pd2_small_font_size,
					w = content_panel:w() - double_padding,
					color = Color(0.8, 0.8, 0.8)
				})
				local right = content_panel:text({
					align = "right",
					font = tweak_data.menu.pd2_small_font,
					font_size = tweak_data.menu.pd2_small_font_size,
					text = right_text .. " ",
					x = padding,
					y = _y,
					h = tweak_data.menu.pd2_small_font_size,
					w = content_panel:w() - 20,
					color = Color(0.5, 0.5, 0.5)
				})
				_y = math.max(left:bottom(), right:bottom()) + 2
			end

			local server_data = job_data.server_data
			local tactics = {
				"menu_plan_loud",
				"menu_plan_stealth",
				[-1.0] = "menu_any"
			}
			local kick = {
				[0] = "menu_kick_disabled",
				"menu_kick_server",
				"menu_kick_vote"
			}
			local drop_in = {
				[0] = "menu_off",
				"menu_drop_in_on",
				"menu_drop_in_prompt",
				"menu_drop_in_stealth_prompt"
			}
			local permission = {
				"menu_public_game",
				"menu_friends_only_game",
				"menu_private_game"
			}

			add_line("menu_preferred_plan", tactics[server_data.job_plan])
			add_line("menu_kicking_allowed_option", kick[server_data.kick_option])
			add_line("menu_permission", permission[server_data.permission])
			add_line("menu_reputation_permission", server_data.min_level or 0)
			add_line("menu_toggle_drop_in", drop_in[server_data.drop_in])
		end

		if job_data.mods then
			local mods_presence = job_data.mods

			if mods_presence and mods_presence ~= "" and mods_presence ~= "1" then
				local content_panel = add_tab("menu_cn_game_mods")
				self._mods_tab = self._tabs[#self._tabs]
				self._mods_scroll = ScrollablePanel:new(content_panel, "mods_scroll", {
					padding = 0
				})
				self._mod_items = {}
				local _y = 7
				local add_back = true

				local function add_line(id, text, ignore_back)
					local canvas = self._mods_scroll:canvas()

					if add_back and not ignore_back then
						canvas:rect({
							x = 8,
							layer = -1,
							y = _y,
							h = tweak_data.menu.pd2_small_font_size,
							w = canvas:w() - 18,
							color = Color.black:with_alpha(0.7)
						})
					end

					add_back = not add_back
					text = string.upper(text)
					local left_text = canvas:text({
						align = "left",
						name = id,
						font = tweak_data.menu.pd2_small_font,
						font_size = tweak_data.menu.pd2_small_font_size,
						text = text,
						x = padding,
						y = _y,
						h = tweak_data.menu.pd2_small_font_size,
						w = canvas:w() - double_padding,
						color = Color(0.8, 0.8, 0.8)
					})
					local highlight_text = canvas:text({
						blend_mode = "add",
						align = "left",
						visible = false,
						name = id,
						font = tweak_data.menu.pd2_small_font,
						font_size = tweak_data.menu.pd2_small_font_size,
						text = text,
						x = padding,
						y = _y,
						h = tweak_data.menu.pd2_small_font_size,
						w = canvas:w() - double_padding,
						color = tweak_data.screen_colors.button_stage_2
					})
					_y = left_text:bottom() + 2

					return left_text, highlight_text
				end

				local splits = string.split(mods_presence, "|")

				for i = 1, #splits, 2 do
					local text, highlight = add_line(splits[i + 1] or "", splits[i] or "")

					table.insert(self._mod_items, {
						text,
						highlight
					})
				end

				add_line("spacer", "", true)
				self._mods_scroll:update_canvas_size()
			end
		end

		local days_multiplier = 0

		for i = 1, #narrative_chains, 1 do
			local day_mul = narrative.professional and tweak_data:get_value("experience_manager", "pro_day_multiplier", i) or tweak_data:get_value("experience_manager", "day_multiplier", i)
			days_multiplier = days_multiplier + day_mul - 1
		end

		days_multiplier = 1 + days_multiplier / #narrative_chains
		local last_day_mul = narrative.professional and tweak_data:get_value("experience_manager", "pro_day_multiplier", #narrative_chains) or tweak_data:get_value("experience_manager", "day_multiplier", #narrative_chains)
		self._data = {
			job_cash = base_payout,
			add_job_cash = risk_payout,
			experience = base_xp,
			add_experience = risk_xp,
			heat_experience = heat_base_xp,
			heat_add_experience = heat_risk_xp,
			ghost_experience = ghost_base_xp,
			ghost_add_experience = ghost_risk_xp,
			num_stages_string = tostring(#narrative_chains) .. " x ",
			payday_money = payday_money,
			counted_job_cash = 0,
			counted_job_xp = 0,
			counted_risk_cash = 0,
			counted_risk_xp = 0,
			counted_heat_xp = 0,
			counted_ghost_xp = 0,
			counted_payday_money = 0,
			stars = {
				job_and_difficulty_stars = job_and_difficulty_stars,
				job_stars = job_stars,
				difficulty_stars = diff
			},
			gui_objects = {}
		}
		self._data.gui_objects.risk_stats_panel = risk_stats_panel
		self._data.gui_objects.risk_text = risk_text
		self._data.gui_objects.payday_text = payday_text
		self._data.gui_objects.job_cash = job_cash
		self._data.gui_objects.job_add_cash = add_cash
		self._data.gui_objects.heat_add_xp = heat_add_xp
		self._data.gui_objects.ghost_add_xp = ghost_add_xp
		self._data.gui_objects.add_xp = add_xp
		self._data.gui_objects.job_xp = job_xp
		self._data.gui_objects.risks = {
			"risk_pd",
			"risk_swat",
			"risk_fbi",
			"risk_death_squad"
		}

		if not Global.SKIP_OVERKILL_290 then
			if job_data.difficulty == "easy_wish" or job_data.difficulty == "sm_wish" then
				table.insert(self._data.gui_objects.risks, "risk_easy_wish")
			end
			table.insert(self._data.gui_objects.risks, "risk_murder_squad")
			if job_data.difficulty == "sm_wish" then
				table.insert(self._data.gui_objects.risks, "risk_sm_wish")
			end
		end

		self._data.gui_objects.num_stars = 10
		self._wait_t = 0
		local reached_level_cap = managers.experience:reached_level_cap()
		local levelup_text = reached_level_cap and managers.localization:to_upper_text("menu_reached_level_cap") or managers.localization:to_upper_text("menu_levelup", {
			levels = string.format("%0.1d%%", 0)
		})
		local potential_level_up_text = self._contract_panel:text({
			blend_mode = "normal",
			name = "potential_level_up_text",
			visible = true,
			layer = 3,
			text = levelup_text,
			font_size = tweak_data.menu.pd2_small_font_size,
			font = tweak_data.menu.pd2_small_font,
			color = tweak_data.hud_stats.potential_xp_color
		})

		self:make_fine_text(potential_level_up_text)
		potential_level_up_text:set_top(math.round(heat_add_xp:top()))
		self:_update_xp_appendices()

		self._data.gui_objects.potential_level_up_text = potential_level_up_text
		self._step = 1
		self._steps = {
			"set_time",
			"start_sound",
			"start_counter",
			"count_job_base",
			"end_counter",
			"count_difficulty_stars",
			"start_counter",
			"count_job_payday",
			"end_counter",
			"free_memory"
		}
		
		if self._customizable then
			if self._briefing_len_panel then
				self._briefing_len_panel:hide()
			end

			local premium_text = self._contract_panel:text({
				text = "  ",
				name = "premium_text",
				wrap = true,
				blend_mode = "add",
				word_wrap = true,
				font_size = font_size,
				font = font,
				color = tweak_data.screen_colors.button_stage_3
			})

			premium_text:set_top(contact_text:bottom() + padding)
			premium_text:set_left(contact_text:left())
			premium_text:set_w(contact_image:w())
			self._contact_text_header:set_text(managers.localization:to_upper_text("menu_cn_premium_buy_desc") .. ": " .. managers.localization:to_upper_text(narrative.name_id))

			self._step = 1
			self._steps = {
				"start_sound",
				"set_all",
				"free_memory"
			}
		elseif self._smart_matchmaking then
			self._contact_text_header:set_text(managers.localization:to_upper_text("menu_smm_search_job") .. ": " .. managers.localization:to_upper_text(narrative.name_id))

			self._step = 1
			self._steps = {
				"set_time",
				"start_sound",
				"set_all",
				"free_memory"
			}
		end

		self._current_job_star = 0
		self._current_difficulty_star = 0
		self._post_event_params = {
			show_subtitle = false,
			listener = {
				end_of_event = true,
				duration = true,
				clbk = callback(self, self, "sound_event_callback")
			}
		}

		if not managers.menu:is_pc_controller() then
			managers.menu:active_menu().input:deactivate_controller_mouse()
		end

		self:_rec_round_object(self._panel)

		self._potential_show_max = false
		
		local job_and_diff_stars = job_stars + self._step
		local edge = 10
		local level_data = { 
				texture="guis/textures/pd2/mission_briefing/difficulty_icons", 
				texture_rect = {0, 32, 32, 32}, 
				w = 18, 
				h = 18,
				alpha = 1,
				color = Color.black
		}
		
		for i = 1, 15 do
			local x = self._stars_sx + (i - 1) * 18
			local star_data = level_data

			local star = self._contract_panel:bitmap(star_data)
			star:set_color(((i > (job_and_diff_stars > edge and job_and_diff_stars or edge)) and Color.green:with_alpha(0)) or (i > job_stars) and Color.black or Color.white)
			star:set_x(x)
			star:set_center_y(math.round(self._stars_cy))
			star_data["name"] = "star" .. tostring(i)
		end

		self:set_offshore_text()
	end
	
	local data = CrimeNetContractGui.count_difficulty_stars
	function CrimeNetContractGui:count_difficulty_stars(t, dt)
		data(self, t, dt)
		
		local stars = self._contract_panel:child("star".. self._data.stars.job_stars - (self._current_difficulty_star <= 0 and self._data.stars.job_stars <= 1 and 0 or 1) + self._current_difficulty_star)
		
		stars:set_color(tweak_data.screen_colors.risk)
		if self._current_difficulty_star > 3 then
			stars:set_color(tweak_data.screen_colors.pro_color)
		end
		
		if self._current_difficulty_star <= 0 and self._data.stars.job_stars <= 1 then
			stars:set_color(Color.black)
		elseif self._current_difficulty_star <= 0 then
			stars:set_color(tweak_data.screen_colors.text)
		end
	end
	
	function CrimeNetContractGui:set_potential_rewards(show_max)
		if self._step <= #self._steps then
			return
		end

		local job_data = self._node:parameters().menu_component_data
		local narrative = tweak_data.narrative:job_data(job_data.job_id)
		local narrative_chains = tweak_data.narrative:job_chain(job_data.job_id)
		local job_stars = narrative.jc / 10
		local difficulty_stars = job_data.difficulty_id - 2
		local diff = job_data.difficulty_id == 7 and difficulty_stars - 1 or job_data.difficulty_id == 6 and difficulty_stars + 1 or difficulty_stars
		local gui_panel = self._contract_panel
		local potential_level_up_text = gui_panel:child("potential_level_up_text")
		local job_heat_value = managers.job:get_job_heat(job_data.job_id)
		local contract_visuals = job_data.contract_visuals or {}
		local total_xp, dissected_xp, total_payout, base_payout, risk_payout = nil

		if show_max then
			local xp_max = contract_visuals.max_mission_xp and (type(contract_visuals.max_mission_xp) == "table" and contract_visuals.max_mission_xp[difficulty_stars + 1] or contract_visuals.max_mission_xp) or 0
			total_xp, dissected_xp = managers.experience:get_contract_xp_by_stars(job_data.job_id, job_stars, difficulty_stars, job_data.professional, #narrative_chains, {
				ignore_heat = job_heat_value > 0 and self._customizable,
				mission_xp = xp_max
			})
			total_payout, base_payout, risk_payout = managers.money:get_contract_money_by_stars(job_stars, difficulty_stars, #narrative_chains, job_data.job_id, nil, {
				mandatory_bags_value = contract_visuals.mandatory_bags_value and contract_visuals.mandatory_bags_value[difficulty_stars + 1],
				bonus_bags_value = contract_visuals.bonus_bags_value and contract_visuals.bonus_bags_value[difficulty_stars + 1],
				small_value = contract_visuals.small_value and contract_visuals.small_value[difficulty_stars + 1],
				vehicle_value = contract_visuals.vehicle_value and contract_visuals.vehicle_value[difficulty_stars + 1]
			})
		else
			local xp_min = contract_visuals.min_mission_xp and (type(contract_visuals.min_mission_xp) == "table" and contract_visuals.min_mission_xp[difficulty_stars + 1] or contract_visuals.min_mission_xp) or 0
			total_xp, dissected_xp = managers.experience:get_contract_xp_by_stars(job_data.job_id, job_stars, difficulty_stars, job_data.professional, #narrative_chains, {
				ignore_heat = job_heat_value > 0 and self._customizable,
				mission_xp = xp_min
			})
			total_payout, base_payout, risk_payout = managers.money:get_contract_money_by_stars(job_stars, difficulty_stars, #narrative_chains, job_data.job_id)
		end

		local base_xp, risk_xp, heat_base_xp, heat_risk_xp, ghost_base_xp, ghost_risk_xp = unpack(dissected_xp)
		local num_stages_string = tostring(#narrative_chains) .. " x "
		local xp = base_xp
		local gui_xp = gui_panel:child("job_xp")
		local gui_add_xp = gui_panel:child("add_xp")
		local gui_heat_add_xp = gui_panel:child("heat_add_xp")
		local gui_ghost_add_xp = gui_panel:child("ghost_add_xp")
		local heat_xp = heat_base_xp + heat_risk_xp
		local ghost_xp = ghost_base_xp + ghost_risk_xp
		local risk_prefix = risk_xp >= 0 and " +" or " -"
		local heat_prefix = heat_xp >= 0 and " +" or " -"
		local ghost_prefix = ghost_xp >= 0 and " +" or " -"
		local abs_risk_xp = math.abs(risk_xp)
		local abs_heat_xp = math.abs(heat_xp)
		local abs_ghost_xp = math.abs(ghost_xp)

		local job_and_diff = job_stars + diff
		local edge = 10
		for i = 1, 14 do
			self._contract_panel:child("star"..i):set_color(i >= (job_and_diff > edge and job_and_diff or edge) and Color.green:with_alpha(0) or i >= job_and_diff and Color.black or i >= job_and_diff - (diff - 3) and tweak_data.screen_colors.pro_color or i >= job_stars and tweak_data.screen_colors.risk or Color.white)
		end
		
		gui_xp:set_text(managers.money:add_decimal_marks_to_string(tostring(xp)))
		self:make_fine_text(gui_xp)
		gui_add_xp:set_text(risk_prefix .. managers.money:add_decimal_marks_to_string(tostring(abs_risk_xp)))
		self:make_fine_text(gui_add_xp)
		gui_heat_add_xp:set_text(heat_prefix .. managers.money:add_decimal_marks_to_string(tostring(abs_heat_xp)))
		self:make_fine_text(gui_heat_add_xp)
		gui_ghost_add_xp:set_text(ghost_prefix .. managers.money:add_decimal_marks_to_string(tostring(abs_ghost_xp)))
		self:make_fine_text(gui_ghost_add_xp)

		if potential_level_up_text and not managers.experience:reached_level_cap() then
			local gain_xp = base_xp + risk_xp + heat_xp + ghost_xp
			local levels_gained = managers.experience:get_levels_gained_from_xp(gain_xp)
			local levelup_text = managers.localization:to_upper_text("menu_levelup", {
				levels = string.format("%0.1d%%", levels_gained * 100)
			})

			potential_level_up_text:set_text(levelup_text)
			self:make_fine_text(potential_level_up_text)
			self:_check_level_up(levels_gained)
		end

		self:_update_xp_appendices()

		local job_cash = base_payout
		local gui_job_cash = gui_panel:child("job_cash")
		local gui_job_add_cash = gui_panel:child("job_add_cash")

		gui_job_cash:set_text(managers.experience:cash_string(job_cash))
		self:make_fine_text(gui_job_cash)
		gui_job_add_cash:set_x(math.round(gui_job_cash:right()))

		local job_cash = risk_payout
		local gui_job_add_cash = gui_panel:child("job_add_cash")

		gui_job_add_cash:set_text(" +" .. managers.experience:cash_string(job_cash))
		self:make_fine_text(gui_job_add_cash)

		local risks = {
			"risk_swat",
			"risk_fbi",
			"risk_death_squad"
		}

		if not Global.SKIP_OVERKILL_290 then
			if job_data.difficulty == "easy_wish" or job_data.difficulty == "sm_wish" then
				table.insert(risks, "risk_easy_wish")
			end
			table.insert(risks, "risk_murder_squad")
			if job_data.difficulty == "sm_wish" then
				table.insert(risks, "risk_sm_wish")
			end
		end

		for i, risk in ipairs(risks) do
			gui_panel:child(risk):set_alpha(i <= diff and 1 or 0.25)
			gui_panel:child(risk):set_color(i <= diff and tweak_data.screen_colors.risk or Color.white)

			local this_difficulty = i == diff
			local active = i <= diff
			local color = active and tweak_data.screen_colors.risk or Color.white
			local alpha = this_difficulty and 1 or 0.5

			gui_panel:child("risk_stats_panel"):child(risk):set_color(color)
			gui_panel:child("risk_stats_panel"):child(risk):set_alpha(alpha)
		end

		gui_panel:child("risk_text"):show()
		gui_panel:child("payday_text"):set_text(managers.localization:to_upper_text("menu_payday", {
			MONEY = managers.experience:cash_string(total_payout)
		}))
		self:make_fine_text(gui_panel:child("payday_text"))

		local can_afford = managers.money:can_afford_buy_premium_contract(job_data.job_id, job_data.difficulty_id)
		local text_id = MenuCallbackHandler:bang_active() and "menu_cn_premium_buy_fee_short" or "menu_cn_premium_buy_fee"
		local text_string = managers.localization:to_upper_text(text_id, {
			contract_fee = "##" .. managers.experience:cash_string(managers.money:get_cost_of_premium_contract(job_data.job_id, job_data.difficulty_id)) .. "##"
		})

		local premium_text = gui_panel:child("premium_text")
		managers.menu:color_range(
			premium_text,
			not can_afford and tweak_data.screen_colors.pro_color or tweak_data.screen_colors.button_stage_2,
			text_string
		)

		self:set_offshore_account()
	end

	function CrimeNetContractGui:set_all(t, dt)
		local job_data = self._node:parameters().menu_component_data
		local narrative = tweak_data.narrative:job_data(job_data.job_id)
		local narrative_chains = tweak_data.narrative:job_chain(job_data.job_id)
		local job_stars = narrative.jc / 10
		local difficulty_stars = job_data.difficulty_id - 2
		local diff = job_data.difficulty_id == 7 and difficulty_stars - 1 or job_data.difficulty_id == 6 and difficulty_stars + 1 or difficulty_stars
		local gui_panel = self._contract_panel
		local potential_level_up_text = gui_panel:child("potential_level_up_text")
		local job_heat_value = managers.job:get_job_heat(job_data.job_id)
		local contract_visuals = job_data.contract_visuals or {}
		local xp_min = contract_visuals.min_mission_xp and (type(contract_visuals.min_mission_xp) == "table" and contract_visuals.min_mission_xp[difficulty_stars + 1] or contract_visuals.min_mission_xp) or 0
		local total_xp, dissected_xp = managers.experience:get_contract_xp_by_stars(job_data.job_id, job_stars, difficulty_stars, job_data.professional, #narrative_chains, {
			ignore_heat = job_heat_value > 0 and self._customizable,
			mission_xp = xp_min
		})
		local total_payout, base_payout, risk_payout = managers.money:get_contract_money_by_stars(job_stars, difficulty_stars, #narrative_chains, job_data.job_id)
		local base_xp, risk_xp, heat_base_xp, heat_risk_xp, ghost_base_xp, ghost_risk_xp = unpack(dissected_xp)
		local num_stages_string = tostring(#narrative_chains) .. " x "
		local xp = base_xp
		local gui_xp = gui_panel:child("job_xp")
		local gui_add_xp = gui_panel:child("add_xp")
		local gui_heat_add_xp = gui_panel:child("heat_add_xp")
		local gui_ghost_add_xp = gui_panel:child("ghost_add_xp")
		local heat_xp = heat_base_xp + heat_risk_xp
		local ghost_xp = ghost_base_xp + ghost_risk_xp
		local risk_prefix = risk_xp >= 0 and " +" or " -"
		local heat_prefix = heat_xp >= 0 and " +" or " -"
		local ghost_prefix = ghost_xp >= 0 and " +" or " -"
		local abs_risk_xp = math.abs(risk_xp)
		local abs_heat_xp = math.abs(heat_xp)
		local abs_ghost_xp = math.abs(ghost_xp)

		local job_and_diff = job_stars + diff
		local edge = 10
		for i = 1, 14 do
			self._contract_panel:child("star"..i):set_color(i >= (job_and_diff > edge and job_and_diff or edge) and Color.green:with_alpha(0) or i >= job_and_diff and Color.black or i >= job_and_diff - (diff - 3) and tweak_data.screen_colors.pro_color or i >= job_stars and tweak_data.screen_colors.risk or Color.white)
		end

		gui_xp:set_text(managers.money:add_decimal_marks_to_string(tostring(xp)))
		self:make_fine_text(gui_xp)
		gui_add_xp:set_text(risk_prefix .. managers.money:add_decimal_marks_to_string(tostring(abs_risk_xp)))
		self:make_fine_text(gui_add_xp)
		gui_heat_add_xp:set_text(heat_prefix .. managers.money:add_decimal_marks_to_string(tostring(abs_heat_xp)))
		self:make_fine_text(gui_heat_add_xp)
		gui_ghost_add_xp:set_text(ghost_prefix .. managers.money:add_decimal_marks_to_string(tostring(abs_ghost_xp)))
		self:make_fine_text(gui_ghost_add_xp)

		local job_cash = base_payout
		local gui_job_cash = gui_panel:child("job_cash")
		local gui_job_add_cash = gui_panel:child("job_add_cash")

		gui_job_cash:set_text(managers.experience:cash_string(job_cash))
		self:make_fine_text(gui_job_cash)
		gui_job_add_cash:set_x(math.round(gui_job_cash:right()))

		if potential_level_up_text and not managers.experience:reached_level_cap() then
			local gain_xp = base_xp + risk_xp + heat_xp + ghost_xp
			local levels_gained = managers.experience:get_levels_gained_from_xp(gain_xp)
			local levelup_text = managers.localization:to_upper_text("menu_levelup", {
				levels = string.format("%0.1d%%", levels_gained * 100)
			})

			potential_level_up_text:set_text(levelup_text)
			self:make_fine_text(potential_level_up_text)
			self:_check_level_up(levels_gained)
		end

		self:_update_xp_appendices()

		local job_cash = risk_payout
		local gui_job_add_cash = gui_panel:child("job_add_cash")

		gui_job_add_cash:set_text(" +" .. managers.experience:cash_string(job_cash))
		self:make_fine_text(gui_job_add_cash)

		local risks = {
			"risk_swat",
			"risk_fbi",
			"risk_death_squad"
		}

		if not Global.SKIP_OVERKILL_290 then
			if job_data.difficulty == "easy_wish" or job_data.difficulty == "sm_wish" then
				table.insert(risks, "risk_easy_wish")
			end
			table.insert(risks, "risk_murder_squad")
			if job_data.difficulty == "sm_wish" then
				table.insert(risks, "risk_sm_wish")
			end
		end

		for i, risk in ipairs(risks) do
			gui_panel:child(risk):set_alpha(i <= diff and 1 or 0.25)
			gui_panel:child(risk):set_color(i <= diff and tweak_data.screen_colors.risk or Color.white)

			local this_difficulty = i == diff
			local active = i <= diff
			local color = active and tweak_data.screen_colors.risk or Color.white
			local alpha = this_difficulty and 1 or 0.5

			gui_panel:child("risk_stats_panel"):child(risk):set_color(color)
			gui_panel:child("risk_stats_panel"):child(risk):set_alpha(alpha)
		end

		gui_panel:child("risk_text"):show()
		gui_panel:child("payday_text"):set_text(managers.localization:to_upper_text("menu_payday", {
			MONEY = managers.experience:cash_string(total_payout)
		}))
		self:make_fine_text(gui_panel:child("payday_text"))

		local can_afford = managers.money:can_afford_buy_premium_contract(job_data.job_id, job_data.difficulty_id)
		local text_id = MenuCallbackHandler:bang_active() and "menu_cn_premium_buy_fee_short" or "menu_cn_premium_buy_fee"
		local text_string = managers.localization:to_upper_text(text_id, {
			contract_fee = "##" .. managers.experience:cash_string(managers.money:get_cost_of_premium_contract(job_data.job_id, job_data.difficulty_id)) .. "##"
		})

		local premium_text = gui_panel:child("premium_text")
		managers.menu:color_range(
			premium_text,
			not can_afford and tweak_data.screen_colors.pro_color or tweak_data.screen_colors.button_stage_2,
			text_string
		)
		
		if self._step == 2 then
			self._step = self._step + 1
		end

		self:set_offshore_account()
	end

	function CrimeNetContractGui:set_offshore_text()
		local premium_text = self._contract_panel:child("premium_text")
		if alive(premium_text) then
			local offshore_text = self._contract_panel:text({
				text = "",
				name = "offshore_text",
				wrap = true,
				blend_mode = "add",
				word_wrap = true,
				font_size = tweak_data.menu.pd2_small_font_size,
				font = tweak_data.menu.pd2_small_font,
				color = tweak_data.screen_colors.button_stage_3
			})
			offshore_text:set_left(premium_text:left())offshore_text:set_bottom(premium_text:bottom() + 20)
		end
	end

	function CrimeNetContractGui:set_offshore_account()
		local job_data = self._node:parameters().menu_component_data
		local gui_panel = self._contract_panel
		local can_afford = managers.money:can_afford_buy_premium_contract(job_data.job_id, job_data.difficulty_id)
		local offshore_text = gui_panel:child("offshore_text")
		local offshore = managers.money:offshore()
		local contract_cost = managers.money:get_cost_of_premium_contract(job_data.job_id, job_data.difficulty_id)
		local remains = not can_afford and "$0" or managers.experience:cash_string(offshore - contract_cost)
		local offshore_string = managers.localization:to_upper_text("menu_offshore_remains") .. ": " .. "##" .. remains .. "##"	

		managers.menu:color_range(
			offshore_text,
			not can_afford and tweak_data.screen_colors.pro_color or tweak_data.screen_colors.friend_color,
			offshore_string
		)
	end
end
if string.lower(RequiredScript) == "lib/managers/crimenetmanager" then
	function CrimeNetManager:get_jobs_by_player_stars(span)
		local t = {}
		local pstars = managers.experience:level_to_stars() * 10
		span = span or 20

		for _, job_id in ipairs(tweak_data.narrative:get_jobs_index()) do
			local pass_all_tests = true
			pass_all_tests = pass_all_tests and not tweak_data.narrative:is_job_locked(job_id)

			if pass_all_tests then
				local job_data = tweak_data.narrative:job_data(job_id)
				local start_difficulty = job_data.professional and 1 or 0
				local num_difficulties = Global.SKIP_OVERKILL_290 and 5 or job_data.professional and 6 or 6

				for i = start_difficulty, num_difficulties, 1 do
					local job_jc = math.clamp(job_data.jc + i * 10, 0, 100)
					local difficulty_id = 2 + i
					local difficulty = tweak_data:index_to_difficulty(difficulty_id)

					local list = {
						{2, "normal"},
						{3, "hard"},
						{4, "overkill"},
						{5, "overkill_145"},
						{7, "overkill_290"},
						{6, "easy_wish"},
						{8, "sm_wish"}
					}
					
					local diff_id = difficulty_id
					local diff = difficulty
					local prank = managers.experience:current_rank()
					local csrank = managers.crime_spree:highest_level()
					
					local first = job_data.professional and 2 or 1
					local easy_chance = math.random() > tweak_data.easy_wish_drop_chance and math.random(first, 4) or 6
					local sm_chance = math.random() > tweak_data.sm_wish_drop_chance and math.random(first, 5) or 7
					local easy_wish = list[tweak_data.unlock_mayhem > prank and math.random(first, 4) or easy_chance]
					local sm_wish = list[tweak_data.unlock_death_sentence > csrank and math.random(first, 5) or sm_chance]
					
					if difficulty_id == 8 then
						diff_id = sm_wish[1]
						diff = sm_wish[2]
					elseif difficulty_id == 6 then
						diff_id = easy_wish[1]
						diff = easy_wish[2]
					end
					
					if job_jc <= pstars + span and job_jc >= pstars - span then
						table.insert(t, {
							job_jc = job_jc,
							job_id = job_id,
							difficulty_id = diff_id,
							difficulty = diff,
							marker_dot_color = job_data.marker_dot_color or nil,
							color_lerp = job_data.color_lerp or nil
						})
					end
				end
			else
				print("SKIP DUE TO COOLDOWN OR THE JOB IS WRAPPED INSIDE AN OTHER JOB", job_id)
			end
		end

		return t
	end

	function CrimeNetManager:_get_jobs_by_jc()
		local t = {}
		local plvl = managers.experience:current_level()
		local prank = managers.experience:current_rank()

		for _, job_id in ipairs(tweak_data.narrative:get_jobs_index()) do
			local is_cooldown_ok = managers.job:check_ok_with_cooldown(job_id)
			local is_not_wrapped = not tweak_data.narrative.jobs[job_id].wrapped_to_job
			local dlc = tweak_data.narrative:job_data(job_id).dlc
			local is_not_dlc_or_got = not dlc or managers.dlc:is_dlc_unlocked(dlc)
			local pass_all_tests = is_cooldown_ok and is_not_wrapped and is_not_dlc_or_got
			pass_all_tests = pass_all_tests and not tweak_data.narrative:is_job_locked(job_id)

			if pass_all_tests then
				local job_data = tweak_data.narrative:job_data(job_id)
				local start_difficulty = job_data.professional and 1 or 0
				local num_difficulties = Global.SKIP_OVERKILL_290 and 5 or job_data.professional and 6 or 6

				for i = start_difficulty, num_difficulties, 1 do
					local job_jc = math.clamp(job_data.jc + i * 10, 0, 100)
					local difficulty_id = 2 + i
					local difficulty = tweak_data:index_to_difficulty(difficulty_id)
					local level_lock = tweak_data.difficulty_level_locks[difficulty_id] or 0
					local is_not_level_locked = prank >= 1 or level_lock <= plvl
					
					local list = {
						{2, "normal"},
						{3, "hard"},
						{4, "overkill"},
						{5, "overkill_145"},
						{7, "overkill_290"},
						{6, "easy_wish"},
						{8, "sm_wish"}
					}
					
					local diff_id = difficulty_id
					local diff = difficulty
					local prank = managers.experience:current_rank()
					local csrank = managers.crime_spree:highest_level()
					
					local first = job_data.professional and 2 or 1
					local easy_chance = math.random() > tweak_data.easy_wish_drop_chance and math.random(first, 4) or 6
					local sm_chance = math.random() > tweak_data.sm_wish_drop_chance and math.random(first, 5) or 7
					local easy_wish = list[tweak_data.unlock_mayhem > prank and math.random(first, 4) or easy_chance]
					local sm_wish = list[tweak_data.unlock_death_sentence > csrank and math.random(first, 5) or sm_chance]
					
					if difficulty_id == 8 then
						diff_id = sm_wish[1]
						diff = sm_wish[2]
					elseif difficulty_id == 6 then
						diff_id = easy_wish[1]
						diff = easy_wish[2]
					end
					
					if is_not_level_locked then
						t[job_jc] = t[job_jc] or {}

						table.insert(t[job_jc], {
							job_id = job_id,
							difficulty_id = diff_id,
							difficulty = diff,
							marker_dot_color = job_data.marker_dot_color or nil,
							color_lerp = job_data.color_lerp or nil
						})
					end
				end
			else
				print("SKIP DUE TO COOLDOWN OR THE JOB IS WRAPPED INSIDE AN OTHER JOB", job_id)
			end
		end

		return t
	end
	
	function CrimeNetManager:_setup()
		if self._presets then
			return
		end

		self._presets = {}
		local plvl = managers.experience:current_level()
		local player_stars = math.clamp(math.ceil((plvl + 1) / 10), 1, 10)
		local stars = player_stars
		local jc = math.lerp(0, 100, stars / 10)
		local jcs = tweak_data.narrative.STARS[stars].jcs
		local no_jcs = #jcs
		local chance_curve = tweak_data.narrative.STARS_CURVES[player_stars]
		local start_chance = tweak_data.narrative.JC_CHANCE
		local jobs_by_jc = self:_get_jobs_by_jc()
		local no_picks = self:_number_of_jobs(jcs, jobs_by_jc)
		local j = 0
		local tests = 0

		while j < no_picks do
			for i = 1, no_jcs, 1 do
				local chance = nil

				if no_jcs - 1 == 0 then
					chance = 1
				else
					chance = math.lerp(start_chance, 1, math.pow((i - 1) / (no_jcs - 1), chance_curve))
				end

				if not jobs_by_jc[jcs[i]] then
				elseif #jobs_by_jc[jcs[i]] ~= 0 then
					local job_data = nil

					if self._debug_mass_spawning then
						job_data = jobs_by_jc[jcs[i]][math.random(#jobs_by_jc[jcs[i]])]
					else
						job_data = table.remove(jobs_by_jc[jcs[i]], math.random(#jobs_by_jc[jcs[i]]))
					end

					local job_tweak = tweak_data.narrative:job_data(job_data.job_id)
					local chance_multiplier = job_tweak and job_tweak.spawn_chance_multiplier or 1
					job_data.chance = chance * chance_multiplier

					table.insert(self._presets, job_data)

					j = j + 1

					break
				end
			end

			tests = tests + 1

			if self._debug_mass_spawning then
				if tweak_data.gui.crime_net.debug_options.mass_spawn_limit <= tests then
					break
				end
			elseif no_picks <= tests then
				break
			end
		end

		local old_presets = self._presets
		self._presets = {}

		while #old_presets > 0 do
			table.insert(self._presets, table.remove(old_presets, math.random(#old_presets)))
		end
	end
	
	-- function CrimeNetManager:update_difficulty_filter()
		-- if self._presets then
			-- self._presets = nil
			-- self:_setup()
		-- end
	-- end

	function CrimeNetGui:_create_job_gui(data, type, fixed_x, fixed_y, fixed_location)
		local level_id = data.level_id
		local level_data = tweak_data.levels[level_id]
		local narrative_data = data.job_id and tweak_data.narrative:job_data(data.job_id)
		local is_special = type == "special" or type == "crime_spree"
		local is_server = type == "server"
		local is_crime_spree = type == "crime_spree"
		local is_professional = narrative_data and narrative_data.professional
		local got_job = data.job_id and true or false
		local x = fixed_x
		local y = fixed_y
		local location = fixed_location

		if is_special then
			x = data.x
			y = data.y

			if x and y then
				local tw = math.max(self._map_panel:child("map"):texture_width(), 1)
				local th = math.max(self._map_panel:child("map"):texture_height(), 1)
				x = math.round(x / tw * self._map_size_w)
				y = math.round(y / th * self._map_size_h)
			end
		end

		if not x and not y then
			x, y, location = self:_get_job_location(data)
		end

		if location and location[3] then
			Application:error("[CrimeNetGui:_create_job_gui] Location already taken!", x, y)
		end

		local color = Color.white
		local friend_color = tweak_data.screen_colors.friend_color
		local regular_color = tweak_data.screen_colors.regular_color
		local pro_color = tweak_data.screen_colors.pro_color
		local side_panel = self._pan_panel:panel({
			alpha = 0,
			layer = 26
		})
		local heat_glow = nil
		local stars_panel = side_panel:panel({
			w = 100,
			name = "stars_panel",
			visible = true,
			layer = -1
		})
		local num_stars = 0
		local star_size = 8
		local job_num = 0
		local job_cash = 0
		local one_down_active = data.one_down == 1
		local difficulty_name = side_panel:text({
			text = "",
			name = "difficulty_name",
			vertical = "center",
			blend_mode = "add",
			layer = 0,
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			color = color
		})
		local one_down_label = one_down_active and side_panel:text({
			name = "one_down_label",
			vertical = "center",
			blend_mode = "add",
			layer = 0,
			text = managers.localization:to_upper_text("menu_one_down"),
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			color = tweak_data.screen_colors.one_down
		})
		local heat_name = side_panel:text({
			text = "",
			name = "heat_name",
			vertical = "center",
			blend_mode = "add",
			layer = 0,
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			color = color
		})
		local got_heat = false
		local range_colors = {}
		local text_string = managers.localization:to_upper_text("menu_exp_short")

		local function mul_to_procent_string(multiplier)
			local pro = math.round(multiplier * 100)
			local procent_string = nil

			if pro == 0 and multiplier ~= 0 then
				procent_string = string.format("%0.2f", math.abs(multiplier * 100))
			else
				procent_string = tostring(math.abs(pro))
			end

			return (multiplier < 0 and " -" or " +") .. procent_string .. "%"
		end

		local got_heat_text = false
		local has_ghost_bonus = managers.job:has_ghost_bonus()

		if has_ghost_bonus then
			local ghost_bonus_mul = managers.job:get_ghost_bonus()
			local job_ghost_string = mul_to_procent_string(ghost_bonus_mul)
			local s = utf8.len(text_string)
			text_string = text_string .. job_ghost_string

			table.insert(range_colors, {
				s,
				utf8.len(text_string),
				tweak_data.screen_colors.ghost_color
			})

			got_heat_text = true
		end

		if false then
			local skill_bonus = managers.player:get_skill_exp_multiplier()
			skill_bonus = skill_bonus - 1

			if skill_bonus > 0 then
				local s = utf8.len(text_string)
				local skill_string = mul_to_procent_string(skill_bonus)
				text_string = text_string .. skill_string

				table.insert(range_colors, {
					s,
					utf8.len(text_string),
					tweak_data.screen_colors.skill_color
				})

				got_heat_text = true
			end

			local infamy_bonus = managers.player:get_infamy_exp_multiplier()
			infamy_bonus = infamy_bonus - 1

			if infamy_bonus > 0 then
				local s = utf8.len(text_string)
				local infamy_string = mul_to_procent_string(infamy_bonus)
				text_string = text_string .. infamy_string

				table.insert(range_colors, {
					s,
					utf8.len(text_string),
					tweak_data.lootdrop.global_values.infamy.color
				})

				got_heat_text = true
			end

			local limited_bonus = managers.player:get_limited_exp_multiplier(data.job_id, data.level_id)
			limited_bonus = limited_bonus - 1

			if limited_bonus > 0 then
				local s = utf8.len(text_string)
				local limited_string = mul_to_procent_string(limited_bonus)
				text_string = text_string .. limited_string

				table.insert(range_colors, {
					s,
					utf8.len(text_string),
					tweak_data.screen_colors.button_stage_2
				})

				got_heat_text = true
			end
		end

		local job_heat = managers.job:get_job_heat(data.job_id) or 0
		local job_heat_mul = managers.job:heat_to_experience_multiplier(job_heat) - 1

		if data.job_id then
			local x = 0
			local y = 0
			local job_stars = math.ceil(tweak_data.narrative.jobs[data.job_id].jc / 10)
			local diff = data.difficulty_id
			local difficulty_stars = diff - (diff == 6 and 1 or diff == 7 and 3 or 2)
			local job_and_difficulty_stars = job_stars + difficulty_stars
			local risk_color = tweak_data.screen_colors.risk
			local hate_risk = diff == 8 and 3 or diff == 7 and 1 or diff == 6 and 2 or 0
			local edge = 10
			for i = 1, 15 do
				stars_panel:bitmap({
					texture = "guis/textures/pd2/crimenet_paygrade_marker",
					x = x,
					y = y,
					blend_mode = "normal",
					layer = 0,
					rotation = 360,
					color = ((i > (job_and_difficulty_stars > edge and job_and_difficulty_stars or edge)) and Color.green:with_alpha(0)) or ((i > job_and_difficulty_stars) and Color.black) or ((i > job_and_difficulty_stars - hate_risk) and Color.red) or ((i > job_stars) and risk_color) or color
				})
				
				x = x + star_size
				
				num_stars = num_stars + 1
			end

			job_num = #tweak_data.narrative:job_chain(data.job_id)
			local total_payout, base_payout, risk_payout = managers.money:get_contract_money_by_stars(job_stars, difficulty_stars, job_num, data.job_id)
			job_cash = managers.experience:cash_string(math.round(total_payout))
			local difficulty_string = managers.localization:to_upper_text(tweak_data.difficulty_name_ids[tweak_data.difficulties[data.difficulty_id]])

			difficulty_name:set_text(difficulty_string)

			local hate_difficulties = data.difficulty_id >= 6
			difficulty_name:set_color(hate_difficulties and Color(255, 255, 104, 0) / 255 or difficulty_stars > 0 and tweak_data.screen_colors.risk or tweak_data.screen_colors.text)

			local heat_alpha = math.abs(job_heat) / 100
			local heat_size = 1
			local heat_color = managers.job:get_job_heat_color(data.job_id)
			heat_glow = self._pan_panel:bitmap({
				texture = "guis/textures/pd2/hot_cold_glow",
				blend_mode = "add",
				alpha = 0,
				layer = 11,
				w = 256 * heat_size,
				h = 256 * heat_size,
				color = heat_color
			})

			if job_heat_mul ~= 0 then
				local s = utf8.len(text_string)
				local heat_string = mul_to_procent_string(job_heat_mul)
				text_string = text_string .. heat_string

				table.insert(range_colors, {
					s,
					utf8.len(text_string),
					heat_color
				})

				got_heat = true
				got_heat_text = true

				heat_glow:set_alpha(heat_alpha)
			end
		end

		heat_name:set_text(text_string)

		for i, range in ipairs(range_colors) do
			if i == 1 then
				local s, e, c = unpack(range)

				heat_name:set_range_color(0, e, c)
			else
				heat_name:set_range_color(unpack(range))
			end
		end

		local job_tweak = tweak_data.narrative:job_data(data.job_id)
		local host_string = data.host_name or is_professional and managers.localization:to_upper_text("cn_menu_pro_job") or " "
		local job_string = data.job_id and managers.localization:to_upper_text(job_tweak.name_id) or data.level_name or "NO JOB"
		local contact_string = utf8.to_upper(data.job_id and managers.localization:text(tweak_data.narrative.contacts[job_tweak.contact].name_id)) or "BAIN"
		contact_string = contact_string .. ": "
		local info_string = managers.localization:to_upper_text("cn_menu_contract_short_" .. (job_num > 1 and "plural" or "singular"), {
			days = job_num,
			money = job_cash
		})
		info_string = info_string .. (data.state_name and " / " .. data.state_name or "")

		if is_special then
			job_string = data.name_id and managers.localization:to_upper_text(data.name_id) or ""
			info_string = data.desc_id and managers.localization:to_upper_text(data.desc_id) or ""

			if is_crime_spree then
				if managers.crime_spree:in_progress() then
					info_string = "cn_crime_spree_help_continue"
				else
					info_string = "cn_crime_spree_help_start"
				end

				info_string = managers.localization:to_upper_text(info_string) or ""
			end
		end

		local job_plan_icon = nil

		if is_server and data.job_plan and data.job_plan ~= -1 then
			local texture = data.job_plan == 1 and "guis/textures/pd2/cn_playstyle_loud" or "guis/textures/pd2/cn_playstyle_stealth"
			job_plan_icon = side_panel:bitmap({
				name = "job_plan_icon",
				h = 16,
				w = 16,
				alpha = 1,
				blend_mode = "normal",
				y = 2,
				x = 0,
				layer = 0,
				texture = texture,
				color = Color.white
			})
		end

		local host_name = side_panel:text({
			name = "host_name",
			vertical = "center",
			blend_mode = "add",
			text = host_string,
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			color = data.is_friend and friend_color or is_server and regular_color or pro_color
		})
		local job_name = side_panel:text({
			name = "job_name",
			vertical = "center",
			blend_mode = "normal",
			layer = 0,
			text = job_string,
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			color = color
		})
		local contact_name = side_panel:text({
			name = "contact_name",
			vertical = "center",
			blend_mode = "normal",
			layer = 0,
			text = contact_string,
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			color = color
		})
		local info_name = side_panel:text({
			name = "info_name",
			vertical = "center",
			blend_mode = "normal",
			layer = 0,
			text = info_string,
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			color = color
		})

		if data.mutators then
			job_name:set_color(tweak_data.screen_colors.mutators_color_text)
			contact_name:set_color(tweak_data.screen_colors.mutators_color_text)
			info_name:set_color(tweak_data.screen_colors.mutators_color_text)
		end

		if is_crime_spree or data.is_crime_spree then
			job_name:set_color(tweak_data.screen_colors.crime_spree_risk)
			contact_name:set_color(tweak_data.screen_colors.crime_spree_risk)
			info_name:set_color(tweak_data.screen_colors.crime_spree_risk)

			if is_crime_spree then
				stars_panel:text({
					name = "spree_level",
					vertical = "center",
					blend_mode = "normal",
					layer = 0,
					text = managers.localization:to_upper_text("menu_cs_level", {
						level = managers.experience:cash_string(managers.crime_spree:spree_level(), "")
					}),
					font = tweak_data.menu.pd2_small_font,
					font_size = tweak_data.menu.pd2_small_font_size,
					color = tweak_data.screen_colors.crime_spree_risk
				})
			end
		end

		if data.is_skirmish then
			contact_name:set_color(tweak_data.screen_colors.skirmish_color)
			job_name:set_color(tweak_data.screen_colors.skirmish_color)
		end

		stars_panel:set_w(star_size * math.min(11, #stars_panel:children()))
		stars_panel:set_h(star_size)

		local focus = self._pan_panel:bitmap({
			texture = "guis/textures/crimenet_map_circle",
			name = "focus",
			blend_mode = "add",
			layer = 10,
			color = color:with_alpha(0.6)
		})
		
		local name_x = job_plan_icon and job_plan_icon:right() + 2 or 0
		local _, _, w, h = host_name:text_rect()

		host_name:set_size(w, h)
		host_name:set_position(name_x, 0)

		if not is_server then
		end

		local _, _, w, h = job_name:text_rect()

		job_name:set_size(w, h)
		job_name:set_position(0, host_name:bottom() - 2)

		local _, _, w, h = contact_name:text_rect()

		contact_name:set_size(w, h)
		contact_name:set_top(job_name:top())
		contact_name:set_right(0)

		local _, _, w, h = info_name:text_rect()

		info_name:set_size(w, h - 3)
		info_name:set_top(contact_name:bottom() - 3)
		info_name:set_right(0)

		local _, _, w, h = difficulty_name:text_rect()

		difficulty_name:set_size(w, h)
		difficulty_name:set_top(info_name:bottom() - 3)
		difficulty_name:set_right(0)

		if one_down_active then
			local _, _, w, h = one_down_label:text_rect()

			one_down_label:set_size(w, h - 4)
			one_down_label:set_top(difficulty_name:bottom() - 3)
			one_down_label:set_right(0)
		end

		local _, _, w, h = heat_name:text_rect()

		heat_name:set_size(w, h - 4)
		heat_name:set_top(one_down_active and one_down_label:bottom() - 3 or difficulty_name:bottom() - 3)
		heat_name:set_right(0)

		if not got_heat_text then
			heat_name:set_text(" ")
			heat_name:set_w(1)
			heat_name:set_position(0, host_name:bottom() - 3)
		end

		if is_special then
			contact_name:set_text(" ")
			contact_name:set_size(0, 0)
			contact_name:set_position(0, host_name:bottom())
			difficulty_name:set_text(" ")
			difficulty_name:set_w(0, 0)
			difficulty_name:set_position(0, host_name:bottom())
			heat_name:set_text(" ")
			heat_name:set_w(0, 0)
			heat_name:set_position(0, host_name:bottom())
		elseif data.is_crime_spree then
			local text = ""

			if tweak_data:server_state_to_index("in_lobby") < data.state then
				local mission_data = managers.crime_spree:get_mission(data.crime_spree_mission)

				if mission_data then
					local tweak = tweak_data.levels[mission_data.level.level_id]
					text = managers.localization:text(tweak and tweak.name_id or "No level")
				else
					text = "No mission ID"
				end
			else
				text = managers.localization:text("menu_lobby_server_state_in_lobby")
			end

			job_name:set_text(utf8.to_upper(text))

			local _, _, w, h = job_name:text_rect()

			job_name:set_size(w, h)
			job_name:set_position(0, host_name:bottom())
			contact_name:set_text(" ")
			contact_name:set_w(0, 0)
			contact_name:set_position(0, host_name:bottom())
			info_name:set_text(" ")
			info_name:set_size(0, 0)
			info_name:set_position(0, host_name:bottom())
			difficulty_name:set_text(" ")
			difficulty_name:set_w(0, 0)
			difficulty_name:set_position(0, host_name:bottom())
			heat_name:set_text(" ")
			heat_name:set_w(0, 0)
			heat_name:set_position(0, host_name:bottom())
		elseif data.is_skirmish then
			local is_weekly = data.skirmish == SkirmishManager.LOBBY_WEEKLY
			local text = managers.localization:text(is_weekly and "menu_weekly_skirmish" or "menu_skirmish") .. ": "

			contact_name:set_text(utf8.to_upper(text))

			local _, _, w, h = contact_name:text_rect()

			contact_name:set_size(w, h)
			contact_name:set_top(job_name:top())
			contact_name:set_right(0)
			info_name:set_text(" ")
			info_name:set_size(0, 0)
			info_name:set_position(0, host_name:bottom())
			difficulty_name:set_text(" ")
			difficulty_name:set_w(0, 0)
			difficulty_name:set_position(0, host_name:bottom())
			heat_name:set_text(" ")
			heat_name:set_w(0, 0)
			heat_name:set_position(0, host_name:bottom())
		elseif not got_job then
			job_name:set_text(data.state_name or managers.localization:to_upper_text("menu_lobby_server_state_in_lobby"))

			local _, _, w, h = job_name:text_rect()

			job_name:set_size(w, h)
			job_name:set_position(0, host_name:bottom())
			contact_name:set_text(" ")
			contact_name:set_w(0, 0)
			contact_name:set_position(0, host_name:bottom())
			info_name:set_text(" ")
			info_name:set_size(0, 0)
			info_name:set_position(0, host_name:bottom())
			difficulty_name:set_text(" ")
			difficulty_name:set_w(0, 0)
			difficulty_name:set_position(0, host_name:bottom())
			heat_name:set_text(" ")
			heat_name:set_w(0, 0)
			heat_name:set_position(0, host_name:bottom())
		end

		stars_panel:set_position(0, job_name:bottom())
		side_panel:set_h(math.round(host_name:h() + job_name:h() + stars_panel:h()))
		side_panel:set_w(300)

		self._num_layer_jobs = (self._num_layer_jobs + 1) % 1
		local marker_panel = self._pan_panel:panel({
			w = 36,
			alpha = 0,
			h = 66,
			layer = 11 + self._num_layer_jobs * 3
		})
		local select_panel = marker_panel:panel({
			name = "select_panel",
			h = 38,
			y = 0,
			w = 36,
			x = -2
		})
		local glow_panel = self._pan_panel:panel({
			w = 960,
			alpha = 0,
			h = 192,
			layer = 10
		})
		local glow_center = glow_panel:bitmap({
			texture = "guis/textures/pd2/crimenet_marker_glow",
			name = "glow_center",
			h = 192,
			blend_mode = "add",
			w = 192,
			alpha = 0.55,
			color = data.pulse_color or is_professional and pro_color or regular_color
		})
		local glow_stretch = glow_panel:bitmap({
			texture = "guis/textures/pd2/crimenet_marker_glow",
			name = "glow_stretch",
			h = 75,
			blend_mode = "add",
			w = 960,
			alpha = 0.55,
			color = data.pulse_color or is_professional and pro_color or regular_color
		})
		local glow_center_dark = glow_panel:bitmap({
			texture = "guis/textures/pd2/crimenet_marker_glow",
			name = "glow_center_dark",
			h = 175,
			blend_mode = "normal",
			w = 175,
			alpha = 0.7,
			layer = -1,
			color = Color.black
		})
		local glow_stretch_dark = glow_panel:bitmap({
			texture = "guis/textures/pd2/crimenet_marker_glow",
			name = "glow_stretch_dark",
			h = 75,
			blend_mode = "normal",
			w = 990,
			alpha = 0.75,
			layer = -1,
			color = Color.black
		})

		glow_center:set_center(glow_panel:w() / 2, glow_panel:h() / 2)
		glow_stretch:set_center(glow_panel:w() / 2, glow_panel:h() / 2)
		glow_center_dark:set_center(glow_panel:w() / 2, glow_panel:h() / 2)
		glow_stretch_dark:set_center(glow_panel:w() / 2, glow_panel:h() / 2)

		local is_hidden_job = not is_special and tweak_data.narrative.contacts[job_tweak.contact].hidden
		local show_marker = is_hidden_job or is_professional

		local marker_dot_texture = (is_special and data.icon or "guis/textures/pd2/crimenet_marker_" .. (is_server and "join" or "host")) .. (show_marker and "_pro" or "")
		local marker_dot = marker_panel:bitmap({
			name = "marker_dot",
			h = 64,
			y = 2,
			w = 32,
			x = 2,
			layer = 1,
			texture = marker_dot_texture,
			color = data.marker_dot_color or color
		})
		
		local function marker(color, alpha)
			marker_panel:bitmap({
				texture = "guis/textures/pd2/crimenet_marker_pro_outline",
				name = "marker_pro_outline",
				h = 64,
				rotation = 0,
				w = 64,
				alpha = alpha or 1,
				color = color,
				blend_mode = "add",
				y = 0,
				x = 0,
				layer = 0
			})
		end
		
		if is_professional then
			marker(tweak_data.screen_colors.pro_color)
		end
		
		if is_hidden_job then
			marker(tweak_data.screen_colors.ghost_color, 0.6)
		end
		
		if data.mutators then
			marker_dot:set_color(tweak_data.screen_colors.mutators_color)
		end

		if data.is_crime_spree then
			marker_dot:set_color(tweak_data.screen_colors.crime_spree_risk)
		end

		if data.is_skirmish then
			marker_dot:set_color(tweak_data.screen_colors.skirmish_color)
		end

		local timer_rect, peers_panel = nil
		local icon_panel = self._pan_panel:panel({
			alpha = 1,
			w = 18,
			h = 64,
			layer = 26
		})
		local next_icon_right = 16
		local side_icons_top = 0

		for child in ipairs(icon_panel:children()) do
			side_icons_top = math.max(side_icons_top, child:bottom())
		end

		local ghost_icon = nil

		if data.job_id and managers.job:is_job_ghostable(data.job_id) then
			ghost_icon = icon_panel:bitmap({
				texture = "guis/textures/pd2/cn_minighost",
				name = "ghost_icon",
				blend_mode = "add",
				color = tweak_data.screen_colors.ghost_color
			})

			ghost_icon:set_top(side_icons_top)
			ghost_icon:set_right(next_icon_right)

			next_icon_right = next_icon_right - 12
		end

		if one_down_active then
			local one_down_icon = icon_panel:bitmap({
				blend_mode = "add",
				name = "one_down_icon",
				texture = "guis/textures/pd2/cn_mini_onedown",
				rotation = 360,
				color = tweak_data.screen_colors.one_down
			})

			one_down_icon:set_top(side_icons_top)
			one_down_icon:set_right(next_icon_right)

			next_icon_right = next_icon_right - 12
		end

		if is_server then
			peers_panel = self._pan_panel:panel({
				alpha = 0,
				h = 62,
				visible = true,
				w = 32,
				layer = 11 + self._num_layer_jobs * 3
			})
			local cx = 0
			local cy = 0

			for i = 1, 4, 1 do
				cx = 3 + 6 * (i - 1)
				cy = 8
				local player_marker = peers_panel:bitmap({
					texture = "guis/textures/pd2/crimenet_marker_peerflag",
					h = 16,
					w = 8,
					blend_mode = "normal",
					layer = 2,
					name = tostring(i),
					color = color,
					visible = i <= data.num_plrs
				})

				player_marker:set_position(cx, cy)

				if data.mutators then
					player_marker:set_color(tweak_data.screen_colors.mutators_color)
				end

				if data.is_crime_spree then
					player_marker:set_color(tweak_data.screen_colors.crime_spree_risk)
				end

				if data.is_skirmish then
					player_marker:set_color(tweak_data.screen_colors.skirmish_color)
				end
			end

			local kick_none_icon = icon_panel:bitmap({
				texture = "guis/textures/pd2/cn_kick_marker",
				name = "kick_none_icon",
				blend_mode = "add",
				alpha = 0
			})
			local kick_vote_icon = icon_panel:bitmap({
				texture = "guis/textures/pd2/cn_votekick_marker",
				name = "kick_vote_icon",
				blend_mode = "add",
				alpha = 0
			})
			local y = 0

			for i = 1, #icon_panel:children() - 1, 1 do
				y = math.max(y, icon_panel:children()[i]:bottom())
			end

			kick_none_icon:set_y(y)
			kick_vote_icon:set_y(y)
		elseif not is_special then
			timer_rect = marker_panel:bitmap({
				texture = "guis/textures/pd2/crimenet_timer",
				name = "timer_rect",
				h = 32,
				x = 1,
				w = 32,
				y = 2,
				render_template = "VertexColorTexturedRadial",
				layer = 2,
				color = Color.white
			})

			timer_rect:set_texture_rect(32, 0, -32, 32)
		end

		marker_panel:set_center(x * self._zoom, y * self._zoom)
		focus:set_center(marker_panel:center())
		glow_panel:set_world_center(marker_panel:child("select_panel"):world_center())

		if heat_glow then
			heat_glow:set_world_center(marker_panel:child("select_panel"):world_center())
		end

		local num_containers = managers.job:get_num_containers()
		local middle_container = math.ceil(num_containers / 2)
		local job_container_index = managers.job:get_job_container_index(data.job_id) or middle_container
		local diff_containers = job_container_index - middle_container

		if diff_containers == 0 then
			if job_heat_mul < 0 then
				diff_containers = -1
			elseif job_heat_mul > 0 then
				diff_containers = 1
			end
		end

		local container_panel = nil

		if diff_containers ~= 0 and job_heat_mul ~= 0 then
			container_panel = self._pan_panel:panel({
				alpha = 0,
				layer = 11 + self._num_layer_jobs * 3
			})

			container_panel:set_w(math.abs(num_containers - middle_container) * 10 + 6)
			container_panel:set_h(8)
			container_panel:set_center_x(marker_panel:center_x())
			container_panel:set_bottom(marker_panel:top())
			container_panel:set_x(math.round(container_panel:x()))

			local texture = "guis/textures/pd2/blackmarket/stat_plusminus"
			local texture_rect = diff_containers > 0 and {
				0,
				0,
				8,
				8
			} or {
				8,
				0,
				8,
				8
			}

			for i = 1, math.abs(diff_containers), 1 do
				container_panel:bitmap({
					texture = texture,
					texture_rect = texture_rect,
					x = (i - 1) * 10 + 3
				})
			end
		end

		local text_on_right = x < self._map_size_w - 200

		if text_on_right then
			side_panel:set_left(marker_panel:right())
		else
			job_name:set_text(contact_name:text() .. job_name:text())
			contact_name:set_text("")
			contact_name:set_w(0)

			local _, _, w, h = job_name:text_rect()

			job_name:set_size(w, h)
			host_name:set_right(side_panel:w())
			job_name:set_right(side_panel:w())
			contact_name:set_left(side_panel:w())
			info_name:set_left(side_panel:w())
			difficulty_name:set_left(side_panel:w())
			heat_name:set_left(side_panel:w())
			stars_panel:set_right(side_panel:w())
			side_panel:set_right(marker_panel:left())
		end

		side_panel:set_top(marker_panel:top() - job_name:top() + 1)

		if icon_panel then
			if text_on_right then
				icon_panel:set_right(marker_panel:left() + 2)
			else
				icon_panel:set_left(marker_panel:right() - 2)
			end

			icon_panel:set_top(math.round(marker_panel:top() + 1))
		end

		if peers_panel then
			peers_panel:set_center_x(marker_panel:center_x())
			peers_panel:set_center_y(marker_panel:center_y())
		end

		local callout = nil

		if narrative_data and narrative_data.crimenet_callouts and #narrative_data.crimenet_callouts > 0 then
			local variant = math.random(#narrative_data.crimenet_callouts)
			callout = narrative_data.crimenet_callouts[variant]
		end

		if location then
			location[3] = true
		end

		managers.menu:post_event("job_appear")

		local job = {
			room_id = data.room_id,
			info = data.info,
			job_id = data.job_id,
			host_id = data.host_id,
			level_id = level_id,
			level_data = level_data,
			marker_panel = marker_panel,
			peers_panel = peers_panel,
			kick_option = data.kick_option,
			job_plan = data.job_plan,
			container_panel = container_panel,
			is_friend = data.is_friend,
			marker_dot = marker_dot,
			timer_rect = timer_rect,
			side_panel = side_panel,
			icon_panel = icon_panel,
			focus = focus,
			difficulty = data.difficulty,
			difficulty_id = data.difficulty_id,
			one_down = data.one_down,
			num_plrs = data.num_plrs,
			job_x = x,
			job_y = y,
			state = data.state,
			layer = 11 + self._num_layer_jobs * 3,
			glow_panel = glow_panel,
			callout = callout,
			text_on_right = text_on_right,
			location = location,
			heat_glow = heat_glow,
			mutators = data.mutators,
			is_crime_spree = data.crime_spree and data.crime_spree >= 0,
			crime_spree = data.crime_spree,
			crime_spree_mission = data.crime_spree_mission,
			color_lerp = data.color_lerp,
			server_data = data,
			mods = data.mods,
			is_skirmish = data.skirmish and data.skirmish > 0,
			skirmish = data.skirmish,
			skirmish_wave = data.skirmish_wave,
			skirmish_weekly_modifiers = data.skirmish_weekly_modifiers
		}

		if is_crime_spree or data.is_crime_spree then
			stars_panel:set_visible(false)

			local spree_panel = side_panel:panel({
				visible = true,
				name = "spree_panel",
				layer = -1,
				h = tweak_data.menu.pd2_small_font_size
			})

			spree_panel:set_bottom(side_panel:h())

			local level = is_crime_spree and managers.crime_spree:spree_level() or tonumber(data.crime_spree)

			if level >= 0 then
				local spree_level = spree_panel:text({
					halign = "left",
					vertical = "center",
					layer = 1,
					align = "left",
					y = 0,
					x = 0,
					valign = "center",
					text = managers.experience:cash_string(level or 0, "") .. managers.localization:get_default_macro("BTN_SPREE_TICKET"),
					color = tweak_data.screen_colors.crime_spree_risk,
					font = tweak_data.menu.pd2_small_font,
					font_size = tweak_data.menu.pd2_small_font_size
				})
			end
		end

		if data.is_skirmish then
			stars_panel:set_visible(false)

			local skirmish_panel = side_panel:panel({
				visible = true,
				name = "skirmish_panel",
				layer = -1,
				h = tweak_data.menu.pd2_small_font_size
			})

			skirmish_panel:set_bottom(side_panel:h())

			local wave = data.skirmish_wave
			local text = nil

			if data.state == tweak_data:server_state_to_index("in_game") then
				text = managers.localization:to_upper_text("menu_skirmish_wave_number", {
					wave = wave
				})
			else
				text = managers.localization:to_upper_text("menu_lobby_server_state_" .. tweak_data:index_to_server_state(data.state))
			end

			local skirmish_wave = skirmish_panel:text({
				layer = 1,
				vertical = "center",
				blend_mode = "add",
				align = "left",
				halign = "left",
				valign = "center",
				text = text,
				color = tweak_data.screen_colors.skirmish_color,
				font = tweak_data.menu.pd2_small_font,
				font_size = tweak_data.menu.pd2_small_font_size
			})
		end

		self:update_job_gui(job, 3)

		return job
	end

	local data = CrimeNetGui.init
	function CrimeNetGui:init(ws, fullscreeen_ws, node)
		data(self, ws, fullscreeen_ws, node)
		local legend_panel = self._panel:child("legend_panel")
		legend_panel:clear()

		local w, h = nil
		local mw = 0
		local mh = nil
		local host_icon = legend_panel:bitmap({
			texture = "guis/textures/pd2/crimenet_legend_host",
			x = 10,
			y = 10
		})
		local host_text = legend_panel:text({
			blend_mode = "add",
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			x = host_icon:right() + 2,
			y = host_icon:top(),
			text = managers.localization:to_upper_text("menu_cn_legend_host")
		})
		mw = math.max(mw, self:make_fine_text(host_text))
		local next_y = host_text:bottom()
		local join_icon = legend_panel:bitmap({
			texture = "guis/textures/pd2/crimenet_legend_join",
			x = 10,
			y = next_y
		})
		local join_text = legend_panel:text({
			blend_mode = "add",
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			x = host_text:left(),
			y = next_y,
			text = managers.localization:to_upper_text("menu_cn_legend_join")
		})
		mw = math.max(mw, self:make_fine_text(join_text))

		self:make_color_text(join_text, tweak_data.screen_colors.regular_color)

		next_y = join_text:bottom()
		local friends_icon = legend_panel:bitmap({
			texture = "guis/textures/pd2/crimenet_legend_join",
			x = 10,
			y = next_y,
			color = tweak_data.screen_colors.friend_color
		})
		local friends_text = legend_panel:text({
			blend_mode = "add",
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			x = host_text:left(),
			y = next_y,
			text = managers.localization:to_upper_text("menu_cn_legend_friends")
		})
		mw = math.max(mw, self:make_fine_text(friends_text))

		self:make_color_text(friends_text, tweak_data.screen_colors.friend_color)

		next_y = friends_text:bottom()

		if managers.crimenet:no_servers() or is_xb1 then
			next_y = host_text:bottom()

			join_icon:hide()
			join_text:hide()
			friends_icon:hide()
			friends_text:hide()
			friends_text:set_bottom(next_y)
		end

		local hidden_icon = legend_panel:bitmap({
			texture = "guis/textures/pd2/crimenet_legend_join",
			x = 10,
			y = next_y,
			color = tweak_data.screen_colors.ghost_color
		})
		local hidden_text = legend_panel:text({
			blend_mode = "add",
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			x = host_text:left(),
			y = next_y,
			text = managers.localization:to_upper_text("menu_cn_legend_hidden")
		})
		mw = math.max(mw, self:make_fine_text(hidden_text))
		self:make_color_text(hidden_text, tweak_data.screen_colors.ghost_color)
		next_y = hidden_text:bottom()
		
		local pro_icon = legend_panel:bitmap({
			texture = "guis/textures/pd2/crimenet_legend_join",
			x = 10,
			y = next_y,
			color = tweak_data.screen_colors.pro_color
		})
		local pro_text = legend_panel:text({
			blend_mode = "add",
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			x = host_text:left(),
			y = next_y,
			text = managers.localization:to_upper_text("menu_cn_legend_pro"),
			color = tweak_data.screen_colors.pro_color
		})
		mw = math.max(mw, self:make_fine_text(pro_text))
		next_y = pro_text:bottom()
		
		local mutated_icon = legend_panel:bitmap({
			texture = "guis/textures/pd2/crimenet_legend_join",
			x = 10,
			y = next_y,
			color = tweak_data.screen_colors.mutators_color_text
		})
		local mutated_text = legend_panel:text({
			blend_mode = "add",
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			x = host_text:left(),
			y = next_y,
			text = managers.localization:to_upper_text("menu_cn_legend_mutated"),
			color = tweak_data.screen_colors.mutators_color_text
		})
		mw = math.max(mw, self:make_fine_text(mutated_text))
		next_y = mutated_text:bottom()
		local spree_icon = legend_panel:bitmap({
			texture = "guis/textures/pd2/crimenet_legend_join",
			x = 10,
			y = next_y,
			color = tweak_data.screen_colors.crime_spree_risk
		})
		local spree_text = legend_panel:text({
			blend_mode = "add",
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			x = host_text:left(),
			y = next_y,
			text = managers.localization:to_upper_text("cn_crime_spree"),
			color = tweak_data.screen_colors.crime_spree_risk
		})
		mw = math.max(mw, self:make_fine_text(spree_text))
		next_y = spree_text:bottom()
		local skirmish_icon = legend_panel:bitmap({
			texture = "guis/textures/pd2/crimenet_legend_join",
			x = 10,
			y = next_y,
			color = tweak_data.screen_colors.skirmish_color
		})
		local skirmish_text = legend_panel:text({
			blend_mode = "add",
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			x = host_text:left(),
			y = next_y,
			text = managers.localization:to_upper_text("menu_cn_skirmish"),
			color = tweak_data.screen_colors.skirmish_color
		})
		mw = math.max(mw, self:make_fine_text(skirmish_text))
		next_y = skirmish_text:bottom()
		local paygrade_icon = legend_panel:bitmap({
			texture = "guis/textures/pd2/crimenet_legend_payclass",
			x = 10,
			y = next_y
		})
		local paygrade_text = legend_panel:text({
			blend_mode = "add",
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			x = host_text:left(),
			y = next_y,
			text = managers.localization:to_upper_text("menu_pay_grade"),
			color = tweak_data.screen_colors.text
		})
		mw = math.max(mw, self:make_fine_text(paygrade_text))
		next_y = paygrade_text:bottom()
		local risk_icon = legend_panel:bitmap({
			texture = "guis/textures/pd2/crimenet_legend_payclass",
			x = 10,
			y = next_y,
			color = tweak_data.screen_colors.risk
		})
		local risk_text = legend_panel:text({
			blend_mode = "add",
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			x = host_text:left(),
			y = next_y,
			text = managers.localization:to_upper_text("menu_cn_legend_risk"),
			color = tweak_data.screen_colors.risk
		})
		mw = math.max(mw, self:make_fine_text(risk_text))
		next_y = risk_text:bottom()
		
		local plvl = managers.experience:current_level()
		local prank = managers.experience:current_rank()
		local dw = tweak_data.difficulty_level_locks[7]
		if plvl >= dw or prank > 0 then
			local hate_icon = legend_panel:bitmap({
				texture = "guis/textures/pd2/crimenet_legend_payclass",
				x = 10,
				y = next_y,
				color = Color.red
			})
			local hate_text = legend_panel:text({
				blend_mode = "add",
				font = tweak_data.menu.pd2_small_font,
				font_size = tweak_data.menu.pd2_small_font_size,
				x = host_text:left(),
				y = next_y,
				text = managers.localization:to_upper_text("menu_cn_legend_hate"),
				color = tweak_data.screen_colors.pro_color
			})
			mw = math.max(mw, self:make_fine_text(hate_text))
			next_y = hate_text:bottom()
		end
		
		local ghost_icon = legend_panel:bitmap({
			texture = "guis/textures/pd2/cn_minighost",
			x = 7,
			y = next_y + 4,
			color = tweak_data.screen_colors.ghost_color
		})
		local ghost_text = legend_panel:text({
			blend_mode = "add",
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			x = host_text:left(),
			y = next_y,
			text = managers.localization:to_upper_text("menu_cn_legend_ghostable"),
			color = tweak_data.screen_colors.ghost_color
		})
		mw = math.max(mw, self:make_fine_text(ghost_text))
		next_y = ghost_text:bottom()
		local kick_none_icon = legend_panel:bitmap({
			texture = "guis/textures/pd2/cn_kick_marker",
			x = 10,
			y = next_y + 2
		})
		local kick_none_text = legend_panel:text({
			blend_mode = "add",
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			x = host_text:left(),
			y = next_y,
			text = managers.localization:to_upper_text("menu_cn_kick_disabled")
		})
		mw = math.max(mw, self:make_fine_text(kick_none_text))
		local kick_vote_icon = legend_panel:bitmap({
			texture = "guis/textures/pd2/cn_votekick_marker",
			x = 10,
			y = kick_none_text:bottom() + 2
		})
		local kick_vote_text = legend_panel:text({
			blend_mode = "add",
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			x = host_text:left(),
			y = kick_none_text:bottom(),
			text = managers.localization:to_upper_text("menu_kick_vote")
		})
		mw = math.max(mw, self:make_fine_text(kick_vote_text))
		local last_text = kick_vote_text
		local job_plan_loud_icon, job_plan_loud_text, job_plan_stealth_icon, job_plan_stealth_text = nil

		if MenuCallbackHandler:bang_active() then
			job_plan_loud_icon = legend_panel:bitmap({
				texture = "guis/textures/pd2/cn_playstyle_loud",
				x = 10,
				y = kick_vote_text:bottom() + 2
			})
			job_plan_loud_text = legend_panel:text({
				blend_mode = "add",
				font = tweak_data.menu.pd2_small_font,
				font_size = tweak_data.menu.pd2_small_font_size,
				x = host_text:left(),
				y = kick_vote_text:bottom(),
				text = managers.localization:to_upper_text("menu_plan_loud")
			})
			mw = math.max(mw, self:make_fine_text(job_plan_loud_text))
			job_plan_stealth_icon = legend_panel:bitmap({
				texture = "guis/textures/pd2/cn_playstyle_stealth",
				x = 10,
				y = job_plan_loud_text:bottom() + 2
			})
			job_plan_stealth_text = legend_panel:text({
				blend_mode = "add",
				font = tweak_data.menu.pd2_small_font,
				font_size = tweak_data.menu.pd2_small_font_size,
				x = host_text:left(),
				y = job_plan_loud_text:bottom(),
				text = managers.localization:to_upper_text("menu_plan_stealth")
			})
			mw = math.max(mw, self:make_fine_text(job_plan_stealth_text))
			last_text = job_plan_stealth_text
		end

		if managers.crimenet:no_servers() or is_xb1 then
			kick_none_icon:hide()
			kick_none_text:hide()
			kick_vote_icon:hide()
			kick_vote_text:hide()
			kick_vote_text:set_bottom(ghost_text:bottom())

			if MenuCallbackHandler:bang_active() then
				job_plan_loud_icon:hide()
				job_plan_loud_text:hide()
				job_plan_stealth_icon:hide()
				job_plan_stealth_text:hide()
			end
		end

		legend_panel:set_size(host_text:left() + mw + 10, last_text:bottom() + 10)
		legend_panel:rect({
			alpha = 0.4,
			layer = -1,
			color = Color.black
		})
		BoxGuiObject:new(legend_panel, {
			sides = {1, 1, 1, 1}
		})
		legend_panel:bitmap({
			texture = "guis/textures/test_blur_df",
			render_template = "VertexColorTexturedBlur3D",
			layer = -1,
			w = legend_panel:w(),
			h = legend_panel:h()
		})
		legend_panel:set_right(self._panel:w() - 10)
	end
	
	function CrimeNetGui:toggle_legend()
		managers.menu_component:post_event("menu_enter")
		self._panel:child("legend_panel"):set_visible(not self._panel:child("legend_panel"):visible())
		self._panel:child("legends_button"):set_text(managers.localization:to_upper_text(self._panel:child("legend_panel"):visible() and "menu_cn_legend_hide" or "menu_cn_legend_show", {
			BTN_X = managers.localization:btn_macro("menu_toggle_legends")
		}))
	end

end
if string.lower(RequiredScript) == "lib/managers/menumanager" then
	local data = MenuCallbackHandler.is_contract_difficulty_allowed
	function MenuCallbackHandler:is_contract_difficulty_allowed(item)
		if item:value() == 6 or item:value() == 8 then
			return false
		end
		managers.menu:active_menu().logic:selected_node():item("toggle_ai"):set_visible(false)
		return data(self, item)
	end
	
	function MenuManager:color_range(text, color, string_text)
		local modifier_string = string_text
		local text_dissected = utf8.characters(modifier_string)
		local idsp = Idstring("#")
		local start_ci = {}
		local end_ci = {}
		local first_ci = true
		for i, c in ipairs(text_dissected) do
			if Idstring(c) == idsp then
				local next_c = text_dissected[i + 1]

				if next_c and Idstring(next_c) == idsp then
					if first_ci then
						table.insert(start_ci, i)
					else
						table.insert(end_ci, i)
					end

					first_ci = not first_ci
				end
			end
		end

		if #start_ci == #end_ci then
			for i = 1, #start_ci, 1 do
				start_ci[i] = start_ci[i] - ((i - 1) * 4 + 1)
				end_ci[i] = end_ci[i] - (i * 4 - 1)
			end
		end

		modifier_string = string.gsub(modifier_string, "##", "")
		if alive(text) then
			text:set_text(modifier_string)
			text:clear_range_color(1, utf8.len(modifier_string))

			if #start_ci ~= #end_ci then
				Application:error("CrimeNetContractGui: Not even amount of ##'s in skill description string!", #start_ci, #end_ci)
			else
				for i = 1, #start_ci, 1 do
					text:set_range_color(start_ci[i], end_ci[i], i == 1 and color)
				end
			end
		end
	end
end
if string.lower(RequiredScript) == "lib/tweak_data/moneytweakdata" then
	local data = MoneyTweakData.init
	function MoneyTweakData:init(tweak_data)
		data(self, tweak_data)

		self.mission_asset_cost_multiplier_by_risk[5] = 10
		self.mission_asset_cost_multiplier_by_risk[7] = 12
		self.difficulty_multiplier[5] = 45
		self.difficulty_multiplier[7] = 50
		self.difficulty_multiplier_payout[5] = 20
		self.difficulty_multiplier_payout[7] = 25
		
	end
end
if string.lower(RequiredScript) == "lib/tweak_data/tweakdata" then
	local self = tweak_data
	self.experience_manager.difficulty_multiplier[4] = 20
	self.experience_manager.difficulty_multiplier[6] = 25	 
end