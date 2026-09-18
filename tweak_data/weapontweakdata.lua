require("lib/tweak_data/WeaponFactoryTweakData")
WeaponTweakData_37 = WeaponTweakData_37 or class()

function WeaponTweakData_37:init(tweak_data)
	self:_create_table_structure()
	self:_create_table_structure_wip()
	self:_init_data_npc_melee()
	self:_init_data_player_weapons(tweak_data)
	self:_init_data_m4_npc()
	self:_init_data_m14_npc()
	self:_init_data_m14_sniper_npc()
	self:_init_data_c45_npc()
	self:_init_data_beretta92_npc()
	self:_init_data_raging_bull_npc()
	self:_init_data_r870_npc()
	self:_init_data_mossberg_npc()
	self:_init_data_mp5_npc()
	self:_init_data_mac11_npc()
	self:_init_data_glock_18_npc()
	self:_init_data_ak47_npc()
	self:_init_data_g36_npc()
	self:_init_data_g17_npc()
	self:_init_data_mp9_npc()
	self:_init_data_olympic_npc()
	self:_init_data_m16_npc()
	self:_init_data_aug_npc()
	self:_init_data_ak74_npc()
	self:_init_data_ak5_npc()
	self:_init_data_p90_npc()
	self:_init_data_amcar_npc()
	self:_init_data_mac10_npc()
	self:_init_data_akmsu_npc()
	self:_init_data_akm_npc()
	self:_init_data_akm_gold_npc()
	self:_init_data_deagle_npc()
	self:_init_data_serbu_npc()
	self:_init_data_saiga_npc()
	self:_init_data_huntsman_npc()
	self:_init_data_saw_npc()
	self:_init_data_sentry_gun_npc()
	self:_init_data_usp_npc()
	self:_init_data_g22c_npc()
	self:_init_data_judge_npc()
	self:_init_data_m45_npc()
	self:_init_data_s552_npc()
	self:_init_data_ppk_npc()
	self:_init_data_mp7_npc()
	self:_init_data_scar_npc()
	self:_init_data_p226_npc()
	self:_init_data_hk21_npc()
	self:_init_data_m249_npc()
	self:_init_data_rpk_npc()
	self:_init_data_m95_npc()
	self:_init_data_msr_npc()
	self:_init_data_r93_npc()
	self:_init_data_fal_npc()
	self:_init_data_ben_npc()
	self:_init_data_striker_npc()
	self:_init_data_ksg_npc()
	self:_init_data_gre_m79_npc()
	self:_init_data_g3_npc()
	self:_init_data_galil_npc()
	self:_init_data_famas_npc()
	self:_init_data_scorpion_npc()
	self:_init_data_tec9_npc()
	self:_init_data_uzi_npc()
	self:_precalculate_values()
end

function WeaponTweakData_37:_set_easy()
end

function WeaponTweakData_37:_set_normal()
end

function WeaponTweakData_37:_set_hard()
end

function WeaponTweakData_37:_set_overkill()
end

function WeaponTweakData_37:_set_overkill_145()
end

function WeaponTweakData_37:_set_overkill_290()
end

function WeaponTweakData_37:_init_data_npc_melee()
	self.npc_melee = {}
	self.npc_melee.baton = {}
	self.npc_melee.baton.unit_name = Idstring("units/payday2/characters/ene_acc_baton/ene_acc_baton")
	self.npc_melee.baton.damage = 10
	self.npc_melee.baton.animation_param = "melee_baton"
	self.npc_melee.baton.player_blood_effect = true
	self.npc_melee.knife_1 = {}
	self.npc_melee.knife_1.unit_name = Idstring("units/payday2/characters/ene_acc_knife_1/ene_acc_knife_1")
	self.npc_melee.knife_1.damage = 15
	self.npc_melee.knife_1.animation_param = "melee_knife"
	self.npc_melee.knife_1.player_blood_effect = true
	self.npc_melee.fists = {}
	self.npc_melee.fists.unit_name = nil
	self.npc_melee.fists.damage = 8
	self.npc_melee.fists.animation_param = "melee_fist"
	self.npc_melee.fists.player_blood_effect = true
end

function WeaponTweakData_37:_set_npc_weapon_damage_multiplier(mul)
	for name, data in pairs(self.npc_melee) do
		data.damage = data.damage * mul
	end
end

function WeaponTweakData_37:_init_data_c45_npc()
	self.c45_npc.sounds.prefix = "c45_npc"
	self.c45_npc.use_data.selection_index = 1
	self.c45_npc.DAMAGE = 1
	self.c45_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.c45_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.c45_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.c45_npc.CLIP_AMMO_MAX = 10
	self.c45_npc.NR_CLIPS_MAX = 5
	self.c45_npc.hold = "pistol"
	self.c45_npc.alert_size = 2500
	self.c45_npc.suppression = 1
	self.colt_1911_primary_npc = deep_clone(self.c45_npc)
	self.colt_1911_primary_npc.use_data.selection_index = 2
end

function WeaponTweakData_37:_init_data_beretta92_npc()
	self.beretta92_npc.sounds.prefix = "beretta_npc"
	self.beretta92_npc.use_data.selection_index = 1
	self.beretta92_npc.DAMAGE = 1
	self.beretta92_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.beretta92_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.beretta92_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.beretta92_npc.CLIP_AMMO_MAX = 14
	self.beretta92_npc.NR_CLIPS_MAX = 4
	self.beretta92_npc.hold = "pistol"
	self.beretta92_npc.alert_size = 300
	self.beretta92_npc.suppression = 0.3
	self.beretta92_primary_npc = deep_clone(self.beretta92_npc)
	self.beretta92_primary_npc.use_data.selection_index = 2
end

function WeaponTweakData_37:_init_data_glock_18_npc()
	self.glock_18_npc.sounds.prefix = "g18c_npc"
	self.glock_18_npc.use_data.selection_index = 1
	self.glock_18_npc.DAMAGE = 1
	self.glock_18_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.glock_18_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.glock_18_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.glock_18_npc.CLIP_AMMO_MAX = 20
	self.glock_18_npc.NR_CLIPS_MAX = 8
	self.glock_18_npc.hold = "pistol"
	self.glock_18_npc.alert_size = 2500
	self.glock_18_npc.suppression = 0.45
	self.glock_18c_primary_npc = deep_clone(self.glock_18_npc)
	self.glock_18c_primary_npc.use_data.selection_index = 2
end

function WeaponTweakData_37:_init_data_raging_bull_npc()
	self.raging_bull_npc.sounds.prefix = "rbull_npc"
	self.raging_bull_npc.use_data.selection_index = 1
	self.raging_bull_npc.DAMAGE = 4
	self.raging_bull_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.raging_bull_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.raging_bull_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_empty"
	self.raging_bull_npc.CLIP_AMMO_MAX = 6
	self.raging_bull_npc.NR_CLIPS_MAX = 8
	self.raging_bull_npc.hold = "pistol"
	self.raging_bull_npc.alert_size = 5000
	self.raging_bull_npc.suppression = 1.8
	self.raging_bull_primary_npc = deep_clone(self.raging_bull_npc)
	self.raging_bull_primary_npc.use_data.selection_index = 2
end

function WeaponTweakData_37:_init_data_m4_npc()
	self.m4_npc.sounds.prefix = "m4_npc"
	self.m4_npc.use_data.selection_index = 2
	self.m4_npc.DAMAGE = 1
	self.m4_npc.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.m4_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.m4_npc.CLIP_AMMO_MAX = 20
	self.m4_npc.NR_CLIPS_MAX = 5
	self.m4_npc.auto.fire_rate = 0.175
	self.m4_npc.hold = "rifle"
	self.m4_npc.alert_size = 5000
	self.m4_npc.suppression = 1
	self.m4_secondary_npc = deep_clone(self.m4_npc)
	self.m4_secondary_npc.use_data.selection_index = 1
end

function WeaponTweakData_37:_init_data_ak47_npc()
	self.ak47_npc.sounds.prefix = "akm_npc"
	self.ak47_npc.use_data.selection_index = 2
	self.ak47_npc.DAMAGE = 3
	self.ak47_npc.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.ak47_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.ak47_npc.CLIP_AMMO_MAX = 20
	self.ak47_npc.NR_CLIPS_MAX = 5
	self.ak47_npc.auto.fire_rate = 0.2
	self.ak47_npc.hold = "rifle"
	self.ak47_npc.alert_size = 5000
	self.ak47_npc.suppression = 1
end

function WeaponTweakData_37:_init_data_m14_npc()
	self.m14_npc.sounds.prefix = "m14_npc"
	self.m14_npc.use_data.selection_index = 2
	self.m14_npc.DAMAGE = 4
	self.m14_npc.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.m14_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.m14_npc.CLIP_AMMO_MAX = 12
	self.m14_npc.NR_CLIPS_MAX = 8
	self.m14_npc.auto.fire_rate = 0.2
	self.m14_npc.hold = "rifle"
	self.m14_npc.alert_size = 5000
	self.m14_npc.suppression = 1
end

function WeaponTweakData_37:_init_data_m14_sniper_npc()
	self.m14_sniper_npc.sounds.prefix = "sniper_npc"
	self.m14_sniper_npc.use_data.selection_index = 2
	self.m14_sniper_npc.DAMAGE = 2
	self.m14_sniper_npc.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.m14_sniper_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.m14_sniper_npc.CLIP_AMMO_MAX = 6
	self.m14_sniper_npc.NR_CLIPS_MAX = 8
	self.m14_sniper_npc.hold = "rifle"
	self.m14_sniper_npc.alert_size = 5000
	self.m14_sniper_npc.suppression = 1
	self.m14_sniper_npc.armor_piercing = true
end

function WeaponTweakData_37:_init_data_r870_npc()
	self.r870_npc.sounds.prefix = "remington_npc"
	self.r870_npc.use_data.selection_index = 2
	self.r870_npc.DAMAGE = 5
	self.r870_npc.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.r870_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug_semi"
	self.r870_npc.CLIP_AMMO_MAX = 6
	self.r870_npc.NR_CLIPS_MAX = 4
	self.r870_npc.hold = "rifle"
	self.r870_npc.alert_size = 4500
	self.r870_npc.suppression = 1.8
	self.r870_npc.is_shotgun = true
	self.benelli_npc = deep_clone(self.r870_npc)
end

function WeaponTweakData_37:_init_data_mossberg_npc()
	self.mossberg_npc.sounds.prefix = "mossberg_npc"
	self.mossberg_npc.use_data.selection_index = 2
	self.mossberg_npc.DAMAGE = 6
	self.mossberg_npc.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.mossberg_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug_semi"
	self.mossberg_npc.CLIP_AMMO_MAX = 4
	self.mossberg_npc.NR_CLIPS_MAX = 6
	self.mossberg_npc.hold = "rifle"
	self.mossberg_npc.alert_size = 3000
	self.mossberg_npc.suppression = 2
	self.mossberg_npc.is_shotgun = true
end

function WeaponTweakData_37:_init_data_mp5_npc()
	self.mp5_npc.sounds.prefix = "mp5_npc"
	self.mp5_npc.use_data.selection_index = 1
	self.mp5_npc.DAMAGE = 1
	self.mp5_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.mp5_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.mp5_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.mp5_npc.CLIP_AMMO_MAX = 30
	self.mp5_npc.NR_CLIPS_MAX = 5
	self.mp5_npc.auto.fire_rate = 0.12
	self.mp5_npc.hold = "rifle"
	self.mp5_npc.alert_size = 2500
	self.mp5_npc.suppression = 1
	self.mp5_tactical_npc = deep_clone(self.mp5_npc)
	self.mp5_tactical_npc.has_suppressor = "suppressed_a"
	self.ump_npc = deep_clone(self.mp5_npc)
end

function WeaponTweakData_37:_init_data_mac11_npc()
	self.mac11_npc.sounds.prefix = "mp5_npc"
	self.mac11_npc.use_data.selection_index = 1
	self.mac11_npc.DAMAGE = 1
	self.mac11_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.mac11_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.mac11_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.mac11_npc.CLIP_AMMO_MAX = 32
	self.mac11_npc.NR_CLIPS_MAX = 5
	self.mac11_npc.auto.fire_rate = 0.11
	self.mac11_npc.hold = "pistol"
	self.mac11_npc.alert_size = 2500
	self.mac11_npc.suppression = 1
end

function WeaponTweakData_37:_init_data_g36_npc()
	self.g36_npc.sounds.prefix = "g36_npc"
	self.g36_npc.use_data.selection_index = 2
	self.g36_npc.DAMAGE = 3
	self.g36_npc.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.g36_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.g36_npc.CLIP_AMMO_MAX = 20
	self.g36_npc.NR_CLIPS_MAX = 5
	self.g36_npc.auto.fire_rate = 0.15
	self.g36_npc.hold = "rifle"
	self.g36_npc.alert_size = 5000
	self.g36_npc.suppression = 1
end

function WeaponTweakData_37:_init_data_g17_npc()
	self.g17_npc.sounds.prefix = "g17_npc"
	self.g17_npc.use_data.selection_index = 1
	self.g17_npc.DAMAGE = 1
	self.g17_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.g17_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.g17_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.g17_npc.CLIP_AMMO_MAX = 10
	self.g17_npc.NR_CLIPS_MAX = 5
	self.g17_npc.hold = "pistol"
	self.g17_npc.alert_size = 2500
	self.g17_npc.suppression = 1
end

function WeaponTweakData_37:_init_data_mp9_npc()
	self.mp9_npc.sounds.prefix = "mp9_npc"
	self.mp9_npc.use_data.selection_index = 1
	self.mp9_npc.DAMAGE = 1
	self.mp9_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.mp9_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.mp9_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.mp9_npc.CLIP_AMMO_MAX = 32
	self.mp9_npc.NR_CLIPS_MAX = 5
	self.mp9_npc.auto.fire_rate = 0.125
	self.mp9_npc.hold = "pistol"
	self.mp9_npc.alert_size = 1000
	self.mp9_npc.suppression = 1
end

function WeaponTweakData_37:_init_data_olympic_npc()
	self.olympic_npc.sounds.prefix = "m4_olympic_npc"
	self.olympic_npc.use_data.selection_index = 1
	self.olympic_npc.DAMAGE = 1.5
	self.olympic_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.olympic_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.olympic_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.olympic_npc.CLIP_AMMO_MAX = 32
	self.olympic_npc.NR_CLIPS_MAX = 5
	self.olympic_npc.auto.fire_rate = 0.115
	self.olympic_npc.hold = "rifle"
	self.olympic_npc.alert_size = 1000
	self.olympic_npc.suppression = 1
	self.olympic_primary_npc = deep_clone(self.olympic_npc)
	self.olympic_primary_npc.use_data.selection_index = 2
end

function WeaponTweakData_37:_init_data_m16_npc()
	self.m16_npc.sounds.prefix = "m16_npc"
	self.m16_npc.use_data.selection_index = 2
	self.m16_npc.DAMAGE = 1.5
	self.m16_npc.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.m16_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.m16_npc.CLIP_AMMO_MAX = 12
	self.m16_npc.NR_CLIPS_MAX = 8
	self.m16_npc.auto.fire_rate = 0.215
	self.m16_npc.hold = "rifle"
	self.m16_npc.alert_size = 5000
	self.m16_npc.suppression = 1
end

function WeaponTweakData_37:_init_data_aug_npc()
	self.aug_npc.sounds.prefix = "aug_npc"
	self.aug_npc.use_data.selection_index = 2
	self.aug_npc.DAMAGE = 2
	self.aug_npc.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.aug_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.aug_npc.CLIP_AMMO_MAX = 20
	self.aug_npc.NR_CLIPS_MAX = 5
	self.aug_npc.auto.fire_rate = 0.185
	self.aug_npc.hold = "rifle"
	self.aug_npc.alert_size = 5000
	self.aug_npc.suppression = 1
	self.aug_secondary_npc = deep_clone(self.aug_npc)
	self.aug_secondary_npc.use_data.selection_index = 1
end

function WeaponTweakData_37:_init_data_ak74_npc()
	self.ak74_npc.sounds.prefix = "ak74_npc"
	self.ak74_npc.use_data.selection_index = 2
	self.ak74_npc.DAMAGE = 2
	self.ak74_npc.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.ak74_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.ak74_npc.CLIP_AMMO_MAX = 20
	self.ak74_npc.NR_CLIPS_MAX = 5
	self.ak74_npc.auto.fire_rate = 0.19
	self.ak74_npc.hold = "rifle"
	self.ak74_npc.alert_size = 5000
	self.ak74_npc.suppression = 1
	self.ak74_secondary_npc = deep_clone(self.ak74_npc)
	self.ak74_secondary_npc.use_data.selection_index = 1
end

function WeaponTweakData_37:_init_data_ak5_npc()
	self.ak5_npc.sounds.prefix = "ak5_npc"
	self.ak5_npc.use_data.selection_index = 2
	self.ak5_npc.DAMAGE = 2
	self.ak5_npc.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.ak5_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.ak5_npc.CLIP_AMMO_MAX = 20
	self.ak5_npc.NR_CLIPS_MAX = 5
	self.ak5_npc.auto.fire_rate = 0.2
	self.ak5_npc.hold = "rifle"
	self.ak5_npc.alert_size = 5000
	self.ak5_npc.suppression = 1
end

function WeaponTweakData_37:_init_data_p90_npc()
	self.p90_npc.sounds.prefix = "p90_npc"
	self.p90_npc.use_data.selection_index = 1
	self.p90_npc.DAMAGE = 1
	self.p90_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.p90_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.p90_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.p90_npc.CLIP_AMMO_MAX = 32
	self.p90_npc.NR_CLIPS_MAX = 5
	self.p90_npc.auto.fire_rate = 0.11
	self.p90_npc.hold = "pistol"
	self.p90_npc.alert_size = 1000
	self.p90_npc.suppression = 1
end

function WeaponTweakData_37:_init_data_amcar_npc()
	self.amcar_npc.sounds.prefix = "amcar_npc"
	self.amcar_npc.use_data.selection_index = 2
	self.amcar_npc.DAMAGE = 2
	self.amcar_npc.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.amcar_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.amcar_npc.CLIP_AMMO_MAX = 20
	self.amcar_npc.NR_CLIPS_MAX = 5
	self.amcar_npc.auto.fire_rate = 0.2
	self.amcar_npc.hold = "rifle"
	self.amcar_npc.alert_size = 5000
	self.amcar_npc.suppression = 1
end

function WeaponTweakData_37:_init_data_mac10_npc()
	self.mac10_npc.sounds.prefix = "mac10_npc"
	self.mac10_npc.use_data.selection_index = 1
	self.mac10_npc.DAMAGE = 0.75
	self.mac10_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.mac10_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.mac10_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.mac10_npc.CLIP_AMMO_MAX = 32
	self.mac10_npc.NR_CLIPS_MAX = 5
	self.mac10_npc.auto.fire_rate = 0.1
	self.mac10_npc.hold = "pistol"
	self.mac10_npc.alert_size = 1000
	self.mac10_npc.suppression = 1
end

function WeaponTweakData_37:_init_data_akmsu_npc()
	self.akmsu_npc.sounds.prefix = "akmsu_npc"
	self.akmsu_npc.use_data.selection_index = 1
	self.akmsu_npc.DAMAGE = 3
	self.akmsu_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.akmsu_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.akmsu_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.akmsu_npc.CLIP_AMMO_MAX = 32
	self.akmsu_npc.NR_CLIPS_MAX = 5
	self.akmsu_npc.auto.fire_rate = 0.1
	self.akmsu_npc.hold = "rifle"
	self.akmsu_npc.alert_size = 1000
	self.akmsu_npc.suppression = 1
	self.akmsu_primary_npc = deep_clone(self.akmsu_npc)
	self.akmsu_primary_npc.use_data.selection_index = 2
end

function WeaponTweakData_37:_init_data_akm_npc()
	self.akm_npc.sounds.prefix = "akm_npc"
	self.akm_npc.use_data.selection_index = 2
	self.akm_npc.DAMAGE = 3
	self.akm_npc.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.akm_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.akm_npc.CLIP_AMMO_MAX = 20
	self.akm_npc.NR_CLIPS_MAX = 5
	self.akm_npc.auto.fire_rate = 0.2
	self.akm_npc.hold = "rifle"
	self.akm_npc.alert_size = 5000
	self.akm_npc.suppression = 1
end

function WeaponTweakData_37:_init_data_akm_gold_npc()
	self.akm_gold_npc.sounds.prefix = "akm_npc"
	self.akm_gold_npc.use_data.selection_index = 2
	self.akm_gold_npc.DAMAGE = 3
	self.akm_gold_npc.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.akm_gold_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.akm_gold_npc.CLIP_AMMO_MAX = 20
	self.akm_gold_npc.NR_CLIPS_MAX = 5
	self.akm_gold_npc.auto.fire_rate = 0.2
	self.akm_gold_npc.hold = "rifle"
	self.akm_gold_npc.alert_size = 5000
	self.akm_gold_npc.suppression = 1
end

function WeaponTweakData_37:_init_data_deagle_npc()
	self.deagle_npc.sounds.prefix = "deagle_npc"
	self.deagle_npc.use_data.selection_index = 1
	self.deagle_npc.DAMAGE = 4
	self.deagle_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.deagle_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.deagle_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.deagle_npc.CLIP_AMMO_MAX = 10
	self.deagle_npc.NR_CLIPS_MAX = 5
	self.deagle_npc.hold = "pistol"
	self.deagle_npc.alert_size = 2500
	self.deagle_npc.suppression = 1
	self.deagle_primary_npc = deep_clone(self.deagle_npc)
	self.deagle_primary_npc.use_data.selection_index = 2
end

function WeaponTweakData_37:_init_data_serbu_npc()
	self.serbu_npc.sounds.prefix = "serbu_npc"
	self.serbu_npc.use_data.selection_index = 1
	self.serbu_npc.DAMAGE = 5
	self.serbu_npc.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.serbu_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug_semi"
	self.serbu_npc.CLIP_AMMO_MAX = 6
	self.serbu_npc.NR_CLIPS_MAX = 4
	self.serbu_npc.hold = "rifle"
	self.serbu_npc.alert_size = 4500
	self.serbu_npc.suppression = 1.8
	self.serbu_npc.is_shotgun = true
end

function WeaponTweakData_37:_init_data_saiga_npc()
	self.saiga_npc.sounds.prefix = "saiga_npc"
	self.saiga_npc.use_data.selection_index = 2
	self.saiga_npc.DAMAGE = 5
	self.saiga_npc.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.saiga_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug"
	self.saiga_npc.auto.fire_rate = 0.14
	self.saiga_npc.CLIP_AMMO_MAX = 20
	self.saiga_npc.NR_CLIPS_MAX = 4
	self.saiga_npc.hold = "rifle"
	self.saiga_npc.alert_size = 4500
	self.saiga_npc.suppression = 1.8
	self.saiga_npc.is_shotgun = true
end

function WeaponTweakData_37:_init_data_huntsman_npc()
	self.huntsman_npc.sounds.prefix = "huntsman_npc"
	self.huntsman_npc.use_data.selection_index = 2
	self.huntsman_npc.DAMAGE = 12
	self.huntsman_npc.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.huntsman_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_empty"
	self.huntsman_npc.CLIP_AMMO_MAX = 2
	self.huntsman_npc.NR_CLIPS_MAX = 4
	self.huntsman_npc.hold = "rifle"
	self.huntsman_npc.alert_size = 4500
	self.huntsman_npc.suppression = 1.8
	self.huntsman_npc.is_shotgun = true
end

function WeaponTweakData_37:_init_data_saw_npc()
	self.saw_npc.sounds.prefix = "saw_npc"
	self.saw_npc.sounds.fire = "Play_npc_saw_handheld_start"
	self.saw_npc.sounds.stop_fire = "Play_npc_saw_handheld_end"
	self.saw_npc.use_data.selection_index = 2
	self.saw_npc.DAMAGE = 1
	self.saw_npc.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.saw_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_empty"
	self.saw_npc.CLIP_AMMO_MAX = 2
	self.saw_npc.NR_CLIPS_MAX = 4
	self.saw_npc.hold = "rifle"
	self.saw_npc.alert_size = 4500
	self.saw_npc.suppression = 1.8
end

function WeaponTweakData_37:_init_data_sentry_gun_npc()
	self.sentry_gun.name_id = "debug_sentry_gun"
	self.sentry_gun.DAMAGE = 1
	self.sentry_gun.SPREAD = 5
	self.sentry_gun.FIRE_RANGE = 5000
	self.sentry_gun.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.sentry_gun.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.sentry_gun.auto.fire_rate = 0.15
	self.sentry_gun.alert_size = 2500
	self.sentry_gun.BAG_DMG_MUL = 0.25
	self.sentry_gun.SHIELD_DMG_MUL = 0
	self.sentry_gun.LOST_SIGHT_VERIFICATION = 0.1
	self.sentry_gun.DEATH_VERIFICATION = {0.4, 0.75}
	self.sentry_gun.DETECTION_RANGE = 1800
	self.sentry_gun.KEEP_FIRE_ANGLE = 0.8
	self.sentry_gun.MAX_VEL_SPIN = 120
	self.sentry_gun.MIN_VEL_SPIN = self.sentry_gun.MAX_VEL_SPIN * 0.05
	self.sentry_gun.SLOWDOWN_ANGLE_SPIN = 30
	self.sentry_gun.ACC_SPIN = self.sentry_gun.MAX_VEL_SPIN * 5
	self.sentry_gun.MAX_VEL_PITCH = 100
	self.sentry_gun.MIN_VEL_PITCH = self.sentry_gun.MAX_VEL_PITCH * 0.05
	self.sentry_gun.SLOWDOWN_ANGLE_PITCH = 20
	self.sentry_gun.ACC_PITCH = self.sentry_gun.MAX_VEL_PITCH * 5
	self.sentry_gun.recoil = {}
	self.sentry_gun.recoil.horizontal = {
		2,
		3,
		0,
		3
	}
	self.sentry_gun.recoil.vertical = {
		1,
		2,
		0,
		4
	}
	self.sentry_gun.challenges = {}
	self.sentry_gun.challenges.group = "sentry_gun"
	self.sentry_gun.challenges.weapon = "sentry_gun"
	self.sentry_gun.suppression = 0.8
end

function WeaponTweakData_37:_init_data_usp_npc()
	self.usp_npc.sounds.prefix = "usp45_npc"
	self.usp_npc.use_data.selection_index = 1
	self.usp_npc.DAMAGE = 1.25
	self.usp_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.usp_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.usp_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.usp_npc.CLIP_AMMO_MAX = 80
	self.usp_npc.NR_CLIPS_MAX = 6
	self.usp_npc.auto.fire_rate = 0.1
	self.usp_npc.hold = "pistol"
	self.usp_npc.alert_size = 1800
	self.usp_npc.suppression = 2
end

function WeaponTweakData_37:_init_data_g22c_npc()
	self.g22c_npc.sounds.prefix = "g22_npc"
	self.g22c_npc.use_data.selection_index = 1
	self.g22c_npc.DAMAGE = 1.25
	self.g22c_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.g22c_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.g22c_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.g22c_npc.CLIP_AMMO_MAX = 80
	self.g22c_npc.NR_CLIPS_MAX = 6
	self.g22c_npc.auto.fire_rate = 0.1
	self.g22c_npc.hold = "pistol"
	self.g22c_npc.alert_size = 1800
	self.g22c_npc.suppression = 2
end

function WeaponTweakData_37:_init_data_judge_npc()
	self.judge_npc.sounds.prefix = "judge_npc"
	self.judge_npc.use_data.selection_index = 1
	self.judge_npc.DAMAGE = 4
	self.judge_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.judge_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.judge_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_empty"
	self.judge_npc.CLIP_AMMO_MAX = 6
	self.judge_npc.NR_CLIPS_MAX = 8
	self.judge_npc.hold = "pistol"
	self.judge_npc.alert_size = 5000
	self.judge_npc.suppression = 1.8
end

function WeaponTweakData_37:_init_data_m45_npc()
	self.m45_npc.sounds.prefix = "m45_npc"
	self.m45_npc.use_data.selection_index = 1
	self.m45_npc.DAMAGE = 2
	self.m45_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.m45_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.m45_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.m45_npc.CLIP_AMMO_MAX = 40
	self.m45_npc.NR_CLIPS_MAX = 5
	self.m45_npc.auto.fire_rate = 0.1
	self.m45_npc.hold = "rifle"
	self.m45_npc.alert_size = 2800
	self.m45_npc.suppression = 1
end

function WeaponTweakData_37:_init_data_s552_npc()
	self.s552_npc.sounds.prefix = "sig552_npc"
	self.s552_npc.use_data.selection_index = 2
	self.s552_npc.DAMAGE = 2
	self.s552_npc.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.s552_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.s552_npc.CLIP_AMMO_MAX = 20
	self.s552_npc.NR_CLIPS_MAX = 5
	self.s552_npc.auto.fire_rate = 0.15
	self.s552_npc.hold = "rifle"
	self.s552_npc.alert_size = 5000
	self.s552_npc.suppression = 1
	self.s552_secondary_npc = deep_clone(self.s552_npc)
	self.s552_secondary_npc.use_data.selection_index = 1
end

function WeaponTweakData_37:_init_data_ppk_npc()
	self.ppk_npc.sounds.prefix = "w_ppk_npc"
	self.ppk_npc.use_data.selection_index = 1
	self.ppk_npc.DAMAGE = 1
	self.ppk_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.ppk_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.ppk_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.ppk_npc.CLIP_AMMO_MAX = 10
	self.ppk_npc.NR_CLIPS_MAX = 5
	self.ppk_npc.hold = "pistol"
	self.ppk_npc.alert_size = 2500
	self.ppk_npc.suppression = 1
end

function WeaponTweakData_37:_init_data_mp7_npc()
	self.mp7_npc.sounds.prefix = "mp7_npc"
	self.mp7_npc.use_data.selection_index = 1
	self.mp7_npc.DAMAGE = 2
	self.mp7_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.mp7_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.mp7_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.mp7_npc.CLIP_AMMO_MAX = 40
	self.mp7_npc.NR_CLIPS_MAX = 5
	self.mp7_npc.auto.fire_rate = 0.1
	self.mp7_npc.hold = "pistol"
	self.mp7_npc.alert_size = 2800
	self.mp7_npc.suppression = 1
end

function WeaponTweakData_37:_init_data_scar_npc()
	self.scar_npc.sounds.prefix = "scar_npc"
	self.scar_npc.use_data.selection_index = 2
	self.scar_npc.DAMAGE = 2
	self.scar_npc.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.scar_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.scar_npc.CLIP_AMMO_MAX = 20
	self.scar_npc.NR_CLIPS_MAX = 5
	self.scar_npc.auto.fire_rate = 0.15
	self.scar_npc.hold = "rifle"
	self.scar_npc.alert_size = 5000
	self.scar_npc.suppression = 1
	self.scar_secondary_npc = deep_clone(self.scar_npc)
	self.scar_secondary_npc.use_data.selection_index = 1
end

function WeaponTweakData_37:_init_data_p226_npc()
	self.p226_npc.sounds.prefix = "p226r_npc"
	self.p226_npc.use_data.selection_index = 1
	self.p226_npc.DAMAGE = 1
	self.p226_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.p226_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.p226_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.p226_npc.CLIP_AMMO_MAX = 10
	self.p226_npc.NR_CLIPS_MAX = 5
	self.p226_npc.hold = "pistol"
	self.p226_npc.alert_size = 2500
	self.p226_npc.suppression = 1
end

function WeaponTweakData_37:_init_data_hk21_npc()
	self.hk21_npc.sounds.prefix = "hk23e_npc"
	self.hk21_npc.use_data.selection_index = 2
	self.hk21_npc.DAMAGE = 2
	self.hk21_npc.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
	self.hk21_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
	self.hk21_npc.CLIP_AMMO_MAX = 20
	self.hk21_npc.NR_CLIPS_MAX = 5
	self.hk21_npc.auto.fire_rate = 0.15
	self.hk21_npc.hold = "rifle"
	self.hk21_npc.alert_size = 5000
	self.hk21_npc.suppression = 1
	self.hk21_secondary_npc = deep_clone(self.hk21_npc)
	self.hk21_secondary_npc.use_data.selection_index = 1
end

function WeaponTweakData_37:_init_data_m249_npc()
	self.m249_npc.sounds.prefix = "m249_npc"
	self.m249_npc.use_data.selection_index = 2
	self.m249_npc.DAMAGE = 2
	self.m249_npc.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
	self.m249_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
	self.m249_npc.CLIP_AMMO_MAX = 200
	self.m249_npc.NR_CLIPS_MAX = 2
	self.m249_npc.auto.fire_rate = 0.08
	self.m249_npc.hold = "rifle"
	self.m249_npc.alert_size = 5000
	self.m249_npc.suppression = 1
	self.m249_secondary_npc = deep_clone(self.m249_npc)
	self.m249_secondary_npc.use_data.selection_index = 1
	self.m249_secondary_npc.armor_piercing = true
end

function WeaponTweakData_37:_init_data_rpk_npc()
	self.rpk_npc.sounds.prefix = "rpk_npc"
	self.rpk_npc.use_data.selection_index = 2
	self.rpk_npc.DAMAGE = 2
	self.rpk_npc.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
	self.rpk_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.rpk_npc.CLIP_AMMO_MAX = 20
	self.rpk_npc.NR_CLIPS_MAX = 5
	self.rpk_npc.auto.fire_rate = 0.15
	self.rpk_npc.hold = "rifle"
	self.rpk_npc.alert_size = 5000
	self.rpk_npc.suppression = 1
	self.rpk_secondary_npc = deep_clone(self.rpk_npc)
	self.rpk_secondary_npc.use_data.selection_index = 1
end

function WeaponTweakData_37:_init_data_m95_npc()
	self.m95_npc.sounds.prefix = "barrett_npc"
	self.m95_npc.use_data.selection_index = 2
	self.m95_npc.DAMAGE = 2
	self.m95_npc.muzzleflash = "effects/payday2/particles/weapons/50cal_auto"
	self.m95_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_sniper_m95"
	self.m95_npc.CLIP_AMMO_MAX = 20
	self.m95_npc.NR_CLIPS_MAX = 5
	self.m95_npc.auto.fire_rate = 20
	self.m95_npc.hold = "rifle"
	self.m95_npc.alert_size = 5000
	self.m95_npc.suppression = 1
	self.m95_secondary_npc = deep_clone(self.m95_npc)
	self.m95_secondary_npc.use_data.selection_index = 1
end

function WeaponTweakData_37:_init_data_msr_npc()
	self.msr_npc.sounds.prefix = "msr_npc"
	self.msr_npc.use_data.selection_index = 2
	self.msr_npc.DAMAGE = 2
	self.msr_npc.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
	self.msr_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_sniper"
	self.msr_npc.CLIP_AMMO_MAX = 20
	self.msr_npc.NR_CLIPS_MAX = 5
	self.msr_npc.auto.fire_rate = 20
	self.msr_npc.hold = "rifle"
	self.msr_npc.alert_size = 5000
	self.msr_npc.suppression = 1
	self.msr_secondary_npc = deep_clone(self.msr_npc)
	self.msr_secondary_npc.use_data.selection_index = 1
end

function WeaponTweakData_37:_init_data_r93_npc()
	self.r93_npc.sounds.prefix = "blazer_npc"
	self.r93_npc.use_data.selection_index = 2
	self.r93_npc.DAMAGE = 2
	self.r93_npc.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
	self.r93_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_sniper"
	self.r93_npc.CLIP_AMMO_MAX = 20
	self.r93_npc.NR_CLIPS_MAX = 5
	self.r93_npc.auto.fire_rate = 20
	self.r93_npc.hold = "rifle"
	self.r93_npc.alert_size = 5000
	self.r93_npc.suppression = 1
	self.r93_secondary_npc = deep_clone(self.r93_npc)
	self.r93_secondary_npc.use_data.selection_index = 1
