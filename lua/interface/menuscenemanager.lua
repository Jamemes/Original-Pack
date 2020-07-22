function MenuSceneManager:_init_lobby_poses()
	self._lobby_poses = {
		generic = {
			{
				"lobby_generic_idle2"
			},
			{
				"lobby_generic_idle1"
			},
			{
				"lobby_generic_idle4"
			},
			{
				"lobby_generic_idle3"
			}
		}
	}
end

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

function MenuSceneManager:set_henchmen_loadout(index, character, loadout)
	self._picked_character_position = self._picked_character_position or {}
	loadout = loadout or managers.blackmarket:henchman_loadout(index)
	character = character or managers.blackmarket:preferred_henchmen(index)

	if not character then
		local preferred = managers.blackmarket:preferred_henchmen()
		local characters = CriminalsManager.character_names()
		local player_character = managers.blackmarket:get_preferred_characters_list()[1]
		local available = {}

		for i, name in ipairs(characters) do
			if player_character ~= name then
				local found_current = table.get_key(self._picked_character_position, name) or 999

				if not table.contains(preferred, name) and index <= found_current then
					local new_name = CriminalsManager.convert_old_to_new_character_workname(name)
					local char_tweak = tweak_data.blackmarket.characters.locked[new_name] or tweak_data.blackmarket.characters[new_name]

					if not char_tweak.dlc or managers.dlc:is_dlc_unlocked(char_tweak.dlc) then
						table.insert(available, name)
					end
				end
			end
		end

		if #available < 1 then
			available = CriminalsManager.character_names()
		end

		character = available[math.random(#available)] or "russian"
	end

	self._picked_character_position[index] = character
	local character_id = managers.blackmarket:get_character_id_by_character_name(character)
	local unit = self._henchmen_characters[index]

	self:_delete_character_weapon(unit, "all")

	local unit_name = tweak_data.blackmarket.characters[character_id].menu_unit

	if not alive(unit) or Idstring(unit_name) ~= unit:name() then
		local pos = unit:position()
		local rot = unit:rotation()

		if alive(unit) then
			self:_delete_character_mask(unit)
			World:delete_unit(unit)
		end

		unit = World:spawn_unit(Idstring(unit_name), pos, rot)

		self:_init_character(unit, index)

		self._henchmen_characters[index] = unit
	end

	unit:base():set_character_name(character)

	local mask = loadout.mask
	local mask_blueprint = loadout.mask_blueprint
	local crafted_mask = managers.blackmarket:get_crafted_category_slot("masks", loadout.mask_slot)

	if crafted_mask then
		mask = crafted_mask.mask_id
		mask_blueprint = crafted_mask.blueprint
	end

	self:set_character_mask_by_id(mask, mask_blueprint, unit, nil, character)

	local mask_data = self._mask_units[unit:key()]

	if mask_data then
		self:update_mask_offset(mask_data)
	end

	local weapon_id = nil
	local crafted_primary = managers.blackmarket:get_crafted_category_slot("primaries", loadout.primary_slot)

	if crafted_primary then
		local primary = crafted_primary.factory_id
		local primary_id = crafted_primary.weapon_id
		local primary_blueprint = crafted_primary.blueprint
		local primary_cosmetics = crafted_primary.cosmetics

		-- self:set_character_equipped_weapon(unit, primary, primary_blueprint, "primary", primary_cosmetics)

		weapon_id = primary_id
	else
		local primary = tweak_data.character[character].weapon.weapons_of_choice.primary
		primary = string.gsub(primary, "_npc", "")
		local blueprint = managers.weapon_factory:get_default_blueprint_by_factory_id(primary)

		-- self:set_character_equipped_weapon(unit, primary, blueprint, "primary", nil)

		weapon_id = managers.weapon_factory:get_weapon_id_by_factory_id(primary)
	end

	self:set_character_player_style(loadout.player_style, loadout.suit_variation, unit)
	self:_select_henchmen_pose(unit, weapon_id, index)

	local pos, rot = self:get_henchmen_positioning(index)

	unit:set_position(pos)
	unit:set_rotation(rot)
	self:set_henchmen_visible(true, index)
end