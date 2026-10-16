function BlackMarketManager:unlock_all_akimbo_weapons()
	return managers.player:has_category_upgrade("player", "unlock_all_akimbo_weapons"), "bm_menu_skill_locked_jowi"
end

function BlackMarketManager:start_customize_mask(slot)
	print("start_customize_mask", slot)
	local mask = managers.blackmarket:get_crafted_category("masks")[slot]
	self._customize_mask = {}
	self._customize_mask.slot = slot
	self._customize_mask.mask_id = mask.mask_id
	self._customize_mask.global_value = mask.global_value
	self._customize_mask.textures = {
		id = "no_color_full_material",
		global_value = "normal"
	}
	self:view_mask(slot)
end

function BlackMarketManager:can_modify_mask(slot)
	local mask = managers.blackmarket:get_crafted_category("masks")[slot]
	if not mask or mask.modded then
		return false
	end
	local materials = managers.blackmarket:get_inventory_category("materials")
	local textures = managers.blackmarket:get_inventory_category("textures")
	local colors = managers.blackmarket:get_inventory_category("colors")
	return true
end

function BlackMarketManager:customize_mask_category_default(category)
	if category == "colors" then
	elseif category == "textures" then
		return {
			id = "no_color_full_material",
			global_value = "normal"
		}
	elseif category == "materials" then
		return {id = "plastic", global_value = "normal"}
	end
end

function BlackMarketManager:info_customize_mask()
	local got_material = self._customize_mask.materials
	local got_pattern = self._customize_mask.textures
	local got_color = self._customize_mask.colors
	local status = {}
	table.insert(status, {
		name = "materials",
		text = got_material and tweak_data.blackmarket.materials[self._customize_mask.materials.id].name_id or "bm_menu_materials",
		color = got_material and tweak_data.screen_colors.text or tweak_data.screen_colors.important_1,
		id = got_material and self._customize_mask.materials.id,
		is_good = got_material and true or false
	})
	table.insert(status, {
		name = "textures",
		text = got_pattern and tweak_data.blackmarket.textures[self._customize_mask.textures.id].name_id or "bm_menu_textures",
		color = got_pattern and tweak_data.screen_colors.text or tweak_data.screen_colors.important_1,
		id = got_pattern and self._customize_mask.textures.id,
		is_good = got_pattern and true or false
	})
	table.insert(status, {
		name = "colors",
		text = got_color and tweak_data.blackmarket.colors[self._customize_mask.colors.id].name_id or "bm_menu_colors",
		color = got_color and tweak_data.screen_colors.text or tweak_data.screen_colors.important_1,
		id = got_color and self._customize_mask.colors.id,
		is_good = got_color and true or false
	})
	if got_material then
		status[1].price = managers.money:get_mask_part_price_modified("materials", self._customize_mask.materials.id, self._customize_mask.materials.global_value)
	end
	if got_pattern then
		status[2].price = managers.money:get_mask_part_price_modified("textures", self._customize_mask.textures.id, self._customize_mask.textures.global_value)
	end
	if got_color then
		status[3].price = managers.money:get_mask_part_price_modified("colors", self._customize_mask.colors.id, self._customize_mask.colors.global_value)
	end
	if status[2].is_good and Idstring(self._customize_mask.textures.id) == Idstring("no_color_full_material") then
		status[2].override = "colors"
		status[3].overwritten = true
	end
	if status[2].is_good and Idstring(self._customize_mask.textures.id) == Idstring("solidfirst") then
		status[2].override = "materials"
		status[1].overwritten = true
	end
	if status[2].is_good and Idstring(self._customize_mask.textures.id) == Idstring("solidsecond") then
		status[2].override = "materials"
		status[1].overwritten = true
	end
	return status
end

function BlackMarketManager:can_view_customized_mask_with_mod(category, id, global_value)
	if not self._customize_mask then
		return false
	end
	local modded = deep_clone(self._customize_mask)
	modded[category] = {id = id, global_value = global_value}
	if not modded.textures then
		return false
	end
	if not modded.materials and Idstring(modded.textures.id) ~= Idstring("solidfirst") and Idstring(modded.textures.id) ~= Idstring("solidsecond") then
		return false
	end
	if not modded.colors and Idstring(modded.textures.id) ~= Idstring("no_color_full_material") then
		return false
	end
	return true
