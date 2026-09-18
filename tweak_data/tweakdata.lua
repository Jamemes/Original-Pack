require("lib/tweak_data/WeaponTweakData")
require("lib/tweak_data/WeaponUpgradesTweakData")
require("lib/tweak_data/EquipmentsTweakData")
require("lib/tweak_data/CharacterTweakData")
require("lib/tweak_data/PlayerTweakData")
require("lib/tweak_data/StatisticsTweakData")
require("lib/tweak_data/LevelsTweakData")
require("lib/tweak_data/GroupAITweakData")
require("lib/tweak_data/DramaTweakData")
require("lib/tweak_data/UpgradesTweakData")
require("lib/tweak_data/UpgradesVisualTweakData")
require("lib/tweak_data/HudIconsTweakData")
require("lib/tweak_data/TipsTweakData")
require("lib/tweak_data/BlackMarketTweakData")
require("lib/tweak_data/CarryTweakData")
require("lib/tweak_data/MissionDoorTweakData")
require("lib/tweak_data/AttentionTweakData")
require("lib/tweak_data/NarrativeTweakData")
require("lib/tweak_data/SkillTreeTweakData")
require("lib/tweak_data/TimeSpeedEffectTweakData")
require("lib/tweak_data/SoundTweakData")
require("lib/tweak_data/LootDropTweakData")
require("lib/tweak_data/GuiTweakData")
require("lib/tweak_data/MoneyTweakData")
require("lib/tweak_data/AssetsTweakData")
require("lib/tweak_data/DLCTweakData")
require("lib/tweak_data/InfamyTweakData")
require("lib/tweak_data/GageAssignmentTweakData")
require("lib/tweak_data/PrePlanningTweakData")
require("lib/tweak_data/InteractionTweakData")
TweakData = TweakData or class()

function TweakData:_init_wip_hud_icons()
end

function TweakData:_init_wip_blackmarket(tweak_data)
end

function TweakData:_init_wip_character(tweak_data)
end

function TweakData:_init_wip_levels()
end

function TweakData:_init_wip_narrative()
end

function TweakData:_init_wip_assets(tweak_data)
end

function TweakData:_init_wip_dlc(tweak_data)
end

function TweakData:_init_wip_lootdrop(tweak_data)
end

function TweakData:_init_wip_gui(tweak_data)
end

function TweakData:_init_wip_preplanning(tweak_data)
end

function TweakData:_init_wip_money_manager(tweak_data)
end

function TweakData:_init_wip_weapon(tweak_data)
end

function TweakData:_init_wip_weapon_factory(tweak_data)
end

function TweakData:_init_wip_infamy(tweak_data)
end

function TweakData:_init_wip_interaction()
end

function TweakData:_init_wip_skilltree()
end

function TweakData:_init_wip_upgrades()
end

function TweakData:_init_wip_equipments()
end

function TweakData:_init_wip_criminals(tweak_data)
end

require("lib/tweak_data/TweakDataPD2")
require("lib/tweak_data/TweakDataWip")
TweakData.RELOAD = true

function TweakData:digest_tweak_data()
	Application:debug("TweakData: Digesting tweak_data. <('O'<)")
	self:digest_recursive(self.money_manager)
	self:digest_recursive(self.experience_manager)
	self:digest_recursive(self.casino)
end

function TweakData:digest_recursive(key, parent)
	local value = parent and parent[key] or key
	if type(value) == "table" then
		for index, data in pairs(value) do
			self:digest_recursive(index, value)
		end
	elseif type(value) == "number" then
		parent[key] = Application:digest_value(value, true)
	end
end

function TweakData:get_value(...)
	local arg = {
		...
	}
	local value = self
	for _, v in ipairs(arg) do
		if not value[v] then
			return false
		end
		value = value[v]
	end
	if type(value) == "string" then
		return Application:digest_value(value, false)
	elseif type(value) == "table" then
		Application:debug("TweakData:get_value() value was a table, is this correct? returning false!", inspect(arg), inspect(value))
		return false
	end
	return value
end

function TweakData:get_raw_value(...)
	local arg = {
		...
	}
	local value = self
	local v
	for i = 1, #arg do
		v = arg[i]
		if not value[v] then
			return nil, v, i
		end
		value = value[v]
	end
	return value
end

function TweakData:set_mode()
	if not Global.game_settings then
		return
	end
	if Global.game_settings.single_player then
		self:_set_singleplayer()
	else
		self:_set_multiplayer()
	end
end

function TweakData:_set_singleplayer()
	self.player:_set_singleplayer()
end

function TweakData:_set_multiplayer()
	self.player:_set_multiplayer()
end

function TweakData:set_difficulty()
	if not Global.game_settings then
		return
	end
	if Global.game_settings.difficulty == "easy" then
		self:_set_easy()
	elseif Global.game_settings.difficulty == "normal" then
		self:_set_normal()
	elseif Global.game_settings.difficulty == "overkill" then
		self:_set_overkill()
	elseif Global.game_settings.difficulty == "overkill_145" then
		self:_set_overkill_145()
	elseif Global.game_settings.difficulty == "overkill_290" then
		self:_set_overkill_290()
	else
		self:_set_hard()
	end
end

function TweakData:_set_easy()
	self.player:_set_easy()
	self.character:_set_easy()
	self.money_manager:init(self)
	self.group_ai:init(self)
	self.weapon:_set_easy()
	self.experience_manager.civilians_killed = 15
	self.difficulty_name_id = self.difficulty_name_ids.easy
	self.experience_manager.total_level_objectives = 1000
	self.experience_manager.total_criminals_finished = 25
	self.experience_manager.total_objectives_finished = 750
end

function TweakData:_set_normal()
	self.player:_set_normal()
	self.character:_set_normal()
	self.money_manager:init(self)
	self.group_ai:init(self)
	self.weapon:_set_normal()
	self.experience_manager.civilians_killed = 35
	self.difficulty_name_id = self.difficulty_name_ids.normal
	self.experience_manager.total_level_objectives = 2000
	self.experience_manager.total_criminals_finished = 50
	self.experience_manager.total_objectives_finished = 1000
end

function TweakData:_set_hard()
	self.player:_set_hard()
	self.character:_set_hard()
	self.money_manager:init(self)
	self.group_ai:init(self)
	self.weapon:_set_hard()
	self.experience_manager.civilians_killed = 75
	self.difficulty_name_id = self.difficulty_name_ids.hard
	self.experience_manager.total_level_objectives = 2500
	self.experience_manager.total_criminals_finished = 150
	self.experience_manager.total_objectives_finished = 1500
end

function TweakData:_set_overkill()
	self.player:_set_overkill()
	self.character:_set_overkill()
	self.money_manager:init(self)
	self.group_ai:init(self)
	self.weapon:_set_overkill()
	self.experience_manager.civilians_killed = 150
	self.difficulty_name_id = self.difficulty_name_ids.overkill
	self.experience_manager.total_level_objectives = 5000
	self.experience_manager.total_criminals_finished = 500
	self.experience_manager.total_objectives_finished = 3000
end

function TweakData:_set_overkill_145()
	self.player:_set_overkill_145()
	self.character:_set_overkill_145()
	self.money_manager:init(self)
	self.group_ai:init(self)
	self.weapon:_set_overkill_145()
	self.experience_manager.civilians_killed = 550
	self.difficulty_name_id = self.difficulty_name_ids.overkill_145
	self.experience_manager.total_level_objectives = 5000
	self.experience_manager.total_criminals_finished = 2000
	self.experience_manager.total_objectives_finished = 3000
end

function TweakData:_set_overkill_290()
	self.player:_set_overkill_290()
	self.character:_set_overkill_290()
	self.money_manager:init(self)
	self.group_ai:init(self)
	self.weapon:_set_overkill_290()
	self.experience_manager.civilians_killed = 10000
	self.difficulty_name_id = self.difficulty_name_ids.overkill_290
	self.experience_manager.total_level_objectives = 5000
	self.experience_manager.total_criminals_finished = 2000
	self.experience_manager.total_objectives_finished = 3000
end

function TweakData:difficulty_to_index(difficulty)
	return table.index_of(self.difficulties, difficulty)
end

function TweakData:index_to_difficulty(index)
	return self.difficulties[index]
end

function TweakData:permission_to_index(permission)
	return table.index_of(self.permissions, permission)
end

function TweakData:index_to_permission(index)
	return self.permissions[index]
end

function TweakData:server_state_to_index(state)
	return table.index_of(self.server_states, state)
end

function TweakData:index_to_server_state(index)
	return self.server_states[index]
end

function TweakData:menu_sync_state_to_index(state)
	if not state then
		return false
	end
	for i, menu_sync in ipairs(self.menu_sync_states) do
		if menu_sync == state then
			return i
		end
	end
end

function TweakData:index_to_menu_sync_state(index)
	return self.menu_sync_states[index]
end

