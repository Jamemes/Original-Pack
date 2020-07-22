function BlackMarketGui:populate_buy_mask(data)
	local new_data = {}
	local guis_catalog = "guis/"
	local max_masks = #data.on_create_data

	for i = 1, max_masks, 1 do
		data[i] = nil
	end

	for i = 1, #data.on_create_data, 1 do
		local guis_mask_id = data.on_create_data[i].mask_id

		if tweak_data.blackmarket.masks[guis_mask_id].guis_id then
			guis_mask_id = tweak_data.blackmarket.masks[guis_mask_id].guis_id
		end

		guis_catalog = "guis/"
		local bundle_folder = tweak_data.blackmarket.masks[guis_mask_id] and tweak_data.blackmarket.masks[guis_mask_id].texture_bundle_folder

		if bundle_folder then
			guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
		end

		new_data = {
			name = data.on_create_data[i].mask_id
		}
		new_data.name_localized = managers.localization:text(tweak_data.blackmarket.masks[new_data.name].name_id)
		new_data.category = data.category
		new_data.slot = data.prev_node_data and data.prev_node_data.slot
		new_data.global_value = data.on_create_data[i].global_value
		new_data.global_value_category = data.name
		new_data.unlocked = managers.blackmarket:get_item_amount(new_data.global_value, "masks", new_data.name, true) or 0
		new_data.equipped = false
		new_data.num_backs = data.prev_node_data.num_backs + 1
		new_data.bitmap_texture = guis_catalog .. "textures/pd2/blackmarket/icons/masks/" .. guis_mask_id
		new_data.stream = true

		if not new_data.global_value then
			Application:debug("BlackMarketGui:populate_buy_mask( data ) Missing global value on mask", new_data.name)
		end

		if tweak_data.lootdrop.global_values[new_data.global_value] and tweak_data.lootdrop.global_values[new_data.global_value].dlc and not managers.dlc:is_dlc_unlocked(new_data.global_value) then
			new_data.unlocked = -math.abs(new_data.unlocked)
			new_data.lock_texture = self:get_lock_icon(new_data)
			new_data.dlc_locked = tweak_data.lootdrop.global_values[new_data.global_value].unlock_id or "bm_menu_dlc_locked"
		elseif managers.dlc:is_content_achievement_locked(data.category, new_data.name) or managers.dlc:is_content_achievement_milestone_locked(data.category, new_data.name) then
			new_data.lock_texture = self:get_lock_icon(new_data, "guis/textures/pd2/lock_achievement")
		elseif managers.dlc:is_content_skirmish_locked(data.category, new_data.name) and (not new_data.unlocked or new_data.unlocked == 0) then
			new_data.lock_texture = "guis/textures/pd2/skilltree/padlock"
		end

		if tweak_data.blackmarket.masks[new_data.name].infamy_lock then
			local infamy_lock = tweak_data.blackmarket.masks[new_data.name].infamy_lock
			local is_unlocked = managers.infamy:owned(infamy_lock)

			if not is_unlocked then
				new_data.unlocked = -math.abs(new_data.unlocked)
				new_data.lock_texture = "guis/textures/pd2/lock_infamy"
				new_data.infamy_lock = infamy_lock
			end
		end

		new_data.active = true

		if new_data.unlocked and new_data.unlocked > 0 then
			if new_data.active then
				table.insert(new_data, "bm_buy")
				table.insert(new_data, "bm_preview")
			end

			if managers.money:get_mask_sell_value(new_data.name, new_data.global_value) > 0 then
				table.insert(new_data, "bm_sell")
			end
		else
			if new_data.active then
				table.insert(new_data, "bm_preview")
			end

			new_data.mid_text = ""
			new_data.lock_texture = new_data.lock_texture or true
		end

		if managers.blackmarket:got_new_drop(new_data.global_value or "normal", "masks", new_data.name) then
			new_data.mini_icons = new_data.mini_icons or {}

			table.insert(new_data.mini_icons, {
				texture = "guis/textures/pd2/blackmarket/inv_newdrop",
				name = "new_drop",
				h = 16,
				w = 16,
				top = 0,
				layer = 1,
				stream = false,
				right = 0
			})

			new_data.new_drop_data = {
				new_data.global_value or "normal",
				"masks",
				new_data.name
			}
		end

		data[i] = new_data
	end

	local max_items = self:calc_max_items(max_masks, data.override_slots)

	for i = 1, max_items, 1 do
		if not data[i] then
			new_data = {
				name = "empty",
				name_localized = "",
				category = data.category,
				slot = i,
				unlocked = true,
				equipped = false
			}
			data[i] = new_data
		end
	end
end