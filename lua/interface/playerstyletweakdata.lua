local data = BlackMarketTweakData._init_player_styles
function BlackMarketTweakData:_init_player_styles(tweak_data)
	data(self, tweak_data)
	local body_replacement_with_armour = {
		head = false,
		armor = false,
		body = true,
		hands = true,
		vest = true
	}
	local wild_body_replacement_with_armour = {
		head = false,
		armor = false,
		body = true,
		hands = false,
		vest = true
	}
	self.player_styles.tux.body_replacement = body_replacement_with_armour
	self.player_styles.tux.characters.wild.third_body_replacement = wild_body_replacement_with_armour
	self.player_styles.tux.third_body_replacement = self.player_styles.tux.body_replacement
	self.player_styles.poolrepair.body_replacement = body_replacement_with_armour
	self.player_styles.poolrepair.third_body_replacement = body_replacement_with_armour
	self.player_styles.xmas_tuxedo.characters.wild.third_body_replacement = wild_body_replacement_with_armour
	self.player_styles.xmas_tuxedo.body_replacement = body_replacement_with_armour
	self.player_styles.xmas_tuxedo.third_body_replacement = body_replacement_with_armour
	self.player_styles.punk.body_replacement = body_replacement_with_armour
	self.player_styles.punk.third_body_replacement = body_replacement_with_armour
	self.player_styles.sneak_suit.body_replacement = body_replacement_with_armour
	self.player_styles.sneak_suit.third_body_replacement = body_replacement_with_armour
	self.player_styles.slaughterhouse.body_replacement = body_replacement_with_armour
	self.player_styles.slaughterhouse.third_body_replacement = body_replacement_with_armour
	self.player_styles.hippie.body_replacement = body_replacement_with_armour
	self.player_styles.hippie.third_body_replacement = body_replacement_with_armour
end