function TweakData:init()
	self.difficulties = {
		"easy",
		"normal",
		"hard",
		"overkill",
		"overkill_145",
		"overkill_290"
	}
	self.difficulty_level_locks = {
		0,
		0,
		0,
		0,
		0,
		80
	}
	self.permissions = {
		"public",
		"friends_only",
		"private"
	}
	self.server_states = {
		"in_lobby",
		"loading",
		"in_game"
	}
	self.menu_sync_states = {
		"crimenet",
		"skilltree",
		"options",
		"lobby",
		"blackmarket",
		"blackmarket_weapon",
		"blackmarket_mask",
		"payday"
	}
	self.difficulty_name_ids = {}
	self.difficulty_name_ids.easy = "menu_difficulty_easy"
	self.difficulty_name_ids.normal = "menu_difficulty_normal"
	self.difficulty_name_ids.hard = "menu_difficulty_hard"
	self.difficulty_name_ids.overkill = "menu_difficulty_very_hard"
	self.difficulty_name_ids.overkill_145 = "menu_difficulty_overkill"
	self.difficulty_name_ids.overkill_290 = "menu_difficulty_apocalypse"
	self.hud_icons = HudIconsTweakData:new()
	self._init_wip_hud_icons(self.hud_icons)
	self.weapon = WeaponTweakData:new(self)
	self._init_wip_weapon(self.weapon, self)
	self.weapon_upgrades = WeaponUpgradesTweakData:new()
	self.equipments = EquipmentsTweakData:new()
	self._init_wip_equipments(self.equipments)
	self.player = PlayerTweakData:new()
	self.character = CharacterTweakData:new(self)
	self._init_wip_character(self.character, self)
	self.statistics = StatisticsTweakData:new()
	self.levels = LevelsTweakData:new()
	self._init_wip_levels(self.levels)
	self.narrative = NarrativeTweakData:new()
	self._init_wip_narrative(self.narrative)
	self.group_ai = GroupAITweakData:new(self)
	self.drama = DramaTweakData:new()
	self.upgrades = UpgradesTweakData:new()
	self._init_wip_upgrades(self.upgrades)
	self.skilltree = SkillTreeTweakData:new()
	self._init_wip_skilltree(self.skilltree)
	self.upgrades.visual = UpgradesVisualTweakData:new()
	self.tips = TipsTweakData:new()
	self.money_manager = MoneyTweakData:new(self)
	self._init_wip_money_manager(self.money_manager, self)
	self.blackmarket = BlackMarketTweakData:new(self)
	self._init_wip_blackmarket(self.blackmarket, self)
	self.carry = CarryTweakData:new(self)
	self.mission_door = MissionDoorTweakData:new()
	self.attention = AttentionTweakData:new()
	self.timespeed = TimeSpeedEffectTweakData:new()
	self.sound = SoundTweakData:new()
	self.lootdrop = LootDropTweakData:new(self)
	self._init_wip_lootdrop(self.lootdrop, self)
	self.gui = GuiTweakData:new()
	self._init_wip_gui(self.gui)
	self.assets = AssetsTweakData:new(self)
	self._init_wip_assets(self.assets, self)
	self.dlc = DLCTweakData:new(self)
	self._init_wip_dlc(self.dlc, self)
	self.infamy = InfamyTweakData:new(self)
	self._init_wip_infamy(self.infamy, self)
	self.gage_assignment = GageAssignmentTweakData:new(self)
	self.preplanning = PrePlanningTweakData:new(self)
	self._init_wip_preplanning(self.preplanning, self)
	self.interaction = InteractionTweakData:new(self)
	self._init_wip_interaction(self.interaction, self)
	self.criminals = {}
	self.criminals.character_names = {
		"russian",
		"german",
		"spanish",
		"american"
	}
	self.criminals.characters = {
		{
			name = "american",
			static_data = {
				ai_character_id = "ai_hoxton",
				ssuffix = "d",
				color_id = 1,
				voice = "rb2",
				ai_mask_id = "hoxton",
				mask_id = 1
			}
		},
		{
			name = "german",
			static_data = {
				ai_character_id = "ai_wolf",
				ssuffix = "c",
				color_id = 2,
				voice = "rb3",
				ai_mask_id = "wolf",
				mask_id = 2
			}
		},
		{
			name = "russian",
			static_data = {
				ai_character_id = "ai_dallas",
				ssuffix = "a",
				color_id = 3,
				voice = "rb4",
				ai_mask_id = "dallas",
				mask_id = 3
			}
		},
		{
			name = "spanish",
			static_data = {
				ai_character_id = "ai_chains",
				ssuffix = "b",
				color_id = 4,
				voice = "rb1",
				ai_mask_id = "chains",
				mask_id = 4
			}
		}
	}
	self._init_wip_criminals(self.criminals, self)
	self.EFFECT_QUALITY = 0.5
	if SystemInfo:platform() == Idstring("X360") then
		self.EFFECT_QUALITY = 0.5
	elseif SystemInfo:platform() == Idstring("PS3") then
		self.EFFECT_QUALITY = 0.5
	end
	self:set_scale()
	self:_init_pd2()
	self.menu_themes = {
		old = {
			bg_startscreen = "guis/textures/menu/old_theme/bg_startscreen",
			bg_dlc = "guis/textures/menu/old_theme/bg_dlc",
			bg_setupgame = "guis/textures/menu/old_theme/bg_setupgame",
			bg_creategame = "guis/textures/menu/old_theme/bg_creategame",
			bg_challenge = "guis/textures/menu/old_theme/bg_challenge",
			bg_upgrades = "guis/textures/menu/old_theme/bg_upgrades",
			bg_stats = "guis/textures/menu/old_theme/bg_stats",
			bg_options = "guis/textures/menu/old_theme/bg_options",
			bg_assault = "guis/textures/menu/old_theme/bg_assault",
			bg_sharpshooter = "guis/textures/menu/old_theme/bg_sharpshooter",
			bg_support = "guis/textures/menu/old_theme/bg_support",
			bg_technician = "guis/textures/menu/old_theme/bg_technician",
			bg_lobby_fullteam = "guis/textures/menu/old_theme/bg_lobby_fullteam",
			bg_hoxton = "guis/textures/menu/old_theme/bg_hoxton",
			bg_wolf = "guis/textures/menu/old_theme/bg_wolf",
			bg_dallas = "guis/textures/menu/old_theme/bg_dallas",
			bg_chains = "guis/textures/menu/old_theme/bg_chains",
			background = "guis/textures/menu/old_theme/background"
		},
		fire = {
			bg_startscreen = "guis/textures/menu/fire_theme/bg_startscreen",
			bg_dlc = "guis/textures/menu/fire_theme/bg_dlc",
			bg_setupgame = "guis/textures/menu/fire_theme/bg_setupgame",
			bg_creategame = "guis/textures/menu/fire_theme/bg_creategame",
			bg_challenge = "guis/textures/menu/fire_theme/bg_challenge",
			bg_upgrades = "guis/textures/menu/fire_theme/bg_upgrades",
			bg_stats = "guis/textures/menu/fire_theme/bg_stats",
			bg_options = "guis/textures/menu/fire_theme/bg_options",
			bg_assault = "guis/textures/menu/fire_theme/bg_assault",
			bg_sharpshooter = "guis/textures/menu/fire_theme/bg_sharpshooter",
			bg_support = "guis/textures/menu/fire_theme/bg_support",
			bg_technician = "guis/textures/menu/fire_theme/bg_technician",
			bg_lobby_fullteam = "guis/textures/menu/fire_theme/bg_lobby_fullteam",
			bg_hoxton = "guis/textures/menu/fire_theme/bg_hoxton",
			bg_wolf = "guis/textures/menu/fire_theme/bg_wolf",
			bg_dallas = "guis/textures/menu/fire_theme/bg_dallas",
			bg_chains = "guis/textures/menu/fire_theme/bg_chains",
			background = "guis/textures/menu/fire_theme/background"
		},
		zombie = {
			bg_startscreen = "guis/textures/menu/zombie_theme/bg_startscreen",
			bg_dlc = "guis/textures/menu/fire_theme/bg_dlc",
			bg_setupgame = "guis/textures/menu/zombie_theme/bg_setupgame",
			bg_creategame = "guis/textures/menu/zombie_theme/bg_creategame",
			bg_challenge = "guis/textures/menu/zombie_theme/bg_challenge",
			bg_upgrades = "guis/textures/menu/zombie_theme/bg_upgrades",
			bg_stats = "guis/textures/menu/zombie_theme/bg_stats",
			bg_options = "guis/textures/menu/zombie_theme/bg_options",
			bg_assault = "guis/textures/menu/zombie_theme/bg_assault",
			bg_sharpshooter = "guis/textures/menu/zombie_theme/bg_sharpshooter",
			bg_support = "guis/textures/menu/zombie_theme/bg_support",
			bg_technician = "guis/textures/menu/zombie_theme/bg_technician",
			bg_lobby_fullteam = "guis/textures/menu/zombie_theme/bg_lobby_fullteam",
			bg_hoxton = "guis/textures/menu/zombie_theme/bg_hoxton",
			bg_wolf = "guis/textures/menu/zombie_theme/bg_wolf",
			bg_dallas = "guis/textures/menu/zombie_theme/bg_dallas",
			bg_chains = "guis/textures/menu/zombie_theme/bg_chains",
			background = "guis/textures/menu/zombie_theme/background"
		}
	}
	self.states = {}
	self.states.title = {}
	self.states.title.ATTRACT_VIDEO_DELAY = 90
	self.menu = {}
	self.menu.BRIGHTNESS_CHANGE = 0.05
	self.menu.MIN_BRIGHTNESS = 0.5
	self.menu.MAX_BRIGHTNESS = 1.5
	self.menu.MUSIC_CHANGE = 10
	self.menu.MIN_MUSIC_VOLUME = 0
	self.menu.MAX_MUSIC_VOLUME = 100
	self.menu.SFX_CHANGE = 10
	self.menu.MIN_SFX_VOLUME = 0
	self.menu.MAX_SFX_VOLUME = 100
	self.menu.VOICE_CHANGE = 0.05
	self.menu.MIN_VOICE_VOLUME = 0
	self.menu.MAX_VOICE_VOLUME = 1
	self:set_menu_scale()
	local orange = Vector3(204, 161, 102) / 255
	local green = Vector3(194, 252, 151) / 255
	local brown = Vector3(178, 104, 89) / 255
	local blue = Vector3(120, 183, 204) / 255
	local team_ai = Vector3(0.2, 0.8, 1)
	self.peer_vector_colors = {
		green,
		blue,
		brown,
		orange,
		team_ai
	}
	self.peer_colors = {
		"mrgreen",
		"mrblue",
		"mrbrown",
		"mrorange",
		"mrai"
	}
	self.system_chat_color = Color(255, 255, 212, 0) / 255
	self.chat_colors = {
		Color(self.peer_vector_colors[1]:unpack()),
		Color(self.peer_vector_colors[2]:unpack()),
		Color(self.peer_vector_colors[3]:unpack()),
		Color(self.peer_vector_colors[4]:unpack()),
		Color(self.peer_vector_colors[5]:unpack())
	}
	self.preplanning_peer_colors = {
		Color("ff82991e"),
		Color("ff0055ff"),
		Color("ffff7800"),
		Color("ffffff00")
	}
	self.screen_colors = {}
	self.screen_colors.text = Color(255, 255, 255, 255) / 255
	self.screen_colors.resource = Color(255, 77, 198, 255) / 255
	self.screen_colors.important_1 = Color(255, 255, 51, 51) / 255
	self.screen_colors.important_2 = Color(125, 255, 51, 51) / 255
	self.screen_colors.item_stage_1 = Color(255, 255, 255, 255) / 255
	self.screen_colors.item_stage_2 = Color(255, 89, 115, 128) / 255
	self.screen_colors.item_stage_3 = Color(255, 23, 33, 38) / 255
	self.screen_colors.button_stage_1 = Color(255, 0, 0, 0) / 255
	self.screen_colors.button_stage_2 = Color(255, 77, 198, 255) / 255
	self.screen_colors.button_stage_3 = Color(127, 0, 170, 255) / 255
	self.screen_colors.crimenet_lines = Color(255, 127, 157, 182) / 255
	self.screen_colors.risk = Color(255, 255, 204, 0) / 255
	self.screen_colors.friend_color = Color(255, 41, 204, 122) / 255
	self.screen_colors.regular_color = Color(255, 41, 150, 240) / 255
	self.screen_colors.pro_color = Color(255, 255, 51, 51) / 255
	self.screen_colors.dlc_color = Color(255, 255, 212, 0) / 255
	self.screen_colors.skill_color = Color(255, 77, 198, 255) / 255
	self.screen_colors.ghost_color = Color("4ca6ff")
	self.screen_colors.extra_bonus_color = Color(255, 255, 255, 255) / 255
	self.screen_colors.heat_cold_color = Color(255, 255, 51, 51) / 255
	self.screen_colors.heat_warm_color = Color("ff7f00")
	self.screen_colors.heat_standard_color = Color(255, 255, 255, 255) / 255
	self.screen_colors.heat_color = self.screen_colors.heat_standard_color
	self.screen_colors.stats_positive = Color(255, 191, 221, 125) / 255
	self.screen_colors.stats_negative = Color(255, 254, 93, 99) / 255
	self.screen_colors.stats_mods = Color(255, 229, 229, 76) / 255
	if Global.test_new_colors then
		for i, d in pairs(self.screen_colors) do
			self.screen_colors[i] = Color.purple
		end
	end
	if Global.old_colors_purple then
		self.screen_color_white = Color.purple
		self.screen_color_red = Color.purple
		self.screen_color_green = Color.purple
		self.screen_color_grey = Color.purple
		self.screen_color_light_grey = Color.purple
		self.screen_color_blue = Color.purple
		self.screen_color_blue_selected = Color.purple
		self.screen_color_blue_highlighted = Color.purple
		self.screen_color_blue_noselected = Color.purple
		self.screen_color_yellow = Color.purple
		self.screen_color_yellow_selected = Color.purple
		self.screen_color_yellow_noselected = Color.purple
	else
		self.screen_color_white = Color(1, 1, 1)
		self.screen_color_red = Color(0.7137255, 0.24705882, 0.21176471)
		self.screen_color_green = Color(0.1254902, 1, 0.5176471)
		self.screen_color_grey = Color(0.39215687, 0.39215687, 0.39215687)
		self.screen_color_light_grey = Color(0.78431374, 0.78431374, 0.78431374)
		self.screen_color_blue = Color(0.3019608, 0.7764706, 1)
		self.screen_color_blue_selected = Color(0.3019608, 0.7764706, 1)
		self.screen_color_blue_highlighted = self.screen_color_blue_selected:with_alpha(0.75)
		self.screen_color_blue_noselected = self.screen_color_blue_selected:with_alpha(0.5)
		self.screen_color_yellow = Color(0.8627451, 0.6745098, 0.1764706)
		self.screen_color_yellow_selected = Color(1, 0.8, 0)
		self.screen_color_yellow_noselected = Color(0.73333335, 0.42745098, 0.078431375)
	end
	self.dialog = {}
	self.dialog.WIDTH = 400
	self.dialog.HEIGHT = 300
	self.dialog.PADDING = 30
	self.dialog.BUTTON_PADDING = 5
	self.dialog.BUTTON_SPACING = 10
	self.dialog.FONT = self.menu.default_font
	self.dialog.BG_COLOR = self.menu.default_menu_background_color
	self.dialog.TITLE_TEXT_COLOR = Color(1, 1, 1, 1)
	self.dialog.TEXT_COLOR = self.menu.default_font_row_item_color
	self.dialog.BUTTON_BG_COLOR = Color(0, 0.5, 0.5, 0.5)
	self.dialog.BUTTON_TEXT_COLOR = self.menu.default_font_row_item_color
	self.dialog.SELECTED_BUTTON_BG_COLOR = self.menu.default_font_row_item_color
	self.dialog.SELECTED_BUTTON_TEXT_COLOR = self.menu.default_hightlight_row_item_color
	self.dialog.TITLE_SIZE = self.menu.topic_font_size
	self.dialog.TEXT_SIZE = self.menu.dialog_text_font_size
	self.dialog.BUTTON_SIZE = self.menu.dialog_title_font_size
	self.dialog.TITLE_TEXT_SPACING = 20
	self.dialog.BUTTON_TEXT_SPACING = 3
	self.dialog.DEFAULT_PRIORITY = 1
	self.dialog.MINIMUM_DURATION = 2
	self.dialog.DURATION_PER_CHAR = 0.07
	self.hud = {}
	self:set_hud_values()
	self.gui = self.gui or {}
	self.gui.BOOT_SCREEN_LAYER = 1
	self.gui.TITLE_SCREEN_LAYER = 1
	self.gui.MENU_LAYER = 200
	self.gui.MENU_COMPONENT_LAYER = 300
	self.gui.ATTRACT_SCREEN_LAYER = 400
	self.gui.LOADING_SCREEN_LAYER = 1000
	self.gui.CRIMENET_CHAT_LAYER = 1000
	self.gui.DIALOG_LAYER = 1100
	self.gui.MOUSE_LAYER = 1200
	self.gui.SAVEFILE_LAYER = 1400
	self.overlay_effects = {}
	self.overlay_effects.spectator = {
		blend_mode = "normal",
		sustain = nil,
		fade_in = 3,
		fade_out = 2,
		color = Color(1, 0, 0, 0),
		timer = TimerManager:main(),
		play_paused = true
	}
	self.overlay_effects.level_fade_in = {
		blend_mode = "normal",
		sustain = 1,
		fade_in = 0,
		fade_out = 3,
		color = Color(1, 0, 0, 0),
		timer = TimerManager:game(),
		play_paused = true
	}
	self.overlay_effects.fade_in = {
		blend_mode = "normal",
		sustain = 0,
		fade_in = 0,
		fade_out = 3,
		color = Color(1, 0, 0, 0),
		timer = TimerManager:main(),
		play_paused = true
	}
	self.overlay_effects.fade_out = {
		blend_mode = "normal",
		sustain = 30,
		fade_in = 3,
		fade_out = 0,
		color = Color(1, 0, 0, 0),
		timer = TimerManager:main(),
		play_paused = true
	}
	self.overlay_effects.fade_out_permanent = {
		blend_mode = "normal",
		fade_in = 1,
		fade_out = 0,
		color = Color(1, 0, 0, 0),
		timer = TimerManager:main(),
		play_paused = true
	}
	self.overlay_effects.fade_out_in = {
		blend_mode = "normal",
		sustain = 1,
		fade_in = 1,
		fade_out = 1,
		color = Color(1, 0, 0, 0),
		timer = TimerManager:main(),
		play_paused = true
	}
	self.overlay_effects.element_fade_in = {
		blend_mode = "normal",
		sustain = 0,
		fade_in = 0,
		fade_out = 3,
		color = Color(1, 0, 0, 0),
		timer = TimerManager:main(),
		play_paused = true
	}
	self.overlay_effects.element_fade_out = {
		blend_mode = "normal",
		sustain = 0,
		fade_in = 3,
		fade_out = 0,
		color = Color(1, 0, 0, 0),
		timer = TimerManager:main(),
		play_paused = true
	}
	local d_color = Color(0.75, 1, 1, 1)
	local d_sustain = 0.1
	local d_fade_out = 0.9
	self.overlay_effects.damage = {
		blend_mode = "add",
		sustain = d_sustain,
		fade_in = 0,
		fade_out = d_fade_out,
		color = d_color
	}
	self.overlay_effects.damage_left = {
		blend_mode = "add",
		sustain = d_sustain,
		fade_in = 0,
		fade_out = d_fade_out,
		color = d_color,
		gradient_points = {
			0,
			d_color,
			0.1,
			d_color,
			0.15,
			Color():with_alpha(0),
			1,
			Color():with_alpha(0)
		},
		orientation = "horizontal"
	}
	self.overlay_effects.damage_right = {
		blend_mode = "add",
		sustain = d_sustain,
		fade_in = 0,
		fade_out = d_fade_out,
		color = d_color,
		gradient_points = {
			1,
			d_color,
			0.9,
			d_color,
			0.85,
			Color():with_alpha(0),
			0,
			Color():with_alpha(0)
		},
		orientation = "horizontal"
	}
	self.overlay_effects.damage_up = {
		blend_mode = "add",
		sustain = d_sustain,
		fade_in = 0,
		fade_out = d_fade_out,
		color = d_color,
		gradient_points = {
			0,
			d_color,
			0.1,
			d_color,
			0.15,
			Color():with_alpha(0),
			1,
			Color():with_alpha(0)
		},
		orientation = "vertical"
	}
	self.overlay_effects.damage_down = {
		blend_mode = "add",
		sustain = d_sustain,
		fade_in = 0,
		fade_out = d_fade_out,
		color = d_color,
		gradient_points = {
			1,
			d_color,
			0.9,
			d_color,
			0.85,
			Color():with_alpha(0),
			0,
			Color():with_alpha(0)
		},
		orientation = "vertical"
	}
	self.overlay_effects.maingun_zoomed = {
		blend_mode = "add",
		sustain = 0,
		fade_in = 0,
		fade_out = 0.4,
		color = Color(0.1, 1, 1, 1)
	}
	self.materials = {}
	self.materials[Idstring("concrete"):key()] = "concrete"
	self.materials[Idstring("ceramic"):key()] = "ceramic"
	self.materials[Idstring("marble"):key()] = "marble"
	self.materials[Idstring("flesh"):key()] = "flesh"
	self.materials[Idstring("parket"):key()] = "parket"
	self.materials[Idstring("sheet_metal"):key()] = "sheet_metal"
	self.materials[Idstring("iron"):key()] = "iron"
	self.materials[Idstring("wood"):key()] = "wood"
	self.materials[Idstring("gravel"):key()] = "gravel"
	self.materials[Idstring("cloth"):key()] = "cloth"
	self.materials[Idstring("cloth_no_decal"):key()] = "cloth"
	self.materials[Idstring("cloth_stuffed"):key()] = "cloth_stuffed"
	self.materials[Idstring("dirt"):key()] = "dirt"
	self.materials[Idstring("grass"):key()] = "grass"
	self.materials[Idstring("carpet"):key()] = "carpet"
	self.materials[Idstring("metal"):key()] = "metal"
	self.materials[Idstring("glass_breakable"):key()] = "glass_breakable"
	self.materials[Idstring("glass_unbreakable"):key()] = "glass_unbreakable"
	self.materials[Idstring("glass_no_decal"):key()] = "glass_unbreakable"
	self.materials[Idstring("rubber"):key()] = "rubber"
	self.materials[Idstring("plastic"):key()] = "plastic"
	self.materials[Idstring("asphalt"):key()] = "asphalt"
	self.materials[Idstring("foliage"):key()] = "foliage"
	self.materials[Idstring("stone"):key()] = "stone"
	self.materials[Idstring("sand"):key()] = "sand"
	self.materials[Idstring("thin_layer"):key()] = "thin_layer"
	self.materials[Idstring("no_decal"):key()] = "silent_material"
	self.materials[Idstring("plaster"):key()] = "plaster"
	self.materials[Idstring("no_material"):key()] = "no_material"
	self.materials[Idstring("paper"):key()] = "paper"
	self.materials[Idstring("metal_hollow"):key()] = "metal_hollow"
	self.materials[Idstring("metal_chassis"):key()] = "metal_chassis"
	self.materials[Idstring("metal_catwalk"):key()] = "metal_catwalk"
	self.materials[Idstring("hardwood"):key()] = "hardwood"
	self.materials[Idstring("fence"):key()] = "fence"
	self.materials[Idstring("steel"):key()] = "steel"
	self.materials[Idstring("steel_no_decal"):key()] = "steel"
	self.materials[Idstring("tile"):key()] = "tile"
	self.materials[Idstring("water_deep"):key()] = "water_deep"
	self.materials[Idstring("water_puddle"):key()] = "water_puddle"
	self.materials[Idstring("water_shallow"):key()] = "water_shallow"
	self.materials[Idstring("shield"):key()] = "shield"
	self.materials[Idstring("heavy_swat_steel_no_decal"):key()] = "shield"
	self.screen = {}
	self.screen.fadein_delay = 1
	self.experience_manager = {}
	self.experience_manager.values = {}
	self.experience_manager.values.size02 = 0
	self.experience_manager.values.size03 = 10
	self.experience_manager.values.size04 = 15
	self.experience_manager.values.size06 = 25
	self.experience_manager.values.size08 = 40
	self.experience_manager.values.size10 = 80
	self.experience_manager.values.size12 = 100
	self.experience_manager.values.size14 = 150
	self.experience_manager.values.size16 = 250
	self.experience_manager.values.size18 = 500
	self.experience_manager.values.size20 = 1000
	self.experience_manager.loot_drop_value = {}
	self.experience_manager.loot_drop_value.xp10 = 2000
	self.experience_manager.loot_drop_value.xp20 = 4000
	self.experience_manager.loot_drop_value.xp30 = 6000
	self.experience_manager.loot_drop_value.xp40 = 10000
	self.experience_manager.loot_drop_value.xp50 = 12000
	self.experience_manager.loot_drop_value.xp60 = 15000
	self.experience_manager.loot_drop_value.xp70 = 20000
	self.experience_manager.loot_drop_value.xp80 = 24000
	self.experience_manager.loot_drop_value.xp90 = 28000
	self.experience_manager.loot_drop_value.xp100 = 32000
	self.experience_manager.stage_completion = {
		0,
		0,
		0,
		0,
		0,
		0,
		0
	}
	self.experience_manager.job_completion = {
		2000,
		4000,
		10000,
		16000,
		20000,
		28000,
		32000
	}
	self.experience_manager.stage_failed_multiplier = 0.01
	self.experience_manager.in_custody_multiplier = 0.7
	self.experience_manager.difficulty_multiplier = {
		2,
		5,
		10,
		13
	}
	self.experience_manager.alive_humans_multiplier = {
		1,
		1.1,
		1.2,
		1.3
	}
	self.experience_manager.limited_bonus_multiplier = 1
	self.experience_manager.level_limit = {}
	self.experience_manager.level_limit.low_cap_level = -1
	self.experience_manager.level_limit.low_cap_multiplier = 0.75
	self.experience_manager.level_limit.pc_difference_multipliers = {
		0.9,
		0.8,
		0.7,
		0.6,
		0.5,
		0.4,
		0.3,
		0.2,
		0.1,
		0.01
	}
	self.experience_manager.civilians_killed = 0
	self.experience_manager.day_multiplier = {
		1,
		1,
		1,
		4,
		5,
		6,
		7
	}
	self.experience_manager.pro_day_multiplier = {
		1,
		1,
		1,
		5.5,
		7,
		8.5,
		10
	}
	self.experience_manager.total_level_objectives = 500
	self.experience_manager.total_criminals_finished = 50
	self.experience_manager.total_objectives_finished = 500
	local multiplier = 1
	self.experience_manager.levels = {}
	self.experience_manager.levels[1] = {
		points = 900 * multiplier
	}
	self.experience_manager.levels[2] = {
		points = 1250 * multiplier
	}
	self.experience_manager.levels[3] = {
		points = 1550 * multiplier
	}
	self.experience_manager.levels[4] = {
		points = 1850 * multiplier
	}
	self.experience_manager.levels[5] = {
		points = 2200 * multiplier
	}
	self.experience_manager.levels[6] = {
		points = 2600 * multiplier
	}
	self.experience_manager.levels[7] = {
		points = 3000 * multiplier
	}
	self.experience_manager.levels[8] = {
		points = 3500 * multiplier
	}
	self.experience_manager.levels[9] = {
		points = 4000 * multiplier
	}
	local exp_step_start = 10
	local exp_step_end = 100
	local exp_step = 1 / (exp_step_end - exp_step_start)
	local exp_step_last_points = 4600
	local exp_step_curve = 3
	for i = exp_step_start, exp_step_end do
		self.experience_manager.levels[i] = {
			points = math.round((1000000 - exp_step_last_points) * math.pow(exp_step * (i - exp_step_start), exp_step_curve) + exp_step_last_points) * multiplier
		}
	end
	local exp_step_start = 5
	local exp_step_end = 193
	local exp_step = 1 / (exp_step_end - exp_step_start)
	for i = 146, exp_step_end do
		self.experience_manager.levels[i] = {
			points = math.round(22000 * (exp_step * (i - exp_step_start)) - 6000) * multiplier
		}
	end
	self.achievement = {}
	self.achievement.im_a_healer_tank_damage_dealer = 10
	self.achievement.iron_man = "level_7"
	self.achievement.going_places = 1000000
	self.achievement.spend_money_to_make_money = 1000000
	self.achievement.you_gotta_start_somewhere = 5
	self.achievement.guilty_of_crime = 10
	self.achievement.gone_in_30_seconds = 25
	self.achievement.armed_and_dangerous = 50
	self.achievement.big_shot = 75
	self.achievement.most_wanted = 100
	self.achievement.fully_loaded = 9
	self.achievement.weapon_collector = 18
	self.achievement.arms_dealer = 72
	self.achievement.how_do_you_like_me_now = "level_1"
	self.achievement.like_an_angry_bear = "bear"
	self.achievement.merry_christmas = "santa_happy"
	self.achievement.witch_doctor = {
		mask = "witch",
		stat = "halloween_4_stats"
	}
	self.achievement.its_alive_its_alive = {
		mask = "frank",
		stat = "halloween_5_stats"
	}
	self.achievement.pump_action = {
		mask = "pumpkin_king",
		stat = "halloween_6_stats"
	}
	self.achievement.cant_hear_you_scream = {
		mask = "venomorph",
		stat = "halloween_7_stats"
	}
	self.achievement.unique_selling_point = "usp"
	self.achievement.relation_with_bulldozer = {
		mask = "clinton",
		stat = "armored_8_stat"
	}
	self.achievement.no_we_cant = {
		mask = "obama",
		stat = "armored_10_stat"
	}
	self.achievement.heat_around_the_corner = "heat"
	self.achievement.fire_in_the_hole = {
		grenade = "frag",
		stat = "gage_9_stats"
	}
	self.achievement.infamous = {
		"ignominy_1",
		"ignominy_2",
		"ignominy_3",
		"ignominy_4",
		"ignominy_5"
	}
	self.achievement.final_rule = {
		stat = "gage2_3_stats",
		melee_type = "fists",
		heist = "nightclub"
	}
	self.achievement.easy_as_breathing = {
		award = "gage2_4",
		count = 10,
		weapon_type = "lmg"
	}
	self.achievement.first_blood = {
		award = "gage2_5",
		weapon_type = "lmg",
		count = 220
	}
	self.achievement.in_town_you_are_law = {award = "gage2_6", weapon_type = "shotgun"}
	self.achievement.dont_push_it = {award = "gage2_7", weapon = "deagle"}
	self.achievement.finally = {award = "gage2_8"}
	self.achievement.demise_knuckles = "brass_knuckles"
	self.achievement.vote_for_change = "g22c"
	self.achievement.steam_500k = "akm_gold"
	self.achievement.shotgun_one_o_one = {
		count = 50,
		accuracy = 101,
		award = "gage4_5"
	}
	self.achievement.close_and_personal = {
		award = "gage4_3",
		kill_type = "melee",
		count = 50
	}
	self.achievement.one_man_army = {
		award = "gage5_3",
		equipped = {
			primary = "gre_m79",
			secondary = "serbu",
			armor = "level_7"
		}
	}
	self.achievement.weapons_owned = {
		gage4_2 = {
			"huntsman",
			"r870",
			"saiga",
			"ksg",
			"striker",
			"serbu",
			"benelli"
		},
		gage5_4 = {
			"gre_m79",
			"g3",
			"galil",
			"famas"
		}
	}
	self.achievement.gage_assignments = {
		green_mantis = "gmod_1_stats",
		yellow_bull = "gmod_2_stats",
		red_spider = "gmod_3_stats",
		blue_eagle = "gmod_4_stats",
		purple_snake = "gmod_5_stats"
	}
	self.achievement.gonna_find_them_all = 1
	self.achievement.weapon_blueprints = {
		gmod_7 = {
			"wpn_fps_upg_fg_jp",
			"wpn_fps_upg_m4_m_quad",
			"wpn_fps_upg_ass_ns_jprifles"
		},
		gmod_8 = {
			"wpn_fps_upg_o_rmr",
			"wpn_fps_upg_pis_ns_flash"
		},
		gmod_9 = {
			"wpn_fps_upg_fg_smr",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_o_eotech_xps",
			"wpn_fps_upg_m4_s_crane",
			"wpn_fps_upg_fl_ass_peq15"
		},
		gmod_10 = {
			"wpn_fps_upg_fg_midwest",
			"wpn_fps_upg_ak_b_draco",
			"wpn_fps_upg_ak_m_quad",
			"wpn_fps_upg_ass_ns_linear"
		}
	}
	self.achievement.explosion_achievements = {
		shock_awe = {
			count = 4,
			weapon_type = "shotgun",
			award = "gage4_9"
		}
	}
	self.achievement.grenade_achievements = {
		bada_boom = {
			count = 4,
			grenade_type = "launcher_frag",
			award = "gage5_2",
			kill = true
		},
		artillery_barrage = {
			grenade_type = "launcher_frag",
			stat = "gage5_5_stats",
			distance = 4000,
			kill = true
		},
		boom_shakalaka = {
			grenade_type = "launcher_frag",
			award = "gage5_7",
			enemy = "spooc",
			flying_strike = true,
			kill = true
		}
	}
	self.achievement.enemy_kill_achievements = {
		try_out_your_usp = {
			weapon = "usp",
			stat = "halloween_8_stats"
		},
		license_to_kill = {
			weapon = "ppk",
			stat = "armored_5_stat"
		},
		im_not_a_crook = {
			mask = "nixon",
			weapon = "s552",
			enemy = "sniper",
			stat = "armored_7_stat"
		},
		fool_me_once = {
			mask = "bush",
			weapon = "m45",
			enemy = "shield",
			stat = "armored_9_stat"
		},
		wanted = {
			mask = "goat",
			weapon = "ak5",
			stat = "gage_1_stats"
		},
		three_thousand_miles = {
			mask = "panda",
			weapon = "p90",
			stat = "gage_2_stats"
		},
		commando = {
			mask = "pitbull",
			weapon = "aug",
			stat = "gage_3_stats"
		},
		public_enemies = {
			mask = "eagle",
			weapon = "colt_1911",
			stat = "gage_4_stats"
		},
		inception = {
			weapon = "scar",
			stat = "gage_5_stats"
		},
		hard_corps = {
			weapon = "mp7",
			stat = "gage_6_stats"
		},
		above_the_law = {
			weapon = "p226",
			stat = "gage_7_stats"
		},
		surprise_motherfucker = {
			weapon = "m95",
			stat = "gage3_12_stats",
			enemy = "tank"
		},
		man_with_golden_gun = {
			stat = "gage3_2_stats",
			weapon = "akm_gold",
			enemy = "tank",
			enemy_weapon = "m249"
		},
		lord_of_flies = {
			stat = "gage3_3_stats",
			in_head = true,
			weapons = {
				"m95",
				"msr",
				"r93"
			}
		},
		arachnes_curse = {
			stat = "gage3_4_stats",
			in_head = true,
			weapons = {
				"m95",
				"msr",
				"r93"
			}
		},
		pest_control = {
			stat = "gage3_5_stats",
			in_head = true,
			weapons = {
				"m95",
				"msr",
				"r93"
			}
		},
		seer_of_death = {
			stat = "gage3_6_stats",
			in_head = true,
			weapons = {
				"m95",
				"msr",
				"r93"
			}
		},
		far_far_away = {
			stat = "gage3_7_stats",
			distance = 4000,
			weapon = "m95"
		},
		last_action_villian = {
			award = "gage3_8",
			in_head = true,
			on_zipline = true,
			weapon = "r93"
		},
		dodge_this = {
			stat = "gage3_11_stats",
			in_head = true,
			enemy = "spooc",
			weapon = "m95"
		},
		didnt_see_this_coming = {
			stat = "gage3_13_stats",
			on_zipline = true,
			weapons = {
				"m95",
				"msr",
				"r93"
			}
		},
		grand_master_sniper = {
			stat = "gage3_14_stats",
			enemy = "sniper",
			weapon = "msr"
		},
		public_enemy_no_one = {
			stat = "gage3_17_stats",
			weapon = "msr"
		},
		knock_knock = {
			stat = "gage4_6_stats",
			enemy = "shield",
			weapon_type = "shotgun",
			part_id = "wpn_fps_upg_a_slug"
		},
		peek_a_boo = {
			stat = "gage4_8_stats",
			enemy = "sniper",
			weapon_type = "shotgun",
			part_id = "wpn_fps_upg_a_piercing"
		},
		seven_eleven = {
			award = "gage4_4",
			weapon_type = "shotgun",
			in_head = true,
			timer = 11,
			count = 7
		},
		bang_for_buck = {
			stat = "gage4_10_stats",
			enemy = "tank",
			weapon_type = "shotgun",
			part_id = "wpn_fps_upg_a_custom"
		},
		grind_fest = {
			stat = "gage5_1_stats",
			enemy = "tank",
			weapon = "g3"
		},
		kill_streak = {
			stat = "gage5_9_stats",
			enemy = "spooc",
			weapon = "galil"
		},
		le_picnic = {
			stat = "gage5_10_stats",
			weapon = "famas"
		}
	}
	self.achievement.enemy_melee_kill_achievements = {
		cloak_n_dagger = {
			award = "gage2_2",
			enemy = "spooc",
			melee_type = "knife"
		},
		are_you_kidding_me = {
			award = "gage2_10",
			enemy = "tank",
			melee_type = "knife"
		},
		no_time_to_bleed = {
			stat = "gage2_9_stats",
			enemies = {
				"fbi_swat",
				"fbi_heavy_swat"
			},
			melee_type = "knife",
			difficulty = {
				"overkill_145",
				"overkill_290"
			},
			health = 25
		},
		police_brutality = {
			award = "gage4_1",
			enemy = "shield",
			melee_id = "baton"
		},
		every_day_shovelin = {
			stat = "gage4_7_stats",
			level_id = "nightclub",
			melee_id = "shovel",
			is_cop = true
		},
		cant_touch_this = {
			stat = "gage5_8_stats",
			melee_id = "dingdong",
			is_gangster = true
		},
		hurting_people = {
			stat = "pig_3_stats",
			melee_id = "baseballbat",
			job_id = "mia"
		}
	}
	self.achievement.complete_heist_achievements = {
		in_soviet_russia = {
			stat = "halloween_10_stats",
			mask = "bear",
			difficulty = {
				"overkill_145",
				"overkill_290"
			},
			contract = "vlad"
		},
		i_take_scores = {
			stat = "armored_4_stat",
			mask = "heat",
			difficulty = {
				"overkill_145",
				"overkill_290"
			},
			jobs = {
				"arm_cro",
				"arm_und",
				"arm_hcm",
				"arm_par",
				"arm_fac"
			}
		},
		eco_round = {
			award = "charliesierra_7",
			no_shots = "primaries",
			difficulty = {
				"overkill_145",
				"overkill_290"
			},
			job = "roberts"
		},
		death_ukranian = {
			award = "death_1",
			difficulty = {
				"overkill_290"
			},
			job = "ukrainian_job_prof"
		},
		death_mallcrasher = {
			award = "death_2",
			difficulty = {
				"overkill_290"
			},
			job = "mallcrasher"
		},
		death_four_stores = {
			award = "death_3",
			difficulty = {
				"overkill_290"
			},
			job = "four_stores"
		},
		death_nightclub = {
			award = "death_4",
			difficulty = {
				"overkill_290"
			},
			job = "nightclub"
		},
		death_watchdogs = {
			award = "death_34",
			difficulty = {
				"overkill_290"
			},
			job = "watchdogs"
		},
		death_watchdogs_prof = {
			award = "death_6",
			difficulty = {
				"overkill_290"
			},
			job = "watchdogs_prof"
		},
		death_rats = {
			award = "death_33",
			difficulty = {
				"overkill_290"
			},
			job = "alex"
		},
		death_rats_prof = {
			award = "death_7",
			difficulty = {
				"overkill_290"
			},
			job = "alex_prof"
		},
		death_firestarter = {
			award = "death_32",
			difficulty = {
				"overkill_290"
			},
			job = "firestarter"
		},
		death_firestarter_prof = {
			award = "death_8",
			difficulty = {
				"overkill_290"
			},
			job = "firestarter_prof"
		},
		death_framing_frame = {
			award = "death_35",
			difficulty = {
				"overkill_290"
			},
			job = "framing_frame"
		},
		death_framing_frame_prof = {
			award = "death_10",
			difficulty = {
				"overkill_290"
			},
			job = "framing_frame_prof"
		},
		death_big_oil = {
			award = "death_11",
			difficulty = {
				"overkill_290"
			},
			job = "welcome_to_the_jungle_prof"
		},
		death_jewelry_store = {
			award = "death_13",
			difficulty = {
				"overkill_290"
			},
			job = "jewelry_store"
		},
		death_diamond_store = {
			award = "death_14",
			difficulty = {
				"overkill_290"
			},
			job = "family"
		},
		death_go_bank = {
			award = "death_15",
			difficulty = {
				"overkill_290"
			},
			job = "roberts"
		},
		death_bank_heist = {
			award = "death_16",
			difficulty = {
				"overkill_290"
			},
			job = "branchbank_prof"
		},
		death_bank_heist_gold = {
			award = "death_17",
			difficulty = {
				"overkill_290"
			},
			job = "branchbank_gold_prof"
		},
		death_bank_heist_cash = {
			award = "death_18",
			difficulty = {
				"overkill_290"
			},
			job = "branchbank_cash"
		},
		death_bank_heist_deposit = {
			award = "death_19",
			difficulty = {
				"overkill_290"
			},
			job = "branchbank_deposit"
		},
		death_transport_crossroads = {
			award = "death_20",
			difficulty = {
				"overkill_290"
			},
			job = "arm_cro"
		},
		death_transport_downtown = {
			award = "death_21",
			difficulty = {
				"overkill_290"
			},
			job = "arm_hcm"
		},
		death_transport_harbor = {
			award = "death_22",
			difficulty = {
				"overkill_290"
			},
			job = "arm_fac"
		},
		death_transport_park = {
			award = "death_23",
			difficulty = {
				"overkill_290"
			},
			job = "arm_par"
		},
		death_transport_underpass = {
			award = "death_24",
			difficulty = {
				"overkill_290"
			},
			job = "arm_und"
		},
		death_transport_train = {
			award = "death_25",
			difficulty = {
				"overkill_290"
			},
			job = "arm_for"
		},
		death_election_day = {
			award = "bob_9",
			difficulty = {
				"overkill_290"
			},
			job = "election_day"
		},
		death_election_day_prof = {
			award = "bob_2",
			difficulty = {
				"overkill_290"
			},
			job = "election_day_prof"
		},
		death_kosugi = {
			award = "kosugi_6",
			difficulty = {
				"overkill_290"
			},
			job = "kosugi"
		},
		death_bigbank = {
			award = "bigbank_9",
			difficulty = {
				"overkill_290"
			},
			job = "big"
		},
		death_miami = {
			award = "pig_1",
			difficulty = {
				"overkill_290"
			},
			job = "mia"
		},
		death_miami_prof = {
			award = "pig_6",
			difficulty = {
				"overkill_290"
			},
			job = "mia_prof"
		},
		not_for_old_men = {
			award = "gage4_11",
			full_jobs_id = {
				"framing_frame",
				"framing_frame_prof"
			},
			stealth = true,
			equipped = {
				secondaries = {
					weapon_id = "serbu",
					blueprint = {
						{
							"wpn_fps_upg_ns_shot_thick"
						}
					}
				}
			}
		}
	}
	self.achievement.job_list = {}
	self.achievement.job_list.vlad = {
		"ukrainian_job_prof",
		"mallcrasher",
		"four_stores",
		"nightclub"
	}
	self.achievement.job_list.hector = {
		"watchdogs",
		"watchdogs_prof",
		"alex",
		"alex_prof",
		"firestarter",
		"firestarter_prof"
	}
	self.achievement.job_list.elephant = {
		"framing_frame",
		"framing_frame_prof",
		"welcome_to_the_jungle_prof",
		"election_day",
		"election_day_prof"
	}
	self.achievement.job_list.bain = {
		"jewelry_store",
		"family",
		"roberts",
		"branchbank_prof",
		"branchbank_gold_prof",
		"branchbank_cash",
		"branchbank_deposit",
		"arm_cro",
		"arm_hcm",
		"arm_fac",
		"arm_par",
		"arm_und",
		"kosugi"
	}
	self.achievement.job_list.dentist = {
		"big",
		"mia",
		"mia_prof"
	}
	self.achievement.complete_heist_stats_achievements = {
		death_vlad = {
			award = "death_5",
			difficulty = "overkill_290",
			contact = "vlad"
		},
		death_hector = {
			award = "death_9",
			difficulty = "overkill_290",
			contact = "hector"
		},
		death_elephant = {
			award = "death_12",
			difficulty = "overkill_290",
			contact = "elephant"
		},
		death_bain = {
			award = "death_26",
			difficulty = "overkill_290",
			contact = "bain"
		},
		skull_hard = {
			award = "death_27",
			difficulty = "hard",
			contact = "all"
		},
		skull_very_hard = {
			award = "death_28",
			difficulty = "overkill",
			contact = "all"
		},
		skull_overkill = {
			award = "death_29",
			difficulty = "overkill_145",
			contact = "all"
		},
		skull_deathwish = {
			award = "death_30",
			difficulty = "overkill_290",
			contact = "all"
		}
	}
	self.achievement.four_mask_achievements = {
		reindeer_games = {
			award = "charliesierra_9",
			masks = {
				"santa_happy",
				"santa_mad",
				"santa_drunk",
				"santa_surprise"
			}
		},
		ghost_riders = {
			award = "bob_10",
			masks = {
				"skullhard",
				"skullveryhard",
				"skulloverkill",
				"skulloverkillplus"
			}
		},
		funding_father = {
			award = "bigbank_10",
			masks = {
				"franklin",
				"lincoln",
				"grant",
				"washington"
			}
		},
		go_bananas = {
			award = "gage4_12",
			jobs = {"alex", "alex_prof"},
			difficulties = {
				"overkill_145",
				"overkill_290"
			},
			masks = {
				"silverback",
				"mandril",
				"skullmonkey",
				"orangutang"
			}
		},
		animal_fight = {
			award = "pig_5",
			jobs = {"mia"},
			difficulties = {
				"hard",
				"overkill",
				"overkill_145",
				"overkill_290"
			},
			masks = {
				"white_wolf",
				"owl",
				"rabbit",
				"pig"
			}
		},
		guy_with_gun = {
			award = "gage5_6",
			jobs = {
				"watchdogs",
				"watchdogs_prof"
			},
			difficulties = {
				"overkill_145",
				"overkill_290"
			},
			masks = {
				"galax",
				"crowgoblin",
				"evil",
				"volt"
			}
		}
	}
	self.achievement.sniper_kill_achievements = {
		did_i_do_that = {award = "gage3_9", multi_kill = 3},
		max_peneration = {
			stat = "gage3_10_stats",
			weapon = "r93",
			obstacle = "shield",
			enemy = "shield"
		},
		you_cant_hide = {
			stat = "gage3_15_stats",
			weapon = "r93",
			obstacle = "wall"
		},
		two_for_one = {
			stat = "gage3_16_stats",
			weapon = "msr",
			multi_kill = 2
		}
	}
	local gage_5_1_achievement = {
		text_id = "bm_wp_gage5_1_achievment",
		stat = "gage5_1_stats",
		max_progress = 25
	}
	local gage_5_2_achievement = {
		text_id = "bm_wp_gage5_2_achievment",
		award = "gage5_2"
	}
	local gage_5_3_achievement = {
		text_id = "bm_wp_gage5_3_achievment",
		award = "gage5_3"
	}
	local gage_5_4_achievement = {
		text_id = "bm_wp_gage5_4_achievment",
		award = "gage5_4"
	}
	local gage_5_5_achievement = {
		text_id = "bm_wp_gage5_5_achievment",
		stat = "gage5_5_stats",
		max_progress = 25
	}
	local gage_5_6_achievement = {
		text_id = "bm_wp_gage5_6_achievment",
		award = "gage5_6"
	}
	local gage_5_7_achievement = {
		text_id = "bm_wp_gage5_7_achievment",
		award = "gage5_7"
	}
	local gage_5_9_achievement = {
		text_id = "bm_wp_gage5_9_achievment",
		stat = "gage5_9_stats",
		max_progress = 10
	}
	local gage_5_10_achievement = {
		text_id = "bm_wp_gage5_10_achievment",
		stat = "gage5_10_stats",
		max_progress = 200
	}
	local pig_1_achievement = {
		text_id = "bm_wp_pig_1_achievment",
		award = "pig_1"
	}
	local pig_2_achievement = {
		text_id = "bm_wp_pig_2_achievment",
		award = "pig_2"
	}
	local pig_3_achievement = {
		text_id = "bm_wp_pig_3_achievment",
		stat = "pig_3_stats",
		max_progress = 25
	}
	local pig_4_achievement = {
		text_id = "bm_wp_pig_4_achievment",
		award = "pig_4"
	}
	local pig_5_achievement = {
		text_id = "bm_wp_pig_5_achievment",
		award = "pig_5"
	}
	self.achievement.mask_tracker = {}
	self.achievement.weapon_part_tracker = {
		wpn_fps_snp_m95_barrel_long = {
			text_id = "bm_wp_m95_b_barrel_long_achievment",
			stat = "gage3_7_stats",
			max_progress = 25
		},
		wpn_fps_snp_r93_b_suppressed = {
			text_id = "bm_wp_r93_b_suppressed_achievment",
			award = "gage3_8"
		},
		wpn_fps_upg_o_45iron = {
			text_id = "bm_wp_upg_o_45iron_achievment",
			award = "gage3_9"
		},
		wpn_fps_snp_r93_b_short = {
			text_id = "bm_wp_r93_b_short_achievment",
			stat = "gage3_10_stats",
			max_progress = 10
		},
		wpn_fps_snp_m95_barrel_suppressed = {
			text_id = "bm_wp_m95_b_barrel_suppressed_achievment",
			stat = "gage3_11_stats",
			max_progress = 10
		},
		wpn_fps_snp_m95_barrel_short = {
			text_id = "bm_wp_m95_b_barrel_short_achievment",
			award = "gage3_12_stats",
			max_progress = 10
		},
		wpn_fps_upg_o_leupold = {
			text_id = "bm_wp_upg_o_leupold_achievment",
			stat = "gage3_13_stats",
			max_progress = 10
		},
		wpn_fps_snp_msr_body_msr = {
			text_id = "bm_wp_msr_body_msr_achievment",
			stat = "gage3_14_stats",
			max_progress = 25
		},
		wpn_fps_snp_r93_body_wood = {
			text_id = "bm_wp_r93_body_wood_achievment",
			stat = "gage3_15_stats",
			max_progress = 25
		},
		wpn_fps_snp_msr_ns_suppressor = {
			text_id = "bm_wp_snp_msr_ns_suppressor_achievment",
			stat = "gage3_16_stats",
			max_progress = 25
		},
		wpn_fps_snp_msr_b_long = {
			text_id = "bm_wp_snp_msr_b_long_achievment",
			stat = "gage3_17_stats",
			max_progress = 250
		},
		wpn_fps_ass_fal_fg_01 = {
			text_id = "bm_wp_fal_fg_01_achievment",
			award = "bigbank_7"
		},
		wpn_fps_ass_fal_fg_03 = {
			text_id = "bm_wp_fal_fg_03_achievment",
			award = "bigbank_8"
		},
		wpn_fps_ass_fal_fg_04 = {
			text_id = "bm_wp_fal_fg_04_achievment",
			award = "bigbank_3"
		},
		wpn_fps_ass_fal_fg_wood = {
			text_id = "bm_wp_fal_fg_wood_achievment",
			award = "bigbank_4"
		},
		wpn_fps_ass_fal_s_01 = {
			text_id = "bm_wp_fal_s_01_achievment",
			award = "bigbank_5"
		},
		wpn_fps_ass_fal_s_03 = {
			text_id = "bm_wp_fal_s_03_achievment",
			award = "bigbank_10"
		},
		wpn_fps_ass_fal_s_wood = {
			text_id = "bm_wp_fal_s_wood_achievment",
			award = "bigbank_6"
		},
		wpn_fps_ass_fal_g_01 = {
			text_id = "bm_wp_fal_g_01_achievment",
			award = "bigbank_1"
		},
		wpn_fps_ass_fal_m_01 = {
			text_id = "bm_wp_fal_m_01_achievment",
			award = "bigbank_2"
		},
		wpn_fps_upg_o_mbus_rear = {
			text_id = "bm_wp_upg_o_mbus_rear_achievment",
			award = "gage4_2"
		},
		wpn_fps_sho_ben_b_short = {
			text_id = "bm_wp_ben_b_short_achievment",
			award = "gage4_4"
		},
		wpn_fps_sho_ben_b_long = {
			text_id = "bm_wp_ben_b_long_achievment",
			award = "gage4_5"
		},
		wpn_fps_sho_ben_s_collapsed = {
			text_id = "bm_wp_ben_s_collapsed_achievment",
			stat = "gage4_6",
			max_progress = 50
		},
		wpn_fps_sho_ksg_b_short = {
			text_id = "bm_wp_ksg_b_short_achievment",
			stat = "gage4_7",
			max_progress = 25
		},
		wpn_fps_sho_ksg_b_long = {
			text_id = "bm_wp_ksg_b_long_achievment",
			stat = "gage4_8",
			max_progress = 10
		},
		wpn_fps_sho_ben_s_solid = {
			text_id = "bm_wp_ben_s_solid_achievment",
			award = "gage4_9"
		},
		wpn_fps_sho_striker_b_long = {
			text_id = "bm_wp_striker_b_long_achievment",
			stat = "gage4_10_stats",
			max_progress = 10
		},
		wpn_fps_sho_striker_b_suppressed = {
			text_id = "bm_wp_striker_b_suppressed_achievment",
			award = "gage4_11"
		},
		wpn_fps_gre_m79_barrel_short = gage_5_5_achievement,
		wpn_fps_gre_m79_stock_short = gage_5_2_achievement,
		wpn_fps_ass_g3_b_sniper = gage_5_1_achievement,
		wpn_fps_ass_g3_fg_psg = gage_5_1_achievement,
		wpn_fps_ass_g3_g_sniper = gage_5_1_achievement,
		wpn_fps_ass_g3_s_sniper = gage_5_1_achievement,
		wpn_fps_ass_g3_b_short = gage_5_4_achievement,
		wpn_fps_ass_g3_fg_retro_plastic = gage_5_4_achievement,
		wpn_fps_ass_g3_fg_railed = gage_5_6_achievement,
		wpn_fps_ass_g3_fg_retro = gage_5_7_achievement,
		wpn_fps_ass_g3_g_retro = gage_5_7_achievement,
		wpn_fps_ass_g3_s_wood = gage_5_7_achievement,
		wpn_fps_ass_galil_s_sniper = gage_5_1_achievement,
		wpn_fps_ass_galil_fg_sniper = gage_5_1_achievement,
		wpn_fps_ass_galil_g_sniper = gage_5_1_achievement,
		wpn_fps_ass_galil_fg_sar = gage_5_6_achievement,
		wpn_fps_ass_galil_fg_mar = gage_5_3_achievement,
		wpn_fps_ass_galil_s_plastic = gage_5_3_achievement,
		wpn_fps_ass_galil_s_light = gage_5_4_achievement,
		wpn_fps_ass_galil_s_wood = gage_5_5_achievement,
		wpn_fps_ass_galil_fg_fab = gage_5_9_achievement,
		wpn_fps_ass_galil_s_fab = gage_5_9_achievement,
		wpn_fps_ass_galil_s_skeletal = gage_5_9_achievement,
		wpn_fps_ass_famas_b_sniper = gage_5_1_achievement,
		wpn_fps_ass_famas_b_short = gage_5_4_achievement,
		wpn_fps_ass_famas_b_long = gage_5_6_achievement,
		wpn_fps_ass_famas_g_retro = gage_5_10_achievement,
		wpn_fps_ass_famas_b_suppressed = gage_5_10_achievement,
		wpn_fps_smg_scorpion_g_ergo = pig_1_achievement,
		wpn_fps_smg_scorpion_m_extended = pig_1_achievement,
		wpn_fps_smg_scorpion_s_unfolded = pig_1_achievement,
		wpn_fps_smg_uzi_fg_rail = pig_2_achievement,
		wpn_fps_smg_uzi_s_leather = pig_2_achievement,
		wpn_fps_smg_uzi_s_solid = pig_3_achievement,
		wpn_fps_smg_scorpion_g_wood = pig_3_achievement,
		wpn_fps_smg_tec9_ns_ext = pig_4_achievement,
		wpn_fps_smg_tec9_m_extended = pig_4_achievement,
		wpn_fps_smg_tec9_s_unfolded = pig_4_achievement,
		wpn_fps_smg_uzi_b_suppressed = pig_5_achievement,
		wpn_fps_smg_uzi_s_standard = pig_5_achievement,
		wpn_fps_smg_scorpion_b_suppressed = pig_5_achievement,
		wpn_fps_smg_scorpion_s_nostock = pig_5_achievement,
		wpn_fps_smg_tec9_b_standard = pig_5_achievement
	}
	self.pickups = {}
	self.pickups.ammo = {
		unit = Idstring("units/pickups/ammo/ammo_pickup")
	}
	self.pickups.bank_manager_key = {
		unit = Idstring("units/pickups/pickup_bank_manager_key/pickup_bank_manager_key")
	}
	self.pickups.chavez_key = {
		unit = Idstring("units/pickups/pickup_chavez_key/pickup_chavez_key")
	}
	self.pickups.drill = {
		unit = Idstring("units/pickups/pickup_drill/pickup_drill")
	}
	self.pickups.keycard = {
		unit = Idstring("units/payday2/pickups/gen_pku_keycard/gen_pku_keycard")
	}
	self.danger_zones = {
		0.6,
		0.5,
		0.35,
		0.1
	}
	self.contour = {}
	self.contour.character = {}
	self.contour.character.standard_color = Vector3(0.1, 1, 0.5)
	self.contour.character.friendly_color = Vector3(0.2, 0.8, 1)
	self.contour.character.downed_color = Vector3(1, 0.5, 0)
	self.contour.character.dead_color = Vector3(1, 0.1, 0.1)
	self.contour.character.dangerous_color = Vector3(0.6, 0.2, 0.2)
	self.contour.character.more_dangerous_color = Vector3(1, 0.1, 0.1)
	self.contour.character.standard_opacity = 0
	self.contour.character_interactable = {}
	self.contour.character_interactable.standard_color = Vector3(1, 0.5, 0)
	self.contour.character_interactable.selected_color = Vector3(1, 1, 1)
	self.contour.interactable = {}
	self.contour.interactable.standard_color = Vector3(1, 0.5, 0)
	self.contour.interactable.selected_color = Vector3(1, 1, 1)
	self.contour.contour_off = {}
	self.contour.contour_off.standard_color = Vector3(0, 0, 0)
	self.contour.contour_off.selected_color = Vector3(0, 0, 0)
	self.contour.contour_off.standard_opacity = 0
	self.contour.deployable = {}
	self.contour.deployable.standard_color = Vector3(0.1, 1, 0.5)
	self.contour.deployable.selected_color = Vector3(1, 1, 1)
	self.contour.upgradable = {}
	self.contour.upgradable.standard_color = Vector3(0.1, 0.5, 1)
	self.contour.upgradable.selected_color = Vector3(1, 1, 1)
	self.contour.pickup = {}
	self.contour.pickup.standard_color = Vector3(0.1, 1, 0.5)
	self.contour.pickup.selected_color = Vector3(1, 1, 1)
	self.contour.pickup.standard_opacity = 1
	self.contour.interactable_icon = {}
	self.contour.interactable_icon.standard_color = Vector3(0, 0, 0)
	self.contour.interactable_icon.selected_color = Vector3(0, 1, 0)
	self.contour.interactable_icon.standard_opacity = 0
	self.music = {}
	self.music.hit = {}
	self.music.hit.intro = "music_hit_setup"
	self.music.hit.anticipation = "music_hit_anticipation"
	self.music.hit.assault = "music_hit_assault"
	self.music.hit.fake_assault = "music_hit_assault"
	self.music.hit.control = "music_hit_control"
	self.music.stress = {}
	self.music.stress.intro = "music_stress_setup"
	self.music.stress.anticipation = "music_stress_anticipation"
	self.music.stress.assault = "music_stress_assault"
	self.music.stress.fake_assault = "music_stress_assault"
	self.music.stress.control = "music_stress_control"
	self.music.stealth = {}
	self.music.stealth.intro = "music_stealth_setup"
	self.music.stealth.anticipation = "music_stealth_anticipation"
	self.music.stealth.assault = "music_stealth_assault"
	self.music.stealth.fake_assault = "music_stealth_assault"
	self.music.stealth.control = "music_stealth_control"
	self.music.heist = {}
	self.music.heist.intro = "music_heist_setup"
	self.music.heist.anticipation = "music_heist_anticipation"
	self.music.heist.assault = "music_heist_assault"
	self.music.heist.fake_assault = "music_heist_assault"
	self.music.heist.control = "music_heist_control"
	self.music.big_bank = {}
	self.music.big_bank.intro = "music_heist_setup"
	self.music.big_bank.anticipation = "music_heist_anticipation"
	self.music.big_bank.assault = "music_heist_assault"
	self.music.big_bank.fake_assault = "music_heist_assault"
	self.music.big_bank.control = "music_heist_control"
	self.music.default = deep_clone(self.music.heist)
	self.blame = {}
	self.blame.default = "hint_blame_missing"
	self.blame.empty = nil
	self.blame.cam_criminal = "hint_cam_criminal"
	self.blame.cam_dead_body = "hint_cam_dead_body"
	self.blame.cam_hostage = "hint_cam_hostage"
	self.blame.cam_distress = "hint_cam_distress"
	self.blame.cam_body_bag = "hint_body_bag"
	self.blame.cam_gunfire = "hint_gunfire"
	self.blame.cam_drill = "hint_cam_drill"
	self.blame.cam_saw = "hint_cam_saw"
	self.blame.cam_sentry_gun = "hint_sentry_gun"
	self.blame.cam_trip_mine = "hint_trip_mine"
	self.blame.cam_ecm_jammer = "hint_ecm_jammer"
	self.blame.cam_c4 = "hint_c4"
	self.blame.cam_computer = "hint_computer"
	self.blame.cam_glass = "hint_glass"
	self.blame.cam_broken_cam = "hint_cam_broken_cam"
	self.blame.cam_vault = "hint_vault"
	self.blame.cam_fire = "hint_fire"
	self.blame.cam_voting = "hint_voting"
	self.blame.cam_breaking_entering = "hint_breaking_entering"
	self.blame.civ_criminal = "hint_civ_criminal"
	self.blame.civ_dead_body = "hint_civ_dead_body"
	self.blame.civ_hostage = "hint_civ_hostage"
	self.blame.civ_distress = "hint_civ_distress"
	self.blame.civ_body_bag = "hint_civ_body_bag"
	self.blame.civ_gunfire = "hint_civ_gunfire"
	self.blame.civ_drill = "hint_civ_drill"
	self.blame.civ_saw = "hint_civ_saw"
	self.blame.civ_sentry_gun = "hint_civ_sentry_gun"
	self.blame.civ_trip_mine = "hint_civ_trip_mine"
	self.blame.civ_ecm_jammer = "hint_civ_ecm_jammer"
	self.blame.civ_c4 = "hint_civ_c4"
	self.blame.civ_computer = "hint_civ_computer"
	self.blame.civ_glass = "hint_civ_glass"
	self.blame.civ_broken_cam = "hint_civ_broken_cam"
	self.blame.civ_vault = "hint_civ_vault"
	self.blame.civ_fire = "hint_civ_fire"
	self.blame.civ_voting = "hint_civ_voting"
	self.blame.civ_breaking_entering = "hint_civ_breaking_entering"
	self.blame.cop_criminal = "hint_cop_criminal"
	self.blame.cop_dead_body = "hint_cop_dead_body"
	self.blame.cop_hostage = "hint_cop_hostage"
	self.blame.cop_distress = "hint_cop_distress"
	self.blame.cop_body_bag = "hint_cop_body_bag"
	self.blame.cop_gunfire = "hint_cop_gunfire"
	self.blame.cop_drill = "hint_cop_drill"
	self.blame.cop_saw = "hint_cop_saw"
	self.blame.cop_sentry_gun = "hint_cop_sentry_gun"
	self.blame.cop_trip_mine = "hint_cop_trip_mine"
	self.blame.cop_ecm_jammer = "hint_cop_ecm_jammer"
	self.blame.cop_c4 = "hint_cop_c4"
	self.blame.cop_computer = "hint_cop_computer"
	self.blame.cop_glass = "hint_cop_glass"
	self.blame.cop_broken_cam = "hint_cop_broken_cam"
	self.blame.cop_vault = "hint_cop_vault"
	self.blame.cop_fire = "hint_cop_fire"
	self.blame.cop_voting = "hint_cop_voting"
	self.blame.cop_breaking_entering = "hint_cop_breaking_entering"
	self.blame.sys_explosion = "hint_alert_explosion"
	self.blame.civ_explosion = "hint_alert_explosion"
	self.blame.cop_explosion = "hint_alert_explosion"
	self.blame.gan_explosion = "hint_alert_explosion"
	self.blame.cam_explosion = "hint_alert_explosion"
	self.blame.sys_blackmailer = "hint_blame_blackmailer"
	self.blame.sys_gensec = "hint_blame_gensec"
	self.blame.sys_police_alerted = "hint_blame_police_alerted"
	self.blame.sys_csgo_gunfire = "hint_blame_csgo_gunfire"
	self.blame.met_criminal = "hint_met_criminal"
	self.blame.mot_criminal = "hint_mot_criminal"
	self.blame.gls_alarm = "hint_alarm_glass"
	self.blame.alarm_pager_bluff_failed = "hint_alarm_pager_bluff_failed"
	self.blame.alarm_pager_not_answered = "hint_alarm_pager_not_answered"
	self.blame.alarm_pager_hang_up = "hint_alarm_pager_hang_up"
	self.blame.civ_alarm = "hint_alarm_civ"
	self.blame.cop_alarm = "hint_alarm_cop"
	self.blame.gan_alarm = "hint_alarm_cop"
	self.blame.cam_crate_open = "hint_cam_crate_open"
	self.blame.civ_crate_open = "hint_civ_crate_open"
	self.blame.cop_crate_open = "hint_cop_crate_open"
	self.blame.gan_crate_open = "hint_cop_crate_open"
	self.casino = {}
	self.casino.unlock_level = 10
	self.casino.entrance_level = {
		14,
		28,
		40,
		45,
		55,
		65,
		75
	}
	self.casino.entrance_fee = {
		500000,
		500000,
		500000,
		750000,
		1000000,
		1250000,
		1500000
	}
	self.casino.prefer_cost = 500000
	self.casino.prefer_chance = 0.1
	self.casino.secure_card_cost = {
		1000000,
		3300000,
		6500000
	}
	self.casino.secure_card_level = {
		10,
		40,
		60
	}
	self.casino.infamous_cost = 3000000
	self.casino.infamous_chance = 3
	self.grenades = {}
	self.grenades.frag = {}
	self.grenades.frag.damage = 30
	self.grenades.frag.player_damage = 10
	self.grenades.frag.range = 1000
	self.grenades.launcher_frag = {}
	self.grenades.launcher_frag.damage = 34
	self.grenades.launcher_frag.curve_pow = 0.1
	self.grenades.launcher_frag.player_damage = 8
	self.grenades.launcher_frag.range = 350
	self.grenades.launcher_frag.init_timer = 2.5
	self.grenades.launcher_frag.mass_look_up_modifier = 1
	self.grenades.launcher_frag.sound_event = "gl_explode"
	self:set_difficulty()
	self:set_mode()
	self:digest_tweak_data()
