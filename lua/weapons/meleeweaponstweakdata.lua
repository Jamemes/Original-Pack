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

end