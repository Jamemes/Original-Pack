function PlayerCarry:_enter(enter_data)
	local my_carry_data = managers.player:get_my_carry_data()

	if my_carry_data then
		local carry_data = tweak_data.carry[my_carry_data.carry_id]

		self._tweak_data_name = carry_data.type
	else
		self._tweak_data_name = "light"
	end

	if self._ext_movement:nav_tracker() then
		managers.groupai:state():on_criminal_recovered(self._unit)
	end

	local skip_equip = enter_data and enter_data.skip_equip

	if not self:_changing_weapon() and not skip_equip then
		if not self._state_data.mask_equipped then
			self._state_data.mask_equipped = true

			local equipped_mask = managers.blackmarket:equipped_mask()
			local peer_id = managers.network:session() and managers.network:session():local_peer():id()
			local mask_id = managers.blackmarket:get_real_mask_id(equipped_mask.mask_id, peer_id)
			local equipped_mask_type = tweak_data.blackmarket.masks[mask_id].type

			self._camera_unit:anim_state_machine():set_global((equipped_mask_type or "mask") .. "_equip", 1)
			self:_start_action_equip(self:get_animation("mask_equip"), 1.6)
		else
			self:_start_action_equip(self:get_animation("equip"))
		end
	end

	managers.job:set_memory("kill_count_carry", nil, true)
	managers.job:set_memory("kill_count_no_carry", nil, true)
	
	if not self._state_data.ducking then
		self._ext_movement:set_attention_settings({
			"pl_enemy_cbt",
			"pl_team_idle_std",
			"pl_civ_cbt"
		})
	end
end