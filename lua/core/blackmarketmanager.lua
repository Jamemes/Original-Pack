function BlackMarketManager:max_progress()
	if _G.OriginalPackOptions.settings.Enable_Max_Progress then
		local xp = 23400000
		managers.experience:add_points(xp, false, true)
		managers.skilltree:give_specialization_points(xp)
		for rank = managers.experience:current_rank() + 1, #tweak_data.infamy.tree + 1 do
			managers.experience:set_current_rank(tweak_data.testers_infamy or 5)
		end
		local max_points = managers.skilltree:digest_value(Global.skilltree_manager.specializations.max_points, false)
		Global.skilltree_manager.specializations.total_points = managers.skilltree:digest_value(max_points, true)
		Global.skilltree_manager.specializations.points = managers.skilltree:digest_value(max_points, true)
		local specialization_tweak = tweak_data.skilltree.specializations
		for tree, data in ipairs(managers.skilltree._global.specializations) do
			local total_points = 0
			for tier, spec_data in ipairs(specialization_tweak[tree]) do
				total_points = total_points + spec_data.cost
			end
			if specialization_tweak[tree] then
				local points_left = total_points - managers.skilltree:digest_value(data.points_spent, false)
				managers.skilltree:spend_specialization_points(points_left, tree)
			end
		end
		Global.skilltree_manager.specializations.points = managers.skilltree:digest_value(0, true)
		Global.skilltree_manager.specializations.points_present = managers.skilltree:digest_value(0, true)
		Global.skilltree_manager.specializations.xp_leftover = managers.skilltree:digest_value(0, true)
		Global.skilltree_manager.specializations.xp_present = managers.skilltree:digest_value(0, true)
		for _, infamy in pairs(tweak_data.infamy.tree) do
			managers.infamy:unlock_item(infamy)
		end
		managers.money:_set_offshore(tweak_data.max_offshore)
		managers.money:_set_total(tweak_data.max_spending_cash)
		managers.custom_safehouse:set_coins(tweak_data.max_coins)
		for name, item in pairs(tweak_data.blackmarket.weapon_mods) do
			if not item.dlc or managers.dlc:is_dlc_unlocked(item.dlc) then
				for i = 100, 100 do
					managers.blackmarket:add_to_inventory(item.dlc or "normal", "weapon_mods", name)
				end
			end
		end
		for name, item in pairs(tweak_data.blackmarket.masks) do
			if name ~= "character_locked" then
				if item.dlc and managers.dlc:is_dlc_unlocked(item.dlc) then
					managers.blackmarket:add_to_inventory(item.dlc, "masks", name)
				else
					local global_value = item.infamous and "infamous" or item.global_value or "normal"
					managers.blackmarket:add_to_inventory(global_value, "masks", name)
				end
			end
		end
		for name, item in pairs(tweak_data.blackmarket.materials) do
			if name ~= "plastic" then
				if item.dlc and managers.dlc:is_dlc_unlocked(item.dlc) then
					local global_value = item.infamous and "infamous" or item.global_value or item.dlc
					managers.blackmarket:add_to_inventory(global_value, "materials", name)
				else
					local global_value = item.infamous and "infamous" or item.global_value or "normal"
					managers.blackmarket:add_to_inventory(global_value, "materials", name)
				end
			end
		end
		for name, item in pairs(tweak_data.blackmarket.textures) do
			if name ~= "no_color_no_material" and name ~= "no_color_full_material" then
				if item.dlc and managers.dlc:is_dlc_unlocked(item.dlc) then
					local global_value = item.infamous and "infamous" or item.global_value or item.dlc
					managers.blackmarket:add_to_inventory(global_value, "textures", name)
				else
					local global_value = item.infamous and "infamous" or item.global_value or "normal"
					managers.blackmarket:add_to_inventory(global_value, "textures", name)
				end
			end
		end
		for name, item in pairs(tweak_data.blackmarket.colors) do
			if item.dlc and managers.dlc:is_dlc_unlocked(item.dlc) then
				local global_value = item.infamous and "infamous" or item.global_value or item.dlc
				managers.blackmarket:add_to_inventory(global_value, "colors", name)
			else
				local global_value = item.infamous and "infamous" or item.global_value or "normal"
				managers.blackmarket:add_to_inventory(global_value, "colors", name)
			end
		end
	end
end