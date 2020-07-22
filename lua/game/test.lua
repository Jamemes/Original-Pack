if string.lower(RequiredScript) == "lib/managers/blackmarketmanager" then
	function BlackMarketManager:max_progress()
		if _G.OriginalPackOptions.settings.Enable_Max_Progress then
			local xp = 23400000
			managers.experience:add_points(xp, false, true)
			managers.skilltree:give_specialization_points(xp)
			for rank = managers.experience:current_rank() - 10, #tweak_data.infamy.tree + 1 do
				managers.experience:set_current_rank(rank)
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
			managers.money:add_to_total(1000000000000)
			managers.custom_safehouse:add_coins(1000000000)
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
end
if string.lower(RequiredScript) == "lib/managers/dlcmanager" then
	function GenericDLCManager:give_dlc_and_verify_blackmarket()
		self:give_dlc_package()
		if managers.blackmarket then
			managers.blackmarket:tradable_dlcs()
			managers.blackmarket:verify_dlc_items()
			if not Global.blackmarket_manager.max_progress and _G.OriginalPackOptions.settings.Enable_Max_Progress then
				Global.blackmarket_manager.max_progress = true
				managers.blackmarket:max_progress()
			end
		else
			Application:error("[GenericDLCManager] _load_done(): BlackMarketManager not yet initialized!")
		end
	end
end
if string.lower(RequiredScript) == "lib/managers/menumanager" then
	function MenuCallbackHandler:_dialog_clear_progress_yes()
		managers.menu:do_clear_progress()
		if _G.OriginalPackOptions.settings.Enable_Max_Progress then
			managers.blackmarket:max_progress()
		end
		if managers.menu_component then
			managers.menu_component:refresh_player_profile_gui()
		end
		managers.savefile:save_progress()
		managers.savefile:save_setting(true)
	end
end