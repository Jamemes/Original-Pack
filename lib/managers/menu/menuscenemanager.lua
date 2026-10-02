Hooks:PostHook(MenuSceneManager, "_setup_bg", "Update_2.MenuSceneManager._setup_bg.PostHook", function(self)
	self._menu_logo:set_visible(false)
	self._menu_logo = World:spawn_unit(Idstring("units/menu/menu_scene/menu_logo"), Vector3(200, 0, -200), Rotation(180, 0, 0))
end)