end

function WeaponTweakData_37:_init_data_fal_npc()
	self.fal_npc.sounds.prefix = "fn_fal_npc"
	self.fal_npc.use_data.selection_index = 2
	self.fal_npc.DAMAGE = 2
	self.fal_npc.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.fal_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.fal_npc.CLIP_AMMO_MAX = 20
	self.fal_npc.NR_CLIPS_MAX = 5
	self.fal_npc.auto.fire_rate = 0.15
	self.fal_npc.hold = "rifle"
	self.fal_npc.alert_size = 5000
	self.fal_npc.suppression = 1
	self.fal_secondary_npc = deep_clone(self.fal_npc)
	self.fal_secondary_npc.use_data.selection_index = 1
end

function WeaponTweakData_37:_init_data_ben_npc()
	self.ben_npc.sounds.prefix = "benelli_m4_npc"
	self.ben_npc.use_data.selection_index = 2
	self.ben_npc.DAMAGE = 5
	self.ben_npc.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.ben_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug"
	self.ben_npc.auto.fire_rate = 0.14
	self.ben_npc.CLIP_AMMO_MAX = 20
	self.ben_npc.NR_CLIPS_MAX = 4
	self.ben_npc.hold = "rifle"
	self.ben_npc.alert_size = 4500
	self.ben_npc.suppression = 1.8
	self.ben_npc.is_shotgun = true
end

function WeaponTweakData_37:_init_data_striker_npc()
	self.striker_npc.sounds.prefix = "striker_npc"
	self.striker_npc.use_data.selection_index = 2
	self.striker_npc.DAMAGE = 5
	self.striker_npc.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.striker_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug"
	self.striker_npc.auto.fire_rate = 0.14
	self.striker_npc.CLIP_AMMO_MAX = 20
	self.striker_npc.NR_CLIPS_MAX = 4
	self.striker_npc.hold = "rifle"
	self.striker_npc.alert_size = 4500
	self.striker_npc.suppression = 1.8
	self.striker_npc.is_shotgun = true
end

function WeaponTweakData_37:_init_data_ksg_npc()
	self.ksg_npc.sounds.prefix = "keltec_npc"
	self.ksg_npc.use_data.selection_index = 2
	self.ksg_npc.DAMAGE = 5
	self.ksg_npc.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.ksg_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug"
	self.ksg_npc.auto.fire_rate = 0.14
	self.ksg_npc.CLIP_AMMO_MAX = 20
	self.ksg_npc.NR_CLIPS_MAX = 4
	self.ksg_npc.hold = "rifle"
	self.ksg_npc.alert_size = 4500
	self.ksg_npc.suppression = 1.8
	self.ksg_npc.is_shotgun = true
end

function WeaponTweakData_37:_init_data_gre_m79_npc()
	self.gre_m79_npc.sounds.prefix = "gl40_npc"
	self.gre_m79_npc.use_data.selection_index = 2
	self.gre_m79_npc.DAMAGE = 2
	self.gre_m79_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.gre_m79_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.gre_m79_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.gre_m79_npc.no_trail = true
	self.gre_m79_npc.CLIP_AMMO_MAX = 1
	self.gre_m79_npc.NR_CLIPS_MAX = 4
	self.gre_m79_npc.auto.fire_rate = 0.1
	self.gre_m79_npc.hold = "rifle"
	self.gre_m79_npc.alert_size = 2800
	self.gre_m79_npc.suppression = 1
end

function WeaponTweakData_37:_init_data_g3_npc()
	self.g3_npc.sounds.prefix = "g3_npc"
	self.g3_npc.use_data.selection_index = 2
	self.g3_npc.DAMAGE = 2
	self.g3_npc.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.g3_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.g3_npc.CLIP_AMMO_MAX = 20
	self.g3_npc.NR_CLIPS_MAX = 5
	self.g3_npc.auto.fire_rate = 0.15
	self.g3_npc.hold = "rifle"
	self.g3_npc.alert_size = 5000
	self.g3_npc.suppression = 1
end

function WeaponTweakData_37:_init_data_galil_npc()
	self.galil_npc.sounds.prefix = "galil_npc"
	self.galil_npc.use_data.selection_index = 2
	self.galil_npc.DAMAGE = 2
	self.galil_npc.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.galil_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.galil_npc.CLIP_AMMO_MAX = 20
	self.galil_npc.NR_CLIPS_MAX = 5
	self.galil_npc.auto.fire_rate = 0.15
	self.galil_npc.hold = "rifle"
	self.galil_npc.alert_size = 5000
	self.galil_npc.suppression = 1
end

function WeaponTweakData_37:_init_data_famas_npc()
	self.famas_npc.sounds.prefix = "famas_npc"
	self.famas_npc.use_data.selection_index = 2
	self.famas_npc.DAMAGE = 2
	self.famas_npc.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.famas_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.famas_npc.CLIP_AMMO_MAX = 20
	self.famas_npc.NR_CLIPS_MAX = 5
	self.famas_npc.auto.fire_rate = 0.15
	self.famas_npc.hold = "rifle"
	self.famas_npc.alert_size = 5000
	self.famas_npc.suppression = 1
end

function WeaponTweakData_37:_init_data_scorpion_npc()
	self.scorpion_npc.sounds.prefix = "skorpion_npc"
	self.scorpion_npc.use_data.selection_index = 1
	self.scorpion_npc.DAMAGE = 2
	self.scorpion_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.scorpion_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.scorpion_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.scorpion_npc.CLIP_AMMO_MAX = 40
	self.scorpion_npc.NR_CLIPS_MAX = 5
	self.scorpion_npc.auto.fire_rate = 0.1
	self.scorpion_npc.hold = "pistol"
	self.scorpion_npc.alert_size = 2800
	self.scorpion_npc.suppression = 1
end

function WeaponTweakData_37:_init_data_tec9_npc()
	self.tec9_npc.sounds.prefix = "tec9_npc"
	self.tec9_npc.use_data.selection_index = 1
	self.tec9_npc.DAMAGE = 2
	self.tec9_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.tec9_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.tec9_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.tec9_npc.CLIP_AMMO_MAX = 40
	self.tec9_npc.NR_CLIPS_MAX = 5
	self.tec9_npc.auto.fire_rate = 0.1
	self.tec9_npc.hold = "pistol"
	self.tec9_npc.alert_size = 2800
	self.tec9_npc.suppression = 1
end

function WeaponTweakData_37:_init_data_uzi_npc()
	self.uzi_npc.sounds.prefix = "uzi_npc"
	self.uzi_npc.use_data.selection_index = 1
	self.uzi_npc.DAMAGE = 2
	self.uzi_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.uzi_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.uzi_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.uzi_npc.CLIP_AMMO_MAX = 40
	self.uzi_npc.NR_CLIPS_MAX = 5
	self.uzi_npc.auto.fire_rate = 0.1
	self.uzi_npc.hold = "pistol"
	self.uzi_npc.alert_size = 2800
	self.uzi_npc.suppression = 1
end

function WeaponTweakData_37:_init_data_player_weapons(tweak_data)
	local autohit_rifle_default, autohit_pistol_default, autohit_shotgun_default, autohit_lmg_default, autohit_snp_default, autohit_smg_default, aim_assist_rifle_default, aim_assist_pistol_default, aim_assist_shotgun_default, aim_assist_lmg_default, aim_assist_snp_default, aim_assist_smg_default
	if SystemInfo:platform() == Idstring("WIN32") then
		autohit_rifle_default = {
			MIN_RATIO = 0.75,
			MAX_RATIO = 0.85,
			INIT_RATIO = 0.15,
			far_dis = 4000,
			far_angle = 1,
			near_angle = 3
		}
		autohit_pistol_default = {
			MIN_RATIO = 0.82,
			MAX_RATIO = 0.95,
			INIT_RATIO = 0.15,
			far_dis = 4000,
			far_angle = 0.5,
			near_angle = 3
		}
		autohit_shotgun_default = {
			MIN_RATIO = 0.6,
			MAX_RATIO = 0.7,
			INIT_RATIO = 0.15,
			far_dis = 5000,
			far_angle = 1.5,
			near_angle = 3
		}
		autohit_lmg_default = {
			MIN_RATIO = 0.2,
			MAX_RATIO = 0.4,
			INIT_RATIO = 0.05,
			far_dis = 2000,
			far_angle = 0.2,
			near_angle = 2
		}
		autohit_snp_default = {
			MIN_RATIO = 0.2,
			MAX_RATIO = 0.4,
			INIT_RATIO = 0.05,
			far_dis = 5000,
			far_angle = 0.2,
			near_angle = 2
		}
		autohit_smg_default = {
			MIN_RATIO = 0.2,
			MAX_RATIO = 0.4,
			INIT_RATIO = 0.05,
			far_dis = 2500,
			far_angle = 0.5,
			near_angle = 4
		}
	else
		autohit_rifle_default = {
			MIN_RATIO = 0.25,
			MAX_RATIO = 0.6,
			INIT_RATIO = 0.6,
			far_dis = 5000,
			far_angle = 3,
			near_angle = 3
		}
		autohit_pistol_default = {
			MIN_RATIO = 0.25,
			MAX_RATIO = 0.6,
			INIT_RATIO = 0.6,
			far_dis = 2500,
			far_angle = 3,
			near_angle = 3
		}
		autohit_shotgun_default = {
			MIN_RATIO = 0.15,
			MAX_RATIO = 0.3,
			INIT_RATIO = 0.3,
			far_dis = 5000,
			far_angle = 5,
			near_angle = 3
		}
		autohit_lmg_default = {
			MIN_RATIO = 0.25,
			MAX_RATIO = 0.6,
			INIT_RATIO = 0.6,
			far_dis = 5000,
			far_angle = 3,
			near_angle = 3
		}
		autohit_snp_default = {
			MIN_RATIO = 0.25,
			MAX_RATIO = 0.6,
			INIT_RATIO = 0.6,
			far_dis = 5000,
			far_angle = 3,
			near_angle = 3
		}
		autohit_smg_default = {
			MIN_RATIO = 0.25,
			MAX_RATIO = 0.6,
			INIT_RATIO = 0.6,
			far_dis = 5000,
			far_angle = 3,
			near_angle = 3
		}
	end
	aim_assist_rifle_default = deep_clone(autohit_rifle_default)
	aim_assist_pistol_default = deep_clone(autohit_pistol_default)
	aim_assist_shotgun_default = deep_clone(autohit_shotgun_default)
	aim_assist_lmg_default = deep_clone(autohit_lmg_default)
	aim_assist_snp_default = deep_clone(autohit_snp_default)
	aim_assist_smg_default = deep_clone(autohit_smg_default)
	aim_assist_rifle_default.near_angle = 40
	aim_assist_pistol_default.near_angle = 20
	aim_assist_shotgun_default.near_angle = 40
	aim_assist_lmg_default.near_angle = 10
	aim_assist_snp_default.near_angle = 20
	aim_assist_smg_default.near_angle = 30
	self.crosshair = {}
	self.crosshair.MIN_OFFSET = 18
	self.crosshair.MAX_OFFSET = 150
	self.crosshair.MIN_KICK_OFFSET = 0
	self.crosshair.MAX_KICK_OFFSET = 100
	self.crosshair.DEFAULT_OFFSET = 0.16
	self.crosshair.DEFAULT_KICK_OFFSET = 0.6
	local damage_melee_default = 1.5
	local damage_melee_effect_multiplier_default = 1.75
	self.trip_mines = {}
	self.trip_mines.delay = 0.3
	self.trip_mines.damage = 100
	self.trip_mines.damage_size = 300
	self.trip_mines.alert_radius = 5000
	self:_init_stats()
	self.factory = WeaponFactoryTweakData:new()
	tweak_data._init_wip_weapon_factory(self.factory, tweak_data)
	self:_init_new_weapons(autohit_rifle_default, autohit_pistol_default, autohit_shotgun_default, autohit_lmg_default, autohit_snp_default, autohit_smg_default, damage_melee_default, damage_melee_effect_multiplier_default, aim_assist_rifle_default, aim_assist_pistol_default, aim_assist_shotgun_default, aim_assist_lmg_default, aim_assist_snp_default, aim_assist_smg_default)
	self:_init_new_weapons_wip(autohit_rifle_default, autohit_pistol_default, autohit_shotgun_default, autohit_lmg_default, autohit_snp_default, autohit_smg_default, damage_melee_default, damage_melee_effect_multiplier_default, aim_assist_rifle_default, aim_assist_pistol_default, aim_assist_shotgun_default, aim_assist_lmg_default, aim_assist_snp_default, aim_assist_smg_default)
end

