local PICKUP = {
	SNIPER_HIGH_DAMAGE = 6,
	SHOTGUN_HIGH_CAPACITY = 4,
	AR_HIGH_CAPACITY = 2,
	OTHER = 1,
	SNIPER_LOW_DAMAGE = 5,
	AR_MED_CAPACITY = 3
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

	
	self.stats.damage = {
		1,
		1.1,
		1.2,
		1.3,
		1.4,
		1.5,
		1.6,
		1.8,
		2,
		2.3,
		2.5,
		2.8,
		3,
		3.3,
		3.5,
		3.8,
		4,
		4.3,
		4.5,
		4.8,
		5,
		5.5,
		6,
		6.5,
		7,
		7.5,
		8,
		8.5,
		9,
		9.5,
		10,
		10.5,
		11,
		11.5,
		12
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

	self.new_m4.stats = {
		reload = 11,
		damage = 10,
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
	self.glock_17.stats = {
		reload = 11,
		damage = 6,
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
	self.mp9.stats = {
		reload = 11,
		damage = 9,
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
	self.r870.stats = {
		reload = 11,
		damage = 23,
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
	self.glock_18c.stats = {
		reload = 11,
		damage = 9,
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
	self.amcar.stats = {
		reload = 11,
		damage = 7,
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
	self.m16.stats = {
		reload = 11,
		damage = 13,
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
	self.olympic.stats = {
		reload = 11,
		damage = 9,
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
	self.ak74.stats = {
		reload = 11,
		damage = 12,
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
	self.akm.stats = {
		reload = 11,
		damage = 17,
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
	self.akm_gold.stats = {
		reload = 11,
		damage = 17,
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
	self.akmsu.stats = {
		reload = 11,
		damage = 11,
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
	self.saiga.stats = {
		reload = 11,
		damage = 15,
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
	self.ak5.stats = {
		reload = 11,
		damage = 9,
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
	self.aug.stats = {
		reload = 11,
		damage = 12,
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
	self.g36.stats = {
		reload = 11,
		damage = 11,
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
	self.p90.stats = {
		reload = 11,
		damage = 9,
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
	self.new_m14.stats = {
		reload = 11,
		damage = 26,
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
	self.deagle.stats = {
		reload = 11,
		damage = 23,
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
	self.new_mp5.stats = {
		reload = 11,
		damage = 8,
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
	self.colt_1911.stats = {
		reload = 11,
		damage = 10,
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
	self.mac10.stats = {
		reload = 11,
		damage = 11,
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
	self.serbu.stats = {
		reload = 11,
		damage = 24,
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
	self.huntsman.stats = {
		reload = 11,
		damage = 31,
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
	self.b92fs.stats = {
		reload = 11,
		damage = 8,
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
	self.new_raging_bull.stats = {
		reload = 11,
		damage = 26,
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
	self.saw.stats = {
		reload = 11,
		alert_size = 9,
		suppression = 7,
		zoom = 1,
		spread = 3,
		recoil = 7,
		spread_moving = 7,
		damage = 10,
		concealment = 16,
		value = 1,
		extra_ammo = 51,
		total_ammo_mod = 21
	}
	self.usp.stats = {
		reload = 11,
		damage = 9,
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
	self.g22c.stats = {
		reload = 11,
		damage = 10,
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
	self.judge.stats = {
		reload = 11,
		damage = 26,
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
	self.m45.stats = {
		reload = 11,
		damage = 12,
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
	self.s552.stats = {
		reload = 11,
		damage = 12,
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
	self.ppk.stats = {
		reload = 11,
		damage = 8,
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
	self.mp7.stats = {
		reload = 11,
		damage = 12,
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
	self.scar.stats = {
		reload = 11,
		damage = 18,
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
	self.p226.stats = {
		reload = 11,
		damage = 10,
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
	self.hk21.stats = {
		reload = 11,
		damage = 14,
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
	self.m249.stats = {
		reload = 11,
		damage = 12,
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
	self.rpk.stats = {
		reload = 11,
		damage = 13,
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
	self.m95.stats = {
		reload = 11,
		damage = 35,
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
	self.msr.stats = {
		reload = 11,
		damage = 21,
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
	self.r93.stats = {
		reload = 11,
		damage = 21,
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
	self.fal.stats = {
		reload = 11,
		damage = 18,
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
	self.benelli.stats = {
		reload = 11,
		damage = 15,
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
	self.striker.stats = {
		reload = 11,
		damage = 15,
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
	self.ksg.stats = {
		reload = 11,
		damage = 23,
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
	self.gre_m79.stats = {
		reload = 11,
		damage = 31,
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
	self.g3.stats = {
		reload = 11,
		damage = 18,
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
	self.galil.stats = {
		reload = 11,
		damage = 14,
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
	self.famas.stats = {
		reload = 11,
		damage = 11,
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
	self.scorpion.stats = {
		reload = 11,
		damage = 8,
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
	self.tec9.stats = {
		reload = 11,
		damage = 11,
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
	self.uzi.stats = {
		reload = 11,
		damage = 12,
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
	self.jowi.stats = {
		reload = 11,
		damage = 8,
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
	self.x_1911.stats = {
		reload = 11,
		damage = 10,
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
	self.x_b92fs.stats = {
		reload = 11,
		damage = 8,
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
	self.x_deagle.stats = {
		reload = 11,
		damage = 23,
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
	self.g26.stats = {
		reload = 11,
		damage = 8,
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
	self.spas12.stats = {
		reload = 11,
		damage = 20,
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
	self.mg42.stats = {
		reload = 11,
		damage = 13,
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
	self.c96.stats = {
		reload = 11,
		damage = 14,
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
	self.sterling.stats = {
		reload = 11,
		damage = 15,
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
	self.mosin.stats = {
		reload = 11,
		damage = 21,
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
	self.m1928.stats = {
		reload = 11,
		damage = 10,
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
	self.l85a2.stats = {
		reload = 11,
		damage = 14,
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
	self.vhs.stats = {
		reload = 11,
		damage = 14,
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
	self.hs2000.stats = {
		reload = 11,
		damage = 8,
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
	self.m134.stats = {
		reload = 11,
		damage = 16,
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
	self.rpg7.stats = {
		reload = 11,
		damage = 31,
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
	self.cobray.stats = {
		reload = 11,
		damage = 11,
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
	self.b682.stats = {
		reload = 11,
		damage = 31,
		spread = 8,
		recoil = 10,
		spread_moving = 6,
		zoom = 3,
		concealment = 5,
		suppression = 2,
		alert_size = 7,
		extra_ammo = 51,
		total_ammo_mod = 21,
		value = 1
	}
	self.x_g22c.stats = {
		reload = 11,
		damage = 10,
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
	self.x_g17.stats = {
		reload = 11,
		damage = 6,
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
	self.x_usp.stats = {
		reload = 11,
		damage = 9,
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
	self.flamethrower_mk2.stats = {
		reload = 11,
		damage = 5,
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
	self.m32.stats = {
		reload = 11,
		damage = 31,
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
	self.aa12.stats = {
		reload = 11,
		damage = 16,
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
	self.peacemaker.stats = {
		reload = 11,
		damage = 23,
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
	self.winchester1874.stats = {
		reload = 11,
		damage = 14,
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
	self.mateba.stats = {
		reload = 11,
		damage = 30,
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
	self.asval.stats = {
		reload = 11,
		damage = 16,
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
	self.sub2000.stats = {
		reload = 11,
		damage = 16,
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
	self.wa2000.stats = {
		reload = 11,
		damage = 21,
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
	self.polymer.stats = {
		reload = 11,
		damage = 12,
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
	self.hunter.stats = {
		reload = 11,
		damage = 21,
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
	self.baka.stats = {
		reload = 11,
		damage = 11,
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
	self.corgi.stats = {
		zoom = 1,
		total_ammo_mod = 21,
		damage = 7,
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
	self.flint.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 12,
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
	self.tecci.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 11,
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
	self.komodo.stats = {
		zoom = 1,
		total_ammo_mod = 21,
		damage = 10,
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
	self.contraband.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 12,
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
		damage = 31,
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
	self.ching.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 27,
		spread = 10,
		recoil = 4,
		spread_moving = 5,
		value = 1,
		extra_ammo = 51,
		reload = 11,
		suppression = 4,
		concealment = 20
	}
	self.boot.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 34,
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
	self.par.stats = {
		zoom = 1,
		total_ammo_mod = 21,
		damage = 12,
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
	self.model70.stats = {
		zoom = 1,
		total_ammo_mod = 21,
		damage = 21,
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
	self.desertfox.stats = {
		zoom = 1,
		total_ammo_mod = 21,
		damage = 21,
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
		damage = 21,
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
	self.siltstone.stats = {
		zoom = 1,
		total_ammo_mod = 21,
		damage = 21,
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
	self.x_p226.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 10,
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
	self.x_ppk.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 8,
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
	self.x_packrat.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 10,
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
	self.x_rage.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 26,
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
	self.x_pl14.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 23,
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
	self.x_sparrow.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 23,
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
	self.x_legacy.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 8,
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
	self.x_c96.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 14,
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
	self.x_chinchilla.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 26,
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
	self.x_shrew.stats = {
		zoom = 1,
		total_ammo_mod = 21,
		damage = 8,
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
	self.x_hs2000.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 8,
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
	self.x_g18c.stats = {
		zoom = 1,
		total_ammo_mod = 21,
		damage = 9,
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
	self.x_2006m.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 30,
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
	self.x_breech.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 26,
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
	self.x_akmsu.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 11,
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
	self.x_m45.stats = {
		zoom = 1,
		total_ammo_mod = 21,
		damage = 12,
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
	self.x_mp5.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 8,
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
	self.x_mp7.stats = {
		zoom = 1,
		total_ammo_mod = 21,
		alert_size = 7,
		damage = 12,
		spread = 7,
		recoil = 8,
		spread_moving = 7,
		value = 7,
		extra_ammo = 51,
		reload = 11,
		suppression = 16,
		concealment = 23
	}
	self.x_sr2.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 12,
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
	self.x_hajk.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 16,
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
	self.x_mac10.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 11,
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
	self.x_cobray.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 11,
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
	self.x_m1928.stats = {
		zoom = 1,
		total_ammo_mod = 21,
		damage = 10,
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
	self.x_scorpion.stats = {
		zoom = 1,
		total_ammo_mod = 21,
		damage = 8,
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
	self.x_baka.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 11,
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
	self.x_mp9.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 9,
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
	self.x_olympic.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 9,
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
	self.x_schakal.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 11,
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
	self.x_shepheard.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 11,
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
	self.x_tec9.stats = {
		zoom = 1,
		total_ammo_mod = 21,
		damage = 11,
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
	self.x_p90.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 9,
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
	self.x_polymer.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 12,
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
	self.x_coal.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 11,
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
	self.x_sterling.stats = {
		zoom = 1,
		total_ammo_mod = 21,
		damage = 15,
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
	self.x_uzi.stats = {
		zoom = 1,
		total_ammo_mod = 21,
		damage = 12,
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
	self.x_erma.stats = {
		zoom = 1,
		total_ammo_mod = 21,
		damage = 12,
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
	self.x_rota.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 15,
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
	self.x_basset.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 8,
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
	self.x_judge.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 26,
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
	self.shuno.stats = {
		zoom = 1,
		total_ammo_mod = 21,
		damage = 16,
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
	self.elastic.stats = {
		zoom = 5,
		total_ammo_mod = 21,
		damage = 24,
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
	self.ecp.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 27,
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
	self.pl14.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 23,
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
		damage = 23,
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
		damage = 8,
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
	self.lemming.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 23,
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
		damage = 26,
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
		damage = 10,
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
	self.shrew.stats = {
		zoom = 1,
		total_ammo_mod = 21,
		damage = 8,
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
	self.breech.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 26,
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
	self.hajk.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 16,
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
	self.shepheard.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 11,
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
		damage = 11,
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
		damage = 12,
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
	self.coal.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 11,
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
	self.erma.stats = {
		zoom = 1,
		total_ammo_mod = 21,
		damage = 12,
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
	self.slap.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 31,
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
	self.china.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 31,
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
	self.ray.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 31,
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
	self.saw_secondary.stats = {
		reload = 11,
		alert_size = 9,
		suppression = 7,
		zoom = 1,
		spread = 3,
		recoil = 7,
		spread_moving = 7,
		damage = 10,
		concealment = 16,
		value = 1,
		extra_ammo = 51,
		total_ammo_mod = 21
	}
	self.arbiter.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 25,
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
	self.m37.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 24,
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
		damage = 15,
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
		damage = 8,
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
	self.coach.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 31,
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

	self.beer.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 8,
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
		damage = 9,
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
		damage = 10,
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


	self.x_beer.stats = {
		zoom = 3,
		total_ammo_mod = 21,
		damage = 8,
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
	self.x_czech.stats = {
		zoom = 1,
		total_ammo_mod = 21,
		damage = 9,
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
	self.x_stech.stats = {
		zoom = 1,
		total_ammo_mod = 21,
		damage = 10,
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


	self.saw_secondary = nil
	self.plainsrider = nil
	self.frankish = nil
	self.long = nil
	self.arblast = nil
	
	
	self.china.use_data = {selection_index = SELECTION.PRIMARY}
	self.rpg7.use_data = {selection_index = SELECTION.PRIMARY}
	self.ray.use_data = {selection_index = SELECTION.PRIMARY}
	self.ecp.use_data = {selection_index = SELECTION.PRIMARY}
	self.sub2000.use_data = {selection_index = SELECTION.SECONDARY}
	self.sub2000_crew.use_data.selection_index = SELECTION.SECONDARY
	self.sub2000.categories = {"pistol"}
	self.rpg7.NR_CLIPS_MAX = 1
	self.ray.NR_CLIPS_MAX = 1
	self.rpg7.AMMO_MAX = self.rpg7.CLIP_AMMO_MAX * self.rpg7.NR_CLIPS_MAX
	self.ray.AMMO_MAX = self.ray.CLIP_AMMO_MAX * self.ray.NR_CLIPS_MAX
	
	self.gre_m79.AMMO_PICKUP = {0, 0}
	self.m32.AMMO_PICKUP = {0, 0}
	self.m95.AMMO_PICKUP = {0, 0}
	self.slap.AMMO_PICKUP = {0, 0}
	self.china.AMMO_PICKUP = {0, 0}
	self.arbiter.AMMO_PICKUP = {0, 0}
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
	
	self.gre_m79.desc_id = "bm_w_rpg7_desc"
	self.m32.desc_id = "bm_w_rpg7_desc"
	self.m95.desc_id = "bm_w_rpg7_desc"
	self.slap.desc_id = "bm_w_rpg7_desc"
	self.china.desc_id = "bm_w_rpg7_desc"
	self.arbiter.desc_id = "bm_w_rpg7_desc"
	self.m134.desc_id = "bm_w_rpg7_desc"
	self.shuno.desc_id = "bm_w_rpg7_desc"
	self.flamethrower_mk2.desc_id = "bm_w_rpg7_desc"
	self.system.desc_id = "bm_w_rpg7_desc"
	
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
	
	
	self.huntsman.stats_modifiers = 	{damage = 0.85}
	self.b682.stats_modifiers = 		{damage = 0.85}
	self.coach.stats_modifiers = 		{damage = 0.85}
	self.boot.stats_modifiers = 		{damage = 0.739}
	
	self.msr.stats_modifiers = 				{damage = 2.4, suppression = 3, spread = 0.83}
	self.model70.stats_modifiers = 			{damage = 2.4, suppression = 3}
	self.desertfox.stats_modifiers = 		{damage = 2.4, suppression = 3}
	self.r93.stats_modifiers = 				{damage = 2.4, suppression = 3, spread = 0.83}
	self.winchester1874.stats_modifiers = 	{damage = 3.029, suppression = 3, spread = 0.83}
	self.mosin.stats_modifiers = 			{damage = 2.4, suppression = 3, spread = 0.83}
	
	self.wa2000.stats_modifiers = 		{damage = 1.9, suppression = 3, spread = 0.67}
	self.tti.stats_modifiers = 			{damage = 1.8, suppression = 3, spread = 0.83}
	self.siltstone.stats_modifiers = 	{damage = 1.8, suppression = 3}
	
	self.m95.stats_modifiers = {damage = 24, suppression = 5, spread = 0.83}
	self.gre_m79.stats_modifiers = {damage = 3.4}
	self.rpg7.stats_modifiers = {damage = 100}
	self.m32.stats_modifiers = {damage = 3.4}
	self.peacemaker.stats_modifiers = {damage = 2}
	self.hunter.stats_modifiers = {damage = 2}
	self.contraband_m203.stats_modifiers = {damage = 3.4}
	self.elastic.stats_modifiers = {damage = 1.23}
	self.hunter.stats_modifiers = {damage = 1.5}
	self.ecp.stats_modifiers = {damage = 1.187}
	self.hajk.stats_modifiers = {damage = 0.738}

	
	self.slap.stats_modifiers = {damage = 3.4}
	self.china.stats_modifiers = {damage = 3.4}
	self.ray.stats_modifiers = {damage = 25}
	self.arbiter.stats_modifiers = {damage = 1.786}
	
	self.wa2000.fire_mode_data.fire_rate = 0.5

	self.flamethrower_mk2.CLIP_AMMO_MAX = 150
	self.flamethrower_mk2.NR_CLIPS_MAX = 4
	self.flamethrower_mk2.AMMO_MAX = self.flamethrower_mk2.CLIP_AMMO_MAX * self.flamethrower_mk2.NR_CLIPS_MAX
	self.system.CLIP_AMMO_MAX = 100
	self.system.NR_CLIPS_MAX = 4
	self.system.AMMO_MAX = self.system.CLIP_AMMO_MAX * self.system.NR_CLIPS_MAX

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
	
	self.hk21.AMMO_PICKUP = self:_pickup_chance(80, 1.5)
	self.m249.AMMO_PICKUP = self:_pickup_chance(90, 1.5)
	self.par.AMMO_PICKUP = self:_pickup_chance(90, 1.5)
	self.rpk.AMMO_PICKUP = self:_pickup_chance(100, 1.5)
	self.scorpion.AMMO_PICKUP = self:_pickup_chance(180, 1)
	self.tec9.AMMO_PICKUP = self:_pickup_chance(160, 1)
	self.uzi.AMMO_PICKUP = self:_pickup_chance(100, 1)
	self.mg42.AMMO_PICKUP = self:_pickup_chance(90, 1.5)
	self.sterling.AMMO_PICKUP = self:_pickup_chance(100, 1)
	self.m1928.AMMO_PICKUP = self:_pickup_chance(90, 1.5)
	self.l85a2.AMMO_PICKUP = self:_pickup_chance(90, 1.5)
	self.m134.AMMO_PICKUP = self:_pickup_chance(0, 2)
	self.shuno.AMMO_PICKUP = self:_pickup_chance(0, 2)
	self.flamethrower_mk2.AMMO_PICKUP = self:_pickup_chance(0, 1)
	self.system.AMMO_PICKUP = self:_pickup_chance(0, 1)
	
	self.m95.AMMO_PICKUP = {0.05, 0.65}
	self.msr.AMMO_PICKUP = {1, 1}
	self.r93.AMMO_PICKUP = {0.7, 1}
	self.mosin.AMMO_PICKUP = {0.7, 1}
	self.model70.AMMO_PICKUP = {0.7, 1}
	self.m32.AMMO_PICKUP = {0.05, 0.65}
	self.winchester1874.AMMO_PICKUP = {0.7, 1}	
end

function WeaponTweakData:_pickup_chance(max_ammo, selection_index)
	local low, high = nil

	if _G.IS_VR then
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
		else
			low = 0.01
			high = 0.035
		end
	elseif selection_index == PICKUP.AR_HIGH_CAPACITY then
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
	else
		low = 0.01
		high = 0.035
	end

	return {
		max_ammo * low,
		max_ammo * high
	}
end