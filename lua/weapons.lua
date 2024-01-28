if string.lower(RequiredScript) == "lib/tweak_data/weapontweakdata" then
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
		
		for id, _ in pairs(self) do
			if self[id].override then
				for ids, _ in pairs(self[id].override) do
					local overrides = self[id].override[ids]
					local slugs = {
						damage_near_mul = 2,
						damage_far_mul = 1.15,
						rays = 1,
						armor_piercing_add = 1,
						can_shoot_through_enemy = true,
						can_shoot_through_shield = true,
						can_shoot_through_wall = true,
						ammo_pickup_min_mul = 1,
						ammo_pickup_max_mul = 1
					}
					local explosive = {
						ignore_statistic = true,
						rays = 1,
						damage_near_mul = 2,
						damage_far_mul = 2.5,
						bullet_class = "InstantExplosiveBulletBase",
						ammo_pickup_min_mul = 0.5,
						ammo_pickup_max_mul = 0.7
					}
					local piercing = {
						damage_near_mul = 2,
						damage_far_mul = 1.7,
						armor_piercing_add = 1,
						ammo_pickup_min_mul = 0.9,
						ammo_pickup_max_mul = 1
					}
					if overrides.wpn_fps_upg_a_slug then
						overrides.wpn_fps_upg_a_slug.custom_stats = slugs
					end
					if overrides.wpn_fps_upg_a_explosive then
						overrides.wpn_fps_upg_a_explosive.custom_stats = explosive
					end
					if overrides.wpn_fps_upg_a_piercing then
						overrides.wpn_fps_upg_a_piercing.custom_stats = piercing
					end
					
					if overrides.wpn_fps_upg_ass_ak_b_zastava then
						overrides.wpn_fps_upg_ass_ak_b_zastava.custom_stats = {ammo_pickup_min_mul = 0.5, ammo_pickup_max_mul = 0.5}
					end
					if overrides.wpn_fps_upg_ass_m4_b_beowulf then
						overrides.wpn_fps_upg_ass_m4_b_beowulf.custom_stats = {ammo_pickup_min_mul = 0.8, ammo_pickup_max_mul = 0.8}
					end
					if overrides.stats then
						if overrides.stats.reload then
							overrides.stats.reload = math.round(overrides.stats.reload * 0.3)
						end
						if overrides.stats.damage then
							overrides.stats.damage = math.round(overrides.stats.damage * 0.454)
						end
					end
				end
			end
		end
		
		for id, _ in pairs(self.parts) do
			local part = self.parts[id]
			if part.stats then
				
				if part.stats.damage then
					if part.stats.damage >= 100 then
						part.stats.damage = math.round(part.stats.damage / 3.375)
					elseif part.stats.damage >= 60 then
						part.stats.damage = math.round(part.stats.damage / 1.340)
					elseif part.stats.damage <= -40 then
						part.stats.damage = math.round(part.stats.damage * 0.325)
					else
						part.stats.damage = math.round(part.stats.damage * 2)
					end
					if part.stats.damage == 4 then
						part.stats.damage = part.stats.damage + 1
					end
					if part.stats.damage == 6 or part.stats.damage == -6 then
						part.stats.damage = math.round(part.stats.damage / 0.857)
					end
					if part.stats.damage == 8 or part.stats.damage == -8 then
						part.stats.damage = math.round(part.stats.damage * 1.25)
					end
				end
			
				if part.sub_type == "silencer" then
					part.has_description = true
					if part.stats.alert_size then
						if part.stats.damage then
							if part.stats.damage <= -10 then
								part.stats.alert_size = math.round(part.stats.alert_size + (part.stats.damage * 0.27))
							else
								part.stats.alert_size = math.round(part.stats.alert_size + (part.stats.damage * 0.4))
							end
						end
						if part.stats.alert_size <= 4 then
							part.desc_id = "menu_silencer_radius_very_high"
						elseif part.stats.alert_size <= 5 then
							part.desc_id = "menu_silencer_radius_high"
						elseif part.stats.alert_size <= 8 then
							part.desc_id = "menu_silencer_radius_medium"
						elseif part.stats.alert_size <= 9 then
							part.desc_id = "menu_silencer_radius_small"
						else
							part.desc_id = "menu_silencer_radius_silent"
						end
					end
				end
				
				if part.type == "magazine" then
					if part.stats.reload then
						part.stats.reload = math.round(part.stats.reload * 0.3)
					end
				end
				
				-- if part.pcs then
					-- part.pcs = {10, 20, 30, 40}
				-- end
			end
		end

		self.parts.wpn_fps_upg_ns_pis_small.stats.damage = -6
		self.parts.wpn_fps_upg_ns_shot_shark.stats.damage = 7
		self.parts.wpn_fps_upg_pis_ns_flash.stats.damage = 2
		self.parts.wpn_fps_upg_ass_ns_surefire.stats.damage = 5
		self.parts.wpn_fps_upg_shot_ns_king.stats.damage = 5
		self.parts.wpn_fps_m4_upper_reciever_edge.stats.damage = 5
		self.parts.wpn_fps_upg_shot_ns_king.stats.damage = 5
		self.parts.wpn_fps_m4_uupg_b_sd.stats.damage = -5
		self.parts.wpn_fps_pis_g18c_co_1.stats.damage = 3
		self.parts.wpn_fps_pis_g18c_co_comp_2.stats.damage = 3
		self.parts.wpn_fps_ass_ak5_fg_ak5c.stats.damage = 3
		self.parts.wpn_fps_pis_deagle_b_long.stats.damage = 10
		self.parts.wpn_fps_pis_deagle_co_long.stats.damage = 10
		self.parts.wpn_fps_pis_deagle_co_short.stats.damage = 5
		self.parts.wpn_fps_smg_mp5_fg_mp5sd.stats.damage = -5
		self.parts.wpn_fps_pis_rage_b_comp1.stats.damage = 10
		self.parts.wpn_fps_pis_rage_b_comp2.stats.damage = 5
		self.parts.wpn_fps_smg_mp7_b_suppressed.stats.damage = -3
		self.parts.wpn_fps_lmg_hk21_b_long.stats.damage = -3
		self.parts.wpn_fps_lmg_m249_b_long.stats.damage = -3
		self.parts.wpn_fps_lmg_rpk_fg_standard.stats.damage = 3
		self.parts.wpn_fps_snp_m95_barrel_suppressed.stats.damage = -3
		self.parts.wpn_fps_snp_msr_ns_suppressor.stats.damage = -2
		self.parts.wpn_fps_snp_r93_b_suppressed.stats.damage = -2
		self.parts.wpn_fps_ass_g3_b_sniper.stats.damage = 32
		self.parts.wpn_fps_ass_famas_b_short.stats.damage = 5
		self.parts.wpn_fps_upg_a_slug.stats = {value = 5, total_ammo_mod = -10, damage = 15, spread = 2, moving_spread = 2}	
		self.parts.wpn_fps_upg_a_custom.stats = {value = 5, total_ammo_mod = -6, damage = 15}
		self.parts.wpn_fps_upg_a_custom_free.stats = {value = 5, total_ammo_mod = -6, damage = 15}
		self.parts.wpn_fps_upg_a_explosive.stats = {value = 5, total_ammo_mod = -10, damage = 15, spread = -3, moving_spread = 3}
		self.parts.wpn_fps_upg_a_piercing.stats = {value = 5, damage = -15, spread = 2 	}	
		self.parts.wpn_fps_upg_a_dragons_breath.stats = {value = 5, total_ammo_mod = -6, damage = -10, spread = -1, moving_spread = 3}
		self.parts.wpn_fps_upg_a_grenade_launcher_incendiary.stats.damage = -10
		self.parts.wpn_fps_upg_a_grenade_launcher_incendiary_arbiter.stats.damage = -8
		self.parts.wpn_fps_pis_c96_b_long.stats.damage = 5
		self.parts.wpn_fps_pis_c96_nozzle.stats.damage = 5
		self.parts.wpn_fps_snp_mosin_b_sniper.stats.damage = -2
		self.parts.wpn_fps_fla_mk2_mag_rare.stats = {value = 1, total_ammo_mod = 5, damage = -3}
		self.parts.wpn_fps_fla_mk2_mag_welldone.stats = {value = 1, total_ammo_mod = -5, damage = 4}
		self.parts.wpn_fps_sho_aa12_barrel_silenced.stats.damage = -5
		self.parts.wpn_fps_snp_winchester_b_suppressed.stats.damage = -2
		self.parts.wpn_fps_snp_wa2000_b_suppressed.stats.damage = -2
		self.parts.wpn_fps_smg_baka_b_smallsupp.stats.damage = -9
		self.parts.wpn_fps_snp_model70_ns_suppressor.stats.damage = -2
		self.parts.wpn_fps_ass_74_b_legend.stats.damage = 14
		self.parts.wpn_fps_shot_r870_b_legendary.stats.damage = 10
		self.parts.wpn_fps_sho_boot_fg_legendary.stats.damage = 20
		self.parts.wpn_fps_shot_shorty_fg_legendary.stats.damage = 15
		self.parts.wpn_fps_smg_sr2_ns_silencer.stats.damage = -5
		self.parts.wpn_fps_snp_desertfox_b_silencer.stats.damage = -2
		self.parts.wpn_fps_sho_rota_b_silencer.stats.damage = -1
		self.parts.wpn_fps_snp_tti_ns_hex.stats.damage = -2
		self.parts.wpn_fps_pis_deagle_b_modern.stats.damage = 10
		self.parts.wpn_fps_fla_system_m_high.stats.damage = 10
		self.parts.wpn_fps_fla_system_m_low.stats = {value = 1, total_ammo_mod = 5, damage = -3}
		self.parts.wpn_fps_fla_system_m_high.stats = {value = 1, total_ammo_mod = -5, damage = 7}
		self.wpn_fps_ass_m16.override.wpn_fps_upg_ass_m4_b_beowulf.stats = {value = 1, spread = 2, recoil = -8, total_ammo_mod = -11, damage = 30, concealment = -4}
		self.wpn_fps_ass_74.override.wpn_fps_upg_ass_ak_b_zastava.stats = {value = 1, spread = 2, recoil = -8, total_ammo_mod = -14, damage = 47, concealment = -4}
		self.parts.wpn_fps_ass_g3_b_sniper.stats = {value = 2, recoil = -2, spread = 2, concealment = -2, total_ammo_mod = -10, damage = 32, extra_ammo = -5}
		self.parts.wpn_fps_ass_g3_b_short.stats = {value = 2, recoil = 2, spread = -2, concealment = 4, damage = -13, total_ammo_mod = 5}
		self.parts.wpn_fps_upg_ass_ak_b_zastava.stats = {value = 1, spread = 2, recoil = -8, total_ammo_mod = -11, damage = 47, concealment = -4}
		self.parts.wpn_fps_upg_ass_m4_b_beowulf.stats = {value = 1, spread = 2, recoil = -8, total_ammo_mod = -14, damage = 32, concealment = -4}
		
		self.parts.wpn_fps_upg_i_autofire.forbids = {
			"wpn_fps_amcar_uupg_body_upperreciever",
			"wpn_fps_ass_m16_os_frontsight",
			"wpn_fps_ass_scar_o_flipups_up",
			"wpn_fps_upg_o_xpsg33_magnifier",
			"wpn_fps_upg_o_sig"
		}
		
		self.parts.wpn_fps_smg_p90_b_ninja.stats.concealment = -5
		self.parts.wpn_fps_smg_p90_b_civilian.stats.concealment = -3
		
		-- self.parts.wpn_fps_upg_a_dragons_breath.custom_stats.fire_dot_data.dot_damage = "1.5"
		-- self.parts.wpn_fps_upg_a_dragons_breath.custom_stats.fire_dot_data.dot_trigger_chance = "65"

		self.parts.wpn_fps_upg_ass_m4_b_beowulf.custom_stats.ammo_pickup_min_mul = 0.8
		self.parts.wpn_fps_upg_ass_m4_b_beowulf.custom_stats.ammo_pickup_max_mul = 0.8
		self.wpn_fps_ass_m16.override.wpn_fps_upg_ass_m4_b_beowulf.custom_stats.ammo_pickup_min_mul = 0.8
		self.wpn_fps_ass_m16.override.wpn_fps_upg_ass_m4_b_beowulf.custom_stats.ammo_pickup_max_mul = 0.8
		self.wpn_fps_ass_74.override.wpn_fps_upg_ass_ak_b_zastava.custom_stats.ammo_pickup_min_mul = 0.5
		self.wpn_fps_ass_74.override.wpn_fps_upg_ass_ak_b_zastava.custom_stats.ammo_pickup_max_mul = 0.5
		self.parts.wpn_fps_upg_ass_ak_b_zastava.custom_stats.ammo_pickup_min_mul = 0.5
		self.parts.wpn_fps_upg_ass_ak_b_zastava.custom_stats.ammo_pickup_max_mul = 0.5
	end
