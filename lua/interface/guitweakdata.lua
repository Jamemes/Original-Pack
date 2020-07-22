local init_original = GuiTweakData.init

function GuiTweakData:init(...)
	init_original(self, ...)
	self.crime_net.sidebar = {
		{
			name_id = "menu_cn_shortcuts",
			icon = "sidebar_expand",
			show_name_while_collapsed = false,
			callback = "clbk_toggle_sidebar"
		},
		{
			visible_callback = "clbk_visible_multiplayer",
			btn_macro = "menu_toggle_filters",
			callback = "clbk_crimenet_filters",
			name_id = "menu_cn_filters_sidebar",
			icon = "sidebar_filters"
		},
		{
			item_class = "CrimeNetSidebarSeparator"
		},
		{
			name_id = "menu_cn_side_jobs",
			icon = "sidebar_side_jobs",
			callback = "clbk_side_jobs"
		},
		{
			visible_callback = "clbk_visible_crime_spree",
			name_id = "cn_crime_spree",
			callback = "clbk_crime_spree",
			id = "crime_spree",
			icon = "sidebar_crimespree",
			item_class = "CrimeNetSidebarCrimeSpreeItem"
		},
		{
			name_id = "menu_cn_premium_buy",
			icon = "sidebar_broker",
			callback = "clbk_contract_broker"
		},
		{
			item_class = "CrimeNetSidebarSeparator"
		},
		{
			visible_callback = "clbk_visible_not_in_lobby",
			callback = "clbk_the_basics",
			name_id = "menu_cn_short",
			icon = "sidebar_basics",
			item_class = "CrimeNetSidebarTutorialHeistsItem"
		},
		{
			name_id = "menu_cn_story_missions",
			icon = "sidebar_question",
			item_class = "CrimeNetSidebarStoryMissionItem",
			callback = "clbk_open_story_missions"
		},
		{
			name_id = "menu_cn_chill",
			callback = "clbk_safehouse",
			id = "safehouse",
			icon = "sidebar_safehouse",
			item_class = "CrimeNetSidebarSafehouseItem"
		},
		{
			item_class = "CrimeNetSidebarSeparator"
		},
		{
			name_id = "menu_mutators",
			callback = "clbk_mutators",
			id = "mutators",
			icon = "sidebar_mutators",
			item_class = "CrimeNetSidebarMutatorsItem"
		},
		{
			visible_callback = "clbk_visible_skirmish",
			name_id = "menu_cn_skirmish",
			callback = "clbk_skirmish",
			id = "skirmish",
			icon = "sidebar_skirmish",
			item_class = "CrimeNetSidebarSkirmishItem"
		}
	}
	self.crime_net.special_contracts = {
		{
			id = "gage_assignment",
			name_id = "menu_cn_gage_assignment",
			desc_id = "menu_cn_gage_assignment_desc",
			menu_node = "crimenet_gage_assignment",
			x = 425,
			y = 910,
			icon = "guis/textures/pd2/crimenet_marker_gage",
			dlc = "gage_pack_jobs"
		},
		{
			id = "premium_buy",
			name_id = "menu_contract_broker",
			desc_id = "menu_cn_premium_buy_desc",
			menu_node = "contract_broker",
			x = 420,
			y = 846,
			icon = "guis/textures/pd2/crimenet_marker_buy"
		},
		{
			id = "contact_info",
			name_id = "menu_cn_contact_info",
			desc_id = "menu_cn_contact_info_desc",
			menu_node = "crimenet_contact_info",
			x = 912,
			y = 905,
			icon = "guis/textures/pd2/crimenet_marker_codex"
		},
		{
			id = "casino",
			name_id = "menu_cn_casino",
			desc_id = "menu_cn_casino_desc",
			menu_node = "crimenet_contract_casino",
			x = 347,
			y = 716,
			icon = "guis/textures/pd2/crimenet_casino",
			unlock = "unlock_level",
			pulse = false,
			pulse_color = Color(204, 255, 209, 32) / 255
		}
	}
end