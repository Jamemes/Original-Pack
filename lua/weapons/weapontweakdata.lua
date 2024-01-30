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
	
	self.peacemaker.unlock_func = "unlock_overpowered_weapons"
	self.wa2000.unlock_func = "unlock_overpowered_weapons"

	for id, _ in pairs(self) do
		local weapons = self[id]
		if weapons.stats then
			local dmg = weapons.stats.damage
			local spread = weapons.stats.spread
			local spread_m = weapons.stats.spread_moving
			local recoil = weapons.stats.recoil
			
			if weapons.categories[1] == "akimbo" then
				if weapons.categories[2] == "pistol" then
					weapons.unlock_func = "unlock_akimbo_pistols"
				end
				if weapons.categories[2] == "shotgun" then
					weapons.unlock_func = "unlock_akimbo_shotguns"
				end
				if weapons.categories[2] == "smg" then
					weapons.unlock_func = "unlock_akimbo_smg"
				end
			end
			
			if weapons.categories[1] == "assault_rifle" then
				local mul_dmg = dmg < 50 and 0.675 or dmg < 60 and 0.57 or dmg < 100 and 0.32 or 0.47
				local mul_spread = spread >= 19 and 0.368 or spread >= 13 and 0.461 or 0.6
				local mul_recoil = recoil <= 12 and 0.416 or recoil <= 15 and 0.6 or 0.4
				local mul_spread_moving = 0.75
				
				weapons.stats.damage = math.round(weapons.stats.damage * mul_dmg)
				weapons.stats.spread = math.round(weapons.stats.spread * mul_spread)
				weapons.stats.recoil = math.round(weapons.stats.recoil * mul_recoil)
				weapons.stats.spread_moving = math.round(weapons.stats.spread_moving * mul_spread_moving)
			end
			
			if weapons.categories[1] == "shotgun" or weapons.categories[2] == "shotgun" then
				local mul_dmg = dmg < 100 and 0.67 or 0.55
				local mul_spread = 0.75
				local mul_recoil = 0.333
				local mul_spread_moving = 0.875
				
				weapons.stats.damage = math.round(weapons.stats.damage * mul_dmg)
				weapons.stats.spread = math.round(weapons.stats.spread * mul_spread)
				weapons.stats.recoil = math.round(weapons.stats.recoil * mul_recoil)
				weapons.stats.spread_moving = math.round(weapons.stats.spread_moving * mul_spread_moving)
				
				if weapons.has_magazine then
					weapons.stats.damage = math.round(weapons.stats.damage * 1.25)
				end
				if weapons.use_data.selection_index == 1 then
					local mul = dmg < 100 and 1.09 or 1
					weapons.stats.damage = math.round(weapons.stats.damage * mul)
				end
			end
			
			if weapons.categories[1] == "lmg" then
				local mul_spread = spread >= 13 and 0.3376 or 0.625
				local mul_recoil = recoil >= 8 and 0.7 or 2
				
				weapons.stats.damage = math.round(30 * (weapons.auto.fire_rate * 12.175))
				weapons.stats.spread = math.round(weapons.stats.spread * mul_spread)
				weapons.stats.recoil = math.round(weapons.stats.recoil * mul_recoil)
				
			end
			
			if weapons.categories[1] == "snp" then
				local mul_spread = 0.3913
				local mul_recoil = 0.55
				local mul_spread_moving = 0.3636
				table.insert(weapons.stats_modifiers, suppression)
				table.insert(weapons.stats_modifiers, spread)
				weapons.stats_modifiers.suppression = weapons.stats_modifiers.damage >= 35 and 5 or 4
				weapons.stats_modifiers.spread = 0.83
				
				local dmg_mul = weapons.single.fire_rate > 1 and 130 or 95
				local dmg_mod_mul = weapons.stats_modifiers.damage > 10 and 288 or weapons.CLIP_AMMO_MAX < 10 and 2 or 1
				weapons.stats.damage = weapons.stats_modifiers.damage >= 35 and 10 or weapons.stats_modifiers.damage >= 4 and 125 or dmg_mul
				weapons.stats_modifiers.damage = dmg_mod_mul
				weapons.stats.spread = math.round(weapons.stats.spread * mul_spread)
				weapons.stats.recoil = math.round(weapons.stats.recoil * mul_recoil)
				weapons.stats.spread_moving = math.round(weapons.stats.spread_moving * mul_spread_moving)
				
				if weapons.stats_modifiers.damage > 10 then
					weapons.unlock_func = "unlock_overpowered_weapons"
				end
			end
			
			if weapons.categories[1] == "pistol" or weapons.categories[2] == "pistol" then
				local mul_dmg = dmg < 40 and 0.48 or dmg < 100 and 0.36 or dmg < 150 and 0.375 or 0.315
				local mul_spread = 0.4117
				local mul_recoil = 0.74
				local mul_spread_moving = 0.444
	
				weapons.stats.damage = math.round(weapons.stats.damage * mul_dmg)
				weapons.stats.spread = math.round(weapons.stats.spread * mul_spread)
				weapons.stats.recoil = math.round(weapons.stats.recoil * mul_recoil)
				weapons.stats.spread_moving = math.round(weapons.stats.spread_moving * mul_spread_moving)
			end
			
			if weapons.categories[1] == "smg" or weapons.categories[2] == "smg" then
				local mul_dmg = dmg < 50 and 0.4 or dmg < 60 and 0.435 or 0.35
				local mul_spread = 0.3846
				local mul_recoil = 0.3529
				local mul_spread_moving = 0.444

				weapons.stats.damage = math.round(weapons.stats.damage * mul_dmg)
				weapons.stats.spread = math.round(weapons.stats.spread * mul_spread)
				weapons.stats.recoil = math.round(weapons.stats.recoil * mul_recoil)
				weapons.stats.spread_moving = math.round(weapons.stats.spread_moving * mul_spread_moving)
			end
			
			if weapons.categories[1] == "bow" then
				local dmg_mod = weapons.stats_modifiers.damage > 10 and 65 or 19.5
				local mul_spread = 0.4
				local mul_recoil = 0.56
				
				weapons.stats.damage = 10
				weapons.stats_modifiers.damage = dmg_mod
				weapons.stats.spread = math.round(weapons.stats.spread * mul_spread)
				weapons.stats.recoil = math.round(weapons.stats.recoil * mul_recoil)
				if dmg_mod > 25 then
					weapons.unlock_func = "unlock_overpowered_weapons"
				end
			end
			
			if weapons.categories[1] == "crossbow" then
				local dmg_mod = weapons.stats.damage >= 35 and weapons.stats.damage < 40 and 10 or weapons.stats_modifiers.damage > 10 and 52.5 or 24
				local mul_spread = 0.4
				local mul_recoil = 0.32
				
				weapons.stats.damage = 10
				weapons.stats_modifiers.damage = dmg_mod
				weapons.stats.spread = math.round(weapons.stats.spread * mul_spread)
				weapons.stats.recoil = math.round(weapons.stats.recoil * mul_recoil)
				if weapons.stats_modifiers.damage > 10 then
					weapons.unlock_func = "unlock_overpowered_weapons"
				end
			end
			
			if weapons.categories[1] == "grenade_launcher" then
				weapons.stats.recoil = math.round(weapons.stats.recoil * 0.12)
				
				if weapons.stats_modifiers and weapons.stats_modifiers.damage >= 100 then
					weapons.stats.damage = math.round(weapons.stats.damage / 1.25)
					weapons.stats.spread = math.round(weapons.stats.spread * 0.4)
				else
					local damage = dmg > 50 and 34 or 17
					weapons.stats.damage = math.round(damage)
					weapons.stats.spread = math.round(weapons.stats.spread * 0.28)
				end
				weapons.unlock_func = "unlock_overpowered_weapons"
			end
			
			if weapons.categories[1] == "minigun" then
				local mul_spread = 0.555
				local mul_recoil = 0.2857
				
				weapons.stats.spread = math.round(weapons.stats.spread * mul_spread)
				weapons.stats.recoil = math.round(weapons.stats.recoil * mul_recoil)
				weapons.unlock_func = "unlock_overpowered_weapons"
			end
			
			if weapons.categories[1] == "flamethrower" then
				weapons.unlock_func = "unlock_overpowered_weapons"
			end
		end
	end

	self.amcar.stats.damage = 16
	self.scar.stats.damage = 43
	self.corgi.stats.damage = 32
	self.ak74.stats.damage = 28
	self.new_m4.stats.damage = 23
	self.aug.stats.damage = 28
	self.sub2000.stats.damage = 85
	self.akm.stats.damage = 40
	self.g36.stats.damage = 25
	self.flint.stats.damage = 43
	self.akm_gold.stats.damage = 40
	self.famas.stats.damage = 25
	self.asval.stats.damage = 38
	self.ak5.stats.damage = 20
	self.galil.stats.damage = 33
	self.fal.stats.damage = 43
	self.g3.stats.damage = 43
	self.ching.stats.damage = 95
	self.spas12.stats.damage = 48
	self.benelli.stats.damage = 35
	self.basset.stats.damage = 25
	self.striker.stats.damage = 35
	self.judge.stats.damage = 95
	self.x_rota.stats.damage = self.rota.stats.damage
	self.x_basset.stats.damage = self.basset.stats.damage
	self.x_judge.stats.damage = self.judge.stats.damage
	self.rpk.stats.damage = 30
	self.hk21.stats.damage = 33
	self.mg42.stats.damage = 30
	self.wa2000.stats.damage = 175
	self.winchester1874.stats.damage = 175
	self.usp.stats.damage = 20
	self.glock_17.stats.damage = 15
	self.c96.stats.damage = 33
	self.hs2000.stats.damage = 18
	self.glock_18c.stats.damage = 20
	self.peacemaker.stats.damage = 144
	self.mateba.stats.damage = 95
	self.breech.stats.damage = 95
	self.x_breech.stats.damage = self.breech.stats.damage
	self.x_2006m.stats.damage = self.mateba.stats.damage
	self.x_g18c.stats.damage = self.glock_18c.stats.damage
	self.x_hs2000.stats.damage = self.hs2000.stats.damage
	self.x_c96.stats.damage = self.c96.stats.damage
	self.x_g17.stats.damage = self.glock_17.stats.damage
	self.x_usp.stats.damage = self.usp.stats.damage
	self.m45.stats.damage = 28
	self.mp7.stats.damage = 28
	self.m1928.stats.damage = 23
	self.mp9.stats.damage = 20
	self.olympic.stats.damage = 20
	self.baka.stats.damage = 25
	self.akmsu.stats.damage = 25
	self.tec9.stats.damage = 25
	self.p90.stats.damage = 20
	self.polymer.stats.damage = 28
	self.sterling.stats.damage = 35
	self.uzi.stats.damage = 28
	self.erma.stats.damage = 42
	self.x_erma.stats.damage = self.erma.stats.damage
	self.x_uzi.stats.damage = self.uzi.stats.damage
	self.x_sterling.stats.damage = self.sterling.stats.damage
	self.x_polymer.stats.damage = self.polymer.stats.damage
	self.x_p90.stats.damage = self.p90.stats.damage
	self.x_tec9.stats.damage = self.tec9.stats.damage
	self.x_akmsu.stats.damage = self.akmsu.stats.damage
	self.x_baka.stats.damage = self.baka.stats.damage
	self.x_olympic.stats.damage = self.olympic.stats.damage
	self.x_mp9.stats.damage = self.mp9.stats.damage
	self.x_m1928.stats.damage = self.m1928.stats.damage
	self.x_mp7.stats.damage = self.mp7.stats.damage
	self.x_m45.stats.damage = self.m45.stats.damage
	self.m134.stats.damage = 38
	self.shuno.stats.damage = 40
	self.flamethrower_mk2.stats.damage = 14
	self.system.stats.damage = 14
	
	self.sub2000.stats.spread = 8
	self.akm.stats.spread = 6
	self.akm_gold.stats.spread = self.akm.stats.spread
	self.l85a2.stats.spread = 7
	self.new_m14.stats.spread = 9
	self.famas.stats.spread = 8
	self.vhs.stats.spread = 9
	self.asval.stats.spread = 9
	self.ak5.stats.spread = 9
	self.galil.stats.spread = 7
	self.m16.stats.spread = 7
	self.fal.stats.spread = 6
	self.ksg.stats.spread = 6
	self.huntsman.stats.spread = 7
	self.b682.stats.spread = 8
	self.aa12.stats.spread = 7
	self.judge.stats.spread = 4
	self.serbu.stats.spread = 5
	self.x_judge.stats.spread = self.judge.stats.spread
	self.wa2000.stats.spread = 8
	self.winchester1874.stats.spread = 8
	self.ppk.stats.spread = 9
	self.b92fs.stats.spread = 8
	self.new_raging_bull.stats.spread = 7
	self.g22c.stats.spread = 6
	self.c96.stats.spread = 6
	self.g26.stats.spread = 7
	self.glock_18c.stats.spread = 5
	self.peacemaker.stats.spread = 8
	self.deagle.stats.spread = 6
	self.x_deagle.stats.spread = self.deagle.stats.spread
	self.x_g18c.stats.spread = self.glock_18c.stats.spread
	self.jowi.stats.spread = self.g26.stats.spread
	self.x_c96.stats.spread = self.c96.stats.spread
	self.x_g22c.stats.spread = self.g22c.stats.spread
	self.x_rage.stats.spread = self.new_raging_bull.stats.spread
	self.x_b92fs.stats.spread = self.b92fs.stats.spread
	self.x_ppk.stats.spread = self.ppk.stats.spread		
	self.m45.stats.spread = 6
	self.cobray.stats.spread = 4
	self.new_mp5.stats.spread = 7
	self.m1928.stats.spread = 7
	self.scorpion.stats.spread = 6
	self.mp9.stats.spread = 7
	self.olympic.stats.spread = 8
	self.baka.stats.spread = 4
	self.akmsu.stats.spread = 5
	self.tec9.stats.spread = 7
	self.p90.stats.spread = 8
	self.sterling.stats.spread = 7
	self.uzi.stats.spread = 8
	self.x_uzi.stats.spread = self.uzi.stats.spread
	self.x_sterling.stats.spread = self.sterling.stats.spread
	self.x_p90.stats.spread = self.p90.stats.spread
	self.x_tec9.stats.spread = self.tec9.stats.spread
	self.x_akmsu.stats.spread = self.akmsu.stats.spread
	self.x_baka.stats.spread = self.baka.stats.spread
	self.x_olympic.stats.spread = self.olympic.stats.spread
	self.x_mp9.stats.spread = self.mp9.stats.spread
	self.x_scorpion.stats.spread = self.scorpion.stats.spread
	self.x_m1928.stats.spread = self.m1928.stats.spread
	self.x_mp5.stats.spread = self.new_mp5.stats.spread
	self.x_cobray.stats.spread = self.cobray.stats.spread
	self.x_m45.stats.spread = self.m45.stats.spread
	self.m32.stats.spread = 3

	self.new_m4.stats.recoil = 7
	self.g36.stats.recoil = 8
	self.l85a2.stats.recoil = 10
	self.new_m14.stats.recoil = 2
	self.famas.stats.recoil = 5
	self.vhs.stats.recoil = 4
	self.asval.stats.recoil = 6
	self.ak5.stats.recoil = 12
	self.galil.stats.recoil = 8
	self.m16.stats.recoil = 10
	self.g3.stats.recoil = 4
	self.benelli.stats.recoil = 5
	self.ksg.stats.recoil = 5
	self.huntsman.stats.recoil = 2
	self.b682.stats.recoil = 10
	self.aa12.stats.recoil = 7
	self.judge.stats.recoil = 2
	self.x_judge.stats.recoil = self.judge.stats.recoil
	self.hk21.stats.recoil = 5
	self.msr.stats.recoil = 2
	self.winchester1874.stats.recoil = 5
	self.mosin.stats.recoil = 3
	self.glock_17.stats.recoil = 13
	self.ppk.stats.recoil = 9
	self.p226.stats.recoil = 7
	self.colt_1911.stats.recoil = 5	
	self.b92fs.stats.recoil = 8
	self.new_raging_bull.stats.recoil = 2
	self.g22c.stats.recoil = 13
	self.c96.stats.recoil = 7
	self.g26.stats.recoil = 9
	self.hs2000.stats.recoil = 7
	self.glock_18c.stats.recoil = 6
	self.peacemaker.stats.recoil = 6
	self.mateba.stats.recoil = 10
	self.deagle.stats.recoil = 3
	self.x_deagle.stats.recoil = self.deagle.stats.recoil
	self.x_2006m.stats.recoil = self.mateba.stats.recoil
	self.x_g18c.stats.recoil = self.glock_18c.stats.recoil
	self.x_hs2000.stats.recoil = self.hs2000.stats.recoil
	self.jowi.stats.recoil = self.g26.stats.recoil
	self.x_c96.stats.recoil = self.c96.stats.recoil
	self.x_g22c.stats.recoil = self.g22c.stats.recoil
	self.x_rage.stats.recoil = self.new_raging_bull.stats.recoil
	self.x_b92fs.stats.recoil = self.b92fs.stats.recoil
	self.x_1911.stats.recoil = self.colt_1911.stats.recoil
	self.x_p226.stats.recoil = self.p226.stats.recoil
	self.x_ppk.stats.recoil = self.ppk.stats.recoil
	self.x_g17.stats.recoil = self.glock_17.stats.recoil
	self.m45.stats.recoil = 7
	self.mp7.stats.recoil = 8
	self.cobray.stats.recoil = 8
	self.new_mp5.stats.recoil = 11
	self.m1928.stats.recoil = 10
	self.scorpion.stats.recoil = 7
	self.olympic.stats.recoil = 10
	self.baka.stats.recoil = 4
	self.akmsu.stats.recoil = 6
	self.p90.stats.recoil = 9
	self.polymer.stats.recoil = 9
	self.uzi.stats.recoil = 10
	self.x_uzi.stats.recoil = self.uzi.stats.recoil
	self.x_polymer.stats.recoil = self.polymer.stats.recoil
	self.x_p90.stats.recoil = self.p90.stats.recoil
	self.x_akmsu.stats.recoil = self.akmsu.stats.recoil
	self.x_baka.stats.recoil = self.baka.stats.recoil
	self.x_olympic.stats.recoil = self.olympic.stats.recoil
	self.x_scorpion.stats.recoil = self.scorpion.stats.recoil
	self.x_m1928.stats.recoil = self.m1928.stats.recoil
	self.x_mp5.stats.recoil = self.new_mp5.stats.recoil
	self.x_cobray.stats.recoil = self.cobray.stats.recoil
	self.x_mp7.stats.recoil = self.mp7.stats.recoil
	self.x_m45.stats.recoil = self.m45.stats.recoil
	self.m32.stats.recoil = 9

	local function ammo(weapon_name, pickup_index, max_clip, clip)
		self[weapon_name].CLIP_AMMO_MAX = clip or self[weapon_name].CLIP_AMMO_MAX
		self[weapon_name].NR_CLIPS_MAX = max_clip or self[weapon_name].NR_CLIPS_MAX
		self[weapon_name].AMMO_MAX = self[weapon_name].CLIP_AMMO_MAX * self[weapon_name].NR_CLIPS_MAX
		self[weapon_name].AMMO_PICKUP = self:_pickup_chance(self[weapon_name].AMMO_MAX, pickup_index or 1)
	end
	
	local PICKUP = {
		AR_LOW_CAPACITY = 7,
		SHOTGUN_HIGH_CAPACITY = 4,
		OTHER = 1,
		LMG_CAPACITY = 9,
		AR_MED_CAPACITY = 3,
		SNIPER_HIGH_DAMAGE = 6,
		AR_HIGH_CAPACITY = 2,
		SNIPER_LOW_DAMAGE = 5,
		AR_DMR_CAPACITY = 8
	}

	ammo("amcar", PICKUP.AR_HIGH_CAPACITY, 9)
	ammo("aug", PICKUP.AR_MED_CAPACITY, 4)
	ammo("g36", PICKUP.AR_HIGH_CAPACITY, 6)
	ammo("scar", PICKUP.AR_LOW_CAPACITY, 4, 20)
	ammo("s552", PICKUP.AR_HIGH_CAPACITY, 5)
	ammo("fal", PICKUP.AR_LOW_CAPACITY, 5)
	ammo("famas", PICKUP.AR_HIGH_CAPACITY, 5)
	ammo("galil", PICKUP.AR_MED_CAPACITY, 4)
	ammo("l85a2", PICKUP.AR_MED_CAPACITY, 6)
	ammo("g3", PICKUP.AR_LOW_CAPACITY, 4, 20)
	ammo("asval", PICKUP.AR_HIGH_CAPACITY, 8, 20)
	ammo("spas12", PICKUP.SHOTGUN_HIGH_CAPACITY, 6)
	ammo("b682", PICKUP.OTHER, 13)
	ammo("r870", PICKUP.OTHER, 8)
	ammo("benelli", PICKUP.SHOTGUN_HIGH_CAPACITY, 9)
	ammo("ksg", PICKUP.OTHER, 8)
	ammo("judge", PICKUP.SNIPER_HIGH_DAMAGE, 4)
	ammo("x_judge", PICKUP.SNIPER_HIGH_DAMAGE, 4)
	ammo("serbu", PICKUP.OTHER, 5)
	ammo("striker", PICKUP.SHOTGUN_HIGH_CAPACITY, 4)
	ammo("msr", PICKUP.SNIPER_LOW_DAMAGE, 5)
	
	self.flamethrower_mk2.CLIP_AMMO_MAX = 150
	self.flamethrower_mk2.NR_CLIPS_MAX = 4
	self.flamethrower_mk2.AMMO_MAX = self.flamethrower_mk2.CLIP_AMMO_MAX * self.flamethrower_mk2.NR_CLIPS_MAX
	self.system.CLIP_AMMO_MAX = 100
	self.system.NR_CLIPS_MAX = 4
	self.system.AMMO_MAX = self.system.CLIP_AMMO_MAX * self.system.NR_CLIPS_MAX
end