end

function TweakData:_execute_reload_clbks()
	if self._reload_clbks then
		for key, clbk_data in pairs(self._reload_clbks) do
			if clbk_data.func then
				clbk_data.func(clbk_data.clbk_object)
			end
		end
	end
end

function TweakData:add_reload_callback(object, func)
	self._reload_clbks = self._reload_clbks or {}
	table.insert(self._reload_clbks, {clbk_object = object, func = func})
end

function TweakData:remove_reload_callback(object)
	if self._reload_clbks then
		for i, k in ipairs(self._reload_clbks) do
			if k.clbk_object == object then
				table.remove(self._reload_clbks, i)
				return
			end
		end
	end
end

function TweakData:set_scale()
	local lang_key = SystemInfo:language():key()
	local lang_mods = {
		[Idstring("german"):key()] = {
			large = 0.9,
			small = 1,
			sd_large = 0.9,
			sd_small = 0.9,
			sd_menu_border_multiplier = 0.9,
			stats_upgrade_kern = -1,
			level_up_text_kern = -1.5,
			objectives_text_kern = -1,
			menu_logo_multiplier = 0.9,
			kit_desc_large = 0.9,
			sd_w_interact_multiplier = 1.55,
			w_interact_multiplier = 1.65
		}
	}
	lang_mods[Idstring("french"):key()] = {
		large = 0.9,
		small = 1,
		sd_large = 0.9,
		sd_small = 0.95,
		victory_screen_kern = -0.5,
		objectives_text_kern = -0.8,
		level_up_text_kern = -1.5,
		sd_level_up_font_multiplier = 0.9,
		stats_upgrade_kern = -1,
		kit_desc_large = 0.9,
		sd_w_interact_multiplier = 1.3,
		w_interact_multiplier = 1.4,
		subtitle_multiplier = 0.85
	}
	lang_mods[Idstring("italian"):key()] = {
		large = 1,
		small = 1,
		sd_large = 1,
		sd_small = 1,
		objectives_text_kern = -0.8,
		kit_desc_large = 0.9,
		sd_w_interact_multiplier = 1.5,
		w_interact_multiplier = 1.35
	}
	lang_mods[Idstring("spanish"):key()] = {
		large = 1,
		small = 1,
		sd_large = 1,
		sd_small = 0.9,
		sd_menu_border_multiplier = 0.85,
		stats_upgrade_kern = -1,
		upgrade_menu_kern = -1.25,
		level_up_text_kern = -1.5,
		menu_logo_multiplier = 0.9,
		objectives_text_kern = -0.8,
		objectives_desc_text_kern = 0,
		level_up_text_kern = -1.5,
		sd_level_up_font_multiplier = 0.9,
		kit_desc_large = 0.9,
		sd_w_interact_multiplier = 1.5,
		w_interact_multiplier = 1.6,
		server_list_font_multiplier = 0.9,
		victory_title_multiplier = 0.9
	}
	local lang_l_mod = lang_mods[lang_key] and lang_mods[lang_key].large or 1
	local lang_s_mod = lang_mods[lang_key] and lang_mods[lang_key].small or 1
	local lang_lsd_mod = lang_mods[lang_key] and lang_mods[lang_key].sd_large or 1
	local lang_ssd_mod = lang_mods[lang_key] and lang_mods[lang_key].sd_large or 1
	local sd_menu_border_multiplier = lang_mods[lang_key] and lang_mods[lang_key].sd_menu_border_multiplier or 1
	local stats_upgrade_kern = lang_mods[lang_key] and lang_mods[lang_key].stats_upgrade_kern or 0
	local level_up_text_kern = lang_mods[lang_key] and lang_mods[lang_key].level_up_text_kern or 0
	local victory_screen_kern = lang_mods[lang_key] and lang_mods[lang_key].victory_screen_kern
	local upgrade_menu_kern = lang_mods[lang_key] and lang_mods[lang_key].upgrade_menu_kern
	local mugshot_name_kern = lang_mods[lang_key] and lang_mods[lang_key].mugshot_name_kern
	local menu_logo_multiplier = lang_mods[lang_key] and lang_mods[lang_key].menu_logo_multiplier or 1
	local objectives_text_kern = lang_mods[lang_key] and lang_mods[lang_key].objectives_text_kern
	local objectives_desc_text_kern = lang_mods[lang_key] and lang_mods[lang_key].objectives_desc_text_kern
	local kit_desc_large = lang_mods[lang_key] and lang_mods[lang_key].kit_desc_large or 1
	local sd_level_up_font_multiplier = lang_mods[lang_key] and lang_mods[lang_key].sd_level_up_font_multiplier or 1
	local sd_w_interact_multiplier = lang_mods[lang_key] and lang_mods[lang_key].sd_w_interact_multiplier or 1
	local w_interact_multiplier = lang_mods[lang_key] and lang_mods[lang_key].w_interact_multiplier or 1
	local server_list_font_multiplier = lang_mods[lang_key] and lang_mods[lang_key].server_list_font_multiplier or 1
	local victory_title_multiplier = lang_mods[lang_key] and lang_mods[lang_key].victory_title_multiplier
	local subtitle_multiplier = lang_mods[lang_key] and lang_mods[lang_key].subtitle_multiplier or 1
	local res = RenderSettings.resolution
	self.sd_scale = {}
	self.sd_scale.is_sd = true
	self.sd_scale.title_image_multiplier = 0.6
	self.sd_scale.menu_logo_multiplier = 0.575 * menu_logo_multiplier
	self.sd_scale.menu_border_multiplier = 0.6 * sd_menu_border_multiplier
	self.sd_scale.default_font_multiplier = 0.6 * lang_lsd_mod
	self.sd_scale.small_font_multiplier = 0.8 * lang_ssd_mod
	self.sd_scale.lobby_info_font_size_scale_multiplier = 0.65
	self.sd_scale.lobby_name_font_size_scale_multiplier = 0.6
	self.sd_scale.server_list_font_size_multiplier = 0.55
	self.sd_scale.multichoice_arrow_multiplier = 0.7
	self.sd_scale.align_line_padding_multiplier = 0.4
	self.sd_scale.menu_arrow_padding_multiplier = 0.5
	self.sd_scale.briefing_text_h_multiplier = 0.5
	self.sd_scale.experience_bar_multiplier = 0.825
	self.sd_scale.hud_equipment_icon_multiplier = 0.65
	self.sd_scale.hud_default_font_multiplier = 0.7
	self.sd_scale.hud_ammo_clip_multiplier = 0.75
	self.sd_scale.hud_ammo_clip_large_multiplier = 0.5
	self.sd_scale.hud_health_multiplier = 0.75
	self.sd_scale.hud_mugshot_multiplier = 0.75
	self.sd_scale.hud_assault_image_multiplier = 0.5
	self.sd_scale.hud_crosshair_offset_multiplier = 0.75
	self.sd_scale.hud_objectives_pad_multiplier = 0.65
	self.sd_scale.experience_upgrade_multiplier = 0.75
	self.sd_scale.level_up_multiplier = 0.7
	self.sd_scale.next_upgrade_font_multiplier = 0.75
	self.sd_scale.level_up_font_multiplier = 0.51 * sd_level_up_font_multiplier
	self.sd_scale.present_multiplier = 0.75
	self.sd_scale.lobby_info_offset_multiplier = 0.7
	self.sd_scale.info_padding_multiplier = 0.4
	self.sd_scale.loading_challenge_bar_scale = 0.8
	self.sd_scale.kit_menu_bar_scale = 0.65
	self.sd_scale.kit_menu_description_h_scale = 1.22
	self.sd_scale.button_layout_multiplier = 0.7
	self.sd_scale.subtitle_pos_multiplier = 0.7
	self.sd_scale.subtitle_font_multiplier = 0.65
	self.sd_scale.subtitle_lang_multiplier = subtitle_multiplier
	self.sd_scale.default_font_kern = 0
	self.sd_scale.stats_upgrade_kern = stats_upgrade_kern or 0
	self.sd_scale.level_up_text_kern = level_up_text_kern or 0
	self.sd_scale.victory_screen_kern = victory_screen_kern or -0.5
	self.sd_scale.upgrade_menu_kern = upgrade_menu_kern or 0
	self.sd_scale.mugshot_name_kern = mugshot_name_kern or -1
	self.sd_scale.objectives_text_kern = objectives_text_kern or 0
	self.sd_scale.objectives_desc_text_kern = objectives_desc_text_kern or 0
	self.sd_scale.kit_description_multiplier = 0.8 * lang_ssd_mod
	self.sd_scale.chat_multiplier = 0.68
	self.sd_scale.chat_menu_h_multiplier = 0.34
	self.sd_scale.w_interact_multiplier = 0.8 * sd_w_interact_multiplier
	self.sd_scale.victory_title_multiplier = victory_title_multiplier and victory_title_multiplier * 0.95 or 1
	self.scale = {}
	self.scale.is_sd = false
	self.scale.title_image_multiplier = 1
	self.scale.menu_logo_multiplier = 1
	self.scale.menu_border_multiplier = 1
	self.scale.default_font_multiplier = 1 * lang_l_mod
	self.scale.small_font_multiplier = 1 * lang_s_mod
	self.scale.lobby_info_font_size_scale_multiplier = 1 * lang_l_mod
	self.scale.lobby_name_font_size_scale_multiplier = 1 * lang_l_mod
	self.scale.server_list_font_size_multiplier = 1 * lang_l_mod * server_list_font_multiplier
	self.scale.multichoice_arrow_multiplier = 1
	self.scale.align_line_padding_multiplier = 1
	self.scale.menu_arrow_padding_multiplier = 1
	self.scale.briefing_text_h_multiplier = 1 * lang_s_mod
	self.scale.experience_bar_multiplier = 1
	self.scale.hud_equipment_icon_multiplier = 1
	self.scale.hud_default_font_multiplier = 1 * lang_l_mod
	self.scale.hud_ammo_clip_multiplier = 1
	self.scale.hud_health_multiplier = 1
	self.scale.hud_mugshot_multiplier = 1
	self.scale.hud_assault_image_multiplier = 1
	self.scale.hud_crosshair_offset_multiplier = 1
	self.scale.hud_objectives_pad_multiplier = 1
	self.scale.experience_upgrade_multiplier = 1
	self.scale.level_up_multiplier = 1
	self.scale.next_upgrade_font_multiplier = 1 * lang_l_mod
	self.scale.level_up_font_multiplier = 1 * lang_l_mod
	self.scale.present_multiplier = 1
	self.scale.lobby_info_offset_multiplier = 1
	self.scale.info_padding_multiplier = 1
	self.scale.loading_challenge_bar_scale = 1
	self.scale.kit_menu_bar_scale = 1
	self.scale.kit_menu_description_h_scale = 1
	self.scale.button_layout_multiplier = 1
	self.scale.subtitle_pos_multiplier = 1
	self.scale.subtitle_font_multiplier = 1 * lang_l_mod
	self.scale.subtitle_lang_multiplier = subtitle_multiplier
	self.scale.default_font_kern = 0
	self.scale.stats_upgrade_kern = stats_upgrade_kern or 0
	self.scale.level_up_text_kern = 0
	self.scale.victory_screen_kern = victory_screen_kern or 0
	self.scale.upgrade_menu_kern = 0
	self.scale.mugshot_name_kern = 0
	self.scale.objectives_text_kern = objectives_text_kern or 0
	self.scale.objectives_desc_text_kern = objectives_desc_text_kern or 0
	self.scale.kit_description_multiplier = 1 * kit_desc_large
	self.scale.chat_multiplier = 1
	self.scale.chat_menu_h_multiplier = 1
	self.scale.w_interact_multiplier = 1 * w_interact_multiplier
	self.scale.victory_title_multiplier = victory_title_multiplier or 1
