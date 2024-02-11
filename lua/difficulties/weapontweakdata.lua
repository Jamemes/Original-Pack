local data = WeaponTweakData.init
function WeaponTweakData:init(tweak_data)
	data(self, tweak_data)
	self.benelli_npc.usage = "is_shotgun_pump_rapid"
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