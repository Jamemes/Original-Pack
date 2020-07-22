local data = BlackMarketTweakData._init_projectiles
function BlackMarketTweakData:_init_projectiles(tweak_data)
    data(self, tweak_data)
	self.projectiles.dynamite = nil
	self.projectiles.wpn_prj_four = nil
	self.projectiles.wpn_prj_jav = nil
	self.projectiles.dada_com = nil
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