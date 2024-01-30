function AchievmentManager:add_heist_success_award_progress(id)
	local new_progress = (managers.job:get_memory(id, true) or 0) + 1

	managers.job:set_memory(id, new_progress, true)

	self._mission_end_achievements[id] = {
		stat = true,
		progress = new_progress
	}
	self._mission_end_achievements[id] = {}
end

function AchievmentManager:get_tracked_fill(max)
	max = max or self.MAX_TRACKED

	if #self._forced == max then
		return self._forced
	end

	local list = table.list_copy(self._forced)
	
	return list
end

CustomAchiHandler = CustomAchiHandler or {}

CustomAchiHandler.achievements = {}

CustomAchiHandler.allowed_to_save = true

function CustomAchiHandler:initialized_callback(clbk)
	CustomAchiHandler.init_callback = clbk
end

function CustomAchiHandler:init()
	Steam:sa_handler():init()
end

function CustomAchiHandler:initialized()
	return Steam:sa_handler():initialized()
end

function CustomAchiHandler:clear_achievement(id)
	return Steam:sa_handler():clear_achievement(id)
end

function CustomAchiHandler:clear_all_stats(param)
	return Steam:sa_handler():clear_all_stats(param)
end

function CustomAchiHandler:has_achievement(id)
	if CustomAchiHandler.achievements[id] then
		return CustomAchiHandler.achievements[id].awarded
	end
end

function CustomAchiHandler:achievement_unlock_time(id)
	if CustomAchiHandler.achievements[id] then
		return CustomAchiHandler.achievements[id].received
	end
end

function CustomAchiHandler:friends_with_achievement(id, callback)
	return Steam:sa_handler():friends_with_achievement(id, callback)
end

function CustomAchiHandler:achievement_achieved_percent(id)
	return Steam:sa_handler():achievement_achieved_percent(id)
end

function CustomAchiHandler:achievement_store_callback(clbk)
	return Steam:sa_handler():achievement_store_callback(clbk)
end

function CustomAchiHandler:set_achievement(id)
	CustomAchiHandler.current_achievement = id
	if not Steam:sa_handler():has_achievement(id) then
		return
	end
end

local function SaveData()
	local progress = _G.OriginalPackOptions.settings.Enable_Test and 'Achievements_OP_TEST.txt' or _G.OriginalPackOptions.settings.Enable_Max_Progress and 'Achievements_OP_MAX.txt' or 'Achievements_OP.txt'
	local file = io.open(SavePath .. progress, "w")
	if file then
		file:write(json.encode({ achievements = CustomAchiHandler.achievements, stats = CustomAchiHandler.stats or {} }))
		file:close()
	end
end

function CustomAchiHandler:store_data()
	local id = CustomAchiHandler.current_achievement or ''
	
	if CustomAchiHandler.achievements[id] and not CustomAchiHandler.achievements[id].awarded then
		local new_data = { awarded = true, received = os.time() }
		CustomAchiHandler.achievements[id] = new_data
		
		if managers.achievment.achievments[id] then
			managers.achievment.achievments[id].awarded = true
			managers.achievment:_give_reward(id)
		end
	end
	
	if CustomAchiHandler.allowed_to_save then
		CustomAchiHandler.allowed_to_save = false
		DelayedCalls:Add('CustomAchiHandler_save_'..id, 0.5, function()
			SaveData()
		
			CustomAchiHandler.allowed_to_save = true
		end)
	end
	
	if not Steam:sa_handler():has_achievement(id) then
		Steam:sa_handler():store_data()
	end
end

function AchievmentManager:check_autounlock_achievements()
end

local save_orig = AchievmentManager.save
function AchievmentManager:save(...)
	if CustomAchiHandler.needs_saving then
		SaveData()
		CustomAchiHandler.needs_saving = nil
	end
	save_orig(self, ...)
end

