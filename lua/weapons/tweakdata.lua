tweak_data.projectiles.frag.damage = 30
tweak_data.projectiles.frag.range = 1000

tweak_data.projectiles.launcher_frag = {
	damage = 34,
	launch_speed = 1250,
	curve_pow = 0.1,
	player_damage = 8,
	range = 350,
	init_timer = 2.5,
	mass_look_up_modifier = 1,
	sound_event = "gl_explode",
	name_id = "bm_launcher_frag"
}	
tweak_data.projectiles.launcher_rocket = {
	damage = 1000,
	launch_speed = 2500,
	curve_pow = 0.1,
	player_damage = 40,
	range = 500,
	init_timer = 2.5,
	mass_look_up_modifier = 1,
	sound_event = "rpg_explode",
	name_id = "bm_launcher_rocket"
}
tweak_data.projectiles.launcher_incendiary = {
	damage = 3,
	launch_speed = 1250,
	curve_pow = 0.1,
	player_damage = 2,
	fire_dot_data = {
		dot_trigger_chance = 35,
		dot_damage = 25,
		dot_length = 6.1,
		dot_trigger_max_distance = 3000,
		dot_tick_period = 0.5
	},
	range = 75,
	init_timer = 2.5,
	mass_look_up_modifier = 1,
	sound_event = "gl_explode",
	sound_event_impact_duration = 1,
	name_id = "bm_launcher_incendiary",
	burn_duration = 6,
	burn_tick_period = 0.5
}
tweak_data.projectiles.launcher_frag_m32.damage = 34
tweak_data.projectiles.launcher_frag_china.damage = 24.5
tweak_data.projectiles.launcher_frag_arbiter = {
	damage = 12.5,
	launch_speed = 7000,
	curve_pow = 0.1,
	player_damage = 8,
	range = 350,
	init_timer = 2.5,
	mass_look_up_modifier = 1,
	sound_event = "gl_explode",
	name_id = "bm_launcher_frag"
}
tweak_data.projectiles.launcher_incendiary_arbiter = {
	damage = 3,
	launch_speed = 7000,
	curve_pow = 0.1,
	player_damage = 2,
	fire_dot_data = {
		dot_trigger_chance = 35,
		dot_damage = 25,
		dot_length = 6.1,
		dot_trigger_max_distance = 3000,
		dot_tick_period = 0.5
	},
	range = 350,
	init_timer = 2.5,
	mass_look_up_modifier = 1,
	sound_event = "gl_explode",
	sound_event_impact_duration = 0.25,
	name_id = "bm_launcher_incendiary",
	burn_duration = 3,
	burn_tick_period = 0.5
}
tweak_data.projectiles.west_arrow = {
	damage = 19.5,
	launch_speed = 2000,
	adjust_z = 0,
	mass_look_up_modifier = 1,
	name_id = "bm_west_arrow",
	push_at_body_index = 0
}
tweak_data.projectiles.west_arrow_exp.damage = 26
tweak_data.projectiles.dynamite = {
	damage = 30,
	curve_pow = 0.1,
	player_damage = 10,
	range = 500,
	name_id = "bm_grenade_frag",
	effect_name = "effects/payday2/particles/explosions/dynamite_explosion"
}
tweak_data.projectiles.bow_poison_arrow.damage = 6.5
tweak_data.projectiles.crossbow_arrow = {
	damage = 10,
	launch_speed = 2000,
	adjust_z = 0,
	mass_look_up_modifier = 1,
	push_at_body_index = 0
}
tweak_data.projectiles.crossbow_poison_arrow.damage = 3.2
tweak_data.projectiles.crossbow_arrow_exp.damage = 15
tweak_data.projectiles.wpn_prj_jav = {
	damage = 110,
	launch_speed = 1500,
	adjust_z = 30,
	mass_look_up_modifier = 1,
	name_id = "bm_prj_jav",
	push_at_body_index = 0,
	sounds = {}
}
tweak_data.projectiles.arblast_arrow = {
	damage = 52.5,
	launch_speed = 3500,
	adjust_z = 0,
	mass_look_up_modifier = 1,
	push_at_body_index = 0
}
tweak_data.projectiles.arblast_poison_arrow.damage = 19.6
tweak_data.projectiles.arblast_arrow_exp.damage = 70
tweak_data.projectiles.frankish_arrow = {
	damage = 24,
	launch_speed = 2500,
	adjust_z = 0,
	mass_look_up_modifier = 1,
	push_at_body_index = 0
}
tweak_data.projectiles.frankish_poison_arrow.damage = 9
tweak_data.projectiles.frankish_arrow_exp.damage = 31.5
tweak_data.projectiles.long_arrow = {
	damage = 65,
	launch_speed = 3500,
	adjust_z = -30,
	mass_look_up_modifier = 1,
	push_at_body_index = 0
}
tweak_data.projectiles.long_arrow_exp.damage = 85
tweak_data.projectiles.wpn_prj_hur = {
	damage = 11,
	launch_speed = 1000,
	adjust_z = 120,
	mass_look_up_modifier = 1,
	name_id = "bm_prj_hur",
	push_at_body_index = "dynamic_body_spinn",
	sounds = {}
}
tweak_data.projectiles.wpn_prj_target = {
	damage = 11,
	launch_speed = 1000,
	adjust_z = 120,
	mass_look_up_modifier = 1,
	name_id = "bm_prj_target",
	push_at_body_index = "dynamic_body_spinn",
	sounds = {}
}
tweak_data.projectiles.frag_com = {
	damage = 30,
	curve_pow = 0.1,
	range = 1000,
	name_id = "bm_grenade_frag_com"
}
tweak_data.projectiles.rocket_ray_frag.damage = 500
tweak_data.projectiles.dada_com = {
	damage = 30,
	curve_pow = 0.1,
	range = 500,
	name_id = "bm_grenade_dada_com",
	sound_event = "mtl_explosion"
}
tweak_data.projectiles.ecp_arrow = {
	damage = 52.5,
	launch_speed = 3500,
	adjust_z = 0,
	mass_look_up_modifier = 1,
	push_at_body_index = 0
}
tweak_data.projectiles.ecp_arrow_poison.damage = 19.6
tweak_data.projectiles.ecp_arrow_exp.damage = 70
tweak_data.projectiles.elastic_arrow = {
	damage = 65,
	launch_speed = 3500,
	adjust_z = -130,
	mass_look_up_modifier = 1,
	push_at_body_index = 0
}
tweak_data.projectiles.elastic_arrow_exp.damage = 85