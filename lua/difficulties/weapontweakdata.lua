local data = WeaponTweakData.init
function WeaponTweakData:init(tweak_data)
    data(self, tweak_data)
	self.saiga_npc.DAMAGE = 5
	self.scar_npc.DAMAGE = 3
	self.mp9_npc.DAMAGE = 0.5
	self.g36_npc.CLIP_AMMO_MAX = 20
	self.g36_npc.NR_CLIPS_MAX = 5
	self.mp9_npc.CLIP_AMMO_MAX = 32
	self.mp9_npc.NR_CLIPS_MAX = 5
end

function WeaponTweakData:_set_normal()
	self.swat_van_turret_module.HEALTH_INIT = 350
	self.swat_van_turret_module.SHIELD_HEALTH_INIT = 70
	self.swat_van_turret_module.DAMAGE = 0.2
	self.ceiling_turret_module.HEALTH_INIT = 87.5
	self.ceiling_turret_module.SHIELD_HEALTH_INIT = 2
	self.ceiling_turret_module.DAMAGE = 0.2
	self.aa_turret_module.HEALTH_INIT = 450
	self.aa_turret_module.SHIELD_HEALTH_INIT = 70
	self.aa_turret_module.DAMAGE = 0.2
	self.crate_turret_module.HEALTH_INIT = 87.5
	self.crate_turret_module.SHIELD_HEALTH_INIT = 2
	self.crate_turret_module.DAMAGE = 0.2
end

function WeaponTweakData:_set_hard()
	self.swat_van_turret_module.HEALTH_INIT = 350
	self.swat_van_turret_module.SHIELD_HEALTH_INIT = 70
	self.swat_van_turret_module.DAMAGE = 0.5
	self.ceiling_turret_module.HEALTH_INIT = 87.5
	self.ceiling_turret_module.SHIELD_HEALTH_INIT = 70
	self.ceiling_turret_module.DAMAGE = 0.5
	self.aa_turret_module.HEALTH_INIT = 450
	self.aa_turret_module.SHIELD_HEALTH_INIT = 70
	self.aa_turret_module.DAMAGE = 0.2
	self.crate_turret_module.HEALTH_INIT = 87.5
	self.crate_turret_module.SHIELD_HEALTH_INIT = 70
	self.crate_turret_module.DAMAGE = 0.2
	self.smoke_npc.DAMAGE = 0.6
end

function WeaponTweakData:_set_overkill_145()
	self.swat_van_turret_module.HEALTH_INIT = 2500
	self.swat_van_turret_module.SHIELD_HEALTH_INIT = 500
	self.swat_van_turret_module.DAMAGE = 2
	self.ceiling_turret_module.HEALTH_INIT = 1250
	self.ceiling_turret_module.SHIELD_HEALTH_INIT = 250
	self.ceiling_turret_module.DAMAGE = 2
	self.aa_turret_module.HEALTH_INIT = 2600
	self.aa_turret_module.SHIELD_HEALTH_INIT = 500
	self.aa_turret_module.DAMAGE = 2
	self.crate_turret_module.HEALTH_INIT = 1250
	self.crate_turret_module.SHIELD_HEALTH_INIT = 500
	self.crate_turret_module.DAMAGE = 2
end

function WeaponTweakData:_set_overkill_290()
	self.swat_van_turret_module.HEALTH_INIT = 4000
	self.swat_van_turret_module.SHIELD_HEALTH_INIT = 700
	self.swat_van_turret_module.DAMAGE = 3.5
	self.swat_van_turret_module.CLIP_SIZE = 800
	self.ceiling_turret_module.HEALTH_INIT = 2000
	self.ceiling_turret_module.SHIELD_HEALTH_INIT = 350
	self.ceiling_turret_module.DAMAGE = 3.5
	self.ceiling_turret_module.CLIP_SIZE = 800
	self.aa_turret_module.HEALTH_INIT = 4010
	self.aa_turret_module.SHIELD_HEALTH_INIT = 700
	self.aa_turret_module.DAMAGE = 3.5
	self.aa_turret_module.CLIP_SIZE = 800
	self.crate_turret_module.HEALTH_INIT = 2000
	self.crate_turret_module.SHIELD_HEALTH_INIT = 700
	self.crate_turret_module.DAMAGE = 3.5
	self.crate_turret_module.CLIP_SIZE = 800
end

function WeaponTweakData:_set_sm_wish()
	self.mp9_npc.DAMAGE = 0.75
	self.mp5_npc.DAMAGE = 1.5
	self.mp5_tactical_npc.DAMAGE = 2
	self.ump_npc.DAMAGE = 1.5
	self.m4_npc.DAMAGE = 2
	self.saiga_npc.DAMAGE = 7
	self.r870_npc.DAMAGE = 7
	self.benelli_npc.DAMAGE = 7
	self.swat_van_turret_module.HEALTH_INIT = 4000
	self.swat_van_turret_module.SHIELD_HEALTH_INIT = 700
	self.swat_van_turret_module.DAMAGE = 3.5
	self.swat_van_turret_module.CLIP_SIZE = 800
	self.ceiling_turret_module.HEALTH_INIT = 2000
	self.ceiling_turret_module.SHIELD_HEALTH_INIT = 350
	self.ceiling_turret_module.DAMAGE = 3.5
	self.ceiling_turret_module.CLIP_SIZE = 800
	self.aa_turret_module.HEALTH_INIT = 4010
	self.aa_turret_module.SHIELD_HEALTH_INIT = 700
	self.aa_turret_module.DAMAGE = 3.5
	self.aa_turret_module.CLIP_SIZE = 800
	self.crate_turret_module.HEALTH_INIT = 2000
	self.crate_turret_module.SHIELD_HEALTH_INIT = 350
	self.crate_turret_module.DAMAGE = 3.5
	self.crate_turret_module.CLIP_SIZE = 800
	self.smoke_npc.DAMAGE = 5
end