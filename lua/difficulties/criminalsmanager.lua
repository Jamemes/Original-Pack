local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
if Global.game_settings and Global.game_settings.one_down then
	CriminalsManager.MAX_NR_TEAM_AI = 3
elseif Global.game_settings and Global.game_settings.level_id == "short2_stage1" or Global.game_settings and Global.game_settings.level_id == "short2_stage2b" then
	CriminalsManager.MAX_NR_TEAM_AI = 2
elseif difficulty_index <= 3 then
	CriminalsManager.MAX_NR_TEAM_AI = 1
elseif difficulty_index <= 5 then
	CriminalsManager.MAX_NR_TEAM_AI = 2
else
	CriminalsManager.MAX_NR_TEAM_AI = 3
end