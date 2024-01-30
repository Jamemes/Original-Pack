local data = MenuCallbackHandler._increase_infamous
function MenuCallbackHandler:_increase_infamous(yes_clbk)
	data(self, yes_clbk)
	managers.skilltree:reset_specializations()
	managers.skilltree._global.specializations.total_points = Application:digest_value(0, true)
	managers.skilltree._global.specializations.points = Application:digest_value(0, true)
end