end
if string.lower(RequiredScript) == "lib/tweak_data/blackmarket/meleeweaponstweakdata" then
	local init_original = BlackMarketTweakData._init_melee_weapons

	function BlackMarketTweakData:_init_melee_weapons(...)
		init_original(self, ...)
		
		for _, melee in pairs(self.melee_weapons) do
			if melee.stats.max_damage >= 45 then
				melee.stats.max_damage = 17
			elseif melee.stats.max_damage >= 25 then
				melee.stats.max_damage = 10
			end
			if melee.fire_dot_data then
				melee.fire_dot_data.dot_damage = "1.5"
			end
		end
		
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
		
		for _, melee in pairs(self.melee_weapons) do
			if melee.stats.min_damage >= 7 or melee.stats.max_damage >= 15 then
				melee.locks = {func = "unlock_overpowered_weapons"}
			end
			if melee.tase_data then
				melee.locks = {func = "unlock_overpowered_weapons"}
			end
		end
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
		self.projectiles.pocket_ecm_jammer.base_cooldown = nil
		self.projectiles.chico_injector.max_amount = 3
		self.projectiles.concussion.max_amount = 3
		self.projectiles.smoke_screen_grenade.max_amount = 3
		self.projectiles.pocket_ecm_jammer.max_amount = 3
	end
