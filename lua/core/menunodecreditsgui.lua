function MenuNodeCreditsGui:init(node, layer, parameters)
	MenuNodeCreditsGui.super.init(self, node, layer, parameters)
	self:_build_credits_panel(node._parameters.credits_file)
	if node._parameters.credits_file == "OP" then
		managers.music:post_event("pth_i_will_give_you_my_all")
	else
		managers.music:post_event(managers.music:jukebox_menu_track("credits"))
	end
end
