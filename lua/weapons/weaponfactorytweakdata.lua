local data = WeaponFactoryTweakData.create_bonuses
function WeaponFactoryTweakData:create_bonuses(tweak_data, weapon_skins)
	data(self, tweak_data, weapon_skins)
	self.parts.wpn_fps_upg_bonus_damage_p2 = nil
	self.parts.wpn_fps_upg_bonus_team_exp_money_p3.custom_stats = {exp_multiplier = 1.05, money_multiplier = 1.05}
end

local data = WeaponFactoryTweakData.init
function WeaponFactoryTweakData:init(tweak_data)
	data(self, tweak_data)
	
	for id, _ in pairs(self) do
		if self[id].override then
			for ids, _ in pairs(self[id].override) do
				local overrides = self[id].override[ids]
				local slugs = {
					damage_near_mul = 2,
					damage_far_mul = 1.15,
					rays = 1,
					armor_piercing_add = 1,
					can_shoot_through_enemy = true,
					can_shoot_through_shield = true,
					can_shoot_through_wall = true,
					ammo_pickup_min_mul = 1,
					ammo_pickup_max_mul = 1
				}
				local explosive = {
					ignore_statistic = true,
					rays = 1,
					damage_near_mul = 2,
					damage_far_mul = 2.5,
					bullet_class = "InstantExplosiveBulletBase",
					ammo_pickup_min_mul = 0.5,
					ammo_pickup_max_mul = 0.7
				}
				local piercing = {
					damage_near_mul = 2,
					damage_far_mul = 1.7,
					armor_piercing_add = 1,
					ammo_pickup_min_mul = 0.9,
					ammo_pickup_max_mul = 1
				}
				if overrides.wpn_fps_upg_a_slug then
					overrides.wpn_fps_upg_a_slug.custom_stats = slugs
				end
				if overrides.wpn_fps_upg_a_explosive then
					overrides.wpn_fps_upg_a_explosive.custom_stats = explosive
				end
				if overrides.wpn_fps_upg_a_piercing then
					overrides.wpn_fps_upg_a_piercing.custom_stats = piercing
				end
				
				if overrides.wpn_fps_upg_ass_ak_b_zastava then
					overrides.wpn_fps_upg_ass_ak_b_zastava.custom_stats = {ammo_pickup_min_mul = 0.5, ammo_pickup_max_mul = 0.5}
				end
				if overrides.wpn_fps_upg_ass_m4_b_beowulf then
					overrides.wpn_fps_upg_ass_m4_b_beowulf.custom_stats = {ammo_pickup_min_mul = 0.8, ammo_pickup_max_mul = 0.8}
				end
				if overrides.stats then
					if overrides.stats.reload then
						overrides.stats.reload = math.round(overrides.stats.reload * 0.3)
					end
					if overrides.stats.damage then
						overrides.stats.damage = math.round(overrides.stats.damage * 0.454)
					end
				end
			end
		end
	end
	
	for id, _ in pairs(self.parts) do
		local part = self.parts[id]
		if part.stats then
			
			if part.stats.damage then
				if part.stats.damage >= 100 then
					part.stats.damage = math.round(part.stats.damage / 3.375)
				elseif part.stats.damage >= 60 then
					part.stats.damage = math.round(part.stats.damage / 1.340)
				elseif part.stats.damage <= -40 then
					part.stats.damage = math.round(part.stats.damage * 0.325)
				else
					part.stats.damage = math.round(part.stats.damage * 2)
				end
				if part.stats.damage == 4 then
					part.stats.damage = part.stats.damage + 1
				end
				if part.stats.damage == 6 or part.stats.damage == -6 then
					part.stats.damage = math.round(part.stats.damage / 0.857)
				end
				if part.stats.damage == 8 or part.stats.damage == -8 then
					part.stats.damage = math.round(part.stats.damage * 1.25)
				end
			end
		
			if part.sub_type == "silencer" then
				part.has_description = true
				if part.stats.alert_size then
					if part.stats.damage then
						if part.stats.damage <= -10 then
							part.stats.alert_size = math.round(part.stats.alert_size + (part.stats.damage * 0.27))
						else
							part.stats.alert_size = math.round(part.stats.alert_size + (part.stats.damage * 0.4))
						end
					end
					if part.stats.alert_size <= 4 then
						part.desc_id = "menu_silencer_radius_very_high"
					elseif part.stats.alert_size <= 5 then
						part.desc_id = "menu_silencer_radius_high"
					elseif part.stats.alert_size <= 8 then
						part.desc_id = "menu_silencer_radius_medium"
					elseif part.stats.alert_size <= 9 then
						part.desc_id = "menu_silencer_radius_small"
					else
						part.desc_id = "menu_silencer_radius_silent"
					end
				end
			end
			
			if part.type == "magazine" then
				if part.stats.reload then
					part.stats.reload = math.round(part.stats.reload * 0.3)
				end
			end
			
			-- if part.pcs then
				-- part.pcs = {10, 20, 30, 40}
			-- end
		end
	end

	self.parts.wpn_fps_upg_ns_pis_small.stats.damage = -6
	self.parts.wpn_fps_upg_ns_shot_shark.stats.damage = 7
	self.parts.wpn_fps_upg_pis_ns_flash.stats.damage = 2
	self.parts.wpn_fps_upg_ass_ns_surefire.stats.damage = 5
	self.parts.wpn_fps_upg_shot_ns_king.stats.damage = 5
	self.parts.wpn_fps_m4_upper_reciever_edge.stats.damage = 5
	self.parts.wpn_fps_upg_shot_ns_king.stats.damage = 5
	self.parts.wpn_fps_m4_uupg_b_sd.stats.damage = -5
	self.parts.wpn_fps_pis_g18c_co_1.stats.damage = 3
	self.parts.wpn_fps_pis_g18c_co_comp_2.stats.damage = 3
	self.parts.wpn_fps_ass_ak5_fg_ak5c.stats.damage = 3
	self.parts.wpn_fps_pis_deagle_b_long.stats.damage = 10
	self.parts.wpn_fps_pis_deagle_co_long.stats.damage = 10
	self.parts.wpn_fps_pis_deagle_co_short.stats.damage = 5
	self.parts.wpn_fps_smg_mp5_fg_mp5sd.stats.damage = -5
	self.parts.wpn_fps_pis_rage_b_comp1.stats.damage = 10
	self.parts.wpn_fps_pis_rage_b_comp2.stats.damage = 5
	self.parts.wpn_fps_smg_mp7_b_suppressed.stats.damage = -3
	self.parts.wpn_fps_lmg_hk21_b_long.stats.damage = -3
	self.parts.wpn_fps_lmg_m249_b_long.stats.damage = -3
	self.parts.wpn_fps_lmg_rpk_fg_standard.stats.damage = 3
	self.parts.wpn_fps_snp_m95_barrel_suppressed.stats.damage = -3
	self.parts.wpn_fps_snp_msr_ns_suppressor.stats.damage = -2
	self.parts.wpn_fps_snp_r93_b_suppressed.stats.damage = -2
	self.parts.wpn_fps_ass_g3_b_sniper.stats.damage = 32
	self.parts.wpn_fps_ass_famas_b_short.stats.damage = 5
	self.parts.wpn_fps_upg_a_slug.stats = {value = 5, total_ammo_mod = -10, damage = 15, spread = 2, moving_spread = 2}	
	self.parts.wpn_fps_upg_a_custom.stats = {value = 5, total_ammo_mod = -6, damage = 15}
	self.parts.wpn_fps_upg_a_custom_free.stats = {value = 5, total_ammo_mod = -6, damage = 15}
	self.parts.wpn_fps_upg_a_explosive.stats = {value = 5, total_ammo_mod = -10, damage = 15, spread = -3, moving_spread = 3}
	self.parts.wpn_fps_upg_a_piercing.stats = {value = 5, damage = -15, spread = 2 	}	
	self.parts.wpn_fps_upg_a_dragons_breath.stats = {value = 5, total_ammo_mod = -6, damage = -10, spread = -1, moving_spread = 3}
	self.parts.wpn_fps_upg_a_grenade_launcher_incendiary.stats.damage = -10
	self.parts.wpn_fps_upg_a_grenade_launcher_incendiary_arbiter.stats.damage = -8
	self.parts.wpn_fps_pis_c96_b_long.stats.damage = 5
	self.parts.wpn_fps_pis_c96_nozzle.stats.damage = 5
	self.parts.wpn_fps_snp_mosin_b_sniper.stats.damage = -2
	self.parts.wpn_fps_fla_mk2_mag_rare.stats = {value = 1, total_ammo_mod = 5, damage = -3}
	self.parts.wpn_fps_fla_mk2_mag_welldone.stats = {value = 1, total_ammo_mod = -5, damage = 4}
	self.parts.wpn_fps_sho_aa12_barrel_silenced.stats.damage = -5
	self.parts.wpn_fps_snp_winchester_b_suppressed.stats.damage = -2
	self.parts.wpn_fps_snp_wa2000_b_suppressed.stats.damage = -2
	self.parts.wpn_fps_smg_baka_b_smallsupp.stats.damage = -9
	self.parts.wpn_fps_snp_model70_ns_suppressor.stats.damage = -2
	self.parts.wpn_fps_ass_74_b_legend.stats.damage = 14
	self.parts.wpn_fps_shot_r870_b_legendary.stats.damage = 10
	self.parts.wpn_fps_sho_boot_fg_legendary.stats.damage = 20
	self.parts.wpn_fps_shot_shorty_fg_legendary.stats.damage = 15
	self.parts.wpn_fps_smg_sr2_ns_silencer.stats.damage = -5
	self.parts.wpn_fps_snp_desertfox_b_silencer.stats.damage = -2
	self.parts.wpn_fps_sho_rota_b_silencer.stats.damage = -1
	self.parts.wpn_fps_snp_tti_ns_hex.stats.damage = -2
	self.parts.wpn_fps_pis_deagle_b_modern.stats.damage = 10
	self.parts.wpn_fps_fla_system_m_high.stats.damage = 10
	self.parts.wpn_fps_fla_system_m_low.stats = {value = 1, total_ammo_mod = 5, damage = -3}
	self.parts.wpn_fps_fla_system_m_high.stats = {value = 1, total_ammo_mod = -5, damage = 7}
	self.wpn_fps_ass_m16.override.wpn_fps_upg_ass_m4_b_beowulf.stats = {value = 1, spread = 2, recoil = -8, total_ammo_mod = -11, damage = 30, concealment = -4}
	self.wpn_fps_ass_74.override.wpn_fps_upg_ass_ak_b_zastava.stats = {value = 1, spread = 2, recoil = -8, total_ammo_mod = -14, damage = 47, concealment = -4}
	self.parts.wpn_fps_ass_g3_b_sniper.stats = {value = 2, recoil = -2, spread = 2, concealment = -2, total_ammo_mod = -10, damage = 32, extra_ammo = -5}
	self.parts.wpn_fps_ass_g3_b_short.stats = {value = 2, recoil = 2, spread = -2, concealment = 4, damage = -13, total_ammo_mod = 5}
	self.parts.wpn_fps_upg_ass_ak_b_zastava.stats = {value = 1, spread = 2, recoil = -8, total_ammo_mod = -11, damage = 47, concealment = -4}
	self.parts.wpn_fps_upg_ass_m4_b_beowulf.stats = {value = 1, spread = 2, recoil = -8, total_ammo_mod = -14, damage = 32, concealment = -4}
	
	self.parts.wpn_fps_upg_i_autofire.forbids = {
		"wpn_fps_amcar_uupg_body_upperreciever",
		"wpn_fps_ass_m16_os_frontsight",
		"wpn_fps_ass_scar_o_flipups_up",
		"wpn_fps_upg_o_xpsg33_magnifier",
		"wpn_fps_upg_o_sig"
	}
	
	self.parts.wpn_fps_smg_p90_b_ninja.stats.concealment = -5
	self.parts.wpn_fps_smg_p90_b_civilian.stats.concealment = -3
	
	-- self.parts.wpn_fps_upg_a_dragons_breath.custom_stats.fire_dot_data.dot_damage = "1.5"
	-- self.parts.wpn_fps_upg_a_dragons_breath.custom_stats.fire_dot_data.dot_trigger_chance = "65"

	self.parts.wpn_fps_upg_ass_m4_b_beowulf.custom_stats.ammo_pickup_min_mul = 0.8
	self.parts.wpn_fps_upg_ass_m4_b_beowulf.custom_stats.ammo_pickup_max_mul = 0.8
	self.wpn_fps_ass_m16.override.wpn_fps_upg_ass_m4_b_beowulf.custom_stats.ammo_pickup_min_mul = 0.8
	self.wpn_fps_ass_m16.override.wpn_fps_upg_ass_m4_b_beowulf.custom_stats.ammo_pickup_max_mul = 0.8
	self.wpn_fps_ass_74.override.wpn_fps_upg_ass_ak_b_zastava.custom_stats.ammo_pickup_min_mul = 0.5
	self.wpn_fps_ass_74.override.wpn_fps_upg_ass_ak_b_zastava.custom_stats.ammo_pickup_max_mul = 0.5
	self.parts.wpn_fps_upg_ass_ak_b_zastava.custom_stats.ammo_pickup_min_mul = 0.5
	self.parts.wpn_fps_upg_ass_ak_b_zastava.custom_stats.ammo_pickup_max_mul = 0.5
end