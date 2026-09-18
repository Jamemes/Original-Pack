local ids_unit = Idstring("unit")

function preload_all()
	for id, part in pairs(tweak_data.weapon.factory.parts) do
		if part.third_unit then
			local ids_unit_name = Idstring(part.third_unit)
			managers.dyn_resource:load(ids_unit, ids_unit_name, "packages/dyn_resources", false)
		else
			print(id, "didn't have third")
		end
	end
end

function preload_all_units()
	for id, part in pairs(tweak_data.weapon.factory) do
		if part.unit then
			local ids_unit_name = Idstring(part.unit)
			managers.dyn_resource:load(ids_unit, ids_unit_name, "packages/dyn_resources", false)
		else
			print(id, "didn't have unit")
		end
	end
end

function print_package_strings_unit()
	for id, part in pairs(tweak_data.weapon.factory) do
		if part.unit then
			print("<unit name=\"" .. part.unit .. "\"/>")
		else
		end
	end
end

function print_package_strings_part_unit()
	for id, part in pairs(tweak_data.weapon.factory.parts) do
		if part.unit then
			local f = SystemFS:open(id .. ".package", "w")
			f:puts("<package>")
			f:puts("\t<units>")
			f:puts("\t\t<unit name=\"" .. part.unit .. "\"/>")
			f:puts("\t</units>")
			f:puts("</package>")
			SystemFS:close(f)
		else
		end
	end
end

function preload_all_first()
	for id, part in pairs(tweak_data.weapon.factory.parts) do
		if part.unit then
			local ids_unit_name = Idstring(part.unit)
			managers.dyn_resource:load(ids_unit, ids_unit_name, "packages/dyn_resources", false)
		else
			print(id, "didn't have unit")
		end
	end
end

function print_package_strings()
	for id, part in pairs(tweak_data.weapon.factory.parts) do
		if part.third_unit then
			print("<unit name=\"" .. part.third_unit .. "\"/>")
		else
		end
	end
end

function print_parts_without_texture()
	Application:debug("print_parts_without_texture")
	for id, part in pairs(tweak_data.weapon.factory.parts) do
		if part.pcs then
			local guis_catalog = "guis/"
			local bundle_folder = part.texture_bundle_folder
			if bundle_folder then
				guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
			end
			guis_catalog = guis_catalog .. "textures/pd2/blackmarket/icons/mods/"
			if not DB:has(Idstring("texture"), guis_catalog .. id) then
				print(guis_catalog .. id)
			end
		end
	end
	Application:debug("---------------------------")
end

WeaponFactoryTweakData_37 = WeaponFactoryTweakData_37 or class()

function WeaponFactoryTweakData_37:init()
	self.parts = {}
	self:_init_silencers()
	self:_init_nozzles()
	self:_init_gadgets()
	self:_init_vertical_grips()
	self:_init_sights()
	self:_init_m4()
	self:_init_g18c()
	self:_init_amcar()
	self:_init_m16()
	self:_init_olympic()
	self:_init_ak_parts()
	self:_init_ak74()
	self:_init_akm()
	self:_init_akm_gold()
	self:_init_akmsu()
	self:_init_saiga()
	self:_init_ak5()
	self:_init_aug()
	self:_init_g36()
	self:_init_p90()
	self:_init_m14()
	self:_init_mp9()
	self:_init_deagle()
	self:_init_mp5()
	self:_init_colt_1911()
	self:_init_mac10()
	self:_init_r870()
	self:_init_g17()
	self:_init_b92fs()
	self:_init_huntsman()
	self:_init_raging_bull()
	self:_init_saw()
	self:_init_serbu()
	self:_init_usp()
	self:_init_g22c()
	self:_init_judge()
	self:_init_m45()
	self:_init_s552()
	self:_init_ppk()
	self:_init_content_dlc1()
	self:_init_content_dlc2()
	self:_init_content_dlc2_dec16()
	self:_init_mp7()
	self:_init_scar()
	self:_init_p226()
	self:_init_hk21()
	self:_init_m249()
	self:_init_rpk()
	self:_init_m95()
	self:_init_msr()
	self:_init_r93()
	self:_init_fal()
	self:_init_ben()
	self:_init_striker()
	self:_init_ksg()
	self:_init_gre_m79()
	self:_init_g3()
	self:_init_galil()
	self:_init_famas()
	self:_init_content_jobs()
	self:_init_scorpion()
	self:_init_tec9()
	self:_init_uzi()
	self:create_ammunition()
	self:_init_content_unfinished()
	self:_cleanup_unfinished_parts()
end

function WeaponFactoryTweakData_37:_init_silencers()
	self.parts.wpn_fps_upg_ns_ass_smg_large = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel_ext",
		sub_type = "silencer",
		name_id = "bm_wp_upg_ns_ass_smg_large",
		a_obj = "a_ns",
		parent = "barrel",
		unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_large/wpn_fps_upg_ns_ass_smg_large",
		stats = {
			value = 5,
			suppression = 12,
			alert_size = 12,
			damage = -1,
			recoil = 3,
			spread_moving = -3,
			concealment = -3
		},
		perks = {"silencer"},
		sound_switch = {
			suppressed = "suppressed_c"
		}
	}
	self.parts.wpn_fps_upg_ns_ass_smg_medium = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel_ext",
		sub_type = "silencer",
		name_id = "bm_wp_upg_ns_ass_smg_medium",
		a_obj = "a_ns",
		parent = "barrel",
		unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_medium/wpn_fps_upg_ns_ass_smg_medium",
		stats = {
			value = 2,
			suppression = 12,
			alert_size = 12,
			damage = -3,
			recoil = 1,
			spread_moving = -2,
			concealment = -2
		},
		perks = {"silencer"},
		sound_switch = {
			suppressed = "suppressed_b"
		}
	}
	self.parts.wpn_fps_upg_ns_ass_smg_small = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel_ext",
		sub_type = "silencer",
		name_id = "bm_wp_upg_ns_ass_smg_small",
		a_obj = "a_ns",
		parent = "barrel",
		unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_small/wpn_fps_upg_ns_ass_smg_small",
		stats = {
			value = 3,
			suppression = 12,
			alert_size = 12,
			damage = -5,
			recoil = 0,
			spread_moving = -1,
			concealment = 0
		},
		perks = {"silencer"},
		sound_switch = {
			suppressed = "suppressed_a"
		}
	}
	self.parts.wpn_fps_upg_ns_pis_large = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel_ext",
		sub_type = "silencer",
		name_id = "bm_wp_upg_ns_pis_large",
		a_obj = "a_ns",
		parent = "slide",
		unit = "units/payday2/weapons/wpn_fps_upg_ns_pis_large/wpn_fps_upg_ns_pis_large",
		stats = {
			value = 5,
			suppression = 12,
			alert_size = 12,
			damage = -1,
			recoil = 2,
			spread_moving = -2,
			concealment = -3
		},
		perks = {"silencer"},
		sound_switch = {
			suppressed = "suppressed_c"
		}
	}
	self.parts.wpn_fps_upg_ns_pis_medium = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel_ext",
		sub_type = "silencer",
		name_id = "bm_wp_upg_ns_pis_medium",
		a_obj = "a_ns",
		parent = "slide",
		unit = "units/payday2/weapons/wpn_fps_upg_ns_pis_medium/wpn_fps_upg_ns_pis_medium",
		stats = {
			value = 1,
			suppression = 12,
			alert_size = 12,
			damage = -2,
			recoil = 1,
			spread_moving = -2,
			concealment = -2
		},
		perks = {"silencer"},
		sound_switch = {
			suppressed = "suppressed_b"
		}
	}
	self.parts.wpn_fps_upg_ns_pis_small = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel_ext",
		sub_type = "silencer",
		name_id = "bm_wp_upg_ns_pis_small",
		a_obj = "a_ns",
		parent = "slide",
		unit = "units/payday2/weapons/wpn_fps_upg_ns_pis_small/wpn_fps_upg_ns_pis_small",
		stats = {
			value = 3,
			suppression = 12,
			alert_size = 12,
			damage = -4,
			recoil = 0,
			spread_moving = -1,
			concealment = 0
		},
		perks = {"silencer"},
		sound_switch = {
			suppressed = "suppressed_a"
		}
	}
	self.parts.wpn_fps_upg_ns_shot_thick = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel_ext",
		sub_type = "silencer",
		name_id = "bm_wp_upg_ns_shot_thick",
		a_obj = "a_ns",
		parent = "barrel",
		unit = "units/payday2/weapons/wpn_fps_upg_ns_shot_thick/wpn_fps_upg_ns_shot_thick",
		stats = {
			value = 7,
			suppression = 12,
			alert_size = 12,
			damage = -4,
			recoil = 1,
			spread_moving = -2,
			concealment = -2
		},
		perks = {"silencer"},
		sound_switch = {
			suppressed = "suppressed_a"
		}
	}
	self.parts.wpn_fps_upg_ns_ass_smg_large.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_large/wpn_third_upg_ns_ass_smg_large"
	self.parts.wpn_fps_upg_ns_ass_smg_medium.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_medium/wpn_third_upg_ns_ass_smg_medium"
	self.parts.wpn_fps_upg_ns_ass_smg_small.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_small/wpn_third_upg_ns_ass_smg_small"
	self.parts.wpn_fps_upg_ns_pis_large.third_unit = "units/payday2/weapons/wpn_third_upg_ns_pis_large/wpn_third_upg_ns_pis_large"
	self.parts.wpn_fps_upg_ns_pis_medium.third_unit = "units/payday2/weapons/wpn_third_upg_ns_pis_medium/wpn_third_upg_ns_pis_medium"
	self.parts.wpn_fps_upg_ns_pis_small.third_unit = "units/payday2/weapons/wpn_third_upg_ns_pis_small/wpn_third_upg_ns_pis_small"
	self.parts.wpn_fps_upg_ns_shot_thick.third_unit = "units/payday2/weapons/wpn_third_upg_ns_shot_thick/wpn_third_upg_ns_shot_thick"
end

function WeaponFactoryTweakData_37:_init_nozzles()
	self.parts.wpn_fps_upg_ns_ass_smg_firepig = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel_ext",
		name_id = "bm_wp_upg_ns_ass_smg_firepig",
		a_obj = "a_ns",
		parent = "barrel",
		unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_firepig/wpn_fps_upg_ns_ass_smg_firepig",
		stats = {
			value = 5,
			suppression = -5,
			damage = 3,
			recoil = 1,
			concealment = -2
		}
	}
	self.parts.wpn_fps_upg_ns_ass_smg_stubby = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel_ext",
		name_id = "bm_wp_upg_ns_ass_smg_stubby",
		a_obj = "a_ns",
		parent = "barrel",
		unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_stubby/wpn_fps_upg_ns_ass_smg_stubby",
		stats = {
			value = 3,
			suppression = -1,
			damage = 1,
			recoil = 3
		}
	}
	self.parts.wpn_fps_upg_ns_ass_smg_tank = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel_ext",
		name_id = "bm_wp_upg_ns_ass_smg_tank",
		a_obj = "a_ns",
		parent = "barrel",
		unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_tank/wpn_fps_upg_ns_ass_smg_tank",
		stats = {
			value = 4,
			suppression = -2,
			damage = 2,
			recoil = 2,
			concealment = -1
		}
	}
	self.parts.wpn_fps_upg_ns_shot_shark = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel_ext",
		name_id = "bm_wp_upg_ns_shot_shark",
		a_obj = "a_ns",
		parent = "barrel",
		unit = "units/payday2/weapons/wpn_fps_upg_ns_shot_shark/wpn_fps_upg_ns_shot_shark",
		stats = {
			value = 5,
			suppression = -2,
			damage = 2,
			recoil = 2,
			spread = -2,
			concealment = -2
		}
	}
	self.parts.wpn_fps_upg_ns_ass_smg_firepig.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_firepig/wpn_third_upg_ns_ass_smg_firepig"
	self.parts.wpn_fps_upg_ns_ass_smg_stubby.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_stubby/wpn_third_upg_ns_ass_smg_stubby"
	self.parts.wpn_fps_upg_ns_ass_smg_tank.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_tank/wpn_third_upg_ns_ass_smg_tank"
	self.parts.wpn_fps_upg_ns_shot_shark.third_unit = "units/payday2/weapons/wpn_third_upg_ns_shot_shark/wpn_third_upg_ns_shot_shark"
end

function WeaponFactoryTweakData_37:_init_gadgets()
	self.parts.wpn_fps_addon_ris = {
		type = "extra",
		name_id = "bm_wp_upg_fl_pis_tlr1",
		a_obj = "a_fl",
		unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_addon_ris",
		stats = {value = 1}
	}
	self.parts.wpn_fps_addon_ris.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_addon_ris"
	self.parts.wpn_fps_upg_fl_ass_smg_sho_surefire = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "gadget",
		sub_type = "flashlight",
		name_id = "bm_wp_upg_fl_ass_smg_sho_surefire",
		a_obj = "a_fl",
		unit = "units/payday2/weapons/wpn_fps_upg_fl_ass_smg_sho_surefire/wpn_fps_upg_fl_ass_smg_sho_surefire",
		stats = {
			value = 3,
			spread_moving = -1,
			concealment = -1
		},
		adds = {
			"wpn_fps_addon_ris"
		}
	}
	self.parts.wpn_fps_upg_fl_ass_smg_sho_peqbox = {
		pcs = {
			20,
			30,
			40
		},
		type = "gadget",
		sub_type = "laser",
		name_id = "bm_wp_upg_fl_ass_smg_sho_peqbox",
		a_obj = "a_fl",
		unit = "units/payday2/weapons/wpn_fps_upg_fl_ass_smg_sho_peqbox/wpn_fps_upg_fl_ass_smg_sho_peqbox",
		stats = {
			value = 5,
			spread_moving = -1,
			concealment = -1
		},
		adds = {
			"wpn_fps_addon_ris"
		}
	}
	self.parts.wpn_fps_upg_fl_pis_laser = {
		pcs = {
			20,
			30,
			40
		},
		type = "gadget",
		sub_type = "laser",
		name_id = "bm_wp_upg_fl_pis_laser",
		a_obj = "a_fl",
		unit = "units/payday2/weapons/wpn_fps_upg_fl_pis_laser/wpn_fps_upg_fl_pis_laser",
		stats = {
			value = 5,
			spread_moving = -1,
			concealment = -1
		}
	}
	self.parts.wpn_fps_upg_fl_pis_tlr1 = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "gadget",
		sub_type = "flashlight",
		name_id = "bm_wp_upg_fl_pis_tlr1",
		a_obj = "a_fl",
		unit = "units/payday2/weapons/wpn_fps_upg_fl_pis_tlr1/wpn_fps_upg_fl_pis_tlr1",
		stats = {
			value = 2,
			spread_moving = -1,
			concealment = -1
		}
	}
	self.parts.wpn_fps_upg_fl_ass_smg_sho_surefire.third_unit = "units/payday2/weapons/wpn_third_upg_fl_ass_smg_sho_surefire/wpn_third_upg_fl_ass_smg_sho_surefire"
	self.parts.wpn_fps_upg_fl_ass_smg_sho_peqbox.third_unit = "units/payday2/weapons/wpn_third_upg_fl_ass_smg_sho_peqbox/wpn_third_upg_fl_ass_smg_sho_peqbox"
	self.parts.wpn_fps_upg_fl_pis_laser.third_unit = "units/payday2/weapons/wpn_third_upg_fl_pis_laser/wpn_third_upg_fl_pis_laser"
	self.parts.wpn_fps_upg_fl_pis_tlr1.third_unit = "units/payday2/weapons/wpn_third_upg_fl_pis_tlr1/wpn_third_upg_fl_pis_tlr1"
end

function WeaponFactoryTweakData_37:_init_vertical_grips()
	self.parts.wpn_fps_upg_vg_ass_smg_verticalgrip = {
		type = "vertical_grip",
		name_id = "bm_wp_upg_vg_ass_smg_verticalgrip",
		a_obj = "a_vg",
		unit = "units/payday2/weapons/wpn_fps_upg_vg_ass_smg_verticalgrip/wpn_fps_upg_vg_ass_smg_verticalgrip",
		stats = {
			value = 2,
			spread = 1,
			spread_moving = 2,
			concealment = -1
		}
	}
	self.parts.wpn_fps_upg_vg_ass_smg_stubby = {
		type = "vertical_grip",
		name_id = "bm_wp_upg_vg_ass_smg_stubby",
		a_obj = "a_vg",
		unit = "units/payday2/weapons/wpn_fps_upg_vg_ass_smg_stubby/wpn_fps_upg_vg_ass_smg_stubby",
		stats = {
			value = 2,
			spread = 1,
			spread_moving = 2,
			concealment = 1
		}
	}
	self.parts.wpn_fps_upg_vg_ass_smg_afg = {
		type = "vertical_grip",
		name_id = "bm_wp_upg_vg_ass_smg_afg",
		a_obj = "a_vg",
		unit = "units/payday2/weapons/wpn_fps_upg_vg_ass_smg_afg/wpn_fps_upg_vg_ass_smg_afg",
		stats = {
			value = 2,
			spread = 1,
			spread_moving = 2,
			concealment = -1
		}
	}
	self.parts.wpn_fps_upg_vg_ass_smg_verticalgrip.third_unit = "units/payday2/weapons/wpn_third_upg_vg_ass_smg_verticalgrip/wpn_third_upg_vg_ass_smg_verticalgrip"
	self.parts.wpn_fps_upg_vg_ass_smg_stubby.third_unit = "units/payday2/weapons/wpn_third_upg_vg_ass_smg_stubby/wpn_third_upg_vg_ass_smg_stubby"
	self.parts.wpn_fps_upg_vg_ass_smg_afg.third_unit = "units/payday2/weapons/wpn_third_upg_vg_ass_smg_afg/wpn_third_upg_vg_ass_smg_afg"
	self.parts.wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla = deep_clone(self.parts.wpn_fps_upg_vg_ass_smg_verticalgrip)
	self.parts.wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla.stats = nil
	self.parts.wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla.pc = nil
end

function WeaponFactoryTweakData_37:_init_sights()
	self.parts.wpn_fps_upg_o_specter = {
		pcs = {30, 40},
		type = "sight",
		name_id = "bm_wp_upg_o_specter",
		a_obj = "a_o",
		unit = "units/payday2/weapons/wpn_fps_upg_o_specter/wpn_fps_upg_o_specter",
		stats = {
			value = 8,
			zoom = 4,
			recoil = 1,
			spread_moving = -3,
			concealment = -3
		},
		perks = {"scope"},
		stance_mod = {
			wpn_fps_ass_m4 = {
				translation = Vector3(0, 0, -0.58)
			},
			wpn_fps_ass_m16 = {
				translation = Vector3(0, 0, -0.12)
			},
			wpn_fps_smg_olympic = {
				translation = Vector3(0, 0, -0.12)
			},
			wpn_fps_ass_74 = {
				translation = Vector3(0, 0, -3.1)
			},
			wpn_fps_ass_akm = {
				translation = Vector3(0, 0, -3.2)
			},
			wpn_fps_ass_akm_gold = {
				translation = Vector3(0, 0, -3.2)
			},
			wpn_fps_shot_saiga = {
				translation = Vector3(0, 0, -3)
			},
			wpn_fps_shot_r870 = {
				translation = Vector3(0, 0, -3)
			},
			wpn_fps_shot_serbu = {
				translation = Vector3(0, 0, -3)
			},
			wpn_fps_smg_akmsu = {
				translation = Vector3(0, 0, -3.3)
			},
			wpn_fps_ass_ak5 = {
				translation = Vector3(0, 0, -3.65)
			},
			wpn_fps_ass_aug = {
				translation = Vector3(0, 0, -2.8)
			},
			wpn_fps_ass_g36 = {
				translation = Vector3(0, 0, -3)
			},
			wpn_fps_smg_p90 = {
				translation = Vector3(0, 0, -2.97)
			},
			wpn_fps_ass_m14 = {
				translation = Vector3(0, 0, -3.8)
			},
			wpn_fps_smg_mp9 = {
				translation = Vector3(0, 0, -3.47)
			},
			wpn_fps_smg_mp5 = {
				translation = Vector3(0, 0, -3)
			},
			wpn_fps_smg_mac10 = {
				translation = Vector3(0, -10, -3)
			},
			wpn_fps_ass_s552 = {
				translation = Vector3(-0.08, 0, -2.1)
			},
			wpn_fps_smg_m45 = {
				translation = Vector3(0, 0, -3.9)
			},
			wpn_fps_smg_mp7 = {
				translation = Vector3(0, 0, -2.8)
			},
			wpn_fps_ass_scar = {
				translation = Vector3(0, 0, -0.25)
			},
			wpn_fps_pis_rage = {
				translation = Vector3(0, -10, -4.5)
			},
			wpn_fps_pis_deagle = {
				translation = Vector3(0, -15, -4.3)
			},
			wpn_fps_snp_m95 = {
				translation = Vector3(0, 4, -3.8)
			},
			wpn_fps_snp_msr = {
				translation = Vector3(0, -7, -3.55)
			},
			wpn_fps_snp_r93 = {
				translation = Vector3(0, -7, -3.8)
			},
			wpn_fps_ass_fal = {
				translation = Vector3(0, 4, -3.5)
			},
			wpn_fps_sho_ben = {
				translation = Vector3(0, 0, -3.2)
			},
			wpn_fps_sho_striker = {
				translation = Vector3(0, 0, -2.8)
			},
			wpn_fps_sho_ksg = {
				translation = Vector3(0, 0, -1.3)
			},
			wpn_fps_smg_scorpion = {
				translation = Vector3(0, -10, -5.2)
			},
			wpn_fps_smg_tec9 = {
				translation = Vector3(0, -8, -5),
				rotation = Rotation(0, 0, 0)
			},
			wpn_fps_smg_uzi = {
				translation = Vector3(0, -8, -5)
			},
			wpn_fps_pis_judge = {
				translation = Vector3(0, -10, -6)
			},
			wpn_fps_ass_g3 = {
				translation = Vector3(0, -8, -3.2)
			},
			wpn_fps_ass_galil = {
				translation = Vector3(0, -5, -3.3)
			},
			wpn_fps_ass_famas = {
				translation = Vector3(0, 7, -6.2)
			}
		},
		forbids = {
			"wpn_fps_amcar_uupg_body_upperreciever",
			"wpn_fps_ass_m16_os_frontsight",
			"wpn_fps_ass_scar_o_flipups_up"
		},
		texture_switch = {
			material = "sight",
			channel = "diffuse_texture"
		}
	}
	self.parts.wpn_fps_upg_o_aimpoint = {
		pcs = {30, 40},
		type = "sight",
		name_id = "bm_wp_upg_o_aimpoint",
		a_obj = "a_o",
		unit = "units/payday2/weapons/wpn_fps_upg_o_aimpoint/wpn_fps_upg_o_aimpoint",
		stats = {
			value = 8,
			zoom = 4,
			recoil = 1,
			spread_moving = -3,
			concealment = -3
		},
		perks = {"scope"},
		stance_mod = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod),
		forbids = {
			"wpn_fps_amcar_uupg_body_upperreciever",
			"wpn_fps_ass_m16_os_frontsight",
			"wpn_fps_ass_scar_o_flipups_up"
		},
		texture_switch = {
			material = "sight",
			channel = "diffuse_texture"
		}
	}
	self.parts.wpn_fps_upg_o_aimpoint_2 = {
		pcs = {
			10,
			20,
			30,
			40
		},
		dlc = "preorder",
		type = "sight",
		name_id = "bm_wp_upg_o_aimpoint",
		a_obj = "a_o",
		unit = "units/payday2/weapons/wpn_fps_upg_o_aimpoint/wpn_fps_upg_o_aimpoint_preorder",
		stats = {
			value = 1,
			zoom = 4,
			recoil = 1,
			spread_moving = -3,
			concealment = -3
		},
		perks = {"scope"},
		stance_mod = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod),
		forbids = {
			"wpn_fps_amcar_uupg_body_upperreciever",
			"wpn_fps_ass_m16_os_frontsight",
			"wpn_fps_ass_scar_o_flipups_up"
		},
		texture_switch = {
			material = "sight",
			channel = "diffuse_texture"
		}
	}
	self.parts.wpn_fps_upg_o_docter = {
		pcs = {
			20,
			30,
			40
		},
		type = "sight",
		name_id = "bm_wp_upg_o_docter",
		a_obj = "a_o",
		unit = "units/payday2/weapons/wpn_fps_upg_o_docter/wpn_fps_upg_o_docter",
		stats = {
			value = 5,
			zoom = 2,
			recoil = 1,
			spread_moving = -1,
			concealment = -1
		},
		perks = {"scope"},
		stance_mod = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod),
		forbids = {
			"wpn_fps_amcar_uupg_body_upperreciever",
			"wpn_fps_ass_m16_os_frontsight",
			"wpn_fps_ass_scar_o_flipups_up"
		},
		texture_switch = {
			material = "sight",
			channel = "diffuse_texture"
		}
	}
	self.parts.wpn_fps_upg_o_eotech = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "sight",
		name_id = "bm_wp_upg_o_eotech",
		a_obj = "a_o",
		unit = "units/payday2/weapons/wpn_fps_upg_o_eotech/wpn_fps_upg_o_eotech",
		stats = {
			value = 3,
			zoom = 3,
			recoil = 1,
			spread_moving = -2,
			concealment = -2
		},
		perks = {"scope"},
		stance_mod = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod),
		forbids = {
			"wpn_fps_amcar_uupg_body_upperreciever",
			"wpn_fps_ass_m16_os_frontsight",
			"wpn_fps_ass_scar_o_flipups_up"
		},
		texture_switch = {
			material = "gfx_reddot",
			channel = "diffuse_texture"
		}
	}
	self.parts.wpn_fps_upg_o_t1micro = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "sight",
		name_id = "bm_wp_upg_o_t1micro",
		a_obj = "a_o",
		unit = "units/payday2/weapons/wpn_fps_upg_o_t1micro/wpn_fps_upg_o_t1micro",
		stats = {
			value = 3,
			zoom = 3,
			recoil = 1,
			spread_moving = -1,
			concealment = -1
		},
		perks = {"scope"},
		stance_mod = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod),
		forbids = {
			"wpn_fps_amcar_uupg_body_upperreciever",
			"wpn_fps_ass_m16_os_frontsight",
			"wpn_fps_ass_scar_o_flipups_up"
		},
		texture_switch = {
			material = "sight",
			channel = "diffuse_texture"
		}
	}
	self.parts.wpn_upg_o_marksmansight_rear = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "sight",
		name_id = "bm_wp_upg_o_marksmansight_rear",
		a_obj = "a_o",
		unit = "units/payday2/weapons/wpn_fps_upg_o_marksmansight/wpn_upg_o_marksmansight_rear",
		stats = {
			value = 5,
			zoom = 1,
			recoil = 1,
			spread = 1
		},
		perks = {"scope"},
		adds = {
			"wpn_upg_o_marksmansight_front"
		}
	}
	self.parts.wpn_upg_o_marksmansight_front = {
		type = "extra",
		name_id = "bm_wp_upg_o_marksmansight_front",
		a_obj = "a_o",
		unit = "units/payday2/weapons/wpn_fps_upg_o_marksmansight/wpn_upg_o_marksmansight_front"
	}
	self.parts.wpn_fps_upg_o_dd_rear = {
		type = "sight",
		name_id = "bm_wp_upg_o_dd_rear",
		a_obj = "a_o_r",
		unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_upg_o_dd/wpn_fps_upg_o_dd_rear",
		stats = {value = 1},
		perks = {"scope"},
		stance_mod = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod),
		adds = {
			"wpn_fps_upg_o_dd_front"
		}
	}
	self.parts.wpn_fps_upg_o_dd_front = {
		type = "extra",
		name_id = "bm_wp_upg_o_dd_front",
		a_obj = "a_o_f",
		unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_upg_o_dd/wpn_fps_upg_o_dd_front"
	}
	self.parts.wpn_fps_upg_o_specter.third_unit = "units/payday2/weapons/wpn_third_upg_o_specter/wpn_third_upg_o_specter"
	self.parts.wpn_fps_upg_o_docter.third_unit = "units/payday2/weapons/wpn_third_upg_o_docter/wpn_third_upg_o_docter"
	self.parts.wpn_fps_upg_o_aimpoint.third_unit = "units/payday2/weapons/wpn_third_upg_o_aimpoint/wpn_third_upg_o_aimpoint"
	self.parts.wpn_fps_upg_o_aimpoint_2.third_unit = "units/payday2/weapons/wpn_third_upg_o_aimpoint/wpn_third_upg_o_aimpoint_preorder"
	self.parts.wpn_fps_upg_o_eotech.third_unit = "units/payday2/weapons/wpn_third_upg_o_eotech/wpn_third_upg_o_eotech"
	self.parts.wpn_fps_upg_o_t1micro.third_unit = "units/payday2/weapons/wpn_third_upg_o_t1micro/wpn_third_upg_o_t1micro"
	self.parts.wpn_upg_o_marksmansight_rear.third_unit = "units/payday2/weapons/wpn_third_upg_o_marksmansight/wpn_third_upg_o_marksmansight_rear"
	self.parts.wpn_upg_o_marksmansight_front.third_unit = "units/payday2/weapons/wpn_third_upg_o_marksmansight/wpn_third_upg_o_marksmansight_front"
	self.parts.wpn_fps_upg_o_dd_rear.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_upg_o_dd/wpn_third_upg_o_dd_rear"
	self.parts.wpn_fps_upg_o_dd_front.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_upg_o_dd/wpn_third_upg_o_dd_front"
	self.parts.wpn_upg_o_marksmansight_rear_vanilla = deep_clone(self.parts.wpn_upg_o_marksmansight_rear)
	self.parts.wpn_upg_o_marksmansight_rear_vanilla.stats = nil
	self.parts.wpn_upg_o_marksmansight_rear_vanilla.pcs = nil
	self.parts.wpn_upg_o_marksmansight_rear_vanilla.perks = nil
	self.parts.wpn_upg_o_marksmansight_front_vanilla = deep_clone(self.parts.wpn_upg_o_marksmansight_front)
	self.parts.wpn_upg_o_marksmansight_front_vanilla.stats = nil
	self.parts.wpn_upg_o_marksmansight_front_vanilla.pc = nil
	self.parts.wpn_upg_o_marksmansight_front_vanilla.perks = nil
	self.parts.wpn_fps_extra_zoom = {
		type = "extra",
		a_obj = "a_o",
		sub_type = "flashlight",
		unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_extra_zoom/wpn_fps_extra_zoom",
		stats = {value = 1, zoom = 8},
		perks = {"gadget"}
	}
	self.parts.wpn_fps_upg_o_45iron = {
		pcs = {},
		type = "gadget",
		name_id = "bm_wpn_fps_upg_o_45iron",
		a_obj = "a_o",
		sub_type = "second_sight",
		unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_upg_o_45iron/wpn_fps_upg_o_45iron",
		stats = {value = 1, gadget_zoom = 1},
		perks = {"gadget"},
		texture_bundle_folder = "gage_pack_snp",
		dlc = "gage_pack_snp",
		is_a_unlockable = true,
		stance_mod = {
			wpn_fps_snp_m95 = {
				translation = Vector3(-0.36, 6, -14.5),
				rotation = Rotation(0, 0, -45)
			},
			wpn_fps_snp_msr = {
				translation = Vector3(-0.9, 8, -12.8),
				rotation = Rotation(0, 0, -45)
			},
			wpn_fps_snp_r93 = {
				translation = Vector3(-2.4, 8, -13.8),
				rotation = Rotation(0, 0, -45)
			}
		}
	}
	self.parts.wpn_fps_upg_o_shortdot = {
		type = "sight",
		name_id = "bm_wp_upg_o_specter",
		a_obj = "a_o",
		unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_upg_o_shortdot/wpn_fps_upg_o_shortdot",
		stats = {value = 1, zoom = 6},
		perks = {"scope"},
		stance_mod = {
			wpn_fps_snp_m95 = {
				translation = Vector3(0, -22, -4.56)
			},
			wpn_fps_snp_msr = {
				translation = Vector3(0, -32, -4.3)
			},
			wpn_fps_snp_r93 = {
				translation = Vector3(0, -28, -4.52)
			}
		},
		texture_bundle_folder = "gage_pack_snp",
		dlc = "gage_pack_snp",
		is_a_unlockable = true,
		texture_switch = {
			material = "gfx_reddot1",
			channel = "diffuse_texture"
		}
	}
	self.parts.wpn_fps_upg_o_leupold = {
		pcs = {},
		type = "sight",
		name_id = "bm_wp_upg_o_leupold",
		a_obj = "a_o",
		unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_upg_o_leupold/wpn_fps_upg_o_leupold",
		stats = {
			value = 8,
			zoom = 10,
			recoil = 1,
			spread_moving = -3,
			concealment = -3
		},
		perks = {"scope", "highlight"},
		stance_mod = {
			wpn_fps_snp_m95 = {
				translation = Vector3(0, -23, -4.68)
			},
			wpn_fps_snp_msr = {
				translation = Vector3(0, -34, -4.4)
			},
			wpn_fps_snp_r93 = {
				translation = Vector3(0, -30, -4.63)
			}
		},
		texture_bundle_folder = "gage_pack_snp",
		dlc = "gage_pack_snp",
		is_a_unlockable = true,
		texture_switch = {
			material = "gfx_reddot1",
			channel = "diffuse_texture"
		}
	}
	self.parts.wpn_fps_upg_o_45iron.third_unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_upg_o_45iron/wpn_third_upg_o_45iron"
	self.parts.wpn_fps_upg_o_shortdot.third_unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_upg_o_shortdot/wpn_third_upg_o_shortdot"
	self.parts.wpn_fps_upg_o_leupold.third_unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_upg_o_leupold/wpn_third_upg_o_leupold"
end

function WeaponFactoryTweakData_37:_init_content_dlc1()
	self.parts.wpn_fps_upg_o_cmore = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "sight",
		name_id = "bm_wp_upg_o_cmore",
		texture_bundle_folder = "dlc1",
		a_obj = "a_o",
		unit = "units/pd2_dlc1/weapons/wpn_fps_upg_o_cmore/wpn_fps_upg_o_cmore",
		stats = {
			value = 5,
			zoom = 3,
			recoil = 1,
			spread_moving = -1,
			concealment = -1
		},
		perks = {"scope"},
		stance_mod = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod),
		forbids = {
			"wpn_fps_amcar_uupg_body_upperreciever",
			"wpn_fps_ass_m16_os_frontsight",
			"wpn_fps_ass_scar_o_flipups_up"
		},
		dlc = "armored_transport",
		texture_switch = {
			material = "gfx_reddot",
			channel = "diffuse_texture"
		}
	}
	self.parts.wpn_fps_upg_o_cmore.third_unit = "units/pd2_dlc1/weapons/wpn_third_upg_o_cmore/wpn_third_upg_o_cmore"
end

function WeaponFactoryTweakData_37:_init_content_dlc2()
	self.parts.wpn_fps_upg_i_singlefire = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "custom",
		sub_type = "singlefire",
		name_id = "bm_wp_upg_i_singlefire",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		stats = {
			value = 5,
			spread = 1,
			recoil = -2
		},
		perks = {
			"fire_mode_single"
		},
		internal_part = true,
		dlc = "gage_pack"
	}
	self.parts.wpn_fps_upg_i_autofire = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "custom",
		sub_type = "autofire",
		name_id = "bm_wp_upg_i_autofire",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		stats = {
			value = 8,
			damage = 1,
			spread = -1,
			recoil = 2,
			spread_moving = 2
		},
		perks = {
			"fire_mode_auto"
		},
		internal_part = true,
		dlc = "gage_pack"
	}
	self.parts.wpn_fps_upg_m4_g_hgrip = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "grip",
		name_id = "bm_wp_upg_m4_g_hgrip",
		a_obj = "a_g",
		unit = "units/pd2_dlc_dec5/weapons/wpn_fps_upg_m4_g_hgrip/wpn_fps_upg_m4_g_hgrip",
		stats = {
			value = 2,
			spread_moving = 2,
			recoil = 1,
			spread = 1
		},
		dlc = "gage_pack",
		texture_bundle_folder = "gage_pack"
	}
	self.parts.wpn_fps_upg_m4_g_hgrip.third_unit = "units/pd2_dlc_dec5/weapons/wpn_third_upg_m4_g_hgrip/wpn_third_upg_m4_g_hgrip"
	self.parts.wpn_fps_upg_m4_g_mgrip = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "grip",
		name_id = "bm_wp_upg_m4_g_mgrip",
		a_obj = "a_g",
		unit = "units/pd2_dlc_dec5/weapons/wpn_fps_upg_m4_g_mgrip/wpn_fps_upg_m4_g_mgrip",
		stats = {
			value = 2,
			spread_moving = 2,
			concealment = 2
		},
		dlc = "gage_pack",
		texture_bundle_folder = "gage_pack"
	}
	self.parts.wpn_fps_upg_m4_g_mgrip.third_unit = "units/pd2_dlc_dec5/weapons/wpn_third_upg_m4_g_mgrip/wpn_third_upg_m4_g_mgrip"
	self.parts.wpn_fps_upg_m4_g_hgrip_vanilla = deep_clone(self.parts.wpn_fps_upg_m4_g_hgrip)
	self.parts.wpn_fps_upg_m4_g_hgrip_vanilla.stats = nil
	self.parts.wpn_fps_upg_m4_g_hgrip_vanilla.pcs = nil
end

function WeaponFactoryTweakData_37:_init_content_dlc2_dec16()
	self.parts.wpn_fps_upg_o_acog = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "sight",
		name_id = "bm_wp_upg_o_acog",
		a_obj = "a_o",
		unit = "units/pd2_dlc2/weapons/wpn_fps_upg_o_acog/wpn_fps_upg_o_acog",
		stats = {
			value = 6,
			zoom = 5,
			recoil = 1,
			spread_moving = -1,
			concealment = -3
		},
		perks = {"scope"},
		stance_mod = {
			wpn_fps_ass_m4 = {
				translation = Vector3(0, 0, -0.58)
			},
			wpn_fps_ass_m16 = {
				translation = Vector3(0, 0, -0.12)
			},
			wpn_fps_smg_olympic = {
				translation = Vector3(0, 0, -0.12)
			},
			wpn_fps_ass_74 = {
				translation = Vector3(0, 0, -3.1)
			},
			wpn_fps_ass_akm = {
				translation = Vector3(0, -16, -3.2)
			},
			wpn_fps_ass_akm_gold = {
				translation = Vector3(0, -16, -3.2)
			},
			wpn_fps_shot_saiga = {
				translation = Vector3(0, 0, -3)
			},
			wpn_fps_shot_r870 = {
				translation = Vector3(0, 0, -3)
			},
			wpn_fps_shot_serbu = {
				translation = Vector3(0, 0, -3.3)
			},
			wpn_fps_smg_akmsu = {
				translation = Vector3(0, 0, -3.3)
			},
			wpn_fps_ass_ak5 = {
				translation = Vector3(0, 0, -3.65)
			},
			wpn_fps_ass_aug = {
				translation = Vector3(0, 0, -2.8)
			},
			wpn_fps_ass_g36 = {
				translation = Vector3(0, 0, -3)
			},
			wpn_fps_smg_p90 = {
				translation = Vector3(0, 0, -2.97)
			},
			wpn_fps_ass_m14 = {
				translation = Vector3(0, -15, -3.8)
			},
			wpn_fps_smg_mp9 = {
				translation = Vector3(0, 0, -3.47)
			},
			wpn_fps_smg_mp5 = {
				translation = Vector3(0, 0, -3)
			},
			wpn_fps_smg_mac10 = {
				translation = Vector3(0, -10, -3)
			},
			wpn_fps_ass_s552 = {
				translation = Vector3(-0.08, 0, -2.1)
			},
			wpn_fps_smg_m45 = {
				translation = Vector3(0, -10, -3.9)
			},
			wpn_fps_smg_mp7 = {
				translation = Vector3(0, 0, -2.8)
			},
			wpn_fps_ass_scar = {
				translation = Vector3(0, 0, -0.25)
			},
			wpn_fps_lmg_hk21 = {
				translation = Vector3(0, 0, -3.2)
			},
			wpn_fps_lmg_m249 = {
				translation = Vector3(0, 0, -3.2)
			},
			wpn_fps_pis_rage = {
				translation = Vector3(0, -15, -4.5)
			},
			wpn_fps_pis_deagle = {
				translation = Vector3(0, -18, -4.3)
			},
			wpn_fps_snp_m95 = {
				translation = Vector3(0, -1, -3.8)
			},
			wpn_fps_snp_msr = {
				translation = Vector3(0, -7, -3.8)
			},
			wpn_fps_snp_r93 = {
				translation = Vector3(0, -7, -3.8)
			},
			wpn_fps_ass_fal = {
				translation = Vector3(0, 7, -3.5)
			},
			wpn_fps_sho_ben = {
				translation = Vector3(0, 0, -3.2)
			},
			wpn_fps_sho_striker = {
				translation = Vector3(0, 5, -2.8)
			},
			wpn_fps_sho_ksg = {
				translation = Vector3(0, 0, -1.3)
			},
			wpn_fps_smg_scorpion = {
				translation = Vector3(0, -8, -5.2)
			},
			wpn_fps_smg_tec9 = {
				translation = Vector3(0, 0, -4.9)
			},
			wpn_fps_smg_uzi = {
				translation = Vector3(0, 0, -5.2)
			},
			wpn_fps_pis_judge = {
				translation = Vector3(0, -10, -5.4)
			},
			wpn_fps_ass_g3 = {
				translation = Vector3(0, -8, -3.2)
			},
			wpn_fps_ass_galil = {
				translation = Vector3(0, -2, -3.3)
			},
			wpn_fps_ass_famas = {
				translation = Vector3(0, -5, -6.2)
			}
		},
		forbids = {
			"wpn_fps_amcar_uupg_body_upperreciever",
			"wpn_fps_ass_m16_os_frontsight",
			"wpn_fps_ass_scar_o_flipups_up"
		},
		texture_switch = {
			material = "gfx_reddot",
			channel = "diffuse_texture"
		}
	}
	self.parts.wpn_fps_upg_o_acog.third_unit = "units/pd2_dlc2/weapons/wpn_fps_upg_o_acog/wpn_third_upg_o_acog"
end

function WeaponFactoryTweakData_37:_init_content_jobs()
	self.parts.wpn_fps_pis_rage_o_adapter = {
		type = "extra",
		name_id = "bm_wp_pis_rage_o_adapter",
		a_obj = "a_o",
		texture_bundle_folder = "gage_pack_jobs",
		unit = "units/payday2/weapons/wpn_fps_pis_rage_pts/wpn_fps_pis_rage_o_adapter"
	}
	self.parts.wpn_fps_pis_rage_extra = {
		type = "extra",
		name_id = "bm_wp_pis_rage_extra",
		pcs = {},
		a_obj = "a_o",
		texture_bundle_folder = "gage_pack_jobs",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_pis_rage_extra/wpn_fps_pis_rage_extra",
		stats = {value = 2},
		internal_part = true,
		dlc = "gage_pack_jobs",
		override = {
			wpn_fps_pis_rage_body_smooth = {
				adds = {}
			},
			wpn_fps_pis_rage_body_standard = {
				adds = {}
			}
		}
	}
	self.parts.wpn_fps_pis_rage_lock = {
		type = "extra",
		name_id = "bm_wp_pis_rage_extra",
		a_obj = "a_o",
		texture_bundle_folder = "gage_pack_jobs",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_pis_rage_extra/wpn_fps_pis_rage_extra",
		stats = {value = 1},
		forbids = {
			"wpn_fps_upg_o_specter",
			"wpn_fps_upg_o_aimpoint",
			"wpn_fps_upg_o_docter",
			"wpn_fps_upg_o_eotech",
			"wpn_fps_upg_o_t1micro",
			"wpn_fps_upg_o_rx30",
			"wpn_fps_upg_o_rx01",
			"wpn_fps_upg_o_reflex",
			"wpn_fps_upg_o_eotech_xps",
			"wpn_fps_upg_o_cmore",
			"wpn_fps_upg_o_aimpoint_2",
			"wpn_fps_upg_o_acog",
			"wpn_fps_upg_o_cs"
		}
	}
	self.parts.wpn_fps_pis_deagle_extra = {
		type = "extra",
		name_id = "bm_wp_pis_deagle_extra",
		pcs = {},
		a_obj = "a_quite",
		texture_bundle_folder = "gage_pack_jobs",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_pis_deagle_extra/wpn_fps_pis_deagle_extra",
		stats = {value = 2},
		internal_part = true,
		dlc = "gage_pack_jobs",
		override = {
			wpn_fps_pis_deagle_body_standard = {
				adds = {}
			},
			wpn_fps_pis_rage_o_adapter = {a_obj = "a_quite"}
		}
	}
	self.parts.wpn_fps_pis_deagle_lock = {
		type = "extra",
		name_id = "bm_wp_pis_rage_extra",
		a_obj = "a_quite",
		texture_bundle_folder = "gage_pack_jobs",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_pis_rage_extra/wpn_fps_pis_rage_extra",
		stats = {value = 1},
		forbids = {
			"wpn_fps_upg_o_specter",
			"wpn_fps_upg_o_aimpoint",
			"wpn_fps_upg_o_docter",
			"wpn_fps_upg_o_eotech",
			"wpn_fps_upg_o_t1micro",
			"wpn_fps_upg_o_rx30",
			"wpn_fps_upg_o_rx01",
			"wpn_fps_upg_o_reflex",
			"wpn_fps_upg_o_eotech_xps",
			"wpn_fps_upg_o_cmore",
			"wpn_fps_upg_o_aimpoint_2",
			"wpn_fps_upg_o_acog",
			"wpn_fps_upg_o_cs"
		}
	}
	self.parts.wpn_fps_pis_rage_o_adapter.third_unit = "units/payday2/weapons/wpn_third_pis_rage_pts/wpn_third_pis_rage_o_adapter"
	self.parts.wpn_fps_m4_upg_b_sd_smr = {
		type = "barrel",
		name_id = "bm_wp_m4_upg_b_sd_smr",
		texture_bundle_folder = "gage_pack_jobs",
		a_obj = "a_b",
		parent = "barrel",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_fg_smr/wpn_fps_m4_upg_b_sd_smr",
		stats = {value = 1}
	}
	self.parts.wpn_fps_upg_fg_jp = {
		pcs = {},
		type = "foregrip",
		name_id = "bm_wp_upg_fg_jp",
		a_obj = "a_fg",
		texture_bundle_folder = "gage_pack_jobs",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_fg_jp/wpn_fps_upg_fg_jp",
		stats = {
			value = 5,
			spread_moving = 2,
			concealment = 2,
			spread = 2,
			damage = 1,
			recoil = -3
		},
		dlc = "gage_pack_jobs"
	}
	self.parts.wpn_fps_upg_fg_smr = {
		pcs = {},
		type = "foregrip",
		name_id = "bm_wp_upg_fg_smr",
		a_obj = "a_fg",
		texture_bundle_folder = "gage_pack_jobs",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_fg_smr/wpn_fps_upg_fg_smr",
		stats = {
			value = 5,
			spread_moving = -2,
			concealment = -2,
			spread = -1,
			damage = 2,
			recoil = 1
		},
		dlc = "gage_pack_jobs",
		override = {
			wpn_fps_m4_uupg_b_sd = {
				unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_fg_smr/wpn_fps_m4_upg_b_sd_smr",
				third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_fg_smr/wpn_third_m4_upg_b_sd_smr"
			}
		}
	}
	self.parts.wpn_fps_upg_m4_m_quad = {
		pcs = {},
		type = "magazine",
		name_id = "bm_wp_upg_m4_m_quad",
		a_obj = "a_m",
		texture_bundle_folder = "gage_pack_jobs",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_m_quad/wpn_fps_upg_m4_m_quad",
		stats = {
			value = 3,
			spread_moving = -2,
			concealment = -3,
			extra_ammo = 15,
			recoil = 1,
			spread = -1
		},
		dlc = "gage_pack_jobs"
	}
	self.parts.wpn_fps_m4_upg_b_sd_smr.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_fg_smr/wpn_third_m4_upg_b_sd_smr"
	self.parts.wpn_fps_upg_fg_jp.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_fg_jp/wpn_third_upg_fg_jp"
	self.parts.wpn_fps_upg_fg_smr.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_fg_smr/wpn_third_upg_fg_smr"
	self.parts.wpn_fps_upg_m4_m_quad.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_m4_m_quad/wpn_third_upg_m4_m_quad"
	self.parts.wpn_fps_upg_ak_fg_tapco = {
		pcs = {},
		type = "foregrip",
		name_id = "bm_wp_upg_ak_fg_tapco",
		a_obj = "a_fg",
		texture_bundle_folder = "gage_pack_jobs",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_ak_fg_tapco/wpn_fps_upg_ak_fg_tapco",
		stats = {
			value = 5,
			spread_moving = 1,
			concealment = 3,
			spread = 1
		},
		dlc = "gage_pack_jobs"
	}
	self.parts.wpn_fps_upg_fg_midwest = {
		pcs = {},
		type = "foregrip",
		name_id = "bm_wp_upg_fg_midwest",
		a_obj = "a_fg",
		texture_bundle_folder = "gage_pack_jobs",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_fg_midwest/wpn_fps_upg_fg_midwest",
		stats = {
			value = 5,
			spread_moving = -1,
			concealment = -2,
			recoil = 3,
			spread = 1
		},
		dlc = "gage_pack_jobs",
		forbids = {
			"wpn_fps_addon_ris"
		}
	}
	self.parts.wpn_fps_upg_ak_b_draco = {
		pcs = {},
		type = "barrel",
		name_id = "bm_wp_upg_ak_b_draco",
		a_obj = "a_b",
		texture_bundle_folder = "gage_pack_jobs",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_ak_b_draco/wpn_fps_upg_ak_b_draco",
		stats = {
			value = 2,
			spread = -2,
			spread_moving = 2,
			concealment = 1,
			damage = 2
		},
		dlc = "gage_pack_jobs"
	}
	self.parts.wpn_fps_upg_ak_m_quad = {
		pcs = {},
		type = "magazine",
		name_id = "bm_wp_upg_ak_m_quad",
		a_obj = "a_m",
		texture_bundle_folder = "gage_pack_jobs",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_ak_m_quad/wpn_fps_upg_ak_m_quad",
		stats = {
			value = 3,
			spread_moving = -2,
			concealment = -3,
			extra_ammo = 15,
			recoil = 1,
			spread = -1
		},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		},
		dlc = "gage_pack_jobs"
	}
	self.parts.wpn_fps_upg_ak_g_hgrip = {
		pcs = {},
		type = "grip",
		name_id = "bm_wp_upg_ak_g_hgrip",
		a_obj = "a_g",
		texture_bundle_folder = "gage_pack_jobs",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_ak_g_hgrip/wpn_fps_upg_ak_g_hgrip",
		stats = {
			value = 2,
			spread_moving = 2,
			recoil = 2,
			concealment = 2
		},
		forbids = {
			"wpn_upg_ak_g_standard"
		},
		dlc = "gage_pack_jobs"
	}
	self.parts.wpn_fps_upg_ak_g_pgrip = {
		pcs = {},
		type = "grip",
		name_id = "bm_wp_upg_ak_g_pgrip",
		a_obj = "a_g",
		texture_bundle_folder = "gage_pack_jobs",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_ak_g_pgrip/wpn_fps_upg_ak_g_pgrip",
		stats = {
			value = 2,
			spread_moving = -2,
			recoil = -2,
			spread = 2
		},
		forbids = {
			"wpn_upg_ak_g_standard"
		},
		dlc = "gage_pack_jobs"
	}
	self.parts.wpn_fps_upg_ak_g_wgrip = {
		pcs = {},
		type = "grip",
		name_id = "bm_wp_upg_ak_g_wgrip",
		a_obj = "a_g",
		texture_bundle_folder = "gage_pack_jobs",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_ak_g_wgrip/wpn_fps_upg_ak_g_wgrip",
		stats = {
			value = 2,
			spread_moving = 1,
			recoil = 3,
			concealment = -1
		},
		forbids = {
			"wpn_upg_ak_g_standard"
		},
		dlc = "gage_pack_jobs"
	}
	self.parts.wpn_fps_upg_ak_fg_tapco.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_ak_fg_tapco/wpn_third_upg_ak_fg_tapco"
	self.parts.wpn_fps_upg_fg_midwest.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_fg_midwest/wpn_third_upg_fg_midwest"
	self.parts.wpn_fps_upg_ak_b_draco.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_ak_b_draco/wpn_third_upg_ak_b_draco"
	self.parts.wpn_fps_upg_ak_m_quad.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_ak_m_quad/wpn_third_upg_ak_m_quad"
	self.parts.wpn_fps_upg_ak_g_pgrip.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_ak_g_pgrip/wpn_third_upg_ak_g_pgrip"
	self.parts.wpn_fps_upg_ak_g_wgrip.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_ak_g_wgrip/wpn_third_upg_ak_g_wgrip"
	self.parts.wpn_fps_upg_ak_g_hgrip.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_ak_g_hgrip/wpn_third_upg_ak_g_hgrip"
	self.parts.wpn_fps_upg_ass_ns_jprifles = {
		pcs = {},
		type = "barrel_ext",
		name_id = "bm_wp_upg_ass_ns_jprifles",
		a_obj = "a_ns",
		parent = "barrel",
		texture_bundle_folder = "gage_pack_jobs",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_ass_ns_jprifles",
		stats = {
			value = 5,
			suppression = -1,
			damage = 2,
			recoil = 3,
			spread = 1,
			concealment = -2
		},
		dlc = "gage_pack_jobs"
	}
	self.parts.wpn_fps_upg_ass_ns_linear = {
		pcs = {},
		type = "barrel_ext",
		name_id = "bm_wp_upg_ass_ns_linear",
		a_obj = "a_ns",
		parent = "barrel",
		texture_bundle_folder = "gage_pack_jobs",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_ass_ns_linear",
		stats = {
			value = 5,
			suppression = -5,
			damage = 4,
			spread = -2,
			concealment = -2
		},
		dlc = "gage_pack_jobs"
	}
	self.parts.wpn_fps_upg_ass_ns_surefire = {
		pcs = {},
		type = "barrel_ext",
		name_id = "bm_wp_upg_ass_ns_surefire",
		a_obj = "a_ns",
		parent = "barrel",
		texture_bundle_folder = "gage_pack_jobs",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_ass_ns_surefire",
		stats = {
			value = 5,
			suppression = 0,
			damage = 1,
			recoil = -1,
			spread = 3,
			concealment = -2
		},
		dlc = "gage_pack_jobs"
	}
	self.parts.wpn_fps_upg_pis_ns_flash = {
		pcs = {},
		type = "barrel_ext",
		name_id = "bm_wp_upg_pis_ns_flash",
		a_obj = "a_co",
		parent = "slide",
		texture_bundle_folder = "gage_pack_jobs",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_pis_ns_flash",
		stats = {
			value = 4,
			suppression = 0,
			damage = 2,
			recoil = 2,
			spread = -2,
			concealment = 0
		},
		dlc = "gage_pack_jobs"
	}
	self.parts.wpn_fps_upg_shot_ns_king = {
		pcs = {},
		type = "barrel_ext",
		name_id = "bm_wp_upg_shot_ns_king",
		a_obj = "a_ns",
		parent = "barrel",
		texture_bundle_folder = "gage_pack_jobs",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_shot_ns_king",
		stats = {
			value = 5,
			suppression = -5,
			damage = 1,
			spread = 3,
			concealment = -2
		},
		dlc = "gage_pack_jobs"
	}
	self.parts.wpn_fps_upg_ass_ns_jprifles.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_ass_ns_jprifles"
	self.parts.wpn_fps_upg_ass_ns_linear.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_ass_ns_linear"
	self.parts.wpn_fps_upg_ass_ns_surefire.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_ass_ns_surefire"
	self.parts.wpn_fps_upg_pis_ns_flash.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_pis_ns_flash"
	self.parts.wpn_fps_upg_shot_ns_king.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_shot_ns_king"
	self.parts.wpn_fps_upg_ns_pis_medium_slim = {
		pcs = {},
		type = "barrel_ext",
		sub_type = "silencer",
		name_id = "bm_wp_upg_ns_pis_medium_slim",
		a_obj = "a_ns",
		parent = "slide",
		texture_bundle_folder = "gage_pack_jobs",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_ns_pis_medium_slim/wpn_fps_upg_ns_pis_medium_slim",
		stats = {
			value = 1,
			suppression = 12,
			alert_size = 12,
			spread = -2,
			recoil = -1,
			spread_moving = 2,
			concealment = -2
		},
		perks = {"silencer"},
		sound_switch = {
			suppressed = "suppressed_b"
		},
		dlc = "gage_pack_jobs"
	}
	self.parts.wpn_fps_upg_ns_pis_medium_slim.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_ns_pis_medium_slim/wpn_third_upg_ns_pis_medium_slim"
	self.parts.wpn_fps_upg_fl_ass_peq15 = {
		pcs = {},
		type = "gadget",
		sub_type = "laser",
		name_id = "bm_wp_upg_fl_ass_peq15",
		a_obj = "a_fl",
		texture_bundle_folder = "gage_pack_jobs",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_fl_ass_peq15/wpn_fps_upg_fl_ass_peq15",
		stats = {
			value = 5,
			spread_moving = -1,
			concealment = -2,
			recoil = 1
		},
		dlc = "gage_pack_jobs",
		perks = {"gadget"},
		adds = {
			"wpn_fps_addon_ris",
			"wpn_fps_upg_fl_ass_peq15_flashlight"
		}
	}
	self.parts.wpn_fps_upg_fl_ass_peq15_flashlight = {
		type = "extra",
		a_obj = "a_fl",
		sub_type = "flashlight",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_fl_ass_peq15/wpn_fps_upg_fl_ass_peq15_flashlight",
		stats = {value = 1},
		perks = {"gadget"}
	}
	self.parts.wpn_fps_upg_fl_ass_laser = {
		pcs = {},
		type = "gadget",
		sub_type = "laser",
		name_id = "bm_wp_upg_fl_ass_laser",
		a_obj = "a_fl",
		texture_bundle_folder = "gage_pack_jobs",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_fl_ass_laser/wpn_fps_upg_fl_ass_laser",
		stats = {
			value = 2,
			spread_moving = 1,
			concealment = 0
		},
		dlc = "gage_pack_jobs",
		perks = {"gadget"},
		adds = {
			"wpn_fps_addon_ris"
		}
	}
	self.parts.wpn_fps_upg_fl_ass_peq15.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_fl_ass_peq15/wpn_third_upg_fl_ass_peq15"
	self.parts.wpn_fps_upg_fl_ass_laser.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_fl_ass_laser/wpn_third_upg_fl_ass_laser"
	self.parts.wpn_fps_upg_m4_s_crane = {
		pcs = {},
		type = "stock",
		name_id = "bm_wp_upg_m4_s_crane",
		a_obj = "a_s",
		texture_bundle_folder = "gage_pack_jobs",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_s_crane/wpn_fps_upg_m4_s_crane",
		stats = {
			value = 2,
			recoil = 1,
			concealment = 1,
			spread_moving = 1
		},
		dlc = "gage_pack_jobs",
		adds_type = {
			"stock_adapter"
		},
		forbids = {
			"wpn_fps_shot_r870_ris_special"
		}
	}
	self.parts.wpn_fps_upg_m4_s_mk46 = {
		pcs = {},
		type = "stock",
		name_id = "bm_wp_upg_m4_s_mk46",
		a_obj = "a_s",
		texture_bundle_folder = "gage_pack_jobs",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_s_mk46/wpn_fps_upg_m4_s_mk46",
		stats = {
			value = 6,
			recoil = -1,
			concealment = -3,
			spread_moving = -3,
			spread = 2
		},
		dlc = "gage_pack_jobs",
		adds_type = {
			"stock_adapter"
		},
		forbids = {
			"wpn_fps_shot_r870_ris_special"
		}
	}
	self.parts.wpn_fps_upg_m4_s_crane.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_s_crane/wpn_third_upg_m4_s_crane"
	self.parts.wpn_fps_upg_m4_s_mk46.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_s_mk46/wpn_third_upg_m4_s_mk46"
	self.parts.wpn_fps_upg_o_rmr = {
		pcs = {},
		type = "sight",
		name_id = "bm_wp_upg_o_rmr",
		a_obj = "a_rds",
		parent = "body",
		texture_bundle_folder = "gage_pack_jobs",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_o_rmr/wpn_fps_upg_o_rmr",
		stats = {
			value = 6,
			zoom = 3,
			spread = 1,
			spread_moving = -1,
			concealment = -1
		},
		perks = {"scope"},
		stance_mod = {
			wpn_fps_pis_1911 = {
				translation = Vector3(0, 0, -0.45)
			},
			wpn_fps_pis_beretta = {
				translation = Vector3(0, 0, -0.34)
			},
			wpn_fps_pis_deagle = {
				translation = Vector3(0, 0, -0.45)
			},
			wpn_fps_pis_g17 = {
				translation = Vector3(0, 0, -1)
			},
			wpn_fps_pis_g18c = {
				translation = Vector3(0, 0, -0.45)
			},
			wpn_fps_pis_usp = {
				translation = Vector3(0, 0, -0.1)
			},
			wpn_fps_pis_ppk = {
				translation = Vector3(0, 0, -1)
			},
			wpn_fps_pis_p226 = {
				translation = Vector3(0, 0, -0.6)
			},
			wpn_fps_pis_g22c = {
				translation = Vector3(0, 0, -0.45)
			}
		},
		dlc = "gage_pack_jobs",
		texture_switch = {
			material = "gfx_reddot",
			channel = "diffuse_texture"
		}
	}
	self.parts.wpn_fps_upg_o_eotech_xps = {
		pcs = {},
		type = "sight",
		name_id = "bm_wp_upg_o_eotech_xps",
		a_obj = "a_o",
		texture_bundle_folder = "gage_pack_jobs",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_o_eotech_xps/wpn_fps_upg_o_eotech_xps",
		stats = {
			value = 5,
			zoom = 3,
			recoil = 1,
			spread_moving = -1,
			concealment = -2
		},
		perks = {"scope"},
		stance_mod = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod),
		forbids = {
			"wpn_fps_amcar_uupg_body_upperreciever",
			"wpn_fps_ass_m16_os_frontsight",
			"wpn_fps_ass_scar_o_flipups_up"
		},
		texture_switch = {
			material = "gfx_reddot",
			channel = "diffuse_texture"
		},
		dlc = "gage_pack_jobs"
	}
	self.parts.wpn_fps_upg_o_reflex = {
		pcs = {},
		type = "sight",
		name_id = "bm_wp_upg_o_reflex",
		a_obj = "a_o",
		texture_bundle_folder = "gage_pack_jobs",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_o_reflex/wpn_fps_upg_o_reflex",
		stats = {
			value = 5,
			zoom = 3,
			recoil = 1,
			spread_moving = -1,
			concealment = -1
		},
		perks = {"scope"},
		stance_mod = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod),
		forbids = {
			"wpn_fps_amcar_uupg_body_upperreciever",
			"wpn_fps_ass_m16_os_frontsight",
			"wpn_fps_ass_scar_o_flipups_up"
		},
		texture_switch = {
			material = "gfx_reddot",
			channel = "diffuse_texture"
		},
		dlc = "gage_pack_jobs"
	}
	self.parts.wpn_fps_upg_o_rx01 = {
		pcs = {},
		type = "sight",
		name_id = "bm_wp_upg_o_rx01",
		a_obj = "a_o",
		texture_bundle_folder = "gage_pack_jobs",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_o_rx01/wpn_fps_upg_o_rx01",
		stats = {
			value = 5,
			zoom = 4,
			recoil = 1,
			spread_moving = -1,
			concealment = -1
		},
		perks = {"scope"},
		stance_mod = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod),
		forbids = {
			"wpn_fps_amcar_uupg_body_upperreciever",
			"wpn_fps_ass_m16_os_frontsight",
			"wpn_fps_ass_scar_o_flipups_up"
		},
		texture_switch = {
			material = "gfx_reddot",
			channel = "diffuse_texture"
		},
		dlc = "gage_pack_jobs"
	}
	self.parts.wpn_fps_upg_o_rx30 = {
		pcs = {},
		type = "sight",
		name_id = "bm_wp_upg_o_rx30",
		a_obj = "a_o",
		texture_bundle_folder = "gage_pack_jobs",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_o_rx30/wpn_fps_upg_o_rx30",
		stats = {
			value = 5,
			zoom = 4,
			recoil = 1,
			spread_moving = -1,
			concealment = -2
		},
		perks = {"scope"},
		stance_mod = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod),
		forbids = {
			"wpn_fps_amcar_uupg_body_upperreciever",
			"wpn_fps_ass_m16_os_frontsight",
			"wpn_fps_ass_scar_o_flipups_up"
		},
		texture_switch = {
			material = "gfx_reddot",
			channel = "diffuse_texture"
		},
		dlc = "gage_pack_jobs"
	}
	self.parts.wpn_fps_upg_o_cs = {
		pcs = {},
		type = "sight",
		name_id = "bm_wp_upg_o_cs",
		a_obj = "a_o",
		texture_bundle_folder = "gage_pack_jobs",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_o_cs/wpn_fps_upg_o_cs",
		stats = {
			value = 3,
			zoom = 3,
			recoil = 1,
			spread_moving = -1,
			concealment = -1
		},
		perks = {"scope"},
		stance_mod = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod),
		forbids = {
			"wpn_fps_amcar_uupg_body_upperreciever",
			"wpn_fps_ass_m16_os_frontsight",
			"wpn_fps_ass_scar_o_flipups_up"
		},
		texture_switch = {
			material = "gfx_reddot",
			channel = "diffuse_texture"
		},
		dlc = "gage_pack_jobs"
	}
	self.parts.wpn_fps_upg_o_rmr.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_o_rmr/wpn_third_upg_o_rmr"
	self.parts.wpn_fps_upg_o_eotech_xps.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_o_eotech_xps/wpn_third_upg_o_eotech_xps"
	self.parts.wpn_fps_upg_o_reflex.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_o_reflex/wpn_third_upg_o_reflex"
	self.parts.wpn_fps_upg_o_rx01.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_o_rx01/wpn_third_upg_o_rx01"
	self.parts.wpn_fps_upg_o_rx30.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_o_rx30/wpn_third_upg_o_rx30"
	self.parts.wpn_fps_upg_o_cs.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_o_cs/wpn_third_upg_o_cs"
end

function WeaponFactoryTweakData_37:_init_content_unfinished()
	self.parts.wpn_fps_upg_ns_pis_medium_gem = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel_ext",
		sub_type = "silencer",
		name_id = "bm_wp_upg_ns_pis_medium_gem",
		a_obj = "a_ns",
		parent = "slide",
		unit = "units/payday2/weapons/wpn_fps_upg_ns_pis_medium_gem/wpn_fps_upg_ns_pis_medium_gem",
		stats = {
			value = 3,
			suppression = 12,
			alert_size = 12,
			damage = -1,
			recoil = 1,
			spread_moving = -1,
			concealment = -1
		},
		perks = {"silencer"},
		sound_switch = {
			suppressed = "suppressed_b"
		}
	}
	self.parts.wpn_fps_upg_ns_pis_large_kac = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel_ext",
		sub_type = "silencer",
		name_id = "bm_wp_upg_ns_pis_large_kac",
		a_obj = "a_ns",
		parent = "slide",
		unit = "units/payday2/weapons/wpn_fps_upg_ns_pis_large_kac/wpn_fps_upg_ns_pis_large_kac",
		stats = {
			value = 5,
			suppression = 12,
			alert_size = 12,
			damage = -1,
			recoil = 3,
			spread_moving = -3,
			concealment = -3
		},
		perks = {"silencer"},
		sound_switch = {
			suppressed = "suppressed_c"
		}
	}
	self.parts.wpn_fps_upg_ns_pis_medium_gem.third_unit = "units/payday2/weapons/wpn_fps_upg_ns_pis_medium_gem/wpn_third_upg_ns_pis_medium_gem"
	self.parts.wpn_fps_upg_ns_pis_large_kac.third_unit = "units/payday2/weapons/wpn_fps_upg_ns_pis_large_kac/wpn_third_upg_ns_pis_large_kac"
	local unfinished_content = {
		"wpn_fps_upg_ns_pis_medium_gem",
		"wpn_fps_upg_ns_pis_large_kac"
	}
	for i, id in ipairs(unfinished_content) do
		local part = self.parts[id]
		if part then
			part.pc = nil
			part.pcs = nil
			part.texture_bundle_folder = "unfinished"
			part.unit = string.gsub(part.unit, "payday2", "pd2_backlog")
			part.third_unit = string.gsub(part.third_unit, "payday2", "pd2_backlog")
		end
	end
	for id, data in pairs(self) do
		if data.uses_parts then
			for i = #data.uses_parts, 1, -1 do
				if table.contains(unfinished_content, data.uses_parts[i]) then
					table.remove(data.uses_parts, i)
				end
			end
		end
	end
end

function WeaponFactoryTweakData_37:_cleanup_unfinished_content()
end

function WeaponFactoryTweakData_37:_cleanup_unfinished_parts()
	for id, data in pairs(self) do
		if id ~= "parts" and data.uses_parts then
			for i = #data.uses_parts, 1, -1 do
				if not self.parts[data.uses_parts[i]] then
					table.remove(data.uses_parts, i)
				end
			end
		end
		if data.default_blueprint then
			for i = #data.default_blueprint, 1, -1 do
				if not self.parts[data.default_blueprint[i]] then
					table.remove(data.default_blueprint, i)
				end
			end
		end
		if data.adds then
			for part_id, part_data in pairs(data.adds) do
				for i = #part_data, 1, -1 do
					if not self.parts[part_data[i]] then
						table.remove(part_data, i)
					end
				end
			end
		end
	end
	for id, data in pairs(self.parts) do
		if data.adds then
			for i = #data.adds, 1, -1 do
				if not self.parts[data.adds[i]] then
					table.remove(data.adds, i)
				end
			end
		end
	end
end

function WeaponFactoryTweakData_37:_init_m4()
	self.parts.wpn_fps_m4_lower_reciever = {
		type = "lower_reciever",
		name_id = "bm_wp_m4_lower_reciever",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_lower_reciever",
		stats = {value = 1}
	}
	self.parts.wpn_fps_m4_upper_reciever_edge = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "upper_reciever",
		name_id = "bm_wp_m4_upper_reciever_edge",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_upper_reciever_edge",
		stats = {
			value = 3,
			damage = 1,
			recoil = 1
		},
		animations = {reload = "reload"}
	}
	self.parts.wpn_fps_m4_upper_reciever_round = {
		type = "upper_reciever",
		name_id = "bm_wp_m4_upper_reciever_round",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_upper_reciever_round",
		stats = {value = 1},
		animations = {reload = "reload"}
	}
	self.parts.wpn_fps_m4_uupg_b_long = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel",
		name_id = "bm_wp_m4_uupg_b_long",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_b_long",
		stats = {
			value = 4,
			damage = 2,
			spread = 1,
			spread_moving = -3,
			concealment = -2
		}
	}
	self.parts.wpn_fps_m4_uupg_b_short = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel",
		name_id = "bm_wp_m4_uupg_b_short",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_b_short",
		stats = {
			value = 5,
			spread = -1,
			spread_moving = 2,
			concealment = 2
		}
	}
	self.parts.wpn_fps_m4_uupg_b_medium = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel",
		name_id = "bm_wp_m4_uupg_b_medium",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_b_medium",
		stats = {
			value = 1,
			spread = 1,
			concealment = -1
		}
	}
	self.parts.wpn_fps_m4_uupg_b_sd = {
		pcs = {
			20,
			30,
			40
		},
		type = "barrel",
		sub_type = "silencer",
		name_id = "bm_wp_m4_uupg_b_sd",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_b_sd",
		stats = {
			value = 6,
			suppression = 12,
			alert_size = 12,
			spread = -1,
			damage = -2,
			recoil = 1,
			spread_moving = 1,
			concealment = 1
		},
		perks = {"silencer"},
		sound_switch = {
			suppressed = "suppressed_c"
		},
		forbids = {
			"wpn_fps_m4_uupg_fg_rail_ext",
			"wpn_fps_upg_ns_ass_smg_large",
			"wpn_fps_upg_ns_ass_smg_medium",
			"wpn_fps_upg_ns_ass_smg_small",
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_ass_ns_surefire"
		}
	}
	self.parts.wpn_fps_m4_uupg_fg_lr300 = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "foregrip",
		name_id = "bm_wp_m4_uupg_fg_lr300",
		a_obj = "a_fg",
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_fg_lr300",
		stats = {
			value = 5,
			spread_moving = 1,
			concealment = 1,
			recoil = 1
		}
	}
	self.parts.wpn_fps_m4_uupg_fg_rail = {
		type = "foregrip",
		name_id = "bm_wp_m4_uupg_fg_rail",
		a_obj = "a_fg",
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_fg_rail",
		stats = {value = 1, concealment = -1},
		adds = {
			"wpn_fps_m4_uupg_fg_rail_ext"
		},
		forbids = {
			"wpn_fps_addon_ris"
		}
	}
	self.parts.wpn_fps_m4_uupg_m_std = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "magazine",
		name_id = "bm_wp_m4_uupg_m_std",
		a_obj = "a_m",
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_m_std",
		stats = {
			value = 1,
			extra_ammo = 4,
			concealment = -1
		}
	}
	self.parts.wpn_fps_m4_uupg_s_fold = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "stock",
		name_id = "bm_wp_m4_uupg_s_fold",
		a_obj = "a_s",
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_s_fold",
		stats = {
			value = 5,
			recoil = -1,
			concealment = 3,
			spread_moving = 2
		}
	}
	self.parts.wpn_fps_m4_uupg_o_flipup = {
		type = "sight",
		name_id = "bm_wp_m4_uupg_o_flipup",
		a_obj = "a_o",
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_o_flipup",
		stats = {value = 1}
	}
	self.parts.wpn_fps_m4_uupg_draghandle = {
		type = "drag_handle",
		name_id = "bm_wp_m4_uupg_draghandle",
		a_obj = "a_dh",
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_draghandle",
		stats = {value = 1}
	}
	self.parts.wpn_fps_m4_uupg_fg_rail_ext = {
		type = "foregrip_ext",
		name_id = "bm_wp_m4_uupg_fg_rail_ext",
		a_obj = "a_fg",
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_fg_rail_ext",
		stats = {value = 1}
	}
	self.parts.wpn_fps_upg_m4_g_standard = {
		type = "grip",
		name_id = "bm_wp_m4_g_standard",
		a_obj = "a_g",
		unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_g_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_upg_m4_g_ergo = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "grip",
		name_id = "bm_wp_m4_g_ergo",
		a_obj = "a_g",
		unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_g_ergo",
		stats = {
			value = 2,
			spread_moving = 2,
			recoil = 1
		}
	}
	self.parts.wpn_fps_upg_m4_g_sniper = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "grip",
		name_id = "bm_wp_m4_g_sniper",
		a_obj = "a_g",
		unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_g_sniper",
		stats = {
			value = 6,
			spread = 1,
			recoil = 1,
			spread_moving = -2,
			concealment = -1
		}
	}
	self.parts.wpn_fps_upg_m4_m_drum = {
		type = "magazine",
		name_id = "bm_wp_m4_m_drum",
		a_obj = "a_m",
		unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_m_drum",
		stats = {
			value = 9,
			extra_ammo = 20,
			concealment = -5
		}
	}
	self.parts.wpn_fps_upg_m4_m_pmag = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "magazine",
		name_id = "bm_wp_m4_m_pmag",
		a_obj = "a_m",
		unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_m_pmag",
		stats = {
			value = 3,
			spread_moving = 1,
			concealment = 0,
			extra_ammo = 2
		}
	}
	self.parts.wpn_fps_upg_m4_m_straight = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "magazine",
		name_id = "bm_wp_m4_m_straight",
		a_obj = "a_m",
		unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_m_straight",
		stats = {
			value = 2,
			spread_moving = 2,
			concealment = 2,
			extra_ammo = -4
		}
	}
	self.parts.wpn_fps_upg_m4_s_standard = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "stock",
		name_id = "bm_wp_m4_s_standard",
		a_obj = "a_s",
		unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_s_standard",
		stats = {
			value = 1,
			spread_moving = -1,
			concealment = -1,
			recoil = 1
		},
		adds_type = {
			"stock_adapter"
		},
		forbids = {
			"wpn_fps_shot_r870_ris_special"
		}
	}
	self.parts.wpn_fps_upg_m4_s_pts = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "stock",
		name_id = "bm_wp_m4_s_pts",
		a_obj = "a_s",
		unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_s_pts",
		stats = {
			value = 3,
			spread = 0,
			spread_moving = 1,
			recoil = 1,
			concealment = -1
		},
		adds_type = {
			"stock_adapter"
		},
		forbids = {
			"wpn_fps_shot_r870_ris_special"
		}
	}
	self.parts.wpn_fps_upg_m4_s_adapter = {
		type = "stock_adapter",
		name_id = "bm_wp_m4_s_adapter",
		a_obj = "a_s",
		unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_s_adapter",
		stats = {value = 1}
	}
	self.parts.wpn_fps_m4_lower_reciever.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_lower_reciever"
	self.parts.wpn_fps_m4_upper_reciever_edge.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_upper_reciever_edge"
	self.parts.wpn_fps_m4_upper_reciever_round.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_upper_reciever_round"
	self.parts.wpn_fps_m4_uupg_b_long.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_b_long"
	self.parts.wpn_fps_m4_uupg_b_short.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_b_short"
	self.parts.wpn_fps_m4_uupg_b_medium.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_b_medium"
	self.parts.wpn_fps_m4_uupg_b_sd.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_b_sd"
	self.parts.wpn_fps_m4_uupg_draghandle.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_draghandle"
	self.parts.wpn_fps_m4_uupg_fg_lr300.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_fg_lr300"
	self.parts.wpn_fps_m4_uupg_fg_rail.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_fg_rail"
	self.parts.wpn_fps_m4_uupg_fg_rail_ext.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_fg_rail_ext"
	self.parts.wpn_fps_m4_uupg_m_std.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_m_std"
	self.parts.wpn_fps_m4_uupg_o_flipup.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_o_flipup"
	self.parts.wpn_fps_m4_uupg_s_fold.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_s_fold"
	self.parts.wpn_fps_upg_m4_g_ergo.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_g_ergo"
	self.parts.wpn_fps_upg_m4_g_sniper.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_g_sniper"
	self.parts.wpn_fps_upg_m4_g_standard.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_g_standard"
	self.parts.wpn_fps_upg_m4_m_drum.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_m_drum"
	self.parts.wpn_fps_upg_m4_m_pmag.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_m_pmag"
	self.parts.wpn_fps_upg_m4_m_straight.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_m_straight"
	self.parts.wpn_fps_upg_m4_s_adapter.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_s_adapter"
	self.parts.wpn_fps_upg_m4_s_pts.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_s_pts"
	self.parts.wpn_fps_upg_m4_s_standard.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_s_standard"
	self.parts.wpn_fps_m4_upper_reciever_round_vanilla = deep_clone(self.parts.wpn_fps_m4_upper_reciever_round)
	self.parts.wpn_fps_m4_upper_reciever_round_vanilla.stats = nil
	self.parts.wpn_fps_m4_upper_reciever_round_vanilla.pcs = nil
	self.parts.wpn_fps_m4_uupg_draghandle_vanilla = deep_clone(self.parts.wpn_fps_m4_uupg_draghandle)
	self.parts.wpn_fps_m4_uupg_draghandle_vanilla.stats = nil
	self.parts.wpn_fps_m4_uupg_draghandle_vanilla.pcs = nil
	self.parts.wpn_fps_m4_uupg_m_std_vanilla = deep_clone(self.parts.wpn_fps_m4_uupg_m_std)
	self.parts.wpn_fps_m4_uupg_m_std_vanilla.stats = nil
	self.parts.wpn_fps_m4_uupg_m_std_vanilla.pcs = nil
	self.parts.wpn_fps_upg_m4_m_straight_vanilla = deep_clone(self.parts.wpn_fps_upg_m4_m_straight)
	self.parts.wpn_fps_upg_m4_m_straight_vanilla.stats = nil
	self.parts.wpn_fps_upg_m4_m_straight_vanilla.pcs = nil
	self.parts.wpn_fps_upg_m4_s_standard_vanilla = deep_clone(self.parts.wpn_fps_upg_m4_s_standard)
	self.parts.wpn_fps_upg_m4_s_standard_vanilla.stats = nil
	self.parts.wpn_fps_upg_m4_s_standard_vanilla.pcs = nil
	self.parts.wpn_fps_upg_m4_g_standard_vanilla = deep_clone(self.parts.wpn_fps_upg_m4_g_standard)
	self.parts.wpn_fps_upg_m4_g_standard_vanilla.stats = nil
	self.parts.wpn_fps_upg_m4_g_standard_vanilla.pc = nil
	self.parts.wpn_fps_m4_uupg_b_medium_vanilla = deep_clone(self.parts.wpn_fps_m4_uupg_b_medium)
	self.parts.wpn_fps_m4_uupg_b_medium_vanilla.stats = nil
	self.parts.wpn_fps_m4_uupg_b_medium_vanilla.pcs = nil
	self.parts.wpn_fps_m4_uupg_b_short_vanilla = deep_clone(self.parts.wpn_fps_m4_uupg_b_short)
	self.parts.wpn_fps_m4_uupg_b_short_vanilla.stats = nil
	self.parts.wpn_fps_m4_uupg_b_short_vanilla.pcs = nil
	self.wpn_fps_ass_m4 = {}
	self.wpn_fps_ass_m4.optional_types = {
		"barrel_ext",
		"gadget",
		"vertical_grip"
	}
	self.wpn_fps_ass_m4.unit = "units/payday2/weapons/wpn_fps_ass_m4/wpn_fps_ass_m4"
	self.wpn_fps_ass_m4.stock_adapter = "wpn_fps_upg_m4_s_adapter"
	self.wpn_fps_ass_m4.default_blueprint = {
		"wpn_fps_upg_m4_g_standard_vanilla",
		"wpn_fps_m4_lower_reciever",
		"wpn_fps_m4_upper_reciever_round",
		"wpn_fps_m4_uupg_b_medium_vanilla",
		"wpn_fps_m4_uupg_fg_rail",
		"wpn_fps_m4_uupg_m_std_vanilla",
		"wpn_fps_upg_m4_s_standard_vanilla",
		"wpn_fps_m4_uupg_draghandle",
		"wpn_fps_m4_uupg_o_flipup"
	}
	self.wpn_fps_ass_m4.uses_parts = {
		"wpn_fps_m4_lower_reciever",
		"wpn_fps_m4_upper_reciever_edge",
		"wpn_fps_m4_upper_reciever_round",
		"wpn_fps_m4_uupg_b_long",
		"wpn_fps_m4_uupg_b_medium_vanilla",
		"wpn_fps_m4_uupg_b_short",
		"wpn_fps_m4_uupg_b_sd",
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_m4_uupg_fg_rail",
		"wpn_fps_m4_uupg_fg_lr300",
		"wpn_fps_m4_uupg_m_std_vanilla",
		"wpn_fps_upg_m4_m_drum",
		"wpn_fps_upg_m4_m_pmag",
		"wpn_fps_upg_m4_m_straight",
		"wpn_fps_m4_uupg_s_fold",
		"wpn_fps_upg_m4_s_standard_vanilla",
		"wpn_fps_upg_m4_s_pts",
		"wpn_fps_m4_uupg_draghandle",
		"wpn_fps_m4_uupg_o_flipup",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_vg_ass_smg_verticalgrip",
		"wpn_fps_upg_vg_ass_smg_stubby",
		"wpn_fps_upg_vg_ass_smg_afg",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_m4_g_standard_vanilla",
		"wpn_fps_upg_m4_g_ergo",
		"wpn_fps_upg_m4_g_sniper",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_m4_g_hgrip",
		"wpn_fps_upg_m4_g_mgrip",
		"wpn_fps_upg_i_singlefire",
		"wpn_fps_upg_i_autofire",
		"wpn_fps_upg_fg_jp",
		"wpn_fps_upg_fg_smr",
		"wpn_fps_upg_m4_m_quad",
		"wpn_fps_upg_m4_s_crane",
		"wpn_fps_upg_m4_s_mk46",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_eotech_xps"
	}
	self.wpn_fps_ass_m4_npc = deep_clone(self.wpn_fps_ass_m4)
	self.wpn_fps_ass_m4_npc.unit = "units/payday2/weapons/wpn_fps_ass_m4/wpn_fps_ass_m4_npc"
	self.wpn_fps_ass_m4_secondary = deep_clone(self.wpn_fps_ass_m4)
	self.wpn_fps_ass_m4_secondary.unit = "units/payday2/weapons/wpn_fps_ass_m4/wpn_fps_ass_m4_secondary"
	self.wpn_fps_ass_m4_secondary_npc = deep_clone(self.wpn_fps_ass_m4_npc)
	self.wpn_fps_ass_m4_secondary_npc.unit = "units/payday2/weapons/wpn_fps_ass_m4/wpn_fps_ass_m4_secondary_npc"
end

function WeaponFactoryTweakData_37:_init_g18c()
	self.parts.wpn_fps_pis_g18c_body_frame = {
		type = "lower_reciever",
		name_id = "bm_wp_g18c_body_frame",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_pis_g18c_pts/wpn_fps_pis_g18c_body_frame",
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_g18c_b_standard = {
		type = "slide",
		name_id = "bm_wp_g18c_b_standard",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_pis_g18c_pts/wpn_fps_pis_g18c_b_standard",
		stats = {value = 1},
		animations = {reload = "reload", fire = "recoil"}
	}
	self.parts.wpn_fps_pis_g18c_co_1 = {
		pcs = {30, 40},
		type = "barrel_ext",
		name_id = "bm_wp_g18c_co_1",
		parent = "slide",
		a_obj = "a_co",
		unit = "units/payday2/weapons/wpn_fps_pis_g18c_pts/wpn_fps_pis_g18c_co_1",
		stats = {
			value = 4,
			suppression = -5,
			damage = 1,
			recoil = -1,
			concealment = -1
		}
	}
	self.parts.wpn_fps_pis_g18c_co_comp_2 = {
		pcs = {30, 40},
		type = "barrel_ext",
		name_id = "bm_wp_g18c_co_comp_2",
		parent = "slide",
		a_obj = "a_co",
		unit = "units/payday2/weapons/wpn_fps_pis_g18c_pts/wpn_fps_pis_g18c_co_comp_2",
		stats = {
			value = 5,
			recoil = 4,
			damage = 1,
			suppression = -1,
			concealment = -1
		}
	}
	self.parts.wpn_fps_pis_g18c_m_mag_33rnd = {
		pcs = {30, 40},
		type = "magazine",
		name_id = "bm_wp_g18c_m_mag_33rnd",
		a_obj = "a_m",
		unit = "units/payday2/weapons/wpn_fps_pis_g18c_pts/wpn_fps_pis_g18c_m_mag_33rnd",
		stats = {
			value = 6,
			spread_moving = -3,
			extra_ammo = 6,
			concealment = -2
		},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_pis_g18c_m_mag_17rnd = {
		type = "magazine",
		name_id = "bm_wp_g18c_m_mag_17rnd",
		a_obj = "a_m",
		unit = "units/payday2/weapons/wpn_fps_pis_g18c_pts/wpn_fps_pis_g18c_m_mag_17rnd",
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_pis_g18c_s_stock = {
		pcs = {30, 40},
		type = "stock",
		name_id = "bm_wp_g18c_s_stock",
		a_obj = "a_s",
		unit = "units/payday2/weapons/wpn_fps_pis_g18c_pts/wpn_fps_pis_g18c_s_stock",
		stats = {
			value = 8,
			recoil = 2,
			concealment = -2
		}
	}
	self.parts.wpn_fps_pis_g18c_g_ergo = {
		pcs = {30, 40},
		type = "grip",
		name_id = "bm_wp_g18c_g_ergo",
		a_obj = "a_g",
		unit = "units/payday2/weapons/wpn_fps_pis_g18c_pts/wpn_fps_pis_g18c_g_ergo",
		stats = {
			value = 4,
			recoil = 2,
			spread_moving = 1
		}
	}
	self.parts.wpn_fps_pis_g18c_body_frame.third_unit = "units/payday2/weapons/wpn_third_pis_g18c_pts/wpn_third_pis_g18c_body_standard"
	self.parts.wpn_fps_pis_g18c_b_standard.third_unit = "units/payday2/weapons/wpn_third_pis_g18c_pts/wpn_third_pis_g18c_b_standard"
	self.parts.wpn_fps_pis_g18c_co_comp_2.third_unit = "units/payday2/weapons/wpn_third_pis_g18c_pts/wpn_third_pis_g18c_co_2"
	self.parts.wpn_fps_pis_g18c_co_1.third_unit = "units/payday2/weapons/wpn_third_pis_g18c_pts/wpn_third_pis_g18c_co_1"
	self.parts.wpn_fps_pis_g18c_m_mag_33rnd.third_unit = "units/payday2/weapons/wpn_third_pis_g18c_pts/wpn_third_pis_g18c_m_mag_33rnd"
	self.parts.wpn_fps_pis_g18c_m_mag_17rnd.third_unit = "units/payday2/weapons/wpn_third_pis_g18c_pts/wpn_third_pis_g18c_m_mag_17rnd"
	self.parts.wpn_fps_pis_g18c_s_stock.third_unit = "units/payday2/weapons/wpn_third_pis_g18c_pts/wpn_third_pis_g18c_s_stock"
	self.parts.wpn_fps_pis_g18c_g_ergo.third_unit = "units/payday2/weapons/wpn_third_pis_g18c_pts/wpn_third_pis_g18c_g_ergo"
	self.wpn_fps_pis_g18c = {}
	self.wpn_fps_pis_g18c.unit = "units/payday2/weapons/wpn_fps_pis_g18c/wpn_fps_pis_g18c"
	self.wpn_fps_pis_g18c.optional_types = {
		"barrel_ext",
		"gadget",
		"stock",
		"grip"
	}
	self.wpn_fps_pis_g18c.override = {
		wpn_fps_upg_o_rmr = {parent = "slide"}
	}
	self.wpn_fps_pis_g18c.default_blueprint = {
		"wpn_fps_pis_g18c_body_frame",
		"wpn_fps_pis_g18c_b_standard",
		"wpn_fps_pis_g18c_m_mag_17rnd"
	}
	self.wpn_fps_pis_g18c.uses_parts = {
		"wpn_fps_pis_g18c_body_frame",
		"wpn_fps_pis_g18c_b_standard",
		"wpn_fps_pis_g18c_co_1",
		"wpn_fps_pis_g18c_co_comp_2",
		"wpn_fps_pis_g18c_m_mag_33rnd",
		"wpn_fps_pis_g18c_m_mag_17rnd",
		"wpn_fps_pis_g18c_s_stock",
		"wpn_fps_upg_fl_pis_laser",
		"wpn_fps_upg_fl_pis_tlr1",
		"wpn_fps_upg_ns_pis_large",
		"wpn_fps_upg_ns_pis_medium",
		"wpn_fps_upg_ns_pis_small",
		"wpn_fps_upg_ns_pis_large_kac",
		"wpn_fps_upg_ns_pis_medium_gem",
		"wpn_fps_pis_g18c_g_ergo",
		"wpn_fps_upg_o_rmr",
		"wpn_fps_upg_ns_pis_medium_slim",
		"wpn_fps_upg_pis_ns_flash"
	}
	self.wpn_fps_pis_g18c_npc = deep_clone(self.wpn_fps_pis_g18c)
	self.wpn_fps_pis_g18c_npc.unit = "units/payday2/weapons/wpn_fps_pis_g18c/wpn_fps_pis_g18c_npc"
	self.wpn_fps_pis_g18c_primary = deep_clone(self.wpn_fps_pis_g18c)
	self.wpn_fps_pis_g18c_primary.unit = "units/payday2/weapons/wpn_fps_pis_g18c/wpn_fps_pis_g18c_primary"
	self.wpn_fps_pis_g18c_primary_npc = deep_clone(self.wpn_fps_pis_g18c_npc)
	self.wpn_fps_pis_g18c_primary_npc.unit = "units/payday2/weapons/wpn_fps_pis_g18c/wpn_fps_pis_g18c_primary_npc"
end

function WeaponFactoryTweakData_37:_init_amcar()
	self.parts.wpn_fps_amcar_uupg_body_upperreciever = {
		type = "sight",
		name_id = "bm_wp_g18c_m_mag_17rnd",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_ass_amcar_pts/wpn_fps_amcar_uupg_body_upperreciever",
		adds = {
			"wpn_fps_ass_m16_os_frontsight"
		},
		forbids = {
			"wpn_fps_m4_upper_reciever_round_vanilla",
			"wpn_fps_m4_uupg_draghandle_vanilla",
			"wpn_fps_m4_uupg_fg_rail_ext"
		}
	}
	self.parts.wpn_fps_amcar_uupg_fg_amcar = {
		type = "foregrip",
		a_obj = "a_fg",
		unit = "units/payday2/weapons/wpn_fps_ass_amcar_pts/wpn_fps_amcar_uupg_fg_amcar"
	}
	self.parts.wpn_fps_amcar_uupg_body_upperreciever.third_unit = "units/payday2/weapons/wpn_third_ass_amcar_pts/wpn_third_amcar_uupg_body_upperreciever"
	self.parts.wpn_fps_amcar_uupg_fg_amcar.third_unit = "units/payday2/weapons/wpn_third_ass_amcar_pts/wpn_third_amcar_uupg_fg_amcar"
	self.wpn_fps_ass_amcar = {}
	self.wpn_fps_ass_amcar.unit = "units/payday2/weapons/wpn_fps_ass_amcar/wpn_fps_ass_amcar"
	self.wpn_fps_ass_amcar.stock_adapter = "wpn_fps_upg_m4_s_adapter"
	self.wpn_fps_ass_amcar.adds = {
		wpn_fps_upg_o_specter = {
			"wpn_fps_m4_upper_reciever_round_vanilla",
			"wpn_fps_m4_uupg_draghandle_vanilla",
			"wpn_fps_m4_uupg_fg_rail_ext"
		},
		wpn_fps_upg_o_aimpoint = {
			"wpn_fps_m4_upper_reciever_round_vanilla",
			"wpn_fps_m4_uupg_draghandle_vanilla",
			"wpn_fps_m4_uupg_fg_rail_ext"
		},
		wpn_fps_upg_o_aimpoint_2 = {
			"wpn_fps_m4_upper_reciever_round_vanilla",
			"wpn_fps_m4_uupg_draghandle_vanilla",
			"wpn_fps_m4_uupg_fg_rail_ext"
		},
		wpn_fps_upg_o_docter = {
			"wpn_fps_m4_upper_reciever_round_vanilla",
			"wpn_fps_m4_uupg_draghandle_vanilla",
			"wpn_fps_m4_uupg_fg_rail_ext"
		},
		wpn_fps_upg_o_eotech = {
			"wpn_fps_m4_upper_reciever_round_vanilla",
			"wpn_fps_m4_uupg_draghandle_vanilla",
			"wpn_fps_m4_uupg_fg_rail_ext"
		},
		wpn_fps_upg_o_t1micro = {
			"wpn_fps_m4_upper_reciever_round_vanilla",
			"wpn_fps_m4_uupg_draghandle_vanilla",
			"wpn_fps_m4_uupg_fg_rail_ext"
		},
		wpn_fps_upg_o_cmore = {
			"wpn_fps_m4_upper_reciever_round_vanilla",
			"wpn_fps_m4_uupg_draghandle_vanilla",
			"wpn_fps_m4_uupg_fg_rail_ext"
		},
		wpn_fps_upg_o_eotech_xps = {
			"wpn_fps_m4_upper_reciever_round_vanilla",
			"wpn_fps_m4_uupg_draghandle_vanilla",
			"wpn_fps_m4_uupg_fg_rail_ext"
		},
		wpn_fps_upg_o_reflex = {
			"wpn_fps_m4_upper_reciever_round_vanilla",
			"wpn_fps_m4_uupg_draghandle_vanilla",
			"wpn_fps_m4_uupg_fg_rail_ext"
		},
		wpn_fps_upg_o_rx01 = {
			"wpn_fps_m4_upper_reciever_round_vanilla",
			"wpn_fps_m4_uupg_draghandle_vanilla",
			"wpn_fps_m4_uupg_fg_rail_ext"
		},
		wpn_fps_upg_o_rx30 = {
			"wpn_fps_m4_upper_reciever_round_vanilla",
			"wpn_fps_m4_uupg_draghandle_vanilla",
			"wpn_fps_m4_uupg_fg_rail_ext"
		},
		wpn_fps_upg_o_acog = {
			"wpn_fps_m4_upper_reciever_round_vanilla",
			"wpn_fps_m4_uupg_draghandle_vanilla",
			"wpn_fps_m4_uupg_fg_rail_ext"
		},
		wpn_fps_upg_o_cs = {
			"wpn_fps_m4_upper_reciever_round_vanilla",
			"wpn_fps_m4_uupg_draghandle_vanilla",
			"wpn_fps_m4_uupg_fg_rail_ext"
		}
	}
	self.wpn_fps_ass_amcar.default_blueprint = {
		"wpn_fps_m4_uupg_b_medium_vanilla",
		"wpn_fps_m4_lower_reciever",
		"wpn_fps_amcar_uupg_body_upperreciever",
		"wpn_fps_amcar_uupg_fg_amcar",
		"wpn_fps_upg_m4_m_straight_vanilla",
		"wpn_fps_upg_m4_s_standard_vanilla",
		"wpn_fps_upg_m4_g_standard_vanilla"
	}
	self.wpn_fps_ass_amcar.uses_parts = {
		"wpn_fps_m4_uupg_b_medium_vanilla",
		"wpn_fps_m4_lower_reciever",
		"wpn_fps_amcar_uupg_body_upperreciever",
		"wpn_fps_m4_upper_reciever_round_vanilla",
		"wpn_fps_amcar_uupg_fg_amcar",
		"wpn_fps_upg_m4_m_straight_vanilla",
		"wpn_fps_m4_uupg_m_std",
		"wpn_fps_upg_m4_s_standard_vanilla",
		"wpn_fps_upg_m4_g_standard_vanilla",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_i_singlefire",
		"wpn_fps_upg_i_autofire",
		"wpn_fps_upg_m4_m_quad",
		"wpn_fps_upg_m4_s_crane",
		"wpn_fps_upg_m4_s_mk46",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_eotech_xps"
	}
	self.wpn_fps_ass_amcar_npc = deep_clone(self.wpn_fps_ass_amcar)
	self.wpn_fps_ass_amcar_npc.unit = "units/payday2/weapons/wpn_fps_ass_amcar/wpn_fps_ass_amcar_npc"
end

function WeaponFactoryTweakData_37:_init_m16()
	self.parts.wpn_fps_m16_fg_railed = {
		pc = 40,
		type = "foregrip",
		name_id = "bm_wp_m16_fg_railed",
		a_obj = "a_fg",
		unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_m16_fg_railed",
		stats = {
			value = 7,
			spread_moving = -2,
			recoil = 2,
			concealment = -2
		},
		forbids = {
			"wpn_fps_addon_ris"
		}
	}
	self.parts.wpn_fps_m16_fg_standard = {
		type = "foregrip",
		name_id = "bm_wp_m16_fg_standard",
		a_obj = "a_fg",
		unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_m16_fg_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_m16_fg_vietnam = {
		pc = 40,
		type = "foregrip",
		name_id = "bm_wp_m16_fg_vietnam",
		a_obj = "a_fg",
		unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_m16_fg_vietnam",
		stats = {
			value = 10,
			spread_moving = 1,
			recoil = 1,
			concealment = 2
		}
	}
	self.parts.wpn_fps_m16_s_solid = {
		type = "stock",
		name_id = "bm_wp_m16_s_solid",
		a_obj = "a_s",
		unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_m16_s_solid",
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_m16_o_handle_sight = {
		type = "sight",
		name_id = "bm_wp_m16_o_handle_sight",
		a_obj = "a_o",
		unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_ass_m16_o_handle_sight",
		stats = {value = 1},
		adds = {
			"wpn_fps_ass_m16_os_frontsight"
		}
	}
	self.parts.wpn_fps_ass_m16_os_frontsight = {
		type = "sight_special",
		name_id = "bm_wp_m16_os_frontsight",
		a_obj = "a_os",
		unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_ass_m16_os_frontsight",
		stats = {value = 1}
	}
	self.parts.wpn_fps_m16_fg_railed.third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_m16_fg_railed"
	self.parts.wpn_fps_m16_fg_standard.third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_m16_fg_standard"
	self.parts.wpn_fps_m16_fg_vietnam.third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_m16_fg_vietnam"
	self.parts.wpn_fps_m16_s_solid.third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_m16_s_solid"
	self.parts.wpn_fps_ass_m16_o_handle_sight.third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_ass_m16_o_handle_sight"
	self.parts.wpn_fps_ass_m16_os_frontsight.third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_ass_m16_os_frontsight"
	self.parts.wpn_fps_m16_s_solid_vanilla = deep_clone(self.parts.wpn_fps_m16_s_solid)
	self.parts.wpn_fps_m16_s_solid_vanilla.stats = nil
	self.parts.wpn_fps_m16_s_solid_vanilla.pc = nil
	self.wpn_fps_ass_m16 = {}
	self.wpn_fps_ass_m16.unit = "units/payday2/weapons/wpn_fps_ass_m16/wpn_fps_ass_m16"
	self.wpn_fps_ass_m16.stock_adapter = "wpn_fps_upg_m4_s_adapter"
	self.wpn_fps_ass_m16.optional_types = {
		"barrel_ext",
		"gadget",
		"vertical_grip"
	}
	self.wpn_fps_ass_m16.default_blueprint = {
		"wpn_fps_m4_uupg_b_medium_vanilla",
		"wpn_fps_m4_lower_reciever",
		"wpn_fps_ass_m16_o_handle_sight",
		"wpn_fps_m4_upper_reciever_round",
		"wpn_fps_m4_uupg_draghandle",
		"wpn_fps_m16_fg_standard",
		"wpn_fps_m16_s_solid_vanilla",
		"wpn_fps_upg_m4_m_straight_vanilla",
		"wpn_fps_upg_m4_g_standard_vanilla"
	}
	self.wpn_fps_ass_m16.uses_parts = {
		"wpn_fps_m16_fg_railed",
		"wpn_fps_m16_fg_standard",
		"wpn_fps_m16_fg_vietnam",
		"wpn_fps_m4_lower_reciever",
		"wpn_fps_m4_upper_reciever_edge",
		"wpn_fps_m4_uupg_draghandle",
		"wpn_fps_m4_uupg_b_long",
		"wpn_fps_m4_uupg_b_medium_vanilla",
		"wpn_fps_m4_upper_reciever_round",
		"wpn_fps_m16_s_solid_vanilla",
		"wpn_fps_m4_uupg_m_std",
		"wpn_fps_upg_m4_m_drum",
		"wpn_fps_upg_m4_m_pmag",
		"wpn_fps_upg_m4_m_straight_vanilla",
		"wpn_fps_upg_m4_g_standard_vanilla",
		"wpn_fps_upg_m4_g_ergo",
		"wpn_fps_upg_m4_g_sniper",
		"wpn_fps_upg_vg_ass_smg_verticalgrip",
		"wpn_fps_upg_vg_ass_smg_stubby",
		"wpn_fps_upg_vg_ass_smg_afg",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_ass_m16_o_handle_sight",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_m4_g_hgrip",
		"wpn_fps_upg_m4_g_mgrip",
		"wpn_fps_upg_i_singlefire",
		"wpn_fps_upg_i_autofire",
		"wpn_fps_upg_m4_m_quad",
		"wpn_fps_upg_m4_s_crane",
		"wpn_fps_upg_m4_s_mk46",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_eotech_xps"
	}
	self.wpn_fps_ass_m16_npc = deep_clone(self.wpn_fps_ass_m16)
	self.wpn_fps_ass_m16_npc.unit = "units/payday2/weapons/wpn_fps_ass_m16/wpn_fps_ass_m16_npc"
end

function WeaponFactoryTweakData_37:_init_olympic()
	self.parts.wpn_fps_smg_olympic_fg_railed = {
		pcs = {
			20,
			30,
			40
		},
		type = "foregrip",
		name_id = "bm_wp_olympic_fg_railed",
		a_obj = "a_fg",
		unit = "units/payday2/weapons/wpn_fps_smg_olympic_pts/wpn_fps_smg_olympic_fg_railed",
		stats = {
			value = 4,
			spread_moving = -1,
			recoil = 1,
			concealment = -1
		},
		forbids = {
			"wpn_fps_addon_ris"
		}
	}
	self.parts.wpn_fps_smg_olympic_fg_olympic = {
		type = "foregrip",
		name_id = "bm_wp_olympic_fg_olympic",
		a_obj = "a_fg",
		unit = "units/payday2/weapons/wpn_fps_smg_olympic_pts/wpn_fps_smg_olympic_fg_olympic",
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_olympic_s_short = {
		pcs = {
			20,
			30,
			40
		},
		type = "stock",
		name_id = "bm_wp_olympic_s_short",
		a_obj = "a_s",
		unit = "units/payday2/weapons/wpn_fps_smg_olympic_pts/wpn_fps_smg_olympic_s_short",
		stats = {
			value = 5,
			recoil = -1,
			spread_moving = 3,
			concealment = 2
		}
	}
	self.parts.wpn_fps_smg_olympic_s_adjust = {
		type = "stock",
		name_id = "bm_wp_olympic_s_adjust",
		a_obj = "a_s",
		unit = "units/payday2/weapons/wpn_fps_smg_olympic_pts/wpn_fps_smg_olympic_s_adjust",
		stats = {
			value = 1,
			recoil = 1,
			spread_moving = 1
		}
	}
	self.parts.wpn_fps_smg_olympic_fg_railed.third_unit = "units/payday2/weapons/wpn_third_smg_olympic_pts/wpn_third_smg_olympic_fg_railed"
	self.parts.wpn_fps_smg_olympic_fg_olympic.third_unit = "units/payday2/weapons/wpn_third_smg_olympic_pts/wpn_third_smg_olympic_fg_olympic"
	self.parts.wpn_fps_smg_olympic_s_short.third_unit = "units/payday2/weapons/wpn_third_smg_olympic_pts/wpn_third_smg_olympic_s_short"
	self.parts.wpn_fps_smg_olympic_s_adjust.third_unit = "units/payday2/weapons/wpn_third_smg_olympic_pts/wpn_third_smg_olympic_s_adjust"
	self.wpn_fps_smg_olympic = {}
	self.wpn_fps_smg_olympic.unit = "units/payday2/weapons/wpn_fps_smg_olympic/wpn_fps_smg_olympic"
	self.wpn_fps_smg_olympic.optional_types = {
		"barrel_ext",
		"gadget",
		"vertical_grip"
	}
	self.wpn_fps_smg_olympic.stock_adapter = "wpn_fps_upg_m4_s_adapter"
	self.wpn_fps_smg_olympic.default_blueprint = {
		"wpn_fps_smg_olympic_s_adjust",
		"wpn_fps_m4_uupg_draghandle",
		"wpn_fps_upg_m4_m_straight_vanilla",
		"wpn_fps_upg_m4_g_standard_vanilla",
		"wpn_fps_m4_uupg_b_short_vanilla",
		"wpn_fps_m4_upper_reciever_round",
		"wpn_fps_m4_lower_reciever",
		"wpn_fps_smg_olympic_fg_olympic",
		"wpn_fps_ass_m16_o_handle_sight"
	}
	self.wpn_fps_smg_olympic.uses_parts = {
		"wpn_fps_m4_lower_reciever",
		"wpn_fps_m4_upper_reciever_edge",
		"wpn_fps_m4_upper_reciever_round",
		"wpn_fps_m4_uupg_draghandle",
		"wpn_fps_smg_olympic_fg_olympic",
		"wpn_fps_smg_olympic_fg_railed",
		"wpn_fps_smg_olympic_s_short",
		"wpn_fps_smg_olympic_s_adjust",
		"wpn_fps_upg_m4_s_standard",
		"wpn_fps_upg_m4_s_pts",
		"wpn_fps_m4_uupg_b_short_vanilla",
		"wpn_fps_m4_uupg_b_medium",
		"wpn_fps_m4_uupg_m_std",
		"wpn_fps_upg_m4_m_drum",
		"wpn_fps_upg_m4_m_pmag",
		"wpn_fps_upg_m4_m_straight_vanilla",
		"wpn_fps_ass_m16_o_handle_sight",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_vg_ass_smg_verticalgrip",
		"wpn_fps_upg_vg_ass_smg_stubby",
		"wpn_fps_upg_vg_ass_smg_afg",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_m4_g_standard_vanilla",
		"wpn_fps_upg_m4_g_ergo",
		"wpn_fps_upg_m4_g_sniper",
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_m4_g_hgrip",
		"wpn_fps_upg_m4_g_mgrip",
		"wpn_fps_upg_i_singlefire",
		"wpn_fps_upg_i_autofire",
		"wpn_fps_upg_m4_m_quad",
		"wpn_fps_upg_m4_s_crane",
		"wpn_fps_upg_m4_s_mk46",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_eotech_xps"
	}
	self.wpn_fps_smg_olympic_npc = deep_clone(self.wpn_fps_smg_olympic)
	self.wpn_fps_smg_olympic_npc.unit = "units/payday2/weapons/wpn_fps_smg_olympic/wpn_fps_smg_olympic_npc"
	self.wpn_fps_smg_olympic_primary = deep_clone(self.wpn_fps_smg_olympic)
	self.wpn_fps_smg_olympic_primary.unit = "units/payday2/weapons/wpn_fps_smg_olympic/wpn_fps_smg_olympic_primary"
	self.wpn_fps_smg_olympic_primary_npc = deep_clone(self.wpn_fps_smg_olympic_npc)
	self.wpn_fps_smg_olympic_primary_npc.unit = "units/payday2/weapons/wpn_fps_smg_olympic/wpn_fps_smg_olympic_primary_npc"
end

function WeaponFactoryTweakData_37:_init_ak_parts()
	self.parts.wpn_upg_ak_fg_combo1 = {
		type = "foregrip",
		name_id = "bm_wp_ak_fg_combo1",
		a_obj = "a_fg",
		unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_fg_combo1",
		stats = {value = 1}
	}
	self.parts.wpn_upg_ak_fg_combo2 = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "foregrip",
		name_id = "bm_wp_ak_fg_combo2",
		a_obj = "a_fg",
		unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_fg_combo2",
		stats = {
			value = 3,
			spread_moving = -1,
			spread = 1,
			recoil = 1
		},
		forbids = {
			"wpn_fps_ak_extra_ris"
		}
	}
	self.parts.wpn_upg_ak_fg_combo3 = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "foregrip",
		name_id = "bm_wp_ak_fg_combo3",
		a_obj = "a_fg",
		unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_fg_combo3",
		stats = {
			value = 5,
			spread_moving = -2,
			recoil = 2,
			spread = 1,
			concealment = -1
		},
		forbids = {
			"wpn_fps_addon_ris",
			"wpn_fps_ak_extra_ris"
		}
	}
	self.parts.wpn_upg_ak_fg_combo4 = {
		type = "foregrip",
		name_id = "bm_wp_ak_fg_combo4",
		a_obj = "a_fg",
		unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_fg_combo4",
		stats = {value = 1}
	}
	self.parts.wpn_upg_ak_fg_standard = {
		type = "foregrip",
		name_id = "bm_wp_ak_fg_standard",
		a_obj = "a_fg",
		unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_fg_standard",
		stats = {value = 1},
		override = {
			wpn_fps_upg_o_specter = {a_obj = "a_of"},
			wpn_fps_upg_o_aimpoint = {a_obj = "a_of"},
			wpn_fps_upg_o_aimpoint_2 = {a_obj = "a_of"},
			wpn_fps_upg_o_docter = {a_obj = "a_of"},
			wpn_fps_upg_o_eotech = {a_obj = "a_of"},
			wpn_fps_upg_o_t1micro = {a_obj = "a_of"},
			wpn_fps_upg_o_cmore = {a_obj = "a_of"},
			wpn_fps_upg_o_acog = {a_obj = "a_of"},
			wpn_fps_upg_o_cs = {a_obj = "a_of"},
			wpn_fps_upg_o_eotech_xps = {a_obj = "a_of"},
			wpn_fps_upg_o_reflex = {a_obj = "a_of"},
			wpn_fps_upg_o_rx01 = {a_obj = "a_of"},
			wpn_fps_upg_o_rx30 = {a_obj = "a_of"}
		}
	}
	self.parts.wpn_upg_ak_fg_standard_gold = {
		type = "foregrip",
		name_id = "bm_wp_ak_fg_standard_gold",
		a_obj = "a_fg",
		unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_fg_standard_gold",
		stats = {value = 1},
		override = {
			wpn_fps_upg_o_specter = {a_obj = "a_of"},
			wpn_fps_upg_o_aimpoint = {a_obj = "a_of"},
			wpn_fps_upg_o_aimpoint_2 = {a_obj = "a_of"},
			wpn_fps_upg_o_docter = {a_obj = "a_of"},
			wpn_fps_upg_o_eotech = {a_obj = "a_of"},
			wpn_fps_upg_o_t1micro = {a_obj = "a_of"},
			wpn_fps_upg_o_cmore = {a_obj = "a_of"},
			wpn_fps_upg_o_acog = {a_obj = "a_of"},
			wpn_fps_upg_o_cs = {a_obj = "a_of"},
			wpn_fps_upg_o_eotech_xps = {a_obj = "a_of"},
			wpn_fps_upg_o_reflex = {a_obj = "a_of"},
			wpn_fps_upg_o_rx01 = {a_obj = "a_of"},
			wpn_fps_upg_o_rx30 = {a_obj = "a_of"}
		}
	}
	self.parts.wpn_upg_ak_g_standard = {
		type = "grip",
		name_id = "bm_wp_ak_g_standard",
		a_obj = "a_g",
		unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_g_standard",
		stats = {value = 1}
	}
	self.parts.wpn_upg_ak_m_akm = {
		type = "magazine",
		name_id = "bm_wp_ak_m_akm",
		a_obj = "a_m",
		unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_m_akm",
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_upg_ak_m_akm_gold = {
		type = "magazine",
		name_id = "bm_wp_ak_m_akm_gold",
		a_obj = "a_m",
		unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_m_akm_gold",
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_upg_ak_m_drum = {
		type = "magazine",
		name_id = "bm_wp_ak_m_drum",
		a_obj = "a_m",
		unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_m_drum",
		stats = {value = 5, concealment = -4},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_upg_ak_s_adapter = {
		type = "stock_adapter",
		name_id = "bm_wp_ak_s_adapter",
		a_obj = "a_s",
		unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_s_adapter",
		stats = {value = 1},
		adds = {
			"wpn_upg_ak_g_standard"
		}
	}
	self.parts.wpn_upg_ak_s_folding = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "stock",
		name_id = "bm_wp_ak_s_folding",
		a_obj = "a_s",
		unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_s_folding",
		stats = {
			value = 3,
			spread_moving = 2,
			recoil = -1,
			concealment = 2
		},
		adds = {
			"wpn_upg_ak_g_standard"
		}
	}
	self.parts.wpn_upg_ak_s_folding_vanilla_gold = {
		type = "stock",
		name_id = "bm_wp_ak_s_folding",
		a_obj = "a_s",
		unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_s_folding_gold",
		stats = {
			value = 3,
			spread_moving = 2,
			recoil = -1,
			concealment = 2
		},
		adds = {
			"wpn_upg_ak_g_standard"
		}
	}
	self.parts.wpn_upg_ak_s_psl = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "stock",
		name_id = "bm_wp_ak_s_psl",
		a_obj = "a_s",
		unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_s_psl",
		stats = {
			value = 6,
			spread = 3,
			spread_moving = -3,
			recoil = 0,
			concealment = -3
		},
		forbids = {
			"wpn_upg_ak_g_standard",
			"wpn_fps_upg_ak_g_hgrip",
			"wpn_fps_upg_ak_g_wgrip",
			"wpn_fps_upg_ak_g_pgrip"
		}
	}
	self.parts.wpn_upg_ak_s_skfoldable = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "stock",
		name_id = "bm_wp_ak_s_skfoldable",
		a_obj = "a_s",
		unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_s_skfoldable",
		stats = {
			value = 3,
			spread_moving = 2,
			recoil = -1,
			concealment = 2
		},
		adds = {
			"wpn_upg_ak_g_standard"
		}
	}
	self.parts.wpn_fps_ak_extra_ris = {
		type = "extra",
		name_id = "bm_wp_ak_s_skfoldable",
		a_obj = "a_of",
		unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_fps_ak_extra_ris"
	}
	self.parts.wpn_upg_ak_fg_combo1.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_fg_combo1"
	self.parts.wpn_upg_ak_fg_combo2.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_fg_combo2"
	self.parts.wpn_upg_ak_fg_combo3.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_fg_combo3"
	self.parts.wpn_upg_ak_fg_combo4.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_fg_combo4"
	self.parts.wpn_upg_ak_fg_standard.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_fg_standard"
	self.parts.wpn_upg_ak_fg_standard_gold.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_fg_standard_gold"
	self.parts.wpn_upg_ak_g_standard.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_g_standard"
	self.parts.wpn_upg_ak_m_akm.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_m_akm"
	self.parts.wpn_upg_ak_m_akm_gold.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_m_akm_gold"
	self.parts.wpn_upg_ak_m_drum.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_m_drum"
	self.parts.wpn_upg_ak_s_adapter.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_s_adapter"
	self.parts.wpn_upg_ak_s_folding.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_s_folding"
	self.parts.wpn_upg_ak_s_folding_vanilla_gold.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_s_folding_gold"
	self.parts.wpn_upg_ak_s_psl.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_s_psl"
	self.parts.wpn_upg_ak_s_skfoldable.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_s_skfoldable"
	self.parts.wpn_fps_ak_extra_ris.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_ak_extra_ris"
	self.parts.wpn_upg_ak_s_folding_vanilla = deep_clone(self.parts.wpn_upg_ak_s_folding)
	self.parts.wpn_upg_ak_s_folding_vanilla.stats = nil
	self.parts.wpn_upg_ak_s_folding_vanilla.pcs = nil
	self.parts.wpn_upg_ak_s_skfoldable_vanilla = deep_clone(self.parts.wpn_upg_ak_s_skfoldable)
	self.parts.wpn_upg_ak_s_skfoldable_vanilla.stats = nil
	self.parts.wpn_upg_ak_s_skfoldable_vanilla.pcs = nil
	self.parts.wpn_fps_ass_akm_body_upperreceiver = {
		type = "upper_reciever",
		name_id = "bm_wp_akm_body_upperreceiver",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_ass_akm_pts/wpn_fps_ass_akm_body_upperreceiver",
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_akm_body_upperreceiver_gold = {
		type = "upper_reciever",
		name_id = "bm_wp_akm_body_upperreceiver_gold",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_ass_akm_gold_pts/wpn_fps_ass_akm_body_upperreceiver_gold",
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_ak_body_lowerreceiver = {
		type = "lower_reciever",
		name_id = "bm_wp_ak_body_lowerreceiver",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_ass_akm_pts/wpn_fps_ass_ak_body_lowerreceiver",
		stats = {value = 1},
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	}
	self.parts.wpn_fps_ass_ak_body_lowerreceiver_gold = {
		type = "lower_reciever",
		name_id = "bm_wp_ak_body_lowerreceiver_gold",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_ass_akm_gold_pts/wpn_fps_ass_ak_body_lowerreceiver_gold",
		stats = {value = 1},
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	}
	self.parts.wpn_fps_ass_akm_b_standard = {
		type = "barrel",
		name_id = "bm_wp_akm_b_standard",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_ass_akm_pts/wpn_fps_ass_akm_b_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_akm_b_standard_gold = {
		type = "barrel",
		name_id = "bm_wp_akm_b_standard_gold",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_ass_akm_gold_pts/wpn_fps_ass_akm_b_standard_gold",
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_akm_body_upperreceiver.third_unit = "units/payday2/weapons/wpn_third_ass_akm_pts/wpn_third_ass_akm_body_upperreceiver"
	self.parts.wpn_fps_ass_akm_body_upperreceiver_gold.third_unit = "units/payday2/weapons/wpn_third_ass_akm_pts/wpn_third_ass_akm_body_upperreceiver_gold"
	self.parts.wpn_fps_ass_akm_b_standard.third_unit = "units/payday2/weapons/wpn_third_ass_akm_pts/wpn_third_ass_akm_b_standard"
	self.parts.wpn_fps_ass_akm_b_standard_gold.third_unit = "units/payday2/weapons/wpn_third_ass_akm_pts/wpn_third_ass_akm_b_standard_gold"
	self.parts.wpn_fps_ass_ak_body_lowerreceiver.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_ass_ak_body_lowerreceiver"
	self.parts.wpn_fps_ass_ak_body_lowerreceiver_gold.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_ass_ak_body_lowerreceiver_gold"
	self.parts.wpn_fps_ass_akm_body_upperreceiver_vanilla = deep_clone(self.parts.wpn_fps_ass_akm_body_upperreceiver)
	self.parts.wpn_fps_ass_akm_body_upperreceiver_vanilla.stats = nil
	self.parts.wpn_fps_ass_akm_body_upperreceiver_vanilla.pc = nil
end

function WeaponFactoryTweakData_37:_init_ak74()
	self.parts.wpn_fps_ass_74_b_standard = {
		type = "barrel",
		name_id = "bm_wp_74_b_standard",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_ass_74_pts/wpn_fps_ass_74_b_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_74_body_upperreceiver = {
		type = "upper_reciever",
		name_id = "bm_wp_74_body_upperreceiver",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_ass_74_pts/wpn_fps_ass_74_body_upperreceiver",
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_74_m_standard = {
		type = "magazine",
		name_id = "bm_wp_74_m_standard",
		a_obj = "a_m",
		unit = "units/payday2/weapons/wpn_fps_ass_74_pts/wpn_fps_ass_74_m_standard",
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_ass_74_b_standard.third_unit = "units/payday2/weapons/wpn_third_ass_74_pts/wpn_third_ass_74_b_standard"
	self.parts.wpn_fps_ass_74_body_upperreceiver.third_unit = "units/payday2/weapons/wpn_third_ass_74_pts/wpn_third_ass_74_body_upperreceiver"
	self.parts.wpn_fps_ass_74_m_standard.third_unit = "units/payday2/weapons/wpn_third_ass_74_pts/wpn_third_ass_74_m_standard"
	self.wpn_fps_ass_74 = {}
	self.wpn_fps_ass_74.unit = "units/payday2/weapons/wpn_fps_ass_74/wpn_fps_ass_74"
	self.wpn_fps_ass_74.stock_adapter = "wpn_upg_ak_s_adapter"
	self.wpn_fps_ass_74.optional_types = {
		"barrel_ext",
		"gadget",
		"vertical_grip"
	}
	self.wpn_fps_ass_74.adds = {
		wpn_fps_upg_o_specter = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_aimpoint = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_aimpoint_2 = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_docter = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_eotech = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_t1micro = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_cmore = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_acog = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_cs = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_eotech_xps = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_reflex = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_rx01 = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_rx30 = {
			"wpn_fps_ak_extra_ris"
		}
	}
	self.wpn_fps_ass_74.default_blueprint = {
		"wpn_fps_ass_74_b_standard",
		"wpn_fps_ass_74_body_upperreceiver",
		"wpn_fps_ass_ak_body_lowerreceiver",
		"wpn_fps_ass_74_m_standard",
		"wpn_upg_ak_fg_standard",
		"wpn_upg_ak_s_skfoldable_vanilla"
	}
	self.wpn_fps_ass_74.uses_parts = {
		"wpn_fps_ass_74_b_standard",
		"wpn_fps_ass_74_body_upperreceiver",
		"wpn_fps_ass_akm_body_upperreceiver",
		"wpn_fps_ass_ak_body_lowerreceiver",
		"wpn_fps_ass_74_m_standard",
		"wpn_upg_ak_m_drum",
		"wpn_upg_ak_fg_standard",
		"wpn_upg_ak_fg_combo2",
		"wpn_upg_ak_fg_combo3",
		"wpn_upg_ak_fg_combo1",
		"wpn_upg_ak_fg_combo4",
		"wpn_upg_ak_g_standard",
		"wpn_fps_upg_m4_s_standard",
		"wpn_fps_upg_m4_s_pts",
		"wpn_upg_ak_s_folding",
		"wpn_upg_ak_s_psl",
		"wpn_upg_ak_s_skfoldable_vanilla",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_vg_ass_smg_verticalgrip",
		"wpn_fps_upg_vg_ass_smg_stubby",
		"wpn_fps_upg_vg_ass_smg_afg",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_ak_g_hgrip",
		"wpn_fps_upg_ak_g_pgrip",
		"wpn_fps_upg_ak_g_wgrip",
		"wpn_fps_upg_i_singlefire",
		"wpn_fps_upg_i_autofire",
		"wpn_fps_upg_m4_s_crane",
		"wpn_fps_upg_m4_s_mk46",
		"wpn_fps_upg_ak_fg_tapco",
		"wpn_fps_upg_fg_midwest",
		"wpn_fps_upg_ak_b_draco",
		"wpn_fps_upg_ak_m_quad",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs"
	}
	self.wpn_fps_ass_74_npc = deep_clone(self.wpn_fps_ass_74)
	self.wpn_fps_ass_74_npc.unit = "units/payday2/weapons/wpn_fps_ass_74/wpn_fps_ass_74_npc"
	self.wpn_fps_ass_74_secondary = deep_clone(self.wpn_fps_ass_74)
	self.wpn_fps_ass_74_secondary.unit = "units/payday2/weapons/wpn_fps_ass_74/wpn_fps_ass_74_secondary"
	self.wpn_fps_ass_74_secondary_npc = deep_clone(self.wpn_fps_ass_74_npc)
	self.wpn_fps_ass_74_secondary_npc.unit = "units/payday2/weapons/wpn_fps_ass_74/wpn_fps_ass_74_secondary_npc"
end

function WeaponFactoryTweakData_37:_init_akm()
	self.wpn_fps_ass_akm = {}
	self.wpn_fps_ass_akm.unit = "units/payday2/weapons/wpn_fps_ass_akm/wpn_fps_ass_akm"
	self.wpn_fps_ass_akm.stock_adapter = "wpn_upg_ak_s_adapter"
	self.wpn_fps_ass_akm.optional_types = {
		"barrel_ext",
		"gadget",
		"vertical_grip",
		"sight"
	}
	self.wpn_fps_ass_akm.adds = {
		wpn_fps_upg_o_specter = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_aimpoint = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_aimpoint_2 = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_docter = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_eotech = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_t1micro = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_cmore = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_acog = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_cs = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_eotech_xps = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_reflex = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_rx01 = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_rx30 = {
			"wpn_fps_ak_extra_ris"
		}
	}
	self.wpn_fps_ass_akm.default_blueprint = {
		"wpn_upg_ak_s_folding_vanilla",
		"wpn_upg_ak_fg_standard",
		"wpn_upg_ak_m_akm",
		"wpn_upg_ak_g_standard",
		"wpn_fps_ass_akm_b_standard",
		"wpn_fps_ass_akm_body_upperreceiver_vanilla",
		"wpn_fps_ass_ak_body_lowerreceiver"
	}
	self.wpn_fps_ass_akm.uses_parts = {
		"wpn_fps_ass_akm_b_standard",
		"wpn_fps_ass_akm_body_upperreceiver_vanilla",
		"wpn_fps_ass_ak_body_lowerreceiver",
		"wpn_upg_ak_m_akm",
		"wpn_upg_ak_fg_standard",
		"wpn_upg_ak_fg_combo2",
		"wpn_upg_ak_fg_combo3",
		"wpn_upg_ak_g_standard",
		"wpn_fps_upg_m4_s_standard",
		"wpn_fps_upg_m4_s_pts",
		"wpn_upg_ak_s_folding_vanilla",
		"wpn_upg_ak_s_psl",
		"wpn_upg_ak_s_skfoldable",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_vg_ass_smg_verticalgrip",
		"wpn_fps_upg_vg_ass_smg_stubby",
		"wpn_fps_upg_vg_ass_smg_afg",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_ak_g_hgrip",
		"wpn_fps_upg_ak_g_pgrip",
		"wpn_fps_upg_ak_g_wgrip",
		"wpn_fps_upg_i_singlefire",
		"wpn_fps_upg_i_autofire",
		"wpn_fps_upg_m4_s_crane",
		"wpn_fps_upg_m4_s_mk46",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_ak_fg_tapco",
		"wpn_fps_upg_fg_midwest",
		"wpn_fps_upg_ak_b_draco",
		"wpn_fps_upg_ak_m_quad",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs"
	}
	self.wpn_fps_ass_akm_npc = deep_clone(self.wpn_fps_ass_akm)
	self.wpn_fps_ass_akm_npc.unit = "units/payday2/weapons/wpn_fps_ass_akm/wpn_fps_ass_akm_npc"
end

function WeaponFactoryTweakData_37:_init_akm_gold()
	self.wpn_fps_ass_akm_gold = {}
	self.wpn_fps_ass_akm_gold.unit = "units/payday2/weapons/wpn_fps_ass_akm_gold/wpn_fps_ass_akm_gold"
	self.wpn_fps_ass_akm_gold.stock_adapter = "wpn_upg_ak_s_adapter"
	self.wpn_fps_ass_akm_gold.optional_types = {
		"barrel_ext",
		"gadget",
		"vertical_grip",
		"sight"
	}
	self.wpn_fps_ass_akm_gold.adds = {
		wpn_fps_upg_o_specter = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_aimpoint = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_aimpoint_2 = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_docter = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_eotech = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_t1micro = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_cmore = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_acog = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_cs = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_eotech_xps = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_reflex = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_rx01 = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_rx30 = {
			"wpn_fps_ak_extra_ris"
		}
	}
	self.wpn_fps_ass_akm_gold.default_blueprint = {
		"wpn_upg_ak_s_folding_vanilla_gold",
		"wpn_upg_ak_fg_standard_gold",
		"wpn_upg_ak_m_akm_gold",
		"wpn_upg_ak_g_standard",
		"wpn_fps_ass_akm_b_standard_gold",
		"wpn_fps_ass_akm_body_upperreceiver_gold",
		"wpn_fps_ass_ak_body_lowerreceiver_gold"
	}
	self.wpn_fps_ass_akm_gold.uses_parts = {
		"wpn_fps_ass_akm_b_standard_gold",
		"wpn_fps_ass_akm_body_upperreceiver_gold",
		"wpn_fps_ass_ak_body_lowerreceiver_gold",
		"wpn_upg_ak_m_akm_gold",
		"wpn_upg_ak_fg_standard_gold",
		"wpn_upg_ak_fg_combo2",
		"wpn_upg_ak_fg_combo3",
		"wpn_upg_ak_g_standard",
		"wpn_fps_upg_m4_s_standard",
		"wpn_fps_upg_m4_s_pts",
		"wpn_upg_ak_s_folding_vanilla_gold",
		"wpn_upg_ak_s_psl",
		"wpn_upg_ak_s_skfoldable",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_vg_ass_smg_verticalgrip",
		"wpn_fps_upg_vg_ass_smg_stubby",
		"wpn_fps_upg_vg_ass_smg_afg",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_ak_g_hgrip",
		"wpn_fps_upg_ak_g_pgrip",
		"wpn_fps_upg_ak_g_wgrip",
		"wpn_fps_upg_i_singlefire",
		"wpn_fps_upg_i_autofire",
		"wpn_fps_upg_m4_s_crane",
		"wpn_fps_upg_m4_s_mk46",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_ak_fg_tapco",
		"wpn_fps_upg_fg_midwest",
		"wpn_fps_upg_ak_b_draco",
		"wpn_fps_upg_ak_m_quad",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs"
	}
	self.wpn_fps_ass_akm_gold_npc = deep_clone(self.wpn_fps_ass_akm_gold)
	self.wpn_fps_ass_akm_gold_npc.unit = "units/payday2/weapons/wpn_fps_ass_akm_gold/wpn_fps_ass_akm_gold_npc"
end

function WeaponFactoryTweakData_37:_init_akmsu()
	self.parts.wpn_fps_smg_akmsu_b_standard = {
		type = "barrel",
		name_id = "bm_wp_akmsu_b_standard",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_smg_akmsu_pts/wpn_fps_smg_akmsu_b_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_akmsu_body_lowerreceiver = {
		type = "lower_receiver",
		name_id = "bm_wp_akmsu_body_lowerreceiver",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_smg_akmsu_pts/wpn_fps_smg_akmsu_body_lowerreceiver",
		stats = {value = 1},
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	}
	self.parts.wpn_fps_smg_akmsu_fg_rail = {
		pcs = {30, 40},
		type = "foregrip",
		name_id = "bm_wp_akmsu_fg_rail",
		a_obj = "a_fg",
		unit = "units/payday2/weapons/wpn_fps_smg_akmsu_pts/wpn_fps_smg_akmsu_fg_rail",
		stats = {
			value = 5,
			spread_moving = -2,
			recoil = 2,
			concealment = -2
		},
		forbids = {
			"wpn_fps_addon_ris",
			"wpn_fps_ak_extra_ris"
		}
	}
	self.parts.wpn_fps_smg_akmsu_fg_standard = {
		type = "foregrip",
		name_id = "bm_wp_akmsu_fg_standard",
		a_obj = "a_fg",
		unit = "units/payday2/weapons/wpn_fps_smg_akmsu_pts/wpn_fps_smg_akmsu_fg_standard",
		stats = {value = 1},
		override = {
			wpn_fps_upg_o_specter = {a_obj = "a_of"},
			wpn_fps_upg_o_aimpoint = {a_obj = "a_of"},
			wpn_fps_upg_o_aimpoint_2 = {a_obj = "a_of"},
			wpn_fps_upg_o_docter = {a_obj = "a_of"},
			wpn_fps_upg_o_eotech = {a_obj = "a_of"},
			wpn_fps_upg_o_t1micro = {a_obj = "a_of"},
			wpn_fps_upg_o_cmore = {a_obj = "a_of"},
			wpn_fps_upg_o_acog = {a_obj = "a_of"},
			wpn_fps_upg_o_cs = {a_obj = "a_of"}
		}
	}
	self.parts.wpn_fps_smg_akmsu_b_standard.third_unit = "units/payday2/weapons/wpn_third_smg_akmsu_pts/wpn_third_smg_akmsu_b_standard"
	self.parts.wpn_fps_smg_akmsu_body_lowerreceiver.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_akmsu_body_lowerreceiver"
	self.parts.wpn_fps_smg_akmsu_fg_rail.third_unit = "units/payday2/weapons/wpn_third_smg_akmsu_pts/wpn_third_smg_akmsu_fg_rail"
	self.parts.wpn_fps_smg_akmsu_fg_standard.third_unit = "units/payday2/weapons/wpn_third_smg_akmsu_pts/wpn_third_smg_akmsu_fg_standard"
	self.wpn_fps_smg_akmsu = {}
	self.wpn_fps_smg_akmsu.unit = "units/payday2/weapons/wpn_fps_smg_akmsu/wpn_fps_smg_akmsu"
	self.wpn_fps_smg_akmsu.stock_adapter = "wpn_upg_ak_s_adapter"
	self.wpn_fps_smg_akmsu.optional_types = {
		"barrel_ext",
		"gadget",
		"vertical_grip"
	}
	self.wpn_fps_smg_akmsu.adds = {
		wpn_fps_upg_o_specter = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_aimpoint = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_aimpoint_2 = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_docter = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_eotech = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_t1micro = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_cmore = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_acog = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_cs = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_eotech_xps = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_reflex = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_rx01 = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_rx30 = {
			"wpn_fps_ak_extra_ris"
		}
	}
	self.wpn_fps_smg_akmsu.default_blueprint = {
		"wpn_fps_smg_akmsu_body_lowerreceiver",
		"wpn_fps_ass_akm_body_upperreceiver_vanilla",
		"wpn_fps_smg_akmsu_b_standard",
		"wpn_fps_smg_akmsu_fg_standard",
		"wpn_upg_ak_s_folding_vanilla",
		"wpn_upg_ak_g_standard",
		"wpn_upg_ak_m_akm"
	}
	self.wpn_fps_smg_akmsu.uses_parts = {
		"wpn_fps_smg_akmsu_body_lowerreceiver",
		"wpn_fps_ass_akm_body_upperreceiver_vanilla",
		"wpn_fps_smg_akmsu_b_standard",
		"wpn_fps_smg_akmsu_fg_standard",
		"wpn_fps_smg_akmsu_fg_rail",
		"wpn_upg_ak_g_standard",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_upg_ak_m_akm",
		"wpn_fps_upg_m4_s_standard",
		"wpn_fps_upg_m4_s_pts",
		"wpn_upg_ak_s_folding_vanilla",
		"wpn_upg_ak_s_psl",
		"wpn_upg_ak_s_skfoldable",
		"wpn_fps_upg_vg_ass_smg_verticalgrip",
		"wpn_fps_upg_vg_ass_smg_stubby",
		"wpn_fps_upg_vg_ass_smg_afg",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_ak_g_hgrip",
		"wpn_fps_upg_ak_g_pgrip",
		"wpn_fps_upg_ak_g_wgrip",
		"wpn_fps_upg_i_singlefire",
		"wpn_fps_upg_i_autofire",
		"wpn_fps_upg_m4_s_crane",
		"wpn_fps_upg_m4_s_mk46",
		"wpn_fps_upg_ak_m_quad",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs"
	}
	self.wpn_fps_smg_akmsu_npc = deep_clone(self.wpn_fps_smg_akmsu)
	self.wpn_fps_smg_akmsu_npc.unit = "units/payday2/weapons/wpn_fps_smg_akmsu/wpn_fps_smg_akmsu_npc"
	self.wpn_fps_smg_akmsu_primary = deep_clone(self.wpn_fps_smg_akmsu)
	self.wpn_fps_smg_akmsu_primary.unit = "units/payday2/weapons/wpn_fps_smg_akmsu/wpn_fps_smg_akmsu_primary"
	self.wpn_fps_smg_akmsu_primary_npc = deep_clone(self.wpn_fps_smg_akmsu_npc)
	self.wpn_fps_smg_akmsu_primary_npc.unit = "units/payday2/weapons/wpn_fps_smg_akmsu/wpn_fps_smg_akmsu_primary_npc"
end

function WeaponFactoryTweakData_37:_init_saiga()
	self.parts.wpn_fps_shot_saiga_b_standard = {
		type = "barrel",
		name_id = "bm_wp_saiga_b_standard",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_shot_saiga_pts/wpn_fps_shot_saiga_b_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_shot_saiga_m_5rnd = {
		type = "magazine",
		name_id = "bm_wp_saiga_m_5rnd",
		a_obj = "a_m",
		unit = "units/payday2/weapons/wpn_fps_shot_saiga_pts/wpn_fps_shot_saiga_m_5rnd",
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_upg_saiga_fg_standard = {
		type = "foregrip",
		name_id = "bm_wp_saiga_fg_standard",
		a_obj = "a_fg",
		unit = "units/payday2/weapons/wpn_fps_shot_saiga_pts/wpn_upg_saiga_fg_standard",
		stats = {value = 1},
		override = {
			wpn_fps_upg_o_specter = {a_obj = "a_of"},
			wpn_fps_upg_o_aimpoint = {a_obj = "a_of"},
			wpn_fps_upg_o_aimpoint_2 = {a_obj = "a_of"},
			wpn_fps_upg_o_docter = {a_obj = "a_of"},
			wpn_fps_upg_o_eotech = {a_obj = "a_of"},
			wpn_fps_upg_o_t1micro = {a_obj = "a_of"},
			wpn_fps_upg_o_cmore = {a_obj = "a_of"},
			wpn_fps_upg_o_acog = {a_obj = "a_of"},
			wpn_fps_upg_o_cs = {a_obj = "a_of"}
		}
	}
	self.parts.wpn_upg_saiga_fg_lowerrail = {
		pcs = {30, 40},
		type = "foregrip",
		name_id = "bm_wp_saiga_fg_lowerrail",
		a_obj = "a_fg",
		unit = "units/payday2/weapons/wpn_fps_shot_saiga_pts/wpn_upg_saiga_fg_lowerrail",
		stats = {
			value = 5,
			recoil = 2,
			spread_moving = -2,
			concealment = -2
		},
		forbids = {
			"wpn_fps_addon_ris",
			"wpn_fps_smg_mac10_body_ris_special"
		}
	}
	self.parts.wpn_upg_saiga_m_20rnd = {
		type = "magazine",
		name_id = "bm_wp_saiga_m_20rnd",
		a_obj = "a_m",
		unit = "units/payday2/weapons/wpn_fps_shot_saiga_pts/wpn_upg_saiga_m_20rnd",
		stats = {value = 1, extra_ammo = 6},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_shot_saiga_b_standard.third_unit = "units/payday2/weapons/wpn_third_shot_saiga_pts/wpn_third_shot_saiga_b_standard"
	self.parts.wpn_fps_shot_saiga_m_5rnd.third_unit = "units/payday2/weapons/wpn_third_shot_saiga_pts/wpn_third_shot_saiga_m_5rnd"
	self.parts.wpn_upg_saiga_fg_standard.third_unit = "units/payday2/weapons/wpn_third_shot_saiga_pts/wpn_third_upg_saiga_fg_standard"
	self.parts.wpn_upg_saiga_fg_lowerrail.third_unit = "units/payday2/weapons/wpn_third_shot_saiga_pts/wpn_third_upg_saiga_fg_lowerrail"
	self.parts.wpn_upg_saiga_m_20rnd.third_unit = "units/payday2/weapons/wpn_third_shot_saiga_pts/wpn_third_saiga_m_20rnd"
	self.wpn_fps_shot_saiga = {}
	self.wpn_fps_shot_saiga.unit = "units/payday2/weapons/wpn_fps_shot_saiga/wpn_fps_shot_saiga"
	self.wpn_fps_shot_saiga.stock_adapter = "wpn_upg_ak_s_adapter"
	self.wpn_fps_shot_saiga.optional_types = {
		"barrel_ext",
		"gadget",
		"vertical_grip"
	}
	self.wpn_fps_shot_saiga.override = {
		wpn_upg_o_marksmansight_rear_vanilla = {a_obj = "a_or"},
		wpn_upg_o_marksmansight_front = {a_obj = "a_of"}
	}
	self.wpn_fps_smg_akmsu.adds = {
		wpn_fps_upg_o_specter = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_aimpoint = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_aimpoint_2 = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_docter = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_eotech = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_t1micro = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_cmore = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_acog = {
			"wpn_fps_ak_extra_ris"
		},
		wpn_fps_upg_o_cs = {
			"wpn_fps_ak_extra_ris"
		}
	}
	self.wpn_fps_shot_saiga.default_blueprint = {
		"wpn_fps_smg_akmsu_body_lowerreceiver",
		"wpn_fps_ass_akm_body_upperreceiver_vanilla",
		"wpn_fps_shot_saiga_b_standard",
		"wpn_fps_shot_saiga_m_5rnd",
		"wpn_upg_ak_s_folding_vanilla",
		"wpn_upg_saiga_fg_standard",
		"wpn_upg_ak_g_standard",
		"wpn_upg_o_marksmansight_rear_vanilla"
	}
	self.wpn_fps_shot_saiga.uses_parts = {
		"wpn_fps_smg_akmsu_body_lowerreceiver",
		"wpn_fps_ass_akm_body_upperreceiver_vanilla",
		"wpn_upg_saiga_fg_standard",
		"wpn_upg_saiga_fg_lowerrail",
		"wpn_fps_shot_saiga_b_standard",
		"wpn_fps_shot_saiga_m_5rnd",
		"wpn_upg_saiga_m_20rnd",
		"wpn_upg_ak_g_standard",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_upg_o_marksmansight_rear_vanilla",
		"wpn_fps_upg_m4_s_standard",
		"wpn_fps_upg_m4_s_pts",
		"wpn_upg_ak_s_folding_vanilla",
		"wpn_upg_ak_s_psl",
		"wpn_upg_ak_s_skfoldable",
		"wpn_fps_upg_ns_shot_thick",
		"wpn_fps_upg_ns_shot_shark",
		"wpn_fps_upg_ak_g_hgrip",
		"wpn_fps_upg_ak_g_pgrip",
		"wpn_fps_upg_ak_g_wgrip",
		"wpn_fps_upg_i_singlefire",
		"wpn_fps_upg_i_autofire",
		"wpn_fps_upg_m4_s_crane",
		"wpn_fps_upg_m4_s_mk46",
		"wpn_fps_upg_shot_ns_king",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs"
	}
	self.wpn_fps_shot_saiga_npc = deep_clone(self.wpn_fps_shot_saiga)
	self.wpn_fps_shot_saiga_npc.unit = "units/payday2/weapons/wpn_fps_shot_saiga/wpn_fps_shot_saiga_npc"
end

function WeaponFactoryTweakData_37:_init_ak5()
	self.parts.wpn_fps_ass_ak5_b_std = {
		type = "barrel",
		name_id = "bm_wp_ak5_b_std",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_ass_ak5_pts/wpn_fps_ass_ak5_b_std",
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_ak5_body_ak5 = {
		type = "lower_reciever",
		name_id = "bm_wp_ak5_body_ak5",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_ass_ak5_pts/wpn_fps_ass_ak5_body_ak5",
		stats = {value = 1},
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	}
	self.parts.wpn_fps_ass_ak5_body_rail = {
		type = "extra",
		name_id = "bm_wp_ak5_body_rail",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_ass_ak5_pts/wpn_fps_ass_ak5_body_rail",
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_ak5_fg_ak5a = {
		type = "foregrip",
		name_id = "bm_wp_ak5_fg_ak5a",
		a_obj = "a_fg",
		unit = "units/payday2/weapons/wpn_fps_ass_ak5_pts/wpn_fps_ass_ak5_fg_ak5a",
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_ak5_fg_ak5c = {
		pc = 40,
		type = "foregrip",
		name_id = "bm_wp_ak5_fg_ak5c",
		a_obj = "a_fg",
		unit = "units/payday2/weapons/wpn_fps_ass_ak5_pts/wpn_fps_ass_ak5_fg_ak5c",
		stats = {
			value = 7,
			recoil = 2,
			damage = 1,
			spread_moving = -2,
			concealment = -2
		},
		forbids = {
			"wpn_fps_addon_ris"
		}
	}
	self.parts.wpn_fps_ass_ak5_fg_fnc = {
		pc = 40,
		type = "foregrip",
		name_id = "bm_wp_ak5_fg_fnc",
		a_obj = "a_fg",
		unit = "units/payday2/weapons/wpn_fps_ass_ak5_pts/wpn_fps_ass_ak5_fg_fnc",
		stats = {
			value = 10,
			spread_moving = 2,
			recoil = -1,
			concealment = 1
		}
	}
	self.parts.wpn_fps_ass_ak5_s_ak5a = {
		type = "stock",
		name_id = "bm_wp_ak5_s_ak5a",
		a_obj = "a_s",
		unit = "units/payday2/weapons/wpn_fps_ass_ak5_pts/wpn_fps_ass_ak5_s_ak5a",
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_ak5_s_ak5b = {
		pc = 40,
		type = "stock",
		name_id = "bm_wp_ak5_s_ak5b",
		a_obj = "a_s",
		unit = "units/payday2/weapons/wpn_fps_ass_ak5_pts/wpn_fps_ass_ak5_s_ak5b",
		stats = {
			value = 5,
			recoil = 0,
			spread_moving = -3,
			spread = 1,
			concealment = -1
		},
		adds = {
			"wpn_fps_ass_ak5_s_ak5a"
		},
		stance_mod = {
			wpn_fps_ass_ak5 = {
				translation = Vector3(0, -8, 0)
			}
		}
	}
	self.parts.wpn_fps_ass_ak5_s_ak5c = {
		pc = 40,
		type = "stock",
		name_id = "bm_wp_ak5_s_ak5c",
		a_obj = "a_s",
		unit = "units/payday2/weapons/wpn_fps_ass_ak5_pts/wpn_fps_ass_ak5_s_ak5c",
		stats = {
			value = 7,
			recoil = 2,
			spread_moving = 2,
			concealment = 2
		}
	}
	self.parts.wpn_fps_ass_ak5_b_std.third_unit = "units/payday2/weapons/wpn_third_ass_ak5_pts/wpn_third_ass_ak5_b_std"
	self.parts.wpn_fps_ass_ak5_body_ak5.third_unit = "units/payday2/weapons/wpn_third_ass_ak5_pts/wpn_third_ass_ak5_body_ak5"
	self.parts.wpn_fps_ass_ak5_body_rail.third_unit = "units/payday2/weapons/wpn_third_ass_ak5_pts/wpn_third_ass_ak5_body_rail"
	self.parts.wpn_fps_ass_ak5_fg_ak5a.third_unit = "units/payday2/weapons/wpn_third_ass_ak5_pts/wpn_third_ass_ak5_fg_ak5a"
	self.parts.wpn_fps_ass_ak5_fg_ak5c.third_unit = "units/payday2/weapons/wpn_third_ass_ak5_pts/wpn_third_ass_ak5_fg_ak5c"
	self.parts.wpn_fps_ass_ak5_fg_fnc.third_unit = "units/payday2/weapons/wpn_third_ass_ak5_pts/wpn_third_ass_ak5_fg_fnc"
	self.parts.wpn_fps_ass_ak5_s_ak5a.third_unit = "units/payday2/weapons/wpn_third_ass_ak5_pts/wpn_third_ass_ak5_s_ak5a"
	self.parts.wpn_fps_ass_ak5_s_ak5b.third_unit = "units/payday2/weapons/wpn_third_ass_ak5_pts/wpn_third_ass_ak5_s_ak5b"
	self.parts.wpn_fps_ass_ak5_s_ak5c.third_unit = "units/payday2/weapons/wpn_third_ass_ak5_pts/wpn_third_ass_ak5_s_ak5c"
	self.wpn_fps_ass_ak5 = {}
	self.wpn_fps_ass_ak5.unit = "units/payday2/weapons/wpn_fps_ass_ak5/wpn_fps_ass_ak5"
	self.wpn_fps_ass_ak5.optional_types = {
		"barrel_ext",
		"gadget",
		"vertical_grip",
		"sight"
	}
	self.wpn_fps_ass_ak5.adds = {
		wpn_fps_upg_o_specter = {
			"wpn_fps_ass_ak5_body_rail"
		},
		wpn_fps_upg_o_aimpoint = {
			"wpn_fps_ass_ak5_body_rail"
		},
		wpn_fps_upg_o_aimpoint_2 = {
			"wpn_fps_ass_ak5_body_rail"
		},
		wpn_fps_upg_o_docter = {
			"wpn_fps_ass_ak5_body_rail"
		},
		wpn_fps_upg_o_eotech = {
			"wpn_fps_ass_ak5_body_rail"
		},
		wpn_fps_upg_o_t1micro = {
			"wpn_fps_ass_ak5_body_rail"
		},
		wpn_fps_upg_o_cmore = {
			"wpn_fps_ass_ak5_body_rail"
		},
		wpn_fps_upg_o_acog = {
			"wpn_fps_ass_ak5_body_rail"
		},
		wpn_fps_upg_o_cs = {
			"wpn_fps_ass_ak5_body_rail"
		},
		wpn_fps_upg_o_eotech_xps = {
			"wpn_fps_ass_ak5_body_rail"
		},
		wpn_fps_upg_o_reflex = {
			"wpn_fps_ass_ak5_body_rail"
		},
		wpn_fps_upg_o_rx01 = {
			"wpn_fps_ass_ak5_body_rail"
		},
		wpn_fps_upg_o_rx30 = {
			"wpn_fps_ass_ak5_body_rail"
		}
	}
	self.wpn_fps_ass_ak5.default_blueprint = {
		"wpn_fps_ass_ak5_b_std",
		"wpn_fps_ass_ak5_body_ak5",
		"wpn_fps_ass_ak5_fg_ak5a",
		"wpn_fps_ass_ak5_s_ak5a",
		"wpn_fps_m4_uupg_m_std_vanilla"
	}
	self.wpn_fps_ass_ak5.uses_parts = {
		"wpn_fps_ass_ak5_b_std",
		"wpn_fps_ass_ak5_body_ak5",
		"wpn_fps_ass_ak5_body_rail",
		"wpn_fps_ass_ak5_fg_ak5a",
		"wpn_fps_ass_ak5_fg_ak5c",
		"wpn_fps_ass_ak5_fg_fnc",
		"wpn_fps_ass_ak5_s_ak5a",
		"wpn_fps_ass_ak5_s_ak5b",
		"wpn_fps_ass_ak5_s_ak5c",
		"wpn_fps_m4_uupg_m_std_vanilla",
		"wpn_fps_upg_m4_m_drum",
		"wpn_fps_upg_m4_m_pmag",
		"wpn_fps_upg_m4_m_straight",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_vg_ass_smg_verticalgrip",
		"wpn_fps_upg_vg_ass_smg_stubby",
		"wpn_fps_upg_vg_ass_smg_afg",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_i_singlefire",
		"wpn_fps_upg_i_autofire",
		"wpn_fps_upg_m4_m_quad",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser"
	}
	self.wpn_fps_ass_ak5_npc = deep_clone(self.wpn_fps_ass_ak5)
	self.wpn_fps_ass_ak5_npc.unit = "units/payday2/weapons/wpn_fps_ass_ak5/wpn_fps_ass_ak5_npc"
end

function WeaponFactoryTweakData_37:_init_aug()
	self.parts.wpn_fps_aug_b_long = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel",
		name_id = "bm_wp_aug_b_long",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_ass_aug_pts/wpn_fps_aug_b_long",
		stats = {
			value = 7,
			spread_moving = -2,
			spread = 1,
			recoil = 1,
			concealment = -3,
			damage = 1
		}
	}
	self.parts.wpn_fps_aug_b_medium = {
		type = "barrel",
		name_id = "bm_wp_aug_b_medium",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_ass_aug_pts/wpn_fps_aug_b_medium",
		stats = {value = 1}
	}
	self.parts.wpn_fps_aug_b_short = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel",
		name_id = "bm_wp_aug_b_short",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_ass_aug_pts/wpn_fps_aug_b_short",
		stats = {
			value = 5,
			spread_moving = 3,
			spread = -1,
			recoil = 2,
			concealment = 2
		}
	}
	self.parts.wpn_fps_aug_m_pmag = {
		type = "magazine",
		name_id = "bm_wp_aug_m_pmag",
		a_obj = "a_m",
		unit = "units/payday2/weapons/wpn_fps_ass_aug_pts/wpn_fps_aug_m_pmag",
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_aug_body_aug = {
		type = "lower_reciever",
		name_id = "bm_wp_aug_body_aug",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_ass_aug_pts/wpn_fps_aug_body_aug",
		stats = {value = 1},
		animations = {reload = "reload"}
	}
	self.parts.wpn_fps_aug_fg_a3 = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "extra",
		name_id = "bm_wp_aug_fg_a3",
		a_obj = "a_fg",
		unit = "units/payday2/weapons/wpn_fps_ass_aug_pts/wpn_fps_aug_fg_a3",
		stats = {
			value = 7,
			recoil = 2,
			damage = 1,
			spread_moving = -2,
			concealment = -2
		}
	}
	self.parts.wpn_fps_aug_ris_special = {
		type = "extra",
		name_id = "bm_wp_aug_body_ris",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_ass_aug_pts/wpn_fps_aug_ris_special",
		stats = {value = 1}
	}
	self.parts.wpn_fps_aug_b_long.third_unit = "units/payday2/weapons/wpn_third_ass_aug_pts/wpn_third_ass_aug_b_long"
	self.parts.wpn_fps_aug_b_medium.third_unit = "units/payday2/weapons/wpn_third_ass_aug_pts/wpn_third_ass_aug_b_medium"
	self.parts.wpn_fps_aug_b_short.third_unit = "units/payday2/weapons/wpn_third_ass_aug_pts/wpn_third_ass_aug_b_short"
	self.parts.wpn_fps_aug_body_aug.third_unit = "units/payday2/weapons/wpn_third_ass_aug_pts/wpn_third_ass_aug_body_aug"
	self.parts.wpn_fps_aug_fg_a3.third_unit = "units/payday2/weapons/wpn_third_ass_aug_pts/wpn_third_ass_aug_fg_a3"
	self.parts.wpn_fps_aug_m_pmag.third_unit = "units/payday2/weapons/wpn_third_ass_aug_pts/wpn_third_aug_m_pmag"
	self.parts.wpn_fps_aug_ris_special.third_unit = "units/payday2/weapons/wpn_third_ass_aug_pts/wpn_third_aug_ris_special"
	self.wpn_fps_ass_aug = {}
	self.wpn_fps_ass_aug.unit = "units/payday2/weapons/wpn_fps_ass_aug/wpn_fps_ass_aug"
	self.wpn_fps_ass_aug.optional_types = {"barrel_ext", "gadget"}
	self.wpn_fps_ass_aug.adds = {
		wpn_fps_upg_fl_ass_smg_sho_peqbox = {
			"wpn_fps_aug_ris_special"
		},
		wpn_fps_upg_fl_ass_smg_sho_surefire = {
			"wpn_fps_aug_ris_special"
		},
		wpn_fps_upg_fl_ass_peq15 = {
			"wpn_fps_aug_ris_special"
		},
		wpn_fps_upg_fl_ass_laser = {
			"wpn_fps_aug_ris_special"
		}
	}
	self.wpn_fps_ass_aug.override = {
		wpn_upg_o_marksmansight_rear_vanilla = {a_obj = "a_or"},
		wpn_upg_o_marksmansight_front_vanilla = {a_obj = "a_of"},
		wpn_upg_o_marksmansight_front = {a_obj = "a_of"}
	}
	self.wpn_fps_ass_aug.default_blueprint = {
		"wpn_fps_aug_body_aug",
		"wpn_fps_aug_b_medium",
		"wpn_fps_upg_vg_ass_smg_verticalgrip",
		"wpn_fps_aug_m_pmag",
		"wpn_upg_o_marksmansight_rear_vanilla"
	}
	self.wpn_fps_ass_aug.uses_parts = {
		"wpn_fps_aug_body_aug",
		"wpn_fps_aug_fg_a3",
		"wpn_fps_aug_ris_special",
		"wpn_fps_aug_b_long",
		"wpn_fps_aug_b_medium",
		"wpn_fps_aug_b_short",
		"wpn_fps_aug_m_pmag",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_upg_o_marksmansight_rear_vanilla",
		"wpn_upg_o_marksmansight_front_vanilla",
		"wpn_fps_upg_vg_ass_smg_verticalgrip",
		"wpn_fps_upg_vg_ass_smg_stubby",
		"wpn_fps_upg_vg_ass_smg_afg",
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_i_singlefire",
		"wpn_fps_upg_i_autofire",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser"
	}
	self.wpn_fps_ass_aug_npc = deep_clone(self.wpn_fps_ass_aug)
	self.wpn_fps_ass_aug_npc.unit = "units/payday2/weapons/wpn_fps_ass_aug/wpn_fps_ass_aug_npc"
	self.wpn_fps_ass_aug_secondary = deep_clone(self.wpn_fps_ass_aug)
	self.wpn_fps_ass_aug_secondary.unit = "units/payday2/weapons/wpn_fps_ass_aug/wpn_fps_ass_aug_secondary"
	self.wpn_fps_ass_aug_secondary_npc = deep_clone(self.wpn_fps_ass_aug_npc)
	self.wpn_fps_ass_aug_secondary_npc.unit = "units/payday2/weapons/wpn_fps_ass_aug/wpn_fps_ass_aug_secondary_npc"
end

function WeaponFactoryTweakData_37:_init_g36()
	self.parts.wpn_fps_ass_g36_body_sl8 = {
		type = "lower_reciever",
		name_id = "bm_wp_g36_body_sl8",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_ass_g36_pts/wpn_fps_ass_g36_body_sl8",
		stats = {value = 1},
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	}
	self.parts.wpn_fps_ass_g36_body_standard = {
		type = "lower_reciever",
		name_id = "bm_wp_g36_body_standard",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_ass_g36_pts/wpn_fps_ass_g36_body_standard",
		stats = {value = 1},
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	}
	self.parts.wpn_fps_ass_g36_g_standard = {
		type = "grip",
		name_id = "bm_wp_g36_g_standard",
		a_obj = "a_g",
		unit = "units/payday2/weapons/wpn_fps_ass_g36_pts/wpn_fps_ass_g36_g_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_g36_m_standard = {
		type = "magazine",
		name_id = "bm_wp_g36_m_standard",
		a_obj = "a_m",
		unit = "units/payday2/weapons/wpn_fps_ass_g36_pts/wpn_fps_ass_g36_m_standard",
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_ass_g36_b_long = {
		type = "barrel",
		name_id = "bm_wp_g36_b_long",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_ass_g36_pts/wpn_fps_ass_g36_b_long",
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_g36_b_short = {
		type = "barrel",
		name_id = "bm_wp_g36_b_short",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_ass_g36_pts/wpn_fps_ass_g36_b_short",
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_g36_fg_c = {
		pcs = {
			20,
			30,
			40
		},
		type = "foregrip",
		name_id = "bm_wp_g36_fg_c",
		a_obj = "a_fg",
		unit = "units/payday2/weapons/wpn_fps_ass_g36_pts/wpn_fps_ass_g36_fg_c",
		stats = {
			value = 4,
			spread_moving = 2,
			recoil = -1,
			concealment = 2
		},
		forbids = {
			"wpn_fps_ass_g36_b_long"
		},
		adds = {
			"wpn_fps_ass_g36_b_short"
		}
	}
	self.parts.wpn_fps_ass_g36_fg_k = {
		type = "foregrip",
		name_id = "bm_wp_g36_fg_k",
		a_obj = "a_fg",
		unit = "units/payday2/weapons/wpn_fps_ass_g36_pts/wpn_fps_ass_g36_fg_k",
		stats = {value = 1},
		forbids = {
			"wpn_fps_ass_g36_b_short"
		},
		adds = {
			"wpn_fps_ass_g36_b_long"
		}
	}
	self.parts.wpn_fps_ass_g36_fg_ksk = {
		pcs = {
			20,
			30,
			40
		},
		type = "foregrip",
		name_id = "bm_wp_g36_fg_ksk",
		a_obj = "a_fg",
		unit = "units/payday2/weapons/wpn_fps_ass_g36_pts/wpn_fps_ass_g36_fg_ksk",
		stats = {
			value = 5,
			spread_moving = -2,
			spread = 1,
			recoil = 2,
			concealment = -2
		},
		forbids = {
			"wpn_fps_ass_g36_b_short"
		},
		adds = {
			"wpn_fps_ass_g36_b_long"
		}
	}
	self.parts.wpn_fps_ass_g36_s_kv = {
		pcs = {
			20,
			30,
			40
		},
		type = "stock",
		name_id = "bm_wp_g36_s_kv",
		a_obj = "a_s",
		unit = "units/payday2/weapons/wpn_fps_ass_g36_pts/wpn_fps_ass_g36_s_kv",
		stats = {
			value = 4,
			spread_moving = 2,
			concealment = 2
		},
		adds = {
			"wpn_fps_ass_g36_body_standard",
			"wpn_fps_ass_g36_g_standard"
		},
		forbids = {
			"wpn_fps_ass_g36_body_sl8"
		}
	}
	self.parts.wpn_fps_ass_g36_s_sl8 = {
		pcs = {
			20,
			30,
			40
		},
		type = "stock",
		name_id = "bm_wp_g36_s_sl8",
		a_obj = "a_s",
		unit = "units/payday2/weapons/wpn_fps_ass_g36_pts/wpn_fps_ass_g36_s_sl8",
		stats = {
			value = 9,
			recoil = 2,
			spread = 1,
			spread_moving = -3,
			concealment = -3
		},
		adds = {
			"wpn_fps_ass_g36_body_sl8"
		},
		forbids = {
			"wpn_fps_ass_g36_body_standard",
			"wpn_fps_ass_g36_g_standard"
		}
	}
	self.parts.wpn_fps_ass_g36_s_standard = {
		type = "stock",
		name_id = "bm_wp_g36_s_standard",
		a_obj = "a_s",
		unit = "units/payday2/weapons/wpn_fps_ass_g36_pts/wpn_fps_ass_g36_s_standard",
		stats = {value = 1},
		adds = {
			"wpn_fps_ass_g36_body_standard",
			"wpn_fps_ass_g36_g_standard"
		},
		forbids = {
			"wpn_fps_ass_g36_body_sl8"
		}
	}
	self.parts.wpn_fps_ass_g36_body_sl8.third_unit = "units/payday2/weapons/wpn_third_ass_g36_pts/wpn_third_ass_g36_body_sl8"
	self.parts.wpn_fps_ass_g36_body_standard.third_unit = "units/payday2/weapons/wpn_third_ass_g36_pts/wpn_third_ass_g36_body_standard"
	self.parts.wpn_fps_ass_g36_g_standard.third_unit = "units/payday2/weapons/wpn_third_ass_g36_pts/wpn_third_ass_g36_g_standard"
	self.parts.wpn_fps_ass_g36_m_standard.third_unit = "units/payday2/weapons/wpn_third_ass_g36_pts/wpn_third_ass_g36_m_standard"
	self.parts.wpn_fps_ass_g36_b_long.third_unit = "units/payday2/weapons/wpn_third_ass_g36_pts/wpn_third_upg_g36_b_long"
	self.parts.wpn_fps_ass_g36_b_short.third_unit = "units/payday2/weapons/wpn_third_ass_g36_pts/wpn_third_upg_g36_b_short"
	self.parts.wpn_fps_ass_g36_fg_c.third_unit = "units/payday2/weapons/wpn_third_ass_g36_pts/wpn_third_upg_g36_fg_c"
	self.parts.wpn_fps_ass_g36_fg_k.third_unit = "units/payday2/weapons/wpn_third_ass_g36_pts/wpn_third_upg_g36_fg_k"
	self.parts.wpn_fps_ass_g36_fg_ksk.third_unit = "units/payday2/weapons/wpn_third_ass_g36_pts/wpn_third_upg_g36_fg_ksk"
	self.parts.wpn_fps_ass_g36_s_kv.third_unit = "units/payday2/weapons/wpn_third_ass_g36_pts/wpn_third_upg_g36_s_kv"
	self.parts.wpn_fps_ass_g36_s_sl8.third_unit = "units/payday2/weapons/wpn_third_ass_g36_pts/wpn_third_upg_g36_s_sl8"
	self.parts.wpn_fps_ass_g36_s_standard.third_unit = "units/payday2/weapons/wpn_third_ass_g36_pts/wpn_third_upg_g36_s_standard"
	self.wpn_fps_ass_g36 = {}
	self.wpn_fps_ass_g36.unit = "units/payday2/weapons/wpn_fps_ass_g36/wpn_fps_ass_g36"
	self.wpn_fps_ass_g36.optional_types = {
		"barrel_ext",
		"gadget",
		"sight"
	}
	self.wpn_fps_ass_g36.default_blueprint = {
		"wpn_fps_ass_g36_s_standard",
		"wpn_fps_ass_g36_m_standard",
		"wpn_fps_ass_g36_b_long",
		"wpn_fps_ass_g36_fg_k"
	}
	self.wpn_fps_ass_g36.uses_parts = {
		"wpn_fps_ass_g36_body_standard",
		"wpn_fps_ass_g36_body_sl8",
		"wpn_fps_ass_g36_g_standard",
		"wpn_fps_ass_g36_m_standard",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_ass_g36_b_long",
		"wpn_fps_ass_g36_b_short",
		"wpn_fps_ass_g36_fg_c",
		"wpn_fps_ass_g36_fg_k",
		"wpn_fps_ass_g36_fg_ksk",
		"wpn_fps_ass_g36_s_standard",
		"wpn_fps_ass_g36_s_kv",
		"wpn_fps_ass_g36_s_sl8",
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_vg_ass_smg_verticalgrip",
		"wpn_fps_upg_vg_ass_smg_stubby",
		"wpn_fps_upg_vg_ass_smg_afg",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_i_singlefire",
		"wpn_fps_upg_i_autofire",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser"
	}
	self.wpn_fps_ass_g36_npc = deep_clone(self.wpn_fps_ass_g36)
	self.wpn_fps_ass_g36_npc.unit = "units/payday2/weapons/wpn_fps_ass_g36/wpn_fps_ass_g36_npc"
end

function WeaponFactoryTweakData_37:_init_p90()
	self.parts.wpn_fps_smg_p90_b_long = {
		pc = 40,
		type = "barrel",
		name_id = "bm_wp_p90_b_long",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_smg_p90_pts/wpn_fps_smg_p90_b_long",
		stats = {
			value = 8,
			spread = 1,
			spread_moving = -3,
			damage = 2,
			recoil = 3,
			concealment = -2
		}
	}
	self.parts.wpn_fps_smg_p90_b_short = {
		type = "barrel",
		name_id = "bm_wp_p90_b_short",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_smg_p90_pts/wpn_fps_smg_p90_b_short",
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_p90_body_p90 = {
		type = "lower_reciever",
		name_id = "bm_wp_p90_body_p90",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_smg_p90_pts/wpn_fps_smg_p90_body_p90",
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_smg_p90_m_std = {
		type = "magazine",
		name_id = "bm_wp_p90_m_std",
		a_obj = "a_m",
		unit = "units/payday2/weapons/wpn_fps_smg_p90_pts/wpn_fps_smg_p90_m_std",
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_smg_p90_b_long.third_unit = "units/payday2/weapons/wpn_third_smg_p90_pts/wpn_third_smg_p90_b_long"
	self.parts.wpn_fps_smg_p90_b_short.third_unit = "units/payday2/weapons/wpn_third_smg_p90_pts/wpn_third_smg_p90_b_short"
	self.parts.wpn_fps_smg_p90_body_p90.third_unit = "units/payday2/weapons/wpn_third_smg_p90_pts/wpn_third_smg_p90_body_p90"
	self.parts.wpn_fps_smg_p90_m_std.third_unit = "units/payday2/weapons/wpn_third_smg_p90_pts/wpn_third_smg_p90_m_std"
	self.wpn_fps_smg_p90 = {}
	self.wpn_fps_smg_p90.unit = "units/payday2/weapons/wpn_fps_smg_p90/wpn_fps_smg_p90"
	self.wpn_fps_smg_p90.optional_types = {"barrel_ext", "gadget"}
	self.wpn_fps_smg_p90.override = {
		wpn_upg_o_marksmansight_rear_vanilla = {a_obj = "a_or"},
		wpn_upg_o_marksmansight_front = {a_obj = "a_of"}
	}
	self.wpn_fps_smg_p90.default_blueprint = {
		"wpn_fps_smg_p90_body_p90",
		"wpn_fps_smg_p90_b_short",
		"wpn_fps_smg_p90_m_std",
		"wpn_upg_o_marksmansight_rear_vanilla"
	}
	self.wpn_fps_smg_p90.uses_parts = {
		"wpn_fps_smg_p90_body_p90",
		"wpn_fps_smg_p90_m_std",
		"wpn_fps_smg_p90_b_short",
		"wpn_fps_smg_p90_b_long",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_upg_o_marksmansight_rear_vanilla",
		"wpn_upg_o_marksmansight_front",
		"wpn_fps_upg_i_singlefire",
		"wpn_fps_upg_i_autofire",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser"
	}
	self.wpn_fps_smg_p90_npc = deep_clone(self.wpn_fps_smg_p90)
	self.wpn_fps_smg_p90_npc.unit = "units/payday2/weapons/wpn_fps_smg_p90/wpn_fps_smg_p90_npc"
end

function WeaponFactoryTweakData_37:_init_m14()
	self.parts.wpn_fps_ass_m14_b_standard = {
		type = "barrel",
		name_id = "bm_wp_m14_b_standard",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_ass_m14_pts/wpn_fps_ass_m14_b_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_m14_body_dmr = {
		type = "stock",
		name_id = "bm_wp_m14_body_dmr",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_ass_m14_pts/wpn_fps_ass_m14_body_dmr",
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_m14_body_ebr = {
		pcs = {30, 40},
		type = "stock",
		name_id = "bm_wp_m14_body_ebr",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_ass_m14_pts/wpn_fps_ass_m14_body_ebr",
		stats = {
			value = 6,
			spread_moving = 3,
			recoil = 2,
			concealment = 2
		},
		forbids = {
			"wpn_fps_addon_ris"
		}
	}
	self.parts.wpn_fps_ass_m14_body_jae = {
		pcs = {30, 40},
		type = "stock",
		name_id = "bm_wp_m14_body_jae",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_ass_m14_pts/wpn_fps_ass_m14_body_jae",
		stats = {
			value = 10,
			spread_moving = -2,
			recoil = 3,
			concealment = -2,
			spread = 1
		},
		forbids = {
			"wpn_fps_addon_ris"
		}
	}
	self.parts.wpn_fps_ass_m14_body_lower = {
		type = "lower_body",
		name_id = "bm_wp_m14_body_lower",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_ass_m14_pts/wpn_fps_ass_m14_body_lower",
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_m14_body_upper = {
		type = "upper_body",
		name_id = "bm_wp_m14_body_upper",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_ass_m14_pts/wpn_fps_ass_m14_body_upper",
		stats = {value = 1},
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	}
	self.parts.wpn_fps_ass_m14_m_standard = {
		type = "magazine",
		name_id = "bm_wp_m14_m_standard",
		a_obj = "a_m",
		unit = "units/payday2/weapons/wpn_fps_ass_m14_pts/wpn_fps_ass_m14_m_standard",
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_ass_m14_b_standard.third_unit = "units/payday2/weapons/wpn_third_ass_m14_pts/wpn_third_ass_m14_b_standard"
	self.parts.wpn_fps_ass_m14_body_dmr.third_unit = "units/payday2/weapons/wpn_third_ass_m14_pts/wpn_third_ass_m14_body_dmr"
	self.parts.wpn_fps_ass_m14_body_ebr.third_unit = "units/payday2/weapons/wpn_third_ass_m14_pts/wpn_third_ass_m14_body_ebr"
	self.parts.wpn_fps_ass_m14_body_jae.third_unit = "units/payday2/weapons/wpn_third_ass_m14_pts/wpn_third_ass_m14_body_jae"
	self.parts.wpn_fps_ass_m14_body_lower.third_unit = "units/payday2/weapons/wpn_third_ass_m14_pts/wpn_third_ass_m14_body_lower"
	self.parts.wpn_fps_ass_m14_body_upper.third_unit = "units/payday2/weapons/wpn_third_ass_m14_pts/wpn_third_ass_m14_body_upper"
	self.parts.wpn_fps_ass_m14_m_standard.third_unit = "units/payday2/weapons/wpn_third_ass_m14_pts/wpn_third_ass_m14_m_standard"
	self.wpn_fps_ass_m14 = {}
	self.wpn_fps_ass_m14.unit = "units/payday2/weapons/wpn_fps_ass_m14/wpn_fps_ass_m14"
	self.wpn_fps_ass_m14.optional_types = {
		"barrel_ext",
		"gadget",
		"sight"
	}
	self.wpn_fps_ass_m14.default_blueprint = {
		"wpn_fps_ass_m14_b_standard",
		"wpn_fps_ass_m14_body_lower",
		"wpn_fps_ass_m14_body_upper",
		"wpn_fps_ass_m14_body_dmr",
		"wpn_fps_ass_m14_m_standard"
	}
	self.wpn_fps_ass_m14.uses_parts = {
		"wpn_fps_ass_m14_b_standard",
		"wpn_fps_ass_m14_body_dmr",
		"wpn_fps_ass_m14_body_ebr",
		"wpn_fps_ass_m14_body_jae",
		"wpn_fps_ass_m14_body_lower",
		"wpn_fps_ass_m14_body_upper",
		"wpn_fps_ass_m14_m_standard",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_i_singlefire",
		"wpn_fps_upg_i_autofire",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser"
	}
	self.wpn_fps_ass_m14_npc = deep_clone(self.wpn_fps_ass_m14)
	self.wpn_fps_ass_m14_npc.unit = "units/payday2/weapons/wpn_fps_ass_m14/wpn_fps_ass_m14_npc"
end

function WeaponFactoryTweakData_37:_init_mp9()
	self.parts.wpn_fps_smg_mp9_body_mp9 = {
		type = "lower_reciever",
		name_id = "bm_wp_mp9_body_mp9",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_body_mp9",
		stats = {value = 1},
		animations = {reload = "reload"}
	}
	self.parts.wpn_fps_smg_mp9_m_extended = {
		pcs = {
			20,
			30,
			40
		},
		type = "magazine",
		name_id = "bm_wp_mp9_m_extended",
		a_obj = "a_m",
		unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_m_extended",
		stats = {
			value = 4,
			concealment = -2,
			spread_moving = -2,
			extra_ammo = 6
		},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_smg_mp9_m_short = {
		type = "magazine",
		name_id = "bm_wp_mp9_m_short",
		a_obj = "a_m",
		unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_m_short",
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_smg_mp9_s_fold = {
		type = "stock",
		name_id = "bm_wp_mp9_s_fold",
		a_obj = "a_s",
		unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_s_fold",
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_mp9_s_skel = {
		pcs = {
			20,
			30,
			40
		},
		type = "stock",
		name_id = "bm_wp_mp9_s_skel",
		a_obj = "a_s",
		unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_s_skel",
		stats = {
			value = 5,
			recoil = 3,
			spread = 1,
			spread_moving = -3,
			concealment = -3
		}
	}
	self.parts.wpn_fps_smg_mp9_b_dummy = {
		type = "barrel",
		name_id = "bm_wp_mp9_b_dummy",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy",
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_mp9_body_mp9.third_unit = "units/payday2/weapons/wpn_third_smg_mp9_pts/wpn_third_smg_mp9_body_mp9"
	self.parts.wpn_fps_smg_mp9_m_extended.third_unit = "units/payday2/weapons/wpn_third_smg_mp9_pts/wpn_third_smg_mp9_m_extended"
	self.parts.wpn_fps_smg_mp9_m_short.third_unit = "units/payday2/weapons/wpn_third_smg_mp9_pts/wpn_third_smg_mp9_m_short"
	self.parts.wpn_fps_smg_mp9_s_fold.third_unit = "units/payday2/weapons/wpn_third_smg_mp9_pts/wpn_third_smg_mp9_s_fold"
	self.parts.wpn_fps_smg_mp9_s_skel.third_unit = "units/payday2/weapons/wpn_third_smg_mp9_pts/wpn_third_smg_mp9_s_skel"
	self.wpn_fps_smg_mp9 = {}
	self.wpn_fps_smg_mp9.unit = "units/payday2/weapons/wpn_fps_smg_mp9/wpn_fps_smg_mp9"
	self.wpn_fps_smg_mp9.optional_types = {
		"barrel_ext",
		"gadget",
		"sight",
		"vertical_grip"
	}
	self.wpn_fps_smg_mp9.default_blueprint = {
		"wpn_fps_smg_mp9_body_mp9",
		"wpn_fps_smg_mp9_s_fold",
		"wpn_fps_smg_mp9_m_short",
		"wpn_fps_smg_mp9_b_dummy"
	}
	self.wpn_fps_smg_mp9.uses_parts = {
		"wpn_fps_smg_mp9_body_mp9",
		"wpn_fps_smg_mp9_m_short",
		"wpn_fps_smg_mp9_m_extended",
		"wpn_fps_smg_mp9_s_skel",
		"wpn_fps_smg_mp9_s_fold",
		"wpn_fps_smg_mp9_b_dummy",
		"wpn_fps_upg_vg_ass_smg_verticalgrip",
		"wpn_fps_upg_vg_ass_smg_stubby",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_i_singlefire",
		"wpn_fps_upg_i_autofire",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser"
	}
	self.wpn_fps_smg_mp9_npc = deep_clone(self.wpn_fps_smg_mp9)
	self.wpn_fps_smg_mp9_npc.unit = "units/payday2/weapons/wpn_fps_smg_mp9/wpn_fps_smg_mp9_npc"
end

function WeaponFactoryTweakData_37:_init_deagle()
	self.parts.wpn_fps_pis_deagle_body_standard = {
		type = "lower_reciever",
		name_id = "bm_wp_deagle_body_standard",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_pis_deagle_pts/wpn_fps_pis_deagle_body_standard",
		stats = {value = 1},
		animations = {
			fire = "recoil",
			reload = "reload",
			fire_steelsight = "recoil"
		},
		adds = {
			"wpn_fps_pis_deagle_lock"
		}
	}
	self.parts.wpn_fps_pis_deagle_b_long = {
		pc = 40,
		type = "slide",
		name_id = "bm_wp_deagle_b_long",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_pis_deagle_pts/wpn_fps_pis_deagle_b_long",
		stats = {
			value = 7,
			spread_moving = -3,
			spread = 2,
			damage = 2,
			concealment = -3
		},
		forbids = {
			"wpn_fps_pis_deagle_co_long",
			"wpn_fps_pis_deagle_co_short"
		},
		override = {
			wpn_upg_o_marksmansight_front = {a_obj = "a_ol"}
		}
	}
	self.parts.wpn_fps_pis_deagle_b_standard = {
		type = "slide",
		name_id = "bm_wp_deagle_b_standard",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_pis_deagle_pts/wpn_fps_pis_deagle_b_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_deagle_co_long = {
		pc = 40,
		type = "barrel_ext",
		name_id = "bm_wp_deagle_co_long",
		a_obj = "a_co",
		unit = "units/payday2/weapons/wpn_fps_pis_deagle_pts/wpn_fps_pis_deagle_co_long",
		stats = {
			value = 8,
			damage = 2,
			recoil = 2,
			spread_moving = -2,
			concealment = -2
		}
	}
	self.parts.wpn_fps_pis_deagle_co_short = {
		pc = 40,
		type = "barrel_ext",
		name_id = "bm_wp_deagle_co_short",
		a_obj = "a_co",
		unit = "units/payday2/weapons/wpn_fps_pis_deagle_pts/wpn_fps_pis_deagle_co_short",
		stats = {
			value = 6,
			damage = 1,
			recoil = 1,
			spread_moving = -1,
			concealment = -1,
			suppression = -5
		}
	}
	self.parts.wpn_fps_pis_deagle_fg_rail = {
		type = "extra",
		name_id = "bm_wp_deagle_fg_rail",
		a_obj = "a_fg",
		unit = "units/payday2/weapons/wpn_fps_pis_deagle_pts/wpn_fps_pis_deagle_fg_rail",
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_deagle_g_bling = {
		pc = 40,
		type = "grip",
		name_id = "bm_wp_deagle_g_bling",
		a_obj = "a_g",
		unit = "units/payday2/weapons/wpn_fps_pis_deagle_pts/wpn_fps_pis_deagle_g_bling",
		stats = {
			value = 10,
			spread_moving = -2,
			recoil = 2,
			concealment = 1
		}
	}
	self.parts.wpn_fps_pis_deagle_g_ergo = {
		pc = 40,
		type = "grip",
		name_id = "bm_wp_deagle_g_ergo",
		a_obj = "a_g",
		unit = "units/payday2/weapons/wpn_fps_pis_deagle_pts/wpn_fps_pis_deagle_g_ergo",
		stats = {
			value = 6,
			spread_moving = 2,
			recoil = -1,
			spread = 1,
			concealment = -1
		}
	}
	self.parts.wpn_fps_pis_deagle_g_standard = {
		type = "grip",
		name_id = "bm_wp_deagle_g_standard",
		a_obj = "a_g",
		unit = "units/payday2/weapons/wpn_fps_pis_deagle_pts/wpn_fps_pis_deagle_g_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_deagle_m_extended = {
		pc = 40,
		type = "magazine",
		name_id = "bm_wp_deagle_m_extended",
		a_obj = "a_m",
		unit = "units/payday2/weapons/wpn_fps_pis_deagle_pts/wpn_fps_pis_deagle_m_extended",
		stats = {
			value = 7,
			concealment = -2,
			spread_moving = -2,
			extra_ammo = 3
		},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_pis_deagle_m_standard = {
		type = "magazine",
		name_id = "bm_wp_deagle_m_standard",
		a_obj = "a_m",
		unit = "units/payday2/weapons/wpn_fps_pis_deagle_pts/wpn_fps_pis_deagle_m_standard",
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_pis_deagle_o_standard_rear = {
		type = "extra",
		name_id = "bm_wp_deagle_o_standard_rear",
		a_obj = "a_o",
		unit = "units/payday2/weapons/wpn_fps_pis_deagle_pts/wpn_fps_pis_deagle_o_standard_rear",
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_deagle_o_standard_front = {
		type = "extra",
		name_id = "bm_wp_deagle_o_standard_front",
		a_obj = "a_os",
		unit = "units/payday2/weapons/wpn_fps_pis_deagle_pts/wpn_fps_pis_deagle_o_standard_front",
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_deagle_o_standard_front_long = {
		type = "extra",
		name_id = "bm_wp_deagle_o_standard_front_long",
		a_obj = "a_ol",
		unit = "units/payday2/weapons/wpn_fps_pis_deagle_pts/wpn_fps_pis_deagle_o_standard_front_long",
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_deagle_body_standard.third_unit = "units/payday2/weapons/wpn_third_pis_deagle_pts/wpn_third_pis_deagle_body_standard"
	self.parts.wpn_fps_pis_deagle_b_long.third_unit = "units/payday2/weapons/wpn_third_pis_deagle_pts/wpn_third_pis_deagle_b_long"
	self.parts.wpn_fps_pis_deagle_b_standard.third_unit = "units/payday2/weapons/wpn_third_pis_deagle_pts/wpn_third_pis_deagle_b_standard"
	self.parts.wpn_fps_pis_deagle_co_long.third_unit = "units/payday2/weapons/wpn_third_pis_deagle_pts/wpn_third_pis_deagle_co_long"
	self.parts.wpn_fps_pis_deagle_co_short.third_unit = "units/payday2/weapons/wpn_third_pis_deagle_pts/wpn_third_pis_deagle_co_short"
	self.parts.wpn_fps_pis_deagle_fg_rail.third_unit = "units/payday2/weapons/wpn_third_pis_deagle_pts/wpn_third_pis_deagle_fg_rail"
	self.parts.wpn_fps_pis_deagle_g_bling.third_unit = "units/payday2/weapons/wpn_third_pis_deagle_pts/wpn_third_pis_deagle_g_bling"
	self.parts.wpn_fps_pis_deagle_g_ergo.third_unit = "units/payday2/weapons/wpn_third_pis_deagle_pts/wpn_third_pis_deagle_g_ergo"
	self.parts.wpn_fps_pis_deagle_g_standard.third_unit = "units/payday2/weapons/wpn_third_pis_deagle_pts/wpn_third_pis_deagle_g_standard"
	self.parts.wpn_fps_pis_deagle_m_extended.third_unit = "units/payday2/weapons/wpn_third_pis_deagle_pts/wpn_third_pis_deagle_m_extended"
	self.parts.wpn_fps_pis_deagle_m_standard.third_unit = "units/payday2/weapons/wpn_third_pis_deagle_pts/wpn_third_pis_deagle_m_standard"
	self.parts.wpn_fps_pis_deagle_o_standard_rear.third_unit = "units/payday2/weapons/wpn_third_pis_deagle_pts/wpn_third_pis_deagle_o_standard_rear"
	self.parts.wpn_fps_pis_deagle_o_standard_front.third_unit = "units/payday2/weapons/wpn_third_pis_deagle_pts/wpn_third_pis_deagle_o_standard_front"
	self.parts.wpn_fps_pis_deagle_o_standard_front_long.third_unit = "units/payday2/weapons/wpn_third_pis_deagle_pts/wpn_third_pis_deagle_o_standard_front_long"
	self.wpn_fps_pis_deagle = {}
	self.wpn_fps_pis_deagle.unit = "units/payday2/weapons/wpn_fps_pis_deagle/wpn_fps_pis_deagle"
	self.wpn_fps_pis_deagle.animations = {
		fire = "recoil",
		reload = "reload",
		fire_steelsight = "recoil"
	}
	self.wpn_fps_pis_deagle.optional_types = {
		"barrel_ext",
		"gadget",
		"sight"
	}
	self.wpn_fps_pis_deagle.adds = {
		wpn_fps_upg_fl_pis_laser = {
			"wpn_fps_pis_deagle_fg_rail"
		},
		wpn_fps_upg_fl_pis_tlr1 = {
			"wpn_fps_pis_deagle_fg_rail"
		},
		wpn_fps_pis_deagle_b_standard = {
			"wpn_fps_pis_deagle_o_standard_rear",
			"wpn_fps_pis_deagle_o_standard_front"
		},
		wpn_fps_pis_deagle_b_long = {
			"wpn_fps_pis_deagle_o_standard_rear",
			"wpn_fps_pis_deagle_o_standard_front_long"
		},
		wpn_fps_upg_o_specter = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_aimpoint = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_aimpoint_2 = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_docter = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_eotech = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_t1micro = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_cmore = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_acog = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_cs = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_eotech_xps = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_reflex = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_rx01 = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_rx30 = {
			"wpn_fps_pis_rage_o_adapter"
		}
	}
	self.wpn_fps_pis_deagle.override = {
		wpn_upg_o_marksmansight_rear = {
			a_obj = "a_o",
			forbids = {
				"wpn_fps_pis_deagle_o_standard_front",
				"wpn_fps_pis_deagle_o_standard_front_long",
				"wpn_fps_pis_deagle_o_standard_rear"
			}
		},
		wpn_upg_o_marksmansight_front = {a_obj = "a_os"},
		wpn_fps_upg_o_specter = {a_obj = "a_quite"},
		wpn_fps_upg_o_aimpoint = {a_obj = "a_quite"},
		wpn_fps_upg_o_aimpoint_2 = {a_obj = "a_quite"},
		wpn_fps_upg_o_docter = {a_obj = "a_quite"},
		wpn_fps_upg_o_eotech = {a_obj = "a_quite"},
		wpn_fps_upg_o_t1micro = {a_obj = "a_quite"},
		wpn_fps_upg_o_cmore = {a_obj = "a_quite"},
		wpn_fps_upg_o_acog = {a_obj = "a_quite"},
		wpn_fps_upg_o_cs = {a_obj = "a_quite"},
		wpn_fps_upg_o_eotech_xps = {a_obj = "a_quite"},
		wpn_fps_upg_o_reflex = {a_obj = "a_quite"},
		wpn_fps_upg_o_rx01 = {a_obj = "a_quite"},
		wpn_fps_upg_o_rx30 = {a_obj = "a_quite"},
		wpn_fps_upg_o_rmr = {
			parent = "lower_reciever"
		}
	}
	self.wpn_fps_pis_deagle.default_blueprint = {
		"wpn_fps_pis_deagle_body_standard",
		"wpn_fps_pis_deagle_b_standard",
		"wpn_fps_pis_deagle_g_standard",
		"wpn_fps_pis_deagle_m_standard"
	}
	self.wpn_fps_pis_deagle.uses_parts = {
		"wpn_fps_pis_deagle_body_standard",
		"wpn_fps_pis_deagle_b_standard",
		"wpn_fps_pis_deagle_b_long",
		"wpn_fps_pis_deagle_co_long",
		"wpn_fps_pis_deagle_co_short",
		"wpn_fps_pis_deagle_fg_rail",
		"wpn_fps_pis_deagle_g_bling",
		"wpn_fps_pis_deagle_g_ergo",
		"wpn_fps_pis_deagle_g_standard",
		"wpn_fps_pis_deagle_m_extended",
		"wpn_fps_pis_deagle_m_standard",
		"wpn_fps_pis_deagle_o_standard_rear",
		"wpn_fps_pis_deagle_o_standard_front",
		"wpn_fps_pis_deagle_o_standard_front_long",
		"wpn_upg_o_marksmansight_rear",
		"wpn_fps_upg_fl_pis_laser",
		"wpn_fps_upg_fl_pis_tlr1",
		"wpn_fps_upg_ns_pis_large",
		"wpn_fps_upg_ns_pis_medium",
		"wpn_fps_upg_ns_pis_small",
		"wpn_fps_upg_ns_pis_large_kac",
		"wpn_fps_upg_ns_pis_medium_gem",
		"wpn_fps_pis_deagle_extra",
		"wpn_fps_pis_rage_o_adapter",
		"wpn_fps_pis_deagle_lock",
		"wpn_fps_upg_ns_pis_medium_slim",
		"wpn_fps_upg_pis_ns_flash",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_o_rmr"
	}
	self.wpn_fps_pis_deagle_npc = deep_clone(self.wpn_fps_pis_deagle)
	self.wpn_fps_pis_deagle_npc.unit = "units/payday2/weapons/wpn_fps_pis_deagle/wpn_fps_pis_deagle_npc"
	self.wpn_fps_pis_deagle_primary = deep_clone(self.wpn_fps_pis_deagle)
	self.wpn_fps_pis_deagle_primary.unit = "units/payday2/weapons/wpn_fps_pis_deagle/wpn_fps_pis_deagle_primary"
	self.wpn_fps_pis_deagle_primary_npc = deep_clone(self.wpn_fps_pis_deagle_npc)
	self.wpn_fps_pis_deagle_primary_npc.unit = "units/payday2/weapons/wpn_fps_pis_deagle/wpn_fps_pis_deagle_primary_npc"
end

function WeaponFactoryTweakData_37:_init_mp5()
	self.parts.wpn_fps_smg_mp5_b_m5k = {
		type = "barrel",
		name_id = "bm_wp_mp5_b_m5k",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_smg_mp5_pts/wpn_fps_smg_mp5_b_m5k",
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_mp5_b_mp5a4 = {
		type = "barrel",
		name_id = "bm_wp_mp5_b_mp5a4",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_smg_mp5_pts/wpn_fps_smg_mp5_b_mp5a4",
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_mp5_b_mp5a5 = {
		type = "barrel",
		name_id = "bm_wp_mp5_b_mp5a5",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_smg_mp5_pts/wpn_fps_smg_mp5_b_mp5a5",
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_mp5_b_mp5sd = {
		type = "barrel",
		name_id = "bm_wp_mp5_b_mp5sd",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_smg_mp5_pts/wpn_fps_smg_mp5_b_mp5sd",
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_mp5_body_mp5 = {
		type = "lower_reciever",
		name_id = "bm_wp_mp5_body_mp5",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_smg_mp5_pts/wpn_fps_smg_mp5_body_mp5",
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_mp5_body_rail = {
		type = "upper_reciever",
		name_id = "bm_wp_mp5_body_rail",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_smg_mp5_pts/wpn_fps_smg_mp5_body_rail",
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_mp5_fg_mp5a4 = {
		type = "foregrip",
		name_id = "bm_wp_mp5_fg_mp5a4",
		a_obj = "a_fg",
		unit = "units/payday2/weapons/wpn_fps_smg_mp5_pts/wpn_fps_smg_mp5_fg_mp5a4",
		stats = {value = 1},
		adds = {
			"wpn_fps_smg_mp5_b_mp5a5"
		},
		animations = {reload = "reload"}
	}
	self.parts.wpn_fps_smg_mp5_fg_m5k = {
		pcs = {
			20,
			30,
			40
		},
		type = "foregrip",
		name_id = "bm_wp_mp5_fg_m5k",
		a_obj = "a_fg",
		unit = "units/payday2/weapons/wpn_fps_smg_mp5_pts/wpn_fps_smg_mp5_fg_m5k",
		stats = {
			value = 4,
			spread_moving = 3,
			recoil = -3,
			concealment = 3
		},
		adds = {
			"wpn_fps_smg_mp5_b_m5k"
		},
		animations = {reload = "reload"},
		forbids = {
			"wpn_fps_addon_ris"
		}
	}
	self.parts.wpn_fps_smg_mp5_fg_mp5a5 = {
		pcs = {
			20,
			30,
			40
		},
		type = "foregrip",
		name_id = "bm_wp_mp5_fg_mp5a5",
		a_obj = "a_fg",
		unit = "units/payday2/weapons/wpn_fps_smg_mp5_pts/wpn_fps_smg_mp5_fg_mp5a5",
		stats = {
			value = 5,
			spread_moving = -2,
			recoil = 2,
			concealment = -3
		},
		adds = {
			"wpn_fps_smg_mp5_b_mp5a5"
		},
		animations = {reload = "reload"},
		forbids = {
			"wpn_fps_addon_ris"
		}
	}
	self.parts.wpn_fps_smg_mp5_fg_mp5sd = {
		pcs = {
			20,
			30,
			40
		},
		type = "foregrip",
		sub_type = "silencer",
		name_id = "bm_wp_mp5_fg_mp5sd",
		a_obj = "a_fg",
		unit = "units/payday2/weapons/wpn_fps_smg_mp5_pts/wpn_fps_smg_mp5_fg_mp5sd",
		stats = {
			value = 10,
			spread_moving = 1,
			suppression = 12,
			alert_size = 12,
			damage = -4,
			recoil = 3,
			concealment = 1
		},
		perks = {"silencer"},
		sound_switch = {
			suppressed = "suppressed_c"
		},
		adds = {
			"wpn_fps_smg_mp5_b_mp5sd"
		},
		forbids = {
			"wpn_fps_upg_ns_ass_smg_large",
			"wpn_fps_upg_ns_ass_smg_medium",
			"wpn_fps_upg_ns_ass_smg_small",
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_ass_ns_surefire"
		},
		animations = {reload = "reload"}
	}
	self.parts.wpn_fps_smg_mp5_m_drum = {
		type = "magazine",
		name_id = "bm_wp_mp5_m_drum",
		a_obj = "a_m",
		unit = "units/payday2/weapons/wpn_fps_smg_mp5_pts/wpn_fps_smg_mp5_m_drum",
		stats = {value = 5},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_smg_mp5_m_std = {
		type = "magazine",
		name_id = "bm_wp_mp5_m_std",
		a_obj = "a_m",
		unit = "units/payday2/weapons/wpn_fps_smg_mp5_pts/wpn_fps_smg_mp5_m_std",
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_smg_mp5_s_adjust = {
		pcs = {
			20,
			30,
			40
		},
		type = "stock",
		name_id = "bm_wp_mp5_s_adjust",
		a_obj = "a_s",
		unit = "units/payday2/weapons/wpn_fps_smg_mp5_pts/wpn_fps_smg_mp5_s_adjust",
		stats = {
			value = 3,
			spread_moving = 1,
			concealment = 3
		}
	}
	self.parts.wpn_fps_smg_mp5_s_ring = {
		pcs = {
			20,
			30,
			40
		},
		type = "stock",
		name_id = "bm_wp_mp5_s_ring",
		a_obj = "a_s",
		unit = "units/payday2/weapons/wpn_fps_smg_mp5_pts/wpn_fps_smg_mp5_s_ring",
		stats = {
			value = 3,
			spread_moving = 4,
			recoil = -3,
			concealment = 5
		}
	}
	self.parts.wpn_fps_smg_mp5_s_solid = {
		type = "stock",
		name_id = "bm_wp_mp5_s_solid",
		a_obj = "a_s",
		unit = "units/payday2/weapons/wpn_fps_smg_mp5_pts/wpn_fps_smg_mp5_s_solid",
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_mp5_body_mp5.third_unit = "units/payday2/weapons/wpn_third_smg_mp5_pts/wpn_third_smg_mp5_body_mp5"
	self.parts.wpn_fps_smg_mp5_body_rail.third_unit = "units/payday2/weapons/wpn_third_smg_mp5_pts/wpn_third_smg_mp5_body_rail"
	self.parts.wpn_fps_smg_mp5_fg_m5k.third_unit = "units/payday2/weapons/wpn_third_smg_mp5_pts/wpn_third_smg_mp5_fg_mp5k"
	self.parts.wpn_fps_smg_mp5_fg_mp5a4.third_unit = "units/payday2/weapons/wpn_third_smg_mp5_pts/wpn_third_smg_mp5_fg_mp5a4"
	self.parts.wpn_fps_smg_mp5_fg_mp5a5.third_unit = "units/payday2/weapons/wpn_third_smg_mp5_pts/wpn_third_smg_mp5_fg_mp5a5"
	self.parts.wpn_fps_smg_mp5_fg_mp5sd.third_unit = "units/payday2/weapons/wpn_third_smg_mp5_pts/wpn_third_smg_mp5_fg_mp5sd"
	self.parts.wpn_fps_smg_mp5_m_drum.third_unit = "units/payday2/weapons/wpn_third_smg_mp5_pts/wpn_third_smg_mp5_m_drum"
	self.parts.wpn_fps_smg_mp5_m_std.third_unit = "units/payday2/weapons/wpn_third_smg_mp5_pts/wpn_third_smg_mp5_m_std"
	self.parts.wpn_fps_smg_mp5_s_adjust.third_unit = "units/payday2/weapons/wpn_third_smg_mp5_pts/wpn_third_smg_mp5_s_adjust"
	self.parts.wpn_fps_smg_mp5_s_ring.third_unit = "units/payday2/weapons/wpn_third_smg_mp5_pts/wpn_third_smg_mp5_s_ring"
	self.parts.wpn_fps_smg_mp5_s_solid.third_unit = "units/payday2/weapons/wpn_third_smg_mp5_pts/wpn_third_smg_mp5_s_solid"
	self.wpn_fps_smg_mp5 = {}
	self.wpn_fps_smg_mp5.unit = "units/payday2/weapons/wpn_fps_smg_mp5/wpn_fps_smg_mp5"
	self.wpn_fps_smg_mp5.optional_types = {
		"barrel_ext",
		"gadget",
		"sight",
		"vertical_grip"
	}
	self.wpn_fps_smg_mp5.adds = {
		wpn_fps_upg_o_specter = {
			"wpn_fps_smg_mp5_body_rail"
		},
		wpn_fps_upg_o_aimpoint = {
			"wpn_fps_smg_mp5_body_rail"
		},
		wpn_fps_upg_o_aimpoint_2 = {
			"wpn_fps_smg_mp5_body_rail"
		},
		wpn_fps_upg_o_docter = {
			"wpn_fps_smg_mp5_body_rail"
		},
		wpn_fps_upg_o_eotech = {
			"wpn_fps_smg_mp5_body_rail"
		},
		wpn_fps_upg_o_t1micro = {
			"wpn_fps_smg_mp5_body_rail"
		},
		wpn_fps_upg_o_cmore = {
			"wpn_fps_smg_mp5_body_rail"
		},
		wpn_fps_upg_o_acog = {
			"wpn_fps_smg_mp5_body_rail"
		},
		wpn_fps_upg_o_cs = {
			"wpn_fps_smg_mp5_body_rail"
		},
		wpn_fps_upg_o_eotech_xps = {
			"wpn_fps_smg_mp5_body_rail"
		},
		wpn_fps_upg_o_reflex = {
			"wpn_fps_smg_mp5_body_rail"
		},
		wpn_fps_upg_o_rx01 = {
			"wpn_fps_smg_mp5_body_rail"
		},
		wpn_fps_upg_o_rx30 = {
			"wpn_fps_smg_mp5_body_rail"
		}
	}
	self.wpn_fps_smg_mp5.default_blueprint = {
		"wpn_fps_smg_mp5_body_mp5",
		"wpn_fps_smg_mp5_fg_mp5a4",
		"wpn_fps_smg_mp5_m_std",
		"wpn_fps_smg_mp5_s_solid"
	}
	self.wpn_fps_smg_mp5.uses_parts = {
		"wpn_fps_smg_mp5_body_mp5",
		"wpn_fps_smg_mp5_fg_m5k",
		"wpn_fps_smg_mp5_fg_mp5a4",
		"wpn_fps_smg_mp5_fg_mp5a5",
		"wpn_fps_smg_mp5_fg_mp5sd",
		"wpn_fps_smg_mp5_m_std",
		"wpn_fps_smg_mp5_m_drum",
		"wpn_fps_smg_mp5_s_ring",
		"wpn_fps_smg_mp5_s_adjust",
		"wpn_fps_smg_mp5_s_solid",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_vg_ass_smg_verticalgrip",
		"wpn_fps_upg_vg_ass_smg_stubby",
		"wpn_fps_upg_vg_ass_smg_afg",
		"wpn_fps_upg_i_singlefire",
		"wpn_fps_upg_i_autofire",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser"
	}
	self.wpn_fps_smg_mp5_npc = deep_clone(self.wpn_fps_smg_mp5)
	self.wpn_fps_smg_mp5_npc.unit = "units/payday2/weapons/wpn_fps_smg_mp5/wpn_fps_smg_mp5_npc"
end

function WeaponFactoryTweakData_37:_init_colt_1911()
	self.parts.wpn_fps_pis_1911_b_long = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "slide",
		name_id = "bm_wp_1911_b_long",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_pis_1911_pts/wpn_fps_pis_1911_b_long",
		stats = {
			value = 2,
			damage = 1,
			spread_moving = -2,
			spread = 2,
			recoil = 2,
			concealment = -2
		},
		adds = {
			"wpn_fps_pis_1911_o_long"
		},
		override = {
			wpn_upg_o_marksmansight_front = {a_obj = "a_ol"}
		},
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	}
	self.parts.wpn_fps_pis_1911_b_standard = {
		type = "slide",
		name_id = "bm_wp_1911_b_standard",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_pis_1911_pts/wpn_fps_pis_1911_b_standard",
		stats = {value = 1},
		adds = {
			"wpn_fps_pis_1911_o_standard"
		},
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	}
	self.parts.wpn_fps_pis_1911_b_vented = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "slide",
		name_id = "bm_wp_1911_b_vented",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_pis_1911_pts/wpn_fps_pis_1911_b_vented",
		stats = {
			value = 1,
			damage = 1,
			recoil = 2,
			spread_moving = 2,
			spread = -1,
			suppression = -2
		},
		adds = {
			"wpn_fps_pis_1911_o_standard"
		},
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	}
	self.parts.wpn_fps_pis_1911_body_standard = {
		type = "lower_reciever",
		name_id = "bm_wp_1911_body_standard",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_pis_1911_pts/wpn_fps_pis_1911_body_standard",
		stats = {value = 1},
		animations = {fire = "recoil", fire_steelsight = "recoil"}
	}
	self.parts.wpn_fps_pis_1911_co_1 = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel_ext",
		name_id = "bm_wp_1911_co_1",
		a_obj = "a_co",
		parent = "slide",
		unit = "units/payday2/weapons/wpn_fps_pis_1911_pts/wpn_fps_pis_1911_co_1",
		stats = {
			value = 5,
			damage = 1,
			suppression = -5,
			spread_moving = -1,
			recoil = 1,
			concealment = -1
		}
	}
	self.parts.wpn_fps_pis_1911_co_2 = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel_ext",
		name_id = "bm_wp_1911_co_2",
		a_obj = "a_co",
		parent = "slide",
		unit = "units/payday2/weapons/wpn_fps_pis_1911_pts/wpn_fps_pis_1911_co_2",
		stats = {
			value = 2,
			damage = 2,
			suppression = -1,
			spread_moving = 1,
			recoil = 2,
			concealment = -1
		}
	}
	self.parts.wpn_fps_pis_1911_g_bling = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "grip",
		name_id = "bm_wp_1911_g_bling",
		a_obj = "a_g",
		unit = "units/payday2/weapons/wpn_fps_pis_1911_pts/wpn_fps_pis_1911_g_bling",
		stats = {
			value = 10,
			spread = 1,
			recoil = -1
		}
	}
	self.parts.wpn_fps_pis_1911_g_ergo = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "grip",
		name_id = "bm_wp_1911_g_ergo",
		a_obj = "a_g",
		unit = "units/payday2/weapons/wpn_fps_pis_1911_pts/wpn_fps_pis_1911_g_ergo",
		stats = {
			value = 2,
			spread_moving = 1,
			recoil = 1
		}
	}
	self.parts.wpn_fps_pis_1911_g_standard = {
		type = "grip",
		name_id = "bm_wp_1911_g_standard",
		a_obj = "a_g",
		unit = "units/payday2/weapons/wpn_fps_pis_1911_pts/wpn_fps_pis_1911_g_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_1911_m_extended = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "magazine",
		name_id = "bm_wp_1911_m_extended",
		a_obj = "a_m",
		unit = "units/payday2/weapons/wpn_fps_pis_1911_pts/wpn_fps_pis_1911_m_extended",
		stats = {
			value = 3,
			spread_moving = -2,
			concealment = -1,
			extra_ammo = 3
		},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_pis_1911_m_standard = {
		type = "magazine",
		name_id = "bm_wp_1911_m_standard",
		a_obj = "a_m",
		unit = "units/payday2/weapons/wpn_fps_pis_1911_pts/wpn_fps_pis_1911_m_standard",
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_pis_1911_o_long = {
		type = "extra",
		name_id = "bm_wp_1911_o_long",
		a_obj = "a_o",
		unit = "units/payday2/weapons/wpn_fps_pis_1911_pts/wpn_fps_pis_1911_o_long",
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_1911_o_standard = {
		type = "extra",
		name_id = "bm_wp_1911_o_standard",
		a_obj = "a_o",
		unit = "units/payday2/weapons/wpn_fps_pis_1911_pts/wpn_fps_pis_1911_o_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_1911_b_long.third_unit = "units/payday2/weapons/wpn_third_pis_1911_pts/wpn_third_pis_1911_b_long"
	self.parts.wpn_fps_pis_1911_b_standard.third_unit = "units/payday2/weapons/wpn_third_pis_1911_pts/wpn_third_pis_1911_b_standard"
	self.parts.wpn_fps_pis_1911_b_vented.third_unit = "units/payday2/weapons/wpn_third_pis_1911_pts/wpn_third_pis_1911_b_vented"
	self.parts.wpn_fps_pis_1911_body_standard.third_unit = "units/payday2/weapons/wpn_third_pis_1911_pts/wpn_third_pis_1911_body_standard"
	self.parts.wpn_fps_pis_1911_co_1.third_unit = "units/payday2/weapons/wpn_third_pis_1911_pts/wpn_third_pis_1911_co_1"
	self.parts.wpn_fps_pis_1911_co_2.third_unit = "units/payday2/weapons/wpn_third_pis_1911_pts/wpn_third_pis_1911_co_2"
	self.parts.wpn_fps_pis_1911_g_bling.third_unit = "units/payday2/weapons/wpn_third_pis_1911_pts/wpn_third_pis_1911_g_bling"
	self.parts.wpn_fps_pis_1911_g_ergo.third_unit = "units/payday2/weapons/wpn_third_pis_1911_pts/wpn_third_pis_1911_g_ergo"
	self.parts.wpn_fps_pis_1911_g_standard.third_unit = "units/payday2/weapons/wpn_third_pis_1911_pts/wpn_third_pis_1911_g_standard"
	self.parts.wpn_fps_pis_1911_m_extended.third_unit = "units/payday2/weapons/wpn_third_pis_1911_pts/wpn_third_pis_1911_m_extended"
	self.parts.wpn_fps_pis_1911_m_standard.third_unit = "units/payday2/weapons/wpn_third_pis_1911_pts/wpn_third_pis_1911_m_standard"
	self.parts.wpn_fps_pis_1911_o_long.third_unit = "units/payday2/weapons/wpn_third_pis_1911_pts/wpn_third_pis_1911_o_long"
	self.parts.wpn_fps_pis_1911_o_standard.third_unit = "units/payday2/weapons/wpn_third_pis_1911_pts/wpn_third_pis_1911_o_standard"
	self.wpn_fps_pis_1911 = {}
	self.wpn_fps_pis_1911.unit = "units/payday2/weapons/wpn_fps_pis_1911/wpn_fps_pis_1911"
	self.wpn_fps_pis_1911.optional_types = {
		"barrel_ext",
		"gadget",
		"sight"
	}
	self.wpn_fps_pis_1911.animations = {fire = "recoil", reload = "reload"}
	self.wpn_fps_pis_1911.override = {
		wpn_upg_o_marksmansight_rear = {
			a_obj = "a_o",
			forbids = {
				"wpn_fps_pis_1911_o_long",
				"wpn_fps_pis_1911_o_standard"
			}
		},
		wpn_upg_o_marksmansight_front = {a_obj = "a_os"},
		wpn_fps_upg_o_rmr = {parent = "slide"}
	}
	self.wpn_fps_pis_1911.default_blueprint = {
		"wpn_fps_pis_1911_body_standard",
		"wpn_fps_pis_1911_b_standard",
		"wpn_fps_pis_1911_g_standard",
		"wpn_fps_pis_1911_m_standard"
	}
	self.wpn_fps_pis_1911.uses_parts = {
		"wpn_fps_pis_1911_body_standard",
		"wpn_fps_pis_1911_co_1",
		"wpn_fps_pis_1911_co_2",
		"wpn_fps_pis_1911_g_standard",
		"wpn_fps_pis_1911_g_bling",
		"wpn_fps_pis_1911_g_ergo",
		"wpn_fps_pis_1911_b_standard",
		"wpn_fps_pis_1911_b_long",
		"wpn_fps_pis_1911_b_vented",
		"wpn_fps_pis_1911_m_standard",
		"wpn_fps_pis_1911_m_extended",
		"wpn_fps_pis_1911_o_standard",
		"wpn_fps_pis_1911_o_long",
		"wpn_upg_o_marksmansight_rear",
		"wpn_fps_upg_fl_pis_laser",
		"wpn_fps_upg_fl_pis_tlr1",
		"wpn_fps_upg_ns_pis_large",
		"wpn_fps_upg_ns_pis_medium",
		"wpn_fps_upg_ns_pis_small",
		"wpn_fps_upg_ns_pis_large_kac",
		"wpn_fps_upg_ns_pis_medium_gem",
		"wpn_fps_upg_o_rmr",
		"wpn_fps_upg_ns_pis_medium_slim",
		"wpn_fps_upg_pis_ns_flash"
	}
	self.wpn_fps_pis_1911_npc = deep_clone(self.wpn_fps_pis_1911)
	self.wpn_fps_pis_1911_npc.unit = "units/payday2/weapons/wpn_fps_pis_1911/wpn_fps_pis_1911_npc"
	self.wpn_fps_pis_1911_primary = deep_clone(self.wpn_fps_pis_1911)
	self.wpn_fps_pis_1911_primary.unit = "units/payday2/weapons/wpn_fps_pis_1911/wpn_fps_pis_1911_primary"
	self.wpn_fps_pis_1911_primary_npc = deep_clone(self.wpn_fps_pis_1911_npc)
	self.wpn_fps_pis_1911_primary_npc.unit = "units/payday2/weapons/wpn_fps_pis_1911/wpn_fps_pis_1911_primary_npc"
end

function WeaponFactoryTweakData_37:_init_mac10()
	self.parts.wpn_fps_smg_mac10_b_dummy = {
		type = "barrel",
		name_id = "bm_wp_mac10_b_dummy",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_smg_mac10_pts/wpn_fps_smg_mac10_b_dummy",
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_mac10_body_mac10 = {
		type = "lower_reciever",
		name_id = "bm_wp_mac10_body_mac10",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_smg_mac10_pts/wpn_fps_smg_mac10_body_mac10",
		stats = {value = 1},
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	}
	self.parts.wpn_fps_smg_mac10_body_ris = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "extra",
		name_id = "bm_wp_mac10_body_ris",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_smg_mac10_pts/wpn_fps_smg_mac10_body_ris",
		stats = {
			value = 5,
			recoil = 2,
			spread_moving = -2,
			concealment = -2
		},
		adds = {
			"wpn_upg_o_marksmansight_rear_vanilla"
		},
		stance_mod = {
			wpn_fps_smg_mac10 = {
				translation = Vector3(0, 0, -1),
				rotation = Rotation(0, -0.899, 0)
			}
		},
		forbids = {
			"wpn_fps_addon_ris",
			"wpn_fps_smg_mac10_body_ris_special"
		},
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	}
	self.parts.wpn_fps_smg_mac10_body_ris_special = {
		type = "extra",
		name_id = "bm_wp_mac10_body_ris_special",
		a_obj = "a_o",
		unit = "units/payday2/weapons/wpn_fps_smg_mac10_pts/wpn_fps_smg_mac10_body_ris_special",
		stats = {value = 1},
		stance_mod = {
			wpn_fps_smg_mac10 = {
				translation = Vector3(0, 0, -1),
				rotation = Rotation(0, -0.899, 0)
			}
		}
	}
	self.parts.wpn_fps_smg_mac10_m_extended = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "magazine",
		name_id = "bm_wp_mac10_m_extended",
		a_obj = "a_m",
		unit = "units/payday2/weapons/wpn_fps_smg_mac10_pts/wpn_fps_smg_mac10_m_extended",
		stats = {
			value = 2,
			spread_moving = -2,
			recoil = 1,
			concealment = -2,
			extra_ammo = 4
		},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_smg_mac10_m_short = {
		type = "magazine",
		name_id = "bm_wp_mac10_m_short",
		a_obj = "a_m",
		unit = "units/payday2/weapons/wpn_fps_smg_mac10_pts/wpn_fps_smg_mac10_m_short",
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_smg_mac10_ris_dummy = {
		type = "lower_reciever",
		name_id = "bm_wp_mac10_ris_dummy",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_smg_mac10_pts/wpn_fps_smg_mac10_ris_dummy",
		stats = {value = 1},
		adds = {
			"wpn_fps_smg_mac10_body_mac10",
			"wpn_fps_smg_mac10_body_ris"
		}
	}
	self.parts.wpn_fps_smg_mac10_s_fold = {
		type = "stock",
		name_id = "bm_wp_mac10_s_fold",
		a_obj = "a_s",
		unit = "units/payday2/weapons/wpn_fps_smg_mac10_pts/wpn_fps_smg_mac10_s_fold",
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_mac10_s_skel = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "stock",
		name_id = "bm_wp_mac10_s_skel",
		a_obj = "a_s",
		unit = "units/payday2/weapons/wpn_fps_smg_mac10_pts/wpn_fps_smg_mac10_s_skel",
		stats = {
			value = 1,
			spread_moving = -3,
			recoil = 3,
			spread = 1,
			concealment = -2
		}
	}
	self.parts.wpn_fps_smg_mac10_body_mac10.third_unit = "units/payday2/weapons/wpn_third_smg_mac10_pts/wpn_third_smg_mac10_body_mac10"
	self.parts.wpn_fps_smg_mac10_body_ris.third_unit = "units/payday2/weapons/wpn_third_smg_mac10_pts/wpn_third_smg_mac10_body_ris"
	self.parts.wpn_fps_smg_mac10_body_ris_special.third_unit = "units/payday2/weapons/wpn_third_smg_mac10_pts/wpn_third_smg_mac10_body_ris_special"
	self.parts.wpn_fps_smg_mac10_m_extended.third_unit = "units/payday2/weapons/wpn_third_smg_mac10_pts/wpn_third_smg_mac10_m_extended"
	self.parts.wpn_fps_smg_mac10_m_short.third_unit = "units/payday2/weapons/wpn_third_smg_mac10_pts/wpn_third_smg_mac10_m_short"
	self.parts.wpn_fps_smg_mac10_s_fold.third_unit = "units/payday2/weapons/wpn_third_smg_mac10_pts/wpn_third_smg_mac10_s_fold"
	self.parts.wpn_fps_smg_mac10_s_skel.third_unit = "units/payday2/weapons/wpn_third_smg_mac10_pts/wpn_third_smg_mac10_s_skel"
	self.wpn_fps_smg_mac10 = {}
	self.wpn_fps_smg_mac10.unit = "units/payday2/weapons/wpn_fps_smg_mac10/wpn_fps_smg_mac10"
	self.wpn_fps_smg_mac10.optional_types = {"barrel_ext", "gadget"}
	self.wpn_fps_smg_mac10.override = {
		wpn_upg_o_marksmansight_rear_vanilla = {a_obj = "a_or"},
		wpn_upg_o_marksmansight_front_vanilla = {a_obj = "a_of"}
	}
	self.wpn_fps_smg_mac10.adds = {
		wpn_fps_upg_o_specter = {
			"wpn_fps_smg_mac10_body_ris_special"
		},
		wpn_fps_upg_o_aimpoint = {
			"wpn_fps_smg_mac10_body_ris_special"
		},
		wpn_fps_upg_o_aimpoint_2 = {
			"wpn_fps_smg_mac10_body_ris_special"
		},
		wpn_fps_upg_o_docter = {
			"wpn_fps_smg_mac10_body_ris_special"
		},
		wpn_fps_upg_o_eotech = {
			"wpn_fps_smg_mac10_body_ris_special"
		},
		wpn_fps_upg_o_t1micro = {
			"wpn_fps_smg_mac10_body_ris_special"
		},
		wpn_fps_upg_o_cmore = {
			"wpn_fps_smg_mac10_body_ris_special"
		},
		wpn_fps_upg_o_acog = {
			"wpn_fps_smg_mac10_body_ris_special"
		},
		wpn_fps_upg_o_cs = {
			"wpn_fps_smg_mac10_body_ris_special"
		},
		wpn_fps_upg_o_eotech_xps = {
			"wpn_fps_smg_mac10_body_ris_special"
		},
		wpn_fps_upg_o_reflex = {
			"wpn_fps_smg_mac10_body_ris_special"
		},
		wpn_fps_upg_o_rx01 = {
			"wpn_fps_smg_mac10_body_ris_special"
		},
		wpn_fps_upg_o_rx30 = {
			"wpn_fps_smg_mac10_body_ris_special"
		}
	}
	self.wpn_fps_smg_mac10.default_blueprint = {
		"wpn_fps_smg_mac10_body_mac10",
		"wpn_fps_smg_mac10_b_dummy",
		"wpn_fps_smg_mac10_m_short",
		"wpn_fps_smg_mac10_s_fold"
	}
	self.wpn_fps_smg_mac10.uses_parts = {
		"wpn_fps_smg_mac10_b_dummy",
		"wpn_fps_smg_mac10_body_ris",
		"wpn_fps_smg_mac10_ris_dummy",
		"wpn_fps_smg_mac10_m_extended",
		"wpn_fps_smg_mac10_m_short",
		"wpn_fps_smg_mac10_body_mac10",
		"wpn_fps_smg_mac10_s_fold",
		"wpn_fps_smg_mac10_s_skel",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_upg_o_marksmansight_rear_vanilla",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_vg_ass_smg_verticalgrip",
		"wpn_fps_upg_vg_ass_smg_stubby",
		"wpn_fps_upg_vg_ass_smg_afg",
		"wpn_fps_upg_i_singlefire",
		"wpn_fps_upg_i_autofire",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser"
	}
	self.wpn_fps_smg_mac10_npc = deep_clone(self.wpn_fps_smg_mac10)
	self.wpn_fps_smg_mac10_npc.unit = "units/payday2/weapons/wpn_fps_smg_mac10/wpn_fps_smg_mac10_npc"
end

function WeaponFactoryTweakData_37:_init_r870()
	self.parts.wpn_fps_shot_r870_b_long = {
		type = "barrel",
		name_id = "bm_wp_r870_b_long",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_shot_r870_pts/wpn_fps_shot_r870_b_long",
		stats = {value = 1}
	}
	self.parts.wpn_fps_shot_r870_body_rack = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "upper_reciever",
		name_id = "bm_wp_r870_body_rack",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_shot_r870_pts/wpn_fps_shot_r870_body_rack",
		stats = {
			value = 3,
			spread_moving = -1,
			concealment = -2,
			extra_ammo = 1
		}
	}
	self.parts.wpn_fps_shot_r870_body_standard = {
		type = "lower_reciever",
		name_id = "bm_wp_r870_body_standard",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_shot_r870_pts/wpn_fps_shot_r870_body_standard",
		stats = {value = 1},
		animations = {reload = "reload"}
	}
	self.parts.wpn_fps_shot_r870_fg_big = {
		type = "foregrip",
		name_id = "bm_wp_r870_fg_big",
		a_obj = "a_fg",
		unit = "units/payday2/weapons/wpn_fps_shot_r870_pts/wpn_fps_shot_r870_fg_big",
		stats = {value = 1},
		animations = {
			reload_exit = "reload_exit",
			fire = "recoil",
			fire_steelsight = "recoil_zoom"
		}
	}
	self.parts.wpn_fps_shot_r870_fg_railed = {
		type = "foregrip",
		name_id = "bm_wp_r870_fg_railed",
		a_obj = "a_fg",
		unit = "units/payday2/weapons/wpn_fps_shot_r870_pts/wpn_fps_shot_r870_fg_railed",
		stats = {value = 1, spread_moving = 2},
		animations = {
			reload_exit = "reload_exit",
			fire = "recoil",
			fire_steelsight = "recoil_zoom"
		}
	}
	self.parts.wpn_fps_shot_r870_fg_small = {
		type = "foregrip",
		name_id = "bm_wp_r870_fg_small",
		a_obj = "a_fg",
		unit = "units/payday2/weapons/wpn_fps_shot_r870_pts/wpn_fps_shot_r870_fg_small",
		stats = {value = 1},
		animations = {
			reload_exit = "reload_exit",
			fire = "recoil",
			fire_steelsight = "recoil_zoom"
		}
	}
	self.parts.wpn_fps_shot_r870_fg_wood = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "foregrip",
		name_id = "bm_wp_r870_fg_wood",
		a_obj = "a_fg",
		unit = "units/payday2/weapons/wpn_fps_shot_r870_pts/wpn_fps_shot_r870_fg_wood",
		stats = {
			value = 2,
			recoil = 1,
			spread_moving = 0
		},
		animations = {
			reload_exit = "reload_exit",
			fire = "recoil",
			fire_steelsight = "recoil_zoom"
		}
	}
	self.parts.wpn_fps_shot_r870_m_extended = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "magazine",
		name_id = "bm_wp_r870_m_extended",
		a_obj = "a_m",
		unit = "units/payday2/weapons/wpn_fps_shot_r870_pts/wpn_fps_shot_r870_m_extended",
		stats = {
			value = 6,
			concealment = -1,
			spread_moving = -1,
			extra_ammo = 1
		}
	}
	self.parts.wpn_fps_shot_r870_s_folding = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "stock",
		name_id = "bm_wp_r870_s_folding",
		a_obj = "a_s",
		unit = "units/payday2/weapons/wpn_fps_shot_r870_pts/wpn_fps_shot_r870_s_folding",
		stats = {
			value = 9,
			spread_moving = 1,
			recoil = -1,
			concealment = 1
		},
		forbids = {
			"wpn_fps_shot_r870_ris_special",
			"wpn_fps_upg_o_specter",
			"wpn_fps_upg_o_aimpoint",
			"wpn_fps_upg_o_docter",
			"wpn_fps_upg_o_eotech",
			"wpn_fps_upg_o_t1micro",
			"wpn_fps_upg_o_rx30",
			"wpn_fps_upg_o_rx01",
			"wpn_fps_upg_o_reflex",
			"wpn_fps_upg_o_eotech_xps",
			"wpn_fps_upg_o_cmore",
			"wpn_fps_upg_o_aimpoint_2",
			"wpn_fps_upg_o_acog",
			"wpn_fps_upg_o_cs"
		}
	}
	self.parts.wpn_fps_shot_r870_s_m4 = {
		type = "stock_adapter",
		name_id = "bm_wp_r870_s_m4",
		a_obj = "a_s",
		unit = "units/payday2/weapons/wpn_fps_shot_r870_pts/wpn_fps_shot_r870_s_m4",
		stats = {value = 3},
		forbids = {
			"wpn_fps_shot_r870_ris_special"
		}
	}
	self.parts.wpn_fps_shot_r870_s_solid = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "stock",
		name_id = "bm_wp_r870_s_solid",
		a_obj = "a_s",
		unit = "units/payday2/weapons/wpn_fps_shot_r870_pts/wpn_fps_shot_r870_s_solid",
		stats = {
			value = 2,
			spread_moving = -2,
			recoil = 1,
			concealment = -1
		}
	}
	self.parts.wpn_fps_shot_r870_s_nostock_big = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "stock",
		name_id = "bm_wp_r870_s_nostock_big",
		a_obj = "a_s",
		unit = "units/payday2/weapons/wpn_fps_shot_r870_pts/wpn_fps_shot_r870_s_nostock_big",
		stats = {
			value = 4,
			spread_moving = 1,
			recoil = -3,
			concealment = 1
		},
		forbids = {
			"wpn_fps_shot_r870_ris_special"
		}
	}
	self.parts.wpn_fps_shot_r870_s_nostock_single = {
		type = "stock",
		name_id = "bm_wp_r870_s_nostock_single",
		a_obj = "a_s",
		unit = "units/payday2/weapons/wpn_fps_shot_r870_pts/wpn_fps_shot_r870_s_nostock_single",
		stats = {
			value = 3,
			spread_moving = 2,
			recoil = -3,
			concealment = 2
		},
		forbids = {
			"wpn_fps_shot_r870_ris_special"
		}
	}
	self.parts.wpn_fps_shot_r870_s_nostock = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "stock",
		name_id = "bm_wp_r870_s_nostock",
		a_obj = "a_s",
		unit = "units/payday2/weapons/wpn_fps_shot_r870_pts/wpn_fps_shot_r870_s_nostock",
		stats = {
			value = 2,
			spread_moving = 1,
			recoil = -3,
			concealment = 3
		}
	}
	self.parts.wpn_fps_shot_r870_s_solid_big = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "stock",
		name_id = "bm_wp_r870_s_solid_big",
		a_obj = "a_s",
		unit = "units/payday2/weapons/wpn_fps_shot_r870_pts/wpn_fps_shot_r870_s_solid_big",
		stats = {
			value = 4,
			spread_moving = -2,
			recoil = 2,
			concealment = -2
		},
		forbids = {
			"wpn_fps_shot_r870_ris_special"
		}
	}
	self.parts.wpn_fps_shot_r870_s_solid_single = {
		type = "stock",
		name_id = "bm_wp_r870_s_solid_single",
		a_obj = "a_s",
		unit = "units/payday2/weapons/wpn_fps_shot_r870_pts/wpn_fps_shot_r870_s_solid_single",
		stats = {
			value = 3,
			spread_moving = -1,
			recoil = 1,
			concealment = -1
		},
		forbids = {
			"wpn_fps_shot_r870_ris_special"
		}
	}
	self.parts.wpn_fps_shot_r870_gadget_rail = {
		type = "extra",
		name_id = "bm_wp_r870_s_solid_single",
		a_obj = "a_fl",
		unit = "units/payday2/weapons/wpn_fps_shot_r870_pts/wpn_fps_shot_r870_gadget_rail",
		forbids = {
			"wpn_fps_addon_ris"
		}
	}
	self.parts.wpn_fps_shot_r870_ris_special = {
		type = "extra",
		name_id = "bm_wp_r870_s_solid_single",
		a_obj = "a_o",
		unit = "units/payday2/weapons/wpn_fps_shot_r870_pts/wpn_fps_shot_r870_ris_special"
	}
	self.parts.wpn_fps_shot_r870_b_long.third_unit = "units/payday2/weapons/wpn_third_shot_r870_pts/wpn_third_shot_r870_b_long"
	self.parts.wpn_fps_shot_r870_body_rack.third_unit = "units/payday2/weapons/wpn_third_shot_r870_pts/wpn_third_shot_r870_body_rack"
	self.parts.wpn_fps_shot_r870_body_standard.third_unit = "units/payday2/weapons/wpn_third_shot_r870_pts/wpn_third_shot_r870_body_standard"
	self.parts.wpn_fps_shot_r870_fg_big.third_unit = "units/payday2/weapons/wpn_third_shot_r870_pts/wpn_third_shot_r870_fg_big"
	self.parts.wpn_fps_shot_r870_fg_railed.third_unit = "units/payday2/weapons/wpn_third_shot_r870_pts/wpn_third_shot_r870_fg_railed"
	self.parts.wpn_fps_shot_r870_fg_small.third_unit = "units/payday2/weapons/wpn_third_shot_r870_pts/wpn_third_shot_r870_fg_small"
	self.parts.wpn_fps_shot_r870_fg_wood.third_unit = "units/payday2/weapons/wpn_third_shot_r870_pts/wpn_third_shot_r870_fg_wood"
	self.parts.wpn_fps_shot_r870_m_extended.third_unit = "units/payday2/weapons/wpn_third_shot_r870_pts/wpn_third_shot_r870_m_extended"
	self.parts.wpn_fps_shot_r870_s_folding.third_unit = "units/payday2/weapons/wpn_third_shot_r870_pts/wpn_third_shot_r870_s_folding"
	self.parts.wpn_fps_shot_r870_s_m4.third_unit = "units/payday2/weapons/wpn_third_shot_r870_pts/wpn_third_shot_r870_s_m4"
	self.parts.wpn_fps_shot_r870_s_solid.third_unit = "units/payday2/weapons/wpn_third_shot_r870_pts/wpn_third_shot_r870_s_solid"
	self.parts.wpn_fps_shot_r870_s_solid_big.third_unit = "units/payday2/weapons/wpn_third_shot_r870_pts/wpn_third_shot_r870_s_solid_big"
	self.parts.wpn_fps_shot_r870_s_solid_single.third_unit = "units/payday2/weapons/wpn_third_shot_r870_pts/wpn_third_shot_r870_s_solid_single"
	self.parts.wpn_fps_shot_r870_ris_special.third_unit = "units/payday2/weapons/wpn_third_shot_r870_pts/wpn_third_shot_r870_ris_special"
	self.parts.wpn_fps_shot_r870_gadget_rail.third_unit = "units/payday2/weapons/wpn_third_shot_r870_pts/wpn_third_shot_r870_gadget_rail"
	self.parts.wpn_fps_shot_r870_s_nostock.third_unit = "units/payday2/weapons/wpn_third_shot_r870_pts/wpn_third_shot_r870_s_nostock"
	self.parts.wpn_fps_shot_r870_s_nostock_big.third_unit = "units/payday2/weapons/wpn_third_shot_r870_pts/wpn_third_shot_r870_s_nostock_big"
	self.parts.wpn_fps_shot_r870_s_nostock_single.third_unit = "units/payday2/weapons/wpn_third_shot_r870_pts/wpn_third_shot_r870_s_nostock_single"
	self.parts.wpn_fps_shot_r870_s_nostock_vanilla = deep_clone(self.parts.wpn_fps_shot_r870_s_nostock)
	self.parts.wpn_fps_shot_r870_s_nostock_vanilla.stats = nil
	self.parts.wpn_fps_shot_r870_s_nostock_vanilla.pcs = nil
	self.parts.wpn_fps_shot_r870_s_solid_vanilla = deep_clone(self.parts.wpn_fps_shot_r870_s_solid)
	self.parts.wpn_fps_shot_r870_s_solid_vanilla.stats = nil
	self.parts.wpn_fps_shot_r870_s_solid_vanilla.pcs = nil
	self.parts.wpn_fps_shot_r870_fg_railed_vanilla = deep_clone(self.parts.wpn_fps_shot_r870_fg_railed)
	self.parts.wpn_fps_shot_r870_fg_railed_vanilla.stats = nil
	self.parts.wpn_fps_shot_r870_fg_railed_vanilla.pcs = nil
	self.wpn_fps_shot_r870 = {}
	self.wpn_fps_shot_r870.unit = "units/payday2/weapons/wpn_fps_shot_r870/wpn_fps_shot_r870"
	self.wpn_fps_shot_r870.optional_types = {
		"barrel_ext",
		"gadget",
		"magazine"
	}
	self.wpn_fps_shot_r870.stock_adapter = "wpn_fps_shot_r870_s_m4"
	self.wpn_fps_shot_r870.adds = {
		wpn_fps_upg_o_specter = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_aimpoint = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_aimpoint_2 = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_docter = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_eotech = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_t1micro = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_cmore = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_acog = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_cs = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_eotech_xps = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_reflex = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_rx01 = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_rx30 = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_fl_ass_smg_sho_surefire = {
			"wpn_fps_shot_r870_gadget_rail"
		},
		wpn_fps_upg_fl_ass_smg_sho_peqbox = {
			"wpn_fps_shot_r870_gadget_rail"
		},
		wpn_fps_upg_fl_ass_peq15 = {
			"wpn_fps_shot_r870_gadget_rail"
		},
		wpn_fps_upg_fl_ass_laser = {
			"wpn_fps_shot_r870_gadget_rail"
		}
	}
	self.wpn_fps_shot_r870.default_blueprint = {
		"wpn_fps_shot_r870_body_standard",
		"wpn_fps_shot_r870_b_long",
		"wpn_fps_shot_r870_fg_big",
		"wpn_fps_shot_r870_s_solid_vanilla",
		"wpn_fps_upg_m4_g_standard"
	}
	self.wpn_fps_shot_r870.uses_parts = {
		"wpn_fps_shot_r870_body_rack",
		"wpn_fps_shot_r870_body_standard",
		"wpn_fps_shot_r870_b_long",
		"wpn_fps_shot_r870_fg_big",
		"wpn_fps_shot_r870_fg_railed",
		"wpn_fps_shot_r870_fg_wood",
		"wpn_fps_shot_r870_m_extended",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_shot_r870_s_folding",
		"wpn_fps_shot_r870_s_m4",
		"wpn_fps_upg_m4_s_standard",
		"wpn_fps_upg_m4_s_pts",
		"wpn_fps_shot_r870_s_nostock_big",
		"wpn_fps_shot_r870_s_nostock_single",
		"wpn_fps_shot_r870_s_nostock",
		"wpn_fps_shot_r870_s_solid_vanilla",
		"wpn_fps_shot_r870_s_solid_big",
		"wpn_fps_shot_r870_s_solid_single",
		"wpn_fps_upg_m4_g_standard",
		"wpn_fps_upg_m4_g_ergo",
		"wpn_fps_upg_m4_g_sniper",
		"wpn_fps_upg_ns_shot_thick",
		"wpn_fps_upg_ns_shot_shark",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_m4_g_hgrip",
		"wpn_fps_upg_m4_g_mgrip",
		"wpn_fps_upg_shot_ns_king",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser",
		"wpn_fps_upg_m4_s_crane",
		"wpn_fps_upg_m4_s_mk46"
	}
	self.wpn_fps_shot_r870_npc = deep_clone(self.wpn_fps_shot_r870)
	self.wpn_fps_shot_r870_npc.unit = "units/payday2/weapons/wpn_fps_shot_r870/wpn_fps_shot_r870_npc"
end

function WeaponFactoryTweakData_37:_init_serbu()
	self.parts.wpn_fps_shot_shorty_m_extended_short = {
		pcs = {
			20,
			30,
			40
		},
		type = "magazine",
		name_id = "bm_wp_shorty_m_extended_short",
		a_obj = "a_m",
		unit = "units/payday2/weapons/wpn_fps_shot_shorty_pts/wpn_fps_shot_shorty_m_extended_short",
		stats = {value = 1, extra_ammo = 1}
	}
	self.parts.wpn_fps_shot_r870_b_short = {
		type = "barrel",
		name_id = "bm_wp_serbu_b_short",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_shot_r870_pts/wpn_fps_shot_r870_b_short",
		stats = {value = 1}
	}
	self.parts.wpn_fps_shot_shorty_s_nostock_short = {
		pcs = {
			20,
			30,
			40
		},
		type = "stock",
		name_id = "bm_wp_serbu_s_nostock_short",
		a_obj = "a_s",
		unit = "units/payday2/weapons/wpn_fps_shot_shorty_pts/wpn_fps_shot_shorty_s_nostock_short",
		stats = {
			value = 4,
			spread_moving = 2,
			recoil = -4,
			concealment = 3
		},
		forbids = {
			"wpn_fps_shot_r870_ris_special"
		}
	}
	self.parts.wpn_fps_shot_shorty_s_solid_short = {
		pcs = {
			20,
			30,
			40
		},
		type = "stock",
		name_id = "bm_wp_serbu_s_solid_short",
		a_obj = "a_s",
		unit = "units/payday2/weapons/wpn_fps_shot_shorty_pts/wpn_fps_shot_shorty_s_solid_short",
		stats = {
			value = 3,
			spread_moving = -2,
			recoil = 4,
			concealment = -3
		},
		forbids = {
			"wpn_fps_shot_r870_ris_special"
		}
	}
	self.parts.wpn_fps_shot_shorty_m_extended_short.third_unit = "units/payday2/weapons/wpn_third_shot_shorty_pts/wpn_third_shot_shorty_m_extended_short"
	self.parts.wpn_fps_shot_shorty_s_nostock_short.third_unit = "units/payday2/weapons/wpn_third_shot_shorty_pts/wpn_third_shot_shorty_s_nostock_short"
	self.parts.wpn_fps_shot_shorty_s_solid_short.third_unit = "units/payday2/weapons/wpn_third_shot_shorty_pts/wpn_third_shot_shorty_s_solid_short"
	self.wpn_fps_shot_serbu = {}
	self.wpn_fps_shot_serbu.unit = "units/payday2/weapons/wpn_fps_shot_shorty/wpn_fps_shot_shorty"
	self.wpn_fps_shot_serbu.optional_types = {
		"barrel_ext",
		"gadget",
		"magazine"
	}
	self.wpn_fps_shot_serbu.stock_adapter = "wpn_fps_shot_r870_s_m4"
	self.wpn_fps_shot_serbu.override = {
		wpn_fps_upg_a_slug = {
			desc_id = "bm_wp_upg_a_slug2_desc",
			custom_stats = {
				damage_near_mul = 2,
				damage_far_mul = 1.15,
				rays = 1,
				armor_piercing_add = 1,
				can_shoot_through_enemy = true,
				can_shoot_through_shield = true,
				can_shoot_through_wall = true,
				ammo_pickup_min_mul = 0.5,
				ammo_pickup_max_mul = 0.5
			}
		},
		wpn_fps_upg_a_custom = {
			desc_id = "bm_wp_upg_a_custom2_desc",
			custom_stats = {ammo_pickup_min_mul = 0.7, ammo_pickup_max_mul = 0.7}
		},
		wpn_fps_upg_a_custom_free = {
			desc_id = "bm_wp_upg_a_custom2_desc",
			custom_stats = {ammo_pickup_min_mul = 0.7, ammo_pickup_max_mul = 0.7}
		}
	}
	self.wpn_fps_shot_serbu.adds = {
		wpn_fps_upg_o_specter = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_aimpoint = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_aimpoint_2 = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_docter = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_eotech = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_t1micro = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_cmore = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_acog = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_cs = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_eotech_xps = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_reflex = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_rx01 = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_rx30 = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_fl_ass_smg_sho_surefire = {
			"wpn_fps_shot_r870_gadget_rail"
		},
		wpn_fps_upg_fl_ass_smg_sho_peqbox = {
			"wpn_fps_shot_r870_gadget_rail"
		},
		wpn_fps_upg_fl_ass_peq15 = {
			"wpn_fps_shot_r870_gadget_rail"
		},
		wpn_fps_upg_fl_ass_laser = {
			"wpn_fps_shot_r870_gadget_rail"
		}
	}
	self.wpn_fps_shot_serbu.default_blueprint = {
		"wpn_fps_shot_r870_body_standard",
		"wpn_fps_shot_r870_b_short",
		"wpn_fps_shot_r870_fg_small",
		"wpn_fps_shot_r870_s_nostock_vanilla",
		"wpn_fps_upg_m4_g_standard"
	}
	self.wpn_fps_shot_serbu.uses_parts = {
		"wpn_fps_shot_r870_body_rack",
		"wpn_fps_shot_r870_body_standard",
		"wpn_fps_shot_r870_b_short",
		"wpn_fps_shot_r870_fg_railed",
		"wpn_fps_shot_r870_fg_small",
		"wpn_fps_shot_shorty_m_extended_short",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_shot_r870_s_folding",
		"wpn_fps_shot_r870_s_m4",
		"wpn_fps_upg_m4_s_standard",
		"wpn_fps_upg_m4_s_pts",
		"wpn_fps_shot_shorty_s_nostock_short",
		"wpn_fps_shot_r870_s_nostock_single",
		"wpn_fps_shot_r870_s_nostock_vanilla",
		"wpn_fps_shot_r870_s_solid",
		"wpn_fps_shot_shorty_s_solid_short",
		"wpn_fps_shot_r870_s_solid_single",
		"wpn_fps_upg_m4_g_standard",
		"wpn_fps_upg_m4_g_ergo",
		"wpn_fps_upg_m4_g_sniper",
		"wpn_fps_upg_ns_shot_thick",
		"wpn_fps_upg_ns_shot_shark",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_m4_g_hgrip",
		"wpn_fps_upg_m4_g_mgrip",
		"wpn_fps_upg_shot_ns_king",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser",
		"wpn_fps_upg_m4_s_crane",
		"wpn_fps_upg_m4_s_mk46"
	}
	self.wpn_fps_shot_serbu_npc = deep_clone(self.wpn_fps_shot_serbu)
	self.wpn_fps_shot_serbu_npc.unit = "units/payday2/weapons/wpn_fps_shot_shorty/wpn_fps_shot_shorty_npc"
	self.parts.wpn_fps_shot_r870_b_short.third_unit = "units/payday2/weapons/wpn_third_shot_r870_pts/wpn_third_shot_r870_b_short"
end

function WeaponFactoryTweakData_37:_init_g17()
	self.parts.wpn_fps_pis_g17_b_standard = {
		type = "slide",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_pis_g17_pts/wpn_fps_pis_g17_b_standard",
		stats = {value = 1},
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	}
	self.parts.wpn_fps_pis_g17_body_standard = {
		type = "lower_reciever",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_pis_g17_pts/wpn_fps_pis_g17_body_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_g17_m_standard = {
		type = "magazine",
		a_obj = "a_m",
		unit = "units/payday2/weapons/wpn_fps_pis_g17_pts/wpn_fps_pis_g17_m_standard",
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_pis_g17_body_standard.third_unit = "units/payday2/weapons/wpn_third_pis_g17_pts/wpn_third_pis_g17_body_standard"
	self.parts.wpn_fps_pis_g17_b_standard.third_unit = "units/payday2/weapons/wpn_third_pis_g17_pts/wpn_third_pis_g17_b_standard"
	self.parts.wpn_fps_pis_g17_m_standard.third_unit = "units/payday2/weapons/wpn_third_pis_g17_pts/wpn_third_pis_g17_m_standard"
	self.wpn_fps_pis_g17 = {}
	self.wpn_fps_pis_g17.unit = "units/payday2/weapons/wpn_fps_pis_g17/wpn_fps_pis_g17"
	self.wpn_fps_pis_g17.optional_types = {"barrel_ext", "gadget"}
	self.wpn_fps_pis_g17.override = {
		wpn_fps_upg_o_rmr = {parent = "slide"}
	}
	self.wpn_fps_pis_g17.default_blueprint = {
		"wpn_fps_pis_g17_body_standard",
		"wpn_fps_pis_g17_b_standard",
		"wpn_fps_pis_g17_m_standard"
	}
	self.wpn_fps_pis_g17.uses_parts = {
		"wpn_fps_pis_g17_body_standard",
		"wpn_fps_pis_g17_b_standard",
		"wpn_fps_pis_g17_m_standard",
		"wpn_fps_upg_ns_pis_large",
		"wpn_fps_upg_ns_pis_medium",
		"wpn_fps_upg_ns_pis_small",
		"wpn_fps_upg_ns_pis_large_kac",
		"wpn_fps_upg_ns_pis_medium_gem",
		"wpn_fps_upg_o_rmr",
		"wpn_fps_upg_ns_pis_medium_slim",
		"wpn_fps_upg_pis_ns_flash"
	}
	self.wpn_fps_pis_g17_npc = deep_clone(self.wpn_fps_pis_g17)
	self.wpn_fps_pis_g17_npc.unit = "units/payday2/weapons/wpn_fps_pis_g17/wpn_fps_pis_g17_npc"
end

function WeaponFactoryTweakData_37:_init_b92fs()
	self.parts.wpn_fps_pis_beretta_b_std = {
		type = "slide",
		name_id = "bm_wp_beretta_b_std",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_pis_b92fs_pts/wpn_fps_pis_beretta_b_std",
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_beretta_body_beretta = {
		type = "lower_reciever",
		name_id = "bm_wp_beretta_body_beretta",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_pis_b92fs_pts/wpn_fps_pis_beretta_body_beretta",
		stats = {value = 1},
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	}
	self.parts.wpn_fps_pis_beretta_body_rail = {
		type = "extra",
		name_id = "bm_wp_beretta_body_rail",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_pis_b92fs_pts/wpn_fps_pis_beretta_body_rail",
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_beretta_co_co1 = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel_ext",
		name_id = "bm_wp_beretta_co_co1",
		a_obj = "a_co",
		parent = "slide",
		unit = "units/payday2/weapons/wpn_fps_pis_b92fs_pts/wpn_fps_pis_beretta_co_co1",
		stats = {
			value = 4,
			damage = 1,
			recoil = 1,
			spread = 1,
			spread_moving = 1,
			concealment = -2
		}
	}
	self.parts.wpn_fps_pis_beretta_co_co2 = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel_ext",
		name_id = "bm_wp_beretta_co_co2",
		a_obj = "a_co",
		parent = "slide",
		unit = "units/payday2/weapons/wpn_fps_pis_b92fs_pts/wpn_fps_pis_beretta_co_co2",
		stats = {
			value = 3,
			damage = 2,
			suppression = -5,
			spread_moving = 2,
			concealment = -2
		}
	}
	self.parts.wpn_fps_pis_beretta_g_ergo = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "grip",
		name_id = "bm_wp_beretta_g_ergo",
		a_obj = "a_g",
		unit = "units/payday2/weapons/wpn_fps_pis_b92fs_pts/wpn_fps_pis_beretta_g_ergo",
		stats = {
			value = 2,
			spread_moving = 1,
			recoil = 1
		}
	}
	self.parts.wpn_fps_pis_beretta_g_std = {
		type = "grip",
		name_id = "bm_wp_beretta_g_std",
		a_obj = "a_g",
		unit = "units/payday2/weapons/wpn_fps_pis_b92fs_pts/wpn_fps_pis_beretta_g_std",
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_beretta_m_extended = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "magazine",
		name_id = "bm_wp_beretta_m_extended",
		a_obj = "a_m",
		unit = "units/payday2/weapons/wpn_fps_pis_b92fs_pts/wpn_fps_pis_beretta_m_extended",
		stats = {
			value = 2,
			spread_moving = -2,
			concealment = -2,
			extra_ammo = 6
		},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_pis_beretta_m_std = {
		type = "magazine",
		name_id = "bm_wp_beretta_m_std",
		a_obj = "a_m",
		unit = "units/payday2/weapons/wpn_fps_pis_b92fs_pts/wpn_fps_pis_beretta_m_std",
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_pis_beretta_o_std = {
		type = "sight",
		name_id = "bm_wp_beretta_o_std",
		a_obj = "a_o",
		unit = "units/payday2/weapons/wpn_fps_pis_b92fs_pts/wpn_fps_pis_beretta_o_std",
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_beretta_sl_brigadier = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "upper_reciever",
		name_id = "bm_wp_beretta_sl_brigadier",
		a_obj = "a_sl",
		unit = "units/payday2/weapons/wpn_fps_pis_b92fs_pts/wpn_fps_pis_beretta_sl_brigadier",
		stats = {
			value = 1,
			recoil = 2,
			spread_moving = -2
		},
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	}
	self.parts.wpn_fps_pis_beretta_sl_std = {
		type = "upper_reciever",
		name_id = "bm_wp_beretta_sl_std",
		a_obj = "a_sl",
		unit = "units/payday2/weapons/wpn_fps_pis_b92fs_pts/wpn_fps_pis_beretta_sl_std",
		stats = {value = 1},
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	}
	self.parts.wpn_fps_pis_beretta_body_beretta.third_unit = "units/payday2/weapons/wpn_third_pis_b92fs_pts/wpn_third_pis_beretta_body_beretta"
	self.parts.wpn_fps_pis_beretta_body_rail.third_unit = "units/payday2/weapons/wpn_third_pis_b92fs_pts/wpn_third_pis_beretta_body_rail"
	self.parts.wpn_fps_pis_beretta_co_co1.third_unit = "units/payday2/weapons/wpn_third_pis_b92fs_pts/wpn_third_pis_beretta_co_1"
	self.parts.wpn_fps_pis_beretta_co_co2.third_unit = "units/payday2/weapons/wpn_third_pis_b92fs_pts/wpn_third_pis_beretta_co_2"
	self.parts.wpn_fps_pis_beretta_g_ergo.third_unit = "units/payday2/weapons/wpn_third_pis_b92fs_pts/wpn_third_pis_beretta_g_ergo"
	self.parts.wpn_fps_pis_beretta_g_std.third_unit = "units/payday2/weapons/wpn_third_pis_b92fs_pts/wpn_third_pis_beretta_g_std"
	self.parts.wpn_fps_pis_beretta_m_extended.third_unit = "units/payday2/weapons/wpn_third_pis_b92fs_pts/wpn_third_pis_beretta_m_extended"
	self.parts.wpn_fps_pis_beretta_m_std.third_unit = "units/payday2/weapons/wpn_third_pis_b92fs_pts/wpn_third_pis_beretta_m_std"
	self.parts.wpn_fps_pis_beretta_o_std.third_unit = "units/payday2/weapons/wpn_third_pis_b92fs_pts/wpn_third_pis_beretta_o_std"
	self.parts.wpn_fps_pis_beretta_sl_brigadier.third_unit = "units/payday2/weapons/wpn_third_pis_b92fs_pts/wpn_third_pis_beretta_sl_brigadier"
	self.parts.wpn_fps_pis_beretta_sl_std.third_unit = "units/payday2/weapons/wpn_third_pis_b92fs_pts/wpn_third_pis_beretta_sl_std"
	self.wpn_fps_pis_beretta = {}
	self.wpn_fps_pis_beretta.unit = "units/payday2/weapons/wpn_fps_pis_b92fs/wpn_fps_pis_beretta"
	self.wpn_fps_pis_beretta.animations = {
		fire = "recoil",
		fire_steelsight = "recoil",
		reload = "reload"
	}
	self.wpn_fps_pis_beretta.optional_types = {"barrel_ext", "gadget"}
	self.wpn_fps_pis_beretta.adds = {
		wpn_fps_upg_fl_pis_laser = {
			"wpn_fps_pis_beretta_body_rail"
		},
		wpn_fps_upg_fl_pis_tlr1 = {
			"wpn_fps_pis_beretta_body_rail"
		},
		wpn_fps_upg_o_rmr = {
			"wpn_fps_pis_beretta_o_std"
		}
	}
	self.wpn_fps_pis_beretta.override = {
		wpn_upg_o_marksmansight_front = {a_obj = "a_os"},
		wpn_fps_upg_o_rmr = {parent = "slide"},
		wpn_fps_upg_pis_ns_flash = {
			parent = "lower_reciever"
		},
		wpn_fps_upg_ns_pis_medium_slim = {
			parent = "lower_reciever"
		}
	}
	self.wpn_fps_pis_beretta.default_blueprint = {
		"wpn_fps_pis_beretta_body_beretta",
		"wpn_fps_pis_beretta_b_std",
		"wpn_fps_pis_beretta_g_std",
		"wpn_fps_pis_beretta_m_std",
		"wpn_fps_pis_beretta_o_std",
		"wpn_fps_pis_beretta_sl_std"
	}
	self.wpn_fps_pis_beretta.uses_parts = {
		"wpn_fps_pis_beretta_b_std",
		"wpn_fps_pis_beretta_body_beretta",
		"wpn_fps_pis_beretta_body_rail",
		"wpn_fps_pis_beretta_co_co1",
		"wpn_fps_pis_beretta_co_co2",
		"wpn_fps_pis_beretta_g_ergo",
		"wpn_fps_pis_beretta_g_std",
		"wpn_fps_pis_beretta_m_extended",
		"wpn_fps_pis_beretta_m_std",
		"wpn_fps_pis_beretta_o_std",
		"wpn_upg_o_marksmansight_rear",
		"wpn_fps_pis_beretta_sl_std",
		"wpn_fps_pis_beretta_sl_brigadier",
		"wpn_fps_upg_fl_pis_laser",
		"wpn_fps_upg_fl_pis_tlr1",
		"wpn_fps_upg_ns_pis_large",
		"wpn_fps_upg_ns_pis_medium",
		"wpn_fps_upg_ns_pis_small",
		"wpn_fps_upg_ns_pis_large_kac",
		"wpn_fps_upg_ns_pis_medium_gem",
		"wpn_fps_upg_o_rmr",
		"wpn_fps_upg_ns_pis_medium_slim",
		"wpn_fps_upg_pis_ns_flash"
	}
	self.wpn_fps_pis_beretta_npc = deep_clone(self.wpn_fps_pis_beretta)
	self.wpn_fps_pis_beretta_npc.unit = "units/payday2/weapons/wpn_fps_pis_b92fs/wpn_fps_pis_beretta_npc"
	self.wpn_fps_pis_beretta_primary = deep_clone(self.wpn_fps_pis_beretta)
	self.wpn_fps_pis_beretta_primary.unit = "units/payday2/weapons/wpn_fps_pis_b92fs/wpn_fps_pis_beretta_primary"
	self.wpn_fps_pis_beretta_primary_npc = deep_clone(self.wpn_fps_pis_beretta_npc)
	self.wpn_fps_pis_beretta_primary_npc.unit = "units/payday2/weapons/wpn_fps_pis_b92fs/wpn_fps_pis_beretta_primary_npc"
end

function WeaponFactoryTweakData_37:_init_huntsman()
	self.parts.wpn_fps_shot_huntsman_b_long = {
		type = "barrel",
		name_id = "bm_wp_huntsman_b_long",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_shot_huntsman_pts/wpn_fps_shot_huntsman_b_long",
		stats = {value = 1},
		animations = {reload = "reload", reload_not_empty = "reload"}
	}
	self.parts.wpn_fps_shot_huntsman_b_short = {
		pc = 40,
		type = "barrel",
		name_id = "bm_wp_huntsman_b_short",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_shot_huntsman_pts/wpn_fps_shot_huntsman_b_short",
		stats = {
			value = 10,
			recoil = -4,
			spread = -4,
			spread_moving = 3,
			concealment = 10
		},
		animations = {reload = "reload", reload_not_empty = "reload"}
	}
	self.parts.wpn_fps_shot_huntsman_body_standard = {
		type = "lower_reciever",
		name_id = "bm_wp_huntsman_body_standard",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_shot_huntsman_pts/wpn_fps_shot_huntsman_body_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_shot_huntsman_s_long = {
		type = "stock",
		name_id = "bm_wp_huntsman_s_long",
		a_obj = "a_s",
		unit = "units/payday2/weapons/wpn_fps_shot_huntsman_pts/wpn_fps_shot_huntsman_s_long",
		stats = {value = 1}
	}
	self.parts.wpn_fps_shot_huntsman_s_short = {
		pc = 40,
		type = "stock",
		name_id = "bm_wp_huntsman_s_short",
		a_obj = "a_s",
		unit = "units/payday2/weapons/wpn_fps_shot_huntsman_pts/wpn_fps_shot_huntsman_s_short",
		stats = {
			value = 10,
			recoil = -4,
			spread = -4,
			spread_moving = 3,
			concealment = 10
		}
	}
	self.parts.wpn_fps_shot_huntsman_b_long.third_unit = "units/payday2/weapons/wpn_third_shot_huntsman_pts/wpn_third_shot_huntsman_b_long"
	self.parts.wpn_fps_shot_huntsman_b_short.third_unit = "units/payday2/weapons/wpn_third_shot_huntsman_pts/wpn_third_shot_huntsman_b_short"
	self.parts.wpn_fps_shot_huntsman_body_standard.third_unit = "units/payday2/weapons/wpn_third_shot_huntsman_pts/wpn_third_shot_huntsman_body_standard"
	self.parts.wpn_fps_shot_huntsman_s_long.third_unit = "units/payday2/weapons/wpn_third_shot_huntsman_pts/wpn_third_shot_huntsman_s_long"
	self.parts.wpn_fps_shot_huntsman_s_short.third_unit = "units/payday2/weapons/wpn_third_shot_huntsman_pts/wpn_third_shot_huntsman_s_short"
	self.wpn_fps_shot_huntsman = {}
	self.wpn_fps_shot_huntsman.unit = "units/payday2/weapons/wpn_fps_shot_huntsman/wpn_fps_shot_huntsman"
	self.wpn_fps_shot_huntsman.optional_types = {"barrel_ext", "gadget"}
	self.wpn_fps_shot_huntsman.override = {
		wpn_fps_upg_a_explosive = {
			custom_stats = {
				ignore_statistic = true,
				rays = 1,
				damage_near_mul = 2,
				damage_far_mul = 2.5,
				bullet_class = "InstantExplosiveBulletBase",
				ammo_pickup_min_mul = 0.5,
				ammo_pickup_max_mul = 0.7
			}
		}
	}
	self.wpn_fps_shot_huntsman.default_blueprint = {
		"wpn_fps_shot_huntsman_body_standard",
		"wpn_fps_shot_huntsman_b_long",
		"wpn_fps_shot_huntsman_s_long"
	}
	self.wpn_fps_shot_huntsman.uses_parts = {
		"wpn_fps_shot_huntsman_body_standard",
		"wpn_fps_shot_huntsman_b_long",
		"wpn_fps_shot_huntsman_b_short",
		"wpn_fps_shot_huntsman_s_long",
		"wpn_fps_shot_huntsman_s_short"
	}
	self.wpn_fps_shot_huntsman_npc = deep_clone(self.wpn_fps_shot_huntsman)
	self.wpn_fps_shot_huntsman_npc.unit = "units/payday2/weapons/wpn_fps_shot_huntsman/wpn_fps_shot_huntsman_npc"
end

function WeaponFactoryTweakData_37:_init_raging_bull()
	self.parts.wpn_fps_pis_rage_b_comp1 = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "slide",
		name_id = "bm_wp_rage_b_comp1",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_pis_rage_pts/wpn_fps_pis_rage_b_comp1",
		stats = {
			value = 3,
			recoil = 2,
			damage = 2,
			spread = 2,
			spread_moving = -3,
			concealment = -3
		}
	}
	self.parts.wpn_fps_pis_rage_b_comp2 = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "slide",
		name_id = "bm_wp_rage_b_comp2",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_pis_rage_pts/wpn_fps_pis_rage_b_comp2",
		stats = {
			value = 4,
			recoil = 1,
			damage = 1,
			spread = -1,
			spread_moving = 1,
			suppression = -4,
			concealment = -3
		}
	}
	self.parts.wpn_fps_pis_rage_b_long = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "slide",
		name_id = "bm_wp_rage_b_long",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_pis_rage_pts/wpn_fps_pis_rage_b_long",
		stats = {
			value = 5,
			recoil = 3,
			spread = 3,
			spread_moving = -3,
			concealment = -3
		}
	}
	self.parts.wpn_fps_pis_rage_b_short = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "slide",
		name_id = "bm_wp_rage_b_short",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_pis_rage_pts/wpn_fps_pis_rage_b_short",
		stats = {
			value = 3,
			recoil = -3,
			spread_moving = 3,
			spread = -2,
			concealment = 3
		}
	}
	self.parts.wpn_fps_pis_rage_b_standard = {
		type = "slide",
		name_id = "bm_wp_rage_b_standard",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_pis_rage_pts/wpn_fps_pis_rage_b_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_rage_body_smooth = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "upper_reciever",
		name_id = "bm_wp_rage_body_smooth",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_pis_rage_pts/wpn_fps_pis_rage_body_smooth",
		stats = {
			value = 6,
			recoil = 1,
			concealment = 1
		},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty",
			fire = "recoil",
			fire_steelsight = "recoil"
		},
		adds = {
			"wpn_fps_pis_rage_lock"
		}
	}
	self.parts.wpn_fps_pis_rage_body_standard = {
		type = "upper_reciever",
		name_id = "bm_wp_rage_body_standard",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_pis_rage_pts/wpn_fps_pis_rage_body_standard",
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty",
			fire = "recoil",
			fire_steelsight = "recoil"
		},
		adds = {
			"wpn_fps_pis_rage_lock"
		}
	}
	self.parts.wpn_fps_pis_rage_g_ergo = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "grip",
		name_id = "bm_wp_rage_g_ergo",
		a_obj = "a_g",
		unit = "units/payday2/weapons/wpn_fps_pis_rage_pts/wpn_fps_pis_rage_g_ergo",
		stats = {
			value = 2,
			spread_moving = 1,
			recoil = 1
		}
	}
	self.parts.wpn_fps_pis_rage_g_standard = {
		type = "grip",
		name_id = "bm_wp_rage_g_standard",
		a_obj = "a_g",
		unit = "units/payday2/weapons/wpn_fps_pis_rage_pts/wpn_fps_pis_rage_g_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_rage_b_comp1.third_unit = "units/payday2/weapons/wpn_third_pis_rage_pts/wpn_third_pis_rage_b_comp1"
	self.parts.wpn_fps_pis_rage_b_comp2.third_unit = "units/payday2/weapons/wpn_third_pis_rage_pts/wpn_third_pis_rage_b_comp2"
	self.parts.wpn_fps_pis_rage_b_long.third_unit = "units/payday2/weapons/wpn_third_pis_rage_pts/wpn_third_pis_rage_b_long"
	self.parts.wpn_fps_pis_rage_b_short.third_unit = "units/payday2/weapons/wpn_third_pis_rage_pts/wpn_third_pis_rage_b_short"
	self.parts.wpn_fps_pis_rage_b_standard.third_unit = "units/payday2/weapons/wpn_third_pis_rage_pts/wpn_third_pis_rage_b_standard"
	self.parts.wpn_fps_pis_rage_body_smooth.third_unit = "units/payday2/weapons/wpn_third_pis_rage_pts/wpn_third_pis_rage_body_smooth"
	self.parts.wpn_fps_pis_rage_body_standard.third_unit = "units/payday2/weapons/wpn_third_pis_rage_pts/wpn_third_pis_rage_body_standard"
	self.parts.wpn_fps_pis_rage_g_ergo.third_unit = "units/payday2/weapons/wpn_third_pis_rage_pts/wpn_third_pis_rage_g_ergo"
	self.parts.wpn_fps_pis_rage_g_standard.third_unit = "units/payday2/weapons/wpn_third_pis_rage_pts/wpn_third_pis_rage_g_standard"
	self.wpn_fps_pis_rage = {}
	self.wpn_fps_pis_rage.unit = "units/payday2/weapons/wpn_fps_pis_rage/wpn_fps_pis_rage"
	self.wpn_fps_pis_rage.optional_types = {"barrel_ext", "gadget"}
	self.wpn_fps_pis_rage.adds = {
		wpn_fps_upg_o_specter = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_aimpoint = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_aimpoint_2 = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_docter = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_eotech = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_t1micro = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_cmore = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_acog = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_cs = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_eotech_xps = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_reflex = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_rx01 = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_rx30 = {
			"wpn_fps_pis_rage_o_adapter"
		}
	}
	self.wpn_fps_pis_rage.default_blueprint = {
		"wpn_fps_pis_rage_body_standard",
		"wpn_fps_pis_rage_b_standard",
		"wpn_fps_pis_rage_g_standard"
	}
	self.wpn_fps_pis_rage.uses_parts = {
		"wpn_fps_pis_rage_body_standard",
		"wpn_fps_pis_rage_body_smooth",
		"wpn_fps_pis_rage_b_standard",
		"wpn_fps_pis_rage_b_short",
		"wpn_fps_pis_rage_b_long",
		"wpn_fps_pis_rage_b_comp1",
		"wpn_fps_pis_rage_b_comp2",
		"wpn_fps_pis_rage_g_standard",
		"wpn_fps_pis_rage_g_ergo",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_pis_ns_flash",
		"wpn_fps_pis_rage_extra",
		"wpn_fps_pis_rage_o_adapter",
		"wpn_fps_pis_rage_lock"
	}
	self.wpn_fps_pis_rage_npc = deep_clone(self.wpn_fps_pis_rage)
	self.wpn_fps_pis_rage_npc.unit = "units/payday2/weapons/wpn_fps_pis_rage/wpn_fps_pis_rage_npc"
	self.wpn_fps_pis_rage_primary = deep_clone(self.wpn_fps_pis_rage)
	self.wpn_fps_pis_rage_primary.unit = "units/payday2/weapons/wpn_fps_pis_rage/wpn_fps_pis_rage_primary"
	self.wpn_fps_pis_rage_primary_npc = deep_clone(self.wpn_fps_pis_rage_npc)
	self.wpn_fps_pis_rage_primary_npc.unit = "units/payday2/weapons/wpn_fps_pis_rage/wpn_fps_pis_rage_primary_npc"
end

function WeaponFactoryTweakData_37:_init_saw()
	self.parts.wpn_fps_saw_b_normal = {
		type = "barrel",
		name_id = "bm_wp_saw_b_normal",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_saw_pts/wpn_fps_saw_b_normal",
		stats = {value = 1}
	}
	self.parts.wpn_fps_saw_body_standard = {
		type = "lower_reciever",
		name_id = "bm_wp_saw_body_standard",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_saw_pts/wpn_fps_saw_body_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_saw_m_blade = {
		type = "magazine",
		name_id = "bm_wp_saw_m_blade",
		a_obj = "a_m",
		unit = "units/payday2/weapons/wpn_fps_saw_pts/wpn_fps_saw_m_blade",
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	}
	self.wpn_fps_saw = {}
	self.wpn_fps_saw.unit = "units/payday2/weapons/wpn_fps_saw/wpn_fps_saw"
	self.wpn_fps_saw.optional_types = {"barrel_ext", "gadget"}
	self.wpn_fps_saw.default_blueprint = {
		"wpn_fps_saw_b_normal",
		"wpn_fps_saw_body_standard",
		"wpn_fps_saw_m_blade"
	}
	self.wpn_fps_saw.uses_parts = {
		"wpn_fps_saw_b_normal",
		"wpn_fps_saw_body_standard",
		"wpn_fps_saw_m_blade"
	}
	self.wpn_fps_saw_npc = deep_clone(self.wpn_fps_saw)
	self.wpn_fps_saw_npc.unit = "units/payday2/weapons/wpn_fps_saw/wpn_fps_saw_npc"
	self.parts.wpn_fps_saw_b_normal.third_unit = "units/payday2/weapons/wpn_third_saw_pts/wpn_third_saw_b_normal"
	self.parts.wpn_fps_saw_body_standard.third_unit = "units/payday2/weapons/wpn_third_saw_pts/wpn_third_saw_body_standard"
	self.parts.wpn_fps_saw_m_blade.third_unit = "units/payday2/weapons/wpn_third_saw_pts/wpn_third_saw_m_blade"
end

function WeaponFactoryTweakData_37:_init_usp()
	self.parts.wpn_fps_pis_usp_body_standard = {
		type = "lower_reciever",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_pis_usp_pts/wpn_fps_pis_usp_body_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_usp_m_standard = {
		type = "magazine",
		a_obj = "a_m",
		unit = "units/payday2/weapons/wpn_fps_pis_usp_pts/wpn_fps_pis_usp_m_standard",
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_pis_usp_fl_adapter = {
		type = "extra",
		a_obj = "a_fl",
		unit = "units/payday2/weapons/wpn_fps_pis_usp_pts/wpn_fps_pis_usp_fl_adapter",
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_usp_body_standard.third_unit = "units/payday2/weapons/wpn_third_pis_usp_pts/wpn_third_pis_usp_body_standard"
	self.parts.wpn_fps_pis_usp_m_standard.third_unit = "units/payday2/weapons/wpn_third_pis_usp_pts/wpn_third_pis_usp_m_standard"
	self.parts.wpn_fps_pis_usp_fl_adapter.third_unit = "units/payday2/weapons/wpn_third_pis_usp_pts/wpn_third_pis_usp_fl_adapter"
	self.parts.wpn_fps_pis_usp_b_tactical = {
		type = "slide",
		name_id = "bm_wp_pis_usp_b_tactical",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_pis_usp_pts/wpn_fps_pis_usp_b_tactical",
		stats = {value = 1},
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	}
	self.parts.wpn_fps_pis_usp_b_expert = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "slide",
		name_id = "bm_wp_pis_usp_b_expert",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_pis_usp_pts/wpn_fps_pis_usp_b_expert",
		stats = {
			value = 2,
			spread = 3,
			concealment = -1
		},
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil"
		},
		dlc = "pd2_clan"
	}
	self.parts.wpn_fps_pis_usp_b_match = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "slide",
		name_id = "bm_wp_pis_usp_b_match",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_pis_usp_pts/wpn_fps_pis_usp_b_match",
		stats = {
			value = 2,
			recoil = 2,
			spread = 1,
			concealment = -1
		},
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil"
		},
		dlc = "pd2_clan"
	}
	self.parts.wpn_fps_pis_usp_m_extended = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "magazine",
		name_id = "bm_wp_pis_usp_m_extended",
		a_obj = "a_m",
		unit = "units/payday2/weapons/wpn_fps_pis_usp_pts/wpn_fps_pis_usp_m_extended",
		stats = {
			value = 2,
			spread_moving = -1,
			concealment = -1,
			extra_ammo = 4
		},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		},
		dlc = "pd2_clan"
	}
	self.parts.wpn_fps_pis_usp_b_expert.third_unit = "units/payday2/weapons/wpn_third_pis_usp_pts/wpn_third_pis_usp_b_expert"
	self.parts.wpn_fps_pis_usp_b_match.third_unit = "units/payday2/weapons/wpn_third_pis_usp_pts/wpn_third_pis_usp_b_match"
	self.parts.wpn_fps_pis_usp_b_tactical.third_unit = "units/payday2/weapons/wpn_third_pis_usp_pts/wpn_third_pis_usp_b_tactical"
	self.parts.wpn_fps_pis_usp_m_extended.third_unit = "units/payday2/weapons/wpn_third_pis_usp_pts/wpn_third_pis_usp_m_extended"
	self.parts.wpn_fps_pis_usp_co_comp_1 = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel_ext",
		name_id = "bm_wp_usp_co_comp_1",
		a_obj = "a_co",
		parent = "slide",
		unit = "units/payday2/weapons/wpn_fps_pis_usp_pts/wpn_fps_pis_usp_co_comp_1",
		stats = {
			value = 4,
			suppression = -5,
			damage = 2,
			spread = -1,
			concealment = -1
		},
		dlc = "pd2_clan"
	}
	self.parts.wpn_fps_pis_usp_co_comp_2 = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel_ext",
		name_id = "bm_wp_usp_co_comp_2",
		a_obj = "a_co",
		parent = "slide",
		unit = "units/payday2/weapons/wpn_fps_pis_usp_pts/wpn_fps_pis_usp_co_comp_2",
		stats = {
			value = 5,
			spread = 2,
			recoil = 2,
			concealment = -1
		},
		dlc = "pd2_clan"
	}
	self.parts.wpn_fps_pis_usp_co_comp_2.third_unit = "units/payday2/weapons/wpn_third_pis_g18c_pts/wpn_third_pis_g18c_co_2"
	self.parts.wpn_fps_pis_usp_co_comp_1.third_unit = "units/payday2/weapons/wpn_third_pis_g18c_pts/wpn_third_pis_g18c_co_1"
	self.wpn_fps_pis_usp = {}
	self.wpn_fps_pis_usp.unit = "units/payday2/weapons/wpn_fps_pis_usp/wpn_fps_pis_usp"
	self.wpn_fps_pis_usp.optional_types = {"barrel_ext", "gadget"}
	self.wpn_fps_pis_usp.adds = {
		wpn_fps_upg_fl_pis_laser = {
			"wpn_fps_pis_usp_fl_adapter"
		},
		wpn_fps_upg_fl_pis_tlr1 = {
			"wpn_fps_pis_usp_fl_adapter"
		}
	}
	self.wpn_fps_pis_usp.override = {
		wpn_fps_upg_o_rmr = {parent = "slide"}
	}
	self.wpn_fps_pis_usp.default_blueprint = {
		"wpn_fps_pis_usp_b_tactical",
		"wpn_fps_pis_usp_body_standard",
		"wpn_fps_pis_usp_m_standard"
	}
	self.wpn_fps_pis_usp.uses_parts = {
		"wpn_fps_pis_usp_b_match",
		"wpn_fps_pis_usp_body_standard",
		"wpn_fps_pis_usp_m_standard",
		"wpn_fps_pis_usp_m_extended",
		"wpn_fps_pis_usp_b_expert",
		"wpn_fps_pis_usp_b_tactical",
		"wpn_fps_pis_usp_co_comp_1",
		"wpn_fps_pis_usp_co_comp_2",
		"wpn_fps_upg_fl_pis_laser",
		"wpn_fps_upg_fl_pis_tlr1",
		"wpn_fps_upg_ns_pis_large",
		"wpn_fps_upg_ns_pis_medium",
		"wpn_fps_upg_ns_pis_small",
		"wpn_fps_upg_ns_pis_large_kac",
		"wpn_fps_upg_ns_pis_medium_gem",
		"wpn_fps_upg_o_rmr",
		"wpn_fps_upg_ns_pis_medium_slim",
		"wpn_fps_upg_pis_ns_flash"
	}
	self.wpn_fps_pis_usp_npc = deep_clone(self.wpn_fps_pis_usp)
	self.wpn_fps_pis_usp_npc.unit = "units/payday2/weapons/wpn_fps_pis_usp/wpn_fps_pis_usp_npc"
end

function WeaponFactoryTweakData_37:_init_g22c()
	self.parts.wpn_fps_pis_g22c_body_standard = {
		type = "lower_reciever",
		name_id = "bm_wp_g22c_body_standard",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_pis_g22c_pts/wpn_fps_pis_g22c_body_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_g22c_b_standard = {
		type = "slide",
		name_id = "bm_wp_g22c_b_standard",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_pis_g22c_pts/wpn_fps_pis_g22c_b_standard",
		stats = {value = 1},
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	}
	self.parts.wpn_fps_pis_g22c_b_long = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "slide",
		name_id = "bm_wp_g22c_b_long",
		a_obj = "a_sl",
		unit = "units/payday2/weapons/wpn_fps_pis_g22c_pts/wpn_fps_pis_g22c_b_long",
		stats = {
			value = 5,
			suppression = -2,
			recoil = 1,
			spread = -1,
			damage = 1,
			spread_moving = 1
		},
		dlc = "pd2_clan",
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	}
	self.parts.wpn_fps_pis_g22c_b_standard.third_unit = "units/payday2/weapons/wpn_third_pis_g22c_pts/wpn_third_pis_g22c_b_standard"
	self.parts.wpn_fps_pis_g22c_b_long.third_unit = "units/payday2/weapons/wpn_third_pis_g22c_pts/wpn_third_pis_g22c_b_long"
	self.parts.wpn_fps_pis_g22c_body_standard.third_unit = "units/payday2/weapons/wpn_third_pis_g22c_pts/wpn_third_pis_g22c_body_standard"
	self.wpn_fps_pis_g22c = {}
	self.wpn_fps_pis_g22c.unit = "units/payday2/weapons/wpn_fps_pis_g22c/wpn_fps_pis_g22c"
	self.wpn_fps_pis_g22c.animations = {
		fire = "recoil",
		fire_steelsight = "recoil",
		reload = "reload"
	}
	self.wpn_fps_pis_g22c.optional_types = {"barrel_ext", "gadget"}
	self.wpn_fps_pis_g22c.override = {
		wpn_fps_upg_o_rmr = {parent = "slide"}
	}
	self.wpn_fps_pis_g22c.default_blueprint = {
		"wpn_fps_pis_g22c_b_standard",
		"wpn_fps_pis_g22c_body_standard",
		"wpn_fps_pis_g18c_m_mag_17rnd"
	}
	self.wpn_fps_pis_g22c.uses_parts = {
		"wpn_fps_pis_g22c_b_standard",
		"wpn_fps_pis_g22c_b_long",
		"wpn_fps_pis_g22c_body_standard",
		"wpn_fps_pis_g18c_g_ergo",
		"wpn_fps_pis_g18c_co_1",
		"wpn_fps_pis_g18c_co_comp_2",
		"wpn_fps_pis_g18c_m_mag_33rnd",
		"wpn_fps_pis_g18c_m_mag_17rnd",
		"wpn_fps_upg_fl_pis_laser",
		"wpn_fps_upg_fl_pis_tlr1",
		"wpn_fps_upg_ns_pis_large",
		"wpn_fps_upg_ns_pis_medium",
		"wpn_fps_upg_ns_pis_small",
		"wpn_fps_upg_ns_pis_large_kac",
		"wpn_fps_upg_ns_pis_medium_gem",
		"wpn_fps_upg_o_rmr",
		"wpn_fps_upg_ns_pis_medium_slim",
		"wpn_fps_upg_pis_ns_flash"
	}
	self.wpn_fps_pis_g22c_npc = deep_clone(self.wpn_fps_pis_g22c)
	self.wpn_fps_pis_g22c_npc.unit = "units/payday2/weapons/wpn_fps_pis_g22c/wpn_fps_pis_g22c_npc"
end

function WeaponFactoryTweakData_37:_init_judge()
	self.parts.wpn_fps_pis_judge_body_standard = {
		type = "lower_reciever",
		name_id = "bm_wp_judge_body_standard",
		a_obj = "a_body",
		unit = "units/pd2_million/weapons/wpn_fps_pis_judge_pts/wpn_fps_pis_judge_body_standard",
		stats = {value = 1},
		forbids = {
			"wpn_fps_addon_ris"
		},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	}
	self.parts.wpn_fps_pis_judge_b_standard = {
		type = "slide",
		name_id = "bm_wp_judge_b_standard",
		a_obj = "a_b",
		unit = "units/pd2_million/weapons/wpn_fps_pis_judge_pts/wpn_fps_pis_judge_b_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_judge_fl_adapter = {
		type = "extra",
		name_id = "bm_wp_judge_b_standard",
		a_obj = "a_fl_body",
		unit = "units/pd2_million/weapons/wpn_fps_pis_judge_pts/wpn_fps_pis_judge_fl_adapter",
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_judge_g_standard = {
		type = "grip",
		name_id = "bm_wp_judge_b_standard",
		a_obj = "a_g",
		unit = "units/pd2_million/weapons/wpn_fps_pis_judge_pts/wpn_fps_pis_judge_g_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_judge_body_standard.third_unit = "units/pd2_million/weapons/wpn_third_pis_judge_pts/wpn_third_pis_judge_body_standard"
	self.parts.wpn_fps_pis_judge_b_standard.third_unit = "units/pd2_million/weapons/wpn_third_pis_judge_pts/wpn_third_pis_judge_b_standard"
	self.parts.wpn_fps_pis_judge_fl_adapter.third_unit = "units/pd2_million/weapons/wpn_third_pis_judge_pts/wpn_third_pis_judge_fl_adapter"
	self.parts.wpn_fps_pis_judge_g_standard.third_unit = "units/pd2_million/weapons/wpn_third_pis_judge_pts/wpn_third_pis_judge_g_standard"
	self.wpn_fps_pis_judge = {}
	self.wpn_fps_pis_judge.unit = "units/pd2_million/weapons/wpn_fps_pis_judge/wpn_fps_pis_judge"
	self.wpn_fps_pis_judge.optional_types = {"barrel_ext", "gadget"}
	self.wpn_fps_pis_judge.override = {
		wpn_fps_upg_ns_shot_shark = {parent = "slide"},
		wpn_fps_upg_ns_shot_thick = {parent = "slide"},
		wpn_fps_upg_shot_ns_king = {parent = "slide"},
		wpn_fps_upg_a_piercing = {
			custom_stats = {
				damage_near_mul = 2,
				damage_far_mul = 1.7,
				armor_piercing_add = 1,
				ammo_pickup_min_mul = 0.9,
				ammo_pickup_max_mul = 1
			}
		},
		wpn_fps_upg_a_explosive = {
			custom_stats = {
				ignore_statistic = true,
				rays = 1,
				damage_near_mul = 2,
				damage_far_mul = 2.5,
				bullet_class = "InstantExplosiveBulletBase",
				ammo_pickup_min_mul = 0.7,
				ammo_pickup_max_mul = 0.9
			}
		}
	}
	self.wpn_fps_pis_judge.adds = {
		wpn_fps_upg_fl_ass_laser = {
			"wpn_fps_pis_judge_fl_adapter"
		},
		wpn_fps_upg_fl_ass_peq15 = {
			"wpn_fps_pis_judge_fl_adapter"
		},
		wpn_fps_upg_fl_ass_smg_sho_peqbox = {
			"wpn_fps_pis_judge_fl_adapter"
		},
		wpn_fps_upg_fl_ass_smg_sho_surefire = {
			"wpn_fps_pis_judge_fl_adapter"
		},
		wpn_fps_upg_o_specter = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_aimpoint = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_aimpoint_2 = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_docter = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_eotech = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_t1micro = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_cmore = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_acog = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_cs = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_eotech_xps = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_reflex = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_rx01 = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_rx30 = {
			"wpn_fps_pis_rage_o_adapter"
		}
	}
	self.wpn_fps_pis_judge.default_blueprint = {
		"wpn_fps_pis_judge_body_standard",
		"wpn_fps_pis_judge_b_standard",
		"wpn_fps_pis_judge_g_standard"
	}
	self.wpn_fps_pis_judge.uses_parts = {
		"wpn_fps_pis_judge_body_standard",
		"wpn_fps_pis_judge_b_standard",
		"wpn_fps_pis_judge_g_standard",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_ns_shot_thick",
		"wpn_fps_upg_ns_shot_shark",
		"wpn_fps_upg_shot_ns_king",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs"
	}
	self.wpn_fps_pis_judge_npc = deep_clone(self.wpn_fps_pis_judge)
	self.wpn_fps_pis_judge_npc.unit = "units/pd2_million/weapons/wpn_fps_pis_judge/wpn_fps_pis_judge_npc"
end

function WeaponFactoryTweakData_37:_init_m45()
	self.parts.wpn_fps_smg_m45_m_mag = {
		type = "magazine",
		name_id = "bm_wp_shorty_m_extended_short",
		texture_bundle_folder = "dlc1",
		a_obj = "a_m",
		unit = "units/pd2_dlc1/weapons/wpn_fps_smg_m45_pts/wpn_fps_smg_m45_m_mag",
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_smg_m45_m_extended = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "magazine",
		name_id = "bm_wp_smg_m45_m_extended",
		texture_bundle_folder = "dlc1",
		a_obj = "a_m",
		unit = "units/pd2_dlc1/weapons/wpn_fps_smg_m45_pts/wpn_fps_smg_m45_m_extended",
		stats = {
			value = 4,
			concealment = -2,
			extra_ammo = 6
		},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		},
		dlc = "armored_transport"
	}
	self.parts.wpn_fps_smg_m45_b_standard = {
		type = "barrel",
		name_id = "bm_wp_serbu_b_short",
		texture_bundle_folder = "dlc1",
		a_obj = "a_b",
		unit = "units/pd2_dlc1/weapons/wpn_fps_smg_m45_pts/wpn_fps_smg_m45_b_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_m45_b_green = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel",
		name_id = "bm_wp_smg_m45_b_green",
		texture_bundle_folder = "dlc1",
		a_obj = "a_b",
		unit = "units/pd2_dlc1/weapons/wpn_fps_smg_m45_pts/wpn_fps_smg_m45_b_green",
		stats = {
			value = 3,
			spread = 1,
			concealment = -1
		},
		dlc = "armored_transport"
	}
	self.parts.wpn_fps_smg_m45_b_small = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel",
		name_id = "bm_wp_smg_m45_b_small",
		texture_bundle_folder = "dlc1",
		a_obj = "a_b",
		unit = "units/pd2_dlc1/weapons/wpn_fps_smg_m45_pts/wpn_fps_smg_m45_b_small",
		stats = {
			value = 2,
			spread = -2,
			concealment = 3
		},
		dlc = "armored_transport"
	}
	self.parts.wpn_fps_smg_m45_body_standard = {
		type = "upper_reciever",
		name_id = "bm_wp_serbu_s_nostock_short",
		texture_bundle_folder = "dlc1",
		a_obj = "a_body",
		unit = "units/pd2_dlc1/weapons/wpn_fps_smg_m45_pts/wpn_fps_smg_m45_body_standard",
		stats = {value = 1},
		animations = {
			reload = "reload",
			fire_steelsight = "recoil",
			fire = "recoil"
		}
	}
	self.parts.wpn_fps_smg_m45_body_green = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "upper_reciever",
		name_id = "bm_wp_smg_m45_body_green",
		texture_bundle_folder = "dlc1",
		a_obj = "a_body",
		unit = "units/pd2_dlc1/weapons/wpn_fps_smg_m45_pts/wpn_fps_smg_m45_body_green",
		stats = {
			value = 3,
			recoil = 1,
			concealment = -1
		},
		animations = {
			reload = "reload",
			fire_steelsight = "recoil",
			fire = "recoil"
		},
		dlc = "armored_transport"
	}
	self.parts.wpn_fps_smg_m45_s_standard = {
		type = "stock",
		name_id = "bm_wp_serbu_s_solid_short",
		texture_bundle_folder = "dlc1",
		a_obj = "a_s",
		unit = "units/pd2_dlc1/weapons/wpn_fps_smg_m45_pts/wpn_fps_smg_m45_s_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_m45_s_folded = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "stock",
		name_id = "bm_wp_smg_m45_s_folded",
		texture_bundle_folder = "dlc1",
		a_obj = "a_s",
		unit = "units/pd2_dlc1/weapons/wpn_fps_smg_m45_pts/wpn_fps_smg_m45_s_folded",
		stats = {
			value = 2,
			recoil = -2,
			concealment = 6
		},
		dlc = "armored_transport"
	}
	self.parts.wpn_fps_smg_m45_g_standard = {
		type = "grip",
		name_id = "bm_wp_serbu_s_solid_short",
		texture_bundle_folder = "dlc1",
		a_obj = "a_g",
		unit = "units/pd2_dlc1/weapons/wpn_fps_smg_m45_pts/wpn_fps_smg_m45_g_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_m45_g_ergo = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "grip",
		name_id = "bm_wp_smg_m45_g_ergo",
		texture_bundle_folder = "dlc1",
		a_obj = "a_g",
		unit = "units/pd2_dlc1/weapons/wpn_fps_smg_m45_pts/wpn_fps_smg_m45_g_ergo",
		stats = {
			value = 2,
			spread = 1,
			recoil = 1
		},
		dlc = "armored_transport"
	}
	self.parts.wpn_fps_smg_m45_g_bling = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "grip",
		name_id = "bm_wp_smg_m45_g_bling",
		texture_bundle_folder = "dlc1",
		a_obj = "a_g",
		unit = "units/pd2_dlc1/weapons/wpn_fps_smg_m45_pts/wpn_fps_smg_m45_g_bling",
		stats = {
			value = 2,
			recoil = 2,
			concealment = -1
		},
		dlc = "armored_transport"
	}
	self.parts.wpn_fps_smg_m45_m_mag.third_unit = "units/pd2_dlc1/weapons/wpn_third_smg_m45_pts/wpn_third_smg_m45_m_mag"
	self.parts.wpn_fps_smg_m45_b_standard.third_unit = "units/pd2_dlc1/weapons/wpn_third_smg_m45_pts/wpn_third_smg_m45_b_standard"
	self.parts.wpn_fps_smg_m45_body_standard.third_unit = "units/pd2_dlc1/weapons/wpn_third_smg_m45_pts/wpn_third_smg_m45_body_standard"
	self.parts.wpn_fps_smg_m45_s_standard.third_unit = "units/pd2_dlc1/weapons/wpn_third_smg_m45_pts/wpn_third_smg_m45_s_standard"
	self.parts.wpn_fps_smg_m45_g_standard.third_unit = "units/pd2_dlc1/weapons/wpn_third_smg_m45_pts/wpn_third_smg_m45_g_standard"
	self.parts.wpn_fps_smg_m45_b_small.third_unit = "units/pd2_dlc1/weapons/wpn_third_smg_m45_pts/wpn_third_smg_m45_b_small"
	self.parts.wpn_fps_smg_m45_body_green.third_unit = "units/pd2_dlc1/weapons/wpn_third_smg_m45_pts/wpn_third_smg_m45_body_green"
	self.parts.wpn_fps_smg_m45_s_folded.third_unit = "units/pd2_dlc1/weapons/wpn_third_smg_m45_pts/wpn_third_smg_m45_s_folded"
	self.parts.wpn_fps_smg_m45_g_bling.third_unit = "units/pd2_dlc1/weapons/wpn_third_smg_m45_pts/wpn_third_smg_m45_g_bling"
	self.parts.wpn_fps_smg_m45_g_ergo.third_unit = "units/pd2_dlc1/weapons/wpn_third_smg_m45_pts/wpn_third_smg_m45_g_ergo"
	self.parts.wpn_fps_smg_m45_m_extended.third_unit = "units/pd2_dlc1/weapons/wpn_third_smg_m45_pts/wpn_third_smg_m45_m_extended"
	self.parts.wpn_fps_smg_m45_b_green.third_unit = "units/pd2_dlc1/weapons/wpn_third_smg_m45_pts/wpn_third_smg_m45_b_green"
	self.wpn_fps_smg_m45 = {}
	self.wpn_fps_smg_m45.unit = "units/pd2_dlc1/weapons/wpn_fps_smg_m45/wpn_fps_smg_m45"
	self.wpn_fps_smg_m45.optional_types = {"barrel_ext", "gadget"}
	self.wpn_fps_smg_m45.adds = {
		wpn_fps_upg_o_specter = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_aimpoint = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_aimpoint_2 = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_docter = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_eotech = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_t1micro = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_cmore = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_acog = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_cs = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_eotech_xps = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_reflex = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_rx01 = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_rx30 = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_fl_ass_smg_sho_surefire = {
			"wpn_fps_shot_r870_gadget_rail"
		},
		wpn_fps_upg_fl_ass_smg_sho_peqbox = {
			"wpn_fps_shot_r870_gadget_rail"
		},
		wpn_fps_upg_fl_ass_peq15 = {
			"wpn_fps_shot_r870_gadget_rail"
		},
		wpn_fps_upg_fl_ass_laser = {
			"wpn_fps_shot_r870_gadget_rail"
		}
	}
	self.wpn_fps_smg_m45.default_blueprint = {
		"wpn_fps_smg_m45_m_mag",
		"wpn_fps_smg_m45_b_standard",
		"wpn_fps_smg_m45_body_standard",
		"wpn_fps_smg_m45_s_standard",
		"wpn_fps_smg_m45_g_standard"
	}
	self.wpn_fps_smg_m45.uses_parts = {
		"wpn_fps_smg_m45_m_mag",
		"wpn_fps_smg_m45_b_standard",
		"wpn_fps_smg_m45_body_standard",
		"wpn_fps_smg_m45_s_standard",
		"wpn_fps_smg_m45_g_standard",
		"wpn_fps_smg_m45_m_extended",
		"wpn_fps_smg_m45_b_small",
		"wpn_fps_smg_m45_b_green",
		"wpn_fps_smg_m45_body_green",
		"wpn_fps_smg_m45_s_folded",
		"wpn_fps_smg_m45_g_bling",
		"wpn_fps_smg_m45_g_ergo",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser"
	}
	self.wpn_fps_smg_m45_npc = deep_clone(self.wpn_fps_smg_m45)
	self.wpn_fps_smg_m45_npc.unit = "units/pd2_dlc1/weapons/wpn_fps_smg_m45/wpn_fps_smg_m45_npc"
end

function WeaponFactoryTweakData_37:_init_s552()
	self.parts.wpn_fps_ass_s552_o_flipup = {
		type = "sight",
		name_id = "bm_wp_shorty_m_extended_short",
		texture_bundle_folder = "dlc1",
		a_obj = "a_of",
		unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_o_flipup",
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_s552_m_standard = {
		type = "magazine",
		name_id = "bm_wp_shorty_m_extended_short",
		texture_bundle_folder = "dlc1",
		a_obj = "a_m",
		unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_m_standard",
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_ass_s552_b_standard = {
		type = "barrel",
		name_id = "bm_wp_serbu_b_short",
		texture_bundle_folder = "dlc1",
		a_obj = "a_b",
		unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_b_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_s552_b_long = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel",
		name_id = "bm_wp_ass_s552_b_long",
		texture_bundle_folder = "dlc1",
		a_obj = "a_b",
		unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_b_long",
		stats = {
			value = 6,
			spread = 1,
			damage = 1,
			spread_moving = -4,
			concealment = -4
		},
		dlc = "armored_transport"
	}
	self.parts.wpn_fps_ass_s552_body_standard = {
		type = "upper_reciever",
		name_id = "bm_wp_serbu_s_nostock_short",
		texture_bundle_folder = "dlc1",
		a_obj = "a_body",
		unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_body_standard",
		stats = {value = 1},
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	}
	self.parts.wpn_fps_ass_s552_body_standard_black = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "upper_reciever",
		name_id = "bm_wp_ass_s552_body_standard_black",
		texture_bundle_folder = "dlc1",
		a_obj = "a_body",
		unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_body_standard_black",
		stats = {
			value = 7,
			spread = -1,
			damage = 1,
			concealment = 4
		},
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil"
		},
		dlc = "armored_transport"
	}
	self.parts.wpn_fps_ass_s552_fg_standard = {
		type = "foregrip",
		name_id = "bm_wp_serbu_s_nostock_short",
		texture_bundle_folder = "dlc1",
		a_obj = "a_fg",
		unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_fg_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_s552_fg_standard_green = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "foregrip",
		name_id = "bm_wp_ass_s552_fg_standard_green",
		texture_bundle_folder = "dlc1",
		a_obj = "a_fg",
		unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_fg_standard_green",
		stats = {
			value = 1,
			spread = 2,
			concealment = -4
		},
		dlc = "armored_transport"
	}
	self.parts.wpn_fps_ass_s552_fg_railed = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "foregrip",
		name_id = "bm_wp_ass_s552_fg_railed",
		texture_bundle_folder = "dlc1",
		a_obj = "a_fg",
		unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_fg_railed",
		stats = {
			value = 7,
			spread_moving = -2,
			recoil = 5,
			concealment = -2
		},
		forbids = {
			"wpn_fps_addon_ris"
		},
		dlc = "armored_transport"
	}
	self.parts.wpn_fps_ass_s552_g_standard = {
		type = "grip",
		name_id = "bm_wp_serbu_s_solid_short",
		texture_bundle_folder = "dlc1",
		a_obj = "a_g",
		unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_g_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_s552_g_standard_green = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "grip",
		name_id = "bm_wp_ass_s552_g_standard_green",
		texture_bundle_folder = "dlc1",
		a_obj = "a_g",
		unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_g_standard_green",
		stats = {
			value = 4,
			recoil = 2,
			concealment = -2
		},
		dlc = "armored_transport"
	}
	self.parts.wpn_fps_ass_s552_s_m4 = {
		type = "stock",
		name_id = "bm_wp_serbu_s_solid_short",
		texture_bundle_folder = "dlc1",
		a_obj = "a_s",
		unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_s_m4",
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_s552_s_standard = {
		type = "stock",
		name_id = "bm_wp_serbu_s_solid_short",
		texture_bundle_folder = "dlc1",
		a_obj = "a_s",
		unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_s_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_s552_s_standard_green = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "stock",
		name_id = "bm_wp_ass_s552_s_standard_green",
		texture_bundle_folder = "dlc1",
		a_obj = "a_s",
		unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_s_standard_green",
		stats = {
			value = 4,
			recoil = 2,
			concealment = -2
		},
		dlc = "armored_transport"
	}
	self.parts.wpn_fps_ass_s552_o_flipup.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_o_flipup"
	self.parts.wpn_fps_ass_s552_m_standard.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_m_standard"
	self.parts.wpn_fps_ass_s552_b_standard.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_b_standard"
	self.parts.wpn_fps_ass_s552_body_standard.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_body_standard"
	self.parts.wpn_fps_ass_s552_fg_standard.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_fg_standard"
	self.parts.wpn_fps_ass_s552_fg_railed.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_fg_railed"
	self.parts.wpn_fps_ass_s552_g_standard.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_g_standard"
	self.parts.wpn_fps_ass_s552_s_m4.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_s_m4"
	self.parts.wpn_fps_ass_s552_s_standard.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_s_standard"
	self.parts.wpn_fps_ass_s552_b_long.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_b_long"
	self.parts.wpn_fps_ass_s552_body_standard_black.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_body_standard_black"
	self.parts.wpn_fps_ass_s552_fg_standard_green.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_fg_standard_green"
	self.parts.wpn_fps_ass_s552_g_standard_green.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_g_standard_green"
	self.parts.wpn_fps_ass_s552_s_standard_green.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_s_standard_green"
	self.wpn_fps_ass_s552 = {}
	self.wpn_fps_ass_s552.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552/wpn_fps_ass_s552"
	self.wpn_fps_ass_s552.optional_types = {"barrel_ext", "gadget"}
	self.wpn_fps_ass_s552.stock_adapter = "wpn_fps_ass_s552_s_m4"
	self.wpn_fps_ass_s552.adds = {
		wpn_fps_upg_fl_ass_smg_sho_surefire = {
			"wpn_fps_addon_ris"
		},
		wpn_fps_upg_fl_ass_smg_sho_peqbox = {
			"wpn_fps_addon_ris"
		},
		wpn_fps_upg_fl_ass_peq15 = {
			"wpn_fps_addon_ris"
		},
		wpn_fps_upg_fl_ass_laser = {
			"wpn_fps_addon_ris"
		}
	}
	self.wpn_fps_ass_s552.default_blueprint = {
		"wpn_fps_ass_s552_o_flipup",
		"wpn_fps_ass_s552_m_standard",
		"wpn_fps_ass_s552_b_standard",
		"wpn_fps_ass_s552_body_standard",
		"wpn_fps_ass_s552_fg_standard",
		"wpn_fps_ass_s552_s_standard",
		"wpn_fps_ass_s552_g_standard"
	}
	self.wpn_fps_ass_s552.uses_parts = {
		"wpn_fps_ass_s552_o_flipup",
		"wpn_fps_ass_s552_m_standard",
		"wpn_fps_ass_s552_b_standard",
		"wpn_fps_ass_s552_b_long",
		"wpn_fps_ass_s552_body_standard",
		"wpn_fps_ass_s552_body_standard_black",
		"wpn_fps_ass_s552_fg_standard",
		"wpn_fps_ass_s552_fg_railed",
		"wpn_fps_ass_s552_fg_standard_green",
		"wpn_fps_ass_s552_s_standard",
		"wpn_fps_ass_s552_s_m4",
		"wpn_fps_ass_s552_s_standard_green",
		"wpn_fps_ass_s552_g_standard",
		"wpn_fps_ass_s552_g_standard_green",
		"wpn_fps_upg_m4_s_standard_vanilla",
		"wpn_fps_upg_m4_s_pts",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_i_singlefire",
		"wpn_fps_upg_i_autofire",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser",
		"wpn_fps_upg_m4_s_crane",
		"wpn_fps_upg_m4_s_mk46"
	}
	self.wpn_fps_ass_s552_npc = deep_clone(self.wpn_fps_ass_s552)
	self.wpn_fps_ass_s552_npc.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552/wpn_fps_ass_s552_npc"
	self.wpn_fps_ass_s552_secondary = deep_clone(self.wpn_fps_ass_s552)
	self.wpn_fps_ass_s552_secondary.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552/wpn_fps_ass_s552_secondary"
	self.wpn_fps_ass_s552_secondary_npc = deep_clone(self.wpn_fps_ass_s552_npc)
	self.wpn_fps_ass_s552_secondary_npc.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552/wpn_fps_ass_s552_secondary_npc"
end

function WeaponFactoryTweakData_37:_init_ppk()
	self.parts.wpn_fps_pis_ppk_b_long = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "slide",
		name_id = "bm_wp_pis_ppk_b_long",
		texture_bundle_folder = "dlc1",
		a_obj = "a_b",
		unit = "units/pd2_dlc1/weapons/wpn_fps_pis_ppk_pts/wpn_fps_pis_ppk_b_long",
		stats = {
			value = 3,
			damage = 1,
			spread = 2,
			spread_moving = -2,
			concealment = -2
		},
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil"
		},
		dlc = "armored_transport"
	}
	self.parts.wpn_fps_pis_ppk_b_standard = {
		type = "slide",
		name_id = "bm_wp_sppk_b_standard",
		texture_bundle_folder = "dlc1",
		a_obj = "a_b",
		unit = "units/pd2_dlc1/weapons/wpn_fps_pis_ppk_pts/wpn_fps_pis_ppk_b_standard",
		stats = {value = 1},
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	}
	self.parts.wpn_fps_pis_ppk_body_standard = {
		type = "lower_reciever",
		name_id = "bm_wp_serbu_s_solid_short",
		texture_bundle_folder = "dlc1",
		a_obj = "a_body",
		unit = "units/pd2_dlc1/weapons/wpn_fps_pis_ppk_pts/wpn_fps_pis_ppk_body_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_ppk_fl_mount = {
		type = "extra",
		name_id = "bm_wp_serbu_s_solid_short",
		texture_bundle_folder = "dlc1",
		a_obj = "a_fl",
		unit = "units/pd2_dlc1/weapons/wpn_fps_pis_ppk_pts/wpn_fps_pis_ppk_fl_mount",
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_ppk_g_laser = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "grip",
		name_id = "bm_wp_pis_ppk_g_laser",
		texture_bundle_folder = "dlc1",
		a_obj = "a_g",
		unit = "units/pd2_dlc1/weapons/wpn_fps_pis_ppk_pts/wpn_fps_pis_ppk_g_laser",
		stats = {value = 1, spread = 2},
		perks = {"gadget"},
		dlc = "armored_transport"
	}
	self.parts.wpn_fps_pis_ppk_g_standard = {
		type = "grip",
		name_id = "bm_wp_serbu_s_solid_short",
		texture_bundle_folder = "dlc1",
		a_obj = "a_g",
		unit = "units/pd2_dlc1/weapons/wpn_fps_pis_ppk_pts/wpn_fps_pis_ppk_g_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_ppk_m_standard = {
		type = "magazine",
		name_id = "bm_wp_serbu_s_solid_short",
		texture_bundle_folder = "dlc1",
		a_obj = "a_m",
		unit = "units/pd2_dlc1/weapons/wpn_fps_pis_ppk_pts/wpn_fps_pis_ppk_m_standard",
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_pis_ppk_b_long.third_unit = "units/pd2_dlc1/weapons/wpn_third_pis_ppk_pts/wpn_third_pis_ppk_b_long"
	self.parts.wpn_fps_pis_ppk_b_standard.third_unit = "units/pd2_dlc1/weapons/wpn_third_pis_ppk_pts/wpn_third_pis_ppk_b_standard"
	self.parts.wpn_fps_pis_ppk_body_standard.third_unit = "units/pd2_dlc1/weapons/wpn_third_pis_ppk_pts/wpn_third_pis_ppk_body_standard"
	self.parts.wpn_fps_pis_ppk_fl_mount.third_unit = "units/pd2_dlc1/weapons/wpn_third_pis_ppk_pts/wpn_third_pis_ppk_fl_mount"
	self.parts.wpn_fps_pis_ppk_g_laser.third_unit = "units/pd2_dlc1/weapons/wpn_third_pis_ppk_pts/wpn_third_pis_ppk_g_laser"
	self.parts.wpn_fps_pis_ppk_g_standard.third_unit = "units/pd2_dlc1/weapons/wpn_third_pis_ppk_pts/wpn_third_pis_ppk_g_standard"
	self.parts.wpn_fps_pis_ppk_m_standard.third_unit = "units/pd2_dlc1/weapons/wpn_third_pis_ppk_pts/wpn_third_pis_ppk_m_standard"
	self.wpn_fps_pis_ppk = {}
	self.wpn_fps_pis_ppk.unit = "units/pd2_dlc1/weapons/wpn_fps_pis_ppk/wpn_fps_pis_ppk"
	self.wpn_fps_pis_ppk.animations = {
		fire = "recoil",
		fire_steelsight = "recoil",
		reload = "reload"
	}
	self.wpn_fps_pis_ppk.optional_types = {"barrel_ext", "gadget"}
	self.wpn_fps_pis_ppk.adds = {
		wpn_fps_upg_fl_pis_laser = {
			"wpn_fps_pis_ppk_fl_mount"
		},
		wpn_fps_upg_fl_pis_tlr1 = {
			"wpn_fps_pis_ppk_fl_mount"
		}
	}
	self.wpn_fps_pis_ppk.override = {
		wpn_fps_upg_o_rmr = {parent = "slide"}
	}
	self.wpn_fps_pis_ppk.default_blueprint = {
		"wpn_fps_pis_ppk_b_standard",
		"wpn_fps_pis_ppk_body_standard",
		"wpn_fps_pis_ppk_g_standard",
		"wpn_fps_pis_ppk_m_standard"
	}
	self.wpn_fps_pis_ppk.uses_parts = {
		"wpn_fps_pis_ppk_b_standard",
		"wpn_fps_pis_ppk_b_long",
		"wpn_fps_pis_ppk_body_standard",
		"wpn_fps_pis_ppk_g_standard",
		"wpn_fps_pis_ppk_g_laser",
		"wpn_fps_pis_ppk_m_standard",
		"wpn_fps_pis_ppk_fl_mount",
		"wpn_fps_upg_fl_pis_laser",
		"wpn_fps_upg_fl_pis_tlr1",
		"wpn_fps_upg_ns_pis_large",
		"wpn_fps_upg_ns_pis_medium",
		"wpn_fps_upg_ns_pis_small",
		"wpn_fps_upg_ns_pis_large_kac",
		"wpn_fps_upg_ns_pis_medium_gem",
		"wpn_fps_upg_o_rmr",
		"wpn_fps_upg_ns_pis_medium_slim",
		"wpn_fps_upg_pis_ns_flash"
	}
	self.wpn_fps_pis_ppk_npc = deep_clone(self.wpn_fps_pis_ppk)
	self.wpn_fps_pis_ppk_npc.unit = "units/pd2_dlc1/weapons/wpn_fps_pis_ppk/wpn_fps_pis_ppk_npc"
end

function WeaponFactoryTweakData_37:_init_mp7()
	self.parts.wpn_fps_smg_mp7_m_short = {
		type = "magazine",
		name_id = "bm_wp_mp7_m_short",
		texture_bundle_folder = "gage_pack",
		a_obj = "a_m",
		unit = "units/pd2_dlc_dec5/weapons/wpn_fps_smg_mp7_pts/wpn_fps_smg_mp7_m_short",
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_smg_mp7_m_extended = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "magazine",
		name_id = "bm_wp_mp7_m_extended",
		texture_bundle_folder = "gage_pack",
		a_obj = "a_m",
		unit = "units/pd2_dlc_dec5/weapons/wpn_fps_smg_mp7_pts/wpn_fps_smg_mp7_m_extended",
		stats = {
			value = 1,
			spread_moving = -1,
			concealment = -3,
			extra_ammo = 6
		},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		},
		dlc = "gage_pack"
	}
	self.parts.wpn_fps_smg_mp7_b_standard = {
		type = "barrel",
		name_id = "bm_wp_mp7_b_standard",
		texture_bundle_folder = "gage_pack",
		a_obj = "a_b",
		unit = "units/pd2_dlc_dec5/weapons/wpn_fps_smg_mp7_pts/wpn_fps_smg_mp7_b_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_mp7_b_suppressed = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel_ext",
		sub_type = "silencer",
		name_id = "bm_wp_mp7_b_suppressed",
		texture_bundle_folder = "gage_pack",
		a_obj = "a_ns",
		parent = "barrel",
		unit = "units/pd2_dlc_dec5/weapons/wpn_fps_smg_mp7_pts/wpn_fps_smg_mp7_b_suppressed",
		stats = {
			value = 4,
			spread = 1,
			suppression = 12,
			alert_size = 12,
			damage = -1,
			recoil = 3,
			spread_moving = -2,
			concealment = -2
		},
		perks = {"silencer"},
		sound_switch = {
			suppressed = "suppressed_b"
		},
		dlc = "gage_pack"
	}
	self.parts.wpn_fps_smg_mp7_body_standard = {
		type = "upper_reciever",
		name_id = "bm_wp_mp7_body_standard",
		texture_bundle_folder = "gage_pack",
		a_obj = "a_body",
		unit = "units/pd2_dlc_dec5/weapons/wpn_fps_smg_mp7_pts/wpn_fps_smg_mp7_body_standard",
		stats = {value = 1},
		adds = {
			"wpn_fps_upg_vg_ass_smg_stubby"
		}
	}
	self.parts.wpn_fps_smg_mp7_s_standard = {
		type = "stock",
		name_id = "bm_wp_mp7_s_standard",
		texture_bundle_folder = "gage_pack",
		a_obj = "a_s",
		unit = "units/pd2_dlc_dec5/weapons/wpn_fps_smg_mp7_pts/wpn_fps_smg_mp7_s_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_mp7_s_long = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "stock",
		name_id = "bm_wp_mp7_s_long",
		texture_bundle_folder = "gage_pack",
		a_obj = "a_s",
		unit = "units/pd2_dlc_dec5/weapons/wpn_fps_smg_mp7_pts/wpn_fps_smg_mp7_s_long",
		stats = {
			value = 1,
			recoil = 2,
			spread_moving = -1,
			concealment = -2
		},
		dlc = "gage_pack"
	}
	self.parts.wpn_fps_smg_mp7_m_short.third_unit = "units/pd2_dlc_dec5/weapons/wpn_third_smg_mp7_pts/wpn_third_smg_mp7_m_short"
	self.parts.wpn_fps_smg_mp7_m_extended.third_unit = "units/pd2_dlc_dec5/weapons/wpn_third_smg_mp7_pts/wpn_third_smg_mp7_m_extended"
	self.parts.wpn_fps_smg_mp7_b_standard.third_unit = "units/pd2_dlc_dec5/weapons/wpn_third_smg_mp7_pts/wpn_third_smg_mp7_b_standard"
	self.parts.wpn_fps_smg_mp7_b_suppressed.third_unit = "units/pd2_dlc_dec5/weapons/wpn_third_smg_mp7_pts/wpn_third_smg_mp7_b_suppressed"
	self.parts.wpn_fps_smg_mp7_body_standard.third_unit = "units/pd2_dlc_dec5/weapons/wpn_third_smg_mp7_pts/wpn_third_smg_mp7_body_standard"
	self.parts.wpn_fps_smg_mp7_s_standard.third_unit = "units/pd2_dlc_dec5/weapons/wpn_third_smg_mp7_pts/wpn_third_smg_mp7_s_standard"
	self.parts.wpn_fps_smg_mp7_s_long.third_unit = "units/pd2_dlc_dec5/weapons/wpn_third_smg_mp7_pts/wpn_third_smg_mp7_s_long"
	self.wpn_fps_smg_mp7 = {}
	self.wpn_fps_smg_mp7.unit = "units/pd2_dlc_dec5/weapons/wpn_fps_smg_mp7/wpn_fps_smg_mp7"
	self.wpn_fps_smg_mp7.optional_types = {"barrel_ext", "gadget"}
	self.wpn_fps_smg_mp7.default_blueprint = {
		"wpn_fps_smg_mp7_m_short",
		"wpn_fps_smg_mp7_b_standard",
		"wpn_fps_smg_mp7_body_standard",
		"wpn_fps_smg_mp7_s_standard"
	}
	self.wpn_fps_smg_mp7.uses_parts = {
		"wpn_fps_smg_mp7_m_short",
		"wpn_fps_smg_mp7_b_standard",
		"wpn_fps_smg_mp7_body_standard",
		"wpn_fps_smg_mp7_s_standard",
		"wpn_fps_smg_mp7_m_extended",
		"wpn_fps_smg_mp7_b_suppressed",
		"wpn_fps_smg_mp7_s_long",
		"wpn_fps_upg_vg_ass_smg_stubby",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_i_singlefire",
		"wpn_fps_upg_i_autofire",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser"
	}
	self.wpn_fps_smg_mp7_npc = deep_clone(self.wpn_fps_smg_mp7)
	self.wpn_fps_smg_mp7_npc.unit = "units/pd2_dlc_dec5/weapons/wpn_fps_smg_mp7/wpn_fps_smg_mp7_npc"
end

function WeaponFactoryTweakData_37:_init_scar()
	self.parts.wpn_fps_ass_scar_m_standard = {
		type = "magazine",
		name_id = "bm_wp_scar_m_standard",
		texture_bundle_folder = "gage_pack",
		a_obj = "a_m",
		unit = "units/pd2_dlc_dec5/weapons/wpn_fps_ass_scar_pts/wpn_fps_ass_scar_m_standard",
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_ass_scar_ns_standard = {
		type = "barrel_ext",
		name_id = "bm_wp_scar_ns_standard",
		texture_bundle_folder = "gage_pack",
		a_obj = "a_ns",
		parent = "barrel",
		unit = "units/pd2_dlc_dec5/weapons/wpn_fps_ass_scar_pts/wpn_fps_ass_scar_ns_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_scar_ns_short = {
		type = "barrel_ext",
		name_id = "bm_wp_scar_ns_short",
		texture_bundle_folder = "gage_pack",
		a_obj = "a_ns",
		parent = "barrel",
		unit = "units/pd2_dlc_dec5/weapons/wpn_fps_ass_scar_pts/wpn_fps_ass_scar_ns_short",
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_scar_b_long = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel",
		name_id = "bm_wp_scar_b_long",
		texture_bundle_folder = "gage_pack",
		a_obj = "a_b",
		unit = "units/pd2_dlc_dec5/weapons/wpn_fps_ass_scar_pts/wpn_fps_ass_scar_b_long",
		stats = {
			value = 4,
			spread = 2,
			spread_moving = -3,
			concealment = -3
		},
		dlc = "gage_pack"
	}
	self.parts.wpn_fps_ass_scar_b_medium = {
		type = "barrel",
		name_id = "bm_wp_scar_b_medium",
		texture_bundle_folder = "gage_pack",
		a_obj = "a_b",
		unit = "units/pd2_dlc_dec5/weapons/wpn_fps_ass_scar_pts/wpn_fps_ass_scar_b_medium",
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_scar_b_short = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel",
		name_id = "bm_wp_scar_b_short",
		texture_bundle_folder = "gage_pack",
		a_obj = "a_b",
		unit = "units/pd2_dlc_dec5/weapons/wpn_fps_ass_scar_pts/wpn_fps_ass_scar_b_short",
		stats = {
			value = 3,
			damage = 1,
			suppression = -2,
			spread = -1,
			spread_moving = 3,
			concealment = 3
		},
		dlc = "gage_pack",
		override = {
			wpn_fps_ass_scar_ns_standard = {
				unit = "units/pd2_dlc_dec5/weapons/wpn_fps_ass_scar_pts/wpn_fps_ass_scar_ns_short",
				third_unit = "units/pd2_dlc_dec5/weapons/wpn_third_ass_scar_pts/wpn_third_ass_scar_ns_short"
			}
		}
	}
	self.parts.wpn_fps_ass_scar_body_standard = {
		type = "upper_reciever",
		name_id = "bm_wp_scar_body_standard",
		texture_bundle_folder = "gage_pack",
		a_obj = "a_body",
		unit = "units/pd2_dlc_dec5/weapons/wpn_fps_ass_scar_pts/wpn_fps_ass_scar_body_standard",
		stats = {value = 1},
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	}
	self.parts.wpn_fps_ass_scar_fg_railext = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "foregrip",
		name_id = "bm_wp_scar_fg_railext",
		texture_bundle_folder = "gage_pack",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_dec5/weapons/wpn_fps_ass_scar_pts/wpn_fps_ass_scar_fg_railext",
		stats = {
			value = 4,
			recoil = 1,
			spread_moving = -1,
			concealment = -1
		},
		dlc = "gage_pack"
	}
	self.parts.wpn_fps_ass_scar_o_flipups_down = {
		type = "extra",
		name_id = "bm_wp_scar_o_flipups_down",
		texture_bundle_folder = "gage_pack",
		a_obj = "a_o",
		unit = "units/pd2_dlc_dec5/weapons/wpn_fps_ass_scar_pts/wpn_fps_ass_scar_o_flipups_down",
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_scar_o_flipups_up = {
		type = "sight",
		name_id = "bm_wp_scar_o_flipups_up",
		texture_bundle_folder = "gage_pack",
		a_obj = "a_o",
		unit = "units/pd2_dlc_dec5/weapons/wpn_fps_ass_scar_pts/wpn_fps_ass_scar_o_flipups_up",
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_scar_s_sniper = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "stock",
		name_id = "bm_wp_scar_s_sniper",
		texture_bundle_folder = "gage_pack",
		a_obj = "a_s",
		unit = "units/pd2_dlc_dec5/weapons/wpn_fps_ass_scar_pts/wpn_fps_ass_scar_s_sniper",
		stats = {
			value = 4,
			recoil = 2,
			spread_moving = -3,
			concealment = -3
		},
		dlc = "gage_pack"
	}
	self.parts.wpn_fps_ass_scar_s_standard = {
		type = "stock",
		name_id = "bm_wp_scar_s_standard",
		texture_bundle_folder = "gage_pack",
		a_obj = "a_s",
		unit = "units/pd2_dlc_dec5/weapons/wpn_fps_ass_scar_pts/wpn_fps_ass_scar_s_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_scar_m_standard.third_unit = "units/pd2_dlc_dec5/weapons/wpn_third_ass_scar_pts/wpn_third_ass_scar_m_standard"
	self.parts.wpn_fps_ass_scar_ns_standard.third_unit = "units/pd2_dlc_dec5/weapons/wpn_third_ass_scar_pts/wpn_third_ass_scar_ns_standard"
	self.parts.wpn_fps_ass_scar_ns_short.third_unit = "units/pd2_dlc_dec5/weapons/wpn_third_ass_scar_pts/wpn_third_ass_scar_ns_short"
	self.parts.wpn_fps_ass_scar_b_long.third_unit = "units/pd2_dlc_dec5/weapons/wpn_third_ass_scar_pts/wpn_third_ass_scar_b_long"
	self.parts.wpn_fps_ass_scar_b_medium.third_unit = "units/pd2_dlc_dec5/weapons/wpn_third_ass_scar_pts/wpn_third_ass_scar_b_medium"
	self.parts.wpn_fps_ass_scar_b_short.third_unit = "units/pd2_dlc_dec5/weapons/wpn_third_ass_scar_pts/wpn_third_ass_scar_b_short"
	self.parts.wpn_fps_ass_scar_body_standard.third_unit = "units/pd2_dlc_dec5/weapons/wpn_third_ass_scar_pts/wpn_third_ass_scar_body_standard"
	self.parts.wpn_fps_ass_scar_fg_railext.third_unit = "units/pd2_dlc_dec5/weapons/wpn_third_ass_scar_pts/wpn_third_ass_scar_fg_railext"
	self.parts.wpn_fps_ass_scar_s_sniper.third_unit = "units/pd2_dlc_dec5/weapons/wpn_third_ass_scar_pts/wpn_third_ass_scar_s_sniper"
	self.parts.wpn_fps_ass_scar_s_standard.third_unit = "units/pd2_dlc_dec5/weapons/wpn_third_ass_scar_pts/wpn_third_ass_scar_s_standard"
	self.parts.wpn_fps_ass_scar_o_flipups_down.third_unit = "units/pd2_dlc_dec5/weapons/wpn_third_ass_scar_pts/wpn_third_ass_scar_o_flipups_down"
	self.parts.wpn_fps_ass_scar_o_flipups_up.third_unit = "units/pd2_dlc_dec5/weapons/wpn_third_ass_scar_pts/wpn_third_ass_scar_o_flipups_up"
	self.wpn_fps_ass_scar = {}
	self.wpn_fps_ass_scar.unit = "units/pd2_dlc_dec5/weapons/wpn_fps_ass_scar/wpn_fps_ass_scar"
	self.wpn_fps_ass_scar.optional_types = {"barrel_ext", "gadget"}
	self.wpn_fps_ass_scar.override = {}
	self.wpn_fps_ass_scar.adds = {
		wpn_fps_upg_o_specter = {
			"wpn_fps_ass_scar_o_flipups_down"
		},
		wpn_fps_upg_o_aimpoint = {
			"wpn_fps_ass_scar_o_flipups_down"
		},
		wpn_fps_upg_o_aimpoint_2 = {
			"wpn_fps_ass_scar_o_flipups_down"
		},
		wpn_fps_upg_o_docter = {
			"wpn_fps_ass_scar_o_flipups_down"
		},
		wpn_fps_upg_o_eotech = {
			"wpn_fps_ass_scar_o_flipups_down"
		},
		wpn_fps_upg_o_t1micro = {
			"wpn_fps_ass_scar_o_flipups_down"
		},
		wpn_fps_upg_o_cmore = {
			"wpn_fps_ass_scar_o_flipups_down"
		},
		wpn_fps_upg_o_acog = {
			"wpn_fps_ass_scar_o_flipups_down"
		},
		wpn_fps_upg_o_cs = {
			"wpn_fps_ass_scar_o_flipups_down"
		},
		wpn_fps_upg_o_eotech_xps = {
			"wpn_fps_ass_scar_o_flipups_down"
		},
		wpn_fps_upg_o_reflex = {
			"wpn_fps_ass_scar_o_flipups_down"
		},
		wpn_fps_upg_o_rx01 = {
			"wpn_fps_ass_scar_o_flipups_down"
		},
		wpn_fps_upg_o_rx30 = {
			"wpn_fps_ass_scar_o_flipups_down"
		}
	}
	self.wpn_fps_ass_scar.default_blueprint = {
		"wpn_fps_ass_scar_m_standard",
		"wpn_fps_ass_scar_b_medium",
		"wpn_fps_ass_scar_body_standard",
		"wpn_fps_ass_scar_s_standard",
		"wpn_fps_ass_scar_o_flipups_up",
		"wpn_fps_upg_m4_g_hgrip_vanilla",
		"wpn_fps_upg_vg_ass_smg_afg",
		"wpn_fps_ass_scar_ns_standard"
	}
	self.wpn_fps_ass_scar.uses_parts = {
		"wpn_fps_ass_scar_m_standard",
		"wpn_fps_ass_scar_ns_standard",
		"wpn_fps_ass_scar_ns_short",
		"wpn_fps_ass_scar_b_medium",
		"wpn_fps_ass_scar_b_long",
		"wpn_fps_ass_scar_b_short",
		"wpn_fps_ass_scar_body_standard",
		"wpn_fps_ass_scar_fg_railext",
		"wpn_fps_ass_scar_s_standard",
		"wpn_fps_ass_scar_s_sniper",
		"wpn_fps_ass_scar_o_flipups_up",
		"wpn_fps_ass_scar_o_flipups_down",
		"wpn_fps_upg_m4_g_hgrip_vanilla",
		"wpn_fps_upg_m4_g_mgrip",
		"wpn_fps_upg_m4_g_ergo",
		"wpn_fps_upg_m4_g_sniper",
		"wpn_fps_upg_vg_ass_smg_afg",
		"wpn_fps_upg_i_singlefire",
		"wpn_fps_upg_i_autofire",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser"
	}
	self.wpn_fps_ass_scar_npc = deep_clone(self.wpn_fps_ass_scar)
	self.wpn_fps_ass_scar_npc.unit = "units/pd2_dlc_dec5/weapons/wpn_fps_ass_scar/wpn_fps_ass_scar_npc"
end

function WeaponFactoryTweakData_37:_init_p226()
	self.parts.wpn_fps_pis_p226_b_standard = {
		type = "slide",
		name_id = "bm_wp_p226_b_standard",
		texture_bundle_folder = "gage_pack",
		a_obj = "a_b",
		unit = "units/pd2_dlc_dec5/weapons/wpn_fps_pis_p226_pts/wpn_fps_pis_p226_b_standard",
		stats = {value = 1},
		adds = {
			"wpn_fps_pis_p226_o_standard"
		},
		forbids = {
			"wpn_fps_pis_p226_o_long"
		},
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	}
	self.parts.wpn_fps_pis_p226_b_equinox = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "slide",
		name_id = "bm_wp_p226_b_equinox",
		texture_bundle_folder = "gage_pack",
		a_obj = "a_b",
		unit = "units/pd2_dlc_dec5/weapons/wpn_fps_pis_p226_pts/wpn_fps_pis_p226_b_equinox",
		stats = {
			value = 4,
			suppression = -2,
			recoil = 1,
			damage = 2,
			spread_moving = 1
		},
		dlc = "gage_pack",
		adds = {
			"wpn_fps_pis_p226_o_standard"
		},
		forbids = {
			"wpn_fps_pis_p226_o_long"
		},
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	}
	self.parts.wpn_fps_pis_p226_b_long = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "slide",
		name_id = "bm_wp_p226_b_long",
		texture_bundle_folder = "gage_pack",
		a_obj = "a_b",
		unit = "units/pd2_dlc_dec5/weapons/wpn_fps_pis_p226_pts/wpn_fps_pis_p226_b_long",
		stats = {
			value = 6,
			damage = 1,
			spread = 2,
			recoil = 1,
			concealment = -3,
			spread_moving = -3
		},
		dlc = "gage_pack",
		adds = {
			"wpn_fps_pis_p226_o_long"
		},
		forbids = {
			"wpn_fps_pis_p226_o_standard"
		},
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	}
	self.parts.wpn_fps_pis_p226_body_standard = {
		type = "lower_reciever",
		name_id = "bm_wp_p226_body_standard",
		texture_bundle_folder = "gage_pack",
		a_obj = "a_body",
		unit = "units/pd2_dlc_dec5/weapons/wpn_fps_pis_p226_pts/wpn_fps_pis_p226_body_standard",
		stats = {value = 1},
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	}
	self.parts.wpn_fps_pis_p226_g_standard = {
		type = "grip",
		name_id = "bm_wp_p226_g_standard",
		texture_bundle_folder = "gage_pack",
		a_obj = "a_g",
		unit = "units/pd2_dlc_dec5/weapons/wpn_fps_pis_p226_pts/wpn_fps_pis_p226_g_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_pis_p226_g_ergo = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "grip",
		name_id = "bm_wp_p226_g_ergo",
		texture_bundle_folder = "gage_pack",
		a_obj = "a_g",
		unit = "units/pd2_dlc_dec5/weapons/wpn_fps_pis_p226_pts/wpn_fps_pis_p226_g_ergo",
		stats = {
			value = 1,
			recoil = 1,
			concealment = -1
		},
		dlc = "gage_pack"
	}
	self.parts.wpn_fps_pis_p226_m_standard = {
		type = "magazine",
		name_id = "bm_wp_p226_m_standard",
		texture_bundle_folder = "gage_pack",
		a_obj = "a_m",
		unit = "units/pd2_dlc_dec5/weapons/wpn_fps_pis_p226_pts/wpn_fps_pis_p226_m_standard",
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_pis_p226_m_extended = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "magazine",
		name_id = "bm_wp_p226_m_extended",
		texture_bundle_folder = "gage_pack",
		a_obj = "a_m",
		unit = "units/pd2_dlc_dec5/weapons/wpn_fps_pis_p226_pts/wpn_fps_pis_p226_m_extended",
		stats = {
			value = 1,
			extra_ammo = 4,
			spread_moving = -2
		},
		dlc = "gage_pack",
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_pis_p226_o_standard = {
		type = "extra",
		name_id = "bm_wp_p226_o_standard",
		texture_bundle_folder = "gage_pack",
		a_obj = "a_o",
		unit = "units/pd2_dlc_dec5/weapons/wpn_fps_pis_p226_pts/wpn_fps_pis_p226_o_standard",
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_pis_p226_o_long = {
		type = "extra",
		name_id = "bm_wp_p226_o_long",
		texture_bundle_folder = "gage_pack",
		a_obj = "a_o",
		unit = "units/pd2_dlc_dec5/weapons/wpn_fps_pis_p226_pts/wpn_fps_pis_p226_o_long",
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_pis_p226_b_standard.third_unit = "units/pd2_dlc_dec5/weapons/wpn_fps_pis_p226_pts/wpn_third_pis_p226_b_standard"
	self.parts.wpn_fps_pis_p226_b_equinox.third_unit = "units/pd2_dlc_dec5/weapons/wpn_fps_pis_p226_pts/wpn_third_pis_p226_b_equinox"
	self.parts.wpn_fps_pis_p226_b_long.third_unit = "units/pd2_dlc_dec5/weapons/wpn_fps_pis_p226_pts/wpn_third_pis_p226_b_long"
	self.parts.wpn_fps_pis_p226_body_standard.third_unit = "units/pd2_dlc_dec5/weapons/wpn_fps_pis_p226_pts/wpn_third_pis_p226_body_standard"
	self.parts.wpn_fps_pis_p226_g_standard.third_unit = "units/pd2_dlc_dec5/weapons/wpn_fps_pis_p226_pts/wpn_third_pis_p226_g_standard"
	self.parts.wpn_fps_pis_p226_g_ergo.third_unit = "units/pd2_dlc_dec5/weapons/wpn_fps_pis_p226_pts/wpn_third_pis_p226_g_ergo"
	self.parts.wpn_fps_pis_p226_m_standard.third_unit = "units/pd2_dlc_dec5/weapons/wpn_fps_pis_p226_pts/wpn_third_pis_p226_m_standard"
	self.parts.wpn_fps_pis_p226_m_extended.third_unit = "units/pd2_dlc_dec5/weapons/wpn_fps_pis_p226_pts/wpn_third_pis_p226_m_extended"
	self.parts.wpn_fps_pis_p226_o_standard.third_unit = "units/pd2_dlc_dec5/weapons/wpn_fps_pis_p226_pts/wpn_third_pis_p226_o_standard"
	self.parts.wpn_fps_pis_p226_o_long.third_unit = "units/pd2_dlc_dec5/weapons/wpn_fps_pis_p226_pts/wpn_third_pis_p226_o_long"
	self.parts.wpn_fps_pis_p226_co_comp_1 = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel_ext",
		name_id = "bm_wp_p226_co_comp_1",
		a_obj = "a_co",
		parent = "slide",
		unit = "units/pd2_dlc_dec5/weapons/wpn_fps_pis_p226_pts/wpn_fps_pis_p226_co_comp_1",
		stats = {
			value = 4,
			suppression = -5,
			damage = 2,
			spread = -1,
			concealment = -1
		},
		dlc = "gage_pack"
	}
	self.parts.wpn_fps_pis_p226_co_comp_2 = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel_ext",
		name_id = "bm_wp_p226_co_comp_2",
		a_obj = "a_co",
		parent = "slide",
		unit = "units/pd2_dlc_dec5/weapons/wpn_fps_pis_p226_pts/wpn_fps_pis_p226_co_comp_2",
		stats = {
			value = 5,
			recoil = 2,
			spread = 2,
			concealment = -1
		},
		dlc = "gage_pack"
	}
	self.parts.wpn_fps_pis_p226_co_comp_2.third_unit = "units/payday2/weapons/wpn_third_pis_g18c_pts/wpn_third_pis_g18c_co_2"
	self.parts.wpn_fps_pis_p226_co_comp_1.third_unit = "units/payday2/weapons/wpn_third_pis_g18c_pts/wpn_third_pis_g18c_co_1"
	self.wpn_fps_pis_p226 = {}
	self.wpn_fps_pis_p226.unit = "units/pd2_dlc_dec5/weapons/wpn_fps_pis_p226/wpn_fps_pis_p226"
	self.wpn_fps_pis_p226.animations = {
		fire = "recoil",
		fire_steelsight = "recoil",
		reload = "reload"
	}
	self.wpn_fps_pis_p226.optional_types = {"barrel_ext", "gadget"}
	self.wpn_fps_pis_p226.override = {
		wpn_fps_upg_o_rmr = {parent = "slide"}
	}
	self.wpn_fps_pis_p226.default_blueprint = {
		"wpn_fps_pis_p226_b_standard",
		"wpn_fps_pis_p226_body_standard",
		"wpn_fps_pis_p226_g_standard",
		"wpn_fps_pis_p226_m_standard",
		"wpn_fps_pis_p226_o_standard"
	}
	self.wpn_fps_pis_p226.uses_parts = {
		"wpn_fps_pis_p226_b_standard",
		"wpn_fps_pis_p226_b_equinox",
		"wpn_fps_pis_p226_b_long",
		"wpn_fps_pis_p226_body_standard",
		"wpn_fps_pis_p226_g_standard",
		"wpn_fps_pis_p226_g_ergo",
		"wpn_fps_pis_p226_m_standard",
		"wpn_fps_pis_p226_m_extended",
		"wpn_fps_pis_p226_o_standard",
		"wpn_fps_pis_p226_o_long",
		"wpn_fps_pis_p226_co_comp_1",
		"wpn_fps_pis_p226_co_comp_2",
		"wpn_fps_upg_fl_pis_laser",
		"wpn_fps_upg_fl_pis_tlr1",
		"wpn_fps_upg_ns_pis_large",
		"wpn_fps_upg_ns_pis_medium",
		"wpn_fps_upg_ns_pis_small",
		"wpn_fps_upg_ns_pis_large_kac",
		"wpn_fps_upg_ns_pis_medium_gem",
		"wpn_fps_upg_o_rmr",
		"wpn_fps_upg_ns_pis_medium_slim",
		"wpn_fps_upg_pis_ns_flash"
	}
	self.wpn_fps_pis_p226_npc = deep_clone(self.wpn_fps_pis_p226)
	self.wpn_fps_pis_p226_npc.unit = "units/pd2_dlc_dec5/weapons/wpn_fps_pis_p226/wpn_fps_pis_p226_npc"
end

function WeaponFactoryTweakData_37:_init_hk21()
	self.parts.wpn_fps_lmg_hk21_b_long = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel",
		name_id = "bm_wp_hk21_b_long",
		a_obj = "a_b",
		parent = "foregrip",
		unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21_pts/wpn_fps_lmg_hk21_b_long",
		stats = {
			value = 4,
			spread = 1,
			recoil = 1,
			damage = -1,
			spread_moving = -2,
			concealment = -2
		},
		texture_bundle_folder = "gage_pack_lmg",
		dlc = "gage_pack_lmg"
	}
	self.parts.wpn_fps_lmg_hk21_b_short = {
		type = "barrel",
		name_id = "bm_wp_hk21_b_hk21a4",
		a_obj = "a_b",
		parent = "foregrip",
		unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21_pts/wpn_fps_lmg_hk21_b_short",
		stats = {value = 1}
	}
	self.parts.wpn_fps_lmg_hk21_body_lower = {
		type = "lower_reciever",
		name_id = "bm_wp_hk21_b_hk21a5",
		a_obj = "a_body",
		unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21_pts/wpn_fps_lmg_hk21_body_lower",
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_lmg_hk21_body_upper = {
		type = "upper_reciever",
		name_id = "bm_wp_hk21_b_hk21sd",
		a_obj = "a_body",
		unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21_pts/wpn_fps_lmg_hk21_body_upper",
		stats = {value = 1}
	}
	self.parts.wpn_fps_lmg_hk21_fg_long = {
		type = "foregrip",
		name_id = "bm_wp_hk21_body_hk21",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21_pts/wpn_fps_lmg_hk21_fg_long",
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	}
	self.parts.wpn_fps_lmg_hk21_fg_short = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "foregrip",
		name_id = "bm_wp_hk21_fg_short",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21_pts/wpn_fps_lmg_hk21_fg_short",
		stats = {
			value = 6,
			spread = -1,
			damage = 1,
			spread_moving = 2,
			concealment = 3
		},
		texture_bundle_folder = "gage_pack_lmg",
		dlc = "gage_pack_lmg",
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	}
	self.parts.wpn_fps_lmg_hk21_g_ergo = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "grip",
		name_id = "bm_wp_hk21_g_ergo",
		a_obj = "a_g",
		unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21_pts/wpn_fps_lmg_hk21_g_ergo",
		stats = {
			value = 3,
			recoil = 1,
			spread_moving = 2,
			concealment = -1
		},
		texture_bundle_folder = "gage_pack_lmg",
		dlc = "gage_pack_lmg"
	}
	self.parts.wpn_fps_lmg_hk21_g_standard = {
		type = "grip",
		name_id = "bm_wp_hk21_body_rail",
		a_obj = "a_g",
		unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21_pts/wpn_fps_lmg_hk21_g_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_lmg_hk21_m_standard = {
		type = "magazine",
		name_id = "bm_wp_hk21_body_rail",
		a_obj = "a_m",
		unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21_pts/wpn_fps_lmg_hk21_m_standard",
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_lmg_hk21_s_standard = {
		type = "stock",
		name_id = "bm_wp_hk21_body_rail",
		a_obj = "a_s",
		unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21_pts/wpn_fps_lmg_hk21_s_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_lmg_hk21_b_long.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21_pts/wpn_third_lmg_hk21_b_long"
	self.parts.wpn_fps_lmg_hk21_b_short.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21_pts/wpn_third_lmg_hk21_b_short"
	self.parts.wpn_fps_lmg_hk21_body_lower.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21_pts/wpn_third_lmg_hk21_body_lower"
	self.parts.wpn_fps_lmg_hk21_body_upper.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21_pts/wpn_third_lmg_hk21_body_upper"
	self.parts.wpn_fps_lmg_hk21_fg_long.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21_pts/wpn_third_lmg_hk21_fg_long"
	self.parts.wpn_fps_lmg_hk21_fg_short.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21_pts/wpn_third_lmg_hk21_fg_short"
	self.parts.wpn_fps_lmg_hk21_g_ergo.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21_pts/wpn_third_lmg_hk21_g_ergo"
	self.parts.wpn_fps_lmg_hk21_g_standard.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21_pts/wpn_third_lmg_hk21_g_standard"
	self.parts.wpn_fps_lmg_hk21_m_standard.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21_pts/wpn_third_lmg_hk21_m_standard"
	self.parts.wpn_fps_lmg_hk21_s_standard.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21_pts/wpn_third_lmg_hk21_s_standard"
	self.wpn_fps_lmg_hk21 = {}
	self.wpn_fps_lmg_hk21.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21/wpn_fps_lmg_hk21"
	self.wpn_fps_lmg_hk21.optional_types = {"barrel_ext", "gadget"}
	self.wpn_fps_lmg_hk21.default_blueprint = {
		"wpn_fps_lmg_hk21_b_short",
		"wpn_fps_lmg_hk21_body_lower",
		"wpn_fps_lmg_hk21_body_upper",
		"wpn_fps_lmg_hk21_fg_long",
		"wpn_fps_lmg_hk21_g_standard",
		"wpn_fps_lmg_hk21_m_standard",
		"wpn_fps_lmg_hk21_s_standard"
	}
	self.wpn_fps_lmg_hk21.uses_parts = {
		"wpn_fps_lmg_hk21_b_short",
		"wpn_fps_lmg_hk21_b_long",
		"wpn_fps_lmg_hk21_body_lower",
		"wpn_fps_lmg_hk21_body_upper",
		"wpn_fps_lmg_hk21_fg_short",
		"wpn_fps_lmg_hk21_fg_long",
		"wpn_fps_lmg_hk21_g_standard",
		"wpn_fps_lmg_hk21_g_ergo",
		"wpn_fps_lmg_hk21_m_standard",
		"wpn_fps_lmg_hk21_s_standard",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser"
	}
	self.wpn_fps_lmg_hk21_npc = deep_clone(self.wpn_fps_lmg_hk21)
	self.wpn_fps_lmg_hk21_npc.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21/wpn_fps_lmg_hk21_npc"
end

function WeaponFactoryTweakData_37:_init_m249()
	self.parts.wpn_fps_lmg_m249_b_long = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel",
		name_id = "bm_wp_m249_b_long",
		a_obj = "a_b",
		unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_m249_pts/wpn_fps_lmg_m249_b_long",
		stats = {
			value = 4,
			damage = -1,
			spread = 1,
			recoil = 1,
			concealment = -2
		},
		dlc = "gage_pack_lmg",
		texture_bundle_folder = "gage_pack_lmg"
	}
	self.parts.wpn_fps_lmg_m249_b_short = {
		type = "barrel",
		name_id = "bm_wp_m249_b_short",
		a_obj = "a_b",
		unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_m249_pts/wpn_fps_lmg_m249_b_short",
		stats = {value = 1}
	}
	self.parts.wpn_fps_lmg_m249_body_standard = {
		type = "lower_reciever",
		name_id = "bm_wp_m249_body_standard",
		a_obj = "a_body",
		unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_m249_pts/wpn_fps_lmg_m249_body_standard",
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_lmg_m249_fg_mk46 = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "foregrip",
		name_id = "bm_wp_m249_fg_mk46",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_m249_pts/wpn_fps_lmg_m249_fg_mk46",
		stats = {
			value = 6,
			recoil = -2,
			damage = 2,
			spread_moving = 2,
			concealment = -1
		},
		dlc = "gage_pack_lmg",
		texture_bundle_folder = "gage_pack_lmg"
	}
	self.parts.wpn_fps_lmg_m249_fg_standard = {
		type = "foregrip",
		name_id = "bm_wp_m249_fg_standard",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_m249_pts/wpn_fps_lmg_m249_fg_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_lmg_m249_m_standard = {
		type = "magazine",
		bullet_objects = {prefix = "g_bullet_", amount = 15},
		name_id = "bm_wp_m249_m_standard",
		a_obj = "a_m",
		unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_m249_pts/wpn_fps_lmg_m249_m_standard",
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	}
	self.parts.wpn_fps_lmg_m249_s_modern = {
		type = "stock",
		name_id = "bm_wp_m249_s_modern",
		a_obj = "a_s",
		unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_m249_pts/wpn_fps_lmg_m249_s_modern",
		stats = {value = 1}
	}
	self.parts.wpn_fps_lmg_m249_s_para = {
		type = "stock",
		name_id = "bm_wp_m249_s_para",
		a_obj = "a_s",
		unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_m249_pts/wpn_fps_lmg_m249_s_para",
		stats = {value = 1}
	}
	self.parts.wpn_fps_lmg_m249_s_solid = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "stock",
		name_id = "bm_wp_m249_s_solid",
		a_obj = "a_s",
		unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_m249_pts/wpn_fps_lmg_m249_s_solid",
		stats = {
			value = 3,
			recoil = 2,
			spread_moving = -2,
			concealment = -2
		},
		dlc = "gage_pack_lmg",
		texture_bundle_folder = "gage_pack_lmg"
	}
	self.parts.wpn_fps_lmg_m249_upper_reciever = {
		type = "upper_reciever",
		name_id = "bm_wp_m249_upper_reciever",
		a_obj = "a_upper",
		unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_m249_pts/wpn_fps_lmg_m249_upper_reciever",
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_lmg_m249_b_long.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_m249_pts/wpn_third_lmg_m249_b_long"
	self.parts.wpn_fps_lmg_m249_b_short.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_m249_pts/wpn_third_lmg_m249_b_short"
	self.parts.wpn_fps_lmg_m249_body_standard.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_m249_pts/wpn_third_lmg_m249_body_standard"
	self.parts.wpn_fps_lmg_m249_fg_mk46.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_m249_pts/wpn_third_lmg_m249_fg_mk46"
	self.parts.wpn_fps_lmg_m249_fg_standard.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_m249_pts/wpn_third_lmg_m249_fg_standard"
	self.parts.wpn_fps_lmg_m249_m_standard.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_m249_pts/wpn_third_lmg_m249_m_standard"
	self.parts.wpn_fps_lmg_m249_s_modern.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_m249_pts/wpn_third_lmg_m249_s_modern"
	self.parts.wpn_fps_lmg_m249_s_para.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_m249_pts/wpn_third_lmg_m249_s_para"
	self.parts.wpn_fps_lmg_m249_s_solid.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_m249_pts/wpn_third_lmg_m249_s_solid"
	self.parts.wpn_fps_lmg_m249_upper_reciever.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_m249_pts/wpn_third_lmg_m249_upper_reciever"
	self.wpn_fps_lmg_m249 = {}
	self.wpn_fps_lmg_m249.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_m249/wpn_fps_lmg_m249"
	self.wpn_fps_lmg_m249.stock_adapter = "wpn_fps_lmg_m249_s_modern"
	self.wpn_fps_lmg_m249.optional_types = {
		"barrel_ext",
		"gadget",
		"sight",
		"vertical_grip"
	}
	self.wpn_fps_lmg_m249.default_blueprint = {
		"wpn_fps_lmg_m249_b_short",
		"wpn_fps_lmg_m249_body_standard",
		"wpn_fps_lmg_m249_fg_standard",
		"wpn_fps_lmg_m249_m_standard",
		"wpn_fps_lmg_m249_s_para",
		"wpn_fps_lmg_m249_upper_reciever"
	}
	self.wpn_fps_lmg_m249.uses_parts = {
		"wpn_fps_lmg_m249_b_long",
		"wpn_fps_lmg_m249_b_short",
		"wpn_fps_lmg_m249_body_standard",
		"wpn_fps_lmg_m249_fg_mk46",
		"wpn_fps_lmg_m249_fg_standard",
		"wpn_fps_lmg_m249_m_standard",
		"wpn_fps_lmg_m249_s_para",
		"wpn_fps_lmg_m249_s_solid",
		"wpn_fps_lmg_m249_upper_reciever",
		"wpn_fps_upg_m4_s_standard",
		"wpn_fps_upg_m4_s_pts",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_m4_s_crane",
		"wpn_fps_upg_m4_s_mk46",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser"
	}
	self.wpn_fps_lmg_m249_npc = deep_clone(self.wpn_fps_lmg_m249)
	self.wpn_fps_lmg_m249_npc.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_m249/wpn_fps_lmg_m249_npc"
end

function WeaponFactoryTweakData_37:_init_rpk()
	self.parts.wpn_fps_lmg_rpk_b_standard = {
		type = "barrel",
		name_id = "bm_wp_rpk_b_standard",
		a_obj = "a_b",
		unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_rpk_pts/wpn_fps_lmg_rpk_b_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_lmg_rpk_body_lowerreceiver = {
		type = "lower_reciever",
		name_id = "bm_wp_rpk_b_standard",
		a_obj = "a_body",
		unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_rpk_pts/wpn_fps_lmg_rpk_body_lowerreceiver",
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	}
	self.parts.wpn_fps_lmg_rpk_fg_wood = {
		type = "foregrip",
		name_id = "bm_wp_rpk_fg_wood",
		a_obj = "a_fg",
		unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_fg_combo4",
		stats = {value = 1},
		texture_bundle_folder = "gage_pack_lmg",
		forbids = {
			"wpn_fps_addon_ris"
		}
	}
	self.parts.wpn_fps_lmg_rpk_fg_standard = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "foregrip",
		name_id = "bm_wp_rpk_fg_standard",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_rpk_pts/wpn_fps_lmg_rpk_fg_standard",
		stats = {
			value = 5,
			spread = -1,
			recoil = -1,
			damage = 1,
			spread_moving = 2,
			concealment = 1
		},
		forbids = {
			"wpn_fps_addon_ris"
		},
		dlc = "gage_pack_lmg",
		texture_bundle_folder = "gage_pack_lmg",
		adds = {
			"wpn_fps_upg_vg_ass_smg_verticalgrip",
			"wpn_fps_addon_ris"
		}
	}
	self.parts.wpn_lmg_rpk_m_drum = {
		type = "magazine",
		name_id = "bm_wp_rpk_m_drum",
		a_obj = "a_m",
		unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_rpk_pts/wpn_lmg_rpk_m_drum",
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_lmg_rpk_s_standard = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "stock",
		name_id = "bm_wp_rpk_s_standard",
		a_obj = "a_s",
		unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_rpk_pts/wpn_fps_lmg_rpk_s_standard",
		texture_bundle_folder = "gage_pack_lmg",
		dlc = "gage_pack_lmg",
		stats = {
			value = 3,
			recoil = 2,
			concealment = 1
		}
	}
	self.parts.wpn_fps_lmg_rpk_s_wood = {
		type = "stock",
		name_id = "bm_wp_rpk_s_wood",
		a_obj = "a_s",
		unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_rpk_pts/wpn_fps_lmg_rpk_s_wood",
		stats = {value = 1},
		texture_bundle_folder = "gage_pack_lmg"
	}
	self.parts.wpn_fps_lmg_rpk_b_standard.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_rpk_pts/wpn_third_lmg_rpk_b_standard"
	self.parts.wpn_fps_lmg_rpk_body_lowerreceiver.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_ass_ak_body_lowerreceiver"
	self.parts.wpn_fps_lmg_rpk_fg_wood.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_fg_combo4"
	self.parts.wpn_fps_lmg_rpk_fg_standard.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_rpk_pts/wpn_third_lmg_rpk_fg_standard"
	self.parts.wpn_lmg_rpk_m_drum.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_rpk_pts/wpn_third_lmg_rpk_m_drum"
	self.parts.wpn_fps_lmg_rpk_s_standard.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_rpk_pts/wpn_third_lmg_rpk_s_standard"
	self.parts.wpn_fps_lmg_rpk_s_wood.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_rpk_pts/wpn_third_lmg_rpk_s_wood"
	self.wpn_fps_lmg_rpk = {}
	self.wpn_fps_lmg_rpk.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_rpk/wpn_fps_lmg_rpk"
	self.wpn_fps_lmg_rpk.stock_adapter = "wpn_upg_ak_s_adapter"
	self.wpn_fps_lmg_rpk.optional_types = {
		"barrel_ext",
		"gadget",
		"sight",
		"vertical_grip"
	}
	self.wpn_fps_lmg_rpk.default_blueprint = {
		"wpn_fps_lmg_rpk_b_standard",
		"wpn_fps_lmg_rpk_fg_wood",
		"wpn_lmg_rpk_m_drum",
		"wpn_fps_lmg_rpk_s_wood",
		"wpn_fps_ass_74_body_upperreceiver",
		"wpn_fps_lmg_rpk_body_lowerreceiver",
		"wpn_upg_ak_g_standard"
	}
	self.wpn_fps_lmg_rpk.uses_parts = {
		"wpn_fps_lmg_rpk_b_standard",
		"wpn_fps_lmg_rpk_fg_standard",
		"wpn_fps_lmg_rpk_fg_wood",
		"wpn_lmg_rpk_m_drum",
		"wpn_fps_lmg_rpk_s_standard",
		"wpn_fps_lmg_rpk_s_wood",
		"wpn_fps_ass_74_body_upperreceiver",
		"wpn_fps_lmg_rpk_body_lowerreceiver",
		"wpn_upg_ak_g_standard",
		"wpn_fps_upg_m4_s_standard",
		"wpn_fps_upg_m4_s_pts",
		"wpn_upg_ak_s_folding",
		"wpn_upg_ak_s_skfoldable_vanilla",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_vg_ass_smg_verticalgrip",
		"wpn_fps_upg_m4_s_crane",
		"wpn_fps_upg_m4_s_mk46",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser"
	}
	self.wpn_fps_lmg_rpk_npc = deep_clone(self.wpn_fps_lmg_rpk)
	self.wpn_fps_lmg_rpk_npc.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_rpk/wpn_fps_lmg_rpk_npc"
end

function WeaponFactoryTweakData_37:_init_m95()
	self.parts.wpn_fps_snp_m95_barrel_standard = {
		type = "barrel",
		name_id = "bm_wp_m14_b_standard",
		a_obj = "a_b",
		unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_m95_pts/wpn_fps_snp_m95_barrel_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_snp_m95_barrel_long = {
		pcs = {},
		type = "barrel",
		name_id = "bm_wp_m95_b_barrel_long",
		a_obj = "a_b",
		unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_m95_pts/wpn_fps_snp_m95_barrel_long",
		texture_bundle_folder = "gage_pack_snp",
		dlc = "gage_pack_snp",
		is_a_unlockable = true,
		stats = {
			value = 1,
			suppression = -10,
			concealment = -4,
			spread = 2
		}
	}
	self.parts.wpn_fps_snp_m95_barrel_short = {
		pcs = {},
		type = "barrel",
		name_id = "bm_wp_m95_b_barrel_short",
		a_obj = "a_b",
		unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_m95_pts/wpn_fps_snp_m95_barrel_short",
		texture_bundle_folder = "gage_pack_snp",
		dlc = "gage_pack_snp",
		is_a_unlockable = true,
		stats = {
			value = 1,
			concealment = 8,
			spread = -3,
			spread_moving = 3
		}
	}
	self.parts.wpn_fps_snp_m95_barrel_suppressed = {
		pcs = {},
		type = "barrel",
		sub_type = "silencer",
		name_id = "bm_wp_m95_b_barrel_suppressed",
		a_obj = "a_b",
		unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_m95_pts/wpn_fps_snp_m95_barrel_suppressed",
		texture_bundle_folder = "gage_pack_snp",
		dlc = "gage_pack_snp",
		is_a_unlockable = true,
		stats = {
			value = 6,
			suppression = 12,
			alert_size = 12,
			damage = -4,
			recoil = 2,
			spread_moving = 1,
			concealment = 2
		},
		perks = {"silencer"},
		sound_switch = {
			suppressed = "suppressed_c"
		}
	}
	self.parts.wpn_fps_snp_m95_bipod = {
		type = "extra",
		name_id = "bm_wp_m14_body_dmr",
		a_obj = "a_body",
		unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_m95_pts/wpn_fps_snp_m95_bipod",
		stats = {value = 1}
	}
	self.parts.wpn_fps_snp_m95_lower_reciever = {
		type = "lower_body",
		name_id = "bm_wp_m14_body_lower",
		a_obj = "a_body",
		unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_m95_pts/wpn_fps_snp_m95_lower_reciever",
		stats = {value = 1}
	}
	self.parts.wpn_fps_snp_m95_upper_reciever = {
		type = "upper_body",
		name_id = "bm_wp_m14_body_upper",
		a_obj = "a_body",
		unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_m95_pts/wpn_fps_snp_m95_upper_reciever",
		stats = {value = 1}
	}
	self.parts.wpn_fps_snp_m95_magazine = {
		type = "magazine",
		name_id = "bm_wp_m14_m_standard",
		a_obj = "a_m",
		unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_m95_pts/wpn_fps_snp_m95_magazine",
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_snp_m95_barrel_standard.third_unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_m95_pts/wpn_third_snp_m95_barrel_standard"
	self.parts.wpn_fps_snp_m95_barrel_long.third_unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_m95_pts/wpn_third_snp_m95_barrel_long"
	self.parts.wpn_fps_snp_m95_barrel_short.third_unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_m95_pts/wpn_third_snp_m95_barrel_short"
	self.parts.wpn_fps_snp_m95_barrel_suppressed.third_unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_m95_pts/wpn_third_snp_m95_barrel_suppressed"
	self.parts.wpn_fps_snp_m95_bipod.third_unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_m95_pts/wpn_third_snp_m95_bipod"
	self.parts.wpn_fps_snp_m95_lower_reciever.third_unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_m95_pts/wpn_third_snp_m95_lower_reciever"
	self.parts.wpn_fps_snp_m95_upper_reciever.third_unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_m95_pts/wpn_third_snp_m95_upper_reciever"
	self.parts.wpn_fps_snp_m95_magazine.third_unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_m95_pts/wpn_third_snp_m95_magazine"
	self.wpn_fps_snp_m95 = {}
	self.wpn_fps_snp_m95.unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_m95/wpn_fps_snp_m95"
	self.wpn_fps_snp_m95.optional_types = {"gadget", "sight"}
	self.wpn_fps_snp_m95.default_blueprint = {
		"wpn_fps_snp_m95_barrel_standard",
		"wpn_fps_snp_m95_bipod",
		"wpn_fps_snp_m95_lower_reciever",
		"wpn_fps_snp_m95_upper_reciever",
		"wpn_fps_snp_m95_magazine",
		"wpn_fps_upg_o_shortdot",
		"wpn_fps_upg_m4_g_standard_vanilla"
	}
	self.wpn_fps_snp_m95.uses_parts = {
		"wpn_fps_snp_m95_barrel_standard",
		"wpn_fps_snp_m95_barrel_long",
		"wpn_fps_snp_m95_barrel_short",
		"wpn_fps_snp_m95_barrel_suppressed",
		"wpn_fps_snp_m95_bipod",
		"wpn_fps_snp_m95_lower_reciever",
		"wpn_fps_snp_m95_upper_reciever",
		"wpn_fps_snp_m95_magazine",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_o_shortdot",
		"wpn_fps_upg_o_leupold",
		"wpn_fps_upg_o_45iron",
		"wpn_fps_upg_m4_g_standard_vanilla",
		"wpn_fps_upg_m4_g_hgrip",
		"wpn_fps_upg_m4_g_mgrip",
		"wpn_fps_upg_m4_g_ergo",
		"wpn_fps_upg_m4_g_sniper",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser"
	}
	self.wpn_fps_snp_m95_npc = deep_clone(self.wpn_fps_snp_m95)
	self.wpn_fps_snp_m95_npc.unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_m95/wpn_fps_snp_m95_npc"
end

function WeaponFactoryTweakData_37:_init_msr()
	self.parts.wpn_fps_snp_msr_b_standard = {
		type = "barrel",
		name_id = "bm_wp_m14_b_standard",
		a_obj = "a_b",
		unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_msr_pts/wpn_fps_snp_msr_b_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_snp_msr_b_long = {
		pcs = {},
		type = "barrel",
		name_id = "bm_wp_snp_msr_b_long",
		a_obj = "a_b",
		unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_msr_pts/wpn_fps_snp_msr_b_long",
		texture_bundle_folder = "gage_pack_snp",
		dlc = "gage_pack_snp",
		is_a_unlockable = true,
		stats = {
			value = 1,
			concealment = -3,
			spread = 1
		},
		override = {
			wpn_fps_snp_msr_ns_suppressor = {
				unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_msr_pts/wpn_fps_snp_msr_ns_suppressor_long"
			}
		}
	}
	self.parts.wpn_fps_snp_msr_ns_suppressor = {
		pcs = {},
		type = "barrel_ext",
		sub_type = "silencer",
		name_id = "bm_wp_snp_msr_ns_suppressor",
		a_obj = "a_ns",
		parent = "barrel",
		unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_msr_pts/wpn_fps_snp_msr_ns_suppressor",
		texture_bundle_folder = "gage_pack_snp",
		dlc = "gage_pack_snp",
		is_a_unlockable = true,
		stats = {
			value = 5,
			suppression = 12,
			alert_size = 12,
			spread = -1,
			recoil = 3,
			spread_moving = -2,
			concealment = -2,
			damage = -4
		},
		perks = {"silencer"},
		sound_switch = {
			suppressed = "suppressed_c"
		}
	}
	self.parts.wpn_fps_snp_msr_body_msr = {
		pcs = {},
		type = "stock",
		name_id = "bm_wp_msr_body_msr",
		a_obj = "a_body",
		unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_msr_pts/wpn_fps_snp_msr_body_msr",
		texture_bundle_folder = "gage_pack_snp",
		dlc = "gage_pack_snp",
		is_a_unlockable = true,
		stats = {
			value = 8,
			concealment = 6,
			recoil = -2
		},
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	}
	self.parts.wpn_fps_snp_msr_body_wood = {
		type = "stock",
		name_id = "bm_wp_msr_body_wood",
		a_obj = "a_body",
		unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_msr_pts/wpn_fps_snp_msr_body_wood",
		stats = {value = 1},
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	}
	self.parts.wpn_fps_snp_msr_m_standard = {
		type = "magazine",
		name_id = "bm_wp_m14_m_standard",
		a_obj = "a_m",
		unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_msr_pts/wpn_fps_snp_msr_m_standard",
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	}
	self.parts.wpn_fps_snp_msr_b_standard.third_unit = "units/pd2_dlc_gage_snp/weapons/wpn_third_snp_msr_pts/wpn_third_snp_msr_b_standard"
	self.parts.wpn_fps_snp_msr_b_long.third_unit = "units/pd2_dlc_gage_snp/weapons/wpn_third_snp_msr_pts/wpn_third_snp_msr_b_long"
	self.parts.wpn_fps_snp_msr_ns_suppressor.third_unit = "units/pd2_dlc_gage_snp/weapons/wpn_third_snp_msr_pts/wpn_third_snp_msr_ns_suppressor"
	self.parts.wpn_fps_snp_msr_body_msr.third_unit = "units/pd2_dlc_gage_snp/weapons/wpn_third_snp_msr_pts/wpn_third_snp_msr_body_msr"
	self.parts.wpn_fps_snp_msr_body_wood.third_unit = "units/pd2_dlc_gage_snp/weapons/wpn_third_snp_msr_pts/wpn_third_snp_msr_body_wood"
	self.parts.wpn_fps_snp_msr_m_standard.third_unit = "units/pd2_dlc_gage_snp/weapons/wpn_third_snp_msr_pts/wpn_third_snp_msr_m_standard"
	self.wpn_fps_snp_msr = {}
	self.wpn_fps_snp_msr.unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_msr/wpn_fps_snp_msr"
	self.wpn_fps_snp_msr.optional_types = {"gadget", "sight"}
	self.wpn_fps_snp_msr.default_blueprint = {
		"wpn_fps_snp_msr_b_standard",
		"wpn_fps_snp_msr_body_wood",
		"wpn_fps_snp_msr_m_standard",
		"wpn_fps_upg_o_shortdot"
	}
	self.wpn_fps_snp_msr.uses_parts = {
		"wpn_fps_snp_msr_b_standard",
		"wpn_fps_snp_msr_b_long",
		"wpn_fps_snp_msr_ns_suppressor",
		"wpn_fps_snp_msr_body_msr",
		"wpn_fps_snp_msr_body_wood",
		"wpn_fps_snp_msr_m_standard",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_o_shortdot",
		"wpn_fps_upg_o_leupold",
		"wpn_fps_upg_o_45iron",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser"
	}
	self.wpn_fps_snp_msr_npc = deep_clone(self.wpn_fps_snp_msr)
	self.wpn_fps_snp_msr_npc.unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_msr/wpn_fps_snp_msr_npc"
end

function WeaponFactoryTweakData_37:_init_r93()
	self.parts.wpn_fps_snp_r93_b_standard = {
		type = "barrel",
		name_id = "bm_wp_r93_b_standard",
		a_obj = "a_b",
		unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_r93_pts/wpn_fps_snp_r93_b_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_snp_r93_b_short = {
		pcs = {},
		type = "barrel",
		name_id = "bm_wp_r93_b_short",
		a_obj = "a_b",
		unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_r93_pts/wpn_fps_snp_r93_b_short",
		texture_bundle_folder = "gage_pack_snp",
		dlc = "gage_pack_snp",
		is_a_unlockable = true,
		stats = {
			value = 1,
			spread = -2,
			recoil = 2,
			spread_moving = 3,
			concealment = 3
		}
	}
	self.parts.wpn_fps_snp_r93_b_suppressed = {
		pcs = {},
		type = "barrel",
		sub_type = "silencer",
		name_id = "bm_wp_r93_b_suppressed",
		a_obj = "a_b",
		unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_r93_pts/wpn_fps_snp_r93_b_suppressed",
		texture_bundle_folder = "gage_pack_snp",
		dlc = "gage_pack_snp",
		is_a_unlockable = true,
		stats = {
			value = 4,
			suppression = 12,
			alert_size = 12,
			spread = -1,
			damage = -4,
			recoil = 1,
			spread_moving = 1,
			concealment = -1
		},
		perks = {"silencer"},
		sound_switch = {
			suppressed = "suppressed_c"
		}
	}
	self.parts.wpn_fps_snp_r93_body_standard = {
		type = "stock",
		name_id = "bm_wp_m14_body_lower",
		a_obj = "a_body",
		unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_r93_pts/wpn_fps_snp_r93_body_standard",
		stats = {value = 1},
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	}
	self.parts.wpn_fps_snp_r93_body_wood = {
		pcs = {},
		type = "stock",
		name_id = "bm_wp_r93_body_wood",
		a_obj = "a_body",
		unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_r93_pts/wpn_fps_snp_r93_body_wood",
		texture_bundle_folder = "gage_pack_snp",
		dlc = "gage_pack_snp",
		is_a_unlockable = true,
		stats = {
			value = 7,
			concealment = -3,
			recoil = 2
		},
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	}
	self.parts.wpn_fps_snp_r93_m_std = {
		type = "magazine",
		name_id = "bm_wp_m14_m_standard",
		a_obj = "a_m",
		unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_r93_pts/wpn_fps_snp_r93_m_std",
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	}
	self.parts.wpn_fps_snp_r93_b_standard.third_unit = "units/pd2_dlc_gage_snp/weapons/wpn_third_snp_r93_pts/wpn_third_snp_r93_b_standard"
	self.parts.wpn_fps_snp_r93_b_short.third_unit = "units/pd2_dlc_gage_snp/weapons/wpn_third_snp_r93_pts/wpn_third_snp_r93_b_short"
	self.parts.wpn_fps_snp_r93_b_suppressed.third_unit = "units/pd2_dlc_gage_snp/weapons/wpn_third_snp_r93_pts/wpn_third_snp_r93_b_suppressed"
	self.parts.wpn_fps_snp_r93_body_standard.third_unit = "units/pd2_dlc_gage_snp/weapons/wpn_third_snp_r93_pts/wpn_third_snp_r93_body_standard"
	self.parts.wpn_fps_snp_r93_body_wood.third_unit = "units/pd2_dlc_gage_snp/weapons/wpn_third_snp_r93_pts/wpn_third_snp_r93_body_wood"
	self.parts.wpn_fps_snp_r93_m_std.third_unit = "units/pd2_dlc_gage_snp/weapons/wpn_third_snp_r93_pts/wpn_third_snp_r93_m_std"
	self.wpn_fps_snp_r93 = {}
	self.wpn_fps_snp_r93.unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_r93/wpn_fps_snp_r93"
	self.wpn_fps_snp_r93.optional_types = {"gadget", "sight"}
	self.wpn_fps_snp_r93.default_blueprint = {
		"wpn_fps_snp_r93_b_standard",
		"wpn_fps_snp_r93_body_standard",
		"wpn_fps_snp_r93_m_std",
		"wpn_fps_upg_o_shortdot"
	}
	self.wpn_fps_snp_r93.uses_parts = {
		"wpn_fps_snp_r93_b_standard",
		"wpn_fps_snp_r93_b_short",
		"wpn_fps_snp_r93_b_suppressed",
		"wpn_fps_snp_r93_body_standard",
		"wpn_fps_snp_r93_body_wood",
		"wpn_fps_snp_r93_m_std",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_o_shortdot",
		"wpn_fps_upg_o_leupold",
		"wpn_fps_upg_o_45iron",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser"
	}
	self.wpn_fps_snp_r93_npc = deep_clone(self.wpn_fps_snp_r93)
	self.wpn_fps_snp_r93_npc.unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_r93/wpn_fps_snp_r93_npc"
end

function WeaponFactoryTweakData_37:_init_fal()
	self.parts.wpn_fps_ass_fal_body_standard = {
		type = "upper_reciever",
		name_id = "bm_wp_fal_body_standard",
		a_obj = "a_body",
		unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal_pts/wpn_fps_ass_fal_body_standard",
		stats = {value = 2},
		texture_bundle_folder = "big_bank",
		dlc = "big_bank",
		is_a_unlockable = true,
		animations = {reload = "reload"}
	}
	self.parts.wpn_fps_ass_fal_fg_01 = {
		pcs = {},
		type = "barrel",
		name_id = "bm_wp_fal_body_standard",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal_pts/wpn_fps_ass_fal_fg_01",
		stats = {
			value = 2,
			spread = -1,
			spread_moving = 4,
			concealment = 6,
			damage = 1
		},
		texture_bundle_folder = "big_bank",
		dlc = "big_bank",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_ass_fal_fg_standard = {
		type = "barrel",
		name_id = "bm_wp_fal_fg_standard",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal_pts/wpn_fps_ass_fal_fg_standard",
		stats = {value = 2}
	}
	self.parts.wpn_fps_ass_fal_fg_03 = {
		pcs = {},
		type = "barrel",
		name_id = "bm_wp_fal_fg_03",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal_pts/wpn_fps_ass_fal_fg_03",
		stats = {
			value = 2,
			recoil = 2,
			spread_moving = 4,
			concealment = -1,
			damage = 1
		},
		texture_bundle_folder = "big_bank",
		dlc = "big_bank",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_ass_fal_fg_04 = {
		pcs = {},
		type = "barrel",
		name_id = "bm_wp_fal_fg_04",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal_pts/wpn_fps_ass_fal_fg_04",
		stats = {
			value = 2,
			damage = 1,
			spread = 1,
			recoil = -1,
			spread_moving = -2,
			concealment = -2
		},
		texture_bundle_folder = "big_bank",
		dlc = "big_bank",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_ass_fal_fg_wood = {
		pcs = {},
		type = "barrel",
		name_id = "bm_wp_fal_fg_wood",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal_pts/wpn_fps_ass_fal_fg_wood",
		stats = {
			value = 2,
			spread = 2,
			recoil = 1,
			spread_moving = -2,
			concealment = -2
		},
		texture_bundle_folder = "big_bank",
		dlc = "big_bank",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_ass_fal_g_01 = {
		pcs = {},
		type = "grip",
		name_id = "bm_wp_fal_g_01",
		a_obj = "a_g",
		unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal_pts/wpn_fps_ass_fal_g_01",
		stats = {
			value = 2,
			recoil = 1,
			spread_moving = 1,
			concealment = 2
		},
		texture_bundle_folder = "big_bank",
		dlc = "big_bank",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_ass_fal_g_standard = {
		type = "grip",
		name_id = "bm_wp_fal_body_standard",
		a_obj = "a_g",
		unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal_pts/wpn_fps_ass_fal_g_standard",
		stats = {value = 2}
	}
	self.parts.wpn_fps_ass_fal_m_01 = {
		pcs = {},
		type = "magazine",
		name_id = "bm_wp_fal_m_01",
		a_obj = "a_m",
		unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal_pts/wpn_fps_ass_fal_m_01",
		stats = {
			value = 2,
			extra_ammo = 10,
			spread_moving = -2,
			concealment = -2,
			spread = -1,
			recoil = 1
		},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		},
		texture_bundle_folder = "big_bank",
		dlc = "big_bank",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_ass_fal_m_standard = {
		type = "magazine",
		name_id = "bm_wp_fal_m_standard",
		a_obj = "a_m",
		unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal_pts/wpn_fps_ass_fal_m_standard",
		stats = {value = 2},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_ass_fal_s_01 = {
		pcs = {},
		type = "stock",
		name_id = "bm_wp_fal_s_01",
		a_obj = "a_s",
		unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal_pts/wpn_fps_ass_fal_s_01",
		stats = {
			value = 2,
			spread_moving = 2,
			concealment = 5
		},
		texture_bundle_folder = "big_bank",
		dlc = "big_bank",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_ass_fal_s_03 = {
		pcs = {},
		type = "stock",
		name_id = "bm_wp_fal_s_03",
		a_obj = "a_s",
		unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal_pts/wpn_fps_ass_fal_s_03",
		stats = {
			value = 2,
			spread = 1,
			recoil = 1,
			spread_moving = -3,
			concealment = -2
		},
		texture_bundle_folder = "big_bank",
		dlc = "big_bank",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_ass_fal_s_standard = {
		type = "stock",
		name_id = "bm_wp_fal_s_standard",
		a_obj = "a_s",
		unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal_pts/wpn_fps_ass_fal_s_standard",
		stats = {value = 2}
	}
	self.parts.wpn_fps_ass_fal_s_wood = {
		pcs = {},
		type = "stock",
		name_id = "bm_wp_fal_s_wood",
		a_obj = "a_s",
		unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal_pts/wpn_fps_ass_fal_s_wood",
		stats = {
			value = 2,
			recoil = 4,
			spread_moving = -3
		},
		texture_bundle_folder = "big_bank",
		dlc = "big_bank",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_ass_fal_body_standard.third_unit = "units/pd2_dlc_big/weapons/wpn_third_ass_fal_pts/wpn_third_ass_fal_body_standard"
	self.parts.wpn_fps_ass_fal_fg_01.third_unit = "units/pd2_dlc_big/weapons/wpn_third_ass_fal_pts/wpn_third_ass_fal_fg_01"
	self.parts.wpn_fps_ass_fal_fg_standard.third_unit = "units/pd2_dlc_big/weapons/wpn_third_ass_fal_pts/wpn_third_ass_fal_fg_standard"
	self.parts.wpn_fps_ass_fal_fg_03.third_unit = "units/pd2_dlc_big/weapons/wpn_third_ass_fal_pts/wpn_third_ass_fal_fg_03"
	self.parts.wpn_fps_ass_fal_fg_04.third_unit = "units/pd2_dlc_big/weapons/wpn_third_ass_fal_pts/wpn_third_ass_fal_fg_04"
	self.parts.wpn_fps_ass_fal_fg_wood.third_unit = "units/pd2_dlc_big/weapons/wpn_third_ass_fal_pts/wpn_third_ass_fal_fg_wood"
	self.parts.wpn_fps_ass_fal_g_01.third_unit = "units/pd2_dlc_big/weapons/wpn_third_ass_fal_pts/wpn_third_ass_fal_g_01"
	self.parts.wpn_fps_ass_fal_g_standard.third_unit = "units/pd2_dlc_big/weapons/wpn_third_ass_fal_pts/wpn_third_ass_fal_g_standard"
	self.parts.wpn_fps_ass_fal_m_01.third_unit = "units/pd2_dlc_big/weapons/wpn_third_ass_fal_pts/wpn_third_ass_fal_m_01"
	self.parts.wpn_fps_ass_fal_m_standard.third_unit = "units/pd2_dlc_big/weapons/wpn_third_ass_fal_pts/wpn_third_ass_fal_m_standard"
	self.parts.wpn_fps_ass_fal_s_01.third_unit = "units/pd2_dlc_big/weapons/wpn_third_ass_fal_pts/wpn_third_ass_fal_s_01"
	self.parts.wpn_fps_ass_fal_s_03.third_unit = "units/pd2_dlc_big/weapons/wpn_third_ass_fal_pts/wpn_third_ass_fal_s_03"
	self.parts.wpn_fps_ass_fal_s_standard.third_unit = "units/pd2_dlc_big/weapons/wpn_third_ass_fal_pts/wpn_third_ass_fal_s_standard"
	self.parts.wpn_fps_ass_fal_s_wood.third_unit = "units/pd2_dlc_big/weapons/wpn_third_ass_fal_pts/wpn_third_ass_fal_s_wood"
	self.wpn_fps_ass_fal = {}
	self.wpn_fps_ass_fal.unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal/wpn_fps_ass_fal"
	self.wpn_fps_ass_fal.optional_types = {"barrel_ext", "gadget"}
	self.wpn_fps_ass_fal.override = {}
	self.wpn_fps_ass_fal.adds = {
		wpn_fps_upg_o_specter = {
			"wpn_fps_ass_fal_o_flipups_down"
		},
		wpn_fps_upg_o_aimpoint = {
			"wpn_fps_ass_fal_o_flipups_down"
		},
		wpn_fps_upg_o_aimpoint_2 = {
			"wpn_fps_ass_fal_o_flipups_down"
		},
		wpn_fps_upg_o_docter = {
			"wpn_fps_ass_fal_o_flipups_down"
		},
		wpn_fps_upg_o_eotech = {
			"wpn_fps_ass_fal_o_flipups_down"
		},
		wpn_fps_upg_o_t1micro = {
			"wpn_fps_ass_fal_o_flipups_down"
		},
		wpn_fps_upg_o_cmore = {
			"wpn_fps_ass_fal_o_flipups_down"
		},
		wpn_fps_upg_o_acog = {
			"wpn_fps_ass_fal_o_flipups_down"
		},
		wpn_fps_upg_o_cs = {
			"wpn_fps_ass_fal_o_flipups_down"
		},
		wpn_fps_upg_o_eotech_xps = {
			"wpn_fps_ass_fal_o_flipups_down"
		},
		wpn_fps_upg_o_reflex = {
			"wpn_fps_ass_fal_o_flipups_down"
		},
		wpn_fps_upg_o_rx01 = {
			"wpn_fps_ass_fal_o_flipups_down"
		},
		wpn_fps_upg_o_rx30 = {
			"wpn_fps_ass_fal_o_flipups_down"
		}
	}
	self.wpn_fps_ass_fal.default_blueprint = {
		"wpn_fps_ass_fal_body_standard",
		"wpn_fps_ass_fal_fg_standard",
		"wpn_fps_ass_fal_g_standard",
		"wpn_fps_ass_fal_m_standard",
		"wpn_fps_ass_fal_s_standard"
	}
	self.wpn_fps_ass_fal.uses_parts = {
		"wpn_fps_ass_fal_body_standard",
		"wpn_fps_ass_fal_fg_01",
		"wpn_fps_ass_fal_fg_standard",
		"wpn_fps_ass_fal_fg_03",
		"wpn_fps_ass_fal_fg_04",
		"wpn_fps_ass_fal_fg_wood",
		"wpn_fps_ass_fal_g_01",
		"wpn_fps_ass_fal_g_standard",
		"wpn_fps_ass_fal_m_01",
		"wpn_fps_ass_fal_m_standard",
		"wpn_fps_ass_fal_s_01",
		"wpn_fps_ass_fal_s_03",
		"wpn_fps_ass_fal_s_standard",
		"wpn_fps_ass_fal_s_wood",
		"wpn_fps_upg_i_singlefire",
		"wpn_fps_upg_i_autofire",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser"
	}
	self.wpn_fps_ass_fal_npc = deep_clone(self.wpn_fps_ass_fal)
	self.wpn_fps_ass_fal_npc.unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal/wpn_fps_ass_fal_npc"
end

function WeaponFactoryTweakData_37:_init_ben()
	self.parts.wpn_fps_sho_ben_b_long = {
		pcs = {},
		type = "barrel",
		name_id = "bm_wp_ben_b_long",
		a_obj = "a_b",
		unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_sho_ben_pts/wpn_fps_sho_ben_b_long",
		stats = {
			value = 8,
			recoil = 1,
			spread = 2,
			concealment = -2,
			extra_ammo = 1
		},
		dlc = "gage_pack_shotgun",
		texture_bundle_folder = "gage_pack_shotgun",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_sho_ben_b_standard = {
		type = "barrel",
		name_id = "bm_wp_ben_b_standard",
		a_obj = "a_b",
		unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_sho_ben_pts/wpn_fps_sho_ben_b_standard",
		stats = {value = 1},
		dlc = "gage_pack_shotgun",
		texture_bundle_folder = "gage_pack_shotgun"
	}
	self.parts.wpn_fps_sho_ben_b_short = {
		pcs = {},
		type = "barrel",
		name_id = "bm_wp_ben_b_short",
		a_obj = "a_b",
		unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_sho_ben_pts/wpn_fps_sho_ben_b_short",
		stats = {
			value = 5,
			recoil = -2,
			spread = -2,
			concealment = 6,
			damage = 2,
			extra_ammo = -1
		},
		dlc = "gage_pack_shotgun",
		texture_bundle_folder = "gage_pack_shotgun",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_sho_ben_body_standard = {
		type = "lower_reciever",
		name_id = "bm_wp_ben_body_standard",
		a_obj = "a_body",
		unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_sho_ben_pts/wpn_fps_sho_ben_body_standard",
		stats = {value = 1},
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	}
	self.parts.wpn_fps_sho_ben_fg_standard = {
		type = "foregrip",
		name_id = "bm_wp_ben_fg_standard",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_sho_ben_pts/wpn_fps_sho_ben_fg_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_sho_ben_s_collapsable = {
		type = "stock",
		name_id = "bm_wp_ben_fg_standard",
		a_obj = "a_s",
		unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_sho_ben_pts/wpn_fps_sho_ben_s_collapsable",
		stats = {value = 1}
	}
	self.parts.wpn_fps_sho_ben_s_collapsed = {
		pcs = {},
		type = "stock",
		name_id = "bm_wp_ben_s_collapsed",
		a_obj = "a_s",
		unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_sho_ben_pts/wpn_fps_sho_ben_s_collapsed",
		stats = {
			value = 1,
			recoil = -3,
			concealment = 6
		},
		dlc = "gage_pack_shotgun",
		texture_bundle_folder = "gage_pack_shotgun",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_sho_ben_s_solid = {
		pcs = {},
		type = "stock",
		name_id = "bm_wp_ben_fg_standard",
		a_obj = "a_s",
		unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_sho_ben_pts/wpn_fps_sho_ben_s_solid",
		stats = {
			value = 5,
			recoil = 2,
			spread = 1,
			concealment = -2
		},
		dlc = "gage_pack_shotgun",
		texture_bundle_folder = "gage_pack_shotgun",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_sho_ben_b_long.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_sho_ben_pts/wpn_third_sho_ben_b_long"
	self.parts.wpn_fps_sho_ben_b_standard.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_sho_ben_pts/wpn_third_sho_ben_b_long"
	self.parts.wpn_fps_sho_ben_b_short.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_sho_ben_pts/wpn_third_sho_ben_b_short"
	self.parts.wpn_fps_sho_ben_body_standard.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_sho_ben_pts/wpn_third_sho_ben_body_standard"
	self.parts.wpn_fps_sho_ben_fg_standard.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_sho_ben_pts/wpn_third_sho_ben_fg_standard"
	self.parts.wpn_fps_sho_ben_s_collapsable.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_sho_ben_pts/wpn_third_sho_ben_s_collapsable"
	self.parts.wpn_fps_sho_ben_s_collapsed.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_sho_ben_pts/wpn_third_sho_ben_s_collapsed"
	self.parts.wpn_fps_sho_ben_s_solid.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_sho_ben_pts/wpn_third_sho_ben_s_solid"
	self.wpn_fps_sho_ben = {}
	self.wpn_fps_sho_ben.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_sho_ben/wpn_fps_sho_ben"
	self.wpn_fps_sho_ben.optional_types = {
		"barrel_ext",
		"gadget",
		"vertical_grip"
	}
	self.wpn_fps_sho_ben.default_blueprint = {
		"wpn_fps_sho_ben_b_standard",
		"wpn_fps_sho_ben_body_standard",
		"wpn_fps_sho_ben_fg_standard",
		"wpn_fps_sho_ben_s_collapsable"
	}
	self.wpn_fps_sho_ben.uses_parts = {
		"wpn_fps_sho_ben_b_long",
		"wpn_fps_sho_ben_b_standard",
		"wpn_fps_sho_ben_b_short",
		"wpn_fps_sho_ben_body_standard",
		"wpn_fps_sho_ben_fg_standard",
		"wpn_fps_sho_ben_s_collapsable",
		"wpn_fps_sho_ben_s_collapsed",
		"wpn_fps_sho_ben_s_solid",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_ns_shot_thick",
		"wpn_fps_upg_ns_shot_shark",
		"wpn_fps_upg_shot_ns_king",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs"
	}
	self.wpn_fps_sho_ben_npc = deep_clone(self.wpn_fps_sho_ben)
	self.wpn_fps_sho_ben_npc.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_sho_ben/wpn_fps_sho_ben_npc"
end

function WeaponFactoryTweakData_37:_init_striker()
	self.parts.wpn_fps_sho_striker_b_long = {
		pcs = {},
		type = "barrel",
		name_id = "bm_wp_striker_b_long",
		a_obj = "a_b",
		unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_sho_striker_pts/wpn_fps_sho_striker_b_long",
		stats = {
			value = 3,
			recoil = 1,
			spread = 2,
			concealment = -2
		},
		dlc = "gage_pack_shotgun",
		texture_bundle_folder = "gage_pack_shotgun",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_sho_striker_b_suppressed = {
		pcs = {},
		type = "barrel",
		sub_type = "silencer",
		name_id = "bm_wp_striker_b_suppressed",
		a_obj = "a_b",
		unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_sho_striker_pts/wpn_fps_sho_striker_b_suppressed",
		stats = {
			value = 5,
			suppression = 12,
			alert_size = 12,
			spread = -1,
			damage = -2,
			recoil = 2,
			spread_moving = 1,
			concealment = -2
		},
		perks = {"silencer"},
		sound_switch = {
			suppressed = "suppressed_a"
		},
		forbids = {
			"wpn_fps_upg_shot_ns_king",
			"wpn_fps_upg_ns_shot_thick",
			"wpn_fps_upg_ns_shot_shark"
		},
		dlc = "gage_pack_shotgun",
		texture_bundle_folder = "gage_pack_shotgun",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_sho_striker_b_standard = {
		type = "barrel",
		name_id = "bm_wp_striker_b_standard",
		a_obj = "a_b",
		unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_sho_striker_pts/wpn_fps_sho_striker_b_standard",
		stats = {value = 1},
		dlc = "gage_pack_shotgun",
		texture_bundle_folder = "gage_pack_shotgun"
	}
	self.parts.wpn_fps_sho_striker_body_standard = {
		type = "lower_reciever",
		name_id = "bm_wp_striker_body_standard",
		a_obj = "a_body",
		unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_sho_striker_pts/wpn_fps_sho_striker_body_standard",
		stats = {value = 1},
		dlc = "gage_pack_shotgun",
		texture_bundle_folder = "gage_pack_shotgun",
		animations = {reload = "reload"}
	}
	self.parts.wpn_fps_sho_striker_b_long.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_sho_striker_pts/wpn_third_sho_striker_b_long"
	self.parts.wpn_fps_sho_striker_b_suppressed.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_sho_striker_pts/wpn_third_sho_striker_b_suppressed"
	self.parts.wpn_fps_sho_striker_b_standard.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_sho_striker_pts/wpn_third_sho_striker_b_standard"
	self.parts.wpn_fps_sho_striker_body_standard.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_sho_striker_pts/wpn_third_sho_striker_body_standard"
	self.wpn_fps_sho_striker = {}
	self.wpn_fps_sho_striker.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_sho_striker/wpn_fps_sho_striker"
	self.wpn_fps_sho_striker.optional_types = {
		"barrel_ext",
		"gadget",
		"vertical_grip"
	}
	self.wpn_fps_sho_striker.override = {
		wpn_upg_o_marksmansight_rear_vanilla = {a_obj = "a_o_r"},
		wpn_upg_o_marksmansight_front = {a_obj = "a_o_f"},
		wpn_fps_upg_a_slug = {
			desc_id = "bm_wp_upg_a_slug2_desc",
			custom_stats = {
				damage_near_mul = 2,
				damage_far_mul = 1.15,
				rays = 1,
				armor_piercing_add = 1,
				can_shoot_through_enemy = true,
				can_shoot_through_shield = true,
				can_shoot_through_wall = true,
				ammo_pickup_min_mul = 0.5,
				ammo_pickup_max_mul = 0.5
			}
		},
		wpn_fps_upg_a_custom = {
			desc_id = "bm_wp_upg_a_custom2_desc",
			custom_stats = {ammo_pickup_min_mul = 0.7, ammo_pickup_max_mul = 0.7}
		},
		wpn_fps_upg_a_custom_free = {
			desc_id = "bm_wp_upg_a_custom2_desc",
			custom_stats = {ammo_pickup_min_mul = 0.7, ammo_pickup_max_mul = 0.7}
		}
	}
	self.wpn_fps_sho_striker.default_blueprint = {
		"wpn_fps_sho_striker_b_standard",
		"wpn_fps_sho_striker_body_standard",
		"wpn_upg_o_marksmansight_rear_vanilla"
	}
	self.wpn_fps_sho_striker.uses_parts = {
		"wpn_fps_sho_striker_b_long",
		"wpn_fps_sho_striker_b_suppressed",
		"wpn_fps_sho_striker_b_standard",
		"wpn_fps_sho_striker_body_standard",
		"wpn_upg_o_marksmansight_rear_vanilla",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_ns_shot_thick",
		"wpn_fps_upg_ns_shot_shark",
		"wpn_fps_upg_shot_ns_king",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs"
	}
	self.wpn_fps_sho_striker_npc = deep_clone(self.wpn_fps_sho_striker)
	self.wpn_fps_sho_striker_npc.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_sho_striker/wpn_fps_sho_striker_npc"
end

function WeaponFactoryTweakData_37:_init_ksg()
	self.parts.wpn_fps_sho_ksg_b_long = {
		pcs = {},
		type = "barrel",
		name_id = "bm_wp_ksg_b_long",
		a_obj = "a_b",
		unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_sho_ksg_pts/wpn_fps_sho_ksg_b_long",
		stats = {
			value = 7,
			recoil = 1,
			spread = 2,
			concealment = -2,
			extra_ammo = 2
		},
		dlc = "gage_pack_shotgun",
		texture_bundle_folder = "gage_pack_shotgun",
		is_a_unlockable = true,
		forbids = {
			"wpn_fps_sho_ksg_fg_short"
		},
		adds = {
			"wpn_fps_sho_ksg_fg_standard"
		},
		override = {
			wpn_fps_upg_o_dd_front = {a_obj = "a_o_f_2"}
		}
	}
	self.parts.wpn_fps_sho_ksg_b_standard = {
		type = "barrel",
		name_id = "bm_wp_ksg_b_standard",
		a_obj = "a_b",
		unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_sho_ksg_pts/wpn_fps_sho_ksg_b_standard",
		stats = {value = 1},
		forbids = {
			"wpn_fps_sho_ksg_fg_short"
		},
		adds = {
			"wpn_fps_sho_ksg_fg_standard"
		},
		override = {
			wpn_fps_upg_o_dd_front = {a_obj = "a_o_f_2"}
		}
	}
	self.parts.wpn_fps_sho_ksg_b_short = {
		pcs = {},
		type = "barrel",
		name_id = "bm_wp_ksg_b_short",
		a_obj = "a_b",
		unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_sho_ksg_pts/wpn_fps_sho_ksg_b_short",
		stats = {
			value = 5,
			recoil = -2,
			spread = -2,
			concealment = 4,
			damage = 1,
			extra_ammo = -2
		},
		dlc = "gage_pack_shotgun",
		texture_bundle_folder = "gage_pack_shotgun",
		is_a_unlockable = true,
		forbids = {
			"wpn_fps_sho_ksg_fg_standard"
		},
		adds = {
			"wpn_fps_sho_ksg_fg_short"
		}
	}
	self.parts.wpn_fps_sho_ksg_fg_short = {
		type = "foregrip",
		name_id = "bm_wp_ksg_fg_short",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_sho_ksg_pts/wpn_fps_sho_ksg_fg_short",
		stats = {value = 1},
		animations = {
			reload_exit = "reload_exit",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	}
	self.parts.wpn_fps_sho_ksg_fg_standard = {
		type = "foregrip",
		name_id = "bm_wp_standard_issue",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_sho_ksg_pts/wpn_fps_sho_ksg_fg_standard",
		stats = {value = 1},
		animations = {
			reload_exit = "reload_exit",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	}
	self.parts.wpn_fps_sho_ksg_body_standard = {
		type = "lower_body",
		name_id = "bm_wp_ksg_body_standard",
		a_obj = "a_body",
		unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_sho_ksg_pts/wpn_fps_sho_ksg_body_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_upg_o_mbus_rear = {
		pcs = {},
		type = "sight",
		name_id = "bm_wp_upg_o_mbus_rear",
		a_obj = "a_o_r",
		unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_upg_o_mbus/wpn_fps_upg_o_mbus_rear",
		stats = {value = 3, concealment = 2},
		perks = {"scope"},
		stance_mod = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod),
		dlc = "gage_pack_shotgun",
		texture_bundle_folder = "gage_pack_shotgun",
		is_a_unlockable = true,
		adds = {
			"wpn_fps_upg_o_mbus_front"
		}
	}
	self.parts.wpn_fps_upg_o_mbus_front = {
		type = "extra",
		name_id = "bm_wp_upg_o_mbus_front",
		a_obj = "a_o_f",
		unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_upg_o_mbus/wpn_fps_upg_o_mbus_front",
		dlc = "gage_pack_shotgun",
		texture_bundle_folder = "gage_pack_shotgun",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_sho_ksg_b_long.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_sho_ksg_pts/wpn_third_sho_ksg_b_long"
	self.parts.wpn_fps_sho_ksg_b_standard.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_sho_ksg_pts/wpn_third_sho_ksg_b_standard"
	self.parts.wpn_fps_sho_ksg_b_short.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_sho_ksg_pts/wpn_third_sho_ksg_b_short"
	self.parts.wpn_fps_sho_ksg_fg_short.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_sho_ksg_pts/wpn_third_sho_ksg_fg_short"
	self.parts.wpn_fps_sho_ksg_fg_standard.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_sho_ksg_pts/wpn_third_sho_ksg_fg_standard"
	self.parts.wpn_fps_sho_ksg_body_standard.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_sho_ksg_pts/wpn_third_sho_ksg_body_standard"
	self.parts.wpn_fps_upg_o_mbus_rear.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_upg_o_mbus/wpn_third_upg_o_mbus_rear"
	self.parts.wpn_fps_upg_o_mbus_front.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_upg_o_mbus/wpn_third_upg_o_mbus_front"
	self.wpn_fps_sho_ksg = {}
	self.wpn_fps_sho_ksg.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_sho_ksg/wpn_fps_sho_ksg"
	self.wpn_fps_sho_ksg.animations = {
		fire = "recoil",
		reload_exit = "reload_exit",
		fire_steelsight = "recoil"
	}
	self.wpn_fps_sho_ksg.optional_types = {
		"barrel_ext",
		"gadget",
		"vertical_grip"
	}
	self.wpn_fps_sho_ksg.override = {
		wpn_fps_upg_o_specter = {
			override = {
				wpn_fps_upg_fl_ass_smg_sho_peqbox = {a_obj = "a_fl_2"},
				wpn_fps_upg_fl_ass_laser = {a_obj = "a_fl_2"},
				wpn_fps_upg_fl_ass_peq15 = {a_obj = "a_fl_2"}
			},
			forbids = {
				"wpn_fps_addon_ris"
			}
		},
		wpn_fps_upg_o_aimpoint = {
			override = {
				wpn_fps_upg_fl_ass_smg_sho_peqbox = {a_obj = "a_fl_2"},
				wpn_fps_upg_fl_ass_laser = {a_obj = "a_fl_2"},
				wpn_fps_upg_fl_ass_peq15 = {a_obj = "a_fl_2"}
			},
			forbids = {
				"wpn_fps_addon_ris"
			}
		},
		wpn_fps_upg_o_aimpoint_2 = {
			override = {
				wpn_fps_upg_fl_ass_smg_sho_peqbox = {a_obj = "a_fl_2"},
				wpn_fps_upg_fl_ass_laser = {a_obj = "a_fl_2"},
				wpn_fps_upg_fl_ass_peq15 = {a_obj = "a_fl_2"}
			},
			forbids = {
				"wpn_fps_addon_ris"
			}
		},
		wpn_fps_upg_o_docter = {
			override = {
				wpn_fps_upg_fl_ass_smg_sho_peqbox = {a_obj = "a_fl_2"},
				wpn_fps_upg_fl_ass_laser = {a_obj = "a_fl_2"},
				wpn_fps_upg_fl_ass_peq15 = {a_obj = "a_fl_2"}
			},
			forbids = {
				"wpn_fps_addon_ris"
			}
		},
		wpn_fps_upg_o_eotech = {
			override = {
				wpn_fps_upg_fl_ass_smg_sho_peqbox = {a_obj = "a_fl_2"},
				wpn_fps_upg_fl_ass_laser = {a_obj = "a_fl_2"},
				wpn_fps_upg_fl_ass_peq15 = {a_obj = "a_fl_2"}
			},
			forbids = {
				"wpn_fps_addon_ris"
			}
		},
		wpn_fps_upg_o_t1micro = {
			override = {
				wpn_fps_upg_fl_ass_smg_sho_peqbox = {a_obj = "a_fl_2"},
				wpn_fps_upg_fl_ass_laser = {a_obj = "a_fl_2"},
				wpn_fps_upg_fl_ass_peq15 = {a_obj = "a_fl_2"}
			},
			forbids = {
				"wpn_fps_addon_ris"
			}
		},
		wpn_fps_upg_o_cmore = {
			override = {
				wpn_fps_upg_fl_ass_smg_sho_peqbox = {a_obj = "a_fl_2"},
				wpn_fps_upg_fl_ass_laser = {a_obj = "a_fl_2"},
				wpn_fps_upg_fl_ass_peq15 = {a_obj = "a_fl_2"}
			},
			forbids = {
				"wpn_fps_addon_ris"
			}
		},
		wpn_fps_upg_o_acog = {
			override = {
				wpn_fps_upg_fl_ass_smg_sho_peqbox = {a_obj = "a_fl_2"},
				wpn_fps_upg_fl_ass_laser = {a_obj = "a_fl_2"},
				wpn_fps_upg_fl_ass_peq15 = {a_obj = "a_fl_2"}
			},
			forbids = {
				"wpn_fps_addon_ris"
			}
		},
		wpn_fps_upg_o_cs = {
			override = {
				wpn_fps_upg_fl_ass_smg_sho_peqbox = {a_obj = "a_fl_2"},
				wpn_fps_upg_fl_ass_laser = {a_obj = "a_fl_2"},
				wpn_fps_upg_fl_ass_peq15 = {a_obj = "a_fl_2"}
			},
			forbids = {
				"wpn_fps_addon_ris"
			}
		},
		wpn_fps_upg_o_eotech_xps = {
			override = {
				wpn_fps_upg_fl_ass_smg_sho_peqbox = {a_obj = "a_fl_2"},
				wpn_fps_upg_fl_ass_laser = {a_obj = "a_fl_2"},
				wpn_fps_upg_fl_ass_peq15 = {a_obj = "a_fl_2"}
			},
			forbids = {
				"wpn_fps_addon_ris"
			}
		},
		wpn_fps_upg_o_reflex = {
			override = {
				wpn_fps_upg_fl_ass_smg_sho_peqbox = {a_obj = "a_fl_2"},
				wpn_fps_upg_fl_ass_laser = {a_obj = "a_fl_2"},
				wpn_fps_upg_fl_ass_peq15 = {a_obj = "a_fl_2"}
			},
			forbids = {
				"wpn_fps_addon_ris"
			}
		},
		wpn_fps_upg_o_rx01 = {
			override = {
				wpn_fps_upg_fl_ass_smg_sho_peqbox = {a_obj = "a_fl_2"},
				wpn_fps_upg_fl_ass_laser = {a_obj = "a_fl_2"},
				wpn_fps_upg_fl_ass_peq15 = {a_obj = "a_fl_2"}
			},
			forbids = {
				"wpn_fps_addon_ris"
			}
		},
		wpn_fps_upg_o_rx30 = {
			override = {
				wpn_fps_upg_fl_ass_smg_sho_peqbox = {a_obj = "a_fl_2"},
				wpn_fps_upg_fl_ass_laser = {a_obj = "a_fl_2"},
				wpn_fps_upg_fl_ass_peq15 = {a_obj = "a_fl_2"}
			},
			forbids = {
				"wpn_fps_addon_ris"
			}
		},
		wpn_fps_ak_extra_ris = {a_obj = "a_fl_90"},
		wpn_fps_upg_fl_ass_smg_sho_surefire = {
			forbids = {
				"wpn_fps_addon_ris"
			},
			adds = {
				"wpn_fps_ak_extra_ris"
			}
		}
	}
	self.wpn_fps_sho_ksg.default_blueprint = {
		"wpn_fps_sho_ksg_b_standard",
		"wpn_fps_sho_ksg_body_standard",
		"wpn_fps_sho_ksg_s_collapsable",
		"wpn_fps_upg_o_dd_rear"
	}
	self.wpn_fps_sho_ksg.uses_parts = {
		"wpn_fps_sho_ksg_b_long",
		"wpn_fps_sho_ksg_b_standard",
		"wpn_fps_sho_ksg_b_short",
		"wpn_fps_sho_ksg_body_standard",
		"wpn_fps_sho_ksg_fg_standard",
		"wpn_fps_sho_ksg_s_collapsable",
		"wpn_fps_sho_ksg_s_collapsed",
		"wpn_fps_sho_ksg_s_solid",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_ns_shot_thick",
		"wpn_fps_upg_ns_shot_shark",
		"wpn_fps_upg_o_dd_rear",
		"wpn_fps_upg_o_mbus_rear",
		"wpn_fps_upg_shot_ns_king",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs"
	}
	self.wpn_fps_sho_ksg_npc = deep_clone(self.wpn_fps_sho_ksg)
	self.wpn_fps_sho_ksg_npc.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_sho_ksg/wpn_fps_sho_ksg_npc"
end

function WeaponFactoryTweakData_37:_init_gre_m79()
	self.parts.wpn_fps_gre_m79_barrel = {
		type = "barrel",
		name_id = "bm_wp_gre_m79_barrel",
		a_obj = "a_b",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_gre_m79_pts/wpn_fps_gre_m79_barrel",
		stats = {value = 1},
		adds = {
			"wpn_fps_gre_m79_sight_up"
		}
	}
	self.parts.wpn_fps_gre_m79_barrel_short = {
		pcs = {},
		type = "barrel",
		name_id = "bm_wp_m79_barrel_short",
		a_obj = "a_b",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_gre_m79_pts/wpn_fps_gre_m79_barrel_short",
		stats = {
			value = 1,
			recoil = 0,
			spread = -2,
			concealment = 4
		},
		forbids = {
			"wpn_fps_gre_m79_sight_up",
			"wpn_fps_gre_m79_sight_down"
		},
		texture_bundle_folder = "gage_pack_assault",
		dlc = "gage_pack_assault",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_gre_m79_sight_up = {
		type = "gadget",
		sub_type = "second_sight",
		name_id = "bm_wp_m79_sight_up",
		a_obj = "a_os",
		parent = "barrel",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_gre_m79_pts/wpn_fps_gre_m79_sight_up",
		stats = {
			value = 1,
			recoil = 0,
			spread = 0,
			gadget_zoom = 1
		},
		stance_mod = {
			wpn_fps_gre_m79 = {
				translation = Vector3(0, -8, -2),
				rotation = Rotation(0, -5, 0)
			}
		},
		perks = {"gadget"}
	}
	self.parts.wpn_fps_gre_m79_barrelcatch = {
		type = "drag_handle",
		name_id = "bm_wp_m79_barrelcatch",
		a_obj = "a_dh",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_gre_m79_pts/wpn_fps_gre_m79_barrelcatch",
		stats = {value = 1}
	}
	self.parts.wpn_fps_gre_m79_grenade = {
		type = "magazine",
		name_id = "bm_wp_gre_m79_grenade",
		a_obj = "a_m",
		bullet_objects = {prefix = "g_grenade_", amount = 1},
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_gre_m79_pts/wpn_fps_gre_m79_grenade",
		stats = {value = 1}
	}
	self.parts.wpn_fps_gre_m79_stock = {
		type = "stock",
		name_id = "bm_wp_m79_stock_short",
		a_obj = "a_body",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_gre_m79_pts/wpn_fps_gre_m79_stock",
		stats = {value = 1}
	}
	self.parts.wpn_fps_gre_m79_stock_short = {
		pcs = {},
		type = "stock",
		name_id = "bm_wp_gre_m79_s_leather",
		a_obj = "a_body",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_gre_m79_pts/wpn_fps_gre_m79_stock_short",
		stats = {
			value = 1,
			recoil = -1,
			spread = 0,
			concealment = 4
		},
		texture_bundle_folder = "gage_pack_assault",
		dlc = "gage_pack_assault",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_gre_m79_barrel.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_gre_m79_pts/wpn_third_gre_m79_barrel"
	self.parts.wpn_fps_gre_m79_barrel_short.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_gre_m79_pts/wpn_third_gre_m79_barrel_short"
	self.parts.wpn_fps_gre_m79_sight_up.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_gre_m79_pts/wpn_third_gre_m79_sight_up"
	self.parts.wpn_fps_gre_m79_barrelcatch.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_gre_m79_pts/wpn_third_gre_m79_barrelcatch"
	self.parts.wpn_fps_gre_m79_grenade.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_gre_m79_pts/wpn_third_gre_m79_grenade"
	self.parts.wpn_fps_gre_m79_stock.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_gre_m79_pts/wpn_third_gre_m79_stock"
	self.parts.wpn_fps_gre_m79_stock_short.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_gre_m79_pts/wpn_third_gre_m79_stock_short"
	self.wpn_fps_gre_m79 = {}
	self.wpn_fps_gre_m79.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_gre_m79/wpn_fps_gre_m79"
	self.wpn_fps_gre_m79.animations = {reload = "reload"}
	self.wpn_fps_gre_m79.default_blueprint = {
		"wpn_fps_gre_m79_barrel",
		"wpn_fps_gre_m79_barrelcatch",
		"wpn_fps_gre_m79_grenade",
		"wpn_fps_gre_m79_stock"
	}
	self.wpn_fps_gre_m79.uses_parts = {
		"wpn_fps_gre_m79_barrel",
		"wpn_fps_gre_m79_barrel_short",
		"wpn_fps_gre_m79_barrelcatch",
		"wpn_fps_gre_m79_m_standard",
		"wpn_fps_gre_m79_stock",
		"wpn_fps_gre_m79_stock_short",
		"wpn_fps_gre_m79_sight_up",
		"wpn_fps_gre_m79_grenade"
	}
	self.wpn_fps_gre_m79_npc = deep_clone(self.wpn_fps_gre_m79)
	self.wpn_fps_gre_m79_npc.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_gre_m79/wpn_fps_gre_m79_npc"
end

function WeaponFactoryTweakData_37:_init_g3()
	self.parts.wpn_fps_ass_g3_body_lower = {
		type = "upper_reciever",
		name_id = "bm_wp_g3_body_lower",
		a_obj = "a_body",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_body_lower",
		stats = {value = 2}
	}
	self.parts.wpn_fps_ass_g3_body_upper = {
		type = "upper_reciever",
		name_id = "bm_wp_g3_body_upper",
		a_obj = "a_body",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_body_upper",
		stats = {value = 2}
	}
	self.parts.wpn_fps_ass_g3_b_sniper = {
		pcs = {},
		type = "barrel",
		name_id = "bm_wp_g3_b_sniper",
		a_obj = "a_b",
		parent = "foregrip",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_b_sniper",
		stats = {
			value = 2,
			recoil = -2,
			spread = 2,
			concealment = -2,
			total_ammo_mod = -8,
			damage = 11,
			extra_ammo = -5
		},
		override = {
			wpn_fps_ass_g3_m_mag = {
				unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_m_mag_psg",
				third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_m_mag_psg"
			}
		},
		texture_bundle_folder = "gage_pack_assault",
		dlc = "gage_pack_assault",
		is_a_unlockable = true,
		adds = {
			"wpn_fps_ammo_type"
		}
	}
	self.parts.wpn_fps_ammo_type = {
		type = "ammo",
		a_obj = "a_m",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ammo_type",
		stats = {value = 1},
		custom_stats = {ammo_pickup_min_mul = 0.5, ammo_pickup_max_mul = 0.5}
	}
	self.parts.wpn_fps_ass_g3_b_short = {
		pcs = {},
		type = "barrel",
		name_id = "bm_wp_g3_b_short",
		a_obj = "a_b",
		parent = "foregrip",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_b_short",
		stats = {
			value = 2,
			recoil = 2,
			spread = -2,
			concealment = 4,
			damage = -1,
			total_ammo_mod = 5
		},
		texture_bundle_folder = "gage_pack_assault",
		dlc = "gage_pack_assault",
		is_a_unlockable = true,
		forbids = {
			"wpn_fps_ammo_type"
		},
		override = {
			wpn_fps_upg_ass_ns_jprifles = {a_obj = "a_ns_s"},
			wpn_fps_upg_ass_ns_surefire = {a_obj = "a_ns_s"}
		}
	}
	self.parts.wpn_fps_ass_g3_b_long = {
		type = "barrel",
		name_id = "bm_wp_g3_b_long",
		a_obj = "a_b",
		parent = "foregrip",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_b_long",
		stats = {value = 2},
		forbids = {
			"wpn_fps_ammo_type"
		},
		override = {
			wpn_fps_upg_ass_ns_jprifles = {a_obj = "a_ns_s"},
			wpn_fps_upg_ass_ns_surefire = {a_obj = "a_ns_s"}
		}
	}
	self.parts.wpn_fps_ass_g3_body_rail = {
		type = "upper_reciever",
		name_id = "bm_wp_g3_b_long",
		a_obj = "a_body",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_body_rail",
		stats = {value = 2}
	}
	self.parts.wpn_fps_ass_g3_fg_bipod = {
		type = "foregrip",
		name_id = "bm_wp_g3_fg_standard",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_fg_bipod",
		stats = {value = 2},
		animations = {reload = "reload"}
	}
	self.parts.wpn_fps_ass_g3_fg_psg = {
		pcs = {},
		type = "foregrip",
		name_id = "bm_wp_g3_fg_psg",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_fg_psg",
		stats = {
			value = 2,
			recoil = -1,
			spread = 1,
			concealment = -1
		},
		texture_bundle_folder = "gage_pack_assault",
		dlc = "gage_pack_assault",
		is_a_unlockable = true,
		animations = {reload = "reload"}
	}
	self.parts.wpn_fps_ass_g3_fg_railed = {
		pcs = {},
		type = "foregrip",
		name_id = "bm_wp_g3_fg_railed",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_fg_railed",
		stats = {
			value = 2,
			recoil = 2,
			spread = 0,
			concealment = -2
		},
		texture_bundle_folder = "gage_pack_assault",
		dlc = "gage_pack_assault",
		is_a_unlockable = true,
		animations = {reload = "reload"}
	}
	self.parts.wpn_fps_ass_g3_fg_retro = {
		pcs = {},
		type = "foregrip",
		name_id = "bm_wp_g3_fg_retro",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_fg_retro",
		stats = {
			value = 2,
			recoil = 3,
			spread = -1,
			concealment = 2
		},
		texture_bundle_folder = "gage_pack_assault",
		dlc = "gage_pack_assault",
		is_a_unlockable = true,
		animations = {reload = "reload"}
	}
	self.parts.wpn_fps_ass_g3_fg_retro_plastic = {
		pcs = {},
		type = "foregrip",
		name_id = "bm_wp_g3_fg_retro_plastic",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_fg_retro_plastic",
		stats = {
			value = 2,
			recoil = 0,
			spread = -1,
			concealment = 4
		},
		texture_bundle_folder = "gage_pack_assault",
		dlc = "gage_pack_assault",
		is_a_unlockable = true,
		animations = {reload = "reload"}
	}
	self.parts.wpn_fps_ass_g3_g_retro = {
		pcs = {},
		type = "grip",
		name_id = "bm_wp_g3_g_retro",
		a_obj = "a_g",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_g_retro",
		stats = {
			value = 2,
			recoil = 2,
			spread = 0,
			concealment = 0
		},
		texture_bundle_folder = "gage_pack_assault",
		dlc = "gage_pack_assault",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_ass_g3_g_sniper = {
		pcs = {},
		type = "grip",
		name_id = "bm_wp_g3_g_sniper",
		a_obj = "a_g",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_g_sniper",
		stats = {
			value = 2,
			recoil = -1,
			spread = 2,
			concealment = -1
		},
		texture_bundle_folder = "gage_pack_assault",
		dlc = "gage_pack_assault",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_ass_g3_m_mag = {
		type = "magazine",
		name_id = "bm_wp_g3_m_standard",
		a_obj = "a_m",
		bullet_objects = {prefix = "g_bullet_", amount = 2},
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_m_mag",
		stats = {value = 2},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_ass_g3_s_sniper = {
		pcs = {},
		type = "stock",
		name_id = "bm_wp_g3_s_sniper",
		a_obj = "a_s",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_s_sniper",
		stats = {
			value = 2,
			recoil = -1,
			spread = 2,
			concealment = -1
		},
		texture_bundle_folder = "gage_pack_assault",
		dlc = "gage_pack_assault",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_ass_g3_s_wood = {
		pcs = {},
		type = "stock",
		name_id = "bm_wp_g3_s_wood",
		a_obj = "a_s",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_s_wood",
		stats = {
			value = 2,
			recoil = 3,
			spread = 0,
			concealment = -1
		},
		texture_bundle_folder = "gage_pack_assault",
		dlc = "gage_pack_assault",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_ass_g3_body_lower.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_body_lower"
	self.parts.wpn_fps_ass_g3_body_upper.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_body_upper"
	self.parts.wpn_fps_ass_g3_b_sniper.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_b_sniper"
	self.parts.wpn_fps_ass_g3_b_short.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_b_short"
	self.parts.wpn_fps_ass_g3_b_long.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_b_long"
	self.parts.wpn_fps_ass_g3_body_rail.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_body_rail"
	self.parts.wpn_fps_ass_g3_fg_bipod.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_fg_bipod"
	self.parts.wpn_fps_ass_g3_fg_psg.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_fg_psg"
	self.parts.wpn_fps_ass_g3_fg_railed.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_fg_railed"
	self.parts.wpn_fps_ass_g3_fg_retro.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_fg_retro"
	self.parts.wpn_fps_ass_g3_fg_retro_plastic.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_fg_retro_plastic"
	self.parts.wpn_fps_ass_g3_g_retro.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_g_retro"
	self.parts.wpn_fps_ass_g3_g_sniper.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_g_sniper"
	self.parts.wpn_fps_ass_g3_m_mag.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_m_mag"
	self.parts.wpn_fps_ass_g3_s_sniper.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_s_sniper"
	self.parts.wpn_fps_ass_g3_s_wood.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_s_standard"
	self.wpn_fps_ass_g3 = {}
	self.wpn_fps_ass_g3.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3/wpn_fps_ass_g3"
	self.wpn_fps_ass_g3.optional_types = {"barrel_ext", "gadget"}
	self.wpn_fps_ass_g3.override = {}
	self.wpn_fps_ass_g3.adds = {
		wpn_fps_upg_o_specter = {
			"wpn_fps_ass_g3_body_rail"
		},
		wpn_fps_upg_o_aimpoint = {
			"wpn_fps_ass_g3_body_rail"
		},
		wpn_fps_upg_o_aimpoint_2 = {
			"wpn_fps_ass_g3_body_rail"
		},
		wpn_fps_upg_o_docter = {
			"wpn_fps_ass_g3_body_rail"
		},
		wpn_fps_upg_o_eotech = {
			"wpn_fps_ass_g3_body_rail"
		},
		wpn_fps_upg_o_t1micro = {
			"wpn_fps_ass_g3_body_rail"
		},
		wpn_fps_upg_o_cmore = {
			"wpn_fps_ass_g3_body_rail"
		},
		wpn_fps_upg_o_acog = {
			"wpn_fps_ass_g3_body_rail"
		},
		wpn_fps_upg_o_cs = {
			"wpn_fps_ass_g3_body_rail"
		},
		wpn_fps_upg_o_eotech_xps = {
			"wpn_fps_ass_g3_body_rail"
		},
		wpn_fps_upg_o_reflex = {
			"wpn_fps_ass_g3_body_rail"
		},
		wpn_fps_upg_o_rx01 = {
			"wpn_fps_ass_g3_body_rail"
		},
		wpn_fps_upg_o_rx30 = {
			"wpn_fps_ass_g3_body_rail"
		}
	}
	self.wpn_fps_ass_g3.default_blueprint = {
		"wpn_fps_ass_g3_b_long",
		"wpn_fps_ass_g3_body_lower",
		"wpn_fps_ass_g3_body_upper",
		"wpn_fps_ass_g3_fg_bipod",
		"wpn_fps_lmg_hk21_g_standard",
		"wpn_fps_ass_g3_m_mag",
		"wpn_fps_lmg_hk21_s_standard"
	}
	self.wpn_fps_ass_g3.uses_parts = {
		"wpn_fps_ass_g3_body_lower",
		"wpn_fps_ass_g3_body_upper",
		"wpn_fps_ass_g3_fg_bipod",
		"wpn_fps_ass_g3_m_mag",
		"wpn_fps_ass_g3_b_short",
		"wpn_fps_ass_g3_b_long",
		"wpn_fps_ass_g3_b_sniper",
		"wpn_fps_ass_g3_fg_psg",
		"wpn_fps_ass_g3_fg_railed",
		"wpn_fps_ass_g3_fg_retro",
		"wpn_fps_ass_g3_fg_retro_plastic",
		"wpn_fps_ass_g3_g_retro",
		"wpn_fps_ass_g3_g_sniper",
		"wpn_fps_ass_g3_s_sniper",
		"wpn_fps_ass_g3_s_wood",
		"wpn_fps_lmg_hk21_g_standard",
		"wpn_fps_lmg_hk21_s_standard",
		"wpn_fps_upg_i_singlefire",
		"wpn_fps_upg_i_autofire",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser"
	}
	self.wpn_fps_ass_g3_npc = deep_clone(self.wpn_fps_ass_g3)
	self.wpn_fps_ass_g3_npc.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3/wpn_fps_ass_g3_npc"
end

function WeaponFactoryTweakData_37:_init_galil()
	self.parts.wpn_fps_ass_galil_body_standard = {
		type = "upper_reciever",
		name_id = "bm_wp_galil_body_standard",
		a_obj = "a_body",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_body_standard",
		stats = {value = 2},
		texture_bundle_folder = "big_bank",
		dlc = "big_bank",
		is_a_unlockable = true,
		animations = {reload = "reload"}
	}
	self.parts.wpn_fps_ass_galil_fg_fab = {
		pcs = {},
		type = "barrel",
		name_id = "bm_wp_galil_fg_fab",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_fg_fab",
		stats = {
			value = 2,
			recoil = 2,
			spread = 1,
			concealment = -1
		},
		forbids = {
			"wpn_fps_shot_r870_ris_special"
		},
		override = {
			wpn_fps_upg_o_specter = {
				a_obj = "a_os_fab",
				stance_mod = {
					wpn_fps_ass_galil = {
						translation = Vector3(0, 0, -3.5)
					}
				}
			},
			wpn_fps_upg_o_aimpoint = {
				a_obj = "a_os_fab",
				stance_mod = {
					wpn_fps_ass_galil = {
						translation = Vector3(0, 0, -3.5)
					}
				}
			},
			wpn_fps_upg_o_aimpoint_2 = {
				a_obj = "a_os_fab",
				stance_mod = {
					wpn_fps_ass_galil = {
						translation = Vector3(0, 0, -3.5)
					}
				}
			},
			wpn_fps_upg_o_docter = {
				a_obj = "a_os_fab",
				stance_mod = {
					wpn_fps_ass_galil = {
						translation = Vector3(0, 0, -3.5)
					}
				}
			},
			wpn_fps_upg_o_eotech = {
				a_obj = "a_os_fab",
				stance_mod = {
					wpn_fps_ass_galil = {
						translation = Vector3(0, 0, -3.5)
					}
				}
			},
			wpn_fps_upg_o_t1micro = {
				a_obj = "a_os_fab",
				stance_mod = {
					wpn_fps_ass_galil = {
						translation = Vector3(0, 0, -3.5)
					}
				}
			},
			wpn_fps_upg_o_cmore = {
				a_obj = "a_os_fab",
				stance_mod = {
					wpn_fps_ass_galil = {
						translation = Vector3(0, 0, -3.5)
					}
				}
			},
			wpn_fps_upg_o_acog = {
				a_obj = "a_os_fab",
				stance_mod = {
					wpn_fps_ass_galil = {
						translation = Vector3(0, 0, -3.5)
					}
				}
			},
			wpn_fps_upg_o_cs = {
				a_obj = "a_os_fab",
				stance_mod = {
					wpn_fps_ass_galil = {
						translation = Vector3(0, 0, -3.5)
					}
				}
			},
			wpn_fps_upg_o_eotech_xps = {
				a_obj = "a_os_fab",
				stance_mod = {
					wpn_fps_ass_galil = {
						translation = Vector3(0, 0, -3.5)
					}
				}
			},
			wpn_fps_upg_o_reflex = {
				a_obj = "a_os_fab",
				stance_mod = {
					wpn_fps_ass_galil = {
						translation = Vector3(0, 0, -3.5)
					}
				}
			},
			wpn_fps_upg_o_rx01 = {
				a_obj = "a_os_fab",
				stance_mod = {
					wpn_fps_ass_galil = {
						translation = Vector3(0, 0, -3.5)
					}
				}
			},
			wpn_fps_upg_o_rx30 = {
				a_obj = "a_os_fab",
				stance_mod = {
					wpn_fps_ass_galil = {
						translation = Vector3(0, 0, -3.5)
					}
				}
			},
			wpn_fps_upg_ass_ns_jprifles = {a_obj = "a_ns_s"},
			wpn_fps_upg_ass_ns_surefire = {a_obj = "a_ns_s"}
		},
		forbids = {
			"wpn_fps_addon_ris",
			"wpn_fps_shot_r870_ris_special"
		},
		texture_bundle_folder = "gage_pack_assault",
		dlc = "gage_pack_assault",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_ass_galil_fg_mar = {
		pcs = {},
		type = "barrel",
		name_id = "bm_wp_galil_fg_mar",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_fg_mar",
		stats = {
			value = 2,
			recoil = -1,
			spread = -1,
			concealment = 4,
			damage = 2
		},
		forbids = {
			"wpn_fps_shot_r870_ris_special"
		},
		override = {
			wpn_fps_upg_o_specter = {
				a_obj = "a_os_mar",
				stance_mod = {
					wpn_fps_ass_galil = {
						translation = Vector3(0, -8, -2.2)
					}
				}
			},
			wpn_fps_upg_o_aimpoint = {
				a_obj = "a_os_mar",
				stance_mod = {
					wpn_fps_ass_galil = {
						translation = Vector3(0, -8, -2.2)
					}
				}
			},
			wpn_fps_upg_o_aimpoint_2 = {
				a_obj = "a_os_mar",
				stance_mod = {
					wpn_fps_ass_galil = {
						translation = Vector3(0, -8, -2.2)
					}
				}
			},
			wpn_fps_upg_o_docter = {
				a_obj = "a_os_mar",
				stance_mod = {
					wpn_fps_ass_galil = {
						translation = Vector3(0, -8, -2.2)
					}
				}
			},
			wpn_fps_upg_o_eotech = {
				a_obj = "a_os_mar",
				stance_mod = {
					wpn_fps_ass_galil = {
						translation = Vector3(0, -8, -2.2)
					}
				}
			},
			wpn_fps_upg_o_t1micro = {
				a_obj = "a_os_mar",
				stance_mod = {
					wpn_fps_ass_galil = {
						translation = Vector3(0, -8, -2.2)
					}
				}
			},
			wpn_fps_upg_o_cmore = {
				a_obj = "a_os_mar",
				stance_mod = {
					wpn_fps_ass_galil = {
						translation = Vector3(0, -8, -2.2)
					}
				}
			},
			wpn_fps_upg_o_acog = {
				a_obj = "a_os_mar",
				stance_mod = {
					wpn_fps_ass_galil = {
						translation = Vector3(0, -8, -2.2)
					}
				}
			},
			wpn_fps_upg_o_cs = {
				a_obj = "a_os_mar",
				stance_mod = {
					wpn_fps_ass_galil = {
						translation = Vector3(0, -8, -2.2)
					}
				}
			},
			wpn_fps_upg_o_eotech_xps = {
				a_obj = "a_os_mar",
				stance_mod = {
					wpn_fps_ass_galil = {
						translation = Vector3(0, -8, -2.2)
					}
				}
			},
			wpn_fps_upg_o_reflex = {
				a_obj = "a_os_mar",
				stance_mod = {
					wpn_fps_ass_galil = {
						translation = Vector3(0, -8, -2.2)
					}
				}
			},
			wpn_fps_upg_o_rx01 = {
				a_obj = "a_os_mar",
				stance_mod = {
					wpn_fps_ass_galil = {
						translation = Vector3(0, -8, -2.2)
					}
				}
			},
			wpn_fps_upg_o_rx30 = {
				a_obj = "a_os_mar",
				stance_mod = {
					wpn_fps_ass_galil = {
						translation = Vector3(0, -8, -2.2)
					}
				}
			},
			wpn_fps_upg_ass_ns_jprifles = {a_obj = "a_ns_s"},
			wpn_fps_upg_ass_ns_surefire = {a_obj = "a_ns_s"}
		},
		forbids = {
			"wpn_fps_shot_r870_ris_special"
		},
		texture_bundle_folder = "gage_pack_assault",
		dlc = "gage_pack_assault",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_ass_galil_fg_sar = {
		pcs = {},
		type = "barrel",
		name_id = "bm_wp_galil_fg_sar",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_fg_sar",
		stats = {
			value = 2,
			recoil = 0,
			spread = 0,
			concealment = 1,
			damage = 1
		},
		texture_bundle_folder = "gage_pack_assault",
		dlc = "gage_pack_assault",
		is_a_unlockable = true,
		override = {
			wpn_fps_upg_ass_ns_jprifles = {a_obj = "a_ns_s"},
			wpn_fps_upg_ass_ns_surefire = {a_obj = "a_ns_s"}
		}
	}
	self.parts.wpn_fps_ass_galil_fg_sniper = {
		pcs = {},
		type = "barrel",
		name_id = "bm_wp_galil_fg_sniper",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_fg_sniper",
		stats = {
			value = 2,
			recoil = -1,
			spread = 3,
			concealment = -2
		},
		texture_bundle_folder = "gage_pack_assault",
		dlc = "gage_pack_assault",
		is_a_unlockable = true,
		override = {
			wpn_fps_upg_ass_ns_jprifles = {a_obj = "a_ns_s"},
			wpn_fps_upg_ass_ns_surefire = {a_obj = "a_ns_s"},
			wpn_fps_upg_ass_ns_linear = {a_obj = "a_ns_s"},
			wpn_fps_upg_ns_ass_smg_firepig = {a_obj = "a_ns_s"},
			wpn_fps_upg_ns_ass_smg_stubby = {a_obj = "a_ns_s"},
			wpn_fps_upg_ns_ass_smg_tank = {a_obj = "a_ns_s"}
		}
	}
	self.parts.wpn_fps_ass_galil_fg_standard = {
		type = "barrel",
		name_id = "bm_wp_galil_fg_standard",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_fg_standard",
		stats = {value = 2},
		override = {
			wpn_fps_upg_ass_ns_jprifles = {a_obj = "a_ns_s"},
			wpn_fps_upg_ass_ns_surefire = {a_obj = "a_ns_s"}
		}
	}
	self.parts.wpn_fps_ass_galil_g_standard = {
		type = "grip",
		name_id = "bm_wp_galil_g_standard",
		a_obj = "a_g",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_g_standard",
		stats = {value = 2}
	}
	self.parts.wpn_fps_ass_galil_g_sniper = {
		pcs = {},
		type = "grip",
		name_id = "bm_wp_galil_g_sniper",
		a_obj = "a_g",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_g_sniper",
		stats = {
			value = 2,
			recoil = -1,
			spread = 1,
			concealment = -1
		},
		texture_bundle_folder = "gage_pack_assault",
		dlc = "gage_pack_assault",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_ass_galil_m_standard = {
		type = "magazine",
		name_id = "bm_wp_galil_m_standard",
		a_obj = "a_m",
		bullet_objects = {prefix = "g_bullet_", amount = 1},
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_m_standard",
		stats = {value = 2},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_ass_galil_s_fab = {
		pcs = {},
		type = "stock",
		name_id = "bm_wp_galil_s_fab",
		a_obj = "a_s",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_s_fab",
		stats = {
			value = 2,
			recoil = -1,
			spread = 1,
			concealment = 3
		},
		texture_bundle_folder = "gage_pack_assault",
		dlc = "gage_pack_assault",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_ass_galil_s_light = {
		pcs = {},
		type = "stock",
		name_id = "bm_wp_galil_s_light",
		a_obj = "a_s",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_s_light",
		stats = {
			value = 2,
			recoil = 1,
			spread = 0,
			concealment = 2
		},
		texture_bundle_folder = "gage_pack_assault",
		dlc = "gage_pack_assault",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_ass_galil_s_plastic = {
		pcs = {},
		type = "stock",
		name_id = "bm_wp_galil_s_plastic",
		a_obj = "a_s",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_s_plastic",
		stats = {
			value = 2,
			recoil = -2,
			spread = 2,
			concealment = 1
		},
		texture_bundle_folder = "gage_pack_assault",
		dlc = "gage_pack_assault",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_ass_galil_s_skeletal = {
		pcs = {},
		type = "stock",
		name_id = "bm_wp_galil_s_skeletal",
		a_obj = "a_s",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_s_skeletal",
		stats = {
			value = 2,
			recoil = 3,
			spread = -1,
			concealment = 1
		},
		texture_bundle_folder = "gage_pack_assault",
		dlc = "gage_pack_assault",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_ass_galil_s_sniper = {
		pcs = {},
		type = "stock",
		name_id = "bm_wp_galil_s_sniper",
		a_obj = "a_s",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_s_sniper",
		stats = {
			value = 2,
			recoil = -3,
			spread = 3,
			concealment = -2
		},
		texture_bundle_folder = "gage_pack_assault",
		dlc = "gage_pack_assault",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_ass_galil_s_standard = {
		type = "stock",
		name_id = "bm_wp_galil_s_standard",
		a_obj = "a_s",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_s_standard",
		stats = {value = 2}
	}
	self.parts.wpn_fps_ass_galil_s_wood = {
		pcs = {},
		type = "stock",
		name_id = "bm_wp_galil_s_wood",
		a_obj = "a_s",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_s_wood",
		stats = {
			value = 2,
			recoil = 4,
			spread = 0,
			concealment = -2
		},
		texture_bundle_folder = "gage_pack_assault",
		dlc = "gage_pack_assault",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_ass_galil_body_standard.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_body_standard"
	self.parts.wpn_fps_ass_galil_fg_fab.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_fg_fab"
	self.parts.wpn_fps_ass_galil_fg_mar.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_fg_mar"
	self.parts.wpn_fps_ass_galil_fg_sar.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_fg_sar"
	self.parts.wpn_fps_ass_galil_fg_sniper.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_fg_sniper"
	self.parts.wpn_fps_ass_galil_fg_standard.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_fg_standard"
	self.parts.wpn_fps_ass_galil_g_standard.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_g_standard"
	self.parts.wpn_fps_ass_galil_g_sniper.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_g_sniper"
	self.parts.wpn_fps_ass_galil_m_standard.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_m_standard"
	self.parts.wpn_fps_ass_galil_s_fab.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_s_fab"
	self.parts.wpn_fps_ass_galil_s_light.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_s_light"
	self.parts.wpn_fps_ass_galil_s_plastic.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_s_plastic"
	self.parts.wpn_fps_ass_galil_s_skeletal.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_s_skeletal"
	self.parts.wpn_fps_ass_galil_s_sniper.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_s_sniper"
	self.parts.wpn_fps_ass_galil_s_standard.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_s_standard"
	self.parts.wpn_fps_ass_galil_s_wood.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_s_wood"
	self.wpn_fps_ass_galil = {}
	self.wpn_fps_ass_galil.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil/wpn_fps_ass_galil"
	self.wpn_fps_ass_galil.optional_types = {"barrel_ext", "gadget"}
	self.wpn_fps_ass_galil.override = {}
	self.wpn_fps_ass_galil.adds = {
		wpn_fps_upg_o_specter = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_aimpoint = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_aimpoint_2 = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_docter = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_eotech = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_t1micro = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_cmore = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_acog = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_cs = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_eotech_xps = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_reflex = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_rx01 = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_rx30 = {
			"wpn_fps_shot_r870_ris_special"
		}
	}
	self.wpn_fps_ass_galil.default_blueprint = {
		"wpn_fps_ass_galil_body_standard",
		"wpn_fps_ass_galil_fg_standard",
		"wpn_fps_ass_galil_m_standard",
		"wpn_fps_ass_galil_s_standard",
		"wpn_fps_ass_galil_g_standard"
	}
	self.wpn_fps_ass_galil.uses_parts = {
		"wpn_fps_ass_galil_body_standard",
		"wpn_fps_ass_galil_fg_fab",
		"wpn_fps_ass_galil_fg_mar",
		"wpn_fps_ass_galil_fg_sar",
		"wpn_fps_ass_galil_fg_sniper",
		"wpn_fps_ass_galil_fg_standard",
		"wpn_fps_ass_galil_g_standard",
		"wpn_fps_ass_galil_g_sniper",
		"wpn_fps_ass_galil_m_standard",
		"wpn_fps_ass_galil_s_fab",
		"wpn_fps_ass_galil_s_light",
		"wpn_fps_ass_galil_s_plastic",
		"wpn_fps_ass_galil_s_skeletal",
		"wpn_fps_ass_galil_s_sniper",
		"wpn_fps_ass_galil_s_standard",
		"wpn_fps_ass_galil_s_wood",
		"wpn_fps_upg_i_singlefire",
		"wpn_fps_upg_i_autofire",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser"
	}
	self.wpn_fps_ass_galil_npc = deep_clone(self.wpn_fps_ass_galil)
	self.wpn_fps_ass_galil_npc.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil/wpn_fps_ass_galil_npc"
end

function WeaponFactoryTweakData_37:_init_famas()
	self.parts.wpn_fps_ass_famas_body_standard = {
		type = "upper_reciever",
		name_id = "bm_wp_famas_body_standard",
		a_obj = "a_body",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_famas_pts/wpn_fps_ass_famas_body_standard",
		stats = {value = 2},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	}
	self.parts.wpn_fps_ass_famas_b_long = {
		pcs = {},
		type = "barrel",
		name_id = "bm_wp_famas_b_long",
		a_obj = "a_b",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_famas_pts/wpn_fps_ass_famas_b_long",
		stats = {
			value = 2,
			recoil = 1,
			spread = 0,
			concealment = -1,
			damage = 1
		},
		override = {
			wpn_fps_upg_ns_ass_smg_large = {a_obj = "a_ns_s"},
			wpn_fps_upg_ns_ass_smg_medium = {a_obj = "a_ns_s"},
			wpn_fps_upg_ns_ass_smg_small = {a_obj = "a_ns_s"},
			wpn_fps_upg_ass_ns_jprifles = {a_obj = "a_ns_n"}
		},
		texture_bundle_folder = "gage_pack_assault",
		dlc = "gage_pack_assault",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_ass_famas_b_short = {
		pcs = {},
		type = "barrel",
		name_id = "bm_wp_famas_b_short",
		a_obj = "a_b",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_famas_pts/wpn_fps_ass_famas_b_short",
		stats = {
			value = 2,
			recoil = -1,
			spread = -1,
			concealment = 2,
			damage = 3
		},
		override = {
			wpn_fps_upg_ns_ass_smg_large = {a_obj = "a_ns_s"},
			wpn_fps_upg_ns_ass_smg_medium = {a_obj = "a_ns_s"},
			wpn_fps_upg_ns_ass_smg_small = {a_obj = "a_ns_s"},
			wpn_fps_upg_ass_ns_jprifles = {a_obj = "a_ns_n"}
		},
		texture_bundle_folder = "gage_pack_assault",
		dlc = "gage_pack_assault",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_ass_famas_b_sniper = {
		pcs = {},
		type = "barrel",
		name_id = "bm_wp_famas_b_sniper",
		a_obj = "a_b",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_famas_pts/wpn_fps_ass_famas_b_sniper",
		stats = {
			value = 2,
			recoil = -1,
			spread = 1,
			concealment = -2,
			damage = 1
		},
		override = {
			wpn_fps_upg_ns_ass_smg_large = {a_obj = "a_ns_s"},
			wpn_fps_upg_ns_ass_smg_medium = {a_obj = "a_ns_s"},
			wpn_fps_upg_ns_ass_smg_small = {a_obj = "a_ns_s"},
			wpn_fps_upg_ass_ns_jprifles = {a_obj = "a_ns_n"}
		},
		texture_bundle_folder = "gage_pack_assault",
		dlc = "gage_pack_assault",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_ass_famas_b_suppressed = {
		pcs = {},
		type = "barrel",
		sub_type = "silencer",
		name_id = "bm_wp_famas_b_suppressed",
		a_obj = "a_b",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_famas_pts/wpn_fps_ass_famas_b_suppressed",
		stats = {
			value = 4,
			suppression = 12,
			alert_size = 12,
			spread = 2,
			damage = 0,
			recoil = 0,
			spread_moving = 1,
			concealment = -1
		},
		perks = {"silencer"},
		sound_switch = {
			suppressed = "suppressed_c"
		},
		forbids = {
			"wpn_fps_upg_ns_ass_smg_large",
			"wpn_fps_upg_ns_ass_smg_medium",
			"wpn_fps_upg_ns_ass_smg_small",
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_ass_ns_surefire"
		},
		texture_bundle_folder = "gage_pack_assault",
		dlc = "gage_pack_assault",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_ass_famas_b_standard = {
		type = "barrel",
		name_id = "bm_wp_famas_b_standard",
		a_obj = "a_b",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_famas_pts/wpn_fps_ass_famas_b_standard",
		stats = {value = 2}
	}
	self.parts.wpn_fps_ass_famas_o_adapter = {
		type = "grip",
		name_id = "bm_wp_famas_o_extra",
		a_obj = "a_o",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_famas_pts/wpn_fps_ass_famas_o_adapter",
		stats = {value = 2}
	}
	self.parts.wpn_fps_ass_famas_g_standard = {
		type = "grip",
		name_id = "bm_wp_famas_g_standard",
		a_obj = "a_g",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_famas_pts/wpn_fps_ass_famas_g_standard",
		stats = {value = 2}
	}
	self.parts.wpn_fps_ass_famas_g_retro = {
		pcs = {},
		type = "grip",
		name_id = "bm_wp_famas_g_retro",
		a_obj = "a_g",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_famas_pts/wpn_fps_ass_famas_g_retro",
		stats = {
			value = 2,
			recoil = 1,
			spread = 2,
			concealment = -1
		},
		texture_bundle_folder = "gage_pack_assault",
		dlc = "gage_pack_assault",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_ass_famas_m_standard = {
		type = "magazine",
		name_id = "bm_wp_famas_m_standard",
		a_obj = "a_m",
		bullet_objects = {prefix = "g_bullet_", amount = 1},
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_famas_pts/wpn_fps_ass_famas_m_standard",
		stats = {value = 2},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_ass_famas_body_standard.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_famas_pts/wpn_third_ass_famas_body_standard"
	self.parts.wpn_fps_ass_famas_b_long.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_famas_pts/wpn_third_ass_famas_b_long"
	self.parts.wpn_fps_ass_famas_b_short.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_famas_pts/wpn_third_ass_famas_b_short"
	self.parts.wpn_fps_ass_famas_b_sniper.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_famas_pts/wpn_third_ass_famas_b_sniper"
	self.parts.wpn_fps_ass_famas_b_suppressed.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_famas_pts/wpn_third_ass_famas_b_suppressed"
	self.parts.wpn_fps_ass_famas_b_standard.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_famas_pts/wpn_third_ass_famas_b_standard"
	self.parts.wpn_fps_ass_famas_o_adapter.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_famas_pts/wpn_third_ass_famas_o_adapter"
	self.parts.wpn_fps_ass_famas_g_standard.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_famas_pts/wpn_third_ass_famas_g_standard"
	self.parts.wpn_fps_ass_famas_g_retro.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_famas_pts/wpn_third_ass_famas_g_retro"
	self.parts.wpn_fps_ass_famas_m_standard.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_famas_pts/wpn_third_ass_famas_m_standard"
	self.wpn_fps_ass_famas = {}
	self.wpn_fps_ass_famas.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_famas/wpn_fps_ass_famas"
	self.wpn_fps_ass_famas.optional_types = {"barrel_ext", "gadget"}
	self.wpn_fps_ass_famas.override = {}
	self.wpn_fps_ass_famas.adds = {
		wpn_fps_upg_o_specter = {
			"wpn_fps_ass_famas_o_adapter"
		},
		wpn_fps_upg_o_aimpoint = {
			"wpn_fps_ass_famas_o_adapter"
		},
		wpn_fps_upg_o_aimpoint_2 = {
			"wpn_fps_ass_famas_o_adapter"
		},
		wpn_fps_upg_o_docter = {
			"wpn_fps_ass_famas_o_adapter"
		},
		wpn_fps_upg_o_eotech = {
			"wpn_fps_ass_famas_o_adapter"
		},
		wpn_fps_upg_o_t1micro = {
			"wpn_fps_ass_famas_o_adapter"
		},
		wpn_fps_upg_o_cmore = {
			"wpn_fps_ass_famas_o_adapter"
		},
		wpn_fps_upg_o_acog = {
			"wpn_fps_ass_famas_o_adapter"
		},
		wpn_fps_upg_o_cs = {
			"wpn_fps_ass_famas_o_adapter"
		},
		wpn_fps_upg_o_eotech_xps = {
			"wpn_fps_ass_famas_o_adapter"
		},
		wpn_fps_upg_o_reflex = {
			"wpn_fps_ass_famas_o_adapter"
		},
		wpn_fps_upg_o_rx01 = {
			"wpn_fps_ass_famas_o_adapter"
		},
		wpn_fps_upg_o_rx30 = {
			"wpn_fps_ass_famas_o_adapter"
		}
	}
	self.wpn_fps_ass_famas.default_blueprint = {
		"wpn_fps_ass_famas_body_standard",
		"wpn_fps_ass_famas_b_standard",
		"wpn_fps_ass_famas_g_standard",
		"wpn_fps_ass_famas_m_standard"
	}
	self.wpn_fps_ass_famas.uses_parts = {
		"wpn_fps_ass_famas_body_standard",
		"wpn_fps_ass_famas_b_long",
		"wpn_fps_ass_famas_b_standard",
		"wpn_fps_ass_famas_b_short",
		"wpn_fps_ass_famas_b_sniper",
		"wpn_fps_ass_famas_b_suppressed",
		"wpn_fps_ass_famas_g_retro",
		"wpn_fps_ass_famas_g_standard",
		"wpn_fps_ass_famas_m_standard",
		"wpn_fps_upg_i_singlefire",
		"wpn_fps_upg_i_autofire",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser"
	}
	self.wpn_fps_ass_famas_npc = deep_clone(self.wpn_fps_ass_famas)
	self.wpn_fps_ass_famas_npc.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_famas/wpn_fps_ass_famas_npc"
end

function WeaponFactoryTweakData_37:_init_scorpion()
	self.parts.wpn_fps_smg_scorpion_b_standard = {
		type = "barrel",
		name_id = "bm_wp_serbu_s_nostock_short",
		texture_bundle_folder = "dlc1",
		a_obj = "a_b",
		unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_scorpion_pts/wpn_fps_smg_scorpion_b_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_scorpion_b_suppressed = {
		pcs = {},
		type = "barrel_ext",
		sub_type = "silencer",
		name_id = "bm_wp_scorpion_b_suppressed",
		a_obj = "a_b",
		unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_scorpion_pts/wpn_fps_smg_scorpion_b_suppressed",
		stats = {
			value = 5,
			suppression = 12,
			alert_size = 12,
			spread = -1,
			damage = 0,
			recoil = 1,
			spread_moving = 1,
			concealment = -2
		},
		perks = {"silencer"},
		sound_switch = {
			suppressed = "suppressed_a"
		},
		dlc = "hl_miami",
		texture_bundle_folder = "hl_miami",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_smg_scorpion_body_standard = {
		type = "upper_reciever",
		name_id = "bm_wp_serbu_s_nostock_short",
		texture_bundle_folder = "dlc1",
		a_obj = "a_body",
		unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_scorpion_pts/wpn_fps_smg_scorpion_body_standard",
		stats = {value = 1},
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	}
	self.parts.wpn_fps_smg_scorpion_g_standard = {
		type = "grip",
		name_id = "bm_wp_serbu_s_nostock_short",
		texture_bundle_folder = "dlc1",
		a_obj = "a_g",
		unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_scorpion_pts/wpn_fps_smg_scorpion_g_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_scorpion_g_wood = {
		pcs = {},
		type = "grip",
		name_id = "bm_wp_scorpion_g_wood",
		texture_bundle_folder = "dlc1",
		a_obj = "a_g",
		unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_scorpion_pts/wpn_fps_smg_scorpion_g_wood",
		stats = {
			value = 1,
			recoil = 1,
			spread = 1,
			recoil = 1,
			concealment = -1
		},
		dlc = "hl_miami",
		texture_bundle_folder = "hl_miami",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_smg_scorpion_g_ergo = {
		pcs = {},
		type = "grip",
		name_id = "bm_wp_scorpion_g_ergo",
		texture_bundle_folder = "dlc1",
		a_obj = "a_g",
		unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_scorpion_pts/wpn_fps_smg_scorpion_g_ergo",
		stats = {
			value = 1,
			spread = 1,
			spread = 0,
			recoil = 3,
			concealment = 1
		},
		dlc = "hl_miami",
		texture_bundle_folder = "hl_miami",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_smg_scorpion_m_standard = {
		type = "magazine",
		name_id = "bm_wp_scorpion_m_standard",
		texture_bundle_folder = "dlc1",
		a_obj = "a_m",
		bullet_objects = {prefix = "g_bullet_", amount = 1},
		unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_scorpion_pts/wpn_fps_smg_scorpion_m_standard",
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_smg_scorpion_m_extended = {
		pcs = {},
		type = "magazine",
		name_id = "bm_wp_scorpion_m_extended",
		texture_bundle_folder = "dlc1",
		bullet_objects = {prefix = "g_bullet_", amount = 1},
		a_obj = "a_m",
		unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_scorpion_pts/wpn_fps_smg_scorpion_m_extended",
		stats = {
			value = 1,
			concealment = -3,
			recoil = 2,
			extra_ammo = 10
		},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		},
		dlc = "hl_miami",
		texture_bundle_folder = "hl_miami",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_smg_scorpion_s_nostock = {
		pcs = {},
		type = "stock",
		name_id = "bm_wp_scorpion_s_nostock",
		texture_bundle_folder = "dlc1",
		a_obj = "a_s",
		unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_scorpion_pts/wpn_fps_smg_scorpion_s_nostock",
		stats = {
			value = 1,
			recoil = -1,
			concealment = 2
		},
		dlc = "hl_miami",
		texture_bundle_folder = "hl_miami",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_smg_scorpion_s_standard = {
		type = "stock",
		name_id = "bm_wp_serbu_s_nostock_short",
		texture_bundle_folder = "dlc1",
		a_obj = "a_s",
		unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_scorpion_pts/wpn_fps_smg_scorpion_s_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_scorpion_s_unfolded = {
		pcs = {},
		type = "stock",
		name_id = "bm_wp_scorpion_s_unfolded",
		texture_bundle_folder = "dlc1",
		a_obj = "a_s",
		unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_scorpion_pts/wpn_fps_smg_scorpion_s_unfolded",
		stats = {
			value = 1,
			recoil = 3,
			concealment = -2
		},
		dlc = "hl_miami",
		texture_bundle_folder = "hl_miami",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_smg_scorpion_extra_rail = {
		type = "extra",
		name_id = "bm_wp_serbu_s_nostock_short",
		a_obj = "a_body",
		unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_scorpion_pts/wpn_fps_smg_scorpion_extra_rail",
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_scorpion_extra_rail_gadget = {
		type = "extra",
		name_id = "bm_wp_serbu_s_nostock_short",
		a_obj = "a_body",
		unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_scorpion_pts/wpn_fps_smg_scorpion_extra_rail_gadget",
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_scorpion_b_standard.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_scorpion/wpn_third_smg_scorpion_b_standard"
	self.parts.wpn_fps_smg_scorpion_b_suppressed.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_scorpion/wpn_third_smg_scorpion_b_suppressed"
	self.parts.wpn_fps_smg_scorpion_body_standard.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_scorpion/wpn_third_smg_scorpion_body_standard"
	self.parts.wpn_fps_smg_scorpion_g_standard.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_scorpion/wpn_third_smg_scorpion_g_standard"
	self.parts.wpn_fps_smg_scorpion_g_wood.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_scorpion/wpn_third_smg_scorpion_g_wood"
	self.parts.wpn_fps_smg_scorpion_g_ergo.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_scorpion/wpn_third_smg_scorpion_g_ergo"
	self.parts.wpn_fps_smg_scorpion_m_standard.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_scorpion/wpn_third_smg_scorpion_m_standard"
	self.parts.wpn_fps_smg_scorpion_m_extended.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_scorpion/wpn_third_smg_scorpion_m_extended"
	self.parts.wpn_fps_smg_scorpion_s_nostock.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_scorpion/wpn_third_smg_scorpion_s_nostock"
	self.parts.wpn_fps_smg_scorpion_s_standard.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_scorpion/wpn_third_smg_scorpion_s_standard"
	self.parts.wpn_fps_smg_scorpion_s_unfolded.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_scorpion/wpn_third_smg_scorpion_s_unfolded"
	self.parts.wpn_fps_smg_scorpion_extra_rail.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_scorpion/wpn_third_smg_scorpion_extra_rail"
	self.parts.wpn_fps_smg_scorpion_extra_rail_gadget.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_scorpion/wpn_third_smg_scorpion_extra_rail_gadget"
	self.wpn_fps_smg_scorpion = {}
	self.wpn_fps_smg_scorpion.unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_scorpion/wpn_fps_smg_scorpion"
	self.wpn_fps_smg_scorpion.optional_types = {"barrel_ext", "gadget"}
	self.wpn_fps_smg_scorpion.adds = {
		wpn_fps_upg_o_specter = {
			"wpn_fps_smg_scorpion_extra_rail"
		},
		wpn_fps_upg_o_aimpoint = {
			"wpn_fps_smg_scorpion_extra_rail"
		},
		wpn_fps_upg_o_aimpoint_2 = {
			"wpn_fps_smg_scorpion_extra_rail"
		},
		wpn_fps_upg_o_docter = {
			"wpn_fps_smg_scorpion_extra_rail"
		},
		wpn_fps_upg_o_eotech = {
			"wpn_fps_smg_scorpion_extra_rail"
		},
		wpn_fps_upg_o_t1micro = {
			"wpn_fps_smg_scorpion_extra_rail"
		},
		wpn_fps_upg_o_cmore = {
			"wpn_fps_smg_scorpion_extra_rail"
		},
		wpn_fps_upg_o_acog = {
			"wpn_fps_smg_scorpion_extra_rail"
		},
		wpn_fps_upg_o_cs = {
			"wpn_fps_smg_scorpion_extra_rail"
		},
		wpn_fps_upg_o_eotech_xps = {
			"wpn_fps_smg_scorpion_extra_rail"
		},
		wpn_fps_upg_o_reflex = {
			"wpn_fps_smg_scorpion_extra_rail"
		},
		wpn_fps_upg_o_rx01 = {
			"wpn_fps_smg_scorpion_extra_rail"
		},
		wpn_fps_upg_o_rx30 = {
			"wpn_fps_smg_scorpion_extra_rail"
		},
		wpn_fps_upg_fl_pis_laser = {
			"wpn_fps_smg_scorpion_extra_rail_gadget"
		},
		wpn_fps_upg_fl_pis_tlr1 = {
			"wpn_fps_smg_scorpion_extra_rail_gadget"
		}
	}
	self.wpn_fps_smg_scorpion.default_blueprint = {
		"wpn_fps_smg_scorpion_body_standard",
		"wpn_fps_smg_scorpion_b_standard",
		"wpn_fps_smg_scorpion_m_standard",
		"wpn_fps_smg_scorpion_s_standard",
		"wpn_fps_smg_scorpion_g_standard"
	}
	self.wpn_fps_smg_scorpion.uses_parts = {
		"wpn_fps_smg_scorpion_b_standard",
		"wpn_fps_smg_scorpion_b_suppressed",
		"wpn_fps_smg_scorpion_body_standard",
		"wpn_fps_smg_scorpion_g_standard",
		"wpn_fps_smg_scorpion_g_wood",
		"wpn_fps_smg_scorpion_g_ergo",
		"wpn_fps_smg_scorpion_m_standard",
		"wpn_fps_smg_scorpion_m_extended",
		"wpn_fps_smg_scorpion_s_nostock",
		"wpn_fps_smg_scorpion_s_standard",
		"wpn_fps_smg_scorpion_s_unfolded",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_i_singlefire",
		"wpn_fps_upg_i_autofire",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_fl_pis_laser",
		"wpn_fps_upg_fl_pis_tlr1"
	}
	self.wpn_fps_smg_scorpion_npc = deep_clone(self.wpn_fps_smg_scorpion)
	self.wpn_fps_smg_scorpion_npc.unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_scorpion/wpn_fps_smg_scorpion_npc"
end

function WeaponFactoryTweakData_37:_init_tec9()
	self.parts.wpn_fps_smg_tec9_b_long = {
		type = "barrel",
		name_id = "bm_wp_tec9_",
		texture_bundle_folder = "dlc1",
		a_obj = "a_b",
		unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_tec9_pts/wpn_fps_smg_tec9_b_long",
		stats = {value = 1},
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil"
		}
	}
	self.parts.wpn_fps_smg_tec9_b_standard = {
		pcs = {},
		type = "barrel",
		name_id = "bm_wp_tec9_b_standard",
		texture_bundle_folder = "dlc1",
		a_obj = "a_b",
		unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_tec9_pts/wpn_fps_smg_tec9_b_standard",
		stats = {
			value = 3,
			spread = -1,
			recoil = 1,
			concealment = 3,
			damage = 0
		},
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil"
		},
		dlc = "hl_miami",
		texture_bundle_folder = "hl_miami",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_smg_tec9_ns_ext = {
		pcs = {},
		type = "barrel",
		name_id = "bm_wp_tec9_ns_ext",
		texture_bundle_folder = "dlc1",
		a_obj = "a_b",
		unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_tec9_pts/wpn_fps_smg_tec9_ns_ext",
		stats = {
			value = 5,
			spread = 1,
			recoil = -2,
			concealment = -3,
			damage = 0
		},
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil"
		},
		dlc = "hl_miami",
		texture_bundle_folder = "hl_miami",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_smg_tec9_body_standard = {
		type = "upper_reciever",
		name_id = "bm_wp_tec9_",
		texture_bundle_folder = "dlc1",
		a_obj = "a_body",
		unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_tec9_pts/wpn_fps_smg_tec9_body_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_tec9_m_extended = {
		pcs = {},
		type = "magazine",
		name_id = "bm_wp_tec9_m_extended",
		bullet_objects = {prefix = "g_bullet_", amount = 1},
		texture_bundle_folder = "dlc1",
		a_obj = "a_m",
		unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_tec9_pts/wpn_fps_smg_tec9_m_extended",
		stats = {
			value = 4,
			extra_ammo = 6,
			recoil = 2,
			concealment = -2
		},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		},
		dlc = "hl_miami",
		texture_bundle_folder = "hl_miami",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_smg_tec9_m_standard = {
		type = "magazine",
		name_id = "bm_wp_tec9_",
		texture_bundle_folder = "dlc1",
		bullet_objects = {prefix = "g_bullet_", amount = 1},
		a_obj = "a_body",
		unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_tec9_pts/wpn_fps_smg_tec9_m_standard",
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_smg_tec9_s_unfolded = {
		pcs = {},
		type = "stock",
		name_id = "bm_wp_tec9_s_unfolded",
		texture_bundle_folder = "dlc1",
		a_obj = "a_s",
		unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_tec9_pts/wpn_fps_smg_tec9_s_unfolded",
		stats = {
			value = 3,
			recoil = 3,
			concealment = -2
		},
		dlc = "hl_miami",
		texture_bundle_folder = "hl_miami",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_smg_tec9_b_long.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_tec9_pts/wpn_third_smg_tec9_b_long"
	self.parts.wpn_fps_smg_tec9_b_standard.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_tec9_pts/wpn_third_smg_tec9_b_standard"
	self.parts.wpn_fps_smg_tec9_body_standard.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_tec9_pts/wpn_third_smg_tec9_body_standard"
	self.parts.wpn_fps_smg_tec9_m_extended.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_tec9_pts/wpn_third_smg_tec9_m_extended"
	self.parts.wpn_fps_smg_tec9_m_standard.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_tec9_pts/wpn_third_smg_tec9_m_standard"
	self.parts.wpn_fps_smg_tec9_ns_ext.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_tec9_pts/wpn_third_smg_tec9_ns_ext"
	self.parts.wpn_fps_smg_tec9_s_unfolded.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_tec9_pts/wpn_third_smg_tec9_s_unfolded"
	self.wpn_fps_smg_tec9 = {}
	self.wpn_fps_smg_tec9.unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_tec9/wpn_fps_smg_tec9"
	self.wpn_fps_smg_tec9.optional_types = {"barrel_ext", "gadget"}
	self.wpn_fps_smg_tec9.adds = {
		wpn_fps_upg_o_specter = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_aimpoint = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_aimpoint_2 = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_docter = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_eotech = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_t1micro = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_cmore = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_acog = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_cs = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_eotech_xps = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_reflex = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_rx01 = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_rx30 = {
			"wpn_fps_shot_r870_ris_special"
		}
	}
	self.wpn_fps_smg_tec9.default_blueprint = {
		"wpn_fps_smg_tec9_m_standard",
		"wpn_fps_smg_tec9_b_long",
		"wpn_fps_smg_tec9_body_standard"
	}
	self.wpn_fps_smg_tec9.uses_parts = {
		"wpn_fps_smg_tec9_b_long",
		"wpn_fps_smg_tec9_b_standard",
		"wpn_fps_smg_tec9_body_standard",
		"wpn_fps_smg_tec9_m_standard",
		"wpn_fps_smg_tec9_m_extended",
		"wpn_fps_smg_tec9_ns_ext",
		"wpn_fps_smg_tec9_s_unfolded",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_i_singlefire",
		"wpn_fps_upg_i_autofire",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser"
	}
	self.wpn_fps_smg_tec9_npc = deep_clone(self.wpn_fps_smg_tec9)
	self.wpn_fps_smg_tec9_npc.unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_tec9/wpn_fps_smg_tec9_npc"
end

function WeaponFactoryTweakData_37:_init_uzi()
	self.parts.wpn_fps_smg_uzi_b_standard = {
		type = "barrel",
		name_id = "bm_wp_uzi_b_standard",
		texture_bundle_folder = "dlc1",
		a_obj = "a_b",
		unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_uzi_pts/wpn_fps_smg_uzi_b_standard",
		stats = {value = 1},
		override = {
			wpn_fps_upg_ass_ns_jprifles = {a_obj = "a_ns_1"},
			wpn_fps_upg_ass_ns_surefire = {a_obj = "a_ns_1"},
			wpn_fps_upg_ns_ass_smg_firepig = {a_obj = "a_ns_1"},
			wpn_fps_upg_ns_ass_smg_stubby = {a_obj = "a_ns_1"},
			wpn_fps_upg_ns_ass_smg_tank = {a_obj = "a_ns_1"}
		}
	}
	self.parts.wpn_fps_smg_uzi_b_suppressed = {
		pcs = {},
		type = "barrel_ext",
		sub_type = "silencer",
		name_id = "bm_wp_uzi_b_suppressed",
		a_obj = "a_b",
		unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_uzi_pts/wpn_fps_smg_uzi_b_suppressed",
		stats = {
			value = 5,
			suppression = 12,
			alert_size = 12,
			spread = -1,
			damage = 0,
			recoil = 1,
			spread_moving = 1,
			concealment = -2
		},
		perks = {"silencer"},
		sound_switch = {
			suppressed = "suppressed_a"
		},
		dlc = "hl_miami",
		texture_bundle_folder = "hl_miami",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_smg_uzi_body_standard = {
		type = "lower_reciever",
		name_id = "bm_wp_uzi_body_standard",
		texture_bundle_folder = "dlc1",
		a_obj = "a_body",
		unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_uzi_pts/wpn_fps_smg_uzi_body_standard",
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty",
			fire = "recoil"
		}
	}
	self.parts.wpn_fps_smg_uzi_fg_rail = {
		pcs = {},
		type = "foregrip",
		name_id = "bm_wp_uzi_fg_rail",
		texture_bundle_folder = "dlc1",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_uzi_pts/wpn_fps_smg_uzi_fg_rail",
		stats = {
			value = 1,
			spread = 1,
			recoil = 1,
			concealment = -2,
			damage = 0
		},
		adds = {
			"wpn_fps_upg_vg_ass_smg_verticalgrip"
		},
		dlc = "hl_miami",
		texture_bundle_folder = "hl_miami",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_smg_uzi_fg_standard = {
		type = "foregrip",
		name_id = "bm_wp_uzi_fg_standard",
		texture_bundle_folder = "dlc1",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_uzi_pts/wpn_fps_smg_uzi_fg_standard",
		stats = {value = 1},
		forbids = {
			"wpn_fps_upg_vg_ass_smg_verticalgrip"
		}
	}
	self.parts.wpn_fps_smg_uzi_g_standard = {
		type = "grip",
		name_id = "bm_wp_uzi_g_standard",
		texture_bundle_folder = "dlc1",
		a_obj = "a_body",
		unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_uzi_pts/wpn_fps_smg_uzi_g_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_uzi_m_standard = {
		type = "magazine",
		name_id = "bm_wp_uzi_m_standard",
		bullet_objects = {prefix = "g_bullet_", amount = 1},
		texture_bundle_folder = "dlc1",
		a_obj = "a_m",
		unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_uzi_pts/wpn_fps_smg_uzi_m_standard",
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_smg_uzi_s_leather = {
		pcs = {},
		type = "stock",
		name_id = "bm_wp_uzi_s_leather",
		texture_bundle_folder = "dlc1",
		a_obj = "a_s",
		unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_uzi_pts/wpn_fps_smg_uzi_s_leather",
		stats = {
			value = 1,
			spread = 2,
			recoil = 1,
			concealment = -2
		},
		dlc = "hl_miami",
		texture_bundle_folder = "hl_miami",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_smg_uzi_s_solid = {
		pcs = {},
		type = "stock",
		name_id = "bm_wp_uzi_s_solid",
		texture_bundle_folder = "dlc1",
		a_obj = "a_s",
		unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_uzi_pts/wpn_fps_smg_uzi_s_solid",
		stats = {
			value = 1,
			spread = 1,
			recoil = 3,
			concealment = -2
		},
		dlc = "hl_miami",
		texture_bundle_folder = "hl_miami",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_smg_uzi_s_standard = {
		pcs = {},
		type = "stock",
		name_id = "bm_wp_uzi_s_standard",
		texture_bundle_folder = "dlc1",
		a_obj = "a_s",
		unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_uzi_pts/wpn_fps_smg_uzi_s_standard",
		stats = {
			value = 1,
			recoil = -3,
			concealment = 4
		},
		dlc = "hl_miami",
		texture_bundle_folder = "hl_miami",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_smg_uzi_s_unfolded = {
		type = "stock",
		name_id = "bm_wp_uzi_s_unfolded",
		texture_bundle_folder = "dlc1",
		a_obj = "a_s",
		unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_uzi_pts/wpn_fps_smg_uzi_s_unfolded",
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_uzi_b_standard.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_uzi_pts/wpn_third_smg_uzi_b_standard"
	self.parts.wpn_fps_smg_uzi_b_suppressed.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_uzi_pts/wpn_third_smg_uzi_b_suppressed"
	self.parts.wpn_fps_smg_uzi_body_standard.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_uzi_pts/wpn_third_smg_uzi_body_standard"
	self.parts.wpn_fps_smg_uzi_fg_rail.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_uzi_pts/wpn_third_smg_uzi_fg_rail"
	self.parts.wpn_fps_smg_uzi_fg_standard.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_uzi_pts/wpn_third_smg_uzi_fg_standard"
	self.parts.wpn_fps_smg_uzi_g_standard.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_uzi_pts/wpn_third_smg_uzi_g_standard"
	self.parts.wpn_fps_smg_uzi_m_standard.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_uzi_pts/wpn_third_smg_uzi_m_standard"
	self.parts.wpn_fps_smg_uzi_s_leather.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_uzi_pts/wpn_third_smg_uzi_s_leather"
	self.parts.wpn_fps_smg_uzi_s_solid.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_uzi_pts/wpn_third_smg_uzi_s_solid"
	self.parts.wpn_fps_smg_uzi_s_standard.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_uzi_pts/wpn_third_smg_uzi_s_standard"
	self.parts.wpn_fps_smg_uzi_s_unfolded.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_uzi_pts/wpn_third_smg_uzi_s_unfolded"
	self.wpn_fps_smg_uzi = {}
	self.wpn_fps_smg_uzi.unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_uzi/wpn_fps_smg_uzi"
	self.wpn_fps_smg_uzi.optional_types = {"barrel_ext", "gadget"}
	self.wpn_fps_smg_uzi.adds = {
		wpn_fps_upg_o_specter = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_aimpoint = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_aimpoint_2 = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_docter = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_eotech = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_t1micro = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_cmore = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_acog = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_cs = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_eotech_xps = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_reflex = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_rx01 = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_o_rx30 = {
			"wpn_fps_shot_r870_ris_special"
		},
		wpn_fps_upg_fl_ass_smg_sho_surefire = {
			"wpn_fps_shot_r870_gadget_rail"
		},
		wpn_fps_upg_fl_ass_smg_sho_peqbox = {
			"wpn_fps_shot_r870_gadget_rail"
		},
		wpn_fps_upg_fl_ass_peq15 = {
			"wpn_fps_shot_r870_gadget_rail"
		},
		wpn_fps_upg_fl_ass_laser = {
			"wpn_fps_shot_r870_gadget_rail"
		}
	}
	self.wpn_fps_smg_uzi.default_blueprint = {
		"wpn_fps_smg_uzi_b_standard",
		"wpn_fps_smg_uzi_body_standard",
		"wpn_fps_smg_uzi_fg_standard",
		"wpn_fps_smg_uzi_g_standard",
		"wpn_fps_smg_uzi_m_standard",
		"wpn_fps_smg_uzi_s_unfolded"
	}
	self.wpn_fps_smg_uzi.uses_parts = {
		"wpn_fps_smg_uzi_b_standard",
		"wpn_fps_smg_uzi_b_suppressed",
		"wpn_fps_smg_uzi_body_standard",
		"wpn_fps_smg_uzi_fg_rail",
		"wpn_fps_smg_uzi_fg_standard",
		"wpn_fps_smg_uzi_g_standard",
		"wpn_fps_smg_uzi_m_standard",
		"wpn_fps_smg_uzi_s_leather",
		"wpn_fps_smg_uzi_s_solid",
		"wpn_fps_smg_uzi_s_standard",
		"wpn_fps_smg_uzi_s_unfolded",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_i_singlefire",
		"wpn_fps_upg_i_autofire",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser"
	}
	self.wpn_fps_smg_uzi_npc = deep_clone(self.wpn_fps_smg_uzi)
	self.wpn_fps_smg_uzi_npc.unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_uzi/wpn_fps_smg_uzi_npc"
end

function WeaponFactoryTweakData_37:is_part_internal(part_id)
	return self.parts[part_id] and self.parts[part_id].internal_part or false
end

function WeaponFactoryTweakData_37:create_ammunition()
	self.parts.wpn_fps_upg_a_slug = {
		pcs = {},
		type = "ammo",
		name_id = "bm_wp_upg_a_slug",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		dlc = "gage_pack_shotgun",
		texture_bundle_folder = "gage_pack_shotgun",
		is_a_unlockable = true,
		stats = {
			value = 5,
			total_ammo_mod = -10,
			damage = 3,
			spread = 2,
			moving_spread = 2
		},
		custom_stats = {
			damage_near_mul = 2,
			damage_far_mul = 1.15,
			rays = 1,
			armor_piercing_add = 1,
			can_shoot_through_enemy = true,
			can_shoot_through_shield = true,
			can_shoot_through_wall = true,
			ammo_pickup_min_mul = 1,
			ammo_pickup_max_mul = 1
		},
		internal_part = true,
		sub_type = "ammo_slug"
	}
	self.parts.wpn_fps_upg_a_custom = {
		pcs = {},
		type = "ammo",
		name_id = "bm_wp_upg_a_custom",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		dlc = "gage_pack_shotgun",
		texture_bundle_folder = "gage_pack_shotgun",
		is_a_unlockable = true,
		stats = {
			value = 5,
			total_ammo_mod = -6,
			damage = 3
		},
		custom_stats = {ammo_pickup_min_mul = 1, ammo_pickup_max_mul = 1},
		internal_part = true,
		sub_type = "ammo_custom"
	}
	self.parts.wpn_fps_upg_a_custom_free = deep_clone(self.parts.wpn_fps_upg_a_custom)
	self.parts.wpn_fps_upg_a_custom_free.dlc = nil
	self.parts.wpn_fps_upg_a_custom_free.is_a_unlockable = nil
	self.parts.wpn_fps_upg_a_explosive = {
		pcs = {},
		type = "ammo",
		name_id = "bm_wp_upg_a_explosive",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		dlc = "gage_pack_shotgun",
		texture_bundle_folder = "gage_pack_shotgun",
		is_a_unlockable = true,
		stats = {
			value = 5,
			total_ammo_mod = -10,
			damage = 3,
			spread = -3,
			moving_spread = 3
		},
		custom_stats = {
			ignore_statistic = true,
			rays = 1,
			damage_near_mul = 2,
			damage_far_mul = 2.5,
			bullet_class = "InstantExplosiveBulletBase",
			ammo_pickup_min_mul = 0.3,
			ammo_pickup_max_mul = 0.5
		},
		internal_part = true,
		sub_type = "ammo_explosive"
	}
	self.parts.wpn_fps_upg_a_piercing = {
		pcs = {},
		type = "ammo",
		name_id = "bm_wp_upg_a_piercing",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		dlc = "gage_pack_shotgun",
		texture_bundle_folder = "gage_pack_shotgun",
		is_a_unlockable = true,
		stats = {
			value = 5,
			damage = -3,
			spread = 2
		},
		custom_stats = {
			damage_near_mul = 2,
			damage_far_mul = 1.7,
			armor_piercing_add = 1,
			ammo_pickup_min_mul = 1,
			ammo_pickup_max_mul = 1
		},
		internal_part = true,
		sub_type = "ammo_piercing"
	}
	local weapons = {
		"wpn_fps_shot_saiga",
		"wpn_fps_shot_r870",
		"wpn_fps_shot_huntsman",
		"wpn_fps_shot_serbu",
		"wpn_fps_sho_ben",
		"wpn_fps_sho_striker",
		"wpn_fps_sho_ksg",
		"wpn_fps_pis_judge"
	}
	for _, factory_id in ipairs(weapons) do
		if self[factory_id] and self[factory_id].uses_parts then
			table.insert(self[factory_id].uses_parts, "wpn_fps_upg_a_slug")
			table.insert(self[factory_id].uses_parts, "wpn_fps_upg_a_custom")
			table.insert(self[factory_id].uses_parts, "wpn_fps_upg_a_custom_free")
			table.insert(self[factory_id].uses_parts, "wpn_fps_upg_a_explosive")
			table.insert(self[factory_id].uses_parts, "wpn_fps_upg_a_piercing")
		end
	end
end