end

function BlackMarketManager:view_customized_mask_with_mod(category, id)
	if not self._customize_mask then
		return
	end
	local blueprint = {}
	local modded = deep_clone(self._customize_mask)
	modded[category] = {id = id, global_value = "normal"}
	local slot = modded.slot
	blueprint.color = modded.colors
	blueprint.pattern = modded.textures
	blueprint.material = modded.materials
	if not blueprint.color then
		blueprint.pattern = self:customize_mask_category_default("textures")
		blueprint.color = {id = "nothing", global_value = "normal"}
	end
	self:view_mask_with_blueprint(slot, blueprint)
end

function BlackMarketManager:get_customized_mask_blueprint()
	local blueprint = {}
	blueprint.color = self._customize_mask.colors
	blueprint.pattern = self._customize_mask.textures
	blueprint.material = self._customize_mask.materials
	if not blueprint.color then
		blueprint.color = {id = "nothing", global_value = "normal"}
	end
	if Idstring(blueprint.pattern.id) == Idstring("no_color_full_material") then
		blueprint.color = {id = "nothing", global_value = "normal"}
	end
	if Idstring(blueprint.pattern.id) == Idstring("solidfirst") then
		blueprint.material = {id = "plastic", global_value = "normal"}
	end
	if Idstring(blueprint.pattern.id) == Idstring("solidsecond") then
		blueprint.material = {id = "plastic", global_value = "normal"}
	end
	return blueprint
end

function BlackMarketManager:can_finish_customize_mask(check_money)
	if not self._customize_mask then
		return false
	end
	if not self._customize_mask.textures then
		return false
	end
	if not self._customize_mask.materials and Idstring(self._customize_mask.textures.id) ~= Idstring("solidfirst") and Idstring(self._customize_mask.textures.id) ~= Idstring("solidsecond") then
		return false
	end
	if not self._customize_mask.colors and Idstring(self._customize_mask.textures.id) ~= Idstring("no_color_full_material") then
		return false
	end
	if check_money and not managers.money:can_afford_mask_crafting(self._customize_mask.mask_id, self._customize_mask.global_value, self:get_customized_mask_blueprint()) then
		return false
	end
	return true
end

function BlackMarketManager:finish_customize_mask()
	print("finish_customize_mask", inspect(self._customize_mask))
	local blueprint = self:get_customized_mask_blueprint()
	local slot = self._customize_mask.slot
	managers.money:on_buy_mask(self._customize_mask.mask_id, self._customize_mask.global_value, blueprint)
	self._customize_mask.textures = self._customize_mask.textures or {
		id = "no_color_full_material",
		global_value = "normal"
	}
	self._customize_mask.materials = self._customize_mask.materials or {id = "plastic", global_value = "normal"}
	if Idstring(blueprint.pattern.id) ~= Idstring("no_color_full_material") then
		self:remove_item(blueprint.color.global_value, "colors", blueprint.color.id)
		self:alter_global_value_item(blueprint.color.global_value, "colors", slot, blueprint.color.id, INV_TO_CRAFT)
		self:remove_item(blueprint.pattern.global_value, "textures", blueprint.pattern.id)
		self:alter_global_value_item(blueprint.pattern.global_value, "textures", slot, blueprint.pattern.id, INV_TO_CRAFT)
	else
		blueprint.color = {id = "nothing", global_value = "normal"}
	end
	if Idstring(blueprint.pattern.id) ~= Idstring("solidfirst") and Idstring(blueprint.pattern.id) ~= Idstring("solidsecond") then
		self:remove_item(blueprint.material.global_value, "materials", blueprint.material.id)
		self:alter_global_value_item(blueprint.material.global_value, "materials", slot, blueprint.material.id, INV_TO_CRAFT)
	else
		blueprint.material = {id = "plastic", global_value = "normal"}
	end
	self._customize_mask = nil
	self:set_mask_blueprint(slot, blueprint)
	local modified_slot = managers.blackmarket:get_crafted_category("masks")[slot]
	if modified_slot then
		modified_slot.modded = true
		if modified_slot.equipped then
			self:equip_mask(slot)
		end
	end
	managers.achievment:award("masked_villain")