end

function TweakData:set_menu_scale()
	local lang_mods_def = {
		[Idstring("german"):key()] = {
			topic_font_size = 0.8,
			challenges_font_size = 1,
			upgrades_font_size = 1,
			mission_end_font_size = 1
		},
		[Idstring("french"):key()] = {
			topic_font_size = 1,
			challenges_font_size = 1,
			upgrades_font_size = 1,
			mission_end_font_size = 1
		},
		[Idstring("italian"):key()] = {
			topic_font_size = 1,
			challenges_font_size = 1,
			upgrades_font_size = 1,
			mission_end_font_size = 0.95
		},
		[Idstring("spanish"):key()] = {
			topic_font_size = 0.95,
			challenges_font_size = 0.95,
			upgrades_font_size = 1,
			mission_end_font_size = 1
		}
	}
	local lang_mods = lang_mods_def[SystemInfo:language():key()] or {
		topic_font_size = 1,
		challenges_font_size = 1,
		upgrades_font_size = 1,
		mission_end_font_size = 1
	}
	local scale_multiplier = self.scale.default_font_multiplier
	local small_scale_multiplier = self.scale.small_font_multiplier
	self.menu.default_font = "fonts/font_medium_shadow_mf"
	self.menu.default_font_no_outline = "fonts/font_medium_noshadow_mf"
	self.menu.default_font_id = Idstring(self.menu.default_font)
	self.menu.default_font_no_outline_id = Idstring(self.menu.default_font_no_outline)
	self.menu.small_font = "fonts/font_small_shadow_mf"
	self.menu.small_font_size = 14 * small_scale_multiplier
	self.menu.small_font_noshadow = "fonts/font_small_noshadow_mf"
	self.menu.medium_font = "fonts/font_medium_shadow_mf"
	self.menu.medium_font_no_outline = "fonts/font_medium_noshadow_mf"
	self.menu.meidum_font_size = 24 * scale_multiplier
	self.menu.eroded_font = "fonts/font_eroded"
	self.menu.eroded_font_size = 80
	self.menu.pd2_massive_font = "fonts/font_large_mf"
	self.menu.pd2_massive_font_id = Idstring(self.menu.pd2_massive_font)
	self.menu.pd2_massive_font_size = 80
	self.menu.pd2_large_font = "fonts/font_large_mf"
	self.menu.pd2_large_font_id = Idstring(self.menu.pd2_large_font)
	self.menu.pd2_large_font_size = 44
	self.menu.pd2_medium_font = "fonts/font_medium_mf"
	self.menu.pd2_medium_font_id = Idstring(self.menu.pd2_medium_font)
	self.menu.pd2_medium_font_size = 24
	self.menu.pd2_small_font = "fonts/font_small_mf"
	self.menu.pd2_small_font_id = Idstring(self.menu.pd2_small_font)
	self.menu.pd2_small_font_size = 20
	self.menu.default_font_size = 24 * scale_multiplier
	self.menu.default_font_row_item_color = Color.white
	self.menu.default_hightlight_row_item_color = Color(1, 0, 0, 0)
	self.menu.default_menu_background_color = Color(1, 0.3254902, 0.37254903, 0.39607844)
	self.menu.highlight_background_color_left = Color(1, 1, 0.65882355, 0)
	self.menu.highlight_background_color_right = Color(1, 1, 0.65882355, 0)
	self.menu.default_changeable_text_color = Color(255, 77, 198, 255) / 255
	self.menu.default_disabled_text_color = Color(1, 0.5, 0.5, 0.5)
	self.menu.arrow_available = Color(1, 1, 0.65882355, 0)
	self.menu.arrow_unavailable = Color(1, 0.5, 0.5, 0.5)
	self.menu.arrow_unavailable = Color(1, 0.5, 0.5, 0.5)
	self.menu.upgrade_locked_color = Color(0.75, 0, 0)
	self.menu.upgrade_not_aquired_color = Color(0.5, 0.5, 0.5)
	self.menu.awarded_challenge_color = self.menu.default_font_row_item_color
	self.menu.dialog_title_font_size = 28 * self.scale.small_font_multiplier
	self.menu.dialog_text_font_size = 24 * self.scale.small_font_multiplier
	self.menu.info_padding = 10 * self.scale.info_padding_multiplier
	self.menu.topic_font_size = 32 * scale_multiplier * lang_mods.topic_font_size
	self.menu.main_menu_background_color = Color(1, 0, 0, 0)
	self.menu.kit_default_font_size = 24 * scale_multiplier
	self.menu.stats_font_size = 24 * scale_multiplier
	self.menu.customize_controller_size = 21 * scale_multiplier
	self.menu.server_list_font_size = 22 * self.scale.server_list_font_size_multiplier
	self.menu.challenges_font_size = 24 * scale_multiplier * lang_mods.challenges_font_size
	self.menu.upgrades_font_size = 24 * scale_multiplier * lang_mods.upgrades_font_size
	self.menu.multichoice_font_size = 24 * scale_multiplier
	self.menu.mission_end_font_size = 20 * scale_multiplier * lang_mods.mission_end_font_size
	self.menu.sd_mission_end_font_size = 14 * small_scale_multiplier * lang_mods.mission_end_font_size
	self.menu.lobby_info_font_size = 22 * self.scale.lobby_info_font_size_scale_multiplier
	self.menu.lobby_name_font_size = 22 * self.scale.lobby_name_font_size_scale_multiplier
	self.menu.loading_challenge_progress_font_size = 22 * small_scale_multiplier
	self.menu.loading_challenge_name_font_size = 22 * small_scale_multiplier
	self.menu.upper_saferect_border = 64 * self.scale.menu_border_multiplier
	self.menu.border_pad = 8 * self.scale.menu_border_multiplier
	self.menu.kit_description_font_size = 14 * self.scale.kit_description_multiplier
	self.load_level = {}
	self.load_level.briefing_text = {
		h = 192 * self.scale.briefing_text_h_multiplier
	}
	self.load_level.upper_saferect_border = self.menu.upper_saferect_border
	self.load_level.border_pad = self.menu.border_pad
	self.load_level.stonecold_small_logo = "guis/textures/game_small_logo"
