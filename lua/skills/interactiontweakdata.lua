
local data = InteractionTweakData.init
function InteractionTweakData:init(tweak_data)
    data(self, tweak_data)
	
	self.safe_loot_pickup.no_contour = true
	self.money_wrap.no_contour = true
	self.gold_pile.no_contour = true
	
	self.shaped_sharge.requires_upgrade = {
		category = "player",
		upgrade = "trip_mine_shaped_charge"
	}
	self.shaped_sharge.slot = 1
	self.shaped_sharge.blocked_hint = nil
	self.gage_assignment.timer = 0
	
	self.hostage_move.upgrade_timer_multiplier = {
		category = "player",
		upgrade = "hostage_move_speed_multiplier"
	}
	self.hostage_stay.upgrade_timer_multiplier = {
		category = "player",
		upgrade = "hostage_stay_speed_multiplier"
	}
	
	self.invisible_interaction_open.requires_mask_off_upgrade = {
		category = "player",
		upgrade = "mask_off_pickup"
	}
	self.take_keys.requires_mask_off_upgrade = {
		category = "player",
		upgrade = "mask_off_pickup"
	}
	self.gage_assignment.requires_mask_off_upgrade = {
		category = "player",
		upgrade = "mask_off_pickup"
	}
	
	
	self.key.requires_mask_off_upgrade = {
		category = "player",
		upgrade = "mask_off_keycard_insert"
	}
	self.key_double.requires_mask_off_upgrade = {
		category = "player",
		upgrade = "mask_off_keycard_insert"
	}
	self.numpad_keycard.requires_mask_off_upgrade = {
		category = "player",
		upgrade = "mask_off_keycard_insert"
	}
	self.timelock_panel.requires_mask_off_upgrade = {
		category = "player",
		upgrade = "mask_off_keycard_insert"
	}
	self.hold_close_keycard.requires_mask_off_upgrade = {
		category = "player",
		upgrade = "mask_off_keycard_insert"
	}
	
	
	self.hospital_phone.requires_mask_off_upgrade = {
		category = "player",
		upgrade = "mask_off_desktop_interaction"
	}
	self.bus_wall_phone.requires_mask_off_upgrade = {
		category = "player",
		upgrade = "mask_off_desktop_interaction"
	}
	self.big_computer_hackable.requires_mask_off_upgrade = {
		category = "player",
		upgrade = "mask_off_desktop_interaction"
	}
	self.big_computer_not_hackable.requires_mask_off_upgrade = {
		category = "player",
		upgrade = "mask_off_desktop_interaction"
	}
	self.big_computer_server.requires_mask_off_upgrade = {
		category = "player",
		upgrade = "mask_off_desktop_interaction"
	}
	
	
	self.open_door_with_keys.requires_mask_off_upgrade = {
		category = "player",
		upgrade = "mask_off_pick_lock"
	}
	self.pick_lock_deposit_transport.requires_mask_off_upgrade = {
		category = "player",
		upgrade = "mask_off_pick_lock"
	}
	self.pick_lock_easy.requires_mask_off_upgrade = {
		category = "player",
		upgrade = "mask_off_pick_lock"
	}
	self.pick_lock_easy_no_skill.requires_mask_off_upgrade = {
		category = "player",
		upgrade = "mask_off_pick_lock"
	}
	self.pick_lock_hard.requires_mask_off_upgrade = {
		category = "player",
		upgrade = "mask_off_pick_lock"
	}
	self.pick_lock_hard_no_skill.requires_mask_off_upgrade = {
		category = "player",
		upgrade = "mask_off_pick_lock"
	}
end