end
if string.lower(RequiredScript) == "lib/tweak_data/tweakdata" then
		for id, _ in pairs(tweak_data.projectiles) do
			local projectile = tweak_data.projectiles[id]
			if projectile.damage then
			
				if projectile.damage >= 500 then
					projectile.damage = math.round(projectile.damage / 1.25)
				elseif projectile.damage >= 200 then
					projectile.damage = math.round(projectile.damage * 0.325)
				elseif projectile.damage >= 140 then
					projectile.damage = math.round(projectile.damage * 0.1875)
				elseif projectile.damage >= 48 then
					projectile.damage = math.round(projectile.damage * 0.2615)
				elseif projectile.damage >= 30 then
					projectile.damage = math.round(projectile.damage * 0.285)
				end
				
				if projectile.bullet_class == "InstantExplosiveBulletBase" then
					if projectile.damage >= 26 then
						projectile.damage = math.round(projectile.damage * 3.269)
					elseif projectile.damage >= 20 then
						projectile.damage = math.round(projectile.damage * 1.575)
					else
						projectile.damage = math.round(projectile.damage * 1.153)
					end
				end
			end
			
			if projectile.fire_dot_data then
				projectile.fire_dot_data.dot_damage = 1
				projectile.fire_dot_data.dot_length = 3
			end
			
			if projectile.range then
				if projectile.range >= 50 then
					projectile.range = projectile.range * 2
				end
			end
		end

	local self = tweak_data
	self.projectiles.launcher_frag_china.damage = 34
	self.projectiles.launcher_frag_arbiter.damage = 17
	self.projectiles.west_arrow.damage = 19.5
	self.projectiles.west_arrow_exp.damage = 26
	self.projectiles.bow_poison_arrow.damage = 6.5
	self.projectiles.crossbow_poison_arrow.damage = 3.2
	self.projectiles.wpn_prj_jav.damage = 110
	self.projectiles.arblast_arrow.damage = 52.5
	self.projectiles.arblast_poison_arrow.damage = 19.6
	self.projectiles.arblast_arrow_exp.damage = 70
	self.projectiles.frankish_arrow.damage = 24
	self.projectiles.frankish_poison_arrow.damage = 9
	self.projectiles.frankish_arrow_exp.damage = 31.5
	self.projectiles.long_poison_arrow.damage = 30
	self.projectiles.wpn_prj_hur.damage = 10
	self.projectiles.wpn_prj_target.damage = 10
	self.projectiles.frag_com.damage = 30
	self.projectiles.rocket_ray_frag.damage = 500
	self.projectiles.ecp_arrow.damage = 24
	self.projectiles.ecp_arrow_poison.damage = 9
	self.projectiles.ecp_arrow_exp.damage = 31.5
	self.projectiles.elastic_arrow_poison.damage = 30
	self.dot_types.poison.dot_length = 10
	self.dot_types.poison.dot_damage = 2
	self.dot_types.poison.hurt_animation_chance = 0.5