end

function TweakData:set_hud_values()
	local lang_mods_def = {
		[Idstring("german"):key()] = {
			hint_font_size = 0.9,
			stats_challenges_font_size = 0.7,
			active_objective_title_font_size = 0.9,
			present_mid_text_font_size = 0.8,
			next_player_font_size = 0.85,
			location_font_size = 1
		},
		[Idstring("french"):key()] = {
			hint_font_size = 0.825,
			stats_challenges_font_size = 1,
			active_objective_title_font_size = 1,
			present_mid_text_font_size = 1,
			next_player_font_size = 0.85,
			location_font_size = 1
		},
		[Idstring("italian"):key()] = {
			hint_font_size = 1,
			stats_challenges_font_size = 1,
			active_objective_title_font_size = 1,
			present_mid_text_font_size = 1,
			next_player_font_size = 0.85,
			location_font_size = 1
		},
		[Idstring("spanish"):key()] = {
			hint_font_size = 1,
			stats_challenges_font_size = 1,
			active_objective_title_font_size = 1,
			present_mid_text_font_size = 1,
			next_player_font_size = 0.85,
			location_font_size = 0.7
		}
	}
	local lang_mods = lang_mods_def[SystemInfo:language():key()] or {
		hint_font_size = 1,
		stats_challenges_font_size = 1,
		active_objective_title_font_size = 1,
		present_mid_text_font_size = 1,
		next_player_font_size = 1,
		location_font_size = 1
	}
	self.hud.medium_font = "fonts/font_medium_mf"
	self.hud.medium_font_noshadow = "fonts/font_medium_mf"
	self.hud.small_font = "fonts/font_small_mf"
	self.hud.small_font_size = 14 * self.scale.small_font_multiplier
	self.hud.location_font_size = 28 * self.scale.hud_default_font_multiplier * lang_mods.location_font_size
	self.hud.assault_title_font_size = 30 * self.scale.hud_default_font_multiplier
	self.hud.default_font_size = 32 * self.scale.hud_default_font_multiplier
	self.hud.present_mid_text_font_size = 32 * self.scale.hud_default_font_multiplier * lang_mods.present_mid_text_font_size
	self.hud.timer_font_size = 40 * self.scale.hud_default_font_multiplier
	self.hud.medium_deafult_font_size = 28 * self.scale.hud_default_font_multiplier
	self.hud.ammo_font_size = 30 * self.scale.hud_default_font_multiplier
	self.hud.weapon_ammo_font_size = 24 * self.scale.hud_default_font_multiplier
	self.hud.name_label_font_size = 24 * self.scale.hud_default_font_multiplier
	self.hud.equipment_font_size = 24 * self.scale.hud_default_font_multiplier
	self.hud.hint_font_size = 28 * self.scale.hud_default_font_multiplier * lang_mods.hint_font_size
	self.hud.active_objective_title_font_size = 24 * self.scale.hud_default_font_multiplier * lang_mods.active_objective_title_font_size
	self.hud.completed_objective_title_font_size = 20 * self.scale.hud_default_font_multiplier
	self.hud.upgrade_awarded_font_size = 26 * self.scale.hud_default_font_multiplier
	self.hud.next_upgrade_font_size = 14 * self.scale.next_upgrade_font_multiplier
	self.hud.level_up_font_size = 32 * self.scale.level_up_font_multiplier
	self.hud.next_player_font_size = 24 * self.scale.hud_default_font_multiplier * lang_mods.next_player_font_size
	self.hud.stats_challenges_font_size = 32 * self.scale.hud_default_font_multiplier * lang_mods.stats_challenges_font_size
	self.hud.chatinput_size = 22 * self.scale.hud_default_font_multiplier
	self.hud.chatoutput_size = 14 * self.scale.small_font_multiplier
	self.hud.prime_color = Color(1, 1, 0.65882355, 0)
	self.hud.suspicion_color = Color(1, 0, 0.46666667, 0.69803923)
	self.hud.detected_color = Color(1, 1, 0.2, 0)
