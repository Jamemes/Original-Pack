local data = MenuSceneManager.set_lobby_character_out_fit
function MenuSceneManager:set_lobby_character_out_fit(i, outfit_string, rank)
	data(self, i, outfit_string, rank)
	local unit = self._lobby_characters[i]
	self:set_character_equipped_weapon(unit, nil, nil, "primary", nil)
end

local data = MenuSceneManager._select_henchmen_pose
function MenuSceneManager:_select_henchmen_pose(unit, weapon_id, index)
	data(self, unit, weapon_id, index)
	self:_delete_character_weapon(unit, "all")
end

local data = MenuSceneManager._setup_bg
function MenuSceneManager:_setup_bg()
	data(self)
	self._menu_logo:set_visible(false)
	self._menu_logo = World:spawn_unit(Idstring("units/menu/menu_scene/menu_logo"), Vector3(200, 0, -200), Rotation(180, 0, 0))
end