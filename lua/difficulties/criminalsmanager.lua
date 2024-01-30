local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
if difficulty_index < 6 then
	CriminalsManager.MAX_NR_TEAM_AI = 2
else
	CriminalsManager.MAX_NR_TEAM_AI = 3
end