function WeaponTweakData_37:_init_stats()
	self.stats = {}
	self.stats.alert_size = {
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
		850,
		700,
		500,
		350,
		200,
		100,
		0
	}
	self.stats.suppression = {
		4.5,
		3.9,
		3.6,
		3.3,
		3,
		2.8,
		2.6,
		2.4,
		2.2,
		1.6,
		1.5,
		1.4,
		1.3,
		1.2,
		1.1,
		1,
		0.8,
		0.6,
		0.4,
		0.2
	}
	self.stats.damage = {
		1,
		1.1,
		1.2,
		1.3,
		1.4,
		1.5,
		1.6,
		1.75,
		2,
		2.25,
		2.5,
		2.75,
		3,
		3.25,
		3.5,
		3.75,
		4,
		4.25,
		4.5,
		4.75,
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
	self.stats.zoom = {
		63,
		60,
		55,
		50,
		45,
		40,
		35,
		30,
		25,
		20
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
		1.75,
		1.5,
		1.25,
		1.1,
		1,
		1,
		0.9,
		0.8,
		0.7,
		0.6,
		0.5
	}
	self.stats.value = {
		1,
		2,
		3,
		4,
		5,
		6,
		7,
		8,
		9,
		10
	}
	self.stats.concealment = {
		0.3,
		0.4,
		0.5,
		0.6,
		0.65,
		0.7,
		0.75,
		0.8,
		0.825,
		0.85,
		1,
		1.05,
		1.1,
		1.15,
		1.2,
		1.225,
		1.25,
		1.275,
		1.3,
		1.325,
		1.35,
		1.375,
		1.4,
		1.425,
		1.45,
		1.475,
		1.5,
		1.525,
		1.55,
		1.6
	}
	self.stats.extra_ammo = {}
	for i = -10, 50, 2 do
		table.insert(self.stats.extra_ammo, i)
	end
	self.stats.total_ammo_mod = {}
	for i = -100, 100, 5 do
		table.insert(self.stats.total_ammo_mod, i / 100)
	end
end

function WeaponTweakData_37:_pickup_chance(max_ammo, selection_index)
	local low, high
	if selection_index == 2 then
		low = 0.02
		high = 0.05
	else
		low = 0.02
		high = 0.05
	end
	return {
		max_ammo * low,
		max_ammo * high
	}
end

function WeaponTweakData_37:_init_new_weapons_wip(autohit_rifle_default, autohit_pistol_default, autohit_shotgun_default, autohit_lmg_default, autohit_snp_default, autohit_smg_default, damage_melee_default, damage_melee_effect_multiplier_default, aim_assist_rifle_default, aim_assist_pistol_default, aim_assist_shotgun_default, aim_assist_lmg_default, aim_assist_snp_default, aim_assist_smg_default)
end

function WeaponTweakData_37:_init_new_weapons(autohit_rifle_default, autohit_pistol_default, autohit_shotgun_default, autohit_lmg_default, autohit_snp_default, autohit_smg_default, damage_melee_default, damage_melee_effect_multiplier_default, aim_assist_rifle_default, aim_assist_pistol_default, aim_assist_shotgun_default, aim_assist_lmg_default, aim_assist_snp_default, aim_assist_smg_default)
	local total_damage_primary = 300
	local total_damage_secondary = 150
	self.new_m4 = {}
	self.new_m4.category = "assault_rifle"
	self.new_m4.damage_melee = damage_melee_default
	self.new_m4.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.new_m4.sounds = {}
	self.new_m4.sounds.fire = "m4_fire_single"
	self.new_m4.sounds.fire_single = "m4_fire_single"
	self.new_m4.sounds.fire_auto = "m4_fire"
	self.new_m4.sounds.stop_fire = "m4_stop"
	self.new_m4.sounds.dryfire = "primary_dryfire"
	self.new_m4.sounds.enter_steelsight = "m4_tighten"
	self.new_m4.sounds.enter_steelsight = "primary_steel_sight_enter"
	self.new_m4.sounds.leave_steelsight = "primary_steel_sight_exit"
	self.new_m4.timers = {}
	self.new_m4.timers.reload_not_empty = 2.665
	self.new_m4.timers.reload_empty = 3.43
	self.new_m4.timers.unequip = 0.75
	self.new_m4.timers.equip = 0.7
	self.new_m4.name_id = "bm_w_m4"
	self.new_m4.desc_id = "bm_w_m4_desc"
	self.new_m4.description_id = "des_m4"
	self.new_m4.muzzleflash = "effects/payday2/particles/weapons/556_auto_fps"
	self.new_m4.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.new_m4.use_data = {}
	self.new_m4.use_data.selection_index = 2
	self.new_m4.DAMAGE = 1
	self.new_m4.CLIP_AMMO_MAX = 30
	self.new_m4.NR_CLIPS_MAX = math.round(total_damage_primary / 2 / self.new_m4.CLIP_AMMO_MAX)
	self.new_m4.AMMO_MAX = self.new_m4.CLIP_AMMO_MAX * self.new_m4.NR_CLIPS_MAX
	self.new_m4.AMMO_PICKUP = self:_pickup_chance(self.new_m4.AMMO_MAX, 2)
	self.new_m4.FIRE_MODE = "auto"
	self.new_m4.fire_mode_data = {}
	self.new_m4.fire_mode_data.fire_rate = 0.1
	self.new_m4.CAN_TOGGLE_FIREMODE = true
	self.new_m4.auto = {}
	self.new_m4.auto.fire_rate = 0.1
	self.new_m4.spread = {}
	self.new_m4.spread.standing = 3.5
	self.new_m4.spread.crouching = self.new_m4.spread.standing
	self.new_m4.spread.steelsight = 1
	self.new_m4.spread.moving_standing = self.new_m4.spread.standing
	self.new_m4.spread.moving_crouching = self.new_m4.spread.standing
	self.new_m4.spread.moving_steelsight = self.new_m4.spread.steelsight * 2
	self.new_m4.kick = {}
	self.new_m4.kick.standing = {
		0.6,
		0.8,
		-1,
		1
	}
	self.new_m4.kick.crouching = self.new_m4.kick.standing
	self.new_m4.kick.steelsight = self.new_m4.kick.standing
	self.new_m4.shake = {}
	self.new_m4.shake.fire_multiplier = 1
	self.new_m4.shake.fire_steelsight_multiplier = -1
	self.new_m4.autohit = autohit_rifle_default
	self.new_m4.aim_assist = aim_assist_rifle_default
	self.new_m4.animations = {}
	self.new_m4.animations.reload = "reload"
	self.new_m4.animations.reload_not_empty = "reload_not_empty"
	self.new_m4.animations.equip_id = "equip_m4"
	self.new_m4.animations.recoil_steelsight = true
	self.new_m4.transition_duration = 0.02
	self.new_m4.stats = {
		damage = 10,
		spread = 7,
		recoil = 7,
		spread_moving = 7,
		zoom = 3,
		concealment = 20,
		suppression = 10,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 1
	}
	self.glock_17 = {}
	self.glock_17.category = "pistol"
	self.glock_17.damage_melee = damage_melee_default
	self.glock_17.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.glock_17.sounds = {}
	self.glock_17.sounds.fire = "g17_fire"
	self.glock_17.sounds.dryfire = "secondary_dryfire"
	self.glock_17.sounds.enter_steelsight = "pistol_steel_sight_enter"
	self.glock_17.sounds.leave_steelsight = "pistol_steel_sight_exit"
	self.glock_17.FIRE_MODE = "single"
	self.glock_17.fire_mode_data = {}
	self.glock_17.fire_mode_data.fire_rate = 0.12
	self.glock_17.single = {}
	self.glock_17.single.fire_rate = 0.12
	self.glock_17.timers = {}
	self.glock_17.timers.reload_not_empty = 1.47
	self.glock_17.timers.reload_empty = 2.12
	self.glock_17.timers.unequip = 0.5
	self.glock_17.timers.equip = 0.5
	self.glock_17.name_id = "bm_w_glock_17"
	self.glock_17.desc_id = "bm_w_glock_17_desc"
	self.glock_17.description_id = "des_glock_17"
	self.glock_17.muzzleflash = "effects/payday2/particles/weapons/9mm_auto_fps"
	self.glock_17.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence_fps"
	self.glock_17.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.glock_17.use_data = {}
	self.glock_17.use_data.selection_index = 1
	self.glock_17.DAMAGE = 1
	self.glock_17.CLIP_AMMO_MAX = 17
	self.glock_17.NR_CLIPS_MAX = math.round(total_damage_secondary / 1.15 / self.glock_17.CLIP_AMMO_MAX)
	self.glock_17.AMMO_MAX = self.glock_17.CLIP_AMMO_MAX * self.glock_17.NR_CLIPS_MAX
	self.glock_17.AMMO_PICKUP = self:_pickup_chance(self.glock_17.AMMO_MAX, 1)
	self.glock_17.spread = {}
	self.glock_17.spread.standing = self.new_m4.spread.standing * 0.75
	self.glock_17.spread.crouching = self.new_m4.spread.standing * 0.75
	self.glock_17.spread.steelsight = self.new_m4.spread.steelsight
	self.glock_17.spread.moving_standing = self.new_m4.spread.standing * 0.75
	self.glock_17.spread.moving_crouching = self.new_m4.spread.standing * 0.75
	self.glock_17.spread.moving_steelsight = self.new_m4.spread.moving_steelsight
	self.glock_17.kick = {}
	self.glock_17.kick.standing = {
		1.2,
		1.8,
		-0.5,
		0.5
	}
	self.glock_17.kick.crouching = self.glock_17.kick.standing
	self.glock_17.kick.steelsight = self.glock_17.kick.standing
	self.glock_17.crosshair = {}
	self.glock_17.crosshair.standing = {}
	self.glock_17.crosshair.crouching = {}
	self.glock_17.crosshair.steelsight = {}
	self.glock_17.crosshair.standing.offset = 0.175
	self.glock_17.crosshair.standing.moving_offset = 0.6
	self.glock_17.crosshair.standing.kick_offset = 0.4
	self.glock_17.crosshair.crouching.offset = 0.1
	self.glock_17.crosshair.crouching.moving_offset = 0.6
	self.glock_17.crosshair.crouching.kick_offset = 0.3
	self.glock_17.crosshair.steelsight.hidden = true
	self.glock_17.crosshair.steelsight.offset = 0
	self.glock_17.crosshair.steelsight.moving_offset = 0
	self.glock_17.crosshair.steelsight.kick_offset = 0.1
	self.glock_17.shake = {}
	self.glock_17.shake.fire_multiplier = 1
	self.glock_17.shake.fire_steelsight_multiplier = 1
	self.glock_17.autohit = autohit_pistol_default
	self.glock_17.aim_assist = aim_assist_pistol_default
	self.glock_17.weapon_hold = "glock"
	self.glock_17.animations = {}
	self.glock_17.animations.equip_id = "equip_glock"
	self.glock_17.animations.recoil_steelsight = true
	self.glock_17.transition_duration = 0
	self.glock_17.stats = {
		damage = 6,
		spread = 7,
		recoil = 7,
		spread_moving = 7,
		zoom = 1,
		concealment = 30,
		suppression = 16,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 1
	}
	self.mp9 = {}
	self.mp9.category = "smg"
	self.mp9.damage_melee = damage_melee_default
	self.mp9.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.mp9.sounds = {}
	self.mp9.sounds.fire = "mp9_fire_single"
	self.mp9.sounds.fire_single = "mp9_fire_single"
	self.mp9.sounds.fire_auto = "mp9_fire"
	self.mp9.sounds.stop_fire = "mp9_stop"
	self.mp9.sounds.dryfire = "secondary_dryfire"
	self.mp9.sounds.enter_steelsight = "secondary_steel_sight_enter"
	self.mp9.sounds.leave_steelsight = "secondary_steel_sight_exit"
	self.mp9.timers = {}
	self.mp9.timers.reload_not_empty = 1.51
	self.mp9.timers.reload_empty = 2.48
	self.mp9.timers.unequip = 0.7
	self.mp9.timers.equip = 0.55
	self.mp9.name_id = "bm_w_mp9"
	self.mp9.desc_id = "bm_w_mp9_desc"
	self.mp9.description_id = "des_mp9"
	self.mp9.muzzleflash = "effects/payday2/particles/weapons/9mm_auto_fps"
	self.mp9.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence_fps"
	self.mp9.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.mp9.use_data = {}
	self.mp9.use_data.selection_index = 1
	self.mp9.DAMAGE = 1
	self.mp9.CLIP_AMMO_MAX = 30
	self.mp9.NR_CLIPS_MAX = math.round(total_damage_secondary / 1.15 / self.mp9.CLIP_AMMO_MAX)
	self.mp9.AMMO_MAX = self.mp9.CLIP_AMMO_MAX * self.mp9.NR_CLIPS_MAX
	self.mp9.AMMO_PICKUP = self:_pickup_chance(self.mp9.AMMO_MAX, 1)
	self.mp9.FIRE_MODE = "auto"
	self.mp9.fire_mode_data = {}
	self.mp9.fire_mode_data.fire_rate = 0.063
	self.mp9.CAN_TOGGLE_FIREMODE = true
	self.mp9.auto = {}
	self.mp9.auto.fire_rate = 0.063
	self.mp9.spread = {}
	self.mp9.spread.standing = self.new_m4.spread.standing * 0.75
	self.mp9.spread.crouching = self.new_m4.spread.standing * 0.75
	self.mp9.spread.steelsight = self.new_m4.spread.steelsight
	self.mp9.spread.moving_standing = self.new_m4.spread.standing * 0.75
	self.mp9.spread.moving_crouching = self.new_m4.spread.standing * 0.75
	self.mp9.spread.moving_steelsight = self.new_m4.spread.moving_steelsight
	self.mp9.kick = {}
	self.mp9.kick.standing = {
		-1.2,
		1.2,
		-1,
		1
	}
	self.mp9.kick.crouching = self.mp9.kick.standing
	self.mp9.kick.steelsight = self.mp9.kick.standing
	self.mp9.crosshair = {}
	self.mp9.crosshair.standing = {}
	self.mp9.crosshair.crouching = {}
	self.mp9.crosshair.steelsight = {}
	self.mp9.crosshair.standing.offset = 0.4
	self.mp9.crosshair.standing.moving_offset = 0.7
	self.mp9.crosshair.standing.kick_offset = 0.6
	self.mp9.crosshair.crouching.offset = 0.3
	self.mp9.crosshair.crouching.moving_offset = 0.6
	self.mp9.crosshair.crouching.kick_offset = 0.4
	self.mp9.crosshair.steelsight.hidden = true
	self.mp9.crosshair.steelsight.offset = 0
	self.mp9.crosshair.steelsight.moving_offset = 0
	self.mp9.crosshair.steelsight.kick_offset = 0.4
	self.mp9.shake = {}
	self.mp9.shake.fire_multiplier = 1
	self.mp9.shake.fire_steelsight_multiplier = -1
	self.mp9.autohit = autohit_smg_default
	self.mp9.aim_assist = aim_assist_smg_default
	self.mp9.animations = {}
	self.mp9.animations.equip_id = "equip_mac11_rifle"
	self.mp9.animations.recoil_steelsight = true
	self.mp9.stats = {
		damage = 9,
		spread = 7,
		recoil = 7,
		spread_moving = 8,
		zoom = 3,
		concealment = 24,
		suppression = 16,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 1
	}
	self.r870 = {}
	self.r870.category = "shotgun"
	self.r870.damage_melee = damage_melee_default
	self.r870.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.r870.sounds = {}
	self.r870.sounds.fire = "remington_fire"
	self.r870.sounds.dryfire = "shotgun_dryfire"
	self.r870.sounds.enter_steelsight = "primary_steel_sight_enter"
	self.r870.sounds.leave_steelsight = "primary_steel_sight_exit"
	self.r870.timers = {}
	self.r870.timers.unequip = 0.85
	self.r870.timers.equip = 0.85
	self.r870.name_id = "bm_w_r870"
	self.r870.desc_id = "bm_w_r870_desc"
	self.r870.description_id = "des_r870"
	self.r870.muzzleflash = "effects/payday2/particles/weapons/762_auto_fps"
	self.r870.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug_semi"
	self.r870.use_data = {}
	self.r870.use_data.selection_index = 2
	self.r870.use_data.align_place = "right_hand"
	self.r870.DAMAGE = 6
	self.r870.damage_near = 700
	self.r870.damage_far = 1500
	self.r870.rays = 5
	self.r870.CLIP_AMMO_MAX = 6
	self.r870.NR_CLIPS_MAX = math.round(total_damage_primary / 6.5 / self.r870.CLIP_AMMO_MAX)
	self.r870.AMMO_MAX = self.r870.CLIP_AMMO_MAX * self.r870.NR_CLIPS_MAX
	self.r870.AMMO_PICKUP = self:_pickup_chance(self.r870.AMMO_MAX, 2)
	self.r870.FIRE_MODE = "single"
	self.r870.fire_mode_data = {}
	self.r870.fire_mode_data.fire_rate = 0.575
	self.r870.single = {}
	self.r870.single.fire_rate = 0.575
	self.r870.spread = {}
	self.r870.spread.standing = self.new_m4.spread.standing * 1
	self.r870.spread.crouching = self.new_m4.spread.standing * 1
	self.r870.spread.steelsight = self.new_m4.spread.standing * 0.8
	self.r870.spread.moving_standing = self.new_m4.spread.standing * 1
	self.r870.spread.moving_crouching = self.new_m4.spread.standing * 1
	self.r870.spread.moving_steelsight = self.new_m4.spread.standing * 0.8
	self.r870.kick = {}
	self.r870.kick.standing = {
		1.9,
		2,
		-0.2,
		0.2
	}
	self.r870.kick.crouching = self.r870.kick.standing
	self.r870.kick.steelsight = {
		1.5,
		1.7,
		-0.2,
		0.2
	}
	self.r870.crosshair = {}
	self.r870.crosshair.standing = {}
	self.r870.crosshair.crouching = {}
	self.r870.crosshair.steelsight = {}
	self.r870.crosshair.standing.offset = 0.7
	self.r870.crosshair.standing.moving_offset = 0.7
	self.r870.crosshair.standing.kick_offset = 0.8
	self.r870.crosshair.crouching.offset = 0.65
	self.r870.crosshair.crouching.moving_offset = 0.65
	self.r870.crosshair.crouching.kick_offset = 0.75
	self.r870.crosshair.steelsight.hidden = true
	self.r870.crosshair.steelsight.offset = 0
	self.r870.crosshair.steelsight.moving_offset = 0
	self.r870.crosshair.steelsight.kick_offset = 0
	self.r870.shake = {}
	self.r870.shake.fire_multiplier = 1
	self.r870.shake.fire_steelsight_multiplier = -1
	self.r870.autohit = autohit_shotgun_default
	self.r870.aim_assist = aim_assist_shotgun_default
	self.r870.weapon_hold = "r870_shotgun"
	self.r870.animations = {}
	self.r870.animations.equip_id = "equip_r870_shotgun"
	self.r870.animations.recoil_steelsight = true
	self.r870.stats = {
		damage = 23,
		spread = 8,
		recoil = 3,
		spread_moving = 6,
		zoom = 3,
		concealment = 11,
		suppression = 5,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 1
	}
	self.glock_18c = {}
	self.glock_18c.category = "pistol"
	self.glock_18c.damage_melee = damage_melee_default
	self.glock_18c.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.glock_18c.sounds = {}
	self.glock_18c.sounds.fire = "g18c_fire_single"
	self.glock_18c.sounds.fire_single = "g18c_fire_single"
	self.glock_18c.sounds.fire_auto = "g18c_fire"
	self.glock_18c.sounds.stop_fire = "g18c_stop"
	self.glock_18c.sounds.dryfire = "secondary_dryfire"
	self.glock_18c.sounds.enter_steelsight = "pistol_steel_sight_enter"
	self.glock_18c.sounds.leave_steelsight = "pistol_steel_sight_exit"
	self.glock_18c.timers = {}
	self.glock_18c.timers.reload_not_empty = 1.47
	self.glock_18c.timers.reload_empty = 2.12
	self.glock_18c.timers.unequip = 0.55
	self.glock_18c.timers.equip = 0.55
	self.glock_18c.name_id = "bm_w_glock_18c"
	self.glock_18c.desc_id = "bm_w_glock_18c_desc"
	self.glock_18c.description_id = "des_glock"
	self.glock_18c.muzzleflash = "effects/payday2/particles/weapons/9mm_auto_fps"
	self.glock_18c.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence_fps"
	self.glock_18c.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.glock_18c.use_data = {}
	self.glock_18c.use_data.selection_index = 1
	self.glock_18c.DAMAGE = 1
	self.glock_18c.CLIP_AMMO_MAX = 20
	self.glock_18c.NR_CLIPS_MAX = math.round(total_damage_secondary / 1.15 / self.glock_18c.CLIP_AMMO_MAX)
	self.glock_18c.AMMO_MAX = self.glock_18c.CLIP_AMMO_MAX * self.glock_18c.NR_CLIPS_MAX
	self.glock_18c.AMMO_PICKUP = self:_pickup_chance(self.glock_18c.AMMO_MAX, 1)
	self.glock_18c.FIRE_MODE = "auto"
	self.glock_18c.fire_mode_data = {}
	self.glock_18c.fire_mode_data.fire_rate = 0.066
	self.glock_18c.CAN_TOGGLE_FIREMODE = true
	self.glock_18c.auto = {}
	self.glock_18c.auto.fire_rate = 0.066
	self.glock_18c.spread = {}
	self.glock_18c.spread.standing = self.new_m4.spread.standing * 0.75
	self.glock_18c.spread.crouching = self.new_m4.spread.standing * 0.75
	self.glock_18c.spread.steelsight = self.new_m4.spread.steelsight
	self.glock_18c.spread.moving_standing = self.new_m4.spread.standing * 0.75
	self.glock_18c.spread.moving_crouching = self.new_m4.spread.standing * 0.75
	self.glock_18c.spread.moving_steelsight = self.new_m4.spread.moving_steelsight
	self.glock_18c.kick = {}
	self.glock_18c.kick.standing = self.glock_17.kick.standing
	self.glock_18c.kick.crouching = self.glock_18c.kick.standing
	self.glock_18c.kick.steelsight = self.glock_18c.kick.standing
	self.glock_18c.crosshair = {}
	self.glock_18c.crosshair.standing = {}
	self.glock_18c.crosshair.crouching = {}
	self.glock_18c.crosshair.steelsight = {}
	self.glock_18c.crosshair.standing.offset = 0.3
	self.glock_18c.crosshair.standing.moving_offset = 0.5
	self.glock_18c.crosshair.standing.kick_offset = 0.6
	self.glock_18c.crosshair.crouching.offset = 0.2
	self.glock_18c.crosshair.crouching.moving_offset = 0.5
	self.glock_18c.crosshair.crouching.kick_offset = 0.3
	self.glock_18c.crosshair.steelsight.hidden = true
	self.glock_18c.crosshair.steelsight.offset = 0.2
	self.glock_18c.crosshair.steelsight.moving_offset = 0.2
	self.glock_18c.crosshair.steelsight.kick_offset = 0.3
	self.glock_18c.shake = {}
	self.glock_18c.shake.fire_multiplier = 1
	self.glock_18c.shake.fire_steelsight_multiplier = 1
	self.glock_18c.autohit = autohit_pistol_default
	self.glock_18c.aim_assist = aim_assist_pistol_default
	self.glock_18c.weapon_hold = "glock"
	self.glock_18c.animations = {}
	self.glock_18c.animations.fire = "recoil"
	self.glock_18c.animations.reload = "reload"
	self.glock_18c.animations.reload_not_empty = "reload_not_empty"
	self.glock_18c.animations.equip_id = "equip_glock"
	self.glock_18c.animations.recoil_steelsight = true
	self.glock_18c.challenges = {}
	self.glock_18c.challenges.group = "handgun"
	self.glock_18c.challenges.weapon = "glock"
	self.glock_18c.transition_duration = 0
	self.glock_18c.stats = {
		damage = 9,
		spread = 5,
		recoil = 6,
		spread_moving = 9,
		zoom = 1,
		concealment = 29,
		suppression = 16,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 1
	}
	self.amcar = {}
	self.amcar.category = "assault_rifle"
	self.amcar.damage_melee = damage_melee_default
	self.amcar.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.amcar.sounds = {}
	self.amcar.sounds.fire = "amcar_fire_single"
	self.amcar.sounds.fire_single = "amcar_fire_single"
	self.amcar.sounds.fire_auto = "amcar_fire"
	self.amcar.sounds.stop_fire = "amcar_stop"
	self.amcar.sounds.dryfire = "primary_dryfire"
	self.amcar.sounds.enter_steelsight = "m4_tighten"
	self.amcar.sounds.enter_steelsight = "primary_steel_sight_enter"
	self.amcar.sounds.leave_steelsight = "primary_steel_sight_exit"
	self.amcar.timers = {}
	self.amcar.timers.reload_not_empty = 2.25
	self.amcar.timers.reload_empty = 3
	self.amcar.timers.unequip = 0.8
	self.amcar.timers.equip = 0.7
	self.amcar.name_id = "bm_w_amcar"
	self.amcar.desc_id = "bm_w_amcar_desc"
	self.amcar.description_id = "des_m4"
	self.amcar.muzzleflash = "effects/payday2/particles/weapons/556_auto_fps"
	self.amcar.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.amcar.use_data = {}
	self.amcar.use_data.selection_index = 2
	self.amcar.DAMAGE = 1
	self.amcar.CLIP_AMMO_MAX = 20
	self.amcar.NR_CLIPS_MAX = math.round(total_damage_primary / 1.6 / self.amcar.CLIP_AMMO_MAX)
	self.amcar.AMMO_MAX = self.amcar.CLIP_AMMO_MAX * self.amcar.NR_CLIPS_MAX
	self.amcar.AMMO_PICKUP = self:_pickup_chance(self.amcar.AMMO_MAX, 2)
	self.amcar.FIRE_MODE = "auto"
	self.amcar.fire_mode_data = {}
	self.amcar.fire_mode_data.fire_rate = 0.11
	self.amcar.CAN_TOGGLE_FIREMODE = true
	self.amcar.auto = {}
	self.amcar.auto.fire_rate = 0.11
	self.amcar.spread = {}
	self.amcar.spread.standing = self.new_m4.spread.standing
	self.amcar.spread.crouching = self.new_m4.spread.standing
	self.amcar.spread.steelsight = self.new_m4.spread.steelsight
	self.amcar.spread.moving_standing = self.new_m4.spread.standing
	self.amcar.spread.moving_crouching = self.new_m4.spread.standing
	self.amcar.spread.moving_steelsight = self.new_m4.spread.moving_steelsight
	self.amcar.kick = {}
	self.amcar.kick.standing = self.new_m4.kick.standing
	self.amcar.kick.crouching = self.amcar.kick.standing
	self.amcar.kick.steelsight = self.amcar.kick.standing
	self.amcar.crosshair = {}
	self.amcar.crosshair.standing = {}
	self.amcar.crosshair.crouching = {}
	self.amcar.crosshair.steelsight = {}
	self.amcar.crosshair.standing.offset = 0.16
	self.amcar.crosshair.standing.moving_offset = 0.8
	self.amcar.crosshair.standing.kick_offset = 0.6
	self.amcar.crosshair.crouching.offset = 0.08
	self.amcar.crosshair.crouching.moving_offset = 0.7
	self.amcar.crosshair.crouching.kick_offset = 0.4
	self.amcar.crosshair.steelsight.hidden = true
	self.amcar.crosshair.steelsight.offset = 0
	self.amcar.crosshair.steelsight.moving_offset = 0
	self.amcar.crosshair.steelsight.kick_offset = 0.1
	self.amcar.shake = {}
	self.amcar.shake.fire_multiplier = 1
	self.amcar.shake.fire_steelsight_multiplier = -1
	self.amcar.autohit = autohit_rifle_default
	self.amcar.aim_assist = aim_assist_rifle_default
	self.amcar.weapon_hold = "m4"
	self.amcar.animations = {}
	self.amcar.animations.reload = "reload"
	self.amcar.animations.reload_not_empty = "reload_not_empty"
	self.amcar.animations.equip_id = "equip_m4"
	self.amcar.animations.recoil_steelsight = true
	self.amcar.stats = {
		damage = 7,
		spread = 6,
		recoil = 8,
		spread_moving = 6,
		zoom = 3,
		concealment = 21,
		suppression = 10,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 1
	}
	self.m16 = {}
	self.m16.category = "assault_rifle"
	self.m16.damage_melee = damage_melee_default
	self.m16.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.m16.sounds = {}
	self.m16.sounds.fire = "m16_fire_single"
	self.m16.sounds.fire_single = "m16_fire_single"
	self.m16.sounds.fire_auto = "m16_fire"
	self.m16.sounds.stop_fire = "m16_stop"
	self.m16.sounds.dryfire = "primary_dryfire"
	self.m16.sounds.enter_steelsight = "m4_tighten"
	self.m16.sounds.enter_steelsight = "primary_steel_sight_enter"
	self.m16.sounds.leave_steelsight = "primary_steel_sight_exit"
	self.m16.timers = {}
	self.m16.timers.reload_not_empty = 2.665
	self.m16.timers.reload_empty = 3.73
	self.m16.timers.unequip = 0.8
	self.m16.timers.equip = 0.8
	self.m16.name_id = "bm_w_m16"
	self.m16.desc_id = "bm_w_m16_desc"
	self.m16.description_id = "des_m4"
	self.m16.muzzleflash = "effects/payday2/particles/weapons/762_auto_fps"
	self.m16.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.m16.use_data = {}
	self.m16.use_data.selection_index = 2
	self.m16.DAMAGE = 1
	self.m16.CLIP_AMMO_MAX = 30
	self.m16.NR_CLIPS_MAX = math.round(total_damage_primary / 3 / self.m16.CLIP_AMMO_MAX)
	self.m16.AMMO_MAX = self.m16.CLIP_AMMO_MAX * self.m16.NR_CLIPS_MAX
	self.m16.AMMO_PICKUP = self:_pickup_chance(self.m16.AMMO_MAX, 2)
	self.m16.FIRE_MODE = "auto"
	self.m16.fire_mode_data = {}
	self.m16.fire_mode_data.fire_rate = 0.07
	self.m16.CAN_TOGGLE_FIREMODE = true
	self.m16.auto = {}
	self.m16.auto.fire_rate = 0.07
	self.m16.spread = {}
	self.m16.spread.standing = self.new_m4.spread.standing
	self.m16.spread.crouching = self.new_m4.spread.standing
	self.m16.spread.steelsight = self.new_m4.spread.steelsight
	self.m16.spread.moving_standing = self.new_m4.spread.standing
	self.m16.spread.moving_crouching = self.new_m4.spread.standing
	self.m16.spread.moving_steelsight = self.new_m4.spread.moving_steelsight
	self.m16.kick = {}
	self.m16.kick.standing = self.new_m4.kick.standing
	self.m16.kick.crouching = self.m16.kick.standing
	self.m16.kick.steelsight = self.m16.kick.standing
	self.m16.crosshair = {}
	self.m16.crosshair.standing = {}
	self.m16.crosshair.crouching = {}
	self.m16.crosshair.steelsight = {}
	self.m16.crosshair.standing.offset = 0.16
	self.m16.crosshair.standing.moving_offset = 0.8
	self.m16.crosshair.standing.kick_offset = 0.6
	self.m16.crosshair.crouching.offset = 0.08
	self.m16.crosshair.crouching.moving_offset = 0.7
	self.m16.crosshair.crouching.kick_offset = 0.4
	self.m16.crosshair.steelsight.hidden = true
	self.m16.crosshair.steelsight.offset = 0
	self.m16.crosshair.steelsight.moving_offset = 0
	self.m16.crosshair.steelsight.kick_offset = 0.1
	self.m16.shake = {}
	self.m16.shake.fire_multiplier = 1
	self.m16.shake.fire_steelsight_multiplier = -1
	self.m16.autohit = autohit_rifle_default
	self.m16.aim_assist = aim_assist_rifle_default
	self.m16.weapon_hold = "m4"
	self.m16.animations = {}
	self.m16.animations.reload = "reload"
	self.m16.animations.reload_not_empty = "reload_not_empty"
	self.m16.animations.equip_id = "equip_m4"
	self.m16.animations.recoil_steelsight = true
	self.m16.stats = {
		damage = 13,
		spread = 7,
		recoil = 10,
		spread_moving = 5,
		zoom = 4,
		concealment = 17,
		suppression = 10,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 1
	}
	self.olympic = {}
	self.olympic.category = "smg"
	self.olympic.damage_melee = damage_melee_default
	self.olympic.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.olympic.sounds = {}
	self.olympic.sounds.fire = "m4_olympic_fire_single"
	self.olympic.sounds.fire_single = "m4_olympic_fire_single"
	self.olympic.sounds.fire_auto = "m4_olympic_fire"
	self.olympic.sounds.stop_fire = "m4_olympic_stop"
	self.olympic.sounds.dryfire = "primary_dryfire"
	self.olympic.sounds.enter_steelsight = "m4_tighten"
	self.olympic.sounds.enter_steelsight = "primary_steel_sight_enter"
	self.olympic.sounds.leave_steelsight = "primary_steel_sight_exit"
	self.olympic.timers = {}
	self.olympic.timers.reload_not_empty = 3
	self.olympic.timers.reload_empty = 4.22
	self.olympic.timers.unequip = 0.6
	self.olympic.timers.equip = 0.5
	self.olympic.name_id = "bm_w_olympic"
	self.olympic.desc_id = "bm_w_olympic_desc"
	self.olympic.description_id = "des_m4"
	self.olympic.muzzleflash = "effects/payday2/particles/weapons/556_auto_fps"
	self.olympic.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.olympic.use_data = {}
	self.olympic.use_data.selection_index = 1
	self.olympic.DAMAGE = 1
	self.olympic.CLIP_AMMO_MAX = 25
	self.olympic.NR_CLIPS_MAX = math.round(total_damage_secondary / 1.6 / self.olympic.CLIP_AMMO_MAX)
	self.olympic.AMMO_MAX = self.olympic.CLIP_AMMO_MAX * self.olympic.NR_CLIPS_MAX
	self.olympic.AMMO_PICKUP = self:_pickup_chance(self.olympic.AMMO_MAX, 1)
	self.olympic.FIRE_MODE = "auto"
	self.olympic.fire_mode_data = {}
	self.olympic.fire_mode_data.fire_rate = 0.088
	self.olympic.CAN_TOGGLE_FIREMODE = true
	self.olympic.auto = {}
	self.olympic.auto.fire_rate = 0.088
	self.olympic.spread = {}
	self.olympic.spread.standing = self.new_m4.spread.standing * 0.8
	self.olympic.spread.crouching = self.new_m4.spread.standing * 0.8
	self.olympic.spread.steelsight = self.new_m4.spread.steelsight
	self.olympic.spread.moving_standing = self.new_m4.spread.standing * 0.8
	self.olympic.spread.moving_crouching = self.new_m4.spread.standing * 0.8
	self.olympic.spread.moving_steelsight = self.new_m4.spread.moving_steelsight
	self.olympic.kick = {}
	self.olympic.kick.standing = self.new_m4.kick.standing
	self.olympic.kick.crouching = self.olympic.kick.standing
	self.olympic.kick.steelsight = self.olympic.kick.standing
	self.olympic.crosshair = {}
	self.olympic.crosshair.standing = {}
	self.olympic.crosshair.crouching = {}
	self.olympic.crosshair.steelsight = {}
	self.olympic.crosshair.standing.offset = 0.16
	self.olympic.crosshair.standing.moving_offset = 0.8
	self.olympic.crosshair.standing.kick_offset = 0.6
	self.olympic.crosshair.crouching.offset = 0.08
	self.olympic.crosshair.crouching.moving_offset = 0.7
	self.olympic.crosshair.crouching.kick_offset = 0.4
	self.olympic.crosshair.steelsight.hidden = true
	self.olympic.crosshair.steelsight.offset = 0
	self.olympic.crosshair.steelsight.moving_offset = 0
	self.olympic.crosshair.steelsight.kick_offset = 0.1
	self.olympic.shake = {}
	self.olympic.shake.fire_multiplier = 1
	self.olympic.shake.fire_steelsight_multiplier = -1
	self.olympic.autohit = autohit_smg_default
	self.olympic.aim_assist = aim_assist_smg_default
	self.olympic.weapon_hold = "m4"
	self.olympic.animations = {}
	self.olympic.animations.reload = "reload"
	self.olympic.animations.reload_not_empty = "reload_not_empty"
	self.olympic.animations.equip_id = "equip_mp5"
	self.olympic.animations.recoil_steelsight = true
	self.olympic.stats = {
		damage = 8,
		spread = 8,
		recoil = 10,
		spread_moving = 8,
		zoom = 3,
		concealment = 24,
		suppression = 10,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 1
	}
	self.ak74 = {}
	self.ak74.category = "assault_rifle"
	self.ak74.damage_melee = damage_melee_default
	self.ak74.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.ak74.sounds = {}
	self.ak74.sounds.fire = "ak74_fire_single"
	self.ak74.sounds.fire_single = "ak74_fire_single"
	self.ak74.sounds.fire_auto = "ak74_fire"
	self.ak74.sounds.stop_fire = "ak74_stop"
	self.ak74.sounds.dryfire = "primary_dryfire"
	self.ak74.sounds.enter_steelsight = "primary_steel_sight_enter"
	self.ak74.sounds.leave_steelsight = "primary_steel_sight_exit"
	self.ak74.timers = {}
	self.ak74.timers.reload_not_empty = 2.8
	self.ak74.timers.reload_empty = 3.87
	self.ak74.timers.unequip = 0.8
	self.ak74.timers.equip = 0.8
	self.ak74.name_id = "bm_w_ak74"
	self.ak74.desc_id = "bm_w_ak74_desc"
	self.ak74.description_id = "des_ak47"
	self.ak74.muzzleflash = "effects/payday2/particles/weapons/556_auto_fps"
	self.ak74.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.ak74.use_data = {}
	self.ak74.use_data.selection_index = 2
	self.ak74.DAMAGE = 1
	self.ak74.CLIP_AMMO_MAX = 30
	self.ak74.NR_CLIPS_MAX = math.round(total_damage_primary / 2.5 / self.ak74.CLIP_AMMO_MAX)
	self.ak74.AMMO_MAX = self.ak74.CLIP_AMMO_MAX * self.ak74.NR_CLIPS_MAX
	self.ak74.AMMO_PICKUP = self:_pickup_chance(self.ak74.AMMO_MAX, 2)
	self.ak74.FIRE_MODE = "auto"
	self.ak74.fire_mode_data = {}
	self.ak74.fire_mode_data.fire_rate = 0.092
	self.ak74.CAN_TOGGLE_FIREMODE = true
	self.ak74.auto = {}
	self.ak74.auto.fire_rate = 0.092
	self.ak74.spread = {}
	self.ak74.spread.standing = self.new_m4.spread.standing
	self.ak74.spread.crouching = self.new_m4.spread.standing
	self.ak74.spread.steelsight = self.new_m4.spread.steelsight
	self.ak74.spread.moving_standing = self.new_m4.spread.standing
	self.ak74.spread.moving_crouching = self.new_m4.spread.standing
	self.ak74.spread.moving_steelsight = self.new_m4.spread.moving_steelsight
	self.ak74.kick = {}
	self.ak74.kick.standing = self.new_m4.kick.standing
	self.ak74.kick.crouching = self.ak74.kick.standing
	self.ak74.kick.steelsight = self.ak74.kick.standing
	self.ak74.crosshair = {}
	self.ak74.crosshair.standing = {}
	self.ak74.crosshair.crouching = {}
	self.ak74.crosshair.steelsight = {}
	self.ak74.crosshair.standing.offset = 0.16
	self.ak74.crosshair.standing.moving_offset = 0.8
	self.ak74.crosshair.standing.kick_offset = 0.6
	self.ak74.crosshair.crouching.offset = 0.08
	self.ak74.crosshair.crouching.moving_offset = 0.7
	self.ak74.crosshair.crouching.kick_offset = 0.4
	self.ak74.crosshair.steelsight.hidden = true
	self.ak74.crosshair.steelsight.offset = 0
	self.ak74.crosshair.steelsight.moving_offset = 0
	self.ak74.crosshair.steelsight.kick_offset = 0.1
	self.ak74.shake = {}
	self.ak74.shake.fire_multiplier = 1
	self.ak74.shake.fire_steelsight_multiplier = -1
	self.ak74.autohit = autohit_rifle_default
	self.ak74.aim_assist = aim_assist_rifle_default
	self.ak74.weapon_hold = "ak47"
	self.ak74.animations = {}
	self.ak74.animations.equip_id = "equip_ak47"
	self.ak74.animations.recoil_steelsight = true
	self.ak74.challenges = {}
	self.ak74.challenges.group = "rifle"
	self.ak74.challenges.weapon = "ak47"
	self.ak74.stats = {
		damage = 12,
		spread = 6,
		recoil = 6,
		spread_moving = 6,
		zoom = 3,
		concealment = 16,
		suppression = 10,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 1
	}
	self.akm = {}
	self.akm.category = "assault_rifle"
	self.akm.damage_melee = damage_melee_default
	self.akm.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.akm.sounds = {}
	self.akm.sounds.fire = "akm_fire_single"
	self.akm.sounds.fire_single = "akm_fire_single"
	self.akm.sounds.fire_auto = "akm_fire"
	self.akm.sounds.stop_fire = "akm_stop"
	self.akm.sounds.dryfire = "primary_dryfire"
	self.akm.sounds.enter_steelsight = "primary_steel_sight_enter"
	self.akm.sounds.leave_steelsight = "primary_steel_sight_exit"
	self.akm.timers = {}
	self.akm.timers.reload_not_empty = 2.8
	self.akm.timers.reload_empty = 3.87
	self.akm.timers.unequip = 0.8
	self.akm.timers.equip = 0.8
	self.akm.name_id = "bm_w_akm"
	self.akm.desc_id = "bm_w_akm_desc"
	self.akm.description_id = "des_ak47"
	self.akm.muzzleflash = "effects/payday2/particles/weapons/762_auto_fps"
	self.akm.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.akm.use_data = {}
	self.akm.use_data.selection_index = 2
	self.akm.DAMAGE = 1.25
	self.akm.CLIP_AMMO_MAX = 30
	self.akm.NR_CLIPS_MAX = math.round(total_damage_primary / 4 / self.akm.CLIP_AMMO_MAX)
	self.akm.AMMO_MAX = self.akm.CLIP_AMMO_MAX * self.akm.NR_CLIPS_MAX
	self.akm.AMMO_PICKUP = self:_pickup_chance(self.akm.AMMO_MAX, 2)
	self.akm.FIRE_MODE = "auto"
	self.akm.fire_mode_data = {}
	self.akm.fire_mode_data.fire_rate = 0.107
	self.akm.CAN_TOGGLE_FIREMODE = true
	self.akm.auto = {}
	self.akm.auto.fire_rate = 0.107
	self.akm.spread = {}
	self.akm.spread.standing = self.new_m4.spread.standing
	self.akm.spread.crouching = self.new_m4.spread.standing
	self.akm.spread.steelsight = self.new_m4.spread.steelsight
	self.akm.spread.moving_standing = self.new_m4.spread.standing
	self.akm.spread.moving_crouching = self.new_m4.spread.standing
	self.akm.spread.moving_steelsight = self.new_m4.spread.moving_steelsight
	self.akm.kick = {}
	self.akm.kick.standing = self.new_m4.kick.standing
	self.akm.kick.crouching = self.akm.kick.standing
	self.akm.kick.steelsight = self.akm.kick.standing
	self.akm.crosshair = {}
	self.akm.crosshair.standing = {}
	self.akm.crosshair.crouching = {}
	self.akm.crosshair.steelsight = {}
	self.akm.crosshair.standing.offset = 0.16
	self.akm.crosshair.standing.moving_offset = 0.8
	self.akm.crosshair.standing.kick_offset = 0.6
	self.akm.crosshair.crouching.offset = 0.08
	self.akm.crosshair.crouching.moving_offset = 0.7
	self.akm.crosshair.crouching.kick_offset = 0.4
	self.akm.crosshair.steelsight.hidden = true
	self.akm.crosshair.steelsight.offset = 0
	self.akm.crosshair.steelsight.moving_offset = 0
	self.akm.crosshair.steelsight.kick_offset = 0.1
	self.akm.shake = {}
	self.akm.shake.fire_multiplier = 1
	self.akm.shake.fire_steelsight_multiplier = -1
	self.akm.autohit = autohit_rifle_default
	self.akm.aim_assist = aim_assist_rifle_default
	self.akm.weapon_hold = "ak47"
	self.akm.animations = {}
	self.akm.animations.equip_id = "equip_ak47"
	self.akm.animations.recoil_steelsight = true
	self.akm.challenges = {}
	self.akm.challenges.group = "rifle"
	self.akm.challenges.weapon = "ak47"
	self.akm.stats = {
		damage = 17,
		spread = 6,
		recoil = 5,
		spread_moving = 6,
		zoom = 3,
		concealment = 13,
		suppression = 8,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 1
	}
	self.akm_gold = {}
	self.akm_gold.category = "assault_rifle"
	self.akm_gold.damage_melee = damage_melee_default
	self.akm_gold.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.akm_gold.sounds = {}
	self.akm_gold.sounds.fire = "akm_fire_single"
	self.akm_gold.sounds.fire_single = "akm_fire_single"
	self.akm_gold.sounds.fire_auto = "akm_fire"
	self.akm_gold.sounds.stop_fire = "akm_stop"
	self.akm_gold.sounds.dryfire = "primary_dryfire"
	self.akm_gold.sounds.enter_steelsight = "primary_steel_sight_enter"
	self.akm_gold.sounds.leave_steelsight = "primary_steel_sight_exit"
	self.akm_gold.timers = {}
	self.akm_gold.timers.reload_not_empty = 2.8
	self.akm_gold.timers.reload_empty = 3.87
	self.akm_gold.timers.unequip = 0.8
	self.akm_gold.timers.equip = 0.8
	self.akm_gold.name_id = "bm_w_akm_gold"
	self.akm_gold.desc_id = "bm_w_akm_gold_desc"
	self.akm_gold.description_id = "des_ak47"
	self.akm_gold.muzzleflash = "effects/payday2/particles/weapons/762_auto_fps"
	self.akm_gold.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.akm_gold.use_data = {}
	self.akm_gold.use_data.selection_index = 2
	self.akm_gold.DAMAGE = 1.25
	self.akm_gold.CLIP_AMMO_MAX = 30
	self.akm_gold.NR_CLIPS_MAX = math.round(total_damage_primary / 4 / self.akm_gold.CLIP_AMMO_MAX)
	self.akm_gold.AMMO_MAX = self.akm_gold.CLIP_AMMO_MAX * self.akm_gold.NR_CLIPS_MAX
	self.akm_gold.AMMO_PICKUP = self:_pickup_chance(self.akm_gold.AMMO_MAX, 2)
	self.akm_gold.FIRE_MODE = "auto"
	self.akm_gold.fire_mode_data = {}
	self.akm_gold.fire_mode_data.fire_rate = 0.107
	self.akm_gold.CAN_TOGGLE_FIREMODE = true
	self.akm_gold.auto = {}
	self.akm_gold.auto.fire_rate = 0.107
	self.akm_gold.spread = {}
	self.akm_gold.spread.standing = self.new_m4.spread.standing
	self.akm_gold.spread.crouching = self.new_m4.spread.standing
	self.akm_gold.spread.steelsight = self.new_m4.spread.steelsight
	self.akm_gold.spread.moving_standing = self.new_m4.spread.standing
	self.akm_gold.spread.moving_crouching = self.new_m4.spread.standing
	self.akm_gold.spread.moving_steelsight = self.new_m4.spread.moving_steelsight
	self.akm_gold.kick = {}
	self.akm_gold.kick.standing = self.new_m4.kick.standing
	self.akm_gold.kick.crouching = self.akm_gold.kick.standing
	self.akm_gold.kick.steelsight = self.akm_gold.kick.standing
	self.akm_gold.crosshair = {}
	self.akm_gold.crosshair.standing = {}
	self.akm_gold.crosshair.crouching = {}
	self.akm_gold.crosshair.steelsight = {}
	self.akm_gold.crosshair.standing.offset = 0.16
	self.akm_gold.crosshair.standing.moving_offset = 0.8
	self.akm_gold.crosshair.standing.kick_offset = 0.6
	self.akm_gold.crosshair.crouching.offset = 0.08
	self.akm_gold.crosshair.crouching.moving_offset = 0.7
	self.akm_gold.crosshair.crouching.kick_offset = 0.4
	self.akm_gold.crosshair.steelsight.hidden = true
	self.akm_gold.crosshair.steelsight.offset = 0
	self.akm_gold.crosshair.steelsight.moving_offset = 0
	self.akm_gold.crosshair.steelsight.kick_offset = 0.1
	self.akm_gold.shake = {}
	self.akm_gold.shake.fire_multiplier = 1
	self.akm_gold.shake.fire_steelsight_multiplier = -1
	self.akm_gold.autohit = autohit_rifle_default
	self.akm_gold.aim_assist = aim_assist_rifle_default
	self.akm_gold.weapon_hold = "ak47"
	self.akm_gold.animations = {}
	self.akm_gold.animations.equip_id = "equip_ak47"
	self.akm_gold.animations.recoil_steelsight = true
	self.akm_gold.global_value = "pd2_clan"
	self.akm_gold.challenges = {}
	self.akm_gold.challenges.group = "rifle"
	self.akm_gold.challenges.weapon = "ak47"
	self.akm_gold.stats = {
		damage = 17,
		spread = 6,
		recoil = 5,
		spread_moving = 6,
		zoom = 3,
		concealment = 11,
		suppression = 8,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 1
	}
	self.akmsu = {}
	self.akmsu.category = "smg"
	self.akmsu.damage_melee = damage_melee_default
	self.akmsu.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.akmsu.sounds = {}
	self.akmsu.sounds.fire = "akmsu_fire_single"
	self.akmsu.sounds.fire_single = "akmsu_fire_single"
	self.akmsu.sounds.fire_auto = "akmsu_fire"
	self.akmsu.sounds.stop_fire = "akmsu_stop"
	self.akmsu.sounds.dryfire = "primary_dryfire"
	self.akmsu.sounds.enter_steelsight = "primary_steel_sight_enter"
	self.akmsu.sounds.leave_steelsight = "primary_steel_sight_exit"
	self.akmsu.timers = {}
	self.akmsu.timers.reload_not_empty = 2.8
	self.akmsu.timers.reload_empty = 3.87
	self.akmsu.timers.unequip = 0.65
	self.akmsu.timers.equip = 0.6
	self.akmsu.name_id = "bm_w_akmsu"
	self.akmsu.desc_id = "bm_w_akmsu_desc"
	self.akmsu.description_id = "des_ak47"
	self.akmsu.muzzleflash = "effects/payday2/particles/weapons/556_auto_fps"
	self.akmsu.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.akmsu.use_data = {}
	self.akmsu.use_data.selection_index = 1
	self.akmsu.DAMAGE = 1
	self.akmsu.CLIP_AMMO_MAX = 30
	self.akmsu.NR_CLIPS_MAX = math.round(total_damage_secondary / 2 / self.akmsu.CLIP_AMMO_MAX)
	self.akmsu.AMMO_MAX = self.akmsu.CLIP_AMMO_MAX * self.akmsu.NR_CLIPS_MAX
	self.akmsu.AMMO_PICKUP = self:_pickup_chance(self.akmsu.AMMO_MAX, 1)
	self.akmsu.FIRE_MODE = "auto"
	self.akmsu.fire_mode_data = {}
	self.akmsu.fire_mode_data.fire_rate = 0.073
	self.akmsu.CAN_TOGGLE_FIREMODE = true
	self.akmsu.auto = {}
	self.akmsu.auto.fire_rate = 0.073
	self.akmsu.spread = {}
	self.akmsu.spread.standing = self.new_m4.spread.standing
	self.akmsu.spread.crouching = self.new_m4.spread.standing
	self.akmsu.spread.steelsight = self.new_m4.spread.steelsight
	self.akmsu.spread.moving_standing = self.new_m4.spread.standing
	self.akmsu.spread.moving_crouching = self.new_m4.spread.standing
	self.akmsu.spread.moving_steelsight = self.new_m4.spread.moving_steelsight
	self.akmsu.kick = {}
	self.akmsu.kick.standing = self.new_m4.kick.standing
	self.akmsu.kick.crouching = self.akmsu.kick.standing
	self.akmsu.kick.steelsight = self.akmsu.kick.standing
	self.akmsu.crosshair = {}
	self.akmsu.crosshair.standing = {}
	self.akmsu.crosshair.crouching = {}
	self.akmsu.crosshair.steelsight = {}
	self.akmsu.crosshair.standing.offset = 0.16
	self.akmsu.crosshair.standing.moving_offset = 0.8
	self.akmsu.crosshair.standing.kick_offset = 0.6
	self.akmsu.crosshair.crouching.offset = 0.08
	self.akmsu.crosshair.crouching.moving_offset = 0.7
	self.akmsu.crosshair.crouching.kick_offset = 0.4
	self.akmsu.crosshair.steelsight.hidden = true
	self.akmsu.crosshair.steelsight.offset = 0
	self.akmsu.crosshair.steelsight.moving_offset = 0
	self.akmsu.crosshair.steelsight.kick_offset = 0.1
	self.akmsu.shake = {}
	self.akmsu.shake.fire_multiplier = 1
	self.akmsu.shake.fire_steelsight_multiplier = -1
	self.akmsu.autohit = autohit_smg_default
	self.akmsu.aim_assist = aim_assist_smg_default
	self.akmsu.weapon_hold = "ak47"
	self.akmsu.animations = {}
	self.akmsu.animations.equip_id = "equip_ak47"
	self.akmsu.animations.recoil_steelsight = true
	self.akmsu.challenges = {}
	self.akmsu.challenges.group = "rifle"
	self.akmsu.challenges.weapon = "ak47"
	self.akmsu.stats = {
		damage = 11,
		spread = 5,
		recoil = 6,
		spread_moving = 9,
		zoom = 3,
		concealment = 21,
		suppression = 8,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 1
	}
	self.saiga = {}
	self.saiga.category = "shotgun"
	self.saiga.damage_melee = damage_melee_default
	self.saiga.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.saiga.sounds = {}
	self.saiga.sounds.fire = "saiga_play"
	self.saiga.sounds.dryfire = "shotgun_dryfire"
	self.saiga.sounds.stop_fire = "saiga_stop"
	self.saiga.sounds.enter_steelsight = "primary_steel_sight_enter"
	self.saiga.sounds.leave_steelsight = "primary_steel_sight_exit"
	self.saiga.timers = {}
	self.saiga.timers.reload_not_empty = 2.8
	self.saiga.timers.reload_empty = 3.87
	self.saiga.timers.unequip = 0.85
	self.saiga.timers.equip = 0.85
	self.saiga.name_id = "bm_w_saiga"
	self.saiga.desc_id = "bm_w_saiga_desc"
	self.saiga.description_id = "des_saiga"
	self.saiga.muzzleflash = "effects/payday2/particles/weapons/762_auto_fps"
	self.saiga.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug"
	self.saiga.use_data = {}
	self.saiga.use_data.selection_index = 2
	self.saiga.use_data.align_place = "right_hand"
	self.saiga.DAMAGE = 6
	self.saiga.damage_near = 700
	self.saiga.damage_far = 1800
	self.saiga.rays = 5
	self.saiga.CLIP_AMMO_MAX = 7
	self.saiga.NR_CLIPS_MAX = math.round(total_damage_primary / 4.5 / self.saiga.CLIP_AMMO_MAX)
	self.saiga.AMMO_MAX = self.saiga.CLIP_AMMO_MAX * self.saiga.NR_CLIPS_MAX
	self.saiga.AMMO_PICKUP = self:_pickup_chance(self.saiga.AMMO_MAX, 2)
	self.saiga.FIRE_MODE = "auto"
	self.saiga.fire_mode_data = {}
	self.saiga.fire_mode_data.fire_rate = 0.18
	self.saiga.CAN_TOGGLE_FIREMODE = true
	self.saiga.auto = {}
	self.saiga.auto.fire_rate = 0.18
	self.saiga.spread = {}
	self.saiga.spread.standing = self.r870.spread.standing
	self.saiga.spread.crouching = self.r870.spread.crouching
	self.saiga.spread.steelsight = self.r870.spread.steelsight
	self.saiga.spread.moving_standing = self.r870.spread.moving_standing
	self.saiga.spread.moving_crouching = self.r870.spread.moving_crouching
	self.saiga.spread.moving_steelsight = self.r870.spread.moving_steelsight
	self.saiga.kick = {}
	self.saiga.kick.standing = self.r870.kick.standing
	self.saiga.kick.crouching = self.saiga.kick.standing
	self.saiga.kick.steelsight = self.r870.kick.steelsight
	self.saiga.crosshair = {}
	self.saiga.crosshair.standing = {}
	self.saiga.crosshair.crouching = {}
	self.saiga.crosshair.steelsight = {}
	self.saiga.crosshair.standing.offset = 0.7
	self.saiga.crosshair.standing.moving_offset = 0.7
	self.saiga.crosshair.standing.kick_offset = 0.8
	self.saiga.crosshair.crouching.offset = 0.65
	self.saiga.crosshair.crouching.moving_offset = 0.65
	self.saiga.crosshair.crouching.kick_offset = 0.75
	self.saiga.crosshair.steelsight.hidden = true
	self.saiga.crosshair.steelsight.offset = 0
	self.saiga.crosshair.steelsight.moving_offset = 0
	self.saiga.crosshair.steelsight.kick_offset = 0
	self.saiga.shake = {}
	self.saiga.shake.fire_multiplier = 2
	self.saiga.shake.fire_steelsight_multiplier = 1.25
	self.saiga.autohit = autohit_shotgun_default
	self.saiga.aim_assist = aim_assist_shotgun_default
	self.saiga.weapon_hold = "ak47"
	self.saiga.animations = {}
	self.saiga.animations.equip_id = "equip_r870_shotgun"
	self.saiga.animations.recoil_steelsight = true
	self.saiga.stats = {
		damage = 15,
		spread = 6,
		recoil = 4,
		spread_moving = 7,
		zoom = 3,
		concealment = 13,
		suppression = 5,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 1
	}
	self.ak5 = {}
	self.ak5.category = "assault_rifle"
	self.ak5.damage_melee = damage_melee_default
	self.ak5.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.ak5.sounds = {}
	self.ak5.sounds.fire = "ak5_fire_single"
	self.ak5.sounds.fire_single = "ak5_fire_single"
	self.ak5.sounds.fire_auto = "ak5_fire"
	self.ak5.sounds.stop_fire = "ak5_stop"
	self.ak5.sounds.dryfire = "primary_dryfire"
	self.ak5.sounds.enter_steelsight = "m4_tighten"
	self.ak5.sounds.enter_steelsight = "primary_steel_sight_enter"
	self.ak5.sounds.leave_steelsight = "primary_steel_sight_exit"
	self.ak5.timers = {}
	self.ak5.timers.reload_not_empty = 2.665
	self.ak5.timers.reload_empty = 3.47
	self.ak5.timers.unequip = 0.8
	self.ak5.timers.equip = 0.8
	self.ak5.name_id = "bm_w_ak5"
	self.ak5.desc_id = "bm_w_ak5_desc"
	self.ak5.description_id = "des_m4"
	self.ak5.muzzleflash = "effects/payday2/particles/weapons/556_auto_fps"
	self.ak5.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.ak5.use_data = {}
	self.ak5.use_data.selection_index = 2
	self.ak5.DAMAGE = 1
	self.ak5.CLIP_AMMO_MAX = 30
	self.ak5.NR_CLIPS_MAX = math.round(total_damage_primary / 2 / self.ak5.CLIP_AMMO_MAX)
	self.ak5.AMMO_MAX = self.ak5.CLIP_AMMO_MAX * self.ak5.NR_CLIPS_MAX
	self.ak5.AMMO_PICKUP = self:_pickup_chance(self.ak5.AMMO_MAX, 2)
	self.ak5.FIRE_MODE = "auto"
	self.ak5.fire_mode_data = {}
	self.ak5.fire_mode_data.fire_rate = 0.085
	self.ak5.CAN_TOGGLE_FIREMODE = true
	self.ak5.auto = {}
	self.ak5.auto.fire_rate = 0.085
	self.ak5.spread = {}
	self.ak5.spread.standing = self.new_m4.spread.standing
	self.ak5.spread.crouching = self.new_m4.spread.standing
	self.ak5.spread.steelsight = self.new_m4.spread.steelsight
	self.ak5.spread.moving_standing = self.new_m4.spread.standing
	self.ak5.spread.moving_crouching = self.new_m4.spread.standing
	self.ak5.spread.moving_steelsight = self.new_m4.spread.moving_steelsight
	self.ak5.kick = {}
	self.ak5.kick.standing = self.new_m4.kick.standing
	self.ak5.kick.crouching = self.ak5.kick.standing
	self.ak5.kick.steelsight = self.ak5.kick.standing
	self.ak5.crosshair = {}
	self.ak5.crosshair.standing = {}
	self.ak5.crosshair.crouching = {}
	self.ak5.crosshair.steelsight = {}
	self.ak5.crosshair.standing.offset = 0.16
	self.ak5.crosshair.standing.moving_offset = 0.8
	self.ak5.crosshair.standing.kick_offset = 0.6
	self.ak5.crosshair.crouching.offset = 0.08
	self.ak5.crosshair.crouching.moving_offset = 0.7
	self.ak5.crosshair.crouching.kick_offset = 0.4
	self.ak5.crosshair.steelsight.hidden = true
	self.ak5.crosshair.steelsight.offset = 0
	self.ak5.crosshair.steelsight.moving_offset = 0
	self.ak5.crosshair.steelsight.kick_offset = 0.1
	self.ak5.shake = {}
	self.ak5.shake.fire_multiplier = 1
	self.ak5.shake.fire_steelsight_multiplier = 1
	self.ak5.autohit = autohit_rifle_default
	self.ak5.aim_assist = aim_assist_rifle_default
	self.ak5.weapon_hold = "m4"
	self.ak5.animations = {}
	self.ak5.animations.reload_not_empty = "reload_not_empty"
	self.ak5.animations.reload = "reload"
	self.ak5.animations.equip_id = "equip_m4"
	self.ak5.animations.recoil_steelsight = true
	self.ak5.stats = {
		damage = 9,
		spread = 9,
		recoil = 12,
		spread_moving = 6,
		zoom = 3,
		concealment = 18,
		suppression = 10,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 1
	}
	self.aug = {}
	self.aug.category = "assault_rifle"
	self.aug.damage_melee = damage_melee_default
	self.aug.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.aug.sounds = {}
	self.aug.sounds.fire = "aug_fire_single"
	self.aug.sounds.fire_single = "aug_fire_single"
	self.aug.sounds.fire_auto = "aug_fire"
	self.aug.sounds.stop_fire = "aug_stop"
	self.aug.sounds.dryfire = "secondary_dryfire"
	self.aug.sounds.enter_steelsight = "secondary_steel_sight_enter"
	self.aug.sounds.leave_steelsight = "secondary_steel_sight_exit"
	self.aug.timers = {}
	self.aug.timers.reload_not_empty = 2.5
	self.aug.timers.reload_empty = 3.3
	self.aug.timers.unequip = 0.8
	self.aug.timers.equip = 0.8
	self.aug.name_id = "bm_w_aug"
	self.aug.desc_id = "bm_w_aug_desc"
	self.aug.description_id = "des_aug"
	self.aug.muzzleflash = "effects/payday2/particles/weapons/556_auto_fps"
	self.aug.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.aug.use_data = {}
	self.aug.use_data.selection_index = 2
	self.aug.DAMAGE = 1
	self.aug.CLIP_AMMO_MAX = 30
	self.aug.NR_CLIPS_MAX = math.round(total_damage_primary / 2.25 / self.aug.CLIP_AMMO_MAX)
	self.aug.AMMO_MAX = self.aug.CLIP_AMMO_MAX * self.aug.NR_CLIPS_MAX
	self.aug.AMMO_PICKUP = self:_pickup_chance(self.aug.AMMO_MAX, 2)
	self.aug.FIRE_MODE = "auto"
	self.aug.fire_mode_data = {}
	self.aug.fire_mode_data.fire_rate = 0.08
	self.aug.CAN_TOGGLE_FIREMODE = true
	self.aug.auto = {}
	self.aug.auto.fire_rate = 0.08
	self.aug.spread = {}
	self.aug.spread.standing = self.new_m4.spread.standing * 2.5
	self.aug.spread.crouching = self.new_m4.spread.standing * 2.5
	self.aug.spread.steelsight = self.new_m4.spread.steelsight
	self.aug.spread.moving_standing = self.new_m4.spread.standing * 3.5
	self.aug.spread.moving_crouching = self.new_m4.spread.standing * 3.5
	self.aug.spread.moving_steelsight = self.new_m4.spread.moving_steelsight * 1.5
	self.aug.kick = {}
	self.aug.kick.standing = self.new_m4.kick.standing
	self.aug.kick.crouching = self.aug.kick.standing
	self.aug.kick.steelsight = self.aug.kick.standing
	self.aug.crosshair = {}
	self.aug.crosshair.standing = {}
	self.aug.crosshair.crouching = {}
	self.aug.crosshair.steelsight = {}
	self.aug.crosshair.standing.offset = 0.5
	self.aug.crosshair.standing.moving_offset = 0.6
	self.aug.crosshair.standing.kick_offset = 0.7
	self.aug.crosshair.crouching.offset = 0.4
	self.aug.crosshair.crouching.moving_offset = 0.5
	self.aug.crosshair.crouching.kick_offset = 0.6
	self.aug.crosshair.steelsight.hidden = true
	self.aug.crosshair.steelsight.offset = 0
	self.aug.crosshair.steelsight.moving_offset = 0
	self.aug.crosshair.steelsight.kick_offset = 0
	self.aug.shake = {}
	self.aug.shake.fire_multiplier = 1
	self.aug.shake.fire_steelsight_multiplier = 1
	self.aug.autohit = autohit_pistol_default
	self.aug.aim_assist = aim_assist_pistol_default
	self.aug.animations = {}
	self.aug.animations.equip_id = "equip_mp5_rifle"
	self.aug.animations.recoil_steelsight = true
	self.aug.stats = {
		damage = 12,
		spread = 8,
		recoil = 5,
		spread_moving = 7,
		zoom = 3,
		concealment = 20,
		suppression = 10,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 1
	}
	self.g36 = {}
	self.g36.category = "assault_rifle"
	self.g36.damage_melee = damage_melee_default
	self.g36.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.g36.sounds = {}
	self.g36.sounds.fire = "g36_fire_single"
	self.g36.sounds.fire_single = "g36_fire_single"
	self.g36.sounds.fire_auto = "g36_fire"
	self.g36.sounds.stop_fire = "g36_stop"
	self.g36.sounds.dryfire = "primary_dryfire"
	self.g36.sounds.enter_steelsight = "m4_tighten"
	self.g36.sounds.enter_steelsight = "primary_steel_sight_enter"
	self.g36.sounds.leave_steelsight = "primary_steel_sight_exit"
	self.g36.timers = {}
	self.g36.timers.reload_not_empty = 2.5
	self.g36.timers.reload_empty = 3.45
	self.g36.timers.unequip = 0.85
	self.g36.timers.equip = 0.85
	self.g36.name_id = "bm_w_g36"
	self.g36.desc_id = "bm_w_g36_desc"
	self.g36.description_id = "des_m4"
	self.g36.muzzleflash = "effects/payday2/particles/weapons/556_auto_fps"
	self.g36.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.g36.use_data = {}
	self.g36.use_data.selection_index = 2
	self.g36.DAMAGE = 1
	self.g36.CLIP_AMMO_MAX = 30
	self.g36.NR_CLIPS_MAX = math.round(total_damage_primary / 1.75 / self.g36.CLIP_AMMO_MAX)
	self.g36.AMMO_MAX = self.g36.CLIP_AMMO_MAX * self.g36.NR_CLIPS_MAX
	self.g36.AMMO_PICKUP = self:_pickup_chance(self.g36.AMMO_MAX, 2)
	self.g36.FIRE_MODE = "auto"
	self.g36.fire_mode_data = {}
	self.g36.fire_mode_data.fire_rate = 0.085
	self.g36.CAN_TOGGLE_FIREMODE = true
	self.g36.auto = {}
	self.g36.auto.fire_rate = 0.085
	self.g36.spread = {}
	self.g36.spread.standing = self.new_m4.spread.standing * 0.8
	self.g36.spread.crouching = self.new_m4.spread.standing * 0.8
	self.g36.spread.steelsight = self.new_m4.spread.steelsight
	self.g36.spread.moving_standing = self.new_m4.spread.standing * 0.8
	self.g36.spread.moving_crouching = self.new_m4.spread.standing * 0.8
	self.g36.spread.moving_steelsight = self.new_m4.spread.moving_steelsight
	self.g36.kick = {}
	self.g36.kick.standing = self.new_m4.kick.standing
	self.g36.kick.crouching = self.g36.kick.standing
	self.g36.kick.steelsight = self.g36.kick.standing
	self.g36.crosshair = {}
	self.g36.crosshair.standing = {}
	self.g36.crosshair.crouching = {}
	self.g36.crosshair.steelsight = {}
	self.g36.crosshair.standing.offset = 0.16
	self.g36.crosshair.standing.moving_offset = 0.8
	self.g36.crosshair.standing.kick_offset = 0.6
	self.g36.crosshair.crouching.offset = 0.08
	self.g36.crosshair.crouching.moving_offset = 0.7
	self.g36.crosshair.crouching.kick_offset = 0.4
	self.g36.crosshair.steelsight.hidden = true
	self.g36.crosshair.steelsight.offset = 0
	self.g36.crosshair.steelsight.moving_offset = 0
	self.g36.crosshair.steelsight.kick_offset = 0.1
	self.g36.shake = {}
	self.g36.shake.fire_multiplier = 1
	self.g36.shake.fire_steelsight_multiplier = -1
	self.g36.autohit = autohit_rifle_default
	self.g36.aim_assist = aim_assist_rifle_default
	self.g36.animations = {}
	self.g36.animations.equip_id = "equip_m4"
	self.g36.animations.recoil_steelsight = true
	self.g36.stats = {
		damage = 11,
		spread = 7,
		recoil = 8,
		spread_moving = 8,
		zoom = 3,
		concealment = 19,
		suppression = 11,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 1
	}
	self.p90 = {}
	self.p90.category = "smg"
	self.p90.damage_melee = damage_melee_default
	self.p90.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.p90.sounds = {}
	self.p90.sounds.fire = "p90_fire_single"
	self.p90.sounds.fire_single = "p90_fire_single"
	self.p90.sounds.fire_auto = "p90_fire"
	self.p90.sounds.stop_fire = "p90_stop"
	self.p90.sounds.dryfire = "secondary_dryfire"
	self.p90.sounds.enter_steelsight = "secondary_steel_sight_enter"
	self.p90.sounds.leave_steelsight = "secondary_steel_sight_exit"
	self.p90.timers = {}
	self.p90.timers.reload_not_empty = 2.9
	self.p90.timers.reload_empty = 3.9
	self.p90.timers.unequip = 0.68
	self.p90.timers.equip = 0.65
	self.p90.name_id = "bm_w_p90"
	self.p90.desc_id = "bm_w_p90_desc"
	self.p90.description_id = "des_p90"
	self.p90.muzzleflash = "effects/payday2/particles/weapons/556_auto_fps"
	self.p90.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.p90.use_data = {}
	self.p90.use_data.selection_index = 1
	self.p90.DAMAGE = 1
	self.p90.CLIP_AMMO_MAX = 50
	self.p90.NR_CLIPS_MAX = math.round(total_damage_secondary / 1.45 / self.p90.CLIP_AMMO_MAX)
	self.p90.AMMO_MAX = self.p90.CLIP_AMMO_MAX * self.p90.NR_CLIPS_MAX
	self.p90.AMMO_PICKUP = self:_pickup_chance(self.p90.AMMO_MAX, 1)
	self.p90.FIRE_MODE = "auto"
	self.p90.fire_mode_data = {}
	self.p90.fire_mode_data.fire_rate = 0.066
	self.p90.CAN_TOGGLE_FIREMODE = true
	self.p90.auto = {}
	self.p90.auto.fire_rate = 0.066
	self.p90.spread = {}
	self.p90.spread.standing = self.new_m4.spread.standing * 1.35
	self.p90.spread.crouching = self.new_m4.spread.standing * 1.35
	self.p90.spread.steelsight = self.new_m4.spread.steelsight
	self.p90.spread.moving_standing = self.new_m4.spread.standing * 1.35
	self.p90.spread.moving_crouching = self.new_m4.spread.standing * 1.35
	self.p90.spread.moving_steelsight = self.new_m4.spread.moving_steelsight
	self.p90.kick = {}
	self.p90.kick.standing = self.new_m4.kick.standing
	self.p90.kick.crouching = self.p90.kick.standing
	self.p90.kick.steelsight = self.p90.kick.standing
	self.p90.crosshair = {}
	self.p90.crosshair.standing = {}
	self.p90.crosshair.crouching = {}
	self.p90.crosshair.steelsight = {}
	self.p90.crosshair.standing.offset = 0.4
	self.p90.crosshair.standing.moving_offset = 0.7
	self.p90.crosshair.standing.kick_offset = 0.6
	self.p90.crosshair.crouching.offset = 0.3
	self.p90.crosshair.crouching.moving_offset = 0.6
	self.p90.crosshair.crouching.kick_offset = 0.4
	self.p90.crosshair.steelsight.hidden = true
	self.p90.crosshair.steelsight.offset = 0
	self.p90.crosshair.steelsight.moving_offset = 0
	self.p90.crosshair.steelsight.kick_offset = 0.4
	self.p90.shake = {}
	self.p90.shake.fire_multiplier = 1
	self.p90.shake.fire_steelsight_multiplier = 1
	self.p90.autohit = autohit_smg_default
	self.p90.aim_assist = aim_assist_smg_default
	self.p90.animations = {}
	self.p90.animations.equip_id = "equip_mac11_rifle"
	self.p90.animations.recoil_steelsight = true
	self.p90.stats = {
		damage = 9,
		spread = 8,
		recoil = 9,
		spread_moving = 9,
		zoom = 3,
		concealment = 23,
		suppression = 12,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 1
	}
	self.new_m14 = {}
	self.new_m14.category = "assault_rifle"
	self.new_m14.damage_melee = damage_melee_default
	self.new_m14.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.new_m14.sounds = {}
	self.new_m14.sounds.fire = "m14_fire"
	self.new_m14.sounds.fire_single = "m14_fire"
	self.new_m14.sounds.fire_auto = "m14_fire_loop"
	self.new_m14.sounds.stop_fire = "m14_stop"
	self.new_m14.sounds.dryfire = "primary_dryfire"
	self.new_m14.sounds.enter_steelsight = "primary_steel_sight_enter"
	self.new_m14.sounds.leave_steelsight = "primary_steel_sight_exit"
	self.new_m14.timers = {}
	self.new_m14.timers.reload_not_empty = 1.97
	self.new_m14.timers.reload_empty = 3.2
	self.new_m14.timers.unequip = 0.9
	self.new_m14.timers.equip = 0.9
	self.new_m14.name_id = "bm_w_m14"
	self.new_m14.desc_id = "bm_w_m14_desc"
	self.new_m14.description_id = "des_m14"
	self.new_m14.muzzleflash = "effects/payday2/particles/weapons/762_auto_fps"
	self.new_m14.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.new_m14.use_data = {}
	self.new_m14.use_data.selection_index = 2
	self.new_m14.DAMAGE = 2
	self.new_m14.CLIP_AMMO_MAX = 10
	self.new_m14.NR_CLIPS_MAX = math.round(total_damage_primary / 8 / self.new_m14.CLIP_AMMO_MAX)
	self.new_m14.AMMO_MAX = self.new_m14.CLIP_AMMO_MAX * self.new_m14.NR_CLIPS_MAX
	self.new_m14.AMMO_PICKUP = self:_pickup_chance(self.new_m14.AMMO_MAX, 2)
	self.new_m14.FIRE_MODE = "single"
	self.new_m14.fire_mode_data = {}
	self.new_m14.fire_mode_data.fire_rate = 0.085
	self.new_m14.CAN_TOGGLE_FIREMODE = true
	self.new_m14.single = {}
	self.new_m14.single.fire_rate = 0.085
	self.new_m14.spread = {}
	self.new_m14.spread.standing = self.new_m4.spread.standing * 2
	self.new_m14.spread.crouching = self.new_m4.spread.standing * 2
	self.new_m14.spread.steelsight = self.new_m4.spread.steelsight
	self.new_m14.spread.moving_standing = self.new_m4.spread.standing * 2.5
	self.new_m14.spread.moving_crouching = self.new_m4.spread.standing * 2.5
	self.new_m14.spread.moving_steelsight = self.new_m4.spread.moving_steelsight * 1.5
	self.new_m14.kick = {}
	self.new_m14.kick.standing = self.new_m4.kick.standing
	self.new_m14.kick.crouching = self.new_m14.kick.standing
	self.new_m14.kick.steelsight = self.new_m14.kick.standing
	self.new_m14.crosshair = {}
	self.new_m14.crosshair.standing = {}
	self.new_m14.crosshair.crouching = {}
	self.new_m14.crosshair.steelsight = {}
	self.new_m14.crosshair.standing.offset = 0.16
	self.new_m14.crosshair.standing.moving_offset = 0.8
	self.new_m14.crosshair.standing.kick_offset = 0.6
	self.new_m14.crosshair.crouching.offset = 0.08
	self.new_m14.crosshair.crouching.moving_offset = 0.7
	self.new_m14.crosshair.crouching.kick_offset = 0.4
	self.new_m14.crosshair.steelsight.hidden = true
	self.new_m14.crosshair.steelsight.offset = 0
	self.new_m14.crosshair.steelsight.moving_offset = 0
	self.new_m14.crosshair.steelsight.kick_offset = 0.1
	self.new_m14.shake = {}
	self.new_m14.shake.fire_multiplier = 1
	self.new_m14.shake.fire_steelsight_multiplier = 1
	self.new_m14.autohit = autohit_rifle_default
	self.new_m14.aim_assist = aim_assist_rifle_default
	self.new_m14.animations = {}
	self.new_m14.animations.fire = "recoil"
	self.new_m14.animations.equip_id = "equip_m14_rifle"
	self.new_m14.animations.recoil_steelsight = true
	self.new_m14.stats = {
		damage = 30,
		spread = 9,
		recoil = 2,
		spread_moving = 5,
		zoom = 3,
		concealment = 6,
		suppression = 4,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 1
	}
	self.deagle = {}
	self.deagle.category = "pistol"
	self.deagle.damage_melee = damage_melee_default
	self.deagle.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.deagle.sounds = {}
	self.deagle.sounds.fire = "deagle_fire"
	self.deagle.sounds.dryfire = "secondary_dryfire"
	self.deagle.sounds.enter_steelsight = "pistol_steel_sight_enter"
	self.deagle.sounds.leave_steelsight = "pistol_steel_sight_exit"
	self.deagle.FIRE_MODE = "single"
	self.deagle.fire_mode_data = {}
	self.deagle.fire_mode_data.fire_rate = 0.15
	self.deagle.single = {}
	self.deagle.single.fire_rate = 0.15
	self.deagle.timers = {}
	self.deagle.timers.reload_not_empty = 1.85
	self.deagle.timers.reload_empty = 2.75
	self.deagle.timers.unequip = 0.6
	self.deagle.timers.equip = 0.6
	self.deagle.name_id = "bm_w_deagle"
	self.deagle.desc_id = "bm_w_deagle_desc"
	self.deagle.description_id = "des_deagle"
	self.deagle.muzzleflash = "effects/payday2/particles/weapons/556_auto_fps"
	self.deagle.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.deagle.use_data = {}
	self.deagle.use_data.selection_index = 1
	self.deagle.DAMAGE = 2
	self.deagle.CLIP_AMMO_MAX = 10
	self.deagle.NR_CLIPS_MAX = math.round(total_damage_secondary / 4.5 / self.deagle.CLIP_AMMO_MAX)
	self.deagle.AMMO_MAX = self.deagle.CLIP_AMMO_MAX * self.deagle.NR_CLIPS_MAX
	self.deagle.AMMO_PICKUP = self:_pickup_chance(self.deagle.AMMO_MAX, 1)
	self.deagle.spread = {}
	self.deagle.spread.standing = self.new_m4.spread.standing
	self.deagle.spread.crouching = self.new_m4.spread.standing
	self.deagle.spread.steelsight = self.new_m4.spread.steelsight
	self.deagle.spread.moving_standing = self.new_m4.spread.standing
	self.deagle.spread.moving_crouching = self.new_m4.spread.standing
	self.deagle.spread.moving_steelsight = self.new_m4.spread.moving_steelsight
	self.deagle.kick = {}
	self.deagle.kick.standing = self.glock_17.kick.standing
	self.deagle.kick.crouching = self.deagle.kick.standing
	self.deagle.kick.steelsight = self.deagle.kick.standing
	self.deagle.crosshair = {}
	self.deagle.crosshair.standing = {}
	self.deagle.crosshair.crouching = {}
	self.deagle.crosshair.steelsight = {}
	self.deagle.crosshair.standing.offset = 0.2
	self.deagle.crosshair.standing.moving_offset = 0.6
	self.deagle.crosshair.standing.kick_offset = 0.4
	self.deagle.crosshair.crouching.offset = 0.1
	self.deagle.crosshair.crouching.moving_offset = 0.6
	self.deagle.crosshair.crouching.kick_offset = 0.3
	self.deagle.crosshair.steelsight.hidden = true
	self.deagle.crosshair.steelsight.offset = 0
	self.deagle.crosshair.steelsight.moving_offset = 0
	self.deagle.crosshair.steelsight.kick_offset = 0.1
	self.deagle.shake = {}
	self.deagle.shake.fire_multiplier = -1
	self.deagle.shake.fire_steelsight_multiplier = -1
	self.deagle.autohit = autohit_pistol_default
	self.deagle.aim_assist = aim_assist_pistol_default
	self.deagle.animations = {}
	self.deagle.animations.equip_id = "equip_glock"
	self.deagle.animations.recoil_steelsight = true
	self.deagle.stats = {
		damage = 19,
		spread = 6,
		recoil = 3,
		spread_moving = 6,
		zoom = 3,
		concealment = 28,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 1
	}
	self.new_mp5 = {}
	self.new_mp5.category = "smg"
	self.new_mp5.damage_melee = damage_melee_default
	self.new_mp5.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.new_mp5.sounds = {}
	self.new_mp5.sounds.fire = "mp5_fire_single"
	self.new_mp5.sounds.fire_single = "mp5_fire_single"
	self.new_mp5.sounds.fire_auto = "mp5_fire"
	self.new_mp5.sounds.stop_fire = "mp5_stop"
	self.new_mp5.sounds.dryfire = "secondary_dryfire"
	self.new_mp5.sounds.enter_steelsight = "secondary_steel_sight_enter"
	self.new_mp5.sounds.leave_steelsight = "secondary_steel_sight_exit"
	self.new_mp5.timers = {}
	self.new_mp5.timers.reload_not_empty = 2.4
	self.new_mp5.timers.reload_empty = 3.3
	self.new_mp5.timers.unequip = 0.75
	self.new_mp5.timers.equip = 0.7
	self.new_mp5.name_id = "bm_w_mp5"
	self.new_mp5.desc_id = "bm_w_mp5_desc"
	self.new_mp5.description_id = "des_mp5"
	self.new_mp5.muzzleflash = "effects/payday2/particles/weapons/9mm_auto_fps"
	self.new_mp5.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence_fps"
	self.new_mp5.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.new_mp5.use_data = {}
	self.new_mp5.use_data.selection_index = 1
	self.new_mp5.DAMAGE = 1
	self.new_mp5.CLIP_AMMO_MAX = 30
	self.new_mp5.NR_CLIPS_MAX = math.round(total_damage_secondary / 1 / self.new_mp5.CLIP_AMMO_MAX)
	self.new_mp5.AMMO_MAX = self.new_mp5.CLIP_AMMO_MAX * self.new_mp5.NR_CLIPS_MAX
	self.new_mp5.AMMO_PICKUP = self:_pickup_chance(self.new_mp5.AMMO_MAX, 1)
	self.new_mp5.FIRE_MODE = "auto"
	self.new_mp5.fire_mode_data = {}
	self.new_mp5.fire_mode_data.fire_rate = 0.08
	self.new_mp5.CAN_TOGGLE_FIREMODE = true
	self.new_mp5.auto = {}
	self.new_mp5.auto.fire_rate = 0.08
	self.new_mp5.spread = {}
	self.new_mp5.spread.standing = self.new_m4.spread.standing
	self.new_mp5.spread.crouching = self.new_m4.spread.standing
	self.new_mp5.spread.steelsight = self.new_m4.spread.steelsight
	self.new_mp5.spread.moving_standing = self.new_m4.spread.standing
	self.new_mp5.spread.moving_crouching = self.new_m4.spread.standing
	self.new_mp5.spread.moving_steelsight = self.new_m4.spread.moving_steelsight
	self.new_mp5.kick = {}
	self.new_mp5.kick.standing = self.new_m4.kick.standing
	self.new_mp5.kick.crouching = self.new_mp5.kick.standing
	self.new_mp5.kick.steelsight = self.new_mp5.kick.standing
	self.new_mp5.crosshair = {}
	self.new_mp5.crosshair.standing = {}
	self.new_mp5.crosshair.crouching = {}
	self.new_mp5.crosshair.steelsight = {}
	self.new_mp5.crosshair.standing.offset = 0.5
	self.new_mp5.crosshair.standing.moving_offset = 0.6
	self.new_mp5.crosshair.standing.kick_offset = 0.7
	self.new_mp5.crosshair.crouching.offset = 0.4
	self.new_mp5.crosshair.crouching.moving_offset = 0.5
	self.new_mp5.crosshair.crouching.kick_offset = 0.6
	self.new_mp5.crosshair.steelsight.hidden = true
	self.new_mp5.crosshair.steelsight.offset = 0
	self.new_mp5.crosshair.steelsight.moving_offset = 0
	self.new_mp5.crosshair.steelsight.kick_offset = 0
	self.new_mp5.shake = {}
	self.new_mp5.shake.fire_multiplier = 1
	self.new_mp5.shake.fire_steelsight_multiplier = 0.5
	self.new_mp5.autohit = autohit_smg_default
	self.new_mp5.aim_assist = aim_assist_smg_default
	self.new_mp5.weapon_hold = "mp5"
	self.new_mp5.animations = {}
	self.new_mp5.animations.equip_id = "equip_mp5_rifle"
	self.new_mp5.animations.recoil_steelsight = true
	self.new_mp5.stats = {
		damage = 8,
		spread = 7,
		recoil = 11,
		spread_moving = 8,
		zoom = 3,
		concealment = 23,
		suppression = 17,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 1
	}
	self.colt_1911 = {}
	self.colt_1911.category = "pistol"
	self.colt_1911.damage_melee = damage_melee_default
	self.colt_1911.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.colt_1911.sounds = {}
	self.colt_1911.sounds.fire = "c45_fire"
	self.colt_1911.sounds.dryfire = "secondary_dryfire"
	self.colt_1911.sounds.enter_steelsight = "pistol_steel_sight_enter"
	self.colt_1911.sounds.leave_steelsight = "pistol_steel_sight_exit"
	self.colt_1911.FIRE_MODE = "single"
	self.colt_1911.fire_mode_data = {}
	self.colt_1911.fire_mode_data.fire_rate = 0.12
	self.colt_1911.single = {}
	self.colt_1911.single.fire_rate = 0.12
	self.colt_1911.timers = {}
	self.colt_1911.timers.reload_not_empty = 1.47
	self.colt_1911.timers.reload_empty = 2.12
	self.colt_1911.timers.unequip = 0.55
	self.colt_1911.timers.equip = 0.55
	self.colt_1911.name_id = "bm_w_colt_1911"
	self.colt_1911.desc_id = "bm_w_colt_1911_desc"
	self.colt_1911.description_id = "des_colt_1911"
	self.colt_1911.muzzleflash = "effects/payday2/particles/weapons/9mm_auto_fps"
	self.colt_1911.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence_fps"
	self.colt_1911.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.colt_1911.use_data = {}
	self.colt_1911.use_data.selection_index = 1
	self.colt_1911.DAMAGE = 1
	self.colt_1911.CLIP_AMMO_MAX = 10
	self.colt_1911.NR_CLIPS_MAX = math.round(total_damage_secondary / 2.5 / self.colt_1911.CLIP_AMMO_MAX)
	self.colt_1911.AMMO_MAX = self.colt_1911.CLIP_AMMO_MAX * self.colt_1911.NR_CLIPS_MAX
	self.colt_1911.AMMO_PICKUP = self:_pickup_chance(self.colt_1911.AMMO_MAX, 1)
	self.colt_1911.spread = {}
	self.colt_1911.spread.standing = self.new_m4.spread.standing * 0.75
	self.colt_1911.spread.crouching = self.new_m4.spread.standing * 0.75
	self.colt_1911.spread.steelsight = self.new_m4.spread.steelsight
	self.colt_1911.spread.moving_standing = self.new_m4.spread.standing * 0.75
	self.colt_1911.spread.moving_crouching = self.new_m4.spread.standing * 0.75
	self.colt_1911.spread.moving_steelsight = self.new_m4.spread.moving_steelsight
	self.colt_1911.kick = {}
	self.colt_1911.kick.standing = self.glock_17.kick.standing
	self.colt_1911.kick.crouching = self.colt_1911.kick.standing
	self.colt_1911.kick.steelsight = self.colt_1911.kick.standing
	self.colt_1911.crosshair = {}
	self.colt_1911.crosshair.standing = {}
	self.colt_1911.crosshair.crouching = {}
	self.colt_1911.crosshair.steelsight = {}
	self.colt_1911.crosshair.standing.offset = 0.2
	self.colt_1911.crosshair.standing.moving_offset = 0.6
	self.colt_1911.crosshair.standing.kick_offset = 0.4
	self.colt_1911.crosshair.crouching.offset = 0.1
	self.colt_1911.crosshair.crouching.moving_offset = 0.6
	self.colt_1911.crosshair.crouching.kick_offset = 0.3
	self.colt_1911.crosshair.steelsight.hidden = true
	self.colt_1911.crosshair.steelsight.offset = 0
	self.colt_1911.crosshair.steelsight.moving_offset = 0
	self.colt_1911.crosshair.steelsight.kick_offset = 0.1
	self.colt_1911.shake = {}
	self.colt_1911.shake.fire_multiplier = 1
	self.colt_1911.shake.fire_steelsight_multiplier = -1
	self.colt_1911.autohit = autohit_pistol_default
	self.colt_1911.aim_assist = aim_assist_pistol_default
	self.colt_1911.animations = {}
	self.colt_1911.animations.reload = "reload"
	self.colt_1911.animations.reload_not_empty = "reload_not_empty"
	self.colt_1911.animations.equip_id = "equip_glock"
	self.colt_1911.animations.recoil_steelsight = true
	self.colt_1911.stats = {
		damage = 10,
		spread = 7,
		recoil = 5,
		spread_moving = 5,
		zoom = 3,
		concealment = 29,
		suppression = 14,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 1
	}
	self.mac10 = {}
	self.mac10.category = "smg"
	self.mac10.damage_melee = damage_melee_default
	self.mac10.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.mac10.sounds = {}
	self.mac10.sounds.fire = "mac10_fire_single"
	self.mac10.sounds.fire_single = "mac10_fire_single"
	self.mac10.sounds.fire_auto = "mac10_fire"
	self.mac10.sounds.stop_fire = "mac10_stop"
	self.mac10.sounds.dryfire = "secondary_dryfire"
	self.mac10.sounds.enter_steelsight = "secondary_steel_sight_enter"
	self.mac10.sounds.leave_steelsight = "secondary_steel_sight_exit"
	self.mac10.timers = {}
	self.mac10.timers.reload_not_empty = 1.7
	self.mac10.timers.reload_empty = 2.5
	self.mac10.timers.unequip = 0.7
	self.mac10.timers.equip = 0.5
	self.mac10.name_id = "bm_w_mac10"
	self.mac10.desc_id = "bm_w_mac10_desc"
	self.mac10.description_id = "des_mac10"
	self.mac10.muzzleflash = "effects/payday2/particles/weapons/9mm_auto_fps"
	self.mac10.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence_fps"
	self.mac10.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.mac10.use_data = {}
	self.mac10.use_data.selection_index = 1
	self.mac10.DAMAGE = 1
	self.mac10.CLIP_AMMO_MAX = 40
	self.mac10.NR_CLIPS_MAX = math.round(total_damage_secondary / 2.2 / self.mac10.CLIP_AMMO_MAX)
	self.mac10.AMMO_MAX = self.mac10.CLIP_AMMO_MAX * self.mac10.NR_CLIPS_MAX
	self.mac10.AMMO_PICKUP = self:_pickup_chance(self.mac10.AMMO_MAX, 1)
	self.mac10.FIRE_MODE = "auto"
	self.mac10.fire_mode_data = {}
	self.mac10.fire_mode_data.fire_rate = 0.06
	self.mac10.CAN_TOGGLE_FIREMODE = true
	self.mac10.auto = {}
	self.mac10.auto.fire_rate = 0.06
	self.mac10.spread = {}
	self.mac10.spread.standing = self.new_m4.spread.standing * 0.75
	self.mac10.spread.crouching = self.new_m4.spread.standing * 0.75
	self.mac10.spread.steelsight = self.new_m4.spread.steelsight
	self.mac10.spread.moving_standing = self.new_m4.spread.standing * 0.75
	self.mac10.spread.moving_crouching = self.new_m4.spread.standing * 0.75
	self.mac10.spread.moving_steelsight = self.new_m4.spread.moving_steelsight
	self.mac10.kick = {}
	self.mac10.kick.standing = self.mp9.kick.standing
	self.mac10.kick.crouching = self.mac10.kick.standing
	self.mac10.kick.steelsight = self.mac10.kick.standing
	self.mac10.crosshair = {}
	self.mac10.crosshair.standing = {}
	self.mac10.crosshair.crouching = {}
	self.mac10.crosshair.steelsight = {}
	self.mac10.crosshair.standing.offset = 0.4
	self.mac10.crosshair.standing.moving_offset = 0.7
	self.mac10.crosshair.standing.kick_offset = 0.6
	self.mac10.crosshair.crouching.offset = 0.3
	self.mac10.crosshair.crouching.moving_offset = 0.6
	self.mac10.crosshair.crouching.kick_offset = 0.4
	self.mac10.crosshair.steelsight.hidden = true
	self.mac10.crosshair.steelsight.offset = 0
	self.mac10.crosshair.steelsight.moving_offset = 0
	self.mac10.crosshair.steelsight.kick_offset = 0.4
	self.mac10.shake = {}
	self.mac10.shake.fire_multiplier = 1
	self.mac10.shake.fire_steelsight_multiplier = -1
	self.mac10.autohit = autohit_smg_default
	self.mac10.aim_assist = aim_assist_smg_default
	self.mac10.weapon_hold = "mac11"
	self.mac10.animations = {}
	self.mac10.animations.equip_id = "equip_mac11_rifle"
	self.mac10.animations.recoil_steelsight = true
	self.mac10.stats = {
		damage = 11,
		spread = 5,
		recoil = 6,
		spread_moving = 8,
		zoom = 3,
		concealment = 27,
		suppression = 14,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 1
	}
	self.serbu = {}
	self.serbu.category = "shotgun"
	self.serbu.damage_melee = damage_melee_default
	self.serbu.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.serbu.sounds = {}
	self.serbu.sounds.fire = "serbu_fire"
	self.serbu.sounds.dryfire = "shotgun_dryfire"
	self.serbu.sounds.enter_steelsight = "primary_steel_sight_enter"
	self.serbu.sounds.leave_steelsight = "primary_steel_sight_exit"
	self.serbu.timers = {}
	self.serbu.timers.unequip = 0.7
	self.serbu.timers.equip = 0.6
	self.serbu.name_id = "bm_w_serbu"
	self.serbu.desc_id = "bm_w_serbu_desc"
	self.serbu.description_id = "des_r870"
	self.serbu.muzzleflash = "effects/payday2/particles/weapons/762_auto_fps"
	self.serbu.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug_semi"
	self.serbu.use_data = {}
	self.serbu.use_data.selection_index = 1
	self.serbu.use_data.align_place = "right_hand"
	self.serbu.DAMAGE = 6
	self.serbu.damage_near = 800
	self.serbu.damage_far = 1200
	self.serbu.rays = 6
	self.serbu.CLIP_AMMO_MAX = 6
	self.serbu.NR_CLIPS_MAX = math.round(total_damage_secondary / 5.5 / self.serbu.CLIP_AMMO_MAX)
	self.serbu.AMMO_MAX = self.serbu.CLIP_AMMO_MAX * self.serbu.NR_CLIPS_MAX
	self.serbu.AMMO_PICKUP = self:_pickup_chance(self.serbu.AMMO_MAX, 1)
	self.serbu.FIRE_MODE = "single"
	self.serbu.fire_mode_data = {}
	self.serbu.fire_mode_data.fire_rate = 0.375
	self.serbu.single = {}
	self.serbu.single.fire_rate = 0.375
	self.serbu.spread = {}
	self.serbu.spread.standing = self.r870.spread.standing
	self.serbu.spread.crouching = self.r870.spread.crouching
	self.serbu.spread.steelsight = self.r870.spread.steelsight
	self.serbu.spread.moving_standing = self.r870.spread.moving_standing
	self.serbu.spread.moving_crouching = self.r870.spread.moving_crouching
	self.serbu.spread.moving_steelsight = self.r870.spread.moving_steelsight
	self.serbu.kick = {}
	self.serbu.kick.standing = self.r870.kick.standing
	self.serbu.kick.crouching = self.serbu.kick.standing
	self.serbu.kick.steelsight = self.serbu.kick.standing
	self.serbu.crosshair = {}
	self.serbu.crosshair.standing = {}
	self.serbu.crosshair.crouching = {}
	self.serbu.crosshair.steelsight = {}
	self.serbu.crosshair.standing.offset = 0.7
	self.serbu.crosshair.standing.moving_offset = 0.7
	self.serbu.crosshair.standing.kick_offset = 0.8
	self.serbu.crosshair.crouching.offset = 0.65
	self.serbu.crosshair.crouching.moving_offset = 0.65
	self.serbu.crosshair.crouching.kick_offset = 0.75
	self.serbu.crosshair.steelsight.hidden = true
	self.serbu.crosshair.steelsight.offset = 0
	self.serbu.crosshair.steelsight.moving_offset = 0
	self.serbu.crosshair.steelsight.kick_offset = 0
	self.serbu.shake = {}
	self.serbu.shake.fire_multiplier = 1
	self.serbu.shake.fire_steelsight_multiplier = -1
	self.serbu.autohit = autohit_shotgun_default
	self.serbu.aim_assist = aim_assist_shotgun_default
	self.serbu.weapon_hold = "r870_shotgun"
	self.serbu.animations = {}
	self.serbu.animations.equip_id = "equip_r870_shotgun"
	self.serbu.animations.recoil_steelsight = true
	self.serbu.stats = {
		damage = 24,
		spread = 5,
		recoil = 3,
		spread_moving = 6,
		zoom = 3,
		concealment = 26,
		suppression = 5,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 1
	}
	self.huntsman = {}
	self.huntsman.category = "shotgun"
	self.huntsman.upgrade_blocks = {
		weapon = {
			"clip_ammo_increase"
		}
	}
	self.huntsman.damage_melee = damage_melee_default
	self.huntsman.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.huntsman.sounds = {}
	self.huntsman.sounds.fire = "huntsman_fire"
	self.huntsman.sounds.dryfire = "shotgun_dryfire"
	self.huntsman.sounds.enter_steelsight = "secondary_steel_sight_enter"
	self.huntsman.sounds.leave_steelsight = "secondary_steel_sight_exit"
	self.huntsman.timers = {}
	self.huntsman.timers.reload_not_empty = 2.5
	self.huntsman.timers.reload_empty = self.huntsman.timers.reload_not_empty
	self.huntsman.timers.unequip = 0.85
	self.huntsman.timers.equip = 0.85
	self.huntsman.name_id = "bm_w_huntsman"
	self.huntsman.desc_id = "bm_w_huntsman_desc"
	self.huntsman.description_id = "des_huntsman"
	self.huntsman.muzzleflash = "effects/payday2/particles/weapons/762_auto_fps"
	self.huntsman.shell_ejection = "effects/payday2/particles/weapons/shells/shell_empty"
	self.huntsman.use_data = {}
	self.huntsman.use_data.selection_index = 2
	self.huntsman.use_data.align_place = "right_hand"
	self.huntsman.DAMAGE = 6
	self.huntsman.damage_near = 1000
	self.huntsman.damage_far = 2000
	self.huntsman.rays = 6
	self.huntsman.CLIP_AMMO_MAX = 2
	self.huntsman.NR_CLIPS_MAX = math.round(total_damage_primary / 12 / self.huntsman.CLIP_AMMO_MAX)
	self.huntsman.AMMO_MAX = self.huntsman.CLIP_AMMO_MAX * self.huntsman.NR_CLIPS_MAX
	self.huntsman.AMMO_PICKUP = self:_pickup_chance(self.huntsman.AMMO_MAX, 1)
	self.huntsman.FIRE_MODE = "single"
	self.huntsman.fire_mode_data = {}
	self.huntsman.fire_mode_data.fire_rate = 0.12
	self.huntsman.single = {}
	self.huntsman.single.fire_rate = 0.12
	self.huntsman.spread = {}
	self.huntsman.spread.standing = self.r870.spread.standing
	self.huntsman.spread.crouching = self.r870.spread.crouching
	self.huntsman.spread.steelsight = self.r870.spread.steelsight
	self.huntsman.spread.moving_standing = self.r870.spread.moving_standing
	self.huntsman.spread.moving_crouching = self.r870.spread.moving_crouching
	self.huntsman.spread.moving_steelsight = self.r870.spread.moving_steelsight
	self.huntsman.kick = {}
	self.huntsman.kick.standing = {
		2.9,
		3,
		-0.5,
		0.5
	}
	self.huntsman.kick.crouching = self.huntsman.kick.standing
	self.huntsman.kick.steelsight = self.huntsman.kick.standing
	self.huntsman.crosshair = {}
	self.huntsman.crosshair.standing = {}
	self.huntsman.crosshair.crouching = {}
	self.huntsman.crosshair.steelsight = {}
	self.huntsman.crosshair.standing.offset = 0.16
	self.huntsman.crosshair.standing.moving_offset = 0.8
	self.huntsman.crosshair.standing.kick_offset = 0.6
	self.huntsman.crosshair.standing.hidden = true
	self.huntsman.crosshair.crouching.offset = 0.08
	self.huntsman.crosshair.crouching.moving_offset = 0.7
	self.huntsman.crosshair.crouching.kick_offset = 0.4
	self.huntsman.crosshair.crouching.hidden = true
	self.huntsman.crosshair.steelsight.hidden = true
	self.huntsman.crosshair.steelsight.offset = 0
	self.huntsman.crosshair.steelsight.moving_offset = 0
	self.huntsman.crosshair.steelsight.kick_offset = 0.1
	self.huntsman.shake = {}
	self.huntsman.shake.fire_multiplier = 2
	self.huntsman.shake.fire_steelsight_multiplier = 2
	self.huntsman.autohit = autohit_shotgun_default
	self.huntsman.aim_assist = aim_assist_shotgun_default
	self.huntsman.animations = {}
	self.huntsman.animations.equip_id = "equip_huntsman"
	self.huntsman.animations.recoil_steelsight = true
	self.huntsman.stats = {
		damage = 28,
		spread = 7,
		recoil = 2,
		spread_moving = 6,
		zoom = 3,
		concealment = 7,
		suppression = 2,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 1
	}
	self.b92fs = {}
	self.b92fs.category = "pistol"
	self.b92fs.damage_melee = damage_melee_default
	self.b92fs.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.b92fs.sounds = {}
	self.b92fs.sounds.fire = "beretta_fire"
	self.b92fs.sounds.enter_steelsight = "pistol_steel_sight_enter"
	self.b92fs.sounds.leave_steelsight = "pistol_steel_sight_exit"
	self.b92fs.sounds.dryfire = "secondary_dryfire"
	self.b92fs.timers = {}
	self.b92fs.timers.reload_not_empty = 1.47
	self.b92fs.timers.reload_empty = 2.12
	self.b92fs.timers.unequip = 0.55
	self.b92fs.timers.equip = 0.55
	self.b92fs.name_id = "bm_w_b92fs"
	self.b92fs.desc_id = "bm_w_b92fs_desc"
	self.b92fs.description_id = "des_b92fs"
	self.b92fs.muzzleflash = "effects/payday2/particles/weapons/9mm_auto_fps"
	self.b92fs.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence_fps"
	self.b92fs.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.b92fs.use_data = {}
	self.b92fs.use_data.selection_index = 1
	self.b92fs.DAMAGE = 1
	self.b92fs.CLIP_AMMO_MAX = 14
	self.b92fs.NR_CLIPS_MAX = math.round(total_damage_secondary / 1 / self.b92fs.CLIP_AMMO_MAX)
	self.b92fs.AMMO_MAX = self.b92fs.CLIP_AMMO_MAX * self.b92fs.NR_CLIPS_MAX
	self.b92fs.AMMO_PICKUP = self:_pickup_chance(self.b92fs.AMMO_MAX, 1)
	self.b92fs.FIRE_MODE = "single"
	self.b92fs.fire_mode_data = {}
	self.b92fs.fire_mode_data.fire_rate = 0.09
	self.b92fs.single = {}
	self.b92fs.single.fire_rate = 0.09
	self.b92fs.spread = {}
	self.b92fs.spread.standing = self.new_m4.spread.standing * 0.5
	self.b92fs.spread.crouching = self.new_m4.spread.standing * 0.5
	self.b92fs.spread.steelsight = self.new_m4.spread.steelsight
	self.b92fs.spread.moving_standing = self.new_m4.spread.standing * 0.5
	self.b92fs.spread.moving_crouching = self.new_m4.spread.standing * 0.5
	self.b92fs.spread.moving_steelsight = self.new_m4.spread.moving_steelsight
	self.b92fs.kick = {}
	self.b92fs.kick.standing = self.glock_17.kick.standing
	self.b92fs.kick.crouching = self.b92fs.kick.standing
	self.b92fs.kick.steelsight = self.b92fs.kick.standing
	self.b92fs.crosshair = {}
	self.b92fs.crosshair.standing = {}
	self.b92fs.crosshair.crouching = {}
	self.b92fs.crosshair.steelsight = {}
	self.b92fs.crosshair.standing.offset = 0.2
	self.b92fs.crosshair.standing.moving_offset = 0.6
	self.b92fs.crosshair.standing.kick_offset = 0.4
	self.b92fs.crosshair.crouching.offset = 0.1
	self.b92fs.crosshair.crouching.moving_offset = 0.6
	self.b92fs.crosshair.crouching.kick_offset = 0.3
	self.b92fs.crosshair.steelsight.hidden = true
	self.b92fs.crosshair.steelsight.offset = 0
	self.b92fs.crosshair.steelsight.moving_offset = 0
	self.b92fs.crosshair.steelsight.kick_offset = 0.1
	self.b92fs.shake = {}
	self.b92fs.shake.fire_multiplier = 1
	self.b92fs.shake.fire_steelsight_multiplier = -1
	self.b92fs.autohit = autohit_pistol_default
	self.b92fs.aim_assist = aim_assist_pistol_default
	self.b92fs.weapon_hold = "glock"
	self.b92fs.animations = {}
	self.b92fs.animations.equip_id = "equip_glock"
	self.b92fs.animations.recoil_steelsight = true
	self.b92fs.stats = {
		damage = 8,
		spread = 8,
		recoil = 8,
		spread_moving = 5,
		zoom = 3,
		concealment = 30,
		suppression = 17,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 1
	}
	self.new_raging_bull = {}
	self.new_raging_bull.category = "pistol"
	self.new_raging_bull.upgrade_blocks = {
		weapon = {
			"clip_ammo_increase"
		}
	}
	self.new_raging_bull.damage_melee = damage_melee_default
	self.new_raging_bull.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.new_raging_bull.sounds = {}
	self.new_raging_bull.sounds.fire = "rbull_fire"
	self.new_raging_bull.sounds.dryfire = "secondary_dryfire"
	self.new_raging_bull.sounds.enter_steelsight = "pistol_steel_sight_enter"
	self.new_raging_bull.sounds.leave_steelsight = "pistol_steel_sight_exit"
	self.new_raging_bull.timers = {}
	self.new_raging_bull.timers.reload_not_empty = 2.25
	self.new_raging_bull.timers.reload_empty = 2.25
	self.new_raging_bull.timers.unequip = 0.65
	self.new_raging_bull.timers.equip = 0.65
	self.new_raging_bull.FIRE_MODE = "single"
	self.new_raging_bull.fire_mode_data = {}
	self.new_raging_bull.fire_mode_data.fire_rate = 0.21
	self.new_raging_bull.single = {}
	self.new_raging_bull.single.fire_rate = 0.21
	self.new_raging_bull.name_id = "bm_w_raging_bull"
	self.new_raging_bull.desc_id = "bm_w_raging_bull_desc"
	self.new_raging_bull.description_id = "des_new_raging_bull"
	self.new_raging_bull.muzzleflash = "effects/payday2/particles/weapons/762_auto_fps"
	self.new_raging_bull.shell_ejection = "effects/payday2/particles/weapons/shells/shell_empty"
	self.new_raging_bull.use_data = {}
	self.new_raging_bull.use_data.selection_index = 1
	self.new_raging_bull.DAMAGE = 2
	self.new_raging_bull.CLIP_AMMO_MAX = 6
	self.new_raging_bull.NR_CLIPS_MAX = math.round(total_damage_secondary / 4.7 / self.new_raging_bull.CLIP_AMMO_MAX)
	self.new_raging_bull.AMMO_MAX = self.new_raging_bull.CLIP_AMMO_MAX * self.new_raging_bull.NR_CLIPS_MAX
	self.new_raging_bull.AMMO_PICKUP = self:_pickup_chance(self.new_raging_bull.AMMO_MAX, 1)
	self.new_raging_bull.spread = {}
	self.new_raging_bull.spread.standing = self.new_m4.spread.standing * 0.75
	self.new_raging_bull.spread.crouching = self.new_m4.spread.standing * 0.75
	self.new_raging_bull.spread.steelsight = self.new_m4.spread.steelsight
	self.new_raging_bull.spread.moving_standing = self.new_m4.spread.standing * 0.75
	self.new_raging_bull.spread.moving_crouching = self.new_m4.spread.standing * 0.75
	self.new_raging_bull.spread.moving_steelsight = self.new_m4.spread.moving_steelsight
	self.new_raging_bull.kick = {}
	self.new_raging_bull.kick.standing = self.glock_17.kick.standing
	self.new_raging_bull.kick.crouching = self.new_raging_bull.kick.standing
	self.new_raging_bull.kick.steelsight = self.new_raging_bull.kick.standing
	self.new_raging_bull.crosshair = {}
	self.new_raging_bull.crosshair.standing = {}
	self.new_raging_bull.crosshair.crouching = {}
	self.new_raging_bull.crosshair.steelsight = {}
	self.new_raging_bull.crosshair.standing.offset = 0.2
	self.new_raging_bull.crosshair.standing.moving_offset = 0.6
	self.new_raging_bull.crosshair.standing.kick_offset = 0.4
	self.new_raging_bull.crosshair.crouching.offset = 0.1
	self.new_raging_bull.crosshair.crouching.moving_offset = 0.6
	self.new_raging_bull.crosshair.crouching.kick_offset = 0.3
	self.new_raging_bull.crosshair.steelsight.hidden = true
	self.new_raging_bull.crosshair.steelsight.offset = 0
	self.new_raging_bull.crosshair.steelsight.moving_offset = 0
	self.new_raging_bull.crosshair.steelsight.kick_offset = 0.1
	self.new_raging_bull.shake = {}
	self.new_raging_bull.shake.fire_multiplier = 1
	self.new_raging_bull.shake.fire_steelsight_multiplier = -1
	self.new_raging_bull.autohit = autohit_pistol_default
	self.new_raging_bull.aim_assist = aim_assist_pistol_default
	self.new_raging_bull.weapon_hold = "raging_bull"
	self.new_raging_bull.animations = {}
	self.new_raging_bull.animations.equip_id = "equip_raging_bull"
	self.new_raging_bull.animations.recoil_steelsight = true
	self.new_raging_bull.stats = {
		damage = 22,
		spread = 7,
		recoil = 2,
		spread_moving = 5,
		zoom = 3,
		concealment = 26,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 1
	}
	self.saw = {}
	self.saw.category = "saw"
	self.saw.upgrade_blocks = {
		weapon = {
			"clip_ammo_increase"
		}
	}
	self.saw.damage_melee = damage_melee_default
	self.saw.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.saw.sounds = {}
	self.saw.sounds.fire = "Play_saw_handheld_start"
	self.saw.sounds.stop_fire = "Play_saw_handheld_end"
	self.saw.sounds.dryfire = "secondary_dryfire"
	self.saw.sounds.enter_steelsight = "secondary_steel_sight_enter"
	self.saw.sounds.leave_steelsight = "secondary_steel_sight_exit"
	self.saw.timers = {}
	self.saw.timers.reload_not_empty = 3.2
	self.saw.timers.reload_empty = 3.2
	self.saw.timers.unequip = 0.8
	self.saw.timers.equip = 0.8
	self.saw.name_id = "bm_w_saw"
	self.saw.desc_id = "bm_w_saw_desc"
	self.saw.description_id = "des_mp5"
	self.saw.muzzleflash = "effects/payday2/particles/weapons/9mm_auto_fps"
	self.saw.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence_fps"
	self.saw.use_data = {}
	self.saw.use_data.selection_index = 2
	self.saw.DAMAGE = 0.2
	self.saw.CLIP_AMMO_MAX = 150
	self.saw.NR_CLIPS_MAX = 2
	self.saw.AMMO_MAX = self.saw.CLIP_AMMO_MAX * self.saw.NR_CLIPS_MAX
	self.saw.AMMO_PICKUP = {0, 0}
	self.saw.FIRE_MODE = "auto"
	self.saw.fire_mode_data = {}
	self.saw.fire_mode_data.fire_rate = 0.15
	self.saw.auto = {}
	self.saw.auto.fire_rate = 0.15
	self.saw.spread = {}
	self.saw.spread.standing = 1
	self.saw.spread.crouching = 0.71
	self.saw.spread.steelsight = 0.48
	self.saw.spread.moving_standing = 1.28
	self.saw.spread.moving_crouching = 1.52
	self.saw.spread.moving_steelsight = 0.48
	self.saw.kick = {}
	self.saw.kick.standing = {
		1,
		-1,
		-1,
		1
	}
	self.saw.kick.crouching = {
		1,
		-1,
		-1,
		1
	}
	self.saw.kick.steelsight = {
		0.725,
		-0.725,
		-0.725,
		0.725
	}
	self.saw.crosshair = {}
	self.saw.crosshair.standing = {}
	self.saw.crosshair.crouching = {}
	self.saw.crosshair.steelsight = {}
	self.saw.crosshair.standing.offset = 0.5
	self.saw.crosshair.standing.moving_offset = 0.6
	self.saw.crosshair.standing.kick_offset = 0.7
	self.saw.crosshair.crouching.offset = 0.4
	self.saw.crosshair.crouching.moving_offset = 0.5
	self.saw.crosshair.crouching.kick_offset = 0.6
	self.saw.crosshair.steelsight.hidden = true
	self.saw.crosshair.steelsight.offset = 0
	self.saw.crosshair.steelsight.moving_offset = 0
	self.saw.crosshair.steelsight.kick_offset = 0
	self.saw.shake = {}
	self.saw.shake.fire_multiplier = 1
	self.saw.shake.fire_steelsight_multiplier = 1
	self.saw.autohit = autohit_pistol_default
	self.saw.aim_assist = aim_assist_pistol_default
	self.saw.weapon_hold = "saw"
	self.saw.animations = {}
	self.saw.animations.equip_id = "equip_saw"
	self.saw.animations.recoil_steelsight = true
	self.saw.stats = {
		alert_size = 9,
		suppression = 7,
		zoom = 1,
		spread = 3,
		recoil = 7,
		spread_moving = 7,
		damage = 10,
		concealment = 16,
		value = 1,
		extra_ammo = 6,
		total_ammo_mod = 21
	}
	self.saw.hit_alert_size_increase = 4
	self.usp = {}
	self.usp.category = "pistol"
	self.usp.damage_melee = damage_melee_default
	self.usp.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.usp.sounds = {}
	self.usp.sounds.fire = "usp45_fire"
	self.usp.sounds.enter_steelsight = "pistol_steel_sight_enter"
	self.usp.sounds.leave_steelsight = "pistol_steel_sight_exit"
	self.usp.sounds.dryfire = "secondary_dryfire"
	self.usp.timers = {}
	self.usp.timers.reload_not_empty = 1.47
	self.usp.timers.reload_empty = 2.2
	self.usp.timers.unequip = 0.55
	self.usp.timers.equip = 0.55
	self.usp.name_id = "bm_w_usp"
	self.usp.desc_id = "bm_w_usp_desc"
	self.usp.description_id = "des_usp"
	self.usp.muzzleflash = "effects/payday2/particles/weapons/9mm_auto_fps"
	self.usp.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence_fps"
	self.usp.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.usp.use_data = {}
	self.usp.use_data.selection_index = 1
	self.usp.DAMAGE = 1
	self.usp.FIRE_MODE = "single"
	self.usp.fire_mode_data = {}
	self.usp.fire_mode_data.fire_rate = 0.08
	self.usp.single = {}
	self.usp.single.fire_rate = 0.09
	self.usp.CLIP_AMMO_MAX = 13
	self.usp.NR_CLIPS_MAX = math.round(total_damage_secondary / 1.15 / self.usp.CLIP_AMMO_MAX)
	self.usp.AMMO_MAX = self.usp.CLIP_AMMO_MAX * self.usp.NR_CLIPS_MAX
	self.usp.AMMO_PICKUP = self:_pickup_chance(self.usp.AMMO_MAX, 1)
	self.usp.spread = {}
	self.usp.spread.standing = self.new_m4.spread.standing * 0.75
	self.usp.spread.crouching = self.new_m4.spread.standing * 0.75
	self.usp.spread.steelsight = self.new_m4.spread.steelsight
	self.usp.spread.moving_standing = self.new_m4.spread.standing * 0.75
	self.usp.spread.moving_crouching = self.new_m4.spread.standing * 0.75
	self.usp.spread.moving_steelsight = self.new_m4.spread.moving_steelsight
	self.usp.kick = {}
	self.usp.kick.standing = {
		1.2,
		1.8,
		-0.5,
		0.5
	}
	self.usp.kick.crouching = self.glock_17.kick.standing
	self.usp.kick.steelsight = self.glock_17.kick.standing
	self.usp.global_value = "pd2_clan"
	self.usp.crosshair = {}
	self.usp.crosshair.standing = {}
	self.usp.crosshair.crouching = {}
	self.usp.crosshair.steelsight = {}
	self.usp.crosshair.standing.offset = 0.2
	self.usp.crosshair.standing.moving_offset = 0.6
	self.usp.crosshair.standing.kick_offset = 0.4
	self.usp.crosshair.crouching.offset = 0.1
	self.usp.crosshair.crouching.moving_offset = 0.6
	self.usp.crosshair.crouching.kick_offset = 0.3
	self.usp.crosshair.steelsight.hidden = true
	self.usp.crosshair.steelsight.offset = 0
	self.usp.crosshair.steelsight.moving_offset = 0
	self.usp.crosshair.steelsight.kick_offset = 0.1
	self.usp.shake = {}
	self.usp.shake.fire_multiplier = 1
	self.usp.shake.fire_steelsight_multiplier = -1
	self.usp.autohit = autohit_pistol_default
	self.usp.aim_assist = aim_assist_pistol_default
	self.usp.weapon_hold = "glock"
	self.usp.animations = {}
	self.usp.animations.equip_id = "equip_glock"
	self.usp.animations.recoil_steelsight = true
	self.usp.stats = {
		damage = 9,
		spread = 7,
		recoil = 9,
		spread_moving = 8,
		zoom = 1,
		concealment = 29,
		suppression = 16,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 1
	}
	self.g22c = {}
	self.g22c.category = "pistol"
	self.g22c.damage_melee = damage_melee_default
	self.g22c.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.g22c.sounds = {}
	self.g22c.sounds.fire = "g22_fire"
	self.g22c.sounds.enter_steelsight = "pistol_steel_sight_enter"
	self.g22c.sounds.leave_steelsight = "pistol_steel_sight_exit"
	self.g22c.sounds.dryfire = "secondary_dryfire"
	self.g22c.timers = {}
	self.g22c.timers.reload_not_empty = 1.47
	self.g22c.timers.reload_empty = 2.2
	self.g22c.timers.unequip = 0.55
	self.g22c.timers.equip = 0.55
	self.g22c.name_id = "bm_w_g22c"
	self.g22c.desc_id = "bm_w_g22c_desc"
	self.g22c.description_id = "des_g22c"
	self.g22c.muzzleflash = "effects/payday2/particles/weapons/9mm_auto_fps"
	self.g22c.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence_fps"
	self.g22c.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.g22c.use_data = {}
	self.g22c.use_data.selection_index = 1
	self.g22c.DAMAGE = 1
	self.g22c.FIRE_MODE = "single"
	self.g22c.fire_mode_data = {}
	self.g22c.fire_mode_data.fire_rate = 0.08
	self.g22c.single = {}
	self.g22c.single.fire_rate = 0.09
	self.g22c.CLIP_AMMO_MAX = 16
	self.g22c.NR_CLIPS_MAX = math.round(total_damage_secondary / 1.15 / self.g22c.CLIP_AMMO_MAX)
	self.g22c.AMMO_MAX = self.g22c.CLIP_AMMO_MAX * self.g22c.NR_CLIPS_MAX
	self.g22c.AMMO_PICKUP = self:_pickup_chance(self.g22c.AMMO_MAX, 1)
	self.g22c.spread = {}
	self.g22c.spread.standing = self.new_m4.spread.standing * 0.75
	self.g22c.spread.crouching = self.new_m4.spread.standing * 0.75
	self.g22c.spread.steelsight = self.new_m4.spread.steelsight
	self.g22c.spread.moving_standing = self.new_m4.spread.standing * 0.75
	self.g22c.spread.moving_crouching = self.new_m4.spread.standing * 0.75
	self.g22c.spread.moving_steelsight = self.new_m4.spread.moving_steelsight
	self.g22c.kick = {}
	self.g22c.kick.standing = {
		1.2,
		1.8,
		-0.5,
		0.5
	}
	self.g22c.kick.crouching = self.glock_17.kick.standing
	self.g22c.kick.steelsight = self.glock_17.kick.standing
	self.g22c.global_value = "pd2_clan"
	self.g22c.crosshair = {}
	self.g22c.crosshair.standing = {}
	self.g22c.crosshair.crouching = {}
	self.g22c.crosshair.steelsight = {}
	self.g22c.crosshair.standing.offset = 0.2
	self.g22c.crosshair.standing.moving_offset = 0.6
	self.g22c.crosshair.standing.kick_offset = 0.4
	self.g22c.crosshair.crouching.offset = 0.1
	self.g22c.crosshair.crouching.moving_offset = 0.6
	self.g22c.crosshair.crouching.kick_offset = 0.3
	self.g22c.crosshair.steelsight.hidden = true
	self.g22c.crosshair.steelsight.offset = 0
	self.g22c.crosshair.steelsight.moving_offset = 0
	self.g22c.crosshair.steelsight.kick_offset = 0.1
	self.g22c.shake = {}
	self.g22c.shake.fire_multiplier = 1
	self.g22c.shake.fire_steelsight_multiplier = -1
	self.g22c.autohit = autohit_pistol_default
	self.g22c.aim_assist = aim_assist_pistol_default
	self.g22c.weapon_hold = "glock"
	self.g22c.animations = {}
	self.g22c.animations.equip_id = "equip_glock"
	self.g22c.animations.recoil_steelsight = true
	self.g22c.stats = {
		damage = 10,
		spread = 6,
		recoil = 13,
		spread_moving = 8,
		zoom = 1,
		concealment = 29,
		suppression = 15,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 1
	}
	self.judge = {}
	self.judge.category = "shotgun"
	self.judge.upgrade_blocks = {
		weapon = {
			"clip_ammo_increase"
		}
	}
	self.judge.damage_melee = damage_melee_default
	self.judge.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.judge.sounds = {}
	self.judge.sounds.fire = "judge_fire"
	self.judge.sounds.dryfire = "secondary_dryfire"
	self.judge.sounds.enter_steelsight = "pistol_steel_sight_enter"
	self.judge.sounds.leave_steelsight = "pistol_steel_sight_exit"
	self.judge.timers = {}
	self.judge.timers.reload_not_empty = 2.25
	self.judge.timers.reload_empty = 2.25
	self.judge.timers.unequip = 0.65
	self.judge.timers.equip = 0.65
	self.judge.FIRE_MODE = "single"
	self.judge.fire_mode_data = {}
	self.judge.fire_mode_data.fire_rate = 0.12
	self.judge.single = {}
	self.judge.single.fire_rate = 0.21
	self.judge.name_id = "bm_w_judge"
	self.judge.desc_id = "bm_w_judge_desc"
	self.judge.description_id = "des_judge"
	self.judge.muzzleflash = "effects/payday2/particles/weapons/762_auto_fps"
	self.judge.shell_ejection = "effects/payday2/particles/weapons/shells/shell_empty"
	self.judge.use_data = {}
	self.judge.use_data.selection_index = 1
	self.judge.use_data.align_place = "right_hand"
	self.judge.DAMAGE = 6
	self.judge.damage_near = 800
	self.judge.damage_far = 1200
	self.judge.rays = 6
	self.judge.CLIP_AMMO_MAX = 5
	self.judge.NR_CLIPS_MAX = math.round(total_damage_secondary / 8.5 / self.judge.CLIP_AMMO_MAX)
	self.judge.AMMO_MAX = self.judge.CLIP_AMMO_MAX * self.judge.NR_CLIPS_MAX
	self.judge.AMMO_PICKUP = self:_pickup_chance(self.judge.AMMO_MAX, 1)
	self.judge.spread = {}
	self.judge.spread.standing = self.r870.spread.standing
	self.judge.spread.crouching = self.r870.spread.crouching
	self.judge.spread.steelsight = self.r870.spread.steelsight
	self.judge.spread.moving_standing = self.r870.spread.moving_standing
	self.judge.spread.moving_crouching = self.r870.spread.moving_crouching
	self.judge.spread.moving_steelsight = self.r870.spread.moving_steelsight
	self.judge.kick = {}
	self.judge.kick.standing = {
		2.9,
		3,
		-0.5,
		0.5
	}
	self.judge.kick.crouching = self.judge.kick.standing
	self.judge.kick.steelsight = self.judge.kick.standing
	self.judge.crosshair = {}
	self.judge.crosshair.standing = {}
	self.judge.crosshair.crouching = {}
	self.judge.crosshair.steelsight = {}
	self.judge.crosshair.standing.offset = 0.2
	self.judge.crosshair.standing.moving_offset = 0.8
	self.judge.crosshair.standing.kick_offset = 0.6
	self.judge.crosshair.crouching.offset = 0.1
	self.judge.crosshair.crouching.moving_offset = 0.7
	self.judge.crosshair.crouching.kick_offset = 0.4
	self.judge.crosshair.steelsight.hidden = true
	self.judge.crosshair.steelsight.offset = 0
	self.judge.crosshair.steelsight.moving_offset = 0
	self.judge.crosshair.steelsight.kick_offset = 0.1
	self.judge.shake = {}
	self.judge.shake.fire_multiplier = 2
	self.judge.shake.fire_steelsight_multiplier = 2
	self.judge.autohit = autohit_shotgun_default
	self.judge.aim_assist = aim_assist_shotgun_default
	self.judge.weapon_hold = "raging_bull"
	self.judge.animations = {}
	self.judge.animations.equip_id = "equip_raging_bull"
	self.judge.animations.recoil_steelsight = true
	self.judge.global_value = "pd2_clan"
	self.judge.texture_bundle_folder = "pd2_million"
	self.judge.stats = {
		damage = 30,
		spread = 4,
		recoil = 2,
		spread_moving = 5,
		zoom = 3,
		concealment = 29,
		suppression = 5,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 1
	}
	self.m45 = {}
	self.m45.category = "smg"
	self.m45.damage_melee = damage_melee_default
	self.m45.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.m45.sounds = {}
	self.m45.sounds.fire = "m45_fire_single"
	self.m45.sounds.fire_single = "m45_fire_single"
	self.m45.sounds.fire_auto = "m45_fire"
	self.m45.sounds.stop_fire = "m45_stop"
	self.m45.sounds.dryfire = "secondary_dryfire"
	self.m45.sounds.enter_steelsight = "secondary_steel_sight_enter"
	self.m45.sounds.leave_steelsight = "secondary_steel_sight_exit"
	self.m45.timers = {}
	self.m45.timers.reload_not_empty = 2.85
	self.m45.timers.reload_empty = 3.9
	self.m45.timers.unequip = 0.75
	self.m45.timers.equip = 0.75
	self.m45.name_id = "bm_w_m45"
	self.m45.desc_id = "bm_w_m45_desc"
	self.m45.description_id = "des_m45"
	self.m45.muzzleflash = "effects/payday2/particles/weapons/9mm_auto_fps"
	self.m45.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence_fps"
	self.m45.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.m45.use_data = {}
	self.m45.use_data.selection_index = 1
	self.m45.DAMAGE = 1
	self.m45.CLIP_AMMO_MAX = 40
	self.m45.NR_CLIPS_MAX = math.round(total_damage_secondary / 2.2 / self.m45.CLIP_AMMO_MAX)
	self.m45.AMMO_MAX = self.m45.CLIP_AMMO_MAX * self.m45.NR_CLIPS_MAX
	self.m45.AMMO_PICKUP = self:_pickup_chance(self.m45.AMMO_MAX, 1)
	self.m45.FIRE_MODE = "auto"
	self.m45.fire_mode_data = {}
	self.m45.fire_mode_data.fire_rate = 0.1
	self.m45.auto = {}
	self.m45.auto.fire_rate = 0.1
	self.m45.spread = {}
	self.m45.spread.standing = self.new_m4.spread.standing * 0.75
	self.m45.spread.crouching = self.new_m4.spread.standing * 0.75
	self.m45.spread.steelsight = self.new_m4.spread.steelsight
	self.m45.spread.moving_standing = self.new_m4.spread.standing * 0.75
	self.m45.spread.moving_crouching = self.new_m4.spread.standing * 0.75
	self.m45.spread.moving_steelsight = self.new_m4.spread.moving_steelsight
	self.m45.kick = {}
	self.m45.kick.standing = self.mp9.kick.standing
	self.m45.kick.crouching = self.m45.kick.standing
	self.m45.kick.steelsight = self.m45.kick.standing
	self.m45.crosshair = {}
	self.m45.crosshair.standing = {}
	self.m45.crosshair.crouching = {}
	self.m45.crosshair.steelsight = {}
	self.m45.crosshair.standing.offset = 0.4
	self.m45.crosshair.standing.moving_offset = 0.7
	self.m45.crosshair.standing.kick_offset = 0.6
	self.m45.crosshair.crouching.offset = 0.3
	self.m45.crosshair.crouching.moving_offset = 0.6
	self.m45.crosshair.crouching.kick_offset = 0.4
	self.m45.crosshair.steelsight.hidden = true
	self.m45.crosshair.steelsight.offset = 0
	self.m45.crosshair.steelsight.moving_offset = 0
	self.m45.crosshair.steelsight.kick_offset = 0.4
	self.m45.shake = {}
	self.m45.shake.fire_multiplier = 1
	self.m45.shake.fire_steelsight_multiplier = -1
	self.m45.autohit = autohit_smg_default
	self.m45.aim_assist = aim_assist_smg_default
	self.m45.weapon_hold = "m45"
	self.m45.animations = {}
	self.m45.animations.equip_id = "equip_m45"
	self.m45.animations.recoil_steelsight = true
	self.m45.global_value = "armored_transport"
	self.m45.texture_bundle_folder = "dlc1"
	self.m45.stats = {
		damage = 12,
		spread = 6,
		recoil = 7,
		spread_moving = 8,
		zoom = 1,
		concealment = 24,
		suppression = 14,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 5
	}
	self.s552 = {}
	self.s552.category = "assault_rifle"
	self.s552.damage_melee = damage_melee_default
	self.s552.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.s552.sounds = {}
	self.s552.sounds.fire = "sig552_fire_single"
	self.s552.sounds.fire_single = "sig552_fire_single"
	self.s552.sounds.fire_auto = "sig552_fire"
	self.s552.sounds.stop_fire = "sig552_stop"
	self.s552.sounds.dryfire = "primary_dryfire"
	self.s552.sounds.enter_steelsight = "secondary_steel_sight_enter"
	self.s552.sounds.leave_steelsight = "secondary_steel_sight_exit"
	self.s552.timers = {}
	self.s552.timers.reload_not_empty = 2.5
	self.s552.timers.reload_empty = 3.45
	self.s552.timers.unequip = 0.9
	self.s552.timers.equip = 0.9
	self.s552.name_id = "bm_w_s552"
	self.s552.desc_id = "bm_w_s552_desc"
	self.s552.description_id = "des_s552"
	self.s552.muzzleflash = "effects/payday2/particles/weapons/556_auto_fps"
	self.s552.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.s552.use_data = {}
	self.s552.use_data.selection_index = 2
	self.s552.DAMAGE = 1
	self.s552.CLIP_AMMO_MAX = 30
	self.s552.NR_CLIPS_MAX = math.round(total_damage_secondary / 1.1 / self.s552.CLIP_AMMO_MAX)
	self.s552.AMMO_MAX = self.s552.CLIP_AMMO_MAX * self.s552.NR_CLIPS_MAX
	self.s552.AMMO_PICKUP = self:_pickup_chance(self.s552.AMMO_MAX, 2)
	self.s552.FIRE_MODE = "auto"
	self.s552.fire_mode_data = {}
	self.s552.fire_mode_data.fire_rate = 0.084
	self.s552.CAN_TOGGLE_FIREMODE = true
	self.s552.auto = {}
	self.s552.auto.fire_rate = 0.084
	self.s552.spread = {}
	self.s552.spread.standing = self.new_m4.spread.standing * 0.8
	self.s552.spread.crouching = self.new_m4.spread.standing * 0.8
	self.s552.spread.steelsight = self.new_m4.spread.steelsight
	self.s552.spread.moving_standing = self.new_m4.spread.standing * 0.8
	self.s552.spread.moving_crouching = self.new_m4.spread.standing * 0.8
	self.s552.spread.moving_steelsight = self.new_m4.spread.moving_steelsight
	self.s552.kick = {}
	self.s552.kick.standing = self.new_m4.kick.standing
	self.s552.kick.crouching = self.s552.kick.standing
	self.s552.kick.steelsight = self.s552.kick.standing
	self.s552.crosshair = {}
	self.s552.crosshair.standing = {}
	self.s552.crosshair.crouching = {}
	self.s552.crosshair.steelsight = {}
	self.s552.crosshair.standing.offset = 0.16
	self.s552.crosshair.standing.moving_offset = 0.9
	self.s552.crosshair.standing.kick_offset = 0.7
	self.s552.crosshair.crouching.offset = 0.1
	self.s552.crosshair.crouching.moving_offset = 0.8
	self.s552.crosshair.crouching.kick_offset = 0.5
	self.s552.crosshair.steelsight.hidden = true
	self.s552.crosshair.steelsight.offset = 0
	self.s552.crosshair.steelsight.moving_offset = 0
	self.s552.crosshair.steelsight.kick_offset = 0.15
	self.s552.shake = {}
	self.s552.shake.fire_multiplier = 1
	self.s552.shake.fire_steelsight_multiplier = -1
	self.s552.autohit = autohit_rifle_default
	self.s552.aim_assist = aim_assist_rifle_default
	self.s552.weapon_hold = "ak47"
	self.s552.animations = {}
	self.s552.animations.equip_id = "equip_ak47"
	self.s552.animations.recoil_steelsight = true
	self.s552.global_value = "armored_transport"
	self.s552.texture_bundle_folder = "dlc1"
	self.s552.stats = {
		damage = 12,
		spread = 6,
		recoil = 9,
		spread_moving = 5,
		zoom = 3,
		concealment = 22,
		suppression = 12,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 1
	}
	self.ppk = {}
	self.ppk.category = "pistol"
	self.ppk.damage_melee = damage_melee_default
	self.ppk.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.ppk.sounds = {}
	self.ppk.sounds.fire = "w_ppk_fire"
	self.ppk.sounds.enter_steelsight = "pistol_steel_sight_enter"
	self.ppk.sounds.leave_steelsight = "pistol_steel_sight_exit"
	self.ppk.sounds.dryfire = "secondary_dryfire"
	self.ppk.timers = {}
	self.ppk.timers.reload_not_empty = 1.47
	self.ppk.timers.reload_empty = 2.12
	self.ppk.timers.unequip = 0.5
	self.ppk.timers.equip = 0.5
	self.ppk.name_id = "bm_w_ppk"
	self.ppk.desc_id = "bm_w_ppk_desc"
	self.ppk.description_id = "des_ppk"
	self.ppk.muzzleflash = "effects/payday2/particles/weapons/9mm_auto_fps"
	self.ppk.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence_fps"
	self.ppk.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.ppk.use_data = {}
	self.ppk.use_data.selection_index = 1
	self.ppk.DAMAGE = 1
	self.ppk.CLIP_AMMO_MAX = 14
	self.ppk.NR_CLIPS_MAX = math.round(total_damage_secondary / 1 / self.ppk.CLIP_AMMO_MAX)
	self.ppk.AMMO_MAX = self.ppk.CLIP_AMMO_MAX * self.ppk.NR_CLIPS_MAX
	self.ppk.AMMO_PICKUP = self:_pickup_chance(self.ppk.AMMO_MAX, 1)
	self.ppk.FIRE_MODE = "single"
	self.ppk.fire_mode_data = {}
	self.ppk.fire_mode_data.fire_rate = 0.09
	self.ppk.single = {}
	self.ppk.single.fire_rate = 0.09
	self.ppk.spread = {}
	self.ppk.spread.standing = self.new_m4.spread.standing * 0.5
	self.ppk.spread.crouching = self.new_m4.spread.standing * 0.5
	self.ppk.spread.steelsight = self.new_m4.spread.steelsight
	self.ppk.spread.moving_standing = self.new_m4.spread.standing * 0.5
	self.ppk.spread.moving_crouching = self.new_m4.spread.standing * 0.5
	self.ppk.spread.moving_steelsight = self.new_m4.spread.moving_steelsight
	self.ppk.kick = {}
	self.ppk.kick.standing = self.glock_17.kick.standing
	self.ppk.kick.crouching = self.ppk.kick.standing
	self.ppk.kick.steelsight = self.ppk.kick.standing
	self.ppk.crosshair = {}
	self.ppk.crosshair.standing = {}
	self.ppk.crosshair.crouching = {}
	self.ppk.crosshair.steelsight = {}
	self.ppk.crosshair.standing.offset = 0.2
	self.ppk.crosshair.standing.moving_offset = 0.6
	self.ppk.crosshair.standing.kick_offset = 0.4
	self.ppk.crosshair.crouching.offset = 0.1
	self.ppk.crosshair.crouching.moving_offset = 0.6
	self.ppk.crosshair.crouching.kick_offset = 0.3
	self.ppk.crosshair.steelsight.hidden = true
	self.ppk.crosshair.steelsight.offset = 0
	self.ppk.crosshair.steelsight.moving_offset = 0
	self.ppk.crosshair.steelsight.kick_offset = 0.1
	self.ppk.shake = {}
	self.ppk.shake.fire_multiplier = 1
	self.ppk.shake.fire_steelsight_multiplier = -1
	self.ppk.autohit = autohit_pistol_default
	self.ppk.aim_assist = aim_assist_pistol_default
	self.ppk.weapon_hold = "glock"
	self.ppk.animations = {}
	self.ppk.animations.equip_id = "equip_glock"
	self.ppk.animations.recoil_steelsight = true
	self.ppk.global_value = "armored_transport"
	self.ppk.texture_bundle_folder = "dlc1"
	self.ppk.stats = {
		damage = 8,
		spread = 9,
		recoil = 9,
		spread_moving = 9,
		zoom = 3,
		concealment = 30,
		suppression = 18,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 1
	}
	self.mp7 = {}
	self.mp7.category = "smg"
	self.mp7.damage_melee = damage_melee_default
	self.mp7.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.mp7.sounds = {}
	self.mp7.sounds.fire = "mp7_fire_single"
	self.mp7.sounds.fire_single = "mp7_fire_single"
	self.mp7.sounds.fire_auto = "mp7_fire"
	self.mp7.sounds.stop_fire = "mp7_stop"
	self.mp7.sounds.dryfire = "secondary_dryfire"
	self.mp7.sounds.enter_steelsight = "secondary_steel_sight_enter"
	self.mp7.sounds.leave_steelsight = "secondary_steel_sight_exit"
	self.mp7.timers = {}
	self.mp7.timers.reload_not_empty = 1.96
	self.mp7.timers.reload_empty = 2.45
	self.mp7.timers.unequip = 0.75
	self.mp7.timers.equip = 0.75
	self.mp7.name_id = "bm_w_mp7"
	self.mp7.desc_id = "bm_w_mp7_desc"
	self.mp7.description_id = "des_mp7"
	self.mp7.muzzleflash = "effects/payday2/particles/weapons/9mm_auto_fps"
	self.mp7.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence_fps"
	self.mp7.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.mp7.use_data = {}
	self.mp7.use_data.selection_index = 1
	self.mp7.DAMAGE = 1
	self.mp7.CLIP_AMMO_MAX = 20
	self.mp7.NR_CLIPS_MAX = math.round(total_damage_secondary / 1.8 / self.mp7.CLIP_AMMO_MAX)
	self.mp7.AMMO_MAX = self.mp7.CLIP_AMMO_MAX * self.mp7.NR_CLIPS_MAX
	self.mp7.AMMO_PICKUP = self:_pickup_chance(self.mp7.AMMO_MAX, 1)
	self.mp7.FIRE_MODE = "auto"
	self.mp7.fire_mode_data = {}
	self.mp7.fire_mode_data.fire_rate = 0.063
	self.mp7.CAN_TOGGLE_FIREMODE = true
	self.mp7.auto = {}
	self.mp7.auto.fire_rate = 0.063
	self.mp7.spread = {}
	self.mp7.spread.standing = self.new_m4.spread.standing * 0.8
	self.mp7.spread.crouching = self.new_m4.spread.standing * 0.8
	self.mp7.spread.steelsight = self.new_m4.spread.steelsight
	self.mp7.spread.moving_standing = self.new_m4.spread.standing * 0.8
	self.mp7.spread.moving_crouching = self.new_m4.spread.standing * 0.8
	self.mp7.spread.moving_steelsight = self.new_m4.spread.moving_steelsight
	self.mp7.kick = {}
	self.mp7.kick.standing = self.new_m4.kick.standing
	self.mp7.kick.crouching = self.mp7.kick.standing
	self.mp7.kick.steelsight = self.mp7.kick.standing
	self.mp7.crosshair = {}
	self.mp7.crosshair.standing = {}
	self.mp7.crosshair.crouching = {}
	self.mp7.crosshair.steelsight = {}
	self.mp7.crosshair.standing.offset = 0.5
	self.mp7.crosshair.standing.moving_offset = 0.8
	self.mp7.crosshair.standing.kick_offset = 0.7
	self.mp7.crosshair.crouching.offset = 0.3
	self.mp7.crosshair.crouching.moving_offset = 0.6
	self.mp7.crosshair.crouching.kick_offset = 0.5
	self.mp7.crosshair.steelsight.hidden = true
	self.mp7.crosshair.steelsight.offset = 0
	self.mp7.crosshair.steelsight.moving_offset = 0
	self.mp7.crosshair.steelsight.kick_offset = 0.3
	self.mp7.shake = {}
	self.mp7.shake.fire_multiplier = 1
	self.mp7.shake.fire_steelsight_multiplier = -1
	self.mp7.autohit = autohit_smg_default
	self.mp7.aim_assist = aim_assist_smg_default
	self.mp7.weapon_hold = "mp9"
	self.mp7.animations = {}
	self.mp7.animations.equip_id = "equip_mp9"
	self.mp7.animations.recoil_steelsight = true
	self.mp7.global_value = "gage_pack"
	self.mp7.texture_bundle_folder = "gage_pack"
	self.mp7.stats = {
		damage = 12,
		spread = 7,
		recoil = 8,
		spread_moving = 7,
		zoom = 1,
		concealment = 23,
		suppression = 16,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 7
	}
	self.scar = {}
	self.scar.category = "assault_rifle"
	self.scar.damage_melee = damage_melee_default
	self.scar.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.scar.sounds = {}
	self.scar.sounds.fire = "scar_fire_single"
	self.scar.sounds.fire_single = "scar_fire_single"
	self.scar.sounds.fire_auto = "scar_fire"
	self.scar.sounds.stop_fire = "scar_stop"
	self.scar.sounds.dryfire = "primary_dryfire"
	self.scar.sounds.enter_steelsight = "secondary_steel_sight_enter"
	self.scar.sounds.leave_steelsight = "secondary_steel_sight_exit"
	self.scar.timers = {}
	self.scar.timers.reload_not_empty = 2.2
	self.scar.timers.reload_empty = 3
	self.scar.timers.unequip = 0.9
	self.scar.timers.equip = 0.9
	self.scar.name_id = "bm_w_scar"
	self.scar.desc_id = "bm_w_scar_desc"
	self.scar.description_id = "des_scar"
	self.scar.muzzleflash = "effects/payday2/particles/weapons/762_auto_fps"
	self.scar.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.scar.use_data = {}
	self.scar.use_data.selection_index = 2
	self.scar.DAMAGE = 1
	self.scar.CLIP_AMMO_MAX = 20
	self.scar.NR_CLIPS_MAX = math.round(total_damage_secondary / 1.7 / self.scar.CLIP_AMMO_MAX)
	self.scar.AMMO_MAX = self.scar.CLIP_AMMO_MAX * self.scar.NR_CLIPS_MAX
	self.scar.AMMO_PICKUP = self:_pickup_chance(self.scar.AMMO_MAX, 2)
	self.scar.FIRE_MODE = "auto"
	self.scar.fire_mode_data = {}
	self.scar.fire_mode_data.fire_rate = 0.098
	self.scar.CAN_TOGGLE_FIREMODE = true
	self.scar.auto = {}
	self.scar.auto.fire_rate = 0.098
	self.scar.spread = {}
	self.scar.spread.standing = self.new_m4.spread.standing * 0.6
	self.scar.spread.crouching = self.new_m4.spread.standing * 0.7
	self.scar.spread.steelsight = self.new_m4.spread.steelsight
	self.scar.spread.moving_standing = self.new_m4.spread.standing * 0.7
	self.scar.spread.moving_crouching = self.new_m4.spread.standing * 0.8
	self.scar.spread.moving_steelsight = self.new_m4.spread.moving_steelsight
	self.scar.kick = {}
	self.scar.kick.standing = self.new_m4.kick.standing
	self.scar.kick.crouching = self.scar.kick.standing
	self.scar.kick.steelsight = self.scar.kick.standing
	self.scar.crosshair = {}
	self.scar.crosshair.standing = {}
	self.scar.crosshair.crouching = {}
	self.scar.crosshair.steelsight = {}
	self.scar.crosshair.standing.offset = 0.14
	self.scar.crosshair.standing.moving_offset = 0.8
	self.scar.crosshair.standing.kick_offset = 0.6
	self.scar.crosshair.crouching.offset = 0.1
	self.scar.crosshair.crouching.moving_offset = 0.6
	self.scar.crosshair.crouching.kick_offset = 0.4
	self.scar.crosshair.steelsight.hidden = true
	self.scar.crosshair.steelsight.offset = 0
	self.scar.crosshair.steelsight.moving_offset = 0
	self.scar.crosshair.steelsight.kick_offset = 0.14
	self.scar.shake = {}
	self.scar.shake.fire_multiplier = 1
	self.scar.shake.fire_steelsight_multiplier = -1
	self.scar.autohit = autohit_rifle_default
	self.scar.aim_assist = aim_assist_rifle_default
	self.scar.weapon_hold = "m4"
	self.scar.animations = {}
	self.scar.animations.equip_id = "equip_m4"
	self.scar.animations.recoil_steelsight = true
	self.scar.global_value = "gage_pack"
	self.scar.texture_bundle_folder = "gage_pack"
	self.scar.stats = {
		damage = 18,
		spread = 7,
		recoil = 5,
		spread_moving = 5,
		zoom = 3,
		concealment = 8,
		suppression = 8,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 9
	}
	self.p226 = {}
	self.p226.category = "pistol"
	self.p226.damage_melee = damage_melee_default
	self.p226.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.p226.sounds = {}
	self.p226.sounds.fire = "p226r_fire"
	self.p226.sounds.enter_steelsight = "pistol_steel_sight_enter"
	self.p226.sounds.leave_steelsight = "pistol_steel_sight_exit"
	self.p226.sounds.dryfire = "secondary_dryfire"
	self.p226.timers = {}
	self.p226.timers.reload_not_empty = 1.47
	self.p226.timers.reload_empty = 2.12
	self.p226.timers.unequip = 0.5
	self.p226.timers.equip = 0.5
	self.p226.name_id = "bm_w_p226"
	self.p226.desc_id = "bm_w_p226_desc"
	self.p226.description_id = "des_p226"
	self.p226.muzzleflash = "effects/payday2/particles/weapons/9mm_auto_fps"
	self.p226.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence_fps"
	self.p226.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.p226.use_data = {}
	self.p226.use_data.selection_index = 1
	self.p226.DAMAGE = 1
	self.p226.CLIP_AMMO_MAX = 12
	self.p226.NR_CLIPS_MAX = math.round(total_damage_secondary / 1.8 / self.p226.CLIP_AMMO_MAX)
	self.p226.AMMO_MAX = self.p226.CLIP_AMMO_MAX * self.p226.NR_CLIPS_MAX
	self.p226.AMMO_PICKUP = self:_pickup_chance(self.p226.AMMO_MAX, 1)
	self.p226.FIRE_MODE = "single"
	self.p226.fire_mode_data = {}
	self.p226.fire_mode_data.fire_rate = 0.09
	self.p226.single = {}
	self.p226.single.fire_rate = 0.09
	self.p226.spread = {}
	self.p226.spread.standing = self.new_m4.spread.standing * 0.3
	self.p226.spread.crouching = self.new_m4.spread.standing * 0.3
	self.p226.spread.steelsight = self.new_m4.spread.steelsight
	self.p226.spread.moving_standing = self.new_m4.spread.standing * 0.3
	self.p226.spread.moving_crouching = self.new_m4.spread.standing * 0.3
	self.p226.spread.moving_steelsight = self.new_m4.spread.moving_steelsight
	self.p226.kick = {}
	self.p226.kick.standing = self.glock_17.kick.standing
	self.p226.kick.crouching = self.p226.kick.standing
	self.p226.kick.steelsight = self.p226.kick.standing
	self.p226.crosshair = {}
	self.p226.crosshair.standing = {}
	self.p226.crosshair.crouching = {}
	self.p226.crosshair.steelsight = {}
	self.p226.crosshair.standing.offset = 0.1
	self.p226.crosshair.standing.moving_offset = 0.4
	self.p226.crosshair.standing.kick_offset = 0.3
	self.p226.crosshair.crouching.offset = 0.1
	self.p226.crosshair.crouching.moving_offset = 0.5
	self.p226.crosshair.crouching.kick_offset = 0.2
	self.p226.crosshair.steelsight.hidden = true
	self.p226.crosshair.steelsight.offset = 0
	self.p226.crosshair.steelsight.moving_offset = 0
	self.p226.crosshair.steelsight.kick_offset = 0.1
	self.p226.shake = {}
	self.p226.shake.fire_multiplier = 1
	self.p226.shake.fire_steelsight_multiplier = -1
	self.p226.autohit = autohit_pistol_default
	self.p226.aim_assist = aim_assist_pistol_default
	self.p226.weapon_hold = "glock"
	self.p226.animations = {}
	self.p226.animations.equip_id = "equip_glock"
	self.p226.animations.recoil_steelsight = true
	self.p226.global_value = "gage_pack"
	self.p226.texture_bundle_folder = "gage_pack"
	self.p226.stats = {
		damage = 10,
		spread = 7,
		recoil = 7,
		spread_moving = 7,
		zoom = 3,
		concealment = 29,
		suppression = 15,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 4
	}
	self.hk21 = {}
	self.hk21.category = "lmg"
	self.hk21.damage_melee = damage_melee_default
	self.hk21.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.hk21.sounds = {}
	self.hk21.sounds.fire = "hk23e_fire"
	self.hk21.sounds.fire_single = "hk23e_fire_single"
	self.hk21.sounds.fire_auto = "hk23e_fire"
	self.hk21.sounds.stop_fire = "hk23e_stop"
	self.hk21.sounds.dryfire = "primary_dryfire"
	self.hk21.sounds.enter_steelsight = "lmg_steelsight_enter"
	self.hk21.sounds.leave_steelsight = "lmg_steelsight_exit"
	self.hk21.timers = {}
	self.hk21.timers.reload_not_empty = 5.6
	self.hk21.timers.reload_empty = 6.7
	self.hk21.timers.unequip = 0.9
	self.hk21.timers.equip = 0.9
	self.hk21.name_id = "bm_w_hk21"
	self.hk21.desc_id = "bm_w_hk21_desc"
	self.hk21.description_id = "des_hk21"
	self.hk21.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
	self.hk21.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
	self.hk21.use_data = {}
	self.hk21.use_data.selection_index = 2
	self.hk21.DAMAGE = 1
	self.hk21.CLIP_AMMO_MAX = 150
	self.hk21.NR_CLIPS_MAX = 2
	self.hk21.AMMO_MAX = self.hk21.CLIP_AMMO_MAX * self.hk21.NR_CLIPS_MAX
	self.hk21.AMMO_PICKUP = self:_pickup_chance(80, 1.5)
	self.hk21.FIRE_MODE = "auto"
	self.hk21.fire_mode_data = {}
	self.hk21.fire_mode_data.fire_rate = 0.083
	self.hk21.CAN_TOGGLE_FIREMODE = false
	self.hk21.auto = {}
	self.hk21.auto.fire_rate = 0.083
	self.hk21.spread = {}
	self.hk21.spread.standing = 3.8
	self.hk21.spread.crouching = 3.2
	self.hk21.spread.steelsight = 1.5
	self.hk21.spread.moving_standing = 4
	self.hk21.spread.moving_crouching = 3.5
	self.hk21.spread.moving_steelsight = 2
	self.hk21.kick = {}
	self.hk21.kick.standing = {
		-0.2,
		0.8,
		-0.8,
		1
	}
	self.hk21.kick.crouching = self.hk21.kick.standing
	self.hk21.kick.steelsight = self.hk21.kick.standing
	self.hk21.crosshair = {}
	self.hk21.crosshair.standing = {}
	self.hk21.crosshair.crouching = {}
	self.hk21.crosshair.steelsight = {}
	self.hk21.crosshair.standing.offset = 0.14
	self.hk21.crosshair.standing.moving_offset = 0.8
	self.hk21.crosshair.standing.kick_offset = 0.6
	self.hk21.crosshair.crouching.offset = 0.1
	self.hk21.crosshair.crouching.moving_offset = 0.6
	self.hk21.crosshair.crouching.kick_offset = 0.4
	self.hk21.crosshair.steelsight.hidden = true
	self.hk21.crosshair.steelsight.offset = 0
	self.hk21.crosshair.steelsight.moving_offset = 0
	self.hk21.crosshair.steelsight.kick_offset = 0.14
	self.hk21.shake = {}
	self.hk21.shake.fire_multiplier = 0.8
	self.hk21.shake.fire_steelsight_multiplier = -0.8
	self.hk21.autohit = autohit_lmg_default
	self.hk21.aim_assist = aim_assist_lmg_default
	self.hk21.weapon_hold = "hk21"
	self.hk21.animations = {}
	self.hk21.animations.equip_id = "equip_hk21"
	self.hk21.animations.recoil_steelsight = true
	self.hk21.global_value = "gage_pack_lmg"
	self.hk21.texture_bundle_folder = "gage_pack_lmg"
	self.hk21.stats = {
		damage = 14,
		spread = 6,
		recoil = 5,
		spread_moving = 8,
		zoom = 3,
		concealment = 2,
		suppression = 2,
		alert_size = 8,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 9
	}
	self.m249 = {}
	self.m249.category = "lmg"
	self.m249.damage_melee = damage_melee_default
	self.m249.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.m249.sounds = {}
	self.m249.sounds.fire = "m249_fire_single"
	self.m249.sounds.fire_single = "m249_fire_single"
	self.m249.sounds.fire_auto = "m249_fire"
	self.m249.sounds.stop_fire = "m249_stop"
	self.m249.sounds.dryfire = "primary_dryfire"
	self.m249.sounds.enter_steelsight = "lmg_steelsight_enter"
	self.m249.sounds.leave_steelsight = "lmg_steelsight_exit"
	self.m249.timers = {}
	self.m249.timers.reload_not_empty = 5.62
	self.m249.timers.reload_empty = 5.62
	self.m249.timers.unequip = 0.9
	self.m249.timers.equip = 0.9
	self.m249.name_id = "bm_w_m249"
	self.m249.desc_id = "bm_w_m249_desc"
	self.m249.description_id = "des_m249"
	self.m249.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
	self.m249.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
	self.m249.use_data = {}
	self.m249.use_data.selection_index = 2
	self.m249.DAMAGE = 1
	self.m249.CLIP_AMMO_MAX = 200
	self.m249.NR_CLIPS_MAX = 2
	self.m249.AMMO_MAX = self.m249.CLIP_AMMO_MAX * self.m249.NR_CLIPS_MAX
	self.m249.AMMO_PICKUP = self:_pickup_chance(90, 1.5)
	self.m249.FIRE_MODE = "auto"
	self.m249.fire_mode_data = {}
	self.m249.fire_mode_data.fire_rate = 0.066
	self.m249.CAN_TOGGLE_FIREMODE = false
	self.m249.auto = {}
	self.m249.auto.fire_rate = 0.076
	self.m249.spread = {}
	self.m249.spread.standing = 4.3
	self.m249.spread.crouching = 4
	self.m249.spread.steelsight = 1.8
	self.m249.spread.moving_standing = 4.5
	self.m249.spread.moving_crouching = 4
	self.m249.spread.moving_steelsight = 2.5
	self.m249.kick = {}
	self.m249.kick.standing = {
		-0.2,
		0.8,
		-1,
		1.4
	}
	self.m249.kick.crouching = self.m249.kick.standing
	self.m249.kick.steelsight = self.m249.kick.standing
	self.m249.crosshair = {}
	self.m249.crosshair.standing = {}
	self.m249.crosshair.crouching = {}
	self.m249.crosshair.steelsight = {}
	self.m249.crosshair.standing.offset = 0.16
	self.m249.crosshair.standing.moving_offset = 1
	self.m249.crosshair.standing.kick_offset = 0.8
	self.m249.crosshair.crouching.offset = 0.1
	self.m249.crosshair.crouching.moving_offset = 0.6
	self.m249.crosshair.crouching.kick_offset = 0.4
	self.m249.crosshair.steelsight.hidden = true
	self.m249.crosshair.steelsight.offset = 0
	self.m249.crosshair.steelsight.moving_offset = 0
	self.m249.crosshair.steelsight.kick_offset = 0.14
	self.m249.shake = {}
	self.m249.shake.fire_multiplier = 0.5
	self.m249.shake.fire_steelsight_multiplier = -0.5
	self.m249.autohit = autohit_lmg_default
	self.m249.aim_assist = aim_assist_lmg_default
	self.m249.weapon_hold = "m249"
	self.m249.animations = {}
	self.m249.animations.equip_id = "equip_m249"
	self.m249.animations.recoil_steelsight = true
	self.m249.global_value = "gage_pack_lmg"
	self.m249.texture_bundle_folder = "gage_pack_lmg"
	self.m249.stats = {
		damage = 12,
		spread = 4,
		recoil = 7,
		spread_moving = 9,
		zoom = 1,
		concealment = 2,
		suppression = 4,
		alert_size = 8,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 9
	}
	self.rpk = {}
	self.rpk.category = "lmg"
	self.rpk.damage_melee = damage_melee_default
	self.rpk.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.rpk.sounds = {}
	self.rpk.sounds.fire = "rpk_fire_single"
	self.rpk.sounds.fire_single = "rpk_fire_single"
	self.rpk.sounds.fire_auto = "rpk_fire"
	self.rpk.sounds.stop_fire = "rpk_stop"
	self.rpk.sounds.dryfire = "primary_dryfire"
	self.rpk.sounds.enter_steelsight = "lmg_steelsight_enter"
	self.rpk.sounds.leave_steelsight = "lmg_steelsight_exit"
	self.rpk.timers = {}
	self.rpk.timers.reload_not_empty = 3.4
	self.rpk.timers.reload_empty = 4.56
	self.rpk.timers.unequip = 0.9
	self.rpk.timers.equip = 0.9
	self.rpk.name_id = "bm_w_rpk"
	self.rpk.desc_id = "bm_w_rpk_desc"
	self.rpk.description_id = "des_rpk"
	self.rpk.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
	self.rpk.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.rpk.use_data = {}
	self.rpk.use_data.selection_index = 2
	self.rpk.DAMAGE = 1
	self.rpk.CLIP_AMMO_MAX = 100
	self.rpk.NR_CLIPS_MAX = 3
	self.rpk.AMMO_MAX = self.rpk.CLIP_AMMO_MAX * self.rpk.NR_CLIPS_MAX
	self.rpk.AMMO_PICKUP = self:_pickup_chance(100, 1.5)
	self.rpk.FIRE_MODE = "auto"
	self.rpk.fire_mode_data = {}
	self.rpk.fire_mode_data.fire_rate = 0.08
	self.rpk.CAN_TOGGLE_FIREMODE = false
	self.rpk.auto = {}
	self.rpk.auto.fire_rate = 0.08
	self.rpk.spread = {}
	self.rpk.spread.standing = 3.3
	self.rpk.spread.crouching = 3
	self.rpk.spread.steelsight = 1.8
	self.rpk.spread.moving_standing = 3.5
	self.rpk.spread.moving_crouching = 3
	self.rpk.spread.moving_steelsight = 2.5
	self.rpk.kick = {}
	self.rpk.kick.standing = {
		-0.2,
		0.8,
		-1,
		1.4
	}
	self.rpk.kick.crouching = self.rpk.kick.standing
	self.rpk.kick.steelsight = self.rpk.kick.standing
	self.rpk.crosshair = {}
	self.rpk.crosshair.standing = {}
	self.rpk.crosshair.crouching = {}
	self.rpk.crosshair.steelsight = {}
	self.rpk.crosshair.standing.offset = 0.17
	self.rpk.crosshair.standing.moving_offset = 0.9
	self.rpk.crosshair.standing.kick_offset = 0.7
	self.rpk.crosshair.crouching.offset = 0.9
	self.rpk.crosshair.crouching.moving_offset = 0.8
	self.rpk.crosshair.crouching.kick_offset = 0.5
	self.rpk.crosshair.steelsight.hidden = true
	self.rpk.crosshair.steelsight.offset = 0
	self.rpk.crosshair.steelsight.moving_offset = 0
	self.rpk.crosshair.steelsight.kick_offset = 0.11
	self.rpk.shake = {}
	self.rpk.shake.fire_multiplier = 1
	self.rpk.shake.fire_steelsight_multiplier = -1
	self.rpk.autohit = autohit_lmg_default
	self.rpk.aim_assist = aim_assist_lmg_default
	self.rpk.weapon_hold = "rpk"
	self.rpk.animations = {}
	self.rpk.animations.equip_id = "equip_rpk"
	self.rpk.animations.recoil_steelsight = true
	self.rpk.global_value = "gage_pack_lmg"
	self.rpk.texture_bundle_folder = "gage_pack_lmg"
	self.rpk.stats = {
		damage = 13,
		spread = 5,
		recoil = 6,
		spread_moving = 6,
		zoom = 2,
		concealment = 5,
		suppression = 8,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 9
	}
	self.m95 = {}
	self.m95.category = "snp"
	self.m95.upgrade_blocks = {
		weapon = {
			"clip_ammo_increase"
		}
	}
	self.m95.damage_melee = damage_melee_default
	self.m95.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.m95.sounds = {}
	self.m95.sounds.fire = "barrett_fire"
	self.m95.sounds.dryfire = "primary_dryfire"
	self.m95.sounds.enter_steelsight = "primary_steel_sight_enter"
	self.m95.sounds.leave_steelsight = "primary_steel_sight_exit"
	self.m95.timers = {}
	self.m95.timers.reload_not_empty = 3.96
	self.m95.timers.reload_empty = 5.23
	self.m95.timers.unequip = 0.9
	self.m95.timers.equip = 0.9
	self.m95.name_id = "bm_w_m95"
	self.m95.desc_id = "bm_w_m95_desc"
	self.m95.description_id = "des_m95"
	self.m95.muzzleflash = "effects/payday2/particles/weapons/50cal_auto_fps"
	self.m95.shell_ejection = "effects/payday2/particles/weapons/shells/shell_sniper_m95"
	self.m95.use_data = {}
	self.m95.use_data.selection_index = 2
	self.m95.DAMAGE = 1
	self.m95.CLIP_AMMO_MAX = 5
	self.m95.NR_CLIPS_MAX = 3
	self.m95.AMMO_MAX = self.m95.CLIP_AMMO_MAX * self.m95.NR_CLIPS_MAX
	self.m95.AMMO_PICKUP = {0.05, 0.65}
	self.m95.FIRE_MODE = "single"
	self.m95.fire_mode_data = {}
	self.m95.fire_mode_data.fire_rate = 1.5
	self.m95.CAN_TOGGLE_FIREMODE = false
	self.m95.single = {}
	self.m95.single.fire_rate = 20
	self.m95.spread = {}
	self.m95.spread.standing = 20
	self.m95.spread.crouching = 20
	self.m95.spread.steelsight = 0
	self.m95.spread.moving_standing = 20
	self.m95.spread.moving_crouching = 20
	self.m95.spread.moving_steelsight = 0.2
	self.m95.kick = {}
	self.m95.kick.standing = {
		3,
		3.8,
		-0.5,
		0.5
	}
	self.m95.kick.crouching = self.m95.kick.standing
	self.m95.kick.steelsight = self.m95.kick.standing
	self.m95.crosshair = {}
	self.m95.crosshair.standing = {}
	self.m95.crosshair.crouching = {}
	self.m95.crosshair.steelsight = {}
	self.m95.crosshair.standing.offset = 1.14
	self.m95.crosshair.standing.moving_offset = 1.8
	self.m95.crosshair.standing.kick_offset = 1.6
	self.m95.crosshair.crouching.offset = 1.1
	self.m95.crosshair.crouching.moving_offset = 1.6
	self.m95.crosshair.crouching.kick_offset = 1.4
	self.m95.crosshair.steelsight.hidden = true
	self.m95.crosshair.steelsight.offset = 1
	self.m95.crosshair.steelsight.moving_offset = 1
	self.m95.crosshair.steelsight.kick_offset = 1.14
	self.m95.shake = {}
	self.m95.shake.fire_multiplier = 3.8
	self.m95.shake.fire_steelsight_multiplier = -3.8
	self.m95.autohit = autohit_snp_default
	self.m95.aim_assist = aim_assist_snp_default
	self.m95.animations = {}
	self.m95.animations.equip_id = "equip_m95"
	self.m95.animations.recoil_steelsight = true
	self.m95.global_value = "gage_pack_snp"
	self.m95.texture_bundle_folder = "gage_pack_snp"
	self.m95.can_shoot_through_enemy = true
	self.m95.can_shoot_through_shield = true
	self.m95.can_shoot_through_wall = true
	self.m95.stats = {
		damage = 35,
		spread = 9,
		recoil = 1,
		spread_moving = 8,
		zoom = 1,
		concealment = 2,
		suppression = 2,
		alert_size = 9,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 9
	}
	self.m95.armor_piercing_chance = 1
	self.m95.stats_modifiers = {
		damage = 24,
		suppression = 5,
		spread = 0.5
	}
	self.msr = {}
	self.msr.category = "snp"
	self.msr.upgrade_blocks = {
		weapon = {
			"clip_ammo_increase"
		}
	}
	self.msr.damage_melee = damage_melee_default
	self.msr.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.msr.sounds = {}
	self.msr.sounds.fire = "msr_fire"
	self.msr.sounds.dryfire = "primary_dryfire"
	self.msr.sounds.enter_steelsight = "lmg_steelsight_enter"
	self.msr.sounds.leave_steelsight = "lmg_steelsight_exit"
	self.msr.timers = {}
	self.msr.timers.reload_not_empty = 3
	self.msr.timers.reload_empty = 3.7
	self.msr.timers.unequip = 0.9
	self.msr.timers.equip = 0.9
	self.msr.name_id = "bm_w_msr"
	self.msr.desc_id = "bm_w_msr_desc"
	self.msr.description_id = "des_msr"
	self.msr.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
	self.msr.shell_ejection = "effects/payday2/particles/weapons/shells/shell_sniper"
	self.msr.use_data = {}
	self.msr.use_data.selection_index = 2
	self.msr.use_data.align_place = "left_hand"
	self.msr.DAMAGE = 1
	self.msr.CLIP_AMMO_MAX = 10
	self.msr.NR_CLIPS_MAX = 5
	self.msr.AMMO_MAX = self.msr.CLIP_AMMO_MAX * self.msr.NR_CLIPS_MAX
	self.msr.AMMO_PICKUP = {1, 1}
	self.msr.FIRE_MODE = "single"
	self.msr.fire_mode_data = {}
	self.msr.fire_mode_data.fire_rate = 1
	self.msr.CAN_TOGGLE_FIREMODE = false
	self.msr.single = {}
	self.msr.single.fire_rate = 20
	self.msr.spread = {}
	self.msr.spread.standing = 20
	self.msr.spread.crouching = 20
	self.msr.spread.steelsight = 0
	self.msr.spread.moving_standing = 20
	self.msr.spread.moving_crouching = 20
	self.msr.spread.moving_steelsight = 0
	self.msr.kick = {}
	self.msr.kick.standing = {
		3,
		4.8,
		-0.3,
		0.3
	}
	self.msr.kick.crouching = self.msr.kick.standing
	self.msr.kick.steelsight = self.msr.kick.standing
	self.msr.crosshair = {}
	self.msr.crosshair.standing = {}
	self.msr.crosshair.crouching = {}
	self.msr.crosshair.steelsight = {}
	self.msr.crosshair.standing.offset = 1.14
	self.msr.crosshair.standing.moving_offset = 1.8
	self.msr.crosshair.standing.kick_offset = 1.6
	self.msr.crosshair.crouching.offset = 1.1
	self.msr.crosshair.crouching.moving_offset = 1.6
	self.msr.crosshair.crouching.kick_offset = 1.4
	self.msr.crosshair.steelsight.hidden = true
	self.msr.crosshair.steelsight.offset = 1
	self.msr.crosshair.steelsight.moving_offset = 1
	self.msr.crosshair.steelsight.kick_offset = 1.14
	self.msr.shake = {}
	self.msr.shake.fire_multiplier = 3.5
	self.msr.shake.fire_steelsight_multiplier = -3.5
	self.msr.autohit = autohit_snp_default
	self.msr.aim_assist = aim_assist_snp_default
	self.msr.weapon_hold = "msr"
	self.msr.animations = {}
	self.msr.animations.equip_id = "equip_msr"
	self.msr.animations.recoil_steelsight = true
	self.msr.global_value = "gage_pack_snp"
	self.msr.texture_bundle_folder = "gage_pack_snp"
	self.msr.can_shoot_through_enemy = true
	self.msr.can_shoot_through_shield = true
	self.msr.can_shoot_through_wall = true
	self.msr.stats = {
		damage = 21,
		spread = 9,
		recoil = 2,
		spread_moving = 8,
		zoom = 1,
		concealment = 5,
		suppression = 6,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 9
	}
	self.msr.armor_piercing_chance = 1
	self.msr.stats_modifiers = {
		damage = 2.6,
		suppression = 3,
		spread = 0.6
	}
	self.r93 = {}
	self.r93.category = "snp"
	self.r93.upgrade_blocks = {
		weapon = {
			"clip_ammo_increase"
		}
	}
	self.r93.damage_melee = damage_melee_default
	self.r93.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.r93.sounds = {}
	self.r93.sounds.fire = "blazer_fire"
	self.r93.sounds.dryfire = "primary_dryfire"
	self.r93.sounds.enter_steelsight = "lmg_steelsight_enter"
	self.r93.sounds.leave_steelsight = "lmg_steelsight_exit"
	self.r93.timers = {}
	self.r93.timers.reload_not_empty = 2.82
	self.r93.timers.reload_empty = 3.82
	self.r93.timers.unequip = 0.9
	self.r93.timers.equip = 0.9
	self.r93.name_id = "bm_w_r93"
	self.r93.desc_id = "bm_w_r93_desc"
	self.r93.description_id = "des_r93"
	self.r93.muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
	self.r93.shell_ejection = "effects/payday2/particles/weapons/shells/shell_sniper"
	self.r93.use_data = {}
	self.r93.use_data.selection_index = 2
	self.r93.use_data.align_place = "left_hand"
	self.r93.DAMAGE = 1
	self.r93.CLIP_AMMO_MAX = 6
	self.r93.NR_CLIPS_MAX = 5
	self.r93.AMMO_MAX = self.r93.CLIP_AMMO_MAX * self.r93.NR_CLIPS_MAX
	self.r93.AMMO_PICKUP = {0.7, 1}
	self.r93.FIRE_MODE = "single"
	self.r93.fire_mode_data = {}
	self.r93.fire_mode_data.fire_rate = 1.2
	self.r93.CAN_TOGGLE_FIREMODE = false
	self.r93.single = {}
	self.r93.single.fire_rate = 20
	self.r93.spread = {}
	self.r93.spread.standing = 20
	self.r93.spread.crouching = 20
	self.r93.spread.steelsight = 0
	self.r93.spread.moving_standing = 20
	self.r93.spread.moving_crouching = 20
	self.r93.spread.moving_steelsight = 1
	self.r93.kick = {}
	self.r93.kick.standing = {
		3,
		3.8,
		-0.1,
		0.1
	}
	self.r93.kick.crouching = self.r93.kick.standing
	self.r93.kick.steelsight = self.r93.kick.standing
	self.r93.crosshair = {}
	self.r93.crosshair.standing = {}
	self.r93.crosshair.crouching = {}
	self.r93.crosshair.steelsight = {}
	self.r93.crosshair.standing.offset = 1.14
	self.r93.crosshair.standing.moving_offset = 1.8
	self.r93.crosshair.standing.kick_offset = 1.6
	self.r93.crosshair.crouching.offset = 1.1
	self.r93.crosshair.crouching.moving_offset = 1.6
	self.r93.crosshair.crouching.kick_offset = 1.4
	self.r93.crosshair.steelsight.hidden = true
	self.r93.crosshair.steelsight.offset = 1
	self.r93.crosshair.steelsight.moving_offset = 1
	self.r93.crosshair.steelsight.kick_offset = 1.14
	self.r93.shake = {}
	self.r93.shake.fire_multiplier = 2.8
	self.r93.shake.fire_steelsight_multiplier = -2.8
	self.r93.autohit = autohit_snp_default
	self.r93.aim_assist = aim_assist_snp_default
	self.r93.weapon_hold = "r93"
	self.r93.animations = {}
	self.r93.animations.equip_id = "equip_r93"
	self.r93.animations.recoil_steelsight = true
	self.r93.global_value = "gage_pack_snp"
	self.r93.texture_bundle_folder = "gage_pack_snp"
	self.r93.can_shoot_through_enemy = true
	self.r93.can_shoot_through_shield = true
	self.r93.can_shoot_through_wall = true
	self.r93.stats = {
		damage = 21,
		spread = 9,
		recoil = 2,
		spread_moving = 8,
		zoom = 1,
		concealment = 5,
		suppression = 4,
		alert_size = 8,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 9
	}
	self.r93.armor_piercing_chance = 1
	self.r93.stats_modifiers = {
		damage = 5,
		suppression = 3,
		spread = 0.5
	}
	self.fal = {}
	self.fal.category = "assault_rifle"
	self.fal.damage_melee = damage_melee_default
	self.fal.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.fal.sounds = {}
	self.fal.sounds.fire = "fn_fal_fire_1p"
	self.fal.sounds.fire_single = "fn_fal_fire_1p_single"
	self.fal.sounds.fire_auto = "fn_fal_fire_1p"
	self.fal.sounds.stop_fire = "fn_fal_stop"
	self.fal.sounds.dryfire = "primary_dryfire"
	self.fal.sounds.enter_steelsight = "secondary_steel_sight_enter"
	self.fal.sounds.leave_steelsight = "secondary_steel_sight_exit"
	self.fal.timers = {}
	self.fal.timers.reload_not_empty = 2.2
	self.fal.timers.reload_empty = 3.28
	self.fal.timers.unequip = 0.9
	self.fal.timers.equip = 0.9
	self.fal.name_id = "bm_w_fal"
	self.fal.desc_id = "bm_w_fal_desc"
	self.fal.description_id = "des_fal"
	self.fal.muzzleflash = "effects/payday2/particles/weapons/762_auto_fps"
	self.fal.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.fal.use_data = {}
	self.fal.use_data.selection_index = 2
	self.fal.DAMAGE = 1
	self.fal.CLIP_AMMO_MAX = 20
	self.fal.NR_CLIPS_MAX = math.round(total_damage_secondary / 1.7 / self.fal.CLIP_AMMO_MAX)
	self.fal.AMMO_MAX = self.fal.CLIP_AMMO_MAX * self.fal.NR_CLIPS_MAX
	self.fal.AMMO_PICKUP = self:_pickup_chance(self.fal.AMMO_MAX, 2)
	self.fal.FIRE_MODE = "auto"
	self.fal.fire_mode_data = {}
	self.fal.fire_mode_data.fire_rate = 0.086
	self.fal.CAN_TOGGLE_FIREMODE = true
	self.fal.auto = {}
	self.fal.auto.fire_rate = 0.086
	self.fal.spread = {}
	self.fal.spread.standing = self.new_m4.spread.standing * 0.5
	self.fal.spread.crouching = self.new_m4.spread.standing * 0.6
	self.fal.spread.steelsight = self.new_m4.spread.steelsight
	self.fal.spread.moving_standing = self.new_m4.spread.standing * 0.6
	self.fal.spread.moving_crouching = self.new_m4.spread.standing * 0.7
	self.fal.spread.moving_steelsight = self.new_m4.spread.moving_steelsight
	self.fal.kick = {}
	self.fal.kick.standing = self.new_m4.kick.standing
	self.fal.kick.crouching = self.fal.kick.standing
	self.fal.kick.steelsight = self.fal.kick.standing
	self.fal.crosshair = {}
	self.fal.crosshair.standing = {}
	self.fal.crosshair.crouching = {}
	self.fal.crosshair.steelsight = {}
	self.fal.crosshair.standing.offset = 0.14
	self.fal.crosshair.standing.moving_offset = 0.8
	self.fal.crosshair.standing.kick_offset = 0.6
	self.fal.crosshair.crouching.offset = 0.1
	self.fal.crosshair.crouching.moving_offset = 0.6
	self.fal.crosshair.crouching.kick_offset = 0.4
	self.fal.crosshair.steelsight.hidden = true
	self.fal.crosshair.steelsight.offset = 0
	self.fal.crosshair.steelsight.moving_offset = 0
	self.fal.crosshair.steelsight.kick_offset = 0.14
	self.fal.shake = {}
	self.fal.shake.fire_multiplier = 1
	self.fal.shake.fire_steelsight_multiplier = -1
	self.fal.autohit = autohit_rifle_default
	self.fal.aim_assist = aim_assist_rifle_default
	self.fal.animations = {}
	self.fal.animations.equip_id = "equip_m4"
	self.fal.animations.recoil_steelsight = true
	self.fal.global_value = "big_bank"
	self.fal.texture_bundle_folder = "big_bank"
	self.fal.stats = {
		damage = 18,
		spread = 6,
		recoil = 5,
		spread_moving = 5,
		zoom = 3,
		concealment = 10,
		suppression = 8,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 4
	}
	self.benelli = {}
	self.benelli.category = "shotgun"
	self.benelli.damage_melee = damage_melee_default
	self.benelli.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.benelli.sounds = {}
	self.benelli.sounds.fire = "benelli_m4_fire"
	self.benelli.sounds.dryfire = "shotgun_dryfire"
	self.benelli.sounds.stop_fire = "shotgun_dryfire"
	self.benelli.sounds.enter_steelsight = "primary_steel_sight_enter"
	self.benelli.sounds.leave_steelsight = "primary_steel_sight_exit"
	self.benelli.timers = {}
	self.benelli.timers.unequip = 0.85
	self.benelli.timers.equip = 0.85
	self.benelli.name_id = "bm_w_benelli"
	self.benelli.desc_id = "bm_w_benelli_desc"
	self.benelli.description_id = "des_benelli"
	self.benelli.muzzleflash = "effects/payday2/particles/weapons/762_auto_fps"
	self.benelli.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug"
	self.benelli.use_data = {}
	self.benelli.use_data.selection_index = 2
	self.benelli.use_data.align_place = "right_hand"
	self.benelli.DAMAGE = 6
	self.benelli.damage_near = 700
	self.benelli.damage_far = 1800
	self.benelli.rays = 5
	self.benelli.CLIP_AMMO_MAX = 8
	self.benelli.NR_CLIPS_MAX = math.round(total_damage_primary / 4.4 / self.benelli.CLIP_AMMO_MAX)
	self.benelli.AMMO_MAX = self.benelli.CLIP_AMMO_MAX * self.benelli.NR_CLIPS_MAX
	self.benelli.AMMO_PICKUP = self:_pickup_chance(self.benelli.AMMO_MAX, 2)
	self.benelli.FIRE_MODE = "single"
	self.benelli.fire_mode_data = {}
	self.benelli.fire_mode_data.fire_rate = 0.14
	self.benelli.CAN_TOGGLE_FIREMODE = false
	self.benelli.single = {}
	self.benelli.single.fire_rate = 0.14
	self.benelli.spread = {}
	self.benelli.spread.standing = self.r870.spread.standing
	self.benelli.spread.crouching = self.r870.spread.crouching
	self.benelli.spread.steelsight = self.r870.spread.steelsight
	self.benelli.spread.moving_standing = self.r870.spread.moving_standing
	self.benelli.spread.moving_crouching = self.r870.spread.moving_crouching
	self.benelli.spread.moving_steelsight = self.r870.spread.moving_steelsight
	self.benelli.kick = {}
	self.benelli.kick.standing = self.r870.kick.standing
	self.benelli.kick.crouching = self.benelli.kick.standing
	self.benelli.kick.steelsight = self.r870.kick.steelsight
	self.benelli.crosshair = {}
	self.benelli.crosshair.standing = {}
	self.benelli.crosshair.crouching = {}
	self.benelli.crosshair.steelsight = {}
	self.benelli.crosshair.standing.offset = 0.7
	self.benelli.crosshair.standing.moving_offset = 0.7
	self.benelli.crosshair.standing.kick_offset = 0.8
	self.benelli.crosshair.crouching.offset = 0.65
	self.benelli.crosshair.crouching.moving_offset = 0.65
	self.benelli.crosshair.crouching.kick_offset = 0.75
	self.benelli.crosshair.steelsight.hidden = true
	self.benelli.crosshair.steelsight.offset = 0.65
	self.benelli.crosshair.steelsight.moving_offset = 0.65
	self.benelli.crosshair.steelsight.kick_offset = 0.25
	self.benelli.shake = {}
	self.benelli.shake.fire_multiplier = 2
	self.benelli.shake.fire_steelsight_multiplier = 1.25
	self.benelli.autohit = autohit_shotgun_default
	self.benelli.aim_assist = aim_assist_shotgun_default
	self.benelli.animations = {}
	self.benelli.animations.equip_id = "equip_r870_shotgun"
	self.benelli.animations.recoil_steelsight = true
	self.benelli.texture_bundle_folder = "gage_pack_shotgun"
	self.benelli.global_value = "gage_pack_shotgun"
	self.benelli.stats = {
		damage = 15,
		spread = 8,
		recoil = 5,
		spread_moving = 7,
		zoom = 3,
		concealment = 12,
		suppression = 6,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 1
	}
	self.striker = {}
	self.striker.category = "shotgun"
	self.striker.damage_melee = damage_melee_default
	self.striker.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.striker.sounds = {}
	self.striker.sounds.fire = "striker_fire"
	self.striker.sounds.dryfire = "shotgun_dryfire"
	self.striker.sounds.stop_fire = "shotgun_dryfire"
	self.striker.sounds.enter_steelsight = "primary_steel_sight_enter"
	self.striker.sounds.leave_steelsight = "primary_steel_sight_exit"
	self.striker.timers = {}
	self.striker.timers.shotgun_reload_enter = 0.53333336
	self.striker.timers.shotgun_reload_exit_empty = 0.4
	self.striker.timers.shotgun_reload_exit_not_empty = 0.4
	self.striker.timers.shotgun_reload_shell = 0.6
	self.striker.timers.shotgun_reload_first_shell_offset = 0.13333334
	self.striker.timers.unequip = 0.85
	self.striker.timers.equip = 0.85
	self.striker.name_id = "bm_w_striker"
	self.striker.desc_id = "bm_w_striker_desc"
	self.striker.description_id = "des_striker"
	self.striker.muzzleflash = "effects/payday2/particles/weapons/762_auto_fps"
	self.striker.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug"
	self.striker.use_data = {}
	self.striker.use_data.selection_index = 1
	self.striker.use_data.align_place = "left_hand"
	self.striker.DAMAGE = 6
	self.striker.damage_near = 700
	self.striker.damage_far = 1800
	self.striker.rays = 5
	self.striker.CLIP_AMMO_MAX = 12
	self.striker.NR_CLIPS_MAX = math.round(total_damage_primary / 6.5 / self.striker.CLIP_AMMO_MAX)
	self.striker.AMMO_MAX = self.striker.CLIP_AMMO_MAX * self.striker.NR_CLIPS_MAX
	self.striker.AMMO_PICKUP = self:_pickup_chance(self.striker.AMMO_MAX, 2)
	self.striker.FIRE_MODE = "single"
	self.striker.fire_mode_data = {}
	self.striker.fire_mode_data.fire_rate = 0.14
	self.striker.CAN_TOGGLE_FIREMODE = false
	self.striker.single = {}
	self.striker.single.fire_rate = 0.14
	self.striker.spread = {}
	self.striker.spread.standing = self.r870.spread.standing
	self.striker.spread.crouching = self.r870.spread.crouching
	self.striker.spread.steelsight = self.r870.spread.steelsight
	self.striker.spread.moving_standing = self.r870.spread.moving_standing
	self.striker.spread.moving_crouching = self.r870.spread.moving_crouching
	self.striker.spread.moving_steelsight = self.r870.spread.moving_steelsight
	self.striker.kick = {}
	self.striker.kick.standing = self.r870.kick.standing
	self.striker.kick.crouching = self.striker.kick.standing
	self.striker.kick.steelsight = self.r870.kick.steelsight
	self.striker.crosshair = {}
	self.striker.crosshair.standing = {}
	self.striker.crosshair.crouching = {}
	self.striker.crosshair.steelsight = {}
	self.striker.crosshair.standing.offset = 0.7
	self.striker.crosshair.standing.moving_offset = 0.7
	self.striker.crosshair.standing.kick_offset = 0.8
	self.striker.crosshair.crouching.offset = 0.65
	self.striker.crosshair.crouching.moving_offset = 0.65
	self.striker.crosshair.crouching.kick_offset = 0.75
	self.striker.crosshair.steelsight.hidden = true
	self.striker.crosshair.steelsight.offset = 0
	self.striker.crosshair.steelsight.moving_offset = 0
	self.striker.crosshair.steelsight.kick_offset = 0
	self.striker.shake = {}
	self.striker.shake.fire_multiplier = 2
	self.striker.shake.fire_steelsight_multiplier = 1.25
	self.striker.autohit = autohit_shotgun_default
	self.striker.aim_assist = aim_assist_shotgun_default
	self.striker.animations = {}
	self.striker.animations.equip_id = "equip_r870_shotgun"
	self.striker.animations.recoil_steelsight = true
	self.striker.animations.reload_shell_data = {align = "right"}
	self.striker.texture_bundle_folder = "gage_pack_shotgun"
	self.striker.global_value = "gage_pack_shotgun"
	self.striker.stats = {
		damage = 15,
		spread = 6,
		recoil = 4,
		spread_moving = 7,
		zoom = 3,
		concealment = 21,
		suppression = 5,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 1
	}
	self.ksg = {}
	self.ksg.category = "shotgun"
	self.ksg.damage_melee = damage_melee_default
	self.ksg.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.ksg.sounds = {}
	self.ksg.sounds.fire = "keltec_fire"
	self.ksg.sounds.dryfire = "shotgun_dryfire"
	self.ksg.sounds.enter_steelsight = "primary_steel_sight_enter"
	self.ksg.sounds.leave_steelsight = "primary_steel_sight_exit"
	self.ksg.timers = {}
	self.ksg.timers.unequip = 0.85
	self.ksg.timers.equip = 0.85
	self.ksg.name_id = "bm_w_ksg"
	self.ksg.desc_id = "bm_w_ksg_desc"
	self.ksg.description_id = "des_ksg"
	self.ksg.muzzleflash = "effects/payday2/particles/weapons/762_auto_fps"
	self.ksg.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug_semi"
	self.ksg.use_data = {}
	self.ksg.use_data.selection_index = 2
	self.ksg.use_data.align_place = "right_hand"
	self.ksg.DAMAGE = 6
	self.ksg.damage_near = 700
	self.ksg.damage_far = 1500
	self.ksg.rays = 5
	self.ksg.CLIP_AMMO_MAX = 14
	self.ksg.NR_CLIPS_MAX = math.round(total_damage_primary / 6.5 / self.ksg.CLIP_AMMO_MAX)
	self.ksg.AMMO_MAX = self.ksg.CLIP_AMMO_MAX * self.ksg.NR_CLIPS_MAX
	self.ksg.AMMO_PICKUP = self:_pickup_chance(self.ksg.AMMO_MAX, 2)
	self.ksg.FIRE_MODE = "single"
	self.ksg.fire_mode_data = {}
	self.ksg.fire_mode_data.fire_rate = 0.575
	self.ksg.single = {}
	self.ksg.single.fire_rate = 0.575
	self.ksg.spread = {}
	self.ksg.spread.standing = self.new_m4.spread.standing * 1
	self.ksg.spread.crouching = self.new_m4.spread.standing * 1
	self.ksg.spread.steelsight = self.new_m4.spread.standing * 0.8
	self.ksg.spread.moving_standing = self.new_m4.spread.standing * 1
	self.ksg.spread.moving_crouching = self.new_m4.spread.standing * 1
	self.ksg.spread.moving_steelsight = self.new_m4.spread.standing * 0.8
	self.ksg.kick = {}
	self.ksg.kick.standing = {
		1.9,
		2,
		-0.2,
		0.2
	}
	self.ksg.kick.crouching = self.ksg.kick.standing
	self.ksg.kick.steelsight = {
		1.5,
		1.7,
		-0.2,
		0.2
	}
	self.ksg.crosshair = {}
	self.ksg.crosshair.standing = {}
	self.ksg.crosshair.crouching = {}
	self.ksg.crosshair.steelsight = {}
	self.ksg.crosshair.standing.offset = 0.7
	self.ksg.crosshair.standing.moving_offset = 0.7
	self.ksg.crosshair.standing.kick_offset = 0.8
	self.ksg.crosshair.crouching.offset = 0.65
	self.ksg.crosshair.crouching.moving_offset = 0.65
	self.ksg.crosshair.crouching.kick_offset = 0.75
	self.ksg.crosshair.steelsight.hidden = true
	self.ksg.crosshair.steelsight.offset = 0
	self.ksg.crosshair.steelsight.moving_offset = 0
	self.ksg.crosshair.steelsight.kick_offset = 0
	self.ksg.shake = {}
	self.ksg.shake.fire_multiplier = 1
	self.ksg.shake.fire_steelsight_multiplier = -1
	self.ksg.autohit = autohit_shotgun_default
	self.ksg.aim_assist = aim_assist_shotgun_default
	self.ksg.weapon_hold = "ksg"
	self.ksg.animations = {}
	self.ksg.animations.equip_id = "equip_r870_shotgun"
	self.ksg.animations.recoil_steelsight = true
	self.ksg.texture_bundle_folder = "gage_pack_shotgun"
	self.ksg.global_value = "gage_pack_shotgun"
	self.ksg.stats = {
		damage = 23,
		spread = 6,
		recoil = 5,
		spread_moving = 7,
		zoom = 3,
		concealment = 22,
		suppression = 5,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 1
	}
	self.gre_m79 = {}
	self.gre_m79.category = "grenade_launcher"
	self.gre_m79.upgrade_blocks = {
		weapon = {
			"clip_ammo_increase"
		}
	}
	self.gre_m79.damage_melee = damage_melee_default
	self.gre_m79.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.gre_m79.sounds = {}
	self.gre_m79.sounds.fire = "gl40_fire"
	self.gre_m79.sounds.dryfire = "shotgun_dryfire"
	self.gre_m79.sounds.enter_steelsight = "secondary_steel_sight_enter"
	self.gre_m79.sounds.leave_steelsight = "secondary_steel_sight_exit"
	self.gre_m79.timers = {}
	self.gre_m79.timers.reload_not_empty = 3.1
	self.gre_m79.timers.reload_empty = self.gre_m79.timers.reload_not_empty
	self.gre_m79.timers.unequip = 0.85
	self.gre_m79.timers.equip = 0.85
	self.gre_m79.name_id = "bm_w_gre_m79"
	self.gre_m79.desc_id = "bm_w_gre_m79_desc"
	self.gre_m79.description_id = "des_gre_m79"
	self.gre_m79.muzzleflash = "effects/payday2/particles/weapons/762_auto_fps"
	self.gre_m79.shell_ejection = "effects/payday2/particles/weapons/shells/shell_empty"
	self.gre_m79.use_data = {}
	self.gre_m79.use_data.selection_index = 2
	self.gre_m79.use_data.align_place = "right_hand"
	self.gre_m79.DAMAGE = 6
	self.gre_m79.damage_near = 1000
	self.gre_m79.damage_far = 2000
	self.gre_m79.rays = 6
	self.gre_m79.CLIP_AMMO_MAX = 1
	self.gre_m79.NR_CLIPS_MAX = math.round(total_damage_primary / 50 / self.gre_m79.CLIP_AMMO_MAX)
	self.gre_m79.AMMO_MAX = self.gre_m79.CLIP_AMMO_MAX * self.gre_m79.NR_CLIPS_MAX
	self.gre_m79.AMMO_PICKUP = {0.05, 0.65}
	self.gre_m79.FIRE_MODE = "single"
	self.gre_m79.fire_mode_data = {}
	self.gre_m79.fire_mode_data.fire_rate = 2
	self.gre_m79.single = {}
	self.gre_m79.single.fire_rate = 2
	self.gre_m79.spread = {}
	self.gre_m79.spread.standing = self.r870.spread.standing
	self.gre_m79.spread.crouching = self.r870.spread.crouching
	self.gre_m79.spread.steelsight = self.r870.spread.steelsight
	self.gre_m79.spread.moving_standing = self.r870.spread.moving_standing
	self.gre_m79.spread.moving_crouching = self.r870.spread.moving_crouching
	self.gre_m79.spread.moving_steelsight = self.r870.spread.moving_steelsight
	self.gre_m79.kick = {}
	self.gre_m79.kick.standing = {
		2.9,
		3,
		-0.5,
		0.5
	}
	self.gre_m79.kick.crouching = self.gre_m79.kick.standing
	self.gre_m79.kick.steelsight = self.gre_m79.kick.standing
	self.gre_m79.crosshair = {}
	self.gre_m79.crosshair.standing = {}
	self.gre_m79.crosshair.crouching = {}
	self.gre_m79.crosshair.steelsight = {}
	self.gre_m79.crosshair.standing.offset = 0.16
	self.gre_m79.crosshair.standing.moving_offset = 0.8
	self.gre_m79.crosshair.standing.kick_offset = 0.6
	self.gre_m79.crosshair.standing.hidden = true
	self.gre_m79.crosshair.crouching.offset = 0.08
	self.gre_m79.crosshair.crouching.moving_offset = 0.7
	self.gre_m79.crosshair.crouching.kick_offset = 0.4
	self.gre_m79.crosshair.crouching.hidden = true
	self.gre_m79.crosshair.steelsight.hidden = true
	self.gre_m79.crosshair.steelsight.offset = 0
	self.gre_m79.crosshair.steelsight.moving_offset = 0
	self.gre_m79.crosshair.steelsight.kick_offset = 0.1
	self.gre_m79.shake = {}
	self.gre_m79.shake.fire_multiplier = 2
	self.gre_m79.shake.fire_steelsight_multiplier = 2
	self.gre_m79.autohit = autohit_shotgun_default
	self.gre_m79.aim_assist = aim_assist_shotgun_default
	self.gre_m79.animations = {}
	self.gre_m79.animations.equip_id = "equip_gre_m79"
	self.gre_m79.animations.recoil_steelsight = true
	self.gre_m79.global_value = "gage_pack_assault"
	self.gre_m79.texture_bundle_folder = "gage_pack_assault"
	self.gre_m79.ignore_damage_upgrades = true
	self.gre_m79.stats = {
		damage = 31,
		spread = 7,
		recoil = 3,
		spread_moving = 6,
		zoom = 3,
		concealment = 18,
		suppression = 2,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 1
	}
	self.gre_m79.stats_modifiers = {damage = 3.4}
	self.g3 = {}
	self.g3.category = "assault_rifle"
	self.g3.damage_melee = damage_melee_default
	self.g3.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.g3.sounds = {}
	self.g3.sounds.fire = "g3_fire_single"
	self.g3.sounds.fire_single = "g3_fire_single"
	self.g3.sounds.fire_auto = "g3_fire"
	self.g3.sounds.stop_fire = "g3_stop"
	self.g3.sounds.dryfire = "primary_dryfire"
	self.g3.sounds.enter_steelsight = "secondary_steel_sight_enter"
	self.g3.sounds.leave_steelsight = "secondary_steel_sight_exit"
	self.g3.timers = {}
	self.g3.timers.reload_not_empty = 2.6
	self.g3.timers.reload_empty = 4.2
	self.g3.timers.unequip = 0.9
	self.g3.timers.equip = 0.9
	self.g3.name_id = "bm_w_g3"
	self.g3.desc_id = "bm_w_g3_desc"
	self.g3.description_id = "des_g3"
	self.g3.muzzleflash = "effects/payday2/particles/weapons/762_auto_fps"
	self.g3.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.g3.use_data = {}
	self.g3.use_data.selection_index = 2
	self.g3.DAMAGE = 1
	self.g3.CLIP_AMMO_MAX = 20
	self.g3.NR_CLIPS_MAX = math.round(total_damage_primary / 4 / self.g3.CLIP_AMMO_MAX)
	self.g3.AMMO_MAX = self.g3.CLIP_AMMO_MAX * self.g3.NR_CLIPS_MAX
	self.g3.AMMO_PICKUP = self:_pickup_chance(self.g3.AMMO_MAX, 2)
	self.g3.FIRE_MODE = "auto"
	self.g3.fire_mode_data = {}
	self.g3.fire_mode_data.fire_rate = 0.092
	self.g3.CAN_TOGGLE_FIREMODE = true
	self.g3.auto = {}
	self.g3.auto.fire_rate = 0.092
	self.g3.spread = {}
	self.g3.spread.standing = self.new_m4.spread.standing * 0.5
	self.g3.spread.crouching = self.new_m4.spread.standing * 0.6
	self.g3.spread.steelsight = self.new_m4.spread.steelsight
	self.g3.spread.moving_standing = self.new_m4.spread.standing * 0.6
	self.g3.spread.moving_crouching = self.new_m4.spread.standing * 0.7
	self.g3.spread.moving_steelsight = self.new_m4.spread.moving_steelsight
	self.g3.kick = {}
	self.g3.kick.standing = self.new_m4.kick.standing
	self.g3.kick.crouching = self.g3.kick.standing
	self.g3.kick.steelsight = self.g3.kick.standing
	self.g3.crosshair = {}
	self.g3.crosshair.standing = {}
	self.g3.crosshair.crouching = {}
	self.g3.crosshair.steelsight = {}
	self.g3.crosshair.standing.offset = 0.14
	self.g3.crosshair.standing.moving_offset = 0.8
	self.g3.crosshair.standing.kick_offset = 0.6
	self.g3.crosshair.crouching.offset = 0.1
	self.g3.crosshair.crouching.moving_offset = 0.6
	self.g3.crosshair.crouching.kick_offset = 0.4
	self.g3.crosshair.steelsight.hidden = true
	self.g3.crosshair.steelsight.offset = 0
	self.g3.crosshair.steelsight.moving_offset = 0
	self.g3.crosshair.steelsight.kick_offset = 0.14
	self.g3.shake = {}
	self.g3.shake.fire_multiplier = 1
	self.g3.shake.fire_steelsight_multiplier = -1
	self.g3.autohit = autohit_rifle_default
	self.g3.aim_assist = aim_assist_rifle_default
	self.g3.animations = {}
	self.g3.animations.equip_id = "equip_m4"
	self.g3.animations.recoil_steelsight = true
	self.g3.global_value = "gage_pack_assault"
	self.g3.texture_bundle_folder = "gage_pack_assault"
	self.g3.stats = {
		damage = 18,
		spread = 8,
		recoil = 4,
		spread_moving = 7,
		zoom = 3,
		concealment = 12,
		suppression = 6,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 4
	}
	self.galil = {}
	self.galil.category = "assault_rifle"
	self.galil.damage_melee = damage_melee_default
	self.galil.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.galil.sounds = {}
	self.galil.sounds.fire = "galil_fire"
	self.galil.sounds.fire_single = "galil_fire_single"
	self.galil.sounds.fire_auto = "galil_fire"
	self.galil.sounds.stop_fire = "galil_stop"
	self.galil.sounds.dryfire = "primary_dryfire"
	self.galil.sounds.enter_steelsight = "secondary_steel_sight_enter"
	self.galil.sounds.leave_steelsight = "secondary_steel_sight_exit"
	self.galil.timers = {}
	self.galil.timers.reload_not_empty = 3
	self.galil.timers.reload_empty = 4.2
	self.galil.timers.unequip = 0.9
	self.galil.timers.equip = 0.9
	self.galil.name_id = "bm_w_galil"
	self.galil.desc_id = "bm_w_galil_desc"
	self.galil.description_id = "des_galil"
	self.galil.muzzleflash = "effects/payday2/particles/weapons/762_auto_fps"
	self.galil.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.galil.use_data = {}
	self.galil.use_data.selection_index = 2
	self.galil.DAMAGE = 1
	self.galil.CLIP_AMMO_MAX = 30
	self.galil.NR_CLIPS_MAX = math.round(total_damage_primary / 2.5 / self.galil.CLIP_AMMO_MAX)
	self.galil.AMMO_MAX = self.galil.CLIP_AMMO_MAX * self.galil.NR_CLIPS_MAX
	self.galil.AMMO_PICKUP = self:_pickup_chance(self.galil.AMMO_MAX, 2)
	self.galil.FIRE_MODE = "auto"
	self.galil.fire_mode_data = {}
	self.galil.fire_mode_data.fire_rate = 0.071
	self.galil.CAN_TOGGLE_FIREMODE = true
	self.galil.auto = {}
	self.galil.auto.fire_rate = 0.071
	self.galil.spread = {}
	self.galil.spread.standing = self.new_m4.spread.standing * 0.5
	self.galil.spread.crouching = self.new_m4.spread.standing * 0.6
	self.galil.spread.steelsight = self.new_m4.spread.steelsight
	self.galil.spread.moving_standing = self.new_m4.spread.standing * 0.6
	self.galil.spread.moving_crouching = self.new_m4.spread.standing * 0.7
	self.galil.spread.moving_steelsight = self.new_m4.spread.moving_steelsight
	self.galil.kick = {}
	self.galil.kick.standing = self.new_m4.kick.standing
	self.galil.kick.crouching = self.galil.kick.standing
	self.galil.kick.steelsight = self.galil.kick.standing
	self.galil.crosshair = {}
	self.galil.crosshair.standing = {}
	self.galil.crosshair.crouching = {}
	self.galil.crosshair.steelsight = {}
	self.galil.crosshair.standing.offset = 0.14
	self.galil.crosshair.standing.moving_offset = 0.8
	self.galil.crosshair.standing.kick_offset = 0.6
	self.galil.crosshair.crouching.offset = 0.1
	self.galil.crosshair.crouching.moving_offset = 0.6
	self.galil.crosshair.crouching.kick_offset = 0.4
	self.galil.crosshair.steelsight.hidden = true
	self.galil.crosshair.steelsight.offset = 0
	self.galil.crosshair.steelsight.moving_offset = 0
	self.galil.crosshair.steelsight.kick_offset = 0.14
	self.galil.shake = {}
	self.galil.shake.fire_multiplier = 1
	self.galil.shake.fire_steelsight_multiplier = -1
	self.galil.autohit = autohit_rifle_default
	self.galil.aim_assist = aim_assist_rifle_default
	self.galil.weapon_hold = "ak47"
	self.galil.animations = {}
	self.galil.animations = {}
	self.galil.animations.equip_id = "equip_ak47"
	self.galil.animations.recoil_steelsight = true
	self.galil.global_value = "gage_pack_assault"
	self.galil.texture_bundle_folder = "gage_pack_assault"
	self.galil.stats = {
		damage = 14,
		spread = 7,
		recoil = 8,
		spread_moving = 5,
		zoom = 3,
		concealment = 15,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 4
	}
	self.famas = {}
	self.famas.category = "assault_rifle"
	self.famas.damage_melee = damage_melee_default
	self.famas.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.famas.sounds = {}
	self.famas.sounds.fire = "famas_fire_single"
	self.famas.sounds.fire_single = "famas_fire_single"
	self.famas.sounds.fire_auto = "famas_fire"
	self.famas.sounds.stop_fire = "famas_stop"
	self.famas.sounds.dryfire = "primary_dryfire"
	self.famas.sounds.enter_steelsight = "secondary_steel_sight_enter"
	self.famas.sounds.leave_steelsight = "secondary_steel_sight_exit"
	self.famas.timers = {}
	self.famas.timers.reload_not_empty = 2.72
	self.famas.timers.reload_empty = 3.78
	self.famas.timers.unequip = 0.9
	self.famas.timers.equip = 0.9
	self.famas.name_id = "bm_w_famas"
	self.famas.desc_id = "bm_w_famas_desc"
	self.famas.description_id = "des_famas"
	self.famas.muzzleflash = "effects/payday2/particles/weapons/762_auto_fps"
	self.famas.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.famas.use_data = {}
	self.famas.use_data.selection_index = 2
	self.famas.DAMAGE = 1
	self.famas.CLIP_AMMO_MAX = 30
	self.famas.NR_CLIPS_MAX = math.round(total_damage_primary / 2 / self.famas.CLIP_AMMO_MAX)
	self.famas.AMMO_MAX = self.famas.CLIP_AMMO_MAX * self.famas.NR_CLIPS_MAX
	self.famas.AMMO_PICKUP = self:_pickup_chance(self.famas.AMMO_MAX, 2)
	self.famas.FIRE_MODE = "auto"
	self.famas.fire_mode_data = {}
	self.famas.fire_mode_data.fire_rate = 0.06
	self.famas.CAN_TOGGLE_FIREMODE = true
	self.famas.auto = {}
	self.famas.auto.fire_rate = 0.06
	self.famas.spread = {}
	self.famas.spread.standing = self.new_m4.spread.standing * 0.5
	self.famas.spread.crouching = self.new_m4.spread.standing * 0.6
	self.famas.spread.steelsight = self.new_m4.spread.steelsight
	self.famas.spread.moving_standing = self.new_m4.spread.standing * 0.6
	self.famas.spread.moving_crouching = self.new_m4.spread.standing * 0.7
	self.famas.spread.moving_steelsight = self.new_m4.spread.moving_steelsight
	self.famas.kick = {}
	self.famas.kick.standing = self.new_m4.kick.standing
	self.famas.kick.crouching = self.famas.kick.standing
	self.famas.kick.steelsight = self.famas.kick.standing
	self.famas.crosshair = {}
	self.famas.crosshair.standing = {}
	self.famas.crosshair.crouching = {}
	self.famas.crosshair.steelsight = {}
	self.famas.crosshair.standing.offset = 0.14
	self.famas.crosshair.standing.moving_offset = 0.8
	self.famas.crosshair.standing.kick_offset = 0.6
	self.famas.crosshair.crouching.offset = 0.1
	self.famas.crosshair.crouching.moving_offset = 0.6
	self.famas.crosshair.crouching.kick_offset = 0.4
	self.famas.crosshair.steelsight.hidden = true
	self.famas.crosshair.steelsight.offset = 0
	self.famas.crosshair.steelsight.moving_offset = 0
	self.famas.crosshair.steelsight.kick_offset = 0.14
	self.famas.shake = {}
	self.famas.shake.fire_multiplier = 1
	self.famas.shake.fire_steelsight_multiplier = -1
	self.famas.autohit = autohit_rifle_default
	self.famas.aim_assist = aim_assist_rifle_default
	self.famas.animations = {}
	self.famas.animations.equip_id = "equip_m4"
	self.famas.animations.recoil_steelsight = true
	self.famas.global_value = "gage_pack_assault"
	self.famas.texture_bundle_folder = "gage_pack_assault"
	self.famas.stats = {
		damage = 11,
		spread = 8,
		recoil = 5,
		spread_moving = 4,
		zoom = 3,
		concealment = 24,
		suppression = 10,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 4
	}
	self.scorpion = {}
	self.scorpion.category = "smg"
	self.scorpion.damage_melee = damage_melee_default
	self.scorpion.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.scorpion.sounds = {}
	self.scorpion.sounds.fire = "skorpion_fire_single"
	self.scorpion.sounds.fire_single = "skorpion_fire_single"
	self.scorpion.sounds.fire_auto = "skorpion_fire"
	self.scorpion.sounds.stop_fire = "skorpion_stop"
	self.scorpion.sounds.dryfire = "secondary_dryfire"
	self.scorpion.sounds.enter_steelsight = "secondary_steel_sight_enter"
	self.scorpion.sounds.leave_steelsight = "secondary_steel_sight_exit"
	self.scorpion.timers = {}
	self.scorpion.timers.reload_not_empty = 2
	self.scorpion.timers.reload_empty = 2.75
	self.scorpion.timers.unequip = 0.75
	self.scorpion.timers.equip = 0.75
	self.scorpion.name_id = "bm_w_scorpion"
	self.scorpion.desc_id = "bm_w_scorpion_desc"
	self.scorpion.description_id = "des_scorpion"
	self.scorpion.muzzleflash = "effects/payday2/particles/weapons/9mm_auto_fps"
	self.scorpion.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence_fps"
	self.scorpion.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.scorpion.use_data = {}
	self.scorpion.use_data.selection_index = 1
	self.scorpion.DAMAGE = 1
	self.scorpion.CLIP_AMMO_MAX = 20
	self.scorpion.NR_CLIPS_MAX = math.round(total_damage_secondary / 1 / self.scorpion.CLIP_AMMO_MAX)
	self.scorpion.AMMO_MAX = self.scorpion.CLIP_AMMO_MAX * self.scorpion.NR_CLIPS_MAX
	self.scorpion.AMMO_PICKUP = self:_pickup_chance(180, 1)
	self.scorpion.FIRE_MODE = "auto"
	self.scorpion.fire_mode_data = {}
	self.scorpion.fire_mode_data.fire_rate = 0.06
	self.scorpion.CAN_TOGGLE_FIREMODE = true
	self.scorpion.auto = {}
	self.scorpion.auto.fire_rate = 0.06
	self.scorpion.spread = {}
	self.scorpion.spread.standing = self.new_m4.spread.standing * 0.8
	self.scorpion.spread.crouching = self.new_m4.spread.standing * 0.8
	self.scorpion.spread.steelsight = self.new_m4.spread.steelsight
	self.scorpion.spread.moving_standing = self.new_m4.spread.standing * 0.8
	self.scorpion.spread.moving_crouching = self.new_m4.spread.standing * 0.8
	self.scorpion.spread.moving_steelsight = self.new_m4.spread.moving_steelsight
	self.scorpion.kick = {}
	self.scorpion.kick.standing = self.new_m4.kick.standing
	self.scorpion.kick.crouching = self.scorpion.kick.standing
	self.scorpion.kick.steelsight = self.scorpion.kick.standing
	self.scorpion.crosshair = {}
	self.scorpion.crosshair.standing = {}
	self.scorpion.crosshair.crouching = {}
	self.scorpion.crosshair.steelsight = {}
	self.scorpion.crosshair.standing.offset = 0.5
	self.scorpion.crosshair.standing.moving_offset = 0.8
	self.scorpion.crosshair.standing.kick_offset = 0.7
	self.scorpion.crosshair.crouching.offset = 0.3
	self.scorpion.crosshair.crouching.moving_offset = 0.6
	self.scorpion.crosshair.crouching.kick_offset = 0.5
	self.scorpion.crosshair.steelsight.hidden = true
	self.scorpion.crosshair.steelsight.offset = 0
	self.scorpion.crosshair.steelsight.moving_offset = 0
	self.scorpion.crosshair.steelsight.kick_offset = 0.3
	self.scorpion.shake = {}
	self.scorpion.shake.fire_multiplier = 1
	self.scorpion.shake.fire_steelsight_multiplier = -1
	self.scorpion.autohit = autohit_smg_default
	self.scorpion.aim_assist = aim_assist_smg_default
	self.scorpion.weapon_hold = "scorpion"
	self.scorpion.animations = {}
	self.scorpion.animations.equip_id = "equip_scorpion"
	self.scorpion.animations.recoil_steelsight = true
	self.scorpion.global_value = "hl_miami"
	self.scorpion.texture_bundle_folder = "hl_miami"
	self.scorpion.stats = {
		damage = 8,
		spread = 6,
		recoil = 7,
		spread_moving = 7,
		zoom = 1,
		concealment = 29,
		suppression = 17,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 7
	}
	self.tec9 = {}
	self.tec9.category = "smg"
	self.tec9.damage_melee = damage_melee_default
	self.tec9.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.tec9.sounds = {}
	self.tec9.sounds.fire = "tec9_fire_single"
	self.tec9.sounds.fire_single = "tec9_fire_single"
	self.tec9.sounds.fire_auto = "tec9_fire"
	self.tec9.sounds.stop_fire = "tec9_stop"
	self.tec9.sounds.dryfire = "secondary_dryfire"
	self.tec9.sounds.enter_steelsight = "secondary_steel_sight_enter"
	self.tec9.sounds.leave_steelsight = "secondary_steel_sight_exit"
	self.tec9.timers = {}
	self.tec9.timers.reload_not_empty = 2.56
	self.tec9.timers.reload_empty = 2.95
	self.tec9.timers.unequip = 0.75
	self.tec9.timers.equip = 0.75
	self.tec9.name_id = "bm_w_tec9"
	self.tec9.desc_id = "bm_w_tec9_desc"
	self.tec9.description_id = "des_tec9"
	self.tec9.muzzleflash = "effects/payday2/particles/weapons/9mm_auto_fps"
	self.tec9.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence_fps"
	self.tec9.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.tec9.use_data = {}
	self.tec9.use_data.selection_index = 1
	self.tec9.DAMAGE = 1
	self.tec9.CLIP_AMMO_MAX = 20
	self.tec9.NR_CLIPS_MAX = math.round(total_damage_secondary / 1.3 / self.tec9.CLIP_AMMO_MAX)
	self.tec9.AMMO_MAX = self.tec9.CLIP_AMMO_MAX * self.tec9.NR_CLIPS_MAX
	self.tec9.AMMO_PICKUP = self:_pickup_chance(160, 1)
	self.tec9.FIRE_MODE = "auto"
	self.tec9.fire_mode_data = {}
	self.tec9.fire_mode_data.fire_rate = 0.067
	self.tec9.CAN_TOGGLE_FIREMODE = true
	self.tec9.auto = {}
	self.tec9.auto.fire_rate = 0.067
	self.tec9.spread = {}
	self.tec9.spread.standing = self.new_m4.spread.standing * 0.8
	self.tec9.spread.crouching = self.new_m4.spread.standing * 0.8
	self.tec9.spread.steelsight = self.new_m4.spread.steelsight
	self.tec9.spread.moving_standing = self.new_m4.spread.standing * 0.8
	self.tec9.spread.moving_crouching = self.new_m4.spread.standing * 0.8
	self.tec9.spread.moving_steelsight = self.new_m4.spread.moving_steelsight
	self.tec9.kick = {}
	self.tec9.kick.standing = self.new_m4.kick.standing
	self.tec9.kick.crouching = self.tec9.kick.standing
	self.tec9.kick.steelsight = self.tec9.kick.standing
	self.tec9.crosshair = {}
	self.tec9.crosshair.standing = {}
	self.tec9.crosshair.crouching = {}
	self.tec9.crosshair.steelsight = {}
	self.tec9.crosshair.standing.offset = 0.5
	self.tec9.crosshair.standing.moving_offset = 0.8
	self.tec9.crosshair.standing.kick_offset = 0.7
	self.tec9.crosshair.crouching.offset = 0.3
	self.tec9.crosshair.crouching.moving_offset = 0.6
	self.tec9.crosshair.crouching.kick_offset = 0.5
	self.tec9.crosshair.steelsight.hidden = true
	self.tec9.crosshair.steelsight.offset = 0
	self.tec9.crosshair.steelsight.moving_offset = 0
	self.tec9.crosshair.steelsight.kick_offset = 0.3
	self.tec9.shake = {}
	self.tec9.shake.fire_multiplier = 1
	self.tec9.shake.fire_steelsight_multiplier = -1
	self.tec9.autohit = autohit_smg_default
	self.tec9.aim_assist = aim_assist_smg_default
	self.tec9.weapon_hold = "tec9"
	self.tec9.animations = {}
	self.tec9.animations.equip_id = "equip_tec9"
	self.tec9.animations.recoil_steelsight = true
	self.tec9.global_value = "hl_miami"
	self.tec9.texture_bundle_folder = "hl_miami"
	self.tec9.stats = {
		damage = 11,
		spread = 7,
		recoil = 7,
		spread_moving = 10,
		zoom = 1,
		concealment = 27,
		suppression = 12,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 7
	}
	self.uzi = {}
	self.uzi.category = "smg"
	self.uzi.damage_melee = damage_melee_default
	self.uzi.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.uzi.sounds = {}
	self.uzi.sounds.fire = "uzi_fire_single"
	self.uzi.sounds.fire_single = "uzi_fire_single"
	self.uzi.sounds.fire_auto = "uzi_fire"
	self.uzi.sounds.stop_fire = "uzi_stop"
	self.uzi.sounds.dryfire = "secondary_dryfire"
	self.uzi.sounds.enter_steelsight = "secondary_steel_sight_enter"
	self.uzi.sounds.leave_steelsight = "secondary_steel_sight_exit"
	self.uzi.timers = {}
	self.uzi.timers.reload_not_empty = 2.45
	self.uzi.timers.reload_empty = 3.52
	self.uzi.timers.unequip = 0.75
	self.uzi.timers.equip = 0.75
	self.uzi.name_id = "bm_w_uzi"
	self.uzi.desc_id = "bm_w_uzi_desc"
	self.uzi.description_id = "des_uzi"
	self.uzi.muzzleflash = "effects/payday2/particles/weapons/9mm_auto_fps"
	self.uzi.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence_fps"
	self.uzi.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.uzi.use_data = {}
	self.uzi.use_data.selection_index = 1
	self.uzi.DAMAGE = 1
	self.uzi.CLIP_AMMO_MAX = 30
	self.uzi.NR_CLIPS_MAX = math.round(total_damage_secondary / 2 / self.uzi.CLIP_AMMO_MAX)
	self.uzi.AMMO_MAX = self.uzi.CLIP_AMMO_MAX * self.uzi.NR_CLIPS_MAX
	self.uzi.AMMO_PICKUP = self:_pickup_chance(100, 1)
	self.uzi.FIRE_MODE = "auto"
	self.uzi.fire_mode_data = {}
	self.uzi.fire_mode_data.fire_rate = 0.086
	self.uzi.CAN_TOGGLE_FIREMODE = true
	self.uzi.auto = {}
	self.uzi.auto.fire_rate = 0.086
	self.uzi.spread = {}
	self.uzi.spread.standing = self.new_m4.spread.standing * 0.8
	self.uzi.spread.crouching = self.new_m4.spread.standing * 0.8
	self.uzi.spread.steelsight = self.new_m4.spread.steelsight
	self.uzi.spread.moving_standing = self.new_m4.spread.standing * 0.8
	self.uzi.spread.moving_crouching = self.new_m4.spread.standing * 0.8
	self.uzi.spread.moving_steelsight = self.new_m4.spread.moving_steelsight
	self.uzi.kick = {}
	self.uzi.kick.standing = self.new_m4.kick.standing
	self.uzi.kick.crouching = self.uzi.kick.standing
	self.uzi.kick.steelsight = self.uzi.kick.standing
	self.uzi.crosshair = {}
	self.uzi.crosshair.standing = {}
	self.uzi.crosshair.crouching = {}
	self.uzi.crosshair.steelsight = {}
	self.uzi.crosshair.standing.offset = 0.5
	self.uzi.crosshair.standing.moving_offset = 0.8
	self.uzi.crosshair.standing.kick_offset = 0.7
	self.uzi.crosshair.crouching.offset = 0.3
	self.uzi.crosshair.crouching.moving_offset = 0.6
	self.uzi.crosshair.crouching.kick_offset = 0.5
	self.uzi.crosshair.steelsight.hidden = true
	self.uzi.crosshair.steelsight.offset = 0
	self.uzi.crosshair.steelsight.moving_offset = 0
	self.uzi.crosshair.steelsight.kick_offset = 0.3
	self.uzi.shake = {}
	self.uzi.shake.fire_multiplier = 1
	self.uzi.shake.fire_steelsight_multiplier = -1
	self.uzi.autohit = autohit_smg_default
	self.uzi.aim_assist = aim_assist_smg_default
	self.uzi.weapon_hold = "mp9"
	self.uzi.animations = {}
	self.uzi.animations.equip_id = "equip_mp9"
	self.uzi.animations.recoil_steelsight = true
	self.uzi.global_value = "hl_miami"
	self.uzi.texture_bundle_folder = "hl_miami"
	self.uzi.stats = {
		damage = 12,
		spread = 8,
		recoil = 10,
		spread_moving = 8,
		zoom = 1,
		concealment = 24,
		suppression = 12,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 7
	}
end

function WeaponTweakData_37:_create_table_structure_wip()
end

function WeaponTweakData_37:_create_table_structure()
	self.c45_npc = {
		usage = "c45",
		sounds = {},
		use_data = {}
	}
	self.colt_1911_primary_npc = deep_clone(self.c45_npc)
	self.beretta92_npc = {
		usage = "beretta92",
		sounds = {},
		use_data = {}
	}
	self.beretta92_primary_npc = deep_clone(self.beretta92_npc)
	self.raging_bull_npc = {
		usage = "raging_bull",
		sounds = {},
		use_data = {}
	}
	self.raging_bull_primary_npc = deep_clone(self.raging_bull_npc)
	self.m4_npc = {
		usage = "m4",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.m4_secondary_npc = deep_clone(self.m4_npc)
	self.m14_npc = {
		usage = "m4",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.m14_sniper_npc = {
		usage = "m4",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.r870_npc = {
		usage = "r870",
		sounds = {},
		use_data = {}
	}
	self.benelli_npc = {
		usage = "r870",
		sounds = {},
		use_data = {}
	}
	self.mossberg_npc = {
		usage = "mossberg",
		sounds = {},
		use_data = {}
	}
	self.mp5_npc = {
		usage = "mp5",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.mac11_npc = {
		usage = "mp5",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.m79_npc = {
		usage = "m4",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.glock_18_npc = {
		usage = "glock18",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.glock_18c_primary_npc = deep_clone(self.glock_18_npc)
	self.ak47_npc = {
		usage = "ak47",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.g36_npc = {
		usage = "m4",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.g17_npc = {
		usage = "c45",
		sounds = {},
		use_data = {}
	}
	self.mp9_npc = {
		usage = "mp5",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.olympic_npc = {
		usage = "mp5",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.olympic_primary_npc = deep_clone(self.olympic_npc)
	self.m16_npc = {
		usage = "m4",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.aug_npc = {
		usage = "m4",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.aug_secondary_npc = deep_clone(self.aug_npc)
	self.ak74_npc = {
		usage = "ak47",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.ak74_secondary_npc = deep_clone(self.ak74_npc)
	self.ak5_npc = {
		usage = "m4",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.p90_npc = {
		usage = "mp5",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.amcar_npc = {
		usage = "m4",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.mac10_npc = {
		usage = "mp5",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.akmsu_npc = {
		usage = "m4",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.akmsu_primary_npc = deep_clone(self.akmsu_npc)
	self.akm_npc = {
		usage = "m4",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.akm_gold_npc = {
		usage = "m4",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.deagle_npc = {
		usage = "raging_bull",
		sounds = {},
		use_data = {}
	}
	self.deagle_primary_npc = deep_clone(self.deagle_npc)
	self.serbu_npc = {
		usage = "r870",
		sounds = {},
		use_data = {}
	}
	self.saiga_npc = {
		usage = "saiga",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.huntsman_npc = {
		usage = "r870",
		sounds = {},
		use_data = {}
	}
	self.saw_npc = {
		usage = "mp5",
		sounds = {},
		use_data = {}
	}
	self.sentry_gun = {
		sounds = {},
		auto = {}
	}
	self.usp_npc = {
		usage = "c45",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.g22c_npc = {
		usage = "c45",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.judge_npc = {
		usage = "c45",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.m45_npc = {
		usage = "mp5",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.s552_npc = {
		usage = "m4",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.s552_secondary_npc = deep_clone(self.s552_npc)
	self.ppk_npc = {
		usage = "c45",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.mp7_npc = {
		usage = "c45",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.scar_npc = {
		usage = "m4",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.p226_npc = {
		usage = "c45",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.hk21_npc = {
		usage = "ak47",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.m249_npc = {
		usage = "ak47",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.rpk_npc = {
		usage = "ak47",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.m95_npc = {
		usage = "ak47",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.msr_npc = {
		usage = "ak47",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.r93_npc = {
		usage = "ak47",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.fal_npc = {
		usage = "ak47",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.ben_npc = {
		usage = "r870",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.striker_npc = {
		usage = "ak47",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.ksg_npc = {
		usage = "ak47",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.gre_m79_npc = {
		usage = "r870",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.g3_npc = {
		usage = "ak47",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.galil_npc = {
		usage = "ak47",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.famas_npc = {
		usage = "ak47",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.scorpion_npc = {
		usage = "c45",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.tec9_npc = {
		usage = "c45",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.uzi_npc = {
		usage = "c45",
		sounds = {},
		use_data = {},
		auto = {}
	}
end

function WeaponTweakData_37:_precalculate_values_wip()
end

function WeaponTweakData_37:_precalculate_values()
	self.m4_npc.AMMO_MAX = self.m4_npc.CLIP_AMMO_MAX * self.m4_npc.NR_CLIPS_MAX
	self.m14_npc.AMMO_MAX = self.m14_npc.CLIP_AMMO_MAX * self.m14_npc.NR_CLIPS_MAX
	self.m14_sniper_npc.AMMO_MAX = self.m14_sniper_npc.CLIP_AMMO_MAX * self.m14_sniper_npc.NR_CLIPS_MAX
	self.c45_npc.AMMO_MAX = self.c45_npc.CLIP_AMMO_MAX * self.c45_npc.NR_CLIPS_MAX
	self.beretta92_npc.AMMO_MAX = self.beretta92_npc.CLIP_AMMO_MAX * self.beretta92_npc.NR_CLIPS_MAX
	self.raging_bull_npc.AMMO_MAX = self.raging_bull_npc.CLIP_AMMO_MAX * self.raging_bull_npc.NR_CLIPS_MAX
	self.r870_npc.AMMO_MAX = self.r870_npc.CLIP_AMMO_MAX * self.r870_npc.NR_CLIPS_MAX
	self.benelli_npc.AMMO_MAX = self.benelli_npc.CLIP_AMMO_MAX * self.benelli_npc.NR_CLIPS_MAX
	self.mossberg_npc.AMMO_MAX = self.mossberg_npc.CLIP_AMMO_MAX * self.mossberg_npc.NR_CLIPS_MAX
	self.mp5_npc.AMMO_MAX = self.mp5_npc.CLIP_AMMO_MAX * self.mp5_npc.NR_CLIPS_MAX
	self.mp5_tactical_npc.AMMO_MAX = self.mp5_tactical_npc.CLIP_AMMO_MAX * self.mp5_tactical_npc.NR_CLIPS_MAX
	self.ump_npc.AMMO_MAX = self.ump_npc.CLIP_AMMO_MAX * self.ump_npc.NR_CLIPS_MAX
	self.mac11_npc.AMMO_MAX = self.mac11_npc.CLIP_AMMO_MAX * self.mac11_npc.NR_CLIPS_MAX
	self.glock_18_npc.AMMO_MAX = self.glock_18_npc.CLIP_AMMO_MAX * self.glock_18_npc.NR_CLIPS_MAX
	self.ak47_npc.AMMO_MAX = self.ak47_npc.CLIP_AMMO_MAX * self.ak47_npc.NR_CLIPS_MAX
	self.g36_npc.AMMO_MAX = self.g36_npc.CLIP_AMMO_MAX * self.g36_npc.NR_CLIPS_MAX
	self.g17_npc.AMMO_MAX = self.g17_npc.CLIP_AMMO_MAX * self.g17_npc.NR_CLIPS_MAX
	self.mp9_npc.AMMO_MAX = self.mp9_npc.CLIP_AMMO_MAX * self.mp9_npc.NR_CLIPS_MAX
	self.olympic_npc.AMMO_MAX = self.olympic_npc.CLIP_AMMO_MAX * self.olympic_npc.NR_CLIPS_MAX
	self.m16_npc.AMMO_MAX = self.m16_npc.CLIP_AMMO_MAX * self.m16_npc.NR_CLIPS_MAX
	self.aug_npc.AMMO_MAX = self.aug_npc.CLIP_AMMO_MAX * self.aug_npc.NR_CLIPS_MAX
	self.ak74_npc.AMMO_MAX = self.ak74_npc.CLIP_AMMO_MAX * self.ak74_npc.NR_CLIPS_MAX
	self.ak5_npc.AMMO_MAX = self.ak5_npc.CLIP_AMMO_MAX * self.ak5_npc.NR_CLIPS_MAX
	self.p90_npc.AMMO_MAX = self.p90_npc.CLIP_AMMO_MAX * self.p90_npc.NR_CLIPS_MAX
	self.amcar_npc.AMMO_MAX = self.amcar_npc.CLIP_AMMO_MAX * self.amcar_npc.NR_CLIPS_MAX
	self.mac10_npc.AMMO_MAX = self.mac10_npc.CLIP_AMMO_MAX * self.mac10_npc.NR_CLIPS_MAX
	self.akmsu_npc.AMMO_MAX = self.akmsu_npc.CLIP_AMMO_MAX * self.akmsu_npc.NR_CLIPS_MAX
	self.akm_npc.AMMO_MAX = self.akm_npc.CLIP_AMMO_MAX * self.akm_npc.NR_CLIPS_MAX
	self.akm_gold_npc.AMMO_MAX = self.akm_gold_npc.CLIP_AMMO_MAX * self.akm_gold_npc.NR_CLIPS_MAX
	self.deagle_npc.AMMO_MAX = self.deagle_npc.CLIP_AMMO_MAX * self.deagle_npc.NR_CLIPS_MAX
	self.serbu_npc.AMMO_MAX = self.serbu_npc.CLIP_AMMO_MAX * self.serbu_npc.NR_CLIPS_MAX
	self.saiga_npc.AMMO_MAX = self.saiga_npc.CLIP_AMMO_MAX * self.saiga_npc.NR_CLIPS_MAX
	self.huntsman_npc.AMMO_MAX = self.huntsman_npc.CLIP_AMMO_MAX * self.huntsman_npc.NR_CLIPS_MAX
	self.saw_npc.AMMO_MAX = self.saw_npc.CLIP_AMMO_MAX * self.saw_npc.NR_CLIPS_MAX
	self.usp_npc.AMMO_MAX = self.usp_npc.CLIP_AMMO_MAX * self.usp_npc.NR_CLIPS_MAX
	self.g22c_npc.AMMO_MAX = self.g22c_npc.CLIP_AMMO_MAX * self.p226_npc.NR_CLIPS_MAX
	self.judge_npc.AMMO_MAX = self.judge_npc.CLIP_AMMO_MAX * self.judge_npc.NR_CLIPS_MAX
	self.m45_npc.AMMO_MAX = self.m45_npc.CLIP_AMMO_MAX * self.m45_npc.NR_CLIPS_MAX
	self.s552_npc.AMMO_MAX = self.s552_npc.CLIP_AMMO_MAX * self.s552_npc.NR_CLIPS_MAX
	self.ppk_npc.AMMO_MAX = self.ppk_npc.CLIP_AMMO_MAX * self.ppk_npc.NR_CLIPS_MAX
	self.mp7_npc.AMMO_MAX = self.mp7_npc.CLIP_AMMO_MAX * self.mp7_npc.NR_CLIPS_MAX
	self.scar_npc.AMMO_MAX = self.scar_npc.CLIP_AMMO_MAX * self.scar_npc.NR_CLIPS_MAX
	self.p226_npc.AMMO_MAX = self.p226_npc.CLIP_AMMO_MAX * self.p226_npc.NR_CLIPS_MAX
	self.hk21_npc.AMMO_MAX = self.hk21_npc.CLIP_AMMO_MAX * self.hk21_npc.NR_CLIPS_MAX
	self.m249_npc.AMMO_MAX = self.m249_npc.CLIP_AMMO_MAX * self.m249_npc.NR_CLIPS_MAX
	self.rpk_npc.AMMO_MAX = self.rpk_npc.CLIP_AMMO_MAX * self.rpk_npc.NR_CLIPS_MAX
	self.m95_npc.AMMO_MAX = self.m95_npc.CLIP_AMMO_MAX * self.m95_npc.NR_CLIPS_MAX
	self.msr_npc.AMMO_MAX = self.msr_npc.CLIP_AMMO_MAX * self.msr_npc.NR_CLIPS_MAX
	self.r93_npc.AMMO_MAX = self.r93_npc.CLIP_AMMO_MAX * self.r93_npc.NR_CLIPS_MAX
	self.fal_npc.AMMO_MAX = self.fal_npc.CLIP_AMMO_MAX * self.fal_npc.NR_CLIPS_MAX
	self.ben_npc.AMMO_MAX = self.ben_npc.CLIP_AMMO_MAX * self.ben_npc.NR_CLIPS_MAX
	self.striker_npc.AMMO_MAX = self.striker_npc.CLIP_AMMO_MAX * self.striker_npc.NR_CLIPS_MAX
	self.ksg_npc.AMMO_MAX = self.ksg_npc.CLIP_AMMO_MAX * self.ksg_npc.NR_CLIPS_MAX
	self.gre_m79_npc.AMMO_MAX = self.gre_m79_npc.CLIP_AMMO_MAX * self.gre_m79_npc.NR_CLIPS_MAX
	self.g3_npc.AMMO_MAX = self.g3_npc.CLIP_AMMO_MAX * self.g3_npc.NR_CLIPS_MAX
	self.galil_npc.AMMO_MAX = self.galil_npc.CLIP_AMMO_MAX * self.galil_npc.NR_CLIPS_MAX
	self.famas_npc.AMMO_MAX = self.famas_npc.CLIP_AMMO_MAX * self.famas_npc.NR_CLIPS_MAX
	self.scorpion_npc.AMMO_MAX = self.scorpion_npc.CLIP_AMMO_MAX * self.scorpion_npc.NR_CLIPS_MAX
	self.tec9_npc.AMMO_MAX = self.tec9_npc.CLIP_AMMO_MAX * self.tec9_npc.NR_CLIPS_MAX
	self.uzi_npc.AMMO_MAX = self.uzi_npc.CLIP_AMMO_MAX * self.uzi_npc.NR_CLIPS_MAX
end
