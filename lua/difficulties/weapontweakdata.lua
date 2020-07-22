data = WeaponTweakData.init
function WeaponTweakData:init(tweak_data)
    data(self, tweak_data)
	self.saiga_npc.DAMAGE = 5
	self.saiga_npc.CLIP_AMMO_MAX = 20
	self.saiga_npc.NR_CLIPS_MAX = 4
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
	self.ak47_ass_npc.DAMAGE = 3
	self.mp5_npc.DAMAGE = 2
	self.m4_npc.DAMAGE = 3
	self.m4_yellow_npc.DAMAGE = 3
	self.g36_npc.DAMAGE = 4
	self.r870_npc.DAMAGE = 7
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