function MenuComponentManager:init()
	self._ws = managers.gui_data:create_saferect_workspace()
	self._fullscreen_ws = managers.gui_data:create_fullscreen_16_9_workspace()
	self._main_panel = self._ws:panel():panel()
	self._requested_textures = {}
	self._block_texture_requests = false
	self._REFRESH_FRIENDS_TIME = 5
	self._refresh_friends_t = TimerManager:main():time() + self._REFRESH_FRIENDS_TIME
	self._sound_source = SoundDevice:create_source("MenuComponentManager")
	self._resolution_changed_callback_id = managers.viewport:add_resolution_changed_func(callback(self, self, "resolution_changed"))
	self._request_done_clbk_func = callback(self, self, "_request_done_callback")
	self._preplanning_saved_draws = {}

	local is_installing, install_progress = managers.dlc:is_installing()

	self._is_game_installing = is_installing
	self._crimenet_enabled = not is_installing
	self._crimenet_offline_enabled = not is_installing
	self._generated = self._generated or {}
	self._active_components = {}
	self._active_components.news = {
		create = callback(self, self, "_create_newsfeed_gui"),
		close = callback(self, self, "close_newsfeed_gui")
	}
	self._active_components.profile = {
		create = callback(self, self, "_create_profile_gui"),
		close = callback(self, self, "_disable_profile_gui")
	}
	self._active_components.friends = {
		create = callback(self, self, "_create_friends_gui"),
		close = callback(self, self, "_disable_friends_gui")
	}
	self._active_components.chats = {
		create = callback(self, self, "_create_chat_gui"),
		close = callback(self, self, "_disable_chat_gui")
	}
	self._active_components.lobby_chats = {
		create = callback(self, self, "_create_lobby_chat_gui"),
		close = callback(self, self, "hide_lobby_chat_gui")
	}
	self._active_components.contract = {
		create = callback(self, self, "_create_contract_gui"),
		close = callback(self, self, "_disable_contract_gui")
	}
	self._active_components.server_info = {
		create = callback(self, self, "_create_server_info_gui"),
		close = callback(self, self, "_disable_server_info_gui")
	}
	self._active_components.debug_strings = {
		create = callback(self, self, "_create_debug_strings_gui"),
		close = callback(self, self, "_disable_debug_strings_gui")
	}
	self._active_components.debug_fonts = {
		create = callback(self, self, "_create_debug_fonts_gui"),
		close = callback(self, self, "_disable_debug_fonts_gui")
	}
	self._active_components.skilltree = {
		create = callback(self, self, "_create_skilltree_gui"),
		close = callback(self, self, "close_skilltree_gui")
	}
	self._active_components.crimenet = {
		create = callback(self, self, "_create_crimenet_gui"),
		close = callback(self, self, "close_crimenet_gui")
	}
	self._active_components.crimenet_contract = {
		create = callback(self, self, "_create_crimenet_contract_gui"),
		close = callback(self, self, "close_crimenet_contract_gui")
	}
	self._active_components.crimenet_filters = {
		create = callback(self, self, "_create_crimenet_filters_gui"),
		close = callback(self, self, "close_crimenet_filters_gui")
	}
	self._active_components.blackmarket = {
		create = callback(self, self, "_create_blackmarket_gui"),
		close = callback(self, self, "close_blackmarket_gui")
	}
	self._active_components.mission_briefing = {
		create = callback(self, self, "_create_mission_briefing_gui"),
		close = callback(self, self, "_hide_mission_briefing_gui")
	}
	self._active_components.stage_endscreen = {
		create = callback(self, self, "_create_stage_endscreen_gui"),
		close = callback(self, self, "_hide_stage_endscreen_gui")
	}
	self._active_components.lootdrop = {
		create = callback(self, self, "_create_lootdrop_gui"),
		close = callback(self, self, "_hide_lootdrop_gui")
	}
	self._active_components.menuscene_info = {
		create = callback(self, self, "_create_menuscene_info_gui"),
		close = callback(self, self, "_close_menuscene_info_gui")
	}
	self._active_components.player_profile = {
		create = callback(self, self, "_create_player_profile_gui"),
		close = callback(self, self, "close_player_profile_gui")
	}
	self._active_components.ingame_contract = {
		create = callback(self, self, "_create_ingame_contract_gui"),
		close = callback(self, self, "close_ingame_contract_gui")
	}
	self._active_components.ingame_manual = {
		create = callback(self, self, "_create_ingame_manual_gui"),
		close = callback(self, self, "close_ingame_manual_gui")
	}
	self._active_components.inventory_list = {
		create = callback(self, self, "_create_inventory_list_gui"),
		close = callback(self, self, "close_inventory_list_gui")
	}
	self._alive_components = {}

	if _G.IS_VR and managers.menu._is_start_menu then
		local vr_bg = self._fullscreen_ws:panel():bitmap({
			layer = -2,
			name = "vr_bg",
			texture = "guis/dlcs/vr/textures/pd2/bg"
		})
		local h = self._fullscreen_ws:panel():h()
		local dh = h / vr_bg:texture_height()

		vr_bg:set_size(vr_bg:texture_width() * dh, h)
	end
end

function MenuComponentManager:_create_blackmarket_gui(node)
	self:create_blackmarket_gui(node)
end

function MenuComponentManager:create_blackmarket_gui(node)
	self:close_blackmarket_gui()
	self._blackmarket_gui = BlackMarketGui:new(self._ws, self._fullscreen_ws, node)
end

function MenuComponentManager:set_blackmarket_tab_positions()
	if self._blackmarket_gui then
		self._blackmarket_gui:set_tab_positions()
	end
end

function MenuComponentManager:close_blackmarket_gui()
	if self._blackmarket_gui then
		self._blackmarket_gui:close()
		self._blackmarket_gui = nil
	end
end