end

function TweakData:resolution_changed()
	self:set_scale()
	self:set_menu_scale()
	self:set_hud_values()
end

if (not tweak_data or tweak_data.RELOAD) and managers.dlc then
	local reload = tweak_data and tweak_data.RELOAD
	local reload_clbks = tweak_data and tweak_data._reload_clbks
	tweak_data = TweakData:new()
	tweak_data._reload_clbks = reload_clbks
	if reload then
		tweak_data:_execute_reload_clbks()
	end
end

function TweakData:get_controller_help_coords()
	if managers.controller:get_default_wrapper_type() == "pc" then
		return false
	end
	local coords = {}
	if SystemInfo:platform() == Idstring("PS3") then
		coords.menu_button_sprint = {
			x = 195,
			y = 255,
			align = "right",
			vertical = "top"
		}
		coords.menu_button_move = {
			x = 195,
			y = 280,
			align = "right",
			vertical = "top"
		}
		coords.menu_button_melee = {
			x = 319,
			y = 255,
			align = "left",
			vertical = "top"
		}
		coords.menu_button_look = {
			x = 319,
			y = 280,
			align = "left",
			vertical = "top"
		}
		coords.menu_button_switch_weapon = {
			x = 511,
			y = 112,
			align = "left"
		}
		coords.menu_button_reload = {
			x = 511,
			y = 214,
			align = "left"
		}
		coords.menu_button_crouch = {
			x = 511,
			y = 146,
			align = "left"
		}
		coords.menu_button_jump = {
			x = 511,
			y = 178,
			align = "left"
		}
		coords.menu_button_shout = {
			x = 511,
			y = 8,
			align = "left"
		}
		coords.menu_button_fire_weapon = {
			x = 511,
			y = 36,
			align = "left"
		}
		coords.menu_button_deploy = {
			x = 0,
			y = 8,
			align = "right"
		}
		coords.menu_button_aim_down_sight = {
			x = 0,
			y = 36,
			align = "right"
		}
		coords.menu_button_ingame_menu = {
			x = 280,
			y = 0,
			align = "left",
			vertical = "bottom"
		}
		coords.menu_button_stats_screen = {
			x = 230,
			y = 0,
			align = "right",
			vertical = "bottom"
		}
		coords.menu_button_weapon_gadget = {
			x = 0,
			y = 171,
			align = "right",
			vertical = "center"
		}
		coords.menu_button_throw_grenade = {
			x = 0,
			y = 145,
			align = "right",
			vertical = "center"
		}
		coords.menu_button_weapon_firemode = {
			x = 0,
			y = 87,
			align = "right",
			vertical = "center"
		}
	else
		coords.menu_button_sprint = {
			x = 0,
			y = 138,
			align = "right",
			vertical = "bottom"
		}
		coords.menu_button_move = {
			x = 0,
			y = 138,
			align = "right",
			vertical = "top"
		}
		coords.menu_button_melee = {
			x = 302,
			y = 256,
			align = "left",
			vertical = "top"
		}
		coords.menu_button_look = {
			x = 302,
			y = 281,
			align = "left",
			vertical = "top"
		}
		coords.menu_button_switch_weapon = {
			x = 512,
			y = 97,
			align = "left"
		}
		coords.menu_button_reload = {
			x = 512,
			y = 180,
			align = "left"
		}
		coords.menu_button_crouch = {
			x = 512,
			y = 125,
			align = "left"
		}
		coords.menu_button_jump = {
			x = 512,
			y = 153,
			align = "left"
		}
		coords.menu_button_shout = {
			x = 512,
			y = 49,
			align = "left"
		}
		coords.menu_button_fire_weapon = {
			x = 512,
			y = 19,
			align = "left"
		}
		coords.menu_button_deploy = {
			x = 0,
			y = 49,
			align = "right"
		}
		coords.menu_button_aim_down_sight = {
			x = 0,
			y = 19,
			align = "right"
		}
		coords.menu_button_ingame_menu = {
			x = 288,
			y = 0,
			align = "left",
			vertical = "bottom"
		}
		coords.menu_button_stats_screen = {
			x = 223,
			y = 0,
			align = "right",
			vertical = "bottom"
		}
		coords.menu_button_weapon_gadget = {
			x = 0,
			y = 243,
			align = "right",
			vertical = "center"
		}
		coords.menu_button_throw_grenade = {
			x = 0,
			y = 208,
			align = "right",
			vertical = "center"
		}
		coords.menu_button_weapon_firemode = {
			x = 226,
			y = 256,
			align = "right",
			vertical = "top"
		}
		if SystemInfo:platform() == Idstring("WIN32") then
			coords.menu_button_push_to_talk = {
				x = 0,
				y = 174,
				align = "right",
				vertical = "center"
			}
		end
	end
	if managers.user and managers.user:get_setting("southpaw") then
		local tmp = coords.menu_button_move
		coords.menu_button_move = coords.menu_button_look
		coords.menu_button_look = tmp
	end
	return coords
end
