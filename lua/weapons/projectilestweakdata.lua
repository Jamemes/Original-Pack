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