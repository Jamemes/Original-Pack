local data = SkillTreeGui._set_selected_skill_item
function SkillTreeGui:_set_selected_skill_item(item, no_sound)
	data(self, item, no_sound)
	local desc_text = self._skill_description_panel:child("text")
	desc_text:set_font_size(tweak_data.menu.pd2_small_font_size)
	local _, _, _, h = desc_text:text_rect()
	while h > self._skill_description_panel:h() - desc_text:top() do
		desc_text:set_font_size(desc_text:font_size() * 0.99)
		_, _, _, h = desc_text:text_rect()
	end
end

function MenuComponentManager:create_skilltree_new_gui(node)
	self:close_skilltree_new_gui()

	self._skilltree_gui = SkillTreeGui:new(self._ws, self._fullscreen_ws, node)
	self._new_skilltree_gui_active = true

	self:enable_skilltree_gui()
end

function MenuComponentManager:create_skilltree_gui(node)
	self:close_skilltree_gui()

	self._skilltree_gui = SkillTreeGui:new(self._ws, self._fullscreen_ws, node)
	self._old_skilltree_gui_active = true

	self:enable_skilltree_gui()
end

function MenuComponentManager:on_skill_unlocked(...)
	if self._skilltree_gui then
		self._skilltree_gui:on_skill_unlocked(...)
	end
end