local init_fin_orig = AchievmentManager.init_finalize
function AchievmentManager:init_finalize(...)
	init_fin_orig(self, ...)
	local progress = _G.OriginalPackOptions.settings.Enable_Test and 'Achievements_OP_TEST.txt' or _G.OriginalPackOptions.settings.Enable_Max_Progress and 'Achievements_OP_MAX.txt' or 'Achievements_OP.txt'

	for k,v in pairs(self.achievments) do
		CustomAchiHandler.achievements[k] = { awarded = false, received = 0 }
	end
	
	local file = io.open(SavePath .. progress, "r")
	if file then
		local data = json.decode(file:read("*all")) or {}
		file:close()
		
		for k,v in pairs(data.achievements or {}) do
			CustomAchiHandler.achievements[k] = v
			if self.achievments[k] and v.awarded then
				self.achievments[k].awarded = true
				self.achievments[k].unlock_time = v.received
			end
		end
		
		CustomAchiHandler.stats = CustomAchiHandler.stats or {}
		for k,v in pairs(data.stats or {}) do
			CustomAchiHandler.stats[k] = v
		end
	end
	
	if CustomAchiHandler.init_callback then
		CustomAchiHandler.init_callback("success")
	end
end

function AchievmentManager:init()
	self.exp_awards = {
		b = 1500,
		a = 500,
		c = 5000,
		none = 0
	}
	self.script_data = {}

	if SystemInfo:platform() == Idstring("WIN32") then
		if SystemInfo:distribution() == Idstring("STEAM") then
			self.oldest_achievement_callback_handler = CoreEvent.CallbackEventHandler:new()
			AchievmentManager.do_award = AchievmentManager.award_steam

			if not Global.achievment_manager then
				self:_parse_achievments("Steam")

-------------------------------------------------------------
				self.handler = CustomAchiHandler
-------------------------------------------------------------

				self.handler:initialized_callback(AchievmentManager.fetch_achievments)
				self.handler:init()

				Global.achievment_manager = {
					handler = self.handler,
					achievments = self.achievments
				}
			else
			
---------------------------------------------------------------------
				self.handler = CustomAchiHandler
				Global.achievment_manager.handler = CustomAchiHandler
---------------------------------------------------------------------

				self.achievments = Global.achievment_manager.achievments
			end
		else
			AchievmentManager.do_award = AchievmentManager.award_none

			self:_parse_achievments()

			if not Global.achievment_manager then
				Global.achievment_manager = {
					achievments = self.achievments
				}
			end

			self.achievments = Global.achievment_manager.achievments
		end
	elseif SystemInfo:platform() == Idstring("PS3") then
		if not Global.achievment_manager then
			Global.achievment_manager = {
				trophy_requests = {}
			}
		end

		self:_parse_achievments("PSN")

		AchievmentManager.do_award = AchievmentManager.award_psn
	elseif SystemInfo:platform() == Idstring("PS4") then
		if not Global.achievment_manager then
			self:_parse_achievments("PS4")

			Global.achievment_manager = {
				trophy_requests = {},
				achievments = self.achievments
			}
		else
			self.achievments = Global.achievment_manager.achievments
		end

		AchievmentManager.do_award = AchievmentManager.award_psn
	elseif SystemInfo:platform() == Idstring("X360") then
		self:_parse_achievments("X360")

		AchievmentManager.do_award = AchievmentManager.award_x360
	elseif SystemInfo:platform() == Idstring("XB1") then
		if not Global.achievment_manager then
			self:_parse_achievments("XB1")

			Global.achievment_manager = {
				achievments = self.achievments
			}
		else
			self.achievments = Global.achievment_manager.achievments
		end

		AchievmentManager.do_award = AchievmentManager.award_x360
	else
		Application:error("[AchievmentManager:init] Unsupported platform")
	end

	self._forced = Global.achievment_manager.forced or {}
	Global.achievment_manager.forced = self._forced
	self._recent_data = Global.achievment_manager.recent_time or {
		time = os.time() - 1
	}
	Global.achievment_manager.recent_time = self._recent_data
	self._with_progress = {}
	self._recent_progress = {}

	for id, data in pairs(self.achievments) do
		local v = tweak_data.achievement.visual[id]

		if v and v.progress then
			self._with_progress[id] = {
				info = data,
				visual = v,
				id = id
			}
		end
	end

	self._milestones = Global.achievment_manager.milestones_OP
	self._current_milestone = Global.achievment_manager.current_milestone_OP

	if not self._milestones or Global.achievment_manager.reset_milestones then
		self._milestones = deep_clone(tweak_data.achievement.milestones)
		Global.achievment_manager.milestones_OP = self._milestones
		self._current_milestone = self._milestones[1]
		Global.achievment_manager.reset_milestones = false
	end

	self._mission_end_achievements = {}
end