end

function BlackMarketManager:on_sell_mask(slot)
	local category = "masks"
	if not self._global.crafted_items[category] or not self._global.crafted_items[category][slot] then
		return
	end
	local mask = self._global.crafted_items[category][slot]
	managers.money:on_sell_mask(mask.mask_id, mask.global_value, mask.blueprint)
	if slot == self:equipped_mask_slot() then
		self:equip_mask(1)
	end
	local blueprint = mask.blueprint or {}
	for category, part in pairs(blueprint) do
		local converted_category = category == "color" and "colors" or category == "material" and "materials" or category == "pattern" and "textures" or category
		Application:debug(part.global_value, converted_category, slot, part.id, CRAFT_REMOVE)
		self:alter_global_value_item(part.global_value, converted_category, slot, part.id, CRAFT_REMOVE)
	end
	self:alter_global_value_item(mask.global_value, "masks", slot, mask.mask_id, CRAFT_REMOVE)
	self._global.crafted_items[category][slot] = nil
	self:_verfify_equipped_category(category)
end

function BlackMarketManager:got_new_drop(global_value, category, id)
	local category_ids = Idstring(category)

	if category_ids == Idstring("primaries") or category_ids == Idstring("secondaries") then
		local uses_parts = managers.weapon_factory:get_parts_from_factory_id(id) or {}

		for type, parts in pairs(uses_parts) do
			for _, part in ipairs(parts) do
				local gv = tweak_data.weapon.factory.parts[part].dlc or "normal"

				if self:check_new_drop(gv, "weapon_mods", part) then
					return true
				end
			end
		end
	elseif category_ids == Idstring("weapon_mods") then
		if self:check_new_drop(global_value, "weapon_mods", id) then
			return true
		end
	elseif category_ids == Idstring("weapon_tabs") then
		local uses_parts = managers.weapon_factory:get_parts_from_factory_id(id)
		local tab_parts = uses_parts and uses_parts[global_value] or {}

		for type, part in ipairs(tab_parts) do
			if self:check_new_drop("normal", "weapon_mods", part) then
				return true
			end

			if self:check_new_drop("infamous", "weapon_mods", part) then
				return true
			end
		end
	elseif category_ids == Idstring("mask_mods") then
		local got_table = {}
		local textures = managers.blackmarket:get_inventory_category("textures")
		local colors = managers.blackmarket:get_inventory_category("colors")

		for _, mmod in ipairs({
			"colors",
			"materials",
			"textures"
		}) do
			if self:check_new_drop_category("normal", mmod) or self:check_new_drop_category("infamous", mmod) then
				got_table[mmod] = true
			end
		end

		if got_table.textures then
			return #colors > 0
		end

		if got_table.colors then
			return #textures > 0
		end

		return table.size(got_table) > 0
	elseif category_ids == Idstring("mask_buy") then
		if self:check_new_drop_category("normal", "masks") then
			return true
		end

		if self:check_new_drop_category("infamous", "masks") then
			return true
		end
	elseif category_ids == Idstring("weapon_buy") then
		if self:check_new_drop("normal", global_value, id) then
			return true
		end
	elseif category_ids == Idstring("weapon_buy_empty") then
		if self:check_new_drop_category("normal", global_value) then
			return true
		end
	elseif not id then
		if not global_value then
			if self:check_new_drop_category("normal", category) then
				return true
			end

			if self:check_new_drop_category("infamous", category) then
				return true
			end
		else
			return self:check_new_drop_category(global_value, category)
		end
	else
		return self:check_new_drop(global_value, category, id)
	end

	return false
end

function BlackMarketManager:_separate_mask_colors()
end