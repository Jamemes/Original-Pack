local data = InteractionTweakData.init
function InteractionTweakData:init(tweak_data)
	data(self, tweak_data)
	
	if Global.game_settings and Global.game_settings.level_id == "pbr2" then
	else
		self.money_wrap.no_contour = true
	end
	self.safe_loot_pickup.no_contour = true
	self.gold_pile.no_contour = true
	
	self.ammo_bag.upgrade_timer_multipliers = {
		{
			upgrade = "interaction_speed_multiplier",
			category = "ammo_bag"
		},
		{
			upgrade = "deploy_interact_faster",
			category = "player"
		}
	}
	
	self.shaped_sharge.requires_upgrade = {
		category = "player",
		upgrade = "trip_mine_shaped_charge"
	}
	self.shaped_sharge.slot = 1
	self.shaped_sharge.blocked_hint = nil
	self.gage_assignment.timer = 0
	
	self.hostage_move.upgrade_timer_multiplier = {
		category = "player",
		upgrade = "hostage_interaction_speed_multiplier"
	}
	self.hostage_stay.upgrade_timer_multiplier = {
		category = "player",
		upgrade = "hostage_interaction_speed_multiplier"
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
	self.pickup_hotel_room_keycard.requires_mask_off_upgrade = {
		category = "player",
		upgrade = "mask_off_pickup"
	}
	self.cas_take_usb_key.requires_mask_off_upgrade = {
		category = "player",
		upgrade = "mask_off_pickup"
	}
	self.cas_take_usb_key_data.requires_mask_off_upgrade = {
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
	self.vit_keycard_use.requires_mask_off_upgrade = {
		category = "player",
		upgrade = "mask_off_keycard_insert"
	}
	self.use_hotel_room_key.requires_mask_off_upgrade = {
		category = "player",
		upgrade = "mask_off_keycard_insert"
	}
	self.use_hotel_room_key_no_access.requires_mask_off_upgrade = {
		category = "player",
		upgrade = "mask_off_keycard_insert"
	}
	self.cas_copy_usb.requires_mask_off_upgrade = {
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
	self.hold_search_c4.requires_mask_off_upgrade = {
		category = "player",
		upgrade = "mask_off_desktop_interaction"
	}
	self.start_hacking.requires_mask_off_upgrade = {
		category = "player",
		upgrade = "mask_off_desktop_interaction"
	}
	self.postpone_update.requires_mask_off_upgrade = {
		category = "player",
		upgrade = "mask_off_desktop_interaction"
	}
	self.reboot_computer.requires_mask_off_upgrade = {
		category = "player",
		upgrade = "mask_off_desktop_interaction"
	}
	self.bypass_the_firewall.requires_mask_off_upgrade = {
		category = "player",
		upgrade = "mask_off_desktop_interaction"
	}
	self.uno_use_device.requires_mask_off_upgrade = {
		category = "player",
		upgrade = "mask_off_desktop_interaction"
	}
	self.uno_assemble_device.requires_mask_off_upgrade = {
		category = "player",
		upgrade = "mask_off_desktop_interaction"
	}
	self.vit_remove_painting.requires_mask_off_upgrade = {
		category = "player",
		upgrade = "mask_off_desktop_interaction"
	}
	self.hold_open_the_safe.requires_mask_off_upgrade = {
		category = "player",
		upgrade = "mask_off_desktop_interaction"
	}
	self.security_station_keyboard.requires_mask_off_upgrade = {
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
	self.pick_lock_hard_no_skill_deactivated.requires_mask_off_upgrade = {
		category = "player",
		upgrade = "mask_off_pick_lock"
	}
	self.cas_security_door.requires_mask_off_upgrade = {
		category = "player",
		upgrade = "mask_off_pick_lock"
	}
	self.lockpick_locker.requires_mask_off_upgrade = {
		category = "player",
		upgrade = "mask_off_pick_lock"
	}
end