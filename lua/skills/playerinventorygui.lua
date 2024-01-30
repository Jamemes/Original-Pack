Hooks:PreHook(PlayerInventoryGui, "_round_everything", "PlayerInventoryGui_update_legends", function(self)
	self:_update_specialization_box()
end)

function PlayerInventoryGui:_update_specialization_box()
	local box = self._boxes_by_name.specialization

	if box then
		local current_specialization = managers.skilltree:get_specialization_value("current_specialization")
		local specialization_data = tweak_data.skilltree.specializations[current_specialization]
		local texture_rect_x = 0
		local texture_rect_y = 0
		local specialization_text = managers.localization:text(specialization_data.name_id) or " "
		local guis_catalog = "guis/"

		if specialization_data then
			local current_tier = managers.skilltree:get_specialization_value(current_specialization, "tiers", "current_tier")
			local max_tier = managers.skilltree:get_specialization_value(current_specialization, "tiers", "max_tier")
			local tier_data = specialization_data[max_tier]

			if tier_data then
				texture_rect_x = tier_data.icon_xy and tier_data.icon_xy[1] or 0
				texture_rect_y = tier_data.icon_xy and tier_data.icon_xy[2] or 0

				if tier_data.texture_bundle_folder then
					guis_catalog = guis_catalog .. "dlcs/" .. tostring(tier_data.texture_bundle_folder) .. "/"
				end
			end
		end

		local icon_atlas_texture = guis_catalog .. "textures/pd2/skilltree/op_icons_atlas"

		self:update_box(box, {
			text = specialization_text,
			image = icon_atlas_texture,
			image_rect = {
				texture_rect_x * 64,
				texture_rect_y * 64,
				64,
				64
			}
		}, true)
	end
end

function PlayerInventoryGui:set_skilltree_stats(panel, data) return end

PlayerInventoryGui._update_info_skilltree = function(self, name)
	local text_string = ""
	text_string = text_string .. managers.localization:text("menu_st_skill_switch_set", {skill_switch = managers.skilltree:get_skill_switch_name(managers.skilltree:get_selected_skill_switch(), true)}) .. "\n "
	local tree_to_string_id = {mastermind = "st_menu_mastermind", enforcer = "st_menu_enforcer", technician = "st_menu_technician", ghost = "st_menu_ghost", hoxton = "st_menu_hoxton_pack"}
	text_string = text_string .. "\n"
	
	local trees = {"mastermind", "enforcer", "technician", "ghost", "hoxton"}
	
	for i,tree in ipairs(trees) do
		local points, progress, num_skills = managers.skilltree:get_tree_progress_new(tree)
		points = string.format("%02d", points)
		text_string = text_string .. managers.localization:to_upper_text("menu_profession_progress", {profession = managers.localization:to_upper_text(tree_to_string_id[tree]), progress = points, num_skills = num_skills}) .. "\n"
	end
	self:set_info_text(text_string)
end