end
if string.lower(RequiredScript) == "lib/units/weapons/raycastweaponbase" then
	local mvec_to = Vector3()
	local mvec_spread_direction = Vector3()
	
	function RaycastWeaponBase:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul)
		if self:gadget_overrides_weapon_functions() then
			return self:gadget_function_override("_fire_raycast", self, user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul)
		end

		local result = {}
		local spread_x, spread_y = self:_get_spread(user_unit)
		local ray_distance = self:weapon_range()
		local right = direction:cross(Vector3(0, 0, 1)):normalized()
		local up = direction:cross(right):normalized()
		local theta = math.random() * 360
		local ax = math.sin(theta) * math.random() * spread_x * (spread_mul or 1)
		local ay = math.cos(theta) * math.random() * spread_y * (spread_mul or 1)

		mvector3.set(mvec_spread_direction, direction)
		mvector3.add(mvec_spread_direction, right * math.rad(ax))
		mvector3.add(mvec_spread_direction, up * math.rad(ay))
		mvector3.set(mvec_to, mvec_spread_direction)
		mvector3.multiply(mvec_to, ray_distance)
		mvector3.add(mvec_to, from_pos)

		local damage = self:_get_current_damage(dmg_mul)
		local ray_hits, hit_enemy = self:_collect_hits(from_pos, mvec_to)
		local hit_anyone = false
		local auto_hit_candidate, suppression_enemies = self:check_autoaim(from_pos, direction)

		if suppression_enemies and self._suppression then
			result.enemies_in_cone = suppression_enemies
		end

		if self._autoaim then
			local weight = 0.1

			if auto_hit_candidate and not hit_enemy then
				local autohit_chance = 1 - math.clamp((self._autohit_current - self._autohit_data.MIN_RATIO) / (self._autohit_data.MAX_RATIO - self._autohit_data.MIN_RATIO), 0, 1)

				if autohit_mul then
					autohit_chance = autohit_chance * autohit_mul
				end

				if math.random() < autohit_chance then
					self._autohit_current = (self._autohit_current + weight) / (1 + weight)

					mvector3.set(mvec_to, from_pos)
					mvector3.add_scaled(mvec_to, auto_hit_candidate.ray, ray_distance)

					ray_hits, hit_enemy = self:_collect_hits(from_pos, mvec_to)
				end
			end

			if hit_enemy then
				self._autohit_current = (self._autohit_current + weight) / (1 + weight)
			elseif auto_hit_candidate then
				self._autohit_current = self._autohit_current / (1 + weight)
			end
		end

		local hit_count = 0
		local cop_kill_count = 0
		local hit_through_wall = false
		local hit_through_shield = false
		local hit_result = nil

		for _, hit in ipairs(ray_hits) do
			damage = self:get_damage_falloff(damage, hit, user_unit)
			
			hit_result = nil

			if damage > 0 then
				hit_result = self._bullet_class:on_collision(hit, self._unit, user_unit, damage)
			end

			if hit_result and hit_result.type == "death" then
				local unit_type = hit.unit:base() and hit.unit:base()._tweak_table
				local is_civilian = unit_type and CopDamage.is_civilian(unit_type)

				if not is_civilian then
					cop_kill_count = cop_kill_count + 1
				end

				if self:is_category(tweak_data.achievement.easy_as_breathing.weapon_type) and not is_civilian then
					self._kills_without_releasing_trigger = (self._kills_without_releasing_trigger or 0) + 1

					if tweak_data.achievement.easy_as_breathing.count <= self._kills_without_releasing_trigger then
						managers.achievment:award(tweak_data.achievement.easy_as_breathing.award)
					end
				end
			end

			if hit_result then
				hit.damage_result = hit_result
				hit_anyone = true
				hit_count = hit_count + 1
			end
			
			if hit.unit:in_slot(managers.slot:get_mask("world_geometry")) then
				hit_through_wall = true
				damage = damage * 0.5
			elseif hit.unit:in_slot(managers.slot:get_mask("enemy_shield_check")) then
				hit_through_shield = hit_through_shield or alive(hit.unit:parent())
				damage = damage * 0.2
			end
			
			
			if hit_result and hit_result.type == "death" and cop_kill_count > 0 then
				local unit_type = hit.unit:base() and hit.unit:base()._tweak_table
				local multi_kill, enemy_pass, obstacle_pass, weapon_pass, weapons_pass, weapon_type_pass = nil

				for achievement, achievement_data in pairs(tweak_data.achievement.sniper_kill_achievements) do
					multi_kill = not achievement_data.multi_kill or cop_kill_count == achievement_data.multi_kill
					enemy_pass = not achievement_data.enemy or unit_type == achievement_data.enemy
					obstacle_pass = not achievement_data.obstacle or achievement_data.obstacle == "wall" and hit_through_wall or achievement_data.obstacle == "shield" and hit_through_shield
					weapon_pass = not achievement_data.weapon or self._name_id == achievement_data.weapon
					weapons_pass = not achievement_data.weapons or table.contains(achievement_data.weapons, self._name_id)
					weapon_type_pass = not achievement_data.weapon_type or self:is_category(achievement_data.weapon_type)

					if multi_kill and enemy_pass and obstacle_pass and weapon_pass and weapons_pass and weapon_type_pass then
						if achievement_data.stat then
							managers.achievment:award_progress(achievement_data.stat)
						elseif achievement_data.award then
							managers.achievment:award(achievement_data.award)
						elseif achievement_data.challenge_stat then
							managers.challenge:award_progress(achievement_data.challenge_stat)
						elseif achievement_data.trophy_stat then
							managers.custom_safehouse:award(achievement_data.trophy_stat)
						elseif achievement_data.challenge_award then
							managers.challenge:award(achievement_data.challenge_award)
						end
					end
				end
			end
		end

		if not tweak_data.achievement.tango_4.difficulty or table.contains(tweak_data.achievement.tango_4.difficulty, Global.game_settings.difficulty) then
			if self._gadgets and table.contains(self._gadgets, "wpn_fps_upg_o_45rds") and cop_kill_count > 0 and managers.player:player_unit():movement():current_state():in_steelsight() then
				if self._tango_4_data then
					if self._gadget_on == self._tango_4_data.last_gadget_state then
						self._tango_4_data = nil
					else
						self._tango_4_data.last_gadget_state = self._gadget_on
						self._tango_4_data.count = self._tango_4_data.count + 1
					end

					if self._tango_4_data and tweak_data.achievement.tango_4.count <= self._tango_4_data.count then
						managers.achievment:_award_achievement(tweak_data.achievement.tango_4, "tango_4")
					end
				else
					self._tango_4_data = {
						count = 1,
						last_gadget_state = self._gadget_on
					}
				end
			elseif self._tango_4_data then
				self._tango_4_data = nil
			end
		end

		result.hit_enemy = hit_anyone

		if self._autoaim then
			self._shot_fired_stats_table.hit = hit_anyone
			self._shot_fired_stats_table.hit_count = hit_count

			if (not self._ammo_data or not self._ammo_data.ignore_statistic) and not self._rays then
				managers.statistics:shot_fired(self._shot_fired_stats_table)
			end
		end

		local furthest_hit = ray_hits[#ray_hits]

		if (furthest_hit and furthest_hit.distance > 600 or not furthest_hit) and alive(self._obj_fire) then
			self._obj_fire:m_position(self._trail_effect_table.position)
			mvector3.set(self._trail_effect_table.normal, mvec_spread_direction)

			local trail = World:effect_manager():spawn(self._trail_effect_table)

			if furthest_hit then
				World:effect_manager():set_remaining_lifetime(trail, math.clamp((furthest_hit.distance - 600) / 10000, 0, furthest_hit.distance))
			end
		end

		if self._alert_events then
			result.rays = ray_hits
		end

		return result
	end
end
if string.lower(RequiredScript) == "lib/utils/inventorydescription" then
	WeaponDescription._stats_shown[5].percent = false
	WeaponDescription._stats_shown[6].percent = false
end