--==Тревога нпс от хлопков пуль прилетевшей в стену\поверхность==--
Hooks:PreHook(GamePlayCentralManager, "_play_bullet_hit", "GamePlayCentralManager_play_bullet_hit", function(self, params)
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local hit_pos = params.col_ray.position
	local need_sound = not params.no_sound and World:in_view_with_options(hit_pos, 4000, 0, 0)
	local need_effect = World:in_view_with_options(hit_pos, 20, 100, 5000)
	local need_decal = not self._block_bullet_decals and not params.no_decal and need_effect and World:in_view_with_options(hit_pos, 3000, 0, 0)
	if need_sound and need_effect and need_decal and alive(params.col_ray.unit) then
		local alert_event = {
			"aggression",
			hit_pos,
			tweak_data.bullet_hit_alert_radius,
			managers.groupai:state():get_unit_type_filter("civilians_enemies"),
			params.col_ray.unit
		}
		if difficulty == "easy_wish" or difficulty == "sm_wish" then
			managers.groupai:state():propagate_alert(alert_event)
		end
	end
end)