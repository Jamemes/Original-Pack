function MenuSceneManager:set_lobby_character_out_fit(i, outfit_string, rank)
	local outfit = managers.blackmarket:unpack_outfit_from_string(outfit_string)
	local character = outfit.character

	if managers.network:session() then
		if not managers.network:session():peer(i) then
			return
		end

		character = managers.network:session():peer(i):character_id()
	end

	self:change_lobby_character(i, character)

	local unit = self._lobby_characters[i]
	local mask_blueprint = managers.blackmarket:mask_blueprint_from_outfit_string(outfit_string)

	self:set_character_mask_by_id(outfit.mask.mask_id, outfit.mask.blueprint, unit, i)
	self:set_character_armor(outfit.armor, unit)
	self:set_character_deployable(outfit.deployable, unit, i)
	self:set_character_armor_skin(outfit.armor_skin or managers.blackmarket:equipped_armor_skin(), unit)
	self:set_character_player_style(outfit.player_style or managers.blackmarket:equipped_player_style(), outfit.suit_variation or managers.blackmarket:get_suit_variation(), unit)
	self:set_character_gloves(outfit.glove_id or managers.blackmarket:equipped_glove_id(), unit)
	self:_delete_character_weapon(unit, "all")

	local prio_item = self:_get_lobby_character_prio_item(rank, outfit)

	if prio_item == "rank" then
		self:set_character_card(i, rank, unit)
	else
		self:_select_lobby_character_pose(i, unit, outfit[prio_item])
		-- self:set_character_equipped_weapon(unit, outfit[prio_item].factory_id, outfit[prio_item].blueprint, "primary", outfit[prio_item].cosmetics)
	end

	local is_me = i == managers.network:session():local_peer():id()
	local mvec = Vector3()
	local math_up = math.UP
	local pos = Vector3()
	local rot = Rotation()

	mrotation.set_yaw_pitch_roll(rot, self._characters_rotation[(is_me and 4 or 0) + i], 0, 0)
	mvector3.set(pos, self._characters_offset)

	if is_me then
		mvector3.set_y(pos, mvector3.y(pos) + 100)
	end

	mvector3.rotate_with(pos, rot)
	mvector3.set(mvec, pos)
	mvector3.negate(mvec)
	mvector3.set_z(mvec, 0)
	mrotation.set_look_at(rot, mvec, math_up)
	unit:set_position(pos)
	unit:set_rotation(rot)
	self:set_lobby_character_visible(i, true)
end

function MenuSceneManager:_select_henchmen_pose(unit, weapon_id, index)
	local delays = {
		0,
		0.8,
		0.2,
		0.5
	}
	local animation_delay = delays[index] or index * 0.2
	local state = unit:play_redirect(Idstring("idle_menu"))

	if not weapon_id then
		unit:anim_state_machine():set_parameter(state, "cvc_var1", 1)
		unit:anim_state_machine():set_animation_time_all_segments(animation_delay)

		return
	end

	local category = tweak_data.weapon[weapon_id].categories[1]
	local lobby_poses = self._lobby_poses[weapon_id]
	lobby_poses = lobby_poses or self._lobby_poses[category]
	lobby_poses = lobby_poses or self._lobby_poses.generic
	local pose = nil

	if type(lobby_poses[1]) == "string" then
		pose = lobby_poses[math.random(#lobby_poses)]
	else
		pose = lobby_poses[index][math.random(#lobby_poses[index])]
	end

	unit:anim_state_machine():set_parameter(state, pose, 1)
	unit:anim_state_machine():set_animation_time_all_segments(animation_delay)
	self:_delete_character_weapon(unit, "all")
end