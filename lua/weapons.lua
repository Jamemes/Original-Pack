if string.lower(RequiredScript) == "lib/tweak_data/weapontweakdata" then
	local PICKUP = {
		SNIPER_HIGH_DAMAGE = 6,
		SHOTGUN_HIGH_CAPACITY = 4,
		AR_HIGH_CAPACITY = 2,
		OTHER = 1,
		SNIPER_LOW_DAMAGE = 5,
		AR_MED_CAPACITY = 3,
		LMG_HIGH_CAPACITY = 7,
		LMG_MED_CAPACITY = 8
	}
	local SELECTION = {
		SECONDARY = 1, 
		PRIMARY = 2, 
		UNDERBARREL = 3
	}
	local data = WeaponTweakData.init
	function WeaponTweakData:init(tweak_data)
		data(self, tweak_data)
		local total_damage_primary = 300
		local total_damage_secondary = 150

		self.alert_size = {
			30000, 
			20000, 
			15000, 
			10000, 
			7500, 
			6000, 
			4500, 
			4000, 
			3500, 
			1800, 
			1500, 
			1200, 
			1000, 
			900, 
			800, 
			700, 
			600, 
			500, 
			400, 
			200
		}
		self.stats.spread = {
			2,
			1.8,
			1.6,
			1.4,
			1.2,
			1,
			0.8,
			0.6,
			0.4,
			0.2
		}
		self.stats.spread_moving = {
			3,
			2.7,
			2.4,
			2.2,
			2,
			1.7,
			1.4,
			1.2,
			1,
			0.9,
			0.8,
			0.7,
			0.6,
			0.5
		}
		self.stats.recoil = {
			3,
			2.7,
			2.4,
			2.2,
			1.8,
			1.5,
			1.3,
			1.1,
			1,
			1,
			0.9,
			0.8,
			0.7,
			0.6,
			0.5
		}

		self.amcar.stats = {
			reload = 11,
			damage = 16,
			spread = 6,
			recoil = 8,
			spread_moving = 6,
			zoom = 3,
			concealment = 21,
			suppression = 10,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.s552.stats = {
			reload = 11,
			damage = 28,
			spread = 6,
			recoil = 9,
			spread_moving = 5,
			zoom = 3,
			concealment = 22,
			suppression = 12,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.scar.stats = {
			reload = 11,
			damage = 43,
			spread = 7,
			recoil = 5,
			spread_moving = 5,
			zoom = 3,
			concealment = 8,
			suppression = 8,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 9
		}
		self.ak74.stats = {
			reload = 11,
			damage = 28,
			spread = 6,
			recoil = 6,
			spread_moving = 6,
			zoom = 3,
			concealment = 16,
			suppression = 10,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.new_m4.stats = {
			reload = 11,
			damage = 23,
			spread = 7,
			recoil = 7,
			spread_moving = 7,
			zoom = 3,
			concealment = 20,
			suppression = 10,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.corgi.stats = {
			zoom = 1,
			total_ammo_mod = 21,
			damage = 16,
			alert_size = 8,
			spread = 8,
			recoil = 5,
			spread_moving = 7,
			value = 9,
			extra_ammo = 51,
			reload = 11,
			suppression = 12,
			concealment = 20
		}
		self.aug.stats = {
			reload = 11,
			damage = 28,
			spread = 8,
			recoil = 5,
			spread_moving = 7,
			zoom = 3,
			concealment = 20,
			suppression = 10,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.akm.stats = {
			reload = 11,
			damage = 40,
			spread = 6,
			recoil = 5,
			spread_moving = 6,
			zoom = 3,
			concealment = 13,
			suppression = 8,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.g36.stats = {
			reload = 11,
			damage = 25,
			spread = 7,
			recoil = 8,
			spread_moving = 8,
			zoom = 3,
			concealment = 19,
			suppression = 11,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.flint.stats = { --ak12
			zoom = 3,
			total_ammo_mod = 21,
			damage = 28,
			spread = 6,
			recoil = 7,
			spread_moving = 6,
			alert_size = 7,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 10,
			concealment = 16
		}
		self.akm_gold.stats = {
			reload = 11,
			damage = 40,
			spread = 6,
			recoil = 5,
			spread_moving = 6,
			zoom = 3,
			concealment = 11,
			suppression = 8,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.tecci.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 25,
			spread = 7,
			recoil = 12,
			spread_moving = 8,
			alert_size = 7,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 10,
			concealment = 16
		}
		self.l85a2.stats = {
			reload = 11,
			damage = 33,
			spread = 7,
			recoil = 10,
			spread_moving = 6,
			zoom = 1,
			concealment = 16,
			suppression = 12,
			alert_size = 8,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 9
		}
		self.new_m14.stats = {
			reload = 11,
			damage = 75,
			spread = 9,
			recoil = 2,
			spread_moving = 5,
			zoom = 3,
			concealment = 8,
			suppression = 4,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.famas.stats = {
			reload = 11,
			damage = 25,
			spread = 8,
			recoil = 5,
			spread_moving = 4,
			zoom = 3,
			concealment = 24,
			suppression = 10,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 4
		}
		self.vhs.stats = {
			reload = 11,
			damage = 33,
			spread = 9,
			recoil = 4,
			spread_moving = 6,
			zoom = 1,
			concealment = 17,
			suppression = 12,
			alert_size = 8,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 9
		}
		self.asval.stats = {
			reload = 11,
			damage = 30,
			spread = 9,
			recoil = 6,
			spread_moving = 6,
			zoom = 3,
			concealment = 26,
			suppression = 24,
			alert_size = 12,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.ak5.stats = {
			reload = 11,
			damage = 20,
			spread = 9,
			recoil = 12,
			spread_moving = 6,
			zoom = 3,
			concealment = 18,
			suppression = 10,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.galil.stats = {
			reload = 11,
			damage = 33,
			spread = 7,
			recoil = 8,
			spread_moving = 5,
			zoom = 3,
			concealment = 15,
			suppression = 7,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 4
		}
		self.komodo.stats = {
			zoom = 1,
			total_ammo_mod = 21,
			damage = 23,
			spread = 6,
			recoil = 5,
			spread_moving = 4,
			alert_size = 8,
			value = 9,
			extra_ammo = 51,
			reload = 11,
			suppression = 12,
			concealment = 26
		}
		self.m16.stats = {
			reload = 11,
			damage = 30,
			spread = 7,
			recoil = 10,
			spread_moving = 5,
			zoom = 4,
			concealment = 17,
			suppression = 10,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.sub2000.stats = {
			reload = 11,
			damage = 38,
			spread = 8,
			recoil = 4,
			spread_moving = 5,
			zoom = 3,
			concealment = 25,
			suppression = 4,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.contraband.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 28,
			spread = 7,
			recoil = 14,
			spread_moving = 5,
			alert_size = 7,
			value = 9,
			extra_ammo = 51,
			reload = 11,
			suppression = 8,
			concealment = 8
		}
		self.contraband_m203.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 10,
			alert_size = 7,
			spread = 3,
			recoil = 9,
			spread_moving = 6,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 2,
			concealment = 18
		}
		self.fal.stats = {
			reload = 11,
			damage = 43,
			spread = 6,
			recoil = 5,
			spread_moving = 5,
			zoom = 3,
			concealment = 10,
			suppression = 8,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 4
		}
		self.g3.stats = {
			reload = 11,
			damage = 43,
			spread = 8,
			recoil = 4,
			spread_moving = 7,
			zoom = 3,
			concealment = 12,
			suppression = 6,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 4
		}
		self.ching.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 80,
			spread = 10,
			recoil = 4,
			spread_moving = 5,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 4,
			concealment = 20
		}

		self.spas12.stats = {
			reload = 11,
			damage = 48,
			spread = 6,
			recoil = 4,
			spread_moving = 7,
			zoom = 3,
			concealment = 14,
			suppression = 5,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.boot.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 85,
			alert_size = 7,
			spread = 8,
			recoil = 1,
			spread_moving = 6,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 5,
			concealment = 20
		}
		self.r870.stats = {
			reload = 11,
			damage = 60,
			spread = 8,
			recoil = 3,
			spread_moving = 6,
			zoom = 3,
			concealment = 11,
			suppression = 5,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.benelli.stats = {
			reload = 11,
			damage = 35,
			spread = 8,
			recoil = 5,
			spread_moving = 7,
			zoom = 3,
			concealment = 12,
			suppression = 6,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.ksg.stats = {
			reload = 11,
			damage = 60,
			spread = 6,
			recoil = 5,
			spread_moving = 7,
			zoom = 3,
			concealment = 22,
			suppression = 5,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.saiga.stats = {
			reload = 11,
			damage = 35,
			spread = 6,
			recoil = 4,
			spread_moving = 7,
			zoom = 3,
			concealment = 13,
			suppression = 5,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.huntsman.stats = {
			reload = 11,
			damage = 85,
			spread = 7,
			recoil = 2,
			spread_moving = 6,
			zoom = 3,
			concealment = 7,
			suppression = 2,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.b682.stats = {
			reload = 11,
			damage = 10,
			spread = 8,
			recoil = 85,
			spread_moving = 6,
			zoom = 3,
			concealment = 5,
			suppression = 2,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.aa12.stats = {
			reload = 11,
			damage = 38,
			spread = 7,
			recoil = 7,
			spread_moving = 7,
			zoom = 3,
			concealment = 9,
			suppression = 5,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.serbu.stats = {
			reload = 11,
			damage = 65,
			spread = 5,
			recoil = 3,
			spread_moving = 6,
			zoom = 3,
			concealment = 23,
			suppression = 5,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.m37.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 65,
			spread = 6,
			recoil = 5,
			spread_moving = 6,
			alert_size = 7,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 5,
			concealment = 22
		}
		self.rota.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 35,
			spread = 6,
			recoil = 4,
			spread_moving = 7,
			alert_size = 7,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 5,
			concealment = 13
		}
		self.x_rota.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 35,
			spread = 6,
			recoil = 4,
			spread_moving = 7,
			alert_size = 7,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 5,
			concealment = 13
		}
		self.basset.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 18,
			spread = 4,
			recoil = 4,
			spread_moving = 5,
			alert_size = 7,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 5,
			concealment = 21
		}
		self.x_basset.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 18,
			spread = 4,
			recoil = 4,
			spread_moving = 5,
			alert_size = 7,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 5,
			concealment = 21
		}
		self.striker.stats = {
			reload = 11,
			damage = 35,
			spread = 6,
			recoil = 4,
			spread_moving = 7,
			zoom = 3,
			concealment = 21,
			suppression = 5,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.judge.stats = {
			reload = 11,
			damage = 75,
			spread = 4,
			recoil = 2,
			spread_moving = 5,
			zoom = 3,
			concealment = 29,
			suppression = 5,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.x_judge.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 75,
			spread = 4,
			recoil = 2,
			spread_moving = 5,
			alert_size = 7,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 5,
			concealment = 29
		}
		self.coach.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 85,
			spread = 6,
			recoil = 4,
			spread_moving = 6,
			alert_size = 6,
			value = 3,
			extra_ammo = 51,
			reload = 11,
			suppression = 5,
			concealment = 10
		}

		self.rpk.stats = {
			reload = 11,
			damage = 30,
			spread = 5,
			recoil = 6,
			spread_moving = 6,
			zoom = 2,
			concealment = 5,
			suppression = 8,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 9
		}
		self.par.stats = {
			zoom = 1,
			total_ammo_mod = 21,
			damage = 28,
			alert_size = 8,
			spread = 5,
			recoil = 6,
			spread_moving = 6,
			value = 9,
			extra_ammo = 51,
			reload = 11,
			suppression = 4,
			concealment = 1
		}
		self.m249.stats = {
			reload = 11,
			damage = 28,
			spread = 4,
			recoil = 7,
			spread_moving = 9,
			zoom = 1,
			concealment = 2,
			suppression = 4,
			alert_size = 8,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 9
		}
		self.mg42.stats = {
			reload = 11,
			damage = 30,
			spread = 4,
			recoil = 6,
			spread_moving = 9,
			zoom = 1,
			concealment = 2,
			suppression = 4,
			alert_size = 8,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 9
		}
		self.hk21.stats = {
			reload = 11,
			damage = 33,
			spread = 6,
			recoil = 5,
			spread_moving = 8,
			zoom = 3,
			concealment = 2,
			suppression = 2,
			alert_size = 8,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 9
		}

		self.msr.stats = {
			reload = 11,
			damage = 10,
			spread = 9,
			recoil = 2,
			spread_moving = 8,
			zoom = 1,
			concealment = 5,
			concealment = 5,
			suppression = 6,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 9
		}
		self.model70.stats = {
			zoom = 1,
			total_ammo_mod = 21,
			damage = 10,
			alert_size = 7,
			spread = 24,
			spread_moving = 24,
			recoil = 4,
			value = 9,
			extra_ammo = 51,
			reload = 11,
			suppression = 5,
			concealment = 6
		}
		self.wa2000.stats = {
			reload = 11,
			damage = 10,
			spread = 8,
			recoil = 7,
			spread_moving = 6,
			zoom = 1,
			concealment = 16,
			suppression = 12,
			alert_size = 8,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 9
		}
		self.desertfox.stats = {
			zoom = 1,
			total_ammo_mod = 21,
			damage = 10,
			alert_size = 7,
			spread = 8,
			recoil = 6,
			spread_moving = 6,
			value = 10,
			extra_ammo = 51,
			reload = 11,
			suppression = 5,
			concealment = 19
		}
		self.tti.stats = {
			zoom = 1,
			total_ammo_mod = 21,
			damage = 10,
			spread = 9,
			recoil = 9,
			spread_moving = 6,
			alert_size = 8,
			value = 9,
			extra_ammo = 51,
			reload = 11,
			suppression = 12,
			concealment = 16
		}
		self.r93.stats = {
			reload = 11,
			damage = 10,
			spread = 9,
			recoil = 2,
			spread_moving = 8,
			zoom = 1,
			concealment = 5,
			suppression = 4,
			alert_size = 8,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 9
		}
		self.winchester1874.stats = {
			reload = 11,
			damage = 10,
			spread = 8,
			recoil = 5,
			spread_moving = 9,
			zoom = 1,
			concealment = 12,
			suppression = 5,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 9
		}
		self.siltstone.stats = {
			zoom = 1,
			total_ammo_mod = 21,
			damage = 10,
			spread = 7,
			recoil = 11,
			spread_moving = 6,
			alert_size = 8,
			value = 9,
			extra_ammo = 51,
			reload = 11,
			suppression = 12,
			concealment = 16
		}
		self.mosin.stats = {
			reload = 11,
			damage = 10,
			spread = 9,
			recoil = 3,
			spread_moving = 9,
			zoom = 1,
			concealment = 6,
			suppression = 5,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 9
		}
		self.m95.stats = {
			reload = 11,
			damage = 20,
			spread = 9,
			recoil = 1,
			spread_moving = 8,
			zoom = 1,
			concealment = 1,
			suppression = 2,
			alert_size = 9,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 9
		}
		self.m134.stats = {
			reload = 11,
			damage = 38,
			spread = 5,
			recoil = 2,
			spread_moving = 9,
			zoom = 1,
			concealment = 5,
			suppression = 4,
			alert_size = 8,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 9
		}
		self.china.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 10,
			spread = 7,
			recoil = 3,
			spread_moving = 6,
			alert_size = 7,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 2,
			concealment = 18
		}
		self.m32.stats = {
			reload = 11,
			damage = 10,
			spread = 3,
			recoil = 9,
			spread_moving = 6,
			zoom = 3,
			concealment = 10,
			suppression = 2,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.gre_m79.stats = {
			reload = 11,
			damage = 10,
			spread = 7,
			recoil = 3,
			spread_moving = 6,
			zoom = 3,
			concealment = 18,
			suppression = 2,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.ecp.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 10,
			spread = 10,
			recoil = 8,
			spread_moving = 8,
			alert_size = 7,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 14,
			concealment = 5
		}
		self.elastic.stats = {
			zoom = 5,
			total_ammo_mod = 21,
			damage = 10,
			spread = 10,
			recoil = 14,
			spread_moving = 12,
			alert_size = 7,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 2,
			concealment = 27
		}
		self.flamethrower_mk2.stats = {
			reload = 11,
			damage = 14,
			spread = 1,
			recoil = 0,
			spread_moving = 6,
			zoom = 3,
			concealment = 7,
			suppression = 2,
			alert_size = 1,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.ray.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 10,
			spread = 10,
			recoil = 3,
			spread_moving = 6,
			alert_size = 7,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 2,
			concealment = 5
		}
		self.rpg7.stats = {
			reload = 11,
			damage = 10,
			spread = 10,
			recoil = 3,
			spread_moving = 6,
			zoom = 3,
			concealment = 5,
			suppression = 2,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.saw.stats = {
			reload = 11,
			alert_size = 9,
			suppression = 7,
			zoom = 1,
			spread = 3,
			recoil = 7,
			spread_moving = 7,
			damage = 23,
			concealment = 16,
			value = 1,
			extra_ammo = 51,
			total_ammo_mod = 21
		}
		self.saw_secondary.stats = {
			reload = 11,
			alert_size = 9,
			suppression = 7,
			zoom = 1,
			spread = 3,
			recoil = 7,
			spread_moving = 7,
			damage = 23,
			concealment = 16,
			value = 1,
			extra_ammo = 51,
			total_ammo_mod = 21
		}
		self.shuno.stats = {
			zoom = 1,
			total_ammo_mod = 21,
			damage = 38,
			spread = 5,
			recoil = 5,
			spread_moving = 9,
			alert_size = 8,
			value = 9,
			extra_ammo = 51,
			reload = 11,
			suppression = 4,
			concealment = 5
		}
		self.slap.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 10,
			spread = 5,
			recoil = 2,
			spread_moving = 5,
			alert_size = 7,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 2,
			concealment = 22
		}
		self.arbiter.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 10,
			spread = 7,
			recoil = 3,
			spread_moving = 6,
			alert_size = 7,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 2,
			concealment = 18
		}
		self.hunter.stats = {
			reload = 11,
			damage = 10,
			spread = 10,
			recoil = 8,
			spread_moving = 8,
			zoom = 3,
			concealment = 26,
			suppression = 14,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.system.stats.damage = 16

		self.usp.stats = {
			reload = 11,
			damage = 20,
			spread = 7,
			recoil = 9,
			spread_moving = 8,
			zoom = 1,
			concealment = 29,
			suppression = 16,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.x_usp.stats = {
			reload = 11,
			damage = 20,
			spread = 7,
			recoil = 9,
			spread_moving = 8,
			zoom = 1,
			concealment = 29,
			suppression = 16,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.glock_17.stats = {
			reload = 11,
			damage = 15,
			spread = 7,
			recoil = 7,
			spread_moving = 7,
			zoom = 1,
			concealment = 30,
			suppression = 16,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.x_g17.stats = {
			reload = 11,
			damage = 15,
			spread = 7,
			recoil = 7,
			spread_moving = 7,
			zoom = 1,
			concealment = 30,
			suppression = 16,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.ppk.stats = {
			reload = 11,
			damage = 18,
			spread = 9,
			recoil = 9,
			spread_moving = 9,
			zoom = 3,
			concealment = 30,
			suppression = 18,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.x_ppk.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 18,
			spread = 9,
			recoil = 9,
			spread_moving = 9,
			alert_size = 7,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 18,
			concealment = 30
		}
		self.p226.stats = {
			reload = 11,
			damage = 23,
			spread = 7,
			recoil = 7,
			spread_moving = 7,
			zoom = 3,
			concealment = 29,
			suppression = 15,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 4
		}
		self.x_p226.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 23,
			spread = 7,
			recoil = 7,
			spread_moving = 7,
			alert_size = 7,
			value = 4,
			extra_ammo = 51,
			reload = 11,
			suppression = 15,
			concealment = 29
		}
		self.colt_1911.stats = {
			reload = 11,
			damage = 23,
			spread = 7,
			recoil = 5,
			spread_moving = 5,
			zoom = 3,
			concealment = 29,
			suppression = 14,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.x_1911.stats = {
			reload = 11,
			damage = 23,
			spread = 7,
			recoil = 5,
			spread_moving = 4,
			zoom = 3,
			concealment = 27,
			suppression = 14,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.b92fs.stats = {
			reload = 11,
			damage = 18,
			spread = 8,
			recoil = 8,
			spread_moving = 5,
			zoom = 3,
			concealment = 30,
			suppression = 17,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.x_b92fs.stats = {
			reload = 11,
			damage = 18,
			spread = 8,
			recoil = 8,
			spread_moving = 7,
			zoom = 3,
			concealment = 28,
			suppression = 17,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.new_raging_bull.stats = {
			reload = 11,
			damage = 75,
			spread = 7,
			recoil = 2,
			spread_moving = 5,
			zoom = 3,
			concealment = 26,
			suppression = 7,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.x_rage.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 75,
			spread = 7,
			recoil = 2,
			spread_moving = 5,
			alert_size = 7,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 7,
			concealment = 26
		}
		self.pl14.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 60,
			spread = 6,
			recoil = 4,
			spread_moving = 4,
			alert_size = 7,
			value = 4,
			extra_ammo = 51,
			reload = 11,
			suppression = 15,
			concealment = 29
		}
		self.x_pl14.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 60,
			spread = 6,
			recoil = 4,
			spread_moving = 4,
			alert_size = 7,
			value = 4,
			extra_ammo = 51,
			reload = 11,
			suppression = 15,
			concealment = 29
		}
		self.sparrow.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 60,
			alert_size = 7,
			spread = 18,
			spread_moving = 18,
			recoil = 9,
			value = 4,
			extra_ammo = 51,
			reload = 11,
			suppression = 15,
			concealment = 29
		}
		self.x_sparrow.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 60,
			alert_size = 7,
			spread = 18,
			spread_moving = 18,
			recoil = 9,
			value = 4,
			extra_ammo = 51,
			reload = 11,
			suppression = 15,
			concealment = 29
		}
		self.legacy.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 18,
			spread = 8,
			recoil = 11,
			spread_moving = 8,
			alert_size = 7,
			value = 4,
			extra_ammo = 51,
			reload = 11,
			suppression = 15,
			concealment = 30
		}
		self.x_legacy.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 18,
			spread = 8,
			recoil = 11,
			spread_moving = 8,
			alert_size = 7,
			value = 4,
			extra_ammo = 51,
			reload = 11,
			suppression = 15,
			concealment = 30
		}
		self.g22c.stats = {
			reload = 11,
			damage = 23,
			spread = 6,
			recoil = 13,
			spread_moving = 8,
			zoom = 1,
			concealment = 29,
			suppression = 15,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.x_g22c.stats = {
			reload = 11,
			damage = 23,
			spread = 6,
			recoil = 13,
			spread_moving = 8,
			zoom = 1,
			concealment = 29,
			suppression = 15,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.c96.stats = {
			reload = 11,
			damage = 33,
			spread = 6,
			recoil = 7,
			spread_moving = 8,
			zoom = 3,
			concealment = 28,
			suppression = 14,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.x_c96.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 33,
			spread = 6,
			recoil = 7,
			spread_moving = 8,
			alert_size = 7,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 14,
			concealment = 28
		}
		self.lemming.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 33,
			alert_size = 7,
			spread = 18,
			spread_moving = 18,
			recoil = 7,
			value = 4,
			extra_ammo = 51,
			reload = 11,
			suppression = 15,
			concealment = 29
		}
		self.chinchilla.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 75,
			spread = 8,
			recoil = 2,
			spread_moving = 6,
			alert_size = 7,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 7,
			concealment = 28
		}
		self.x_chinchilla.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 75,
			spread = 8,
			recoil = 2,
			spread_moving = 6,
			alert_size = 7,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 7,
			concealment = 28
		}
		self.packrat.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 23,
			spread = 6,
			recoil = 7,
			spread_moving = 6,
			alert_size = 7,
			value = 4,
			extra_ammo = 51,
			reload = 11,
			suppression = 15,
			concealment = 29
		}
		self.x_packrat.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 23,
			spread = 6,
			recoil = 7,
			spread_moving = 6,
			alert_size = 7,
			value = 4,
			extra_ammo = 51,
			reload = 11,
			suppression = 15,
			concealment = 27
		}
		self.g26.stats = {
			reload = 11,
			damage = 18,
			spread = 7,
			recoil = 9,
			spread_moving = 9,
			zoom = 3,
			concealment = 30,
			suppression = 18,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.jowi.stats = {
			reload = 11,
			damage = 18,
			spread = 7,
			recoil = 9,
			spread_moving = 9,
			zoom = 3,
			concealment = 30,
			suppression = 15,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.shrew.stats = {
			zoom = 1,
			total_ammo_mod = 21,
			damage = 18,
			spread = 7,
			recoil = 7,
			spread_moving = 7,
			alert_size = 7,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 16,
			concealment = 30
		}
		self.x_shrew.stats = {
			zoom = 1,
			total_ammo_mod = 21,
			damage = 18,
			spread = 7,
			recoil = 7,
			spread_moving = 7,
			alert_size = 7,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 16,
			concealment = 30
		}
		self.hs2000.stats = {
			reload = 11,
			damage = 18,
			spread = 7,
			recoil = 7,
			spread_moving = 7,
			zoom = 3,
			concealment = 29,
			suppression = 15,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 4
		}
		self.x_hs2000.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 18,
			spread = 7,
			recoil = 7,
			spread_moving = 7,
			alert_size = 7,
			value = 4,
			extra_ammo = 51,
			reload = 11,
			suppression = 15,
			concealment = 29
		}
		self.glock_18c.stats = {
			reload = 11,
			damage = 20,
			spread = 5,
			recoil = 6,
			spread_moving = 9,
			zoom = 1,
			concealment = 29,
			suppression = 16,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.x_g18c.stats = {
			zoom = 1,
			total_ammo_mod = 21,
			damage = 20,
			spread = 5,
			recoil = 6,
			spread_moving = 9,
			alert_size = 7,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 14,
			concealment = 29
		}	
		self.peacemaker.stats = {
			reload = 11,
			damage = 10,
			spread = 8,
			recoil = 6,
			spread_moving = 9,
			zoom = 5,
			concealment = 26,
			suppression = 5,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.mateba.stats = {
			reload = 11,
			damage = 95,
			spread = 9,
			recoil = 10,
			spread_moving = 5,
			zoom = 3,
			concealment = 20,
			suppression = 7,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.x_2006m.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 95,
			spread = 9,
			recoil = 10,
			spread_moving = 5,
			alert_size = 7,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 7,
			concealment = 20
		}
		self.deagle.stats = {
			reload = 11,
			damage = 60,
			spread = 6,
			recoil = 3,
			spread_moving = 6,
			zoom = 3,
			concealment = 28,
			suppression = 7,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.x_deagle.stats = {
			reload = 11,
			damage = 60,
			spread = 6,
			recoil = 3,
			spread_moving = 4,
			zoom = 3,
			concealment = 26,
			suppression = 7,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.breech.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 75,
			alert_size = 7,
			spread = 6,
			recoil = 4,
			spread_moving = 5,
			value = 4,
			extra_ammo = 51,
			reload = 11,
			suppression = 15,
			concealment = 29
		}
		self.x_breech.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 75,
			alert_size = 7,
			spread = 6,
			recoil = 4,
			spread_moving = 5,
			value = 4,
			extra_ammo = 51,
			reload = 11,
			suppression = 15,
			concealment = 29
		}
		self.beer.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 18,
			alert_size = 7,
			spread = 5,
			spread_moving = 5,
			recoil = 11,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 14,
			concealment = 28
		}
		self.x_beer.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 18,
			alert_size = 7,
			spread = 5,
			spread_moving = 5,
			recoil = 11,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 14,
			concealment = 28
		}
		self.czech.stats = {
			zoom = 1,
			total_ammo_mod = 21,
			damage = 20,
			alert_size = 7,
			spread = 8,
			spread_moving = 7,
			recoil = 8,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 14,
			concealment = 26
		}
		self.x_czech.stats = {
			zoom = 1,
			total_ammo_mod = 21,
			damage = 20,
			alert_size = 7,
			spread = 8,
			spread_moving = 7,
			recoil = 8,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 14,
			concealment = 26
		}
		self.stech.stats = {
			zoom = 1,
			total_ammo_mod = 21,
			damage = 23,
			alert_size = 7,
			spread = 6,
			spread_moving = 3,
			recoil = 8,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 16,
			concealment = 25
		}
		self.x_stech.stats = {
			zoom = 1,
			total_ammo_mod = 21,
			damage = 23,
			alert_size = 7,
			spread = 6,
			spread_moving = 3,
			recoil = 8,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 16,
			concealment = 25
		}

		self.m45.stats = {
			reload = 11,
			damage = 28,
			spread = 6,
			recoil = 7,
			spread_moving = 8,
			zoom = 1,
			concealment = 24,
			suppression = 14,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 5
		}
		self.x_m45.stats = {
			zoom = 1,
			total_ammo_mod = 21,
			damage = 28,
			spread = 6,
			recoil = 7,
			spread_moving = 8,
			alert_size = 7,
			value = 5,
			extra_ammo = 51,
			reload = 11,
			suppression = 14,
			concealment = 24
		}
		self.mp7.stats = {
			reload = 11,
			damage = 28,
			spread = 7,
			recoil = 8,
			spread_moving = 7,
			zoom = 1,
			concealment = 23,
			suppression = 16,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 7
		}
		self.x_mp7.stats = {
			zoom = 1,
			total_ammo_mod = 21,
			alert_size = 7,
			damage = 28,
			spread = 7,
			recoil = 8,
			spread_moving = 7,
			value = 7,
			extra_ammo = 51,
			reload = 11,
			suppression = 16,
			concealment = 23
		}
		self.mac10.stats = {
			reload = 11,
			damage = 25,
			spread = 5,
			recoil = 6,
			spread_moving = 8,
			zoom = 3,
			concealment = 27,
			suppression = 14,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.x_mac10.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 25,
			spread = 5,
			recoil = 6,
			spread_moving = 8,
			alert_size = 7,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 14,
			concealment = 27
		}
		self.hajk.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 28,
			spread = 8,
			recoil = 5,
			spread_moving = 6,
			alert_size = 7,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 14,
			concealment = 18
		}
		self.x_hajk.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 28,
			spread = 8,
			recoil = 5,
			spread_moving = 6,
			alert_size = 7,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 14,
			concealment = 18
		}
		self.cobray.stats = {
			reload = 11,
			damage = 25,
			spread = 4,
			recoil = 8,
			spread_moving = 8,
			zoom = 3,
			concealment = 25,
			suppression = 14,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.x_cobray.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 25,
			spread = 4,
			recoil = 8,
			spread_moving = 8,
			alert_size = 7,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 14,
			concealment = 25
		}
		self.new_mp5.stats = {
			reload = 11,
			damage = 18,
			spread = 7,
			recoil = 11,
			spread_moving = 8,
			zoom = 3,
			concealment = 23,
			suppression = 17,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.x_mp5.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 18,
			spread = 7,
			recoil = 11,
			spread_moving = 8,
			alert_size = 7,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 17,
			concealment = 24
		}
		self.m1928.stats = {
			reload = 11,
			damage = 23,
			spread = 7,
			recoil = 10,
			spread_moving = 6,
			zoom = 1,
			concealment = 18,
			suppression = 12,
			alert_size = 8,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 9
		}
		self.x_m1928.stats = {
			zoom = 1,
			total_ammo_mod = 21,
			damage = 23,
			spread = 7,
			recoil = 10,
			spread_moving = 6,
			alert_size = 8,
			value = 9,
			extra_ammo = 51,
			reload = 11,
			suppression = 12,
			concealment = 18
		}
		self.scorpion.stats = {
			reload = 11,
			damage = 18,
			spread = 6,
			recoil = 7,
			spread_moving = 7,
			zoom = 1,
			concealment = 28,
			suppression = 17,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 7
		}
		self.x_scorpion.stats = {
			zoom = 1,
			total_ammo_mod = 21,
			damage = 18,
			spread = 6,
			recoil = 7,
			spread_moving = 7,
			alert_size = 7,
			value = 7,
			extra_ammo = 51,
			reload = 11,
			suppression = 17,
			concealment = 28
		}
		self.mp9.stats = {
			reload = 11,
			damage = 20,
			spread = 7,
			recoil = 7,
			spread_moving = 8,
			zoom = 3,
			concealment = 26,
			suppression = 16,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.x_mp9.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 20,
			spread = 7,
			recoil = 7,
			spread_moving = 8,
			alert_size = 7,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 16,
			concealment = 26
		}
		self.olympic.stats = {
			reload = 11,
			damage = 20,
			spread = 8,
			recoil = 10,
			spread_moving = 8,
			zoom = 3,
			concealment = 24,
			suppression = 10,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.x_olympic.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 20,
			spread = 8,
			recoil = 10,
			spread_moving = 8,
			alert_size = 7,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 10,
			concealment = 24
		}
		self.baka.stats = {
			reload = 11,
			damage = 25,
			spread = 4,
			recoil = 4,
			spread_moving = 4,
			zoom = 3,
			concealment = 29,
			suppression = 14,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.x_baka.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 25,
			spread = 4,
			recoil = 4,
			spread_moving = 4,
			alert_size = 7,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 14,
			concealment = 29
		}
		self.shepheard.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 25,
			spread = 7,
			recoil = 5,
			spread_moving = 7,
			alert_size = 7,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 14,
			concealment = 24
		}
		self.x_shepheard.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 25,
			spread = 7,
			recoil = 5,
			spread_moving = 7,
			alert_size = 7,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 14,
			concealment = 24
		}
		self.schakal.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 25,
			spread = 6,
			recoil = 7,
			spread_moving = 6,
			alert_size = 7,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 14,
			concealment = 24
		}
		self.x_schakal.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 25,
			spread = 6,
			recoil = 7,
			spread_moving = 6,
			alert_size = 7,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 14,
			concealment = 24
		}
		self.sr2.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 28,
			alert_size = 7,
			spread = 7,
			recoil = 10,
			spread_moving = 7,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 14,
			concealment = 28
		}
		self.x_sr2.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 28,
			alert_size = 7,
			spread = 7,
			recoil = 10,
			spread_moving = 7,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 15,
			concealment = 28
		}
		self.akmsu.stats = {
			reload = 11,
			damage = 25,
			spread = 5,
			recoil = 6,
			spread_moving = 9,
			zoom = 3,
			concealment = 21,
			suppression = 8,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.x_akmsu.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 25,
			spread = 5,
			recoil = 6,
			spread_moving = 9,
			alert_size = 7,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 8,
			concealment = 21
		}
		self.tec9.stats = {
			reload = 11,
			damage = 25,
			spread = 7,
			recoil = 7,
			spread_moving = 10,
			zoom = 1,
			concealment = 27,
			suppression = 12,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 7
		}
		self.x_tec9.stats = {
			zoom = 1,
			total_ammo_mod = 21,
			damage = 25,
			spread = 7,
			recoil = 7,
			spread_moving = 10,
			alert_size = 7,
			value = 7,
			extra_ammo = 51,
			reload = 11,
			suppression = 12,
			concealment = 27
		}
		self.p90.stats = {
			reload = 11,
			damage = 20,
			spread = 8,
			recoil = 9,
			spread_moving = 9,
			zoom = 3,
			concealment = 25,
			suppression = 12,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.x_p90.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 20,
			spread = 8,
			recoil = 9,
			spread_moving = 9,
			alert_size = 7,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 12,
			concealment = 25
		}
		self.polymer.stats = {
			reload = 11,
			damage = 28,
			spread = 5,
			recoil = 9,
			spread_moving = 8,
			zoom = 3,
			concealment = 20,
			suppression = 14,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 1
		}
		self.x_polymer.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 28,
			spread = 5,
			recoil = 9,
			spread_moving = 8,
			alert_size = 7,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 14,
			concealment = 20
		}
		self.coal.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 25,
			spread = 4,
			recoil = 6,
			spread_moving = 8,
			alert_size = 7,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 14,
			concealment = 24
		}
		self.x_coal.stats = {
			zoom = 3,
			total_ammo_mod = 21,
			damage = 25,
			spread = 4,
			recoil = 6,
			spread_moving = 8,
			alert_size = 7,
			value = 1,
			extra_ammo = 51,
			reload = 11,
			suppression = 14,
			concealment = 24
		}
		self.sterling.stats = {
			reload = 11,
			damage = 35,
			spread = 7,
			recoil = 7,
			spread_moving = 8,
			zoom = 1,
			concealment = 20,
			suppression = 12,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 7
		}
		self.x_sterling.stats = {
			zoom = 1,
			total_ammo_mod = 21,
			damage = 35,
			spread = 7,
			recoil = 7,
			spread_moving = 8,
			alert_size = 7,
			value = 7,
			extra_ammo = 51,
			reload = 11,
			suppression = 12,
			concealment = 20
		}
		self.uzi.stats = {
			reload = 11,
			damage = 28,
			spread = 8,
			recoil = 10,
			spread_moving = 8,
			zoom = 1,
			concealment = 24,
			suppression = 12,
			alert_size = 7,
			extra_ammo = 51,
			total_ammo_mod = 21,
			value = 7
		}
		self.x_uzi.stats = {
			zoom = 1,
			total_ammo_mod = 21,
			damage = 28,
			spread = 8,
			recoil = 10,
			spread_moving = 8,
			alert_size = 7,
			value = 7,
			extra_ammo = 51,
			reload = 11,
			suppression = 12,
			concealment = 24
		}
		self.erma.stats = {
			zoom = 1,
			total_ammo_mod = 21,
			damage = 28,
			spread = 7,
			recoil = 8,
			spread_moving = 8,
			alert_size = 7,
			value = 5,
			extra_ammo = 51,
			reload = 11,
			suppression = 14,
			concealment = 24
		}
		self.x_erma.stats = {
			zoom = 1,
			total_ammo_mod = 21,
			damage = 28,
			spread = 7,
			recoil = 8,
			spread_moving = 8,
			alert_size = 7,
			value = 5,
			extra_ammo = 51,
			reload = 11,
			suppression = 14,
			concealment = 24
		}
		
		self.plainsrider.stats.damage = 10
		self.long.stats.damage = 10
		self.frankish.stats.damage = 10
		self.arblast.stats.damage = 10
		
		self.holt.stats.damage = 23
		self.holt.stats.spread = 8
		self.holt.stats.spread_moving = 8
		self.holt.stats.recoil = 9
		self.x_holt.stats.damage = 23
		self.x_holt.stats.spread = 8
		self.x_holt.stats.spread_moving = 8
		self.x_holt.stats.recoil = 9
		
		self.m60.stats.damage = 33
		
		self.r700.stats.damage = 10
		self.r700.stats.recoil = 5
		
		self.r700.stats_modifiers = 			{damage = 10, suppression = 3, spread = 0.83}
		self.winchester1874.stats_modifiers = 	{damage = 10, suppression = 3, spread = 0.83}
		self.msr.stats_modifiers = 				{damage = 12, suppression = 3, spread = 0.83}
		self.model70.stats_modifiers = 			{damage = 12, suppression = 3}
		self.desertfox.stats_modifiers = 		{damage = 12, suppression = 3}
		self.r93.stats_modifiers = 				{damage = 12, suppression = 3, spread = 0.83}
		self.mosin.stats_modifiers = 			{damage = 12, suppression = 3, spread = 0.83}
		self.m95.stats_modifiers = 				{damage = 144, suppression = 5, spread = 0.83}
		
		self.tti.stats_modifiers = 			{damage = 9, suppression = 3, spread = 0.83}
		self.siltstone.stats_modifiers = 	{damage = 9, suppression = 3}
		self.wa2000.stats_modifiers = 		{damage = 9.5, suppression = 3, spread = 0.67}
		
		self.plainsrider.stats_modifiers = 		{damage = 6.5}
		self.long.stats_modifiers = 			{damage = 9}
		self.frankish.stats_modifiers = 		{damage = 9}
		self.arblast.stats_modifiers = 			{damage = 12}
		self.hunter.stats_modifiers = 			{damage = 7.5}
		self.elastic.stats_modifiers = 			{damage = 8.0}
		self.ecp.stats_modifiers = 				{damage = 9.5}
		self.peacemaker.stats_modifiers = 		{damage = 12}
		self.arbiter.stats_modifiers = 			{damage = 12.5}
		self.slap.stats_modifiers = 			{damage = 34}
		self.china.stats_modifiers = 			{damage = 34}
		self.gre_m79.stats_modifiers = 			{damage = 34}
		self.m32.stats_modifiers = 				{damage = 34}
		self.contraband_m203.stats_modifiers = 	{damage = 34}
		self.ray.stats_modifiers = 				{damage = 250}
		self.rpg7.stats_modifiers = 			{damage = 1000}
		
		self.saw_secondary = nil
		
		self.china.use_data = {selection_index = SELECTION.PRIMARY}
		self.rpg7.use_data = {selection_index = SELECTION.PRIMARY}
		self.ray.use_data = {selection_index = SELECTION.PRIMARY}
		self.ecp.use_data = {selection_index = SELECTION.PRIMARY}
		self.rpg7.NR_CLIPS_MAX = 2
		self.ray.NR_CLIPS_MAX = 1
		self.rpg7.AMMO_MAX = self.rpg7.CLIP_AMMO_MAX * self.rpg7.NR_CLIPS_MAX
		self.ray.AMMO_MAX = self.ray.CLIP_AMMO_MAX * self.ray.NR_CLIPS_MAX
		
		self.gre_m79.has_description = true
		self.m32.has_description = true
		self.m95.has_description = true
		self.slap.has_description = true
		self.china.has_description = true
		self.arbiter.has_description = true
		self.m134.has_description = true
		self.shuno.has_description = true
		self.flamethrower_mk2.has_description = true
		self.system.has_description = true
		self.lemming.has_description = true
		self.wa2000.has_description = true
		self.tti.has_description = true
		self.siltstone.has_description = true
		self.msr.has_description = true
		self.model70.has_description = true
		self.desertfox.has_description = true
		self.r93.has_description = true
		self.winchester1874.has_description = true
		self.mosin.has_description = true
		
		self.gre_m79.desc_id = "bm_w_rpg7_desc"
		self.m32.desc_id = "bm_w_rpg7_desc"
		self.m95.desc_id = "bm_w_m95_desc"
		self.slap.desc_id = "bm_w_rpg7_desc"
		self.china.desc_id = "bm_w_rpg7_desc"
		self.arbiter.desc_id = "bm_w_rpg7_desc"
		self.m134.desc_id = "bm_w_rpg7_desc"
		self.shuno.desc_id = "bm_w_rpg7_desc"
		self.flamethrower_mk2.desc_id = "bm_w_rpg7_desc"
		self.system.desc_id = "bm_w_rpg7_desc"
		self.lemming.desc_id = "bm_w_lemming_desc"
		self.wa2000.desc_id = "bm_w_wa2000_desc"
		self.tti.desc_id = "bm_w_wa2000_desc"
		self.siltstone.desc_id = "bm_w_wa2000_desc"
		self.msr.desc_id = "bm_w_msr_desc"
		self.model70.desc_id = "bm_w_msr_desc"
		self.desertfox.desc_id = "bm_w_msr_desc"
		self.r93.desc_id = "bm_w_msr_desc"
		self.winchester1874.desc_id = "bm_w_msr_desc"
		self.mosin.desc_id = "bm_w_msr_desc"
		
		self.x_legacy.global_value = nil
		self.m95.global_value = nil
		self.m134.global_value = nil
		self.shuno.global_value = nil
		self.rpg7.global_value = nil
		self.ray.global_value = nil
		self.flamethrower_mk2.global_value = nil
		self.system.global_value = nil
		self.ecp.global_value = nil
		self.elastic.global_value = nil
		self.hunter.global_value = nil
		self.plainsrider.global_value = nil
		self.long.global_value = nil
		self.frankish.global_value = nil
		self.arblast.global_value = nil
		
		self.wa2000.can_shoot_through_shield = false
		self.tti.can_shoot_through_shield = false
		self.siltstone.can_shoot_through_shield = false
		self.wa2000.can_shoot_through_wall = false
		self.tti.can_shoot_through_wall = false
		self.siltstone.can_shoot_through_wall = false
		
		self.msr.can_shoot_through_shield = false
		self.model70.can_shoot_through_shield = false
		self.desertfox.can_shoot_through_shield = false
		self.r93.can_shoot_through_shield = false
		self.winchester1874.can_shoot_through_shield = false
		self.mosin.can_shoot_through_shield = false
		
		self.peacemaker.can_shoot_through_enemy = true
		self.lemming.can_shoot_through_enemy = false
		self.lemming.can_shoot_through_shield = false
		self.lemming.can_shoot_through_wall = false
		
		self.wa2000.fire_mode_data.fire_rate = 0.5

		self.flamethrower_mk2.CLIP_AMMO_MAX = 150
		self.flamethrower_mk2.NR_CLIPS_MAX = 4
		self.flamethrower_mk2.AMMO_MAX = self.flamethrower_mk2.CLIP_AMMO_MAX * self.flamethrower_mk2.NR_CLIPS_MAX
		self.system.CLIP_AMMO_MAX = 100
		self.system.NR_CLIPS_MAX = 4
		self.system.AMMO_MAX = self.system.CLIP_AMMO_MAX * self.system.NR_CLIPS_MAX
		
		self.s552.CLIP_AMMO_MAX = 30
		self.s552.NR_CLIPS_MAX = 5
		self.s552.AMMO_MAX = self.s552.CLIP_AMMO_MAX * self.s552.NR_CLIPS_MAX
		self.scar.CLIP_AMMO_MAX = 20
		self.scar.NR_CLIPS_MAX = 4
		self.scar.AMMO_MAX = self.scar.CLIP_AMMO_MAX * self.scar.NR_CLIPS_MAX
		self.g36.CLIP_AMMO_MAX = 30
		self.g36.NR_CLIPS_MAX = 5
		self.g36.AMMO_MAX = self.g36.CLIP_AMMO_MAX * self.g36.NR_CLIPS_MAX
		self.famas.CLIP_AMMO_MAX = 30
		self.famas.NR_CLIPS_MAX = 5
		self.famas.AMMO_MAX = self.famas.CLIP_AMMO_MAX * self.famas.NR_CLIPS_MAX
		self.asval.CLIP_AMMO_MAX = 20
		self.asval.NR_CLIPS_MAX = 4
		self.asval.AMMO_MAX = self.asval.CLIP_AMMO_MAX * self.asval.NR_CLIPS_MAX
		self.contraband.CLIP_AMMO_MAX = 20
		self.contraband.NR_CLIPS_MAX = 5
		self.contraband.AMMO_MAX = self.contraband.CLIP_AMMO_MAX * self.contraband.NR_CLIPS_MAX
		self.fal.CLIP_AMMO_MAX = 20
		self.fal.NR_CLIPS_MAX = 4
		self.fal.AMMO_MAX = self.fal.CLIP_AMMO_MAX * self.fal.NR_CLIPS_MAX
		self.g3.CLIP_AMMO_MAX = 20
		self.g3.NR_CLIPS_MAX = 4
		self.g3.AMMO_MAX = self.g3.CLIP_AMMO_MAX * self.g3.NR_CLIPS_MAX
		self.new_m14.CLIP_AMMO_MAX = 10
		self.new_m14.NR_CLIPS_MAX = 4
		self.new_m14.AMMO_MAX = self.new_m14.CLIP_AMMO_MAX * self.new_m14.NR_CLIPS_MAX
		self.ching.CLIP_AMMO_MAX = 8
		self.ching.NR_CLIPS_MAX = 5
		self.ching.AMMO_MAX = self.ching.CLIP_AMMO_MAX * self.ching.NR_CLIPS_MAX
		self.slap.CLIP_AMMO_MAX = 1
		self.slap.NR_CLIPS_MAX = 3
		self.slap.AMMO_MAX = self.slap.CLIP_AMMO_MAX * self.slap.NR_CLIPS_MAX
		self.judge.NR_CLIPS_MAX = 5
		self.judge.AMMO_MAX = self.judge.CLIP_AMMO_MAX * self.judge.NR_CLIPS_MAX
		
		self.r870.damage_near = 700
		self.r870.damage_far = 1500
		self.saiga.damage_near = 700
		self.saiga.damage_far = 1800
		self.serbu.damage_near = 800
		self.serbu.damage_far = 1200
		self.huntsman.damage_near = 1000
		self.huntsman.damage_far = 2000
		self.judge.damage_near = 800
		self.judge.damage_far = 1200
		self.benelli.damage_near = 700
		self.benelli.damage_far = 1800
		self.striker.damage_near = 700
		self.striker.damage_far = 1800
		self.ksg.damage_near = 700
		self.ksg.damage_far = 1500
		self.gre_m79.damage_near = 1000
		self.gre_m79.damage_far = 2000
		self.spas12.damage_near = 700
		self.spas12.damage_far = 1800
		self.rpg7.damage_near = 1000
		self.rpg7.damage_far = 2000
		self.b682.damage_near = 1000
		self.b682.damage_far = 2000
		self.m32.damage_near = 1000
		self.m32.damage_far = 2000
		self.aa12.damage_near = 800
		self.aa12.damage_far = 2000
		self.m37.damage_near = 800
		self.m37.damage_far = 1200
		self.china.damage_near = 1000
		self.china.damage_far = 2000
		self.boot.damage_near = 1000
		self.boot.damage_far = 2000
		self.rota.damage_near = 700
		self.rota.damage_far = 1800
		self.contraband_m203.damage_near = 1000
		self.contraband_m203.damage_far = 2000
		self.basset.damage_near = 700
		self.basset.damage_far = 1800
		self.x_basset.damage_near = 700
		self.x_basset.damage_far = 1800
		self.slap.damage_near = 1000
		self.slap.damage_far = 2000
		self.x_judge.damage_near = 800
		self.x_judge.damage_far = 1200
		self.x_rota.damage_near = 700
		self.x_rota.damage_far = 1800
		self.coach.damage_near = 1000
		self.coach.damage_far = 2000
		
		self.lemming.AMMO_PICKUP = self:_pickup_chance(self.lemming.AMMO_MAX, PICKUP.AR_HIGH_CAPACITY)
		self.asval.AMMO_PICKUP = self:_pickup_chance(self.asval.AMMO_MAX, PICKUP.OTHER)
		self.contraband.AMMO_PICKUP = self:_pickup_chance(self.contraband.AMMO_MAX, PICKUP.AR_HIGH_CAPACITY)
		self.rpk.AMMO_PICKUP = self:_pickup_chance(self.aug.AMMO_MAX, PICKUP.AR_HIGH_CAPACITY)
		self.hk21.AMMO_PICKUP = self:_pickup_chance(self.aug.AMMO_MAX, PICKUP.AR_HIGH_CAPACITY)
		self.famas.AMMO_PICKUP = self:_pickup_chance(self.aug.AMMO_MAX, PICKUP.AR_HIGH_CAPACITY)
		self.m249.AMMO_PICKUP = self:_pickup_chance(self.contraband.AMMO_MAX, PICKUP.AR_HIGH_CAPACITY)
		self.par.AMMO_PICKUP = self:_pickup_chance(self.contraband.AMMO_MAX, PICKUP.AR_HIGH_CAPACITY)
		self.mg42.AMMO_PICKUP = self:_pickup_chance(self.contraband.AMMO_MAX, PICKUP.AR_HIGH_CAPACITY)
		self.judge.AMMO_PICKUP = self:_pickup_chance(self.judge.AMMO_MAX, PICKUP.AR_HIGH_CAPACITY)
		self.scorpion.AMMO_PICKUP = self:_pickup_chance(180, 1)
		self.tec9.AMMO_PICKUP = self:_pickup_chance(160, 1)
		self.uzi.AMMO_PICKUP = self:_pickup_chance(100, 1)
		self.sterling.AMMO_PICKUP = self:_pickup_chance(100, 1)
		self.m1928.AMMO_PICKUP = self:_pickup_chance(90, 1.5)
		self.l85a2.AMMO_PICKUP = self:_pickup_chance(90, 1.5)
		
		self.m134.AMMO_PICKUP = self:_pickup_chance(0, 2)
		self.shuno.AMMO_PICKUP = self:_pickup_chance(0, 2)
		self.flamethrower_mk2.AMMO_PICKUP = self:_pickup_chance(0, 1)
		self.system.AMMO_PICKUP = self:_pickup_chance(0, 1)
		self.gre_m79.AMMO_PICKUP = {0, 0}
		self.m32.AMMO_PICKUP = {0, 0}
		self.m95.AMMO_PICKUP = {0, 0}
		self.slap.AMMO_PICKUP = {0, 0}
		self.china.AMMO_PICKUP = {0, 0}
		self.arbiter.AMMO_PICKUP = {0, 0}
		self.contraband_m203.AMMO_PICKUP = {0, 0}
		
		self.msr.AMMO_PICKUP = {1, 1}
		self.r93.AMMO_PICKUP = {0.7, 1}
		self.mosin.AMMO_PICKUP = {0.7, 1}
		self.model70.AMMO_PICKUP = {0.7, 1}
		self.winchester1874.AMMO_PICKUP = {0.7, 1}
		
	end

	function WeaponTweakData:_pickup_chance(max_ammo, selection_index)
		local low, high = nil

		if selection_index == PICKUP.AR_HIGH_CAPACITY then
			low = 0.02
			high = 0.05
		elseif selection_index == PICKUP.AR_MED_CAPACITY then
			low = 0.02
			high = 0.05
		elseif selection_index == PICKUP.SHOTGUN_HIGH_CAPACITY then
			low = 0.02
			high = 0.05
		elseif selection_index == PICKUP.SNIPER_LOW_DAMAGE then
			low = 0.02
			high = 0.05
		elseif selection_index == PICKUP.SNIPER_HIGH_DAMAGE then
			low = 0.005
			high = 0.015
		elseif selection_index == PICKUP.LMG_HIGH_CAPACITY then
			low = 10.005
			high = 10.015
		elseif selection_index == PICKUP.LMG_MED_CAPACITY then
			low = 10.005
			high = 10.015
		else
			low = 0.01
			high = 0.035
		end

		return {
			max_ammo * low,
			max_ammo * high
		}
	end
end
if string.lower(RequiredScript) == "lib/tweak_data/weaponfactorytweakdata" then
	local data = WeaponFactoryTweakData.create_bonuses
	function WeaponFactoryTweakData:create_bonuses(tweak_data, weapon_skins)
		data(self, tweak_data, weapon_skins)
		self.parts.wpn_fps_upg_bonus_damage_p2 = nil
		self.parts.wpn_fps_upg_bonus_team_exp_money_p3.custom_stats = {exp_multiplier = 1.05, money_multiplier = 1.05}
	end

	local data = WeaponFactoryTweakData.init
	function WeaponFactoryTweakData:init(tweak_data)
		data(self, tweak_data)
		self.parts.wpn_fps_upg_ns_ass_smg_large.stats.damage = -2
		self.parts.wpn_fps_upg_ns_ass_smg_medium.stats.damage = -7
		self.parts.wpn_fps_upg_ns_ass_smg_small.stats.damage = -10
		self.parts.wpn_fps_upg_ns_pis_large.stats.damage = -2
		self.parts.wpn_fps_upg_ns_pis_medium.stats.damage = -4
		self.parts.wpn_fps_upg_ns_pis_small.stats.damage = -6
		self.parts.wpn_fps_upg_ns_shot_thick.stats.damage = -10
		self.parts.wpn_fps_upg_ns_ass_smg_firepig.stats.damage = 7
		self.parts.wpn_fps_upg_ns_ass_smg_stubby.stats.damage = 2
		self.parts.wpn_fps_upg_ns_ass_smg_tank.stats.damage = 5
		self.parts.wpn_fps_upg_ns_shot_shark.stats.damage = 7
		self.parts.wpn_fps_upg_i_autofire.stats.damage = 2
		self.parts.wpn_fps_upg_fg_jp.stats.damage = 2
		self.parts.wpn_fps_upg_fg_smr.stats.damage = 5
		self.parts.wpn_fps_upg_ak_b_draco.stats.damage = 5
		self.parts.wpn_fps_upg_ass_ns_jprifles.stats.damage = 5
		self.parts.wpn_fps_upg_ass_ns_linear.stats.damage = 10
		self.parts.wpn_fps_upg_pis_ns_flash.stats.damage = 2
		self.parts.wpn_fps_upg_ass_ns_surefire.stats.damage = 5
		self.parts.wpn_fps_upg_shot_ns_king.stats.damage = 5
		self.parts.wpn_fps_m4_upper_reciever_edge.stats.damage = 5
		self.parts.wpn_fps_upg_shot_ns_king.stats.damage = 5
		self.parts.wpn_fps_m4_uupg_b_long.stats.damage = 5
		self.parts.wpn_fps_m4_uupg_b_sd.stats.damage = -5
		self.parts.wpn_fps_pis_g18c_co_1.stats.damage = 3
		self.parts.wpn_fps_pis_g18c_co_comp_2.stats.damage = 3
		self.wpn_fps_ass_m16.override.wpn_fps_upg_ass_m4_b_beowulf.stats = {value = 1, spread = 2, recoil = -8, total_ammo_mod = -11, damage = 30, concealment = -4}
		self.wpn_fps_ass_74.override.wpn_fps_upg_ass_ak_b_zastava.stats = {value = 1, spread = 2, recoil = -8, total_ammo_mod = -14, damage = 47, concealment = -4}
		self.parts.wpn_fps_ass_ak5_fg_ak5c.stats.damage = 3
		self.parts.wpn_fps_aug_b_long.stats.damage = 2
		self.parts.wpn_fps_aug_fg_a3.stats.damage = 2
		self.parts.wpn_fps_smg_p90_b_long.stats.damage = 5
		self.parts.wpn_fps_pis_deagle_b_long.stats.damage = 10
		self.parts.wpn_fps_pis_deagle_co_long.stats.damage = 10
		self.parts.wpn_fps_pis_deagle_co_short.stats.damage = 5
		self.parts.wpn_fps_smg_mp5_fg_mp5sd.stats.damage = -5
		self.parts.wpn_fps_pis_1911_b_long.stats.damage = 2
		self.parts.wpn_fps_pis_1911_b_vented.stats.damage = 2
		self.parts.wpn_fps_pis_1911_co_1.stats.damage = 2
		self.parts.wpn_fps_pis_1911_co_2.stats.damage = 5
		self.parts.wpn_fps_pis_beretta_co_co1.stats.damage = 2
		self.parts.wpn_fps_pis_beretta_co_co2.stats.damage = 5
		self.parts.wpn_fps_pis_rage_b_comp1.stats.damage = 10
		self.parts.wpn_fps_pis_rage_b_comp2.stats.damage = 5
		self.parts.wpn_fps_pis_usp_co_comp_1.stats.damage = 5
		self.parts.wpn_fps_pis_g22c_b_long.stats.damage = 2
		self.parts.wpn_fps_ass_s552_b_long.stats.damage = 2
		self.parts.wpn_fps_ass_s552_body_standard_black.stats.damage = 2
		self.parts.wpn_fps_pis_ppk_b_long.stats.damage = 2
		self.parts.wpn_fps_smg_mp7_b_suppressed.stats.damage = -3
		self.parts.wpn_fps_ass_scar_b_short.stats.damage = 2
		self.parts.wpn_fps_pis_p226_b_equinox.stats.damage = 5
		self.parts.wpn_fps_pis_p226_b_long.stats.damage = 2
		self.parts.wpn_fps_pis_p226_co_comp_1.stats.damage = 5
		self.parts.wpn_fps_lmg_hk21_b_long.stats.damage = -3
		self.parts.wpn_fps_lmg_hk21_fg_short.stats.damage = 2
		self.parts.wpn_fps_lmg_m249_b_long.stats.damage = -3
		self.parts.wpn_fps_lmg_m249_fg_mk46.stats.damage = 5
		self.parts.wpn_fps_lmg_rpk_fg_standard.stats.damage = 3
		self.parts.wpn_fps_snp_m95_barrel_suppressed.stats.damage = -3
		self.parts.wpn_fps_snp_msr_ns_suppressor.stats.damage = -2
		self.parts.wpn_fps_snp_r93_b_suppressed.stats.damage = -2
		self.parts.wpn_fps_ass_fal_fg_01.stats.damage = 2
		self.parts.wpn_fps_ass_fal_fg_03.stats.damage = 2
		self.parts.wpn_fps_ass_fal_fg_04.stats.damage = 2
		self.parts.wpn_fps_sho_striker_b_suppressed.stats.damage = -5
		self.parts.wpn_fps_sho_ksg_b_short.stats.damage = 5
		self.parts.wpn_fps_ass_g3_b_sniper.stats = {value = 2, recoil = -2, spread = 2, concealment = -2, total_ammo_mod = -10, damage = 32, extra_ammo = -5}
		self.parts.wpn_fps_ass_g3_b_short.stats = {value = 2, recoil = 2, spread = -2, concealment = 4, damage = -13, total_ammo_mod = 5}
		self.parts.wpn_fps_ass_galil_fg_mar.stats.damage = 5
		self.parts.wpn_fps_ass_galil_fg_sar.stats.damage = 2
		self.parts.wpn_fps_ass_famas_b_long.stats.damage = 2
		self.parts.wpn_fps_ass_famas_b_short.stats.damage = 5
		self.parts.wpn_fps_ass_famas_b_sniper.stats.damage = 2
		self.parts.wpn_fps_upg_a_slug.stats = {value = 5, total_ammo_mod = -10, damage = 15, spread = 2, moving_spread = 2}	
		self.parts.wpn_fps_upg_a_custom.stats = {value = 5, total_ammo_mod = -6, damage = 15}
		self.parts.wpn_fps_upg_a_custom_free.stats = {value = 5, total_ammo_mod = -6, damage = 15}
		self.parts.wpn_fps_upg_a_explosive.stats = {value = 5, total_ammo_mod = -10, damage = 15, spread = -3, moving_spread = 3}
		self.parts.wpn_fps_upg_a_piercing.stats = {value = 5, damage = -15, spread = 2 	}	
		self.parts.wpn_fps_upg_a_dragons_breath.stats = {value = 5, total_ammo_mod = -6, damage = -10, spread = -1, moving_spread = 3}
		self.parts.wpn_fps_upg_a_grenade_launcher_incendiary.stats.damage = -10
		self.parts.wpn_fps_upg_a_grenade_launcher_incendiary_arbiter.stats.damage = -8
		self.parts.wpn_fps_pis_g26_b_custom.stats.damage = 2
		self.parts.wpn_fps_pis_g26_body_custom.stats.damage = 2
		self.parts.wpn_fps_upg_ns_pis_large_kac.stats.damage = -2
		self.parts.wpn_fps_upg_ns_pis_medium_gem.stats.damage = -7
		self.parts.wpn_fps_upg_ns_pis_meatgrinder.stats.damage = 5
		self.parts.wpn_fps_lmg_mg42_b_mg34.stats.damage = -2
		self.parts.wpn_fps_pis_c96_b_long.stats.damage = 5
		self.parts.wpn_fps_pis_c96_nozzle.stats.damage = 5
		self.parts.wpn_fps_smg_sterling_b_long.stats.damage = 2
		self.parts.wpn_fps_smg_sterling_b_short.stats.damage = 5
		self.parts.wpn_fps_snp_mosin_b_sniper.stats.damage = -2
		self.parts.wpn_fps_ass_vhs_b_silenced.stats.damage = -2
		self.parts.wpn_fps_pis_hs2000_sl_custom.stats.damage = 5
		self.parts.wpn_fps_pis_hs2000_sl_long.stats.damage = 2
		self.parts.wpn_fps_upg_ass_ak_b_zastava.stats = {value = 1, spread = 2, recoil = -8, total_ammo_mod = -11, damage = 47, concealment = -4}
		self.parts.wpn_fps_upg_ak_b_ak105.stats.damage = 5
		self.parts.wpn_fps_upg_ass_m4_fg_lvoa.stats.damage = 5
		self.parts.wpn_fps_upg_ass_m4_fg_moe.stats.damage = 2
		self.parts.wpn_fps_upg_ass_m4_upper_reciever_core.stats.damage = 5
		self.parts.wpn_fps_upg_ass_m4_lower_reciever_core.stats.damage = 5
		self.parts.wpn_fps_upg_ass_m4_b_beowulf.stats = {value = 1, spread = 2, recoil = -8, total_ammo_mod = -14, damage = 32, concealment = -4}
		self.parts.wpn_fps_smg_cobray_body_upper_jacket.stats.damage = 2
		self.parts.wpn_fps_smg_cobray_ns_barrelextension.stats.damage = 5
		self.parts.wpn_fps_smg_cobray_ns_silencer.stats.damage = -7
		self.parts.wpn_fps_saw_body_speed.stats.damage = 7
		self.parts.wpn_fps_saw_m_blade_sharp.stats.damage = 7
		self.parts.wpn_fps_aug_body_f90.stats.damage = 5
		self.parts.wpn_fps_ass_ak5_b_short.stats.damage = 5
		self.parts.wpn_fps_smg_p90_b_civilian.stats.damage = 5
		self.parts.wpn_fps_smg_p90_b_ninja.stats.damage = -2
		self.parts.wpn_fps_upg_ass_ns_battle.stats.damage = 5
		self.parts.wpn_fps_upg_ns_ass_filter.stats.damage = -7
		self.parts.wpn_fps_upg_ns_sho_salvo_large.stats.damage = -10
		self.parts.wpn_fps_fla_mk2_mag_rare.stats = {value = 1, total_ammo_mod = 5, damage = -3}
		self.parts.wpn_fps_fla_mk2_mag_welldone.stats = {value = 1, total_ammo_mod = -5, damage = 4}
		self.parts.wpn_fps_sho_aa12_barrel_silenced.stats.damage = -5
		self.parts.wpn_fps_snp_winchester_b_suppressed.stats.damage = -2
		self.parts.wpn_fps_bow_elastic_m_explosive.stats.damage = 2
		self.parts.wpn_fps_bow_elastic_m_poison.stats.damage = -4
		self.parts.wpn_fps_bow_ecp_m_arrows_explosive.stats.damage = 2
		self.parts.wpn_fps_bow_ecp_m_arrows_poison.stats.damage = -4
		self.parts.wpn_fps_upg_a_bow_explosion.stats.damage = 2
		self.parts.wpn_fps_upg_a_bow_poison.stats.damage = -4
		self.parts.wpn_fps_bow_long_m_explosive.stats.damage = 2
		self.parts.wpn_fps_bow_long_m_poison.stats.damage = -4
		self.parts.wpn_fps_bow_frankish_m_explosive.stats.damage = 2
		self.parts.wpn_fps_bow_frankish_m_poison.stats.damage = -4
		self.parts.wpn_fps_bow_arblast_m_explosive.stats.damage = 2
		self.parts.wpn_fps_bow_arblast_m_poison.stats.damage = -4
		self.parts.wpn_fps_ass_sub2000_fg_suppressed.stats.damage = -2
		self.parts.wpn_fps_snp_wa2000_b_suppressed.stats.damage = -2
		self.parts.wpn_fps_smg_polymer_barrel_precision.stats.damage = 5
		self.parts.wpn_fps_smg_polymer_ns_silencer.stats.damage = -7
		self.parts.wpn_fps_upg_a_crossbow_explosion.stats.damage = 2
		self.parts.wpn_fps_upg_a_crossbow_poison.stats = {damage = -4, total_ammo_mod = -6}
		self.parts.wpn_fps_smg_baka_b_midsupp.stats.damage = -5
		self.parts.wpn_fps_smg_baka_b_smallsupp.stats.damage = -9
		self.parts.wpn_fps_snp_model70_ns_suppressor.stats.damage = -2
		self.parts.wpn_fps_ass_74_b_legend.stats.damage = 14
		self.parts.wpn_fps_pis_deagle_b_legend.stats.damage = 5
		self.parts.wpn_fps_fla_mk2_body_fierybeast.stats.damage = -5
		self.parts.wpn_fps_shot_r870_b_legendary.stats.damage = 10
		self.parts.wpn_fps_ass_m16_s_legend.stats.damage = 7
		self.parts.wpn_fps_sho_boot_fg_legendary.stats.damage = 20
		self.parts.wpn_fps_shot_shorty_fg_legendary.stats.damage = 15
		self.parts.wpn_fps_ass_m14_body_legendary.stats.damage = 7
		self.parts.wpn_fps_smg_sr2_ns_silencer.stats.damage = -5
		self.parts.wpn_fps_ass_tecci_ns_special.stats.damage = 5
		self.parts.wpn_fps_smg_schakal_ns_silencer.stats.damage = -7
		self.parts.wpn_fps_snp_desertfox_b_silencer.stats.damage = -2
		self.parts.wpn_fps_sho_rota_b_silencer.stats.damage = -5
		self.parts.wpn_fps_upg_ns_duck.stats.damage = 5
		self.parts.wpn_fps_snp_tti_ns_hex.stats.damage = -2
		self.parts.wpn_fps_snp_siltstone_b_silenced.stats.damage = -2
		self.parts.wpn_fps_pis_deagle_b_modern.stats.damage = 10
		self.parts.wpn_fps_fla_system_m_high.stats.damage = 10
		self.parts.wpn_fps_fla_system_m_low.stats = {value = 1, total_ammo_mod = 5, damage = -3}
		self.parts.wpn_fps_fla_system_m_high.stats = {value = 1, total_ammo_mod = -5, damage = 7}
		self.parts.wpn_fps_upg_ns_ass_smg_v6.stats.damage = 2
		self.parts.wpn_fps_upg_ns_pis_typhoon.stats.damage = 2
		
		self.parts.wpn_fps_upg_i_autofire.forbids = {
			"wpn_fps_amcar_uupg_body_upperreciever",
			"wpn_fps_ass_m16_os_frontsight",
			"wpn_fps_ass_scar_o_flipups_up",
			"wpn_fps_upg_o_xpsg33_magnifier",
			"wpn_fps_upg_o_sig"
		}
		
		self.parts.wpn_fps_upg_ns_pis_large_kac.has_description = true
		self.parts.wpn_fps_upg_ns_pis_large.has_description = true
		self.parts.wpn_fps_upg_ns_ass_smg_large.has_description = true
		self.parts.wpn_fps_upg_ns_pis_medium.has_description = true
		self.parts.wpn_fps_upg_ns_pis_medium_slim.has_description = true
		self.parts.wpn_fps_m4_uupg_b_sd.has_description = true
		self.parts.wpn_fps_smg_mp7_b_suppressed.has_description = true
		self.parts.wpn_fps_snp_msr_ns_suppressor.has_description = true
		self.parts.wpn_fps_upg_ns_pis_medium_gem.has_description = true
		self.parts.wpn_fps_smg_sterling_b_suppressed.has_description = true
		self.parts.wpn_fps_sho_striker_b_suppressed.has_description = true
		self.parts.wpn_fps_upg_ns_pis_small.has_description = true
		self.parts.wpn_fps_upg_ns_ass_smg_medium.has_description = true
		self.parts.wpn_fps_smg_sterling_b_e11.has_description = true
		self.parts.wpn_fps_snp_mosin_b_sniper.has_description = true
		self.parts.wpn_fps_smg_scorpion_b_suppressed.has_description = true
		self.parts.wpn_fps_upg_ns_ass_smg_small.has_description = true
		self.parts.wpn_fps_upg_ns_shot_thick.has_description = true
		self.parts.wpn_fps_ass_famas_b_suppressed.has_description = true
		self.parts.wpn_fps_smg_uzi_b_suppressed.has_description = true
		self.parts.wpn_fps_ass_vhs_b_silenced.has_description = true
		self.parts.wpn_fps_snp_r93_b_suppressed.has_description = true
		self.parts.wpn_fps_lmg_mg42_b_vg38.has_description = true
		self.parts.wpn_fps_snp_m95_barrel_suppressed.has_description = true
		self.parts.wpn_fps_saw_body_silent.has_description = true
		self.parts.wpn_fps_upg_ns_sho_salvo_large.has_description = true
		self.parts.wpn_fps_upg_ns_pis_jungle.has_description = true
		self.parts.wpn_fps_upg_ns_ass_filter.has_description = true
		self.parts.wpn_fps_smg_cobray_ns_silencer.has_description = true
		self.parts.wpn_fps_smg_mp9_b_suppressed.has_description = true
		self.parts.wpn_fps_smg_baka_b_longsupp.has_description = true
		self.parts.wpn_fps_smg_baka_b_midsupp.has_description = true
		self.parts.wpn_fps_smg_baka_b_smallsupp.has_description = true
		self.parts.wpn_fps_smg_schakal_ns_silencer.has_description = true
		self.parts.wpn_fps_smg_sr2_ns_silencer.has_description = true
		self.parts.wpn_fps_upg_ns_ass_pbs1.has_description = true
		self.parts.wpn_fps_smg_p90_b_civilian.has_description = true
		self.parts.wpn_fps_smg_p90_b_ninja.has_description = true
		self.parts.wpn_fps_smg_polymer_ns_silencer.has_description = true
		self.parts.wpn_fps_ass_asval_b_proto.has_description = true
		self.parts.wpn_fps_sho_aa12_barrel_silenced.has_description = true
		self.parts.wpn_fps_snp_wa2000_b_suppressed.has_description = true
		self.parts.wpn_fps_snp_siltstone_b_silenced.has_description = true
		 
		self.parts.wpn_fps_upg_ns_pis_large_kac.desc_id = 		"menu_silencer_radius_silent"
		self.parts.wpn_fps_upg_ns_pis_large.desc_id = 			"menu_silencer_radius_silent"
		self.parts.wpn_fps_upg_ns_pis_jungle.desc_id = 			"menu_silencer_radius_silent"
		self.parts.wpn_fps_smg_cobray_ns_silencer.desc_id = 	"menu_silencer_radius_silent"
		self.parts.wpn_fps_smg_mp9_b_suppressed.desc_id = 		"menu_silencer_radius_silent"
		self.parts.wpn_fps_smg_baka_b_longsupp.desc_id = 		"menu_silencer_radius_silent"
		self.parts.wpn_fps_smg_baka_b_midsupp.desc_id = 		"menu_silencer_radius_silent"
		self.parts.wpn_fps_smg_baka_b_smallsupp.desc_id = 		"menu_silencer_radius_silent"
		self.parts.wpn_fps_smg_sr2_ns_silencer.desc_id = 		"menu_silencer_radius_silent"
		self.parts.wpn_fps_upg_ns_ass_pbs1.desc_id = 			"menu_silencer_radius_silent"
		self.parts.wpn_fps_smg_p90_b_ninja.desc_id = 			"menu_silencer_radius_silent"
		self.parts.wpn_fps_smg_polymer_ns_silencer.desc_id = 	"menu_silencer_radius_silent"
		
		self.parts.wpn_fps_upg_ns_ass_smg_large.stats.alert_size = 10		--очень малый
		self.parts.wpn_fps_upg_ns_pis_medium.stats.alert_size = 10			--очень малый
		self.parts.wpn_fps_upg_ns_pis_medium_slim.stats.alert_size = 10		--очень малый
		self.parts.wpn_fps_m4_uupg_b_sd.stats.alert_size = 10				--очень малый
		self.parts.wpn_fps_smg_mp7_b_suppressed.stats.alert_size = 10		--очень малый
		self.parts.wpn_fps_snp_msr_ns_suppressor.stats.alert_size = 5		--очень малый
		self.parts.wpn_fps_upg_ns_pis_medium_gem.stats.alert_size = 10		--очень малый
		self.parts.wpn_fps_smg_sterling_b_suppressed.stats.alert_size = 9	--очень малый
		self.parts.wpn_fps_smg_schakal_ns_silencer.stats.alert_size = 10	--очень малый
		self.parts.wpn_fps_ass_asval_b_proto.stats.alert_size = 10			--очень малый
		self.parts.wpn_fps_upg_ns_ass_smg_large.desc_id = 		"menu_silencer_radius_very_small"
		self.parts.wpn_fps_upg_ns_pis_medium.desc_id = 			"menu_silencer_radius_very_small"
		self.parts.wpn_fps_upg_ns_pis_medium_slim.desc_id = 	"menu_silencer_radius_very_small"
		self.parts.wpn_fps_m4_uupg_b_sd.desc_id = 				"menu_silencer_radius_very_small"
		self.parts.wpn_fps_smg_mp7_b_suppressed.desc_id = 		"menu_silencer_radius_very_small"
		self.parts.wpn_fps_snp_msr_ns_suppressor.desc_id = 		"menu_silencer_radius_very_small"
		self.parts.wpn_fps_upg_ns_pis_medium_gem.desc_id = 		"menu_silencer_radius_very_small"
		self.parts.wpn_fps_smg_sterling_b_suppressed.desc_id = 	"menu_silencer_radius_very_small"
		self.parts.wpn_fps_smg_schakal_ns_silencer.desc_id = 	"menu_silencer_radius_very_small"
		self.parts.wpn_fps_ass_asval_b_proto.desc_id = 			"menu_silencer_radius_very_small"
		
		self.parts.wpn_fps_sho_striker_b_suppressed.stats.alert_size = 11	--малый
		self.parts.wpn_fps_upg_ns_pis_small.stats.alert_size = 9			--малый
		self.parts.wpn_fps_upg_ns_ass_smg_medium.stats.alert_size = 9		--малый
		self.parts.wpn_fps_smg_sterling_b_e11.stats.alert_size = 8			--малый
		self.parts.wpn_fps_smg_scorpion_b_suppressed.stats.alert_size = 9	--малый
		self.parts.wpn_fps_sho_striker_b_suppressed.desc_id = 	"menu_silencer_radius_small"
		self.parts.wpn_fps_upg_ns_pis_small.desc_id = 			"menu_silencer_radius_small"
		self.parts.wpn_fps_upg_ns_ass_smg_medium.desc_id = 		"menu_silencer_radius_small"
		self.parts.wpn_fps_smg_sterling_b_e11.desc_id = 		"menu_silencer_radius_small"
		self.parts.wpn_fps_smg_scorpion_b_suppressed.desc_id = 	"menu_silencer_radius_small"
		
		self.parts.wpn_fps_upg_ns_ass_smg_small.stats.alert_size = 8		--средний
		self.parts.wpn_fps_ass_famas_b_suppressed.stats.alert_size = 7		--средний
		self.parts.wpn_fps_smg_uzi_b_suppressed.stats.alert_size = 6		--средний
		self.parts.wpn_fps_ass_vhs_b_silenced.stats.alert_size = 6			--средний
		self.parts.wpn_fps_upg_ns_sho_salvo_large.stats.alert_size = 8		--средний
		self.parts.wpn_fps_upg_ns_ass_filter.stats.alert_size = 8			--средний
		self.parts.wpn_fps_sho_aa12_barrel_silenced.stats.alert_size = 8	--средний
		self.parts.wpn_fps_snp_winchester_b_suppressed.stats.alert_size = 8	--средний
		self.parts.wpn_fps_upg_ns_ass_smg_small.desc_id = 			"menu_silencer_radius_medium"
		self.parts.wpn_fps_ass_famas_b_suppressed.desc_id = 		"menu_silencer_radius_medium"
		self.parts.wpn_fps_smg_uzi_b_suppressed.desc_id = 			"menu_silencer_radius_medium"
		self.parts.wpn_fps_ass_vhs_b_silenced.desc_id = 			"menu_silencer_radius_medium"
		self.parts.wpn_fps_upg_ns_sho_salvo_large.desc_id = 		"menu_silencer_radius_medium"
		self.parts.wpn_fps_upg_ns_ass_filter.desc_id = 				"menu_silencer_radius_medium"
		self.parts.wpn_fps_sho_aa12_barrel_silenced.desc_id = 		"menu_silencer_radius_medium"
		self.parts.wpn_fps_snp_winchester_b_suppressed.desc_id = 	"menu_silencer_radius_medium"
		 
		self.parts.wpn_fps_snp_r93_b_suppressed.stats.alert_size = 5		--большой
		self.parts.wpn_fps_lmg_mg42_b_vg38.stats.alert_size = 5				--большой
		self.parts.wpn_fps_upg_ns_shot_thick.stats.alert_size = 7			--большой
		self.parts.wpn_fps_snp_wa2000_b_suppressed.stats.alert_size = 5		--большой
		self.parts.wpn_fps_snp_mosin_b_sniper.stats.alert_size = 5			--большой
		self.parts.wpn_fps_snp_tti_ns_hex.stats.alert_size = 5				--большой
		self.parts.wpn_fps_snp_siltstone_b_silenced.stats.alert_size = 5	--большой
		self.parts.wpn_fps_snp_r93_b_suppressed.desc_id = 		"menu_silencer_radius_high"
		self.parts.wpn_fps_lmg_mg42_b_vg38.desc_id = 			"menu_silencer_radius_high"
		self.parts.wpn_fps_upg_ns_shot_thick.desc_id = 			"menu_silencer_radius_high"
		self.parts.wpn_fps_snp_wa2000_b_suppressed.desc_id = 	"menu_silencer_radius_high"
		self.parts.wpn_fps_snp_mosin_b_sniper.desc_id = 		"menu_silencer_radius_high"
		self.parts.wpn_fps_snp_tti_ns_hex.desc_id = 			"menu_silencer_radius_high"
		self.parts.wpn_fps_snp_siltstone_b_silenced.desc_id = 	"menu_silencer_radius_high"
		
		self.parts.wpn_fps_snp_m95_barrel_suppressed.stats.alert_size = 4	--очень большой
		self.parts.wpn_fps_saw_body_silent.stats.alert_size = 7				--очень большой
		self.parts.wpn_fps_snp_m95_barrel_suppressed.desc_id = 	"menu_silencer_radius_very_high"
		self.parts.wpn_fps_saw_body_silent.desc_id = 			"menu_silencer_radius_very_high"
		
		self.parts.wpn_fps_smg_p90_b_ninja.stats.concealment = -5
		self.parts.wpn_fps_smg_p90_b_civilian.stats.concealment = -3

		self.parts.wpn_fps_upg_a_slug.custom_stats.ammo_pickup_min_mul = 0.5
		self.parts.wpn_fps_upg_a_slug.custom_stats.ammo_pickup_max_mul = 0.5
		self.wpn_fps_shot_serbu.override.wpn_fps_upg_a_slug.custom_stats.ammo_pickup_min_mul = 0.5
		self.wpn_fps_shot_serbu.override.wpn_fps_upg_a_slug.custom_stats.ammo_pickup_max_mul = 0.5
		self.wpn_fps_sho_striker.override.wpn_fps_upg_a_slug.custom_stats.ammo_pickup_min_mul = 0.5
		self.wpn_fps_sho_striker.override.wpn_fps_upg_a_slug.custom_stats.ammo_pickup_max_mul = 0.5
		self.parts.wpn_fps_upg_a_custom.custom_stats = {ammo_pickup_min_mul = 0.85, ammo_pickup_max_mul = 0.85}

		self.wpn_fps_shot_huntsman.override.wpn_fps_upg_a_explosive.custom_stats.ammo_pickup_min_mul = 0
		self.wpn_fps_shot_huntsman.override.wpn_fps_upg_a_explosive.custom_stats.ammo_pickup_max_mul = 0
		self.wpn_fps_sho_coach.override.wpn_fps_upg_a_explosive.custom_stats.ammo_pickup_min_mul = 0
		self.wpn_fps_sho_coach.override.wpn_fps_upg_a_explosive.custom_stats.ammo_pickup_max_mul = 0
		self.wpn_fps_pis_judge.override.wpn_fps_upg_a_explosive.custom_stats.ammo_pickup_min_mul = 0
		self.wpn_fps_pis_judge.override.wpn_fps_upg_a_explosive.custom_stats.ammo_pickup_max_mul = 0
		self.wpn_fps_pis_x_judge.override.wpn_fps_upg_a_explosive.custom_stats.ammo_pickup_min_mul = 0
		self.wpn_fps_pis_x_judge.override.wpn_fps_upg_a_explosive.custom_stats.ammo_pickup_max_mul = 0
		self.wpn_fps_shot_b682.override.wpn_fps_upg_a_explosive.custom_stats.ammo_pickup_min_mul = 0
		self.wpn_fps_shot_b682.override.wpn_fps_upg_a_explosive.custom_stats.ammo_pickup_max_mul = 0
		self.parts.wpn_fps_upg_a_explosive.custom_stats.ammo_pickup_min_mul = 0
		self.parts.wpn_fps_upg_a_explosive.custom_stats.ammo_pickup_max_mul = 0
		self.wpn_fps_pis_x_judge.override.wpn_fps_upg_a_piercing.custom_stats.ammo_pickup_min_mul = 0.5
		self.wpn_fps_pis_x_judge.override.wpn_fps_upg_a_piercing.custom_stats.ammo_pickup_max_mul = 0.5
		self.wpn_fps_pis_judge.override.wpn_fps_upg_a_piercing.custom_stats.ammo_pickup_min_mul = 0.5
		self.wpn_fps_pis_judge.override.wpn_fps_upg_a_piercing.custom_stats.ammo_pickup_max_mul = 0.5
		self.parts.wpn_fps_upg_a_piercing.custom_stats.ammo_pickup_min_mul = 0.5
		self.parts.wpn_fps_upg_a_piercing.custom_stats.ammo_pickup_max_mul = 0.5
		self.parts.wpn_fps_upg_a_dragons_breath.custom_stats.fire_dot_data.dot_damage = "1.5"
		self.parts.wpn_fps_upg_a_dragons_breath.custom_stats.fire_dot_data.dot_trigger_chance = "65"
		self.parts.wpn_fps_upg_a_dragons_breath.custom_stats.ammo_pickup_min_mul = 0
		self.parts.wpn_fps_upg_a_dragons_breath.custom_stats.ammo_pickup_max_mul = 0

		self.parts.wpn_fps_upg_ass_m4_b_beowulf.custom_stats.ammo_pickup_min_mul = 0.15
		self.parts.wpn_fps_upg_ass_m4_b_beowulf.custom_stats.ammo_pickup_max_mul = 0.15
		self.wpn_fps_ass_m16.override.wpn_fps_upg_ass_m4_b_beowulf.custom_stats.ammo_pickup_min_mul = 0.25
		self.wpn_fps_ass_m16.override.wpn_fps_upg_ass_m4_b_beowulf.custom_stats.ammo_pickup_max_mul = 0.25
		self.wpn_fps_ass_74.override.wpn_fps_upg_ass_ak_b_zastava.custom_stats.ammo_pickup_min_mul = 0.15
		self.wpn_fps_ass_74.override.wpn_fps_upg_ass_ak_b_zastava.custom_stats.ammo_pickup_max_mul = 0.15
		self.parts.wpn_fps_upg_ass_ak_b_zastava.custom_stats.ammo_pickup_min_mul = 0.65
		self.parts.wpn_fps_upg_ass_ak_b_zastava.custom_stats.ammo_pickup_max_mul = 0.65
		self.parts.wpn_fps_ass_g3_b_sniper.custom_stats = {ammo_pickup_min_mul = 0.75, ammo_pickup_max_mul = 0.75}
		
		self.parts.wpn_fps_ass_aug_m_quick.stats = {value = 2, reload = 3}
		self.parts.wpn_fps_m4_upg_m_quick.stats = {value = 2, reload = 3}
		self.parts.wpn_fps_upg_ak_m_quick.stats = {value = 2, reload = 3}
		self.parts.wpn_fps_ass_g36_m_quick.stats = {value = 2, reload = 3}
		self.parts.wpn_fps_smg_mac10_m_quick.stats = {value = 2, reload = 3}
		self.parts.wpn_fps_smg_sr2_m_quick.stats = {value = 2, reload = 3}
			
		self.wpn_fps_lmg_m249.uses_parts = {
			"wpn_fps_lmg_m249_b_long",
			"wpn_fps_lmg_m249_b_short",
			"wpn_fps_lmg_m249_body_standard",
			"wpn_fps_lmg_m249_fg_mk46",
			"wpn_fps_lmg_m249_fg_standard",
			"wpn_fps_lmg_m249_m_standard",
			"wpn_fps_lmg_m249_s_para",
			"wpn_fps_lmg_m249_s_solid",
			"wpn_fps_lmg_m249_upper_reciever",
			"wpn_fps_upg_m4_s_standard",
			"wpn_fps_upg_m4_s_pts",
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_bp_lmg_lionbipod",
			"wpn_fps_upg_fl_ass_smg_sho_peqbox",
			"wpn_fps_upg_fl_ass_smg_sho_surefire",
			"wpn_fps_upg_m4_s_crane",
			"wpn_fps_upg_m4_s_mk46",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_fl_ass_peq15",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_m4_s_ubr",
			"wpn_fps_upg_ass_ns_battle",
			"wpn_fps_upg_fl_ass_utg",
			"wpn_fps_snp_tti_s_vltor",
			"wpn_fps_upg_ns_ass_smg_v6"
		}
		self.wpn_fps_lmg_hk21.uses_parts = {
			"wpn_fps_lmg_hk21_b_short",
			"wpn_fps_lmg_hk21_b_long",
			"wpn_fps_lmg_hk21_body_lower",
			"wpn_fps_lmg_hk21_body_upper",
			"wpn_fps_lmg_hk21_fg_short",
			"wpn_fps_lmg_hk21_fg_long",
			"wpn_fps_lmg_hk21_g_standard",
			"wpn_fps_lmg_hk21_g_ergo",
			"wpn_fps_lmg_hk21_m_standard",
			"wpn_fps_lmg_hk21_s_standard",
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_bp_lmg_lionbipod",
			"wpn_fps_upg_fl_ass_smg_sho_peqbox",
			"wpn_fps_upg_fl_ass_smg_sho_surefire",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_fl_ass_peq15",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_ass_ns_battle",
			"wpn_fps_upg_fl_ass_utg",
			"wpn_fps_upg_ns_ass_smg_v6"
		}
		self.wpn_fps_lmg_rpk.uses_parts = {
			"wpn_fps_lmg_rpk_b_standard",
			"wpn_fps_lmg_rpk_fg_standard",
			"wpn_fps_lmg_rpk_fg_wood",
			"wpn_lmg_rpk_m_drum",
			"wpn_fps_lmg_rpk_s_standard",
			"wpn_fps_lmg_rpk_s_wood",
			"wpn_fps_ass_74_body_upperreceiver",
			"wpn_fps_lmg_rpk_body_lowerreceiver",
			"wpn_upg_ak_g_standard",
			"wpn_fps_upg_ak_g_hgrip",
			"wpn_fps_upg_ak_g_pgrip",
			"wpn_fps_upg_ak_g_wgrip",
			"wpn_fps_upg_m4_s_standard",
			"wpn_fps_upg_m4_s_pts",
			"wpn_upg_ak_s_folding",
			"wpn_upg_ak_s_skfoldable_vanilla",
			"wpn_fps_upg_fl_ass_smg_sho_peqbox",
			"wpn_fps_upg_fl_ass_smg_sho_surefire",
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_bp_lmg_lionbipod",
			"wpn_fps_upg_vg_ass_smg_verticalgrip",
			"wpn_fps_upg_m4_s_crane",
			"wpn_fps_upg_m4_s_mk46",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_fl_ass_peq15",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_m4_s_ubr",
			"wpn_fps_upg_ak_g_rk3",
			"wpn_fps_upg_ak_s_solidstock",
			"wpn_fps_upg_ass_ns_battle",
			"wpn_fps_upg_fl_ass_utg",
			"wpn_fps_snp_tti_s_vltor",
			"wpn_fps_upg_ns_ass_smg_v6"
		}
		self.wpn_fps_lmg_mg42.uses_parts = {
			"wpn_fps_lmg_mg42_b_mg42",
			"wpn_fps_lmg_mg42_b_mg34",
			"wpn_fps_lmg_mg42_b_vg38",
			"wpn_fps_lmg_mg42_reciever",
			"wpn_fps_lmg_mg42_n42",
			"wpn_fps_lmg_mg42_n34",
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_bp_lmg_lionbipod",
			"wpn_fps_upg_fl_ass_smg_sho_peqbox",
			"wpn_fps_upg_fl_ass_smg_sho_surefire",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_fl_ass_peq15",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_ass_ns_battle",
			"wpn_fps_upg_fl_ass_utg",
			"wpn_fps_upg_ns_ass_smg_v6"
		}
		self.wpn_fps_lmg_par.uses_parts = {
			"wpn_fps_lmg_par_b_short",
			"wpn_fps_lmg_par_b_standard",
			"wpn_fps_lmg_par_body_standard",
			"wpn_fps_lmg_par_m_standard",
			"wpn_fps_lmg_par_s_standard",
			"wpn_fps_lmg_par_s_plastic",
			"wpn_fps_lmg_par_upper_reciever",
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_bp_lmg_lionbipod",
			"wpn_fps_upg_fl_ass_smg_sho_peqbox",
			"wpn_fps_upg_fl_ass_smg_sho_surefire",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_fl_ass_peq15",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_ass_ns_battle",
			"wpn_fps_upg_fl_ass_utg",
			"wpn_fps_lmg_svinet_b_standard",
			"wpn_fps_lmg_svinet_s_legend",
			"wpn_fps_upg_ns_ass_smg_v6"
		}

		self.parts.wpn_fps_pis_beretta_body_modern.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_pis_deagle_b_modern.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_pis_deagle_extra.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_pis_judge_body_modern.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_pis_rage_extra.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_smg_mac10_body_modern.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_smg_p90_body_boxy.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_ak_b_draco.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_ak_fg_tapco.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_ak_g_hgrip.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_ak_g_pgrip.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_ak_g_wgrip.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_ak_m_quad.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_ass_ns_jprifles.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_ass_ns_linear.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_ass_ns_surefire.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_fg_jp.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_fg_midwest.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_fg_smr.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_fl_ass_laser.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_fl_ass_peq15.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_m4_m_quad.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_m4_s_crane.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_m4_s_mk46.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_ns_pis_medium_slim.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_o_cs.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_o_eotech_xps.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_o_reflex.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_o_rmr.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_o_rx01.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_o_rx30.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_pis_ns_flash.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_shot_ns_king.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_ass_asval_b_proto.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_ass_asval_s_solid.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_ass_aug_m_quick.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_ass_fal_fg_01.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_ass_fal_fg_03.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_ass_fal_fg_04.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_ass_fal_fg_wood.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_ass_fal_g_01.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_ass_fal_m_01.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_ass_fal_s_01.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_ass_fal_s_03.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_ass_fal_s_wood.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_ass_famas_b_long.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_ass_famas_b_short.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_ass_famas_b_sniper.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_ass_famas_b_suppressed.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_ass_famas_g_retro.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_ass_g3_b_short.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_ass_g3_b_sniper.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_ass_g3_fg_psg.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_ass_g3_fg_retro.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_ass_g3_fg_retro_plastic.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_ass_g3_g_retro.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_ass_g3_g_sniper.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_ass_g3_s_sniper.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_ass_g3_s_wood.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_ass_g36_m_quick.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_ass_g36_o_vintage.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_ass_galil_fg_fab.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_ass_galil_fg_mar.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_ass_galil_fg_sar.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_ass_galil_fg_sniper.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_ass_galil_g_sniper.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_ass_galil_s_fab.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_ass_galil_s_light.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_ass_galil_s_plastic.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_ass_galil_s_skeletal.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_ass_galil_s_sniper.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_ass_galil_s_wood.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_ass_sub2000_fg_gen2.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_ass_sub2000_fg_railed.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_ass_sub2000_fg_suppressed.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_bow_ecp_m_arrows_explosive.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_bow_ecp_m_arrows_poison.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_bow_elastic_m_explosive.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_bow_elastic_m_poison.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_gre_arbiter_b_comp.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_gre_arbiter_b_long.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_gre_m32_no_stock.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_gre_m79_barrel_short.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_gre_m79_stock_short.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_lmg_mg42_b_mg34.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_lmg_mg42_b_vg38.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_m4_upg_m_quick.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_pis_1911_m_big.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_pis_c96_b_long.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_pis_c96_m_extended.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_pis_c96_nozzle.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_pis_c96_s_solid.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_pis_c96_sight.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_pis_packrat_m_extended.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_pis_packrat_ns_wick.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_pis_packrat_o_expert.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_pis_usp_m_big.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_sho_ben_b_long.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_sho_ben_b_short.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_sho_ben_s_collapsed.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_sho_ben_s_solid.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_sho_ksg_b_long.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_sho_ksg_b_short.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_sho_saiga_b_short.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_sho_saiga_fg_holy.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_sho_striker_b_long.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_sho_striker_b_suppressed.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_smg_cobray_body_upper_jacket.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_smg_mac10_m_quick.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_smg_mp5_fg_flash.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_smg_mp5_s_folding.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_smg_p90_m_strap.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_smg_schakal_b_civil.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_smg_schakal_m_long.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_smg_schakal_m_short.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_smg_schakal_ns_silencer.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_smg_schakal_s_civil.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_smg_schakal_s_folded.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_smg_schakal_vg_surefire.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_smg_scorpion_b_suppressed.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_smg_scorpion_g_ergo.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_smg_scorpion_g_wood.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_smg_scorpion_m_extended.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_smg_scorpion_s_nostock.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_smg_scorpion_s_unfolded.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_smg_sr2_m_quick.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_smg_sterling_b_e11.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_smg_sterling_b_long.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_smg_sterling_b_short.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_smg_sterling_b_suppressed.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_smg_sterling_m_long.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_smg_sterling_m_short.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_smg_sterling_s_folded.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_smg_sterling_s_nostock.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_smg_sterling_s_solid.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_smg_tec9_b_standard.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_smg_tec9_m_extended.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_smg_tec9_ns_ext.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_smg_tec9_s_unfolded.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_smg_uzi_b_suppressed.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_smg_uzi_fg_rail.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_smg_uzi_s_leather.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_smg_uzi_s_solid.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_smg_uzi_s_standard.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_snp_desertfox_b_long.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_snp_desertfox_b_silencer.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_snp_m95_barrel_long.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_snp_m95_barrel_short.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_snp_m95_barrel_suppressed.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_snp_model70_iron_sight.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_snp_mosin_b_short.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_snp_mosin_b_sniper.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_snp_mosin_b_standard.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_snp_mosin_body_black.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_snp_mosin_ns_bayonet.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_snp_msr_b_long.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_snp_msr_body_msr.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_snp_msr_ns_suppressor.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_a_bow_explosion.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_a_bow_poison.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_a_custom.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_a_dragons_breath.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_a_explosive.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_a_grenade_launcher_incendiary.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_a_grenade_launcher_incendiary_arbiter.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_a_piercing.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_a_slug.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_ak_b_ak105.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_ak_fg_krebs.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_ak_fg_trax.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_ak_fg_zenit.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_ak_g_rk3.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_ak_m_quick.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_ak_m_uspalm.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_ak_s_solidstock.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_ass_ak_b_zastava.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_ass_m4_b_beowulf.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_ass_m4_fg_lvoa.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_ass_m4_fg_moe.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_ass_m4_lower_reciever_core.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_ass_m4_upper_reciever_ballos.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_ass_m4_upper_reciever_core.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_ass_m16_fg_stag.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_g36_fg_long.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_m4_m_l5.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_m4_s_ubr.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_ns_ass_pbs1.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_ns_duck.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_o_45iron.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_o_45rds.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_o_ak_scopemount.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_o_box.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_o_leupold.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_o_mbus_rear.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_o_spot.pcs = {10, 20, 30, 40}
		self.parts.wpn_fps_upg_smg_olympic_fg_lr300.pcs = {10, 20, 30, 40}
		
		self.parts.wpn_fps_pis_beretta_body_modern.stats.value = 6
		self.parts.wpn_fps_pis_deagle_b_modern.stats.value = 6
		self.parts.wpn_fps_pis_deagle_extra.stats.value = 6
		self.parts.wpn_fps_pis_judge_body_modern.stats.value = 6
		self.parts.wpn_fps_pis_rage_extra.stats.value = 6
		self.parts.wpn_fps_smg_mac10_body_modern.stats.value = 6
		self.parts.wpn_fps_smg_p90_body_boxy.stats.value = 6
		self.parts.wpn_fps_upg_ak_b_draco.stats.value = 6
		self.parts.wpn_fps_upg_ak_fg_tapco.stats.value = 6
		self.parts.wpn_fps_upg_ak_g_hgrip.stats.value = 6
		self.parts.wpn_fps_upg_ak_g_pgrip.stats.value = 6
		self.parts.wpn_fps_upg_ak_g_wgrip.stats.value = 6
		self.parts.wpn_fps_upg_ak_m_quad.stats.value = 6
		self.parts.wpn_fps_upg_ass_ns_jprifles.stats.value = 6
		self.parts.wpn_fps_upg_ass_ns_linear.stats.value = 6
		self.parts.wpn_fps_upg_ass_ns_surefire.stats.value = 6
		self.parts.wpn_fps_upg_fg_jp.stats.value = 6
		self.parts.wpn_fps_upg_fg_midwest.stats.value = 6
		self.parts.wpn_fps_upg_fg_smr.stats.value = 6
		self.parts.wpn_fps_upg_fl_ass_laser.stats.value = 6
		self.parts.wpn_fps_upg_fl_ass_peq15.stats.value = 6
		self.parts.wpn_fps_upg_m4_m_quad.stats.value = 6
		self.parts.wpn_fps_upg_m4_s_crane.stats.value = 6
		self.parts.wpn_fps_upg_m4_s_mk46.stats.value = 6
		self.parts.wpn_fps_upg_ns_pis_medium_slim.stats.value = 6
		self.parts.wpn_fps_upg_o_cs.stats.value = 6
		self.parts.wpn_fps_upg_o_eotech_xps.stats.value = 6
		self.parts.wpn_fps_upg_o_reflex.stats.value = 6
		self.parts.wpn_fps_upg_o_rmr.stats.value = 6
		self.parts.wpn_fps_upg_o_rx01.stats.value = 6
		self.parts.wpn_fps_upg_pis_ns_flash.stats.value = 6
		self.parts.wpn_fps_upg_shot_ns_king.stats.value = 6
		self.parts.wpn_fps_ass_asval_b_proto.stats.value = 7
		self.parts.wpn_fps_ass_asval_s_solid.stats.value = 7
		self.parts.wpn_fps_ass_aug_m_quick.stats.value = 7
		self.parts.wpn_fps_ass_fal_fg_01.stats.value = 7
		self.parts.wpn_fps_ass_fal_fg_03.stats.value = 7
		self.parts.wpn_fps_ass_fal_fg_04.stats.value = 7
		self.parts.wpn_fps_ass_fal_fg_wood.stats.value = 7
		self.parts.wpn_fps_ass_fal_g_01.stats.value = 7
		self.parts.wpn_fps_ass_fal_m_01.stats.value = 7
		self.parts.wpn_fps_ass_fal_s_01.stats.value = 7
		self.parts.wpn_fps_ass_fal_s_03.stats.value = 7
		self.parts.wpn_fps_ass_fal_s_wood.stats.value = 7
		self.parts.wpn_fps_ass_famas_b_long.stats.value = 7
		self.parts.wpn_fps_ass_famas_b_short.stats.value = 7
		self.parts.wpn_fps_ass_famas_b_sniper.stats.value = 7
		self.parts.wpn_fps_ass_famas_b_suppressed.stats.value = 7
		self.parts.wpn_fps_ass_famas_g_retro.stats.value = 7
		self.parts.wpn_fps_ass_g3_b_short.stats.value = 7
		self.parts.wpn_fps_ass_g3_b_sniper.stats.value = 7
		self.parts.wpn_fps_ass_g3_fg_psg.stats.value = 7
		self.parts.wpn_fps_ass_g3_fg_retro.stats.value = 7
		self.parts.wpn_fps_ass_g3_fg_retro_plastic.stats.value = 7
		self.parts.wpn_fps_ass_g3_g_retro.stats.value = 7
		self.parts.wpn_fps_ass_g3_g_sniper.stats.value = 7
		self.parts.wpn_fps_ass_g3_s_sniper.stats.value = 7
		self.parts.wpn_fps_ass_g3_s_wood.stats.value = 7
		self.parts.wpn_fps_ass_g36_m_quick.stats.value = 7
		self.parts.wpn_fps_ass_g36_o_vintage.stats.value = 7
		self.parts.wpn_fps_ass_galil_fg_fab.stats.value = 7
		self.parts.wpn_fps_ass_galil_fg_mar.stats.value = 7
		self.parts.wpn_fps_ass_galil_fg_sar.stats.value = 7
		self.parts.wpn_fps_ass_galil_fg_sniper.stats.value = 7
		self.parts.wpn_fps_ass_galil_g_sniper.stats.value = 7
		self.parts.wpn_fps_ass_galil_s_fab.stats.value = 7
		self.parts.wpn_fps_ass_galil_s_light.stats.value = 7
		self.parts.wpn_fps_ass_galil_s_plastic.stats.value = 7
		self.parts.wpn_fps_ass_galil_s_skeletal.stats.value = 7
		self.parts.wpn_fps_ass_galil_s_sniper.stats.value = 7
		self.parts.wpn_fps_ass_galil_s_wood.stats.value = 7
		self.parts.wpn_fps_ass_sub2000_fg_gen2.stats.value = 7
		self.parts.wpn_fps_ass_sub2000_fg_railed.stats.value = 7
		self.parts.wpn_fps_ass_sub2000_fg_suppressed.stats.value = 7
		self.parts.wpn_fps_bow_ecp_m_arrows_explosive.stats.value = 7
		self.parts.wpn_fps_bow_ecp_m_arrows_poison.stats.value = 7
		self.parts.wpn_fps_bow_elastic_m_explosive.stats.value = 7
		self.parts.wpn_fps_bow_elastic_m_poison.stats.value = 7
		self.parts.wpn_fps_gre_arbiter_b_comp.stats.value = 7
		self.parts.wpn_fps_gre_arbiter_b_long.stats.value = 7
		self.parts.wpn_fps_gre_m32_no_stock.stats.value = 7
		self.parts.wpn_fps_gre_m79_barrel_short.stats.value = 7
		self.parts.wpn_fps_gre_m79_stock_short.stats.value = 7
		self.parts.wpn_fps_lmg_mg42_b_mg34.stats.value = 7
		self.parts.wpn_fps_lmg_mg42_b_vg38.stats.value = 7
		self.parts.wpn_fps_m4_upg_m_quick.stats.value = 7
		self.parts.wpn_fps_pis_1911_m_big.stats.value = 7
		self.parts.wpn_fps_pis_c96_b_long.stats.value = 7
		self.parts.wpn_fps_pis_c96_m_extended.stats.value = 7
		self.parts.wpn_fps_pis_c96_nozzle.stats.value = 7
		self.parts.wpn_fps_pis_c96_s_solid.stats.value = 7
		self.parts.wpn_fps_pis_c96_sight.stats.value = 7
		self.parts.wpn_fps_pis_packrat_m_extended.stats.value = 7
		self.parts.wpn_fps_pis_packrat_ns_wick.stats.value = 7
		self.parts.wpn_fps_pis_packrat_o_expert.stats.value = 7
		self.parts.wpn_fps_pis_usp_m_big.stats.value = 7
		self.parts.wpn_fps_sho_ben_b_long.stats.value = 7
		self.parts.wpn_fps_sho_ben_b_short.stats.value = 7
		self.parts.wpn_fps_sho_ben_s_collapsed.stats.value = 7
		self.parts.wpn_fps_sho_ben_s_solid.stats.value = 7
		self.parts.wpn_fps_sho_ksg_b_long.stats.value = 7
		self.parts.wpn_fps_sho_ksg_b_short.stats.value = 7
		self.parts.wpn_fps_sho_saiga_b_short.stats.value = 7
		self.parts.wpn_fps_sho_saiga_fg_holy.stats.value = 7
		self.parts.wpn_fps_sho_striker_b_long.stats.value = 7
		self.parts.wpn_fps_sho_striker_b_suppressed.stats.value = 7
		self.parts.wpn_fps_smg_cobray_body_upper_jacket.stats.value = 7
		self.parts.wpn_fps_smg_mac10_m_quick.stats.value = 7
		self.parts.wpn_fps_smg_mp5_fg_flash.stats.value = 7
		self.parts.wpn_fps_smg_mp5_s_folding.stats.value = 7
		self.parts.wpn_fps_smg_p90_m_strap.stats.value = 7
		self.parts.wpn_fps_smg_schakal_b_civil.stats.value = 7
		self.parts.wpn_fps_smg_schakal_m_long.stats.value = 7
		self.parts.wpn_fps_smg_schakal_m_short.stats.value = 7
		self.parts.wpn_fps_smg_schakal_ns_silencer.stats.value = 7
		self.parts.wpn_fps_smg_schakal_s_civil.stats.value = 7
		self.parts.wpn_fps_smg_schakal_s_folded.stats.value = 7
		self.parts.wpn_fps_smg_schakal_vg_surefire.stats.value = 7
		self.parts.wpn_fps_smg_scorpion_b_suppressed.stats.value = 7
		self.parts.wpn_fps_smg_scorpion_g_ergo.stats.value = 7
		self.parts.wpn_fps_smg_scorpion_g_wood.stats.value = 7
		self.parts.wpn_fps_smg_scorpion_m_extended.stats.value = 7
		self.parts.wpn_fps_smg_scorpion_s_nostock.stats.value = 7
		self.parts.wpn_fps_smg_scorpion_s_unfolded.stats.value = 7
		self.parts.wpn_fps_smg_sr2_m_quick.stats.value = 7
		self.parts.wpn_fps_smg_sterling_b_e11.stats.value = 7
		self.parts.wpn_fps_smg_sterling_b_long.stats.value = 7
		self.parts.wpn_fps_smg_sterling_b_short.stats.value = 7
		self.parts.wpn_fps_smg_sterling_b_suppressed.stats.value = 7
		self.parts.wpn_fps_smg_sterling_m_long.stats.value = 7
		self.parts.wpn_fps_smg_sterling_m_short.stats.value = 7
		self.parts.wpn_fps_smg_sterling_s_folded.stats.value = 7
		self.parts.wpn_fps_smg_sterling_s_nostock.stats.value = 7
		self.parts.wpn_fps_smg_sterling_s_solid.stats.value = 7
		self.parts.wpn_fps_smg_tec9_b_standard.stats.value = 7
		self.parts.wpn_fps_smg_tec9_m_extended.stats.value = 7
		self.parts.wpn_fps_smg_tec9_ns_ext.stats.value = 7
		self.parts.wpn_fps_smg_tec9_s_unfolded.stats.value = 7
		self.parts.wpn_fps_smg_uzi_b_suppressed.stats.value = 7
		self.parts.wpn_fps_smg_uzi_fg_rail.stats.value = 7
		self.parts.wpn_fps_smg_uzi_s_leather.stats.value = 7
		self.parts.wpn_fps_smg_uzi_s_solid.stats.value = 7
		self.parts.wpn_fps_smg_uzi_s_standard.stats.value = 7
		self.parts.wpn_fps_snp_desertfox_b_long.stats.value = 7
		self.parts.wpn_fps_snp_desertfox_b_silencer.stats.value = 7
		self.parts.wpn_fps_snp_m95_barrel_long.stats.value = 7
		self.parts.wpn_fps_snp_m95_barrel_short.stats.value = 7
		self.parts.wpn_fps_snp_m95_barrel_suppressed.stats.value = 7
		self.parts.wpn_fps_snp_model70_iron_sight.stats.value = 7
		self.parts.wpn_fps_snp_mosin_b_short.stats.value = 7
		self.parts.wpn_fps_snp_mosin_b_sniper.stats.value = 7
		self.parts.wpn_fps_snp_mosin_b_standard.stats.value = 7
		self.parts.wpn_fps_snp_mosin_body_black.stats.value = 7
		self.parts.wpn_fps_snp_mosin_ns_bayonet.stats.value = 7
		self.parts.wpn_fps_snp_msr_b_long.stats.value = 7
		self.parts.wpn_fps_snp_msr_body_msr.stats.value = 7
		self.parts.wpn_fps_snp_msr_ns_suppressor.stats.value = 7
		self.parts.wpn_fps_upg_a_bow_explosion.stats.value = 7
		self.parts.wpn_fps_upg_a_bow_poison.stats.value = 7
		self.parts.wpn_fps_upg_a_custom.stats.value = 7
		self.parts.wpn_fps_upg_a_dragons_breath.stats.value = 7
		self.parts.wpn_fps_upg_a_explosive.stats.value = 7
		self.parts.wpn_fps_upg_a_grenade_launcher_incendiary.stats.value = 7
		self.parts.wpn_fps_upg_a_grenade_launcher_incendiary_arbiter.stats.value = 7
		self.parts.wpn_fps_upg_a_piercing.stats.value = 7
		self.parts.wpn_fps_upg_a_slug.stats.value = 7
		self.parts.wpn_fps_upg_ak_b_ak105.stats.value = 7
		self.parts.wpn_fps_upg_ak_fg_krebs.stats.value = 7
		self.parts.wpn_fps_upg_ak_fg_trax.stats.value = 7
		self.parts.wpn_fps_upg_ak_fg_zenit.stats.value = 7
		self.parts.wpn_fps_upg_ak_g_rk3.stats.value = 7
		self.parts.wpn_fps_upg_ak_m_quick.stats.value = 7
		self.parts.wpn_fps_upg_ak_m_uspalm.stats.value = 7
		self.parts.wpn_fps_upg_ak_s_solidstock.stats.value = 7
		self.parts.wpn_fps_upg_ass_ak_b_zastava.stats.value = 7
		self.parts.wpn_fps_upg_ass_m4_b_beowulf.stats.value = 7
		self.parts.wpn_fps_upg_ass_m4_fg_lvoa.stats.value = 7
		self.parts.wpn_fps_upg_ass_m4_fg_moe.stats.value = 7
		self.parts.wpn_fps_upg_ass_m4_lower_reciever_core.stats.value = 7
		self.parts.wpn_fps_upg_ass_m4_upper_reciever_ballos.stats.value = 7
		self.parts.wpn_fps_upg_ass_m4_upper_reciever_core.stats.value = 7
		self.parts.wpn_fps_upg_ass_m16_fg_stag.stats.value = 7
		self.parts.wpn_fps_upg_g36_fg_long.stats.value = 7
		self.parts.wpn_fps_upg_m4_m_l5.stats.value = 7
		self.parts.wpn_fps_upg_m4_s_ubr.stats.value = 7
		self.parts.wpn_fps_upg_ns_ass_pbs1.stats.value = 7
		self.parts.wpn_fps_upg_ns_duck.stats.value = 7
		self.parts.wpn_fps_upg_o_45iron.stats.value = 7
		self.parts.wpn_fps_upg_o_45rds.stats.value = 7
		self.parts.wpn_fps_upg_o_ak_scopemount.stats.value = 7
		self.parts.wpn_fps_upg_o_box.stats.value = 7
		self.parts.wpn_fps_upg_o_leupold.stats.value = 7
		self.parts.wpn_fps_upg_o_mbus_rear.stats.value = 7
		self.parts.wpn_fps_upg_o_spot.stats.value = 7
		self.parts.wpn_fps_upg_smg_olympic_fg_lr300.stats.value = 7
		
		self.parts.wpn_fps_ass_asval_b_proto.is_a_unlockable = false
		self.parts.wpn_fps_ass_asval_s_solid.is_a_unlockable = false
		self.parts.wpn_fps_ass_aug_m_quick.is_a_unlockable = false
		self.parts.wpn_fps_ass_fal_fg_01.is_a_unlockable = false
		self.parts.wpn_fps_ass_fal_fg_03.is_a_unlockable = false
		self.parts.wpn_fps_ass_fal_fg_04.is_a_unlockable = false
		self.parts.wpn_fps_ass_fal_fg_wood.is_a_unlockable = false
		self.parts.wpn_fps_ass_fal_g_01.is_a_unlockable = false
		self.parts.wpn_fps_ass_fal_m_01.is_a_unlockable = false
		self.parts.wpn_fps_ass_fal_s_01.is_a_unlockable = false
		self.parts.wpn_fps_ass_fal_s_03.is_a_unlockable = false
		self.parts.wpn_fps_ass_fal_s_wood.is_a_unlockable = false
		self.parts.wpn_fps_ass_famas_b_long.is_a_unlockable = false
		self.parts.wpn_fps_ass_famas_b_short.is_a_unlockable = false
		self.parts.wpn_fps_ass_famas_b_sniper.is_a_unlockable = false
		self.parts.wpn_fps_ass_famas_b_suppressed.is_a_unlockable = false
		self.parts.wpn_fps_ass_famas_body_standard.is_a_unlockable = false
		self.parts.wpn_fps_ass_famas_g_retro.is_a_unlockable = false
		self.parts.wpn_fps_ass_g3_b_short.is_a_unlockable = false
		self.parts.wpn_fps_ass_g3_b_sniper.is_a_unlockable = false
		self.parts.wpn_fps_ass_g3_fg_psg.is_a_unlockable = false
		self.parts.wpn_fps_ass_g3_fg_retro.is_a_unlockable = false
		self.parts.wpn_fps_ass_g3_fg_retro_plastic.is_a_unlockable = false
		self.parts.wpn_fps_ass_g3_g_retro.is_a_unlockable = false
		self.parts.wpn_fps_ass_g3_g_sniper.is_a_unlockable = false
		self.parts.wpn_fps_ass_g3_s_sniper.is_a_unlockable = false
		self.parts.wpn_fps_ass_g3_s_wood.is_a_unlockable = false
		self.parts.wpn_fps_ass_g36_m_quick.is_a_unlockable = false
		self.parts.wpn_fps_ass_g36_o_vintage.is_a_unlockable = false
		self.parts.wpn_fps_ass_galil_fg_fab.is_a_unlockable = false
		self.parts.wpn_fps_ass_galil_fg_mar.is_a_unlockable = false
		self.parts.wpn_fps_ass_galil_fg_sar.is_a_unlockable = false
		self.parts.wpn_fps_ass_galil_fg_sniper.is_a_unlockable = false
		self.parts.wpn_fps_ass_galil_g_sniper.is_a_unlockable = false
		self.parts.wpn_fps_ass_galil_s_fab.is_a_unlockable = false
		self.parts.wpn_fps_ass_galil_s_light.is_a_unlockable = false
		self.parts.wpn_fps_ass_galil_s_plastic.is_a_unlockable = false
		self.parts.wpn_fps_ass_galil_s_skeletal.is_a_unlockable = false
		self.parts.wpn_fps_ass_galil_s_sniper.is_a_unlockable = false
		self.parts.wpn_fps_ass_galil_s_wood.is_a_unlockable = false
		self.parts.wpn_fps_ass_sub2000_fg_gen2.is_a_unlockable = false
		self.parts.wpn_fps_ass_sub2000_fg_railed.is_a_unlockable = false
		self.parts.wpn_fps_ass_sub2000_fg_suppressed.is_a_unlockable = false
		self.parts.wpn_fps_bow_ecp_m_arrows_explosive.is_a_unlockable = false
		self.parts.wpn_fps_bow_ecp_m_arrows_poison.is_a_unlockable = false
		self.parts.wpn_fps_bow_elastic_m_explosive.is_a_unlockable = false
		self.parts.wpn_fps_bow_elastic_m_poison.is_a_unlockable = false
		self.parts.wpn_fps_gre_arbiter_b_comp.is_a_unlockable = false
		self.parts.wpn_fps_gre_arbiter_b_long.is_a_unlockable = false
		self.parts.wpn_fps_gre_m32_no_stock.is_a_unlockable = false
		self.parts.wpn_fps_gre_m79_barrel_short.is_a_unlockable = false
		self.parts.wpn_fps_gre_m79_stock_short.is_a_unlockable = false
		self.parts.wpn_fps_lmg_mg42_b_mg34.is_a_unlockable = false
		self.parts.wpn_fps_lmg_mg42_b_vg38.is_a_unlockable = false
		self.parts.wpn_fps_m4_upg_m_quick.is_a_unlockable = false
		self.parts.wpn_fps_pis_1911_m_big.is_a_unlockable = false
		self.parts.wpn_fps_pis_c96_b_long.is_a_unlockable = false
		self.parts.wpn_fps_pis_c96_m_extended.is_a_unlockable = false
		self.parts.wpn_fps_pis_c96_nozzle.is_a_unlockable = false
		self.parts.wpn_fps_pis_c96_s_solid.is_a_unlockable = false
		self.parts.wpn_fps_pis_c96_sight.is_a_unlockable = false
		self.parts.wpn_fps_pis_packrat_m_extended.is_a_unlockable = false
		self.parts.wpn_fps_pis_packrat_ns_wick.is_a_unlockable = false
		self.parts.wpn_fps_pis_packrat_o_expert.is_a_unlockable = false
		self.parts.wpn_fps_pis_usp_m_big.is_a_unlockable = false
		self.parts.wpn_fps_sho_ben_b_long.is_a_unlockable = false
		self.parts.wpn_fps_sho_ben_b_short.is_a_unlockable = false
		self.parts.wpn_fps_sho_ben_s_collapsed.is_a_unlockable = false
		self.parts.wpn_fps_sho_ben_s_solid.is_a_unlockable = false
		self.parts.wpn_fps_sho_ksg_b_long.is_a_unlockable = false
		self.parts.wpn_fps_sho_ksg_b_short.is_a_unlockable = false
		self.parts.wpn_fps_sho_saiga_b_short.is_a_unlockable = false
		self.parts.wpn_fps_sho_saiga_fg_holy.is_a_unlockable = false
		self.parts.wpn_fps_sho_striker_b_long.is_a_unlockable = false
		self.parts.wpn_fps_sho_striker_b_suppressed.is_a_unlockable = false
		self.parts.wpn_fps_smg_cobray_body_upper_jacket.is_a_unlockable = false
		self.parts.wpn_fps_smg_mac10_m_quick.is_a_unlockable = false
		self.parts.wpn_fps_smg_mp5_fg_flash.is_a_unlockable = false
		self.parts.wpn_fps_smg_mp5_s_folding.is_a_unlockable = false
		self.parts.wpn_fps_smg_p90_m_strap.is_a_unlockable = false
		self.parts.wpn_fps_smg_schakal_b_civil.is_a_unlockable = false
		self.parts.wpn_fps_smg_schakal_m_long.is_a_unlockable = false
		self.parts.wpn_fps_smg_schakal_m_short.is_a_unlockable = false
		self.parts.wpn_fps_smg_schakal_ns_silencer.is_a_unlockable = false
		self.parts.wpn_fps_smg_schakal_s_civil.is_a_unlockable = false
		self.parts.wpn_fps_smg_schakal_s_folded.is_a_unlockable = false
		self.parts.wpn_fps_smg_schakal_vg_surefire.is_a_unlockable = false
		self.parts.wpn_fps_smg_scorpion_b_suppressed.is_a_unlockable = false
		self.parts.wpn_fps_smg_scorpion_g_ergo.is_a_unlockable = false
		self.parts.wpn_fps_smg_scorpion_g_wood.is_a_unlockable = false
		self.parts.wpn_fps_smg_scorpion_m_extended.is_a_unlockable = false
		self.parts.wpn_fps_smg_scorpion_s_nostock.is_a_unlockable = false
		self.parts.wpn_fps_smg_scorpion_s_unfolded.is_a_unlockable = false
		self.parts.wpn_fps_smg_sr2_m_quick.is_a_unlockable = false
		self.parts.wpn_fps_smg_sterling_b_e11.is_a_unlockable = false
		self.parts.wpn_fps_smg_sterling_b_long.is_a_unlockable = false
		self.parts.wpn_fps_smg_sterling_b_short.is_a_unlockable = false
		self.parts.wpn_fps_smg_sterling_b_suppressed.is_a_unlockable = false
		self.parts.wpn_fps_smg_sterling_m_long.is_a_unlockable = false
		self.parts.wpn_fps_smg_sterling_m_short.is_a_unlockable = false
		self.parts.wpn_fps_smg_sterling_s_folded.is_a_unlockable = false
		self.parts.wpn_fps_smg_sterling_s_nostock.is_a_unlockable = false
		self.parts.wpn_fps_smg_sterling_s_solid.is_a_unlockable = false
		self.parts.wpn_fps_smg_tec9_b_standard.is_a_unlockable = false
		self.parts.wpn_fps_smg_tec9_m_extended.is_a_unlockable = false
		self.parts.wpn_fps_smg_tec9_ns_ext.is_a_unlockable = false
		self.parts.wpn_fps_smg_tec9_s_unfolded.is_a_unlockable = false
		self.parts.wpn_fps_smg_uzi_b_suppressed.is_a_unlockable = false
		self.parts.wpn_fps_smg_uzi_fg_rail.is_a_unlockable = false
		self.parts.wpn_fps_smg_uzi_s_leather.is_a_unlockable = false
		self.parts.wpn_fps_smg_uzi_s_solid.is_a_unlockable = false
		self.parts.wpn_fps_smg_uzi_s_standard.is_a_unlockable = false
		self.parts.wpn_fps_snp_desertfox_b_long.is_a_unlockable = false
		self.parts.wpn_fps_snp_desertfox_b_silencer.is_a_unlockable = false
		self.parts.wpn_fps_snp_m95_barrel_long.is_a_unlockable = false
		self.parts.wpn_fps_snp_m95_barrel_short.is_a_unlockable = false
		self.parts.wpn_fps_snp_m95_barrel_suppressed.is_a_unlockable = false
		self.parts.wpn_fps_snp_model70_iron_sight.is_a_unlockable = false
		self.parts.wpn_fps_snp_mosin_b_short.is_a_unlockable = false
		self.parts.wpn_fps_snp_mosin_b_sniper.is_a_unlockable = false
		self.parts.wpn_fps_snp_mosin_b_standard.is_a_unlockable = false
		self.parts.wpn_fps_snp_mosin_body_black.is_a_unlockable = false
		self.parts.wpn_fps_snp_mosin_ns_bayonet.is_a_unlockable = false
		self.parts.wpn_fps_snp_msr_b_long.is_a_unlockable = false
		self.parts.wpn_fps_snp_msr_body_msr.is_a_unlockable = false
		self.parts.wpn_fps_snp_msr_ns_suppressor.is_a_unlockable = false
		self.parts.wpn_fps_upg_a_bow_explosion.is_a_unlockable = false
		self.parts.wpn_fps_upg_a_bow_poison.is_a_unlockable = false
		self.parts.wpn_fps_upg_a_custom.is_a_unlockable = false
		self.parts.wpn_fps_upg_a_dragons_breath.is_a_unlockable = false
		self.parts.wpn_fps_upg_a_explosive.is_a_unlockable = false
		self.parts.wpn_fps_upg_a_grenade_launcher_incendiary.is_a_unlockable = false
		self.parts.wpn_fps_upg_a_grenade_launcher_incendiary_arbiter.is_a_unlockable = false
		self.parts.wpn_fps_upg_a_piercing.is_a_unlockable = false
		self.parts.wpn_fps_upg_a_slug.is_a_unlockable = false
		self.parts.wpn_fps_upg_ak_b_ak105.is_a_unlockable = false
		self.parts.wpn_fps_upg_ak_fg_krebs.is_a_unlockable = false
		self.parts.wpn_fps_upg_ak_fg_trax.is_a_unlockable = false
		self.parts.wpn_fps_upg_ak_fg_zenit.is_a_unlockable = false
		self.parts.wpn_fps_upg_ak_g_rk3.is_a_unlockable = false
		self.parts.wpn_fps_upg_ak_m_quick.is_a_unlockable = false
		self.parts.wpn_fps_upg_ak_m_uspalm.is_a_unlockable = false
		self.parts.wpn_fps_upg_ak_s_solidstock.is_a_unlockable = false
		self.parts.wpn_fps_upg_ass_ak_b_zastava.is_a_unlockable = false
		self.parts.wpn_fps_upg_ass_m4_b_beowulf.is_a_unlockable = false
		self.parts.wpn_fps_upg_ass_m4_fg_lvoa.is_a_unlockable = false
		self.parts.wpn_fps_upg_ass_m4_fg_moe.is_a_unlockable = false
		self.parts.wpn_fps_upg_ass_m4_lower_reciever_core.is_a_unlockable = false
		self.parts.wpn_fps_upg_ass_m4_upper_reciever_ballos.is_a_unlockable = false
		self.parts.wpn_fps_upg_ass_m4_upper_reciever_core.is_a_unlockable = false
		self.parts.wpn_fps_upg_ass_m16_fg_stag.is_a_unlockable = false
		self.parts.wpn_fps_upg_g36_fg_long.is_a_unlockable = false
		self.parts.wpn_fps_upg_m4_m_l5.is_a_unlockable = false
		self.parts.wpn_fps_upg_m4_s_ubr.is_a_unlockable = false
		self.parts.wpn_fps_upg_ns_ass_pbs1.is_a_unlockable = false
		self.parts.wpn_fps_upg_ns_duck.is_a_unlockable = false
		self.parts.wpn_fps_upg_o_45iron.is_a_unlockable = false
		self.parts.wpn_fps_upg_o_45rds.is_a_unlockable = false
		self.parts.wpn_fps_upg_o_ak_scopemount.is_a_unlockable = false
		self.parts.wpn_fps_upg_o_box.is_a_unlockable = false
		self.parts.wpn_fps_upg_o_leupold.is_a_unlockable = false
		self.parts.wpn_fps_upg_o_mbus_rear.is_a_unlockable = false
		self.parts.wpn_fps_upg_o_spot.is_a_unlockable = false
		self.parts.wpn_fps_upg_smg_olympic_fg_lr300.is_a_unlockable = false
	end
end
if string.lower(RequiredScript) == "lib/tweak_data/blackmarket/meleeweaponstweakdata" then
	local init_original = BlackMarketTweakData._init_melee_weapons

	function BlackMarketTweakData:_init_melee_weapons(...)
		init_original(self, ...)
		
		self.melee_weapons.swagger.stats.min_damage = 2
		self.melee_weapons.swagger.stats.max_damage = 3.5
		self.melee_weapons.swagger.stats.min_damage_effect = 3.8
		self.melee_weapons.swagger.stats.max_damage_effect = 4
		self.melee_weapons.swagger.stats.charge_time = 2.2
		
		self.melee_weapons.briefcase.stats.min_damage = 0.68
		self.melee_weapons.briefcase.stats.max_damage = 1.68
		self.melee_weapons.briefcase.stats.min_damage_effect = 10
		self.melee_weapons.briefcase.stats.max_damage_effect = 10
		
		self.melee_weapons.fork.stats.min_damage = 4
		self.melee_weapons.fork.stats.max_damage = 9
		self.melee_weapons.fork.stats.min_damage_effect = 0.25
		self.melee_weapons.fork.stats.max_damage_effect = 0.5
		self.melee_weapons.fork.stats.charge_time = 2
		
		self.melee_weapons.spatula.stats.min_damage = 2
		self.melee_weapons.spatula.stats.max_damage = 3
		self.melee_weapons.spatula.stats.min_damage_effect = 1.5
		self.melee_weapons.spatula.stats.max_damage_effect = 2
		self.melee_weapons.spatula.stats.charge_time = 1
		
		self.melee_weapons.shawn.stats.min_damage = 2.6
		self.melee_weapons.shawn.stats.max_damage = 8.2
		self.melee_weapons.shawn.stats.min_damage_effect = 0.25
		self.melee_weapons.shawn.stats.max_damage_effect = 0.5
		
		self.melee_weapons.microphone.stats.min_damage = 1.5
		self.melee_weapons.microphone.stats.max_damage = 3.5
		self.melee_weapons.microphone.stats.min_damage_effect = 4
		self.melee_weapons.microphone.stats.max_damage_effect = 3
		self.melee_weapons.microphone.stats.charge_time = 1.3
		
		self.melee_weapons.selfie.stats.min_damage = 2
		self.melee_weapons.selfie.stats.max_damage = 3.5
		
		self.melee_weapons.gator.stats.min_damage = 4.5
		self.melee_weapons.gator.stats.max_damage = 8.2
		self.melee_weapons.gator.stats.min_damage_effect = 0.5
		self.melee_weapons.gator.stats.max_damage_effect = 0.6
		self.melee_weapons.gator.stats.charge_time = 2.4
		
		self.melee_weapons.road.stats.min_damage = 1.34
		self.melee_weapons.road.stats.max_damage = 2.64
		self.melee_weapons.road.stats.min_damage_effect = 7
		self.melee_weapons.road.stats.max_damage_effect = 7
		self.melee_weapons.road.stats.charge_time = 2.4
		
		self.melee_weapons.iceaxe.stats.min_damage = 3.8
		self.melee_weapons.iceaxe.stats.max_damage = 11.6
		self.melee_weapons.iceaxe.stats.min_damage_effect = 1.3
		self.melee_weapons.iceaxe.stats.max_damage_effect = 1.5
		self.melee_weapons.iceaxe.stats.charge_time = 3.2
		
		self.melee_weapons.oxide.stats.min_damage = 3.6
		self.melee_weapons.oxide.stats.max_damage = 10.2
		self.melee_weapons.oxide.stats.min_damage_effect = 0.5
		self.melee_weapons.oxide.stats.max_damage_effect = 0.6
		self.melee_weapons.oxide.stats.charge_time = 2.3
		
		self.melee_weapons.slot_lever.stats.min_damage = 3
		self.melee_weapons.slot_lever.stats.max_damage = 6.1
		self.melee_weapons.slot_lever.stats.min_damage_effect = 3.2
		self.melee_weapons.slot_lever.stats.max_damage_effect = 1.6
		
		self.melee_weapons.fear.stats.min_damage = 1
		self.melee_weapons.fear.stats.max_damage = 2
		self.melee_weapons.fear.stats.min_damage_effect = 2.35
		self.melee_weapons.fear.stats.max_damage_effect = 0.89
		self.melee_weapons.fear.stats.charge_time = 1
		
		self.melee_weapons.baseballbat.stats.min_damage = 3.5
		self.melee_weapons.baseballbat.stats.max_damage = 6
		self.melee_weapons.baseballbat.stats.min_damage_effect = 4
		self.melee_weapons.baseballbat.stats.max_damage_effect = 3.2
		self.melee_weapons.baseballbat.stats.charge_time = 2.4
		
		self.melee_weapons.hockey.stats.min_damage = 3.5
		self.melee_weapons.hockey.stats.max_damage = 6
		self.melee_weapons.hockey.stats.min_damage_effect = 4
		self.melee_weapons.hockey.stats.max_damage_effect = 3.2
		self.melee_weapons.hockey.stats.charge_time = 2.4
		
		self.melee_weapons.happy.stats.min_damage = 0.58
		self.melee_weapons.happy.stats.max_damage = 1.88
		self.melee_weapons.happy.stats.min_damage_effect = 12
		self.melee_weapons.happy.stats.max_damage_effect = 8.8
		self.melee_weapons.happy.stats.charge_time = 2
		
		self.melee_weapons.buck.stats.min_damage = 3.5
		self.melee_weapons.buck.stats.max_damage = 6
		self.melee_weapons.buck.stats.min_damage_effect = 4
		self.melee_weapons.buck.stats.max_damage_effect = 3.2
		
		self.melee_weapons.branding_iron.stats.min_damage = 3
		self.melee_weapons.branding_iron.stats.max_damage = 6.1
		self.melee_weapons.branding_iron.stats.min_damage_effect = 3.2
		self.melee_weapons.branding_iron.stats.max_damage_effect = 1.6
		self.melee_weapons.branding_iron.stats.charge_time = 2
		
		self.melee_weapons.croupier_rake.stats.min_damage = 0.68
		self.melee_weapons.croupier_rake.stats.max_damage = 1.68
		self.melee_weapons.croupier_rake.stats.min_damage_effect = 12
		self.melee_weapons.croupier_rake.stats.max_damage_effect = 8.8
		self.melee_weapons.croupier_rake.stats.charge_time = 2
		
		self.melee_weapons.ostry.stats.min_damage = 3.3
		self.melee_weapons.ostry.stats.max_damage = 9.2
		self.melee_weapons.ostry.stats.min_damage_effect = 0.5
		self.melee_weapons.ostry.stats.max_damage_effect = 0.6
		self.melee_weapons.ostry.stats.charge_time = 2.5
		
		self.melee_weapons.model24.stats.min_damage = 3
		self.melee_weapons.model24.stats.max_damage = 6.1
		self.melee_weapons.model24.stats.min_damage_effect = 3.2
		self.melee_weapons.model24.stats.max_damage_effect = 1.5
		self.melee_weapons.model24.stats.charge_time = 2
		
		self.melee_weapons.scalper.stats.min_damage = 4
		self.melee_weapons.scalper.stats.max_damage = 6.64
		self.melee_weapons.scalper.stats.min_damage_effect = 0.5
		self.melee_weapons.scalper.stats.max_damage_effect = 0.6
		
		self.melee_weapons.boxing_gloves.stats.min_damage = 1.5
		self.melee_weapons.boxing_gloves.stats.max_damage = 3.5
		self.melee_weapons.boxing_gloves.stats.min_damage_effect = 4
		self.melee_weapons.boxing_gloves.stats.max_damage_effect = 3
		self.melee_weapons.boxing_gloves.stats.charge_time = 1.3
		
		self.melee_weapons.push.stats.min_damage = 2.1
		self.melee_weapons.push.stats.max_damage = 5.3

		self.melee_weapons.meat_cleaver.stats.min_damage = 3
		self.melee_weapons.meat_cleaver.stats.max_damage = 7.5
		self.melee_weapons.meat_cleaver.stats.min_damage_effect = 0.5
		self.melee_weapons.meat_cleaver.stats.max_damage_effect = 0.6
		
		self.melee_weapons.twins.stats.min_damage = 3
		self.melee_weapons.twins.stats.max_damage = 4
		self.melee_weapons.twins.stats.min_damage_effect = 0.5
		self.melee_weapons.twins.stats.max_damage_effect = 0.5
		self.melee_weapons.twins.stats.charge_time = 1
		
		self.melee_weapons.micstand.stats.min_damage = 2
		self.melee_weapons.micstand.stats.max_damage = 3
		self.melee_weapons.micstand.stats.min_damage_effect = 1.5
		self.melee_weapons.micstand.stats.max_damage_effect = 2
		self.melee_weapons.micstand.stats.charge_time = 1
		
		self.melee_weapons.chef.stats.min_damage = 2.8
		self.melee_weapons.chef.stats.max_damage = 14
		self.melee_weapons.chef.stats.min_damage_effect = 1
		self.melee_weapons.chef.stats.max_damage_effect = 1
		self.melee_weapons.chef.stats.charge_time = 4
		
		self.melee_weapons.tiger.stats.min_damage = 3.5
		self.melee_weapons.tiger.stats.max_damage = 5
		self.melee_weapons.tiger.stats.min_damage_effect = 0.3
		self.melee_weapons.tiger.stats.max_damage_effect = 0.3
		
		self.melee_weapons.beardy.stats.min_damage = 9
		self.melee_weapons.beardy.stats.max_damage = 14
		self.melee_weapons.beardy.stats.min_damage_effect = 1
		self.melee_weapons.beardy.stats.max_damage_effect = 1
		self.melee_weapons.beardy.stats.charge_time = 3.5
		
		self.melee_weapons.catch.stats.min_damage = 1.8
		self.melee_weapons.catch.stats.max_damage = 3.6
		self.melee_weapons.catch.stats.min_damage_effect = 0.3
		self.melee_weapons.catch.stats.max_damage_effect = 0.5
		self.melee_weapons.catch.stats.charge_time = 1.2
		
		self.melee_weapons.cleaver.stats.min_damage = 3
		self.melee_weapons.cleaver.stats.max_damage = 9.5
		self.melee_weapons.cleaver.stats.min_damage_effect = 0.5
		self.melee_weapons.cleaver.stats.max_damage_effect = 0.6
		self.melee_weapons.cleaver.stats.charge_time = 2.5
		
		self.melee_weapons.mining_pick.stats.min_damage = 3.5
		self.melee_weapons.mining_pick.stats.max_damage = 8
		self.melee_weapons.mining_pick.stats.min_damage_effect = 0.5
		self.melee_weapons.mining_pick.stats.max_damage_effect = 0.6
		self.melee_weapons.mining_pick.stats.charge_time = 3
		
		self.melee_weapons.hammer.stats.min_damage = 3
		self.melee_weapons.hammer.stats.max_damage = 6.1
		self.melee_weapons.hammer.stats.min_damage_effect = 3.2
		self.melee_weapons.hammer.stats.max_damage_effect = 1.6
		self.melee_weapons.hammer.stats.charge_time = 2

		self.melee_weapons.shillelagh.stats.min_damage = 3.5
		self.melee_weapons.shillelagh.stats.max_damage = 6.5
		self.melee_weapons.shillelagh.stats.min_damage_effect = 4
		self.melee_weapons.shillelagh.stats.max_damage_effect = 3
		self.melee_weapons.shillelagh.stats.charge_time = 2

		self.melee_weapons.stick.stats.min_damage = 2.5
		self.melee_weapons.stick.stats.max_damage = 5
		self.melee_weapons.stick.stats.min_damage_effect = 3
		self.melee_weapons.stick.stats.max_damage_effect = 3.2
		self.melee_weapons.stick.stats.charge_time = 2.6

		self.melee_weapons.morning.stats.min_damage = 4
		self.melee_weapons.morning.stats.max_damage = 6.64
		self.melee_weapons.morning.stats.min_damage_effect = 4
		self.melee_weapons.morning.stats.max_damage_effect = 3.2
		self.melee_weapons.morning.stats.charge_time = 3.5

		self.melee_weapons.poker.stats.min_damage = 6
		self.melee_weapons.poker.stats.max_damage = 12
		self.melee_weapons.poker.stats.min_damage_effect = 1.7
		self.melee_weapons.poker.stats.max_damage_effect = 2

		self.melee_weapons.barbedwire.stats.min_damage = 4
		self.melee_weapons.barbedwire.stats.max_damage = 6.64
		self.melee_weapons.barbedwire.stats.min_damage_effect = 4
		self.melee_weapons.barbedwire.stats.max_damage_effect = 3.2
		self.melee_weapons.barbedwire.stats.charge_time = 3

		self.melee_weapons.great.stats.min_damage = 7
		self.melee_weapons.great.stats.max_damage = 45
		self.melee_weapons.great.stats.min_damage_effect = 1
		self.melee_weapons.great.stats.max_damage_effect = 1
		self.melee_weapons.great.stats.charge_time = 4

		self.melee_weapons.whiskey.stats.min_damage = 3
		self.melee_weapons.whiskey.stats.max_damage = 5.5
		self.melee_weapons.whiskey.stats.min_damage_effect = 3
		self.melee_weapons.whiskey.stats.max_damage_effect = 2
		self.melee_weapons.whiskey.stats.charge_time = 2

		self.melee_weapons.freedom.stats.min_damage = 7
		self.melee_weapons.freedom.stats.max_damage = 16
		self.melee_weapons.freedom.stats.min_damage_effect = 1
		self.melee_weapons.freedom.stats.max_damage_effect = 1
		self.melee_weapons.freedom.stats.charge_time = 4

		self.melee_weapons.tenderizer.stats.min_damage = 3
		self.melee_weapons.tenderizer.stats.max_damage = 9
		self.melee_weapons.tenderizer.stats.min_damage_effect = 2
		self.melee_weapons.tenderizer.stats.max_damage_effect = 1.6

		self.melee_weapons.machete.stats.min_damage = 4
		self.melee_weapons.machete.stats.max_damage = 8.5
		self.melee_weapons.machete.stats.min_damage_effect = 0.5
		self.melee_weapons.machete.stats.max_damage_effect = 0.6
		self.melee_weapons.machete.stats.charge_time = 2.7

		self.melee_weapons.cqc.stats.min_damage = 2
		self.melee_weapons.cqc.stats.max_damage = 4
		self.melee_weapons.cqc.stats.min_damage_effect = 0.5
		self.melee_weapons.cqc.stats.max_damage_effect = 0.5
		self.melee_weapons.cqc.stats.charge_time = 1

		self.melee_weapons.fireaxe.stats.min_damage = 9
		self.melee_weapons.fireaxe.stats.max_damage = 14
		self.melee_weapons.fireaxe.stats.min_damage_effect = 1
		self.melee_weapons.fireaxe.stats.max_damage_effect = 1
		self.melee_weapons.fireaxe.stats.charge_time = 3.5

		
		
		self.melee_weapons.weapon.stats = {
			min_damage = 1.5,
			max_damage = 1.5,
			min_damage_effect = 1.75,
			max_damage_effect = 1.75,
			charge_time = 0,
			range = 150,
			weapon_type = "blunt"
		}

		self.melee_weapons.fists.stats.min_damage = 1
		self.melee_weapons.fists.stats.max_damage = 3
		self.melee_weapons.fists.stats.min_damage_effect = 5.35
		self.melee_weapons.fists.stats.max_damage_effect = 2.89
		self.melee_weapons.fists.stats.charge_time = 1
		self.melee_weapons.fists.stats.range = 150

		self.melee_weapons.kabar.stats.min_damage = 1.5
		self.melee_weapons.kabar.stats.max_damage = 7
		self.melee_weapons.kabar.stats.min_damage_effect = 0.7
		self.melee_weapons.kabar.stats.max_damage_effect = 0.525
		self.melee_weapons.kabar.stats.charge_time = 1.8
		self.melee_weapons.kabar.stats.range = 185

		self.melee_weapons.rambo.stats.min_damage = 2.2
		self.melee_weapons.rambo.stats.max_damage = 10
		self.melee_weapons.rambo.stats.min_damage_effect = 0.61
		self.melee_weapons.rambo.stats.max_damage_effect = 0.4
		self.melee_weapons.rambo.stats.charge_time = 2
		self.melee_weapons.rambo.stats.range = 200

		self.melee_weapons.gerber.stats.min_damage = 2
		self.melee_weapons.gerber.stats.max_damage = 5.2
		self.melee_weapons.gerber.stats.min_damage_effect = 1
		self.melee_weapons.gerber.stats.max_damage_effect = 0.58
		self.melee_weapons.gerber.stats.charge_time = 1.3
		self.melee_weapons.gerber.stats.range = 160

		self.melee_weapons.kampfmesser.stats.min_damage = 1.5
		self.melee_weapons.kampfmesser.stats.max_damage = 7.5
		self.melee_weapons.kampfmesser.stats.min_damage_effect = 1
		self.melee_weapons.kampfmesser.stats.max_damage_effect = 0.445
		self.melee_weapons.kampfmesser.stats.charge_time = 1.5
		self.melee_weapons.kampfmesser.stats.range = 185

		self.melee_weapons.brass_knuckles.stats.min_damage = 1.5
		self.melee_weapons.brass_knuckles.stats.max_damage = 3.5
		self.melee_weapons.brass_knuckles.stats.min_damage_effect = 3.7
		self.melee_weapons.brass_knuckles.stats.max_damage_effect = 2.675
		self.melee_weapons.brass_knuckles.stats.charge_time = 1.3
		self.melee_weapons.brass_knuckles.stats.range = 150

		self.melee_weapons.tomahawk.stats.min_damage = 4
		self.melee_weapons.tomahawk.stats.max_damage = 6.64
		self.melee_weapons.tomahawk.stats.min_damage_effect = 0.5
		self.melee_weapons.tomahawk.stats.max_damage_effect = 0.6
		self.melee_weapons.tomahawk.stats.charge_time = 2.2
		self.melee_weapons.tomahawk.stats.range = 225
		
		self.melee_weapons.baton.stats.weapon_type = "blunt"
		self.melee_weapons.baton.stats.min_damage = 0.68
		self.melee_weapons.baton.stats.max_damage = 1.68
		self.melee_weapons.baton.stats.min_damage_effect = 12
		self.melee_weapons.baton.stats.max_damage_effect = 8.8
		self.melee_weapons.baton.stats.charge_time = 2
		self.melee_weapons.baton.stats.range = 250

		self.melee_weapons.shovel.stats.weapon_type = "blunt"
		self.melee_weapons.shovel.stats.min_damage = 1.34
		self.melee_weapons.shovel.stats.max_damage = 2.64
		self.melee_weapons.shovel.stats.min_damage_effect = 4.75
		self.melee_weapons.shovel.stats.max_damage_effect = 5.06
		self.melee_weapons.shovel.stats.charge_time = 2.2
		self.melee_weapons.shovel.stats.range = 250
		self.melee_weapons.shovel.stats.weapon_type = "blunt"

		self.melee_weapons.becker.stats.min_damage = 1.68
		self.melee_weapons.becker.stats.max_damage = 11.68
		self.melee_weapons.becker.stats.min_damage_effect = 0.4
		self.melee_weapons.becker.stats.max_damage_effect = 0.345
		self.melee_weapons.becker.stats.charge_time = 3
		self.melee_weapons.becker.stats.range = 200

		self.melee_weapons.moneybundle.stats.min_damage = 0.2
		self.melee_weapons.moneybundle.stats.max_damage = 1
		self.melee_weapons.moneybundle.stats.min_damage_effect = 15
		self.melee_weapons.moneybundle.stats.max_damage_effect = 10
		self.melee_weapons.moneybundle.stats.charge_time = 1
		self.melee_weapons.moneybundle.stats.range = 150
		self.melee_weapons.moneybundle.stats.weapon_type = "blunt"

		self.melee_weapons.x46.stats.min_damage = 2.5
		self.melee_weapons.x46.stats.max_damage = 6
		self.melee_weapons.x46.stats.min_damage_effect = 1
		self.melee_weapons.x46.stats.max_damage_effect = 1
		self.melee_weapons.x46.stats.charge_time = 1.5
		self.melee_weapons.x46.stats.range = 185

		self.melee_weapons.dingdong.stats.min_damage = 3
		self.melee_weapons.dingdong.stats.max_damage = 9.2
		self.melee_weapons.dingdong.stats.min_damage_effect = 4
		self.melee_weapons.dingdong.stats.max_damage_effect = 3.2
		self.melee_weapons.dingdong.stats.charge_time = 2.5
		self.melee_weapons.dingdong.stats.range = 275
		self.melee_weapons.dingdong.stats.weapon_type = "blunt"

		self.melee_weapons.bayonet.stats.min_damage = 2
		self.melee_weapons.bayonet.stats.max_damage = 8
		self.melee_weapons.bayonet.stats.min_damage_effect = 1
		self.melee_weapons.bayonet.stats.max_damage_effect = 0.445
		self.melee_weapons.bayonet.stats.charge_time = 1.5
		self.melee_weapons.bayonet.stats.range = 185

		self.melee_weapons.bullseye.stats.min_damage = 3
		self.melee_weapons.bullseye.stats.max_damage = 8
		self.melee_weapons.bullseye.stats.min_damage_effect = 0.5
		self.melee_weapons.bullseye.stats.max_damage_effect = 0.6
		self.melee_weapons.bullseye.stats.charge_time = 1.6
		self.melee_weapons.bullseye.stats.range = 185

		self.melee_weapons.kabartanto.stats.min_damage = 2
		self.melee_weapons.kabartanto.stats.max_damage = 8
		self.melee_weapons.kabartanto.stats.min_damage_effect = 0.8
		self.melee_weapons.kabartanto.stats.max_damage_effect = 0.5
		self.melee_weapons.kabartanto.stats.charge_time = 1.7
		self.melee_weapons.kabartanto.stats.range = 185

		self.melee_weapons.toothbrush.stats.weapon_type = "sharp"
		self.melee_weapons.toothbrush.stats.min_damage = 2
		self.melee_weapons.toothbrush.stats.max_damage = 4
		self.melee_weapons.toothbrush.stats.min_damage_effect = 0.1
		self.melee_weapons.toothbrush.stats.max_damage_effect = 1
		self.melee_weapons.toothbrush.stats.charge_time = 1.5
		self.melee_weapons.toothbrush.stats.range = 150

		self.melee_weapons.fairbair.stats.weapon_type = "sharp"
		self.melee_weapons.fairbair.stats.min_damage = 2
		self.melee_weapons.fairbair.stats.max_damage = 5
		self.melee_weapons.fairbair.stats.min_damage_effect = 0.2
		self.melee_weapons.fairbair.stats.max_damage_effect = 1
		self.melee_weapons.fairbair.stats.charge_time = 2
		self.melee_weapons.fairbair.stats.range = 175

		self.melee_weapons.alien_maul.stats.weapon_type = "blunt"
		self.melee_weapons.alien_maul.stats.min_damage = 2.9
		self.melee_weapons.alien_maul.stats.max_damage = 6
		self.melee_weapons.alien_maul.stats.min_damage_effect = 3.9
		self.melee_weapons.alien_maul.stats.max_damage_effect = 3.1
		self.melee_weapons.alien_maul.stats.charge_time = 2
		self.melee_weapons.alien_maul.stats.range = 275
		self.melee_weapons.alien_maul.stats.weapon_type = "blunt"

		self.melee_weapons.bowie.stats.min_damage = 3
		self.melee_weapons.bowie.stats.max_damage = 6.1
		self.melee_weapons.bowie.stats.min_damage_effect = 3.2
		self.melee_weapons.bowie.stats.max_damage_effect = 1.5
		self.melee_weapons.bowie.stats.charge_time = 2
		self.melee_weapons.bowie.stats.range = 225

		self.melee_weapons.oldbaton.stats.weapon_type = "sharp"
		self.melee_weapons.oldbaton.stats.min_damage = 0.68
		self.melee_weapons.oldbaton.stats.max_damage = 1.68
		self.melee_weapons.oldbaton.stats.min_damage_effect = 12
		self.melee_weapons.oldbaton.stats.max_damage_effect = 8.8
		self.melee_weapons.oldbaton.stats.charge_time = 2
		self.melee_weapons.oldbaton.stats.range = 250

		self.melee_weapons.switchblade.stats.min_damage = 3
		self.melee_weapons.switchblade.stats.max_damage = 5
		self.melee_weapons.switchblade.stats.min_damage_effect = 0.2
		self.melee_weapons.switchblade.stats.max_damage_effect = 1
		self.melee_weapons.switchblade.stats.charge_time = 2
		self.melee_weapons.switchblade.stats.range = 175

		self.melee_weapons.taser.stats.min_damage = 2
		self.melee_weapons.taser.stats.max_damage = 2
		self.melee_weapons.taser.stats.min_damage_effect = 1
		self.melee_weapons.taser.stats.max_damage_effect = 1
		self.melee_weapons.taser.stats.charge_time = 3.5
		self.melee_weapons.taser.stats.range = 200

		self.melee_weapons.fight.stats.min_damage = 1.5
		self.melee_weapons.fight.stats.max_damage = 3
		self.melee_weapons.fight.stats.min_damage_effect = 3
		self.melee_weapons.fight.stats.max_damage_effect = 3
		self.melee_weapons.fight.stats.charge_time = 1
		self.melee_weapons.fight.stats.range = 150
		self.melee_weapons.fight.stats.remove_weapon_movement_penalty = true
		self.melee_weapons.fight.stats.weapon_type = "blunt"

		self.melee_weapons.boxcutter.stats = {
			weapon_type = "sharp",
			min_damage = 1,
			max_damage = 3.5,
			min_damage_effect = 1,
			max_damage_effect = 1,
			charge_time = 1,
			range = 185,
			concealment = 30
		}
		
		self.melee_weapons.pugio.stats.min_damage = 1.9
		self.melee_weapons.pugio.stats.max_damage = 5

		self.melee_weapons.ballistic.stats.min_damage = 1.5
		
		self.melee_weapons.zeus.stats.min_damage = 1.5
		self.melee_weapons.zeus.stats.max_damage = 3.5
		self.melee_weapons.zeus.stats.min_damage_effect = 3.7
		self.melee_weapons.zeus.stats.max_damage_effect = 2.675
		self.melee_weapons.zeus.stats.charge_time = 1.3
		self.melee_weapons.zeus.stats.range = 150
		
		self.melee_weapons.wing.stats.min_damage = 2
		self.melee_weapons.wing.stats.max_damage = 5.2
		self.melee_weapons.wing.stats.min_damage_effect = 1
		self.melee_weapons.wing.stats.max_damage_effect = 0.58
		
		self.melee_weapons.sword.stats.min_damage = 1
		self.melee_weapons.sword.stats.max_damage = 2
		self.melee_weapons.sword.stats.min_damage_effect = 2.35
		self.melee_weapons.sword.stats.max_damage_effect = 0.89
		self.melee_weapons.sword.stats.charge_time = 1
		
		self.melee_weapons.agave.stats.min_damage = 5
		self.melee_weapons.agave.stats.max_damage = 9.5
		self.melee_weapons.agave.stats.min_damage_effect = 0.5
		self.melee_weapons.agave.stats.max_damage_effect = 0.6
		self.melee_weapons.agave.stats.charge_time = 2.7
		self.melee_weapons.agave.stats.range = 225
		
		self.melee_weapons.grip.stats.min_damage = 1.
		
		self.melee_weapons.clean.stats = {
			weapon_type = "sharp",
			min_damage = 1.2,
			max_damage = 3,
			min_damage_effect = 0.6,
			max_damage_effect = 0.4,
			charge_time = 2,
			range = 150,
			concealment = 29,
			remove_weapon_movement_penalty = true
		}
		
		self.melee_weapons.meter.stats = {
			weapon_type = "sharp",
			min_damage = 0.9,
			max_damage = 1,
			min_damage_effect = 0.4,
			max_damage_effect = 0.2,
			charge_time = 0.3,
			range = 275,
			concealment = 27,
			remove_weapon_movement_penalty = true
		}
			
		self.melee_weapons.aziz.stats.min_damage = 0.68
		self.melee_weapons.aziz.stats.max_damage = 1.68
		
		self.melee_weapons.hauteur.stats.min_damage = 1.78
		self.melee_weapons.hauteur.stats.max_damage = 11.78
		self.melee_weapons.hauteur.stats.min_damage_effect = 0.5
		self.melee_weapons.hauteur.stats.max_damage_effect = 0.445
		self.melee_weapons.hauteur.stats.charge_time = 3
		self.melee_weapons.hauteur.stats.range = 200
		
		self.melee_weapons.shock.stats.min_damage = 3
		self.melee_weapons.shock.stats.max_damage = 6
		
		self.melee_weapons.nin.stats.max_damage = 15
		self.melee_weapons.sandsteel.stats.max_damage = 15
		self.melee_weapons.cs.stats.max_damage = 15
		self.melee_weapons.great.stats.max_damage = 15

	end
end
if string.lower(RequiredScript) == "lib/tweak_data/blackmarket/projectilestweakdata" then
	local data = BlackMarketTweakData._init_projectiles
	function BlackMarketTweakData:_init_projectiles(tweak_data)
		data(self, tweak_data)
		self.projectiles.tag_team = nil
		self.projectiles.damage_control = nil
		self.projectiles.concussion.dlc = nil
		self.projectiles.smoke_screen_grenade.dlc = nil
		self.projectiles.chico_injector.base_cooldown = nil
		self.projectiles.smoke_screen_grenade.base_cooldown = nil
		self.projectiles.chico_injector.max_amount = 3
		self.projectiles.concussion.max_amount = 3
		self.projectiles.smoke_screen_grenade.max_amount = 3
	end
end
if string.lower(RequiredScript) == "lib/tweak_data/tweakdata" then
	local self = tweak_data
	self.projectiles.frag.damage = 30
	self.projectiles.frag.range = 1000
	self.projectiles.launcher_frag.damage = 34
	self.projectiles.launcher_rocket.damage = 1000
	self.projectiles.launcher_incendiary.damage = 3
	self.projectiles.launcher_incendiary.fire_dot_data.dot_damage = 3
	self.projectiles.launcher_incendiary.fire_dot_data.dot_length = 3.1
	self.projectiles.launcher_frag_m32.damage = 34
	self.projectiles.launcher_frag_china.damage = 24.5
	self.projectiles.launcher_frag_arbiter.damage = 12.5
	self.projectiles.launcher_incendiary_arbiter.damage = 3
	self.projectiles.launcher_incendiary_arbiter.fire_dot_data.dot_damage = 3
	self.projectiles.launcher_incendiary_arbiter.fire_dot_data.dot_length = 3.1
	self.projectiles.west_arrow.damage = 6
	self.projectiles.west_arrow_exp.damage = 8.5
	self.projectiles.dynamite.damage = 30
	self.projectiles.bow_poison_arrow.damage = 6.5
	self.projectiles.crossbow_arrow.damage = 10
	self.projectiles.crossbow_poison_arrow.damage = 3.2
	self.projectiles.crossbow_arrow_exp.damage = 15
	self.projectiles.wpn_prj_jav.damage = 11
	self.projectiles.arblast_arrow.damage = 10
	self.projectiles.arblast_arrow_exp.damage = 13
	self.projectiles.arblast_poison_arrow.damage = 6
	self.projectiles.frankish_arrow.damage = 9.5
	self.projectiles.frankish_arrow_exp.damage = 12
	self.projectiles.frankish_poison_arrow.damage = 5
	self.projectiles.long_arrow.damage = 8
	self.projectiles.long_arrow_exp.damage = 10.5
	self.projectiles.long_poison_arrow.damage = 3.5
	self.projectiles.wpn_prj_hur.damage = 1.1
	self.projectiles.wpn_prj_target.damage = 1.1
	self.projectiles.frag_com.damage = 30
	self.projectiles.rocket_ray_frag.damage = 500
	self.projectiles.dada_com.damage = 30
	self.projectiles.ecp_arrow.damage = 9.5
	self.projectiles.ecp_arrow_exp.damage = 12
	self.projectiles.ecp_arrow_poison.damage = 5
	self.projectiles.elastic_arrow.damage = 8
	self.projectiles.elastic_arrow_exp.damage = 10.5
	self.projectiles.elastic_arrow_poison.damage = 3.5
end
if string.lower(RequiredScript) == "lib/utils/inventorydescription" then
	WeaponDescription._stats_shown[5].percent = false
	WeaponDescription._stats_shown[6].percent = false
end