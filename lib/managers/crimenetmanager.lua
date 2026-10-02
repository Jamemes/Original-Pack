function CrimeNetGui:init(ws, fullscreeen_ws, node)
	managers.menu_component:test_camera_shutter_tech()
	self._tweak_data = tweak_data.gui.crime_net
	self._crimenet_enabled = true
	managers.menu_component:post_event("crime_net_startup")
	managers.menu_component:close_contract_gui()
	local no_servers = node:parameters().no_servers
	if no_servers then
		managers.crimenet:start_no_servers()
	else
		managers.crimenet:start()
	end
	managers.menu:active_menu().renderer.ws:hide()
	local safe_scaled_size = managers.gui_data:safe_scaled_size()
	self._ws = ws
	self._fullscreen_ws = fullscreeen_ws
	self._fullscreen_panel = self._fullscreen_ws:panel():panel({name = "fullscreen"})
	self._panel = self._ws:panel():panel({name = "main"})
	self._blackborder_workspace = managers.gui_data:create_fullscreen_workspace()
	self._blackborder_workspace:panel():rect({
		name = "top_border",
		layer = 1000,
		color = Color.black
	})
	self._blackborder_workspace:panel():rect({
		name = "bottom_border",
		layer = 1000,
		color = Color.black
	})
	do
		local top_border = self._blackborder_workspace:panel():child("top_border")
		local bottom_border = self._blackborder_workspace:panel():child("bottom_border")
		local border_w = self._blackborder_workspace:panel():w()
		local border_h = (self._blackborder_workspace:panel():h() - 720) / 2
		top_border:set_position(0, 0)
		top_border:set_size(border_w, border_h)
		bottom_border:set_position(0, 720 + border_h)
		bottom_border:set_size(border_w, border_h)
	end
	local full_16_9 = managers.gui_data:full_16_9_size()
	self._fullscreen_panel:bitmap({
		name = "blur_top",
		texture = "guis/textures/test_blur_df",
		w = self._fullscreen_ws:panel():w(),
		h = full_16_9.convert_y,
		x = 0,
		y = 0,
		render_template = "VertexColorTexturedBlur3D",
		layer = 26
	})
	self._fullscreen_panel:bitmap({
		name = "blur_right",
		texture = "guis/textures/test_blur_df",
		w = full_16_9.convert_x,
		h = self._fullscreen_ws:panel():h(),
		x = self._fullscreen_ws:panel():w() - full_16_9.convert_x,
		y = 0,
		render_template = "VertexColorTexturedBlur3D",
		layer = 26
	})
	self._fullscreen_panel:bitmap({
		name = "blur_bottom",
		texture = "guis/textures/test_blur_df",
		w = self._fullscreen_ws:panel():w(),
		h = full_16_9.convert_y,
		x = 0,
		y = self._fullscreen_ws:panel():h() - full_16_9.convert_y,
		render_template = "VertexColorTexturedBlur3D",
		layer = 26
	})
	self._fullscreen_panel:bitmap({
		name = "blur_left",
		texture = "guis/textures/test_blur_df",
		w = full_16_9.convert_x,
		h = self._fullscreen_ws:panel():h(),
		x = 0,
		y = 0,
		render_template = "VertexColorTexturedBlur3D",
		layer = 26
	})
	self._panel:rect({
		w = self._panel:w(),
		h = 2,
		x = 0,
		y = 0,
		layer = 2,
		color = tweak_data.screen_colors.crimenet_lines,
		blend_mode = "add"
	})
	self._panel:rect({
		w = self._panel:w(),
		h = 2,
		x = 0,
		y = 0,
		layer = 2,
		color = tweak_data.screen_colors.crimenet_lines,
		blend_mode = "add"
	}):set_bottom(self._panel:h())
	self._panel:rect({
		w = 2,
		h = self._panel:h(),
		x = 0,
		y = 0,
		layer = 2,
		color = tweak_data.screen_colors.crimenet_lines,
		blend_mode = "add"
	}):set_right(self._panel:w())
	self._panel:rect({
		w = 2,
		h = self._panel:h(),
		x = 0,
		y = 0,
		layer = 2,
		color = tweak_data.screen_colors.crimenet_lines,
		blend_mode = "add"
	})
	self._rasteroverlay = self._fullscreen_panel:bitmap({
		name = "rasteroverlay",
		texture = "guis/textures/crimenet_map_rasteroverlay",
		texture_rect = {
			0,
			0,
			32,
			256
		},
		wrap_mode = "wrap",
		blend_mode = "mul",
		layer = 3,
		color = Color(1, 1, 1, 1),
		w = self._fullscreen_panel:w(),
		h = self._fullscreen_panel:h()
	})
	self._fullscreen_panel:bitmap({
		name = "vignette",
		texture = "guis/textures/crimenet_map_vignette",
		layer = 2,
		color = Color(1, 1, 1, 1),
		blend_mode = "mul",
		w = self._fullscreen_panel:w(),
		h = self._fullscreen_panel:h()
	})
	local bd_light = self._fullscreen_panel:bitmap({
		name = "bd_light",
		texture = "guis/textures/pd2/menu_backdrop/bd_light",
		layer = 4
	})
	bd_light:set_size(self._fullscreen_panel:size())
	bd_light:set_alpha(0)
	bd_light:set_blend_mode("add")
	
	local function light_flicker_animation(o)
		local alpha = 0
		local acceleration = 0
		local wanted_alpha = math.rand(1) * 0.3
		local flicker_up = true
		while true do
			wait(0.009, self._fixed_dt)
			over(0.045, function(p)
				o:set_alpha(math.lerp(alpha, wanted_alpha, p))
			end, self._fixed_dt)
			flicker_up = not flicker_up
			alpha = o:alpha()
			wanted_alpha = math.rand(flicker_up and alpha or 0.2, not flicker_up and alpha or 0.3)
		end
	end
	
	bd_light:animate(light_flicker_animation)
	local back_button = self._panel:text({
		name = "back_button",
		text = managers.localization:to_upper_text("menu_back"),
		align = "right",
		vertical = "bottom",
		font_size = tweak_data.menu.pd2_large_font_size,
		font = tweak_data.menu.pd2_large_font,
		color = tweak_data.screen_colors.button_stage_3,
		layer = 40,
		blend_mode = "add"
	})
	self:make_fine_text(back_button)
	back_button:set_right(self._panel:w() - 10)
	back_button:set_bottom(self._panel:h() - 10)
	back_button:set_visible(managers.menu:is_pc_controller())
	do
		local blur_object = self._panel:bitmap({
			name = "controller_legend_blur",
			texture = "guis/textures/test_blur_df",
			render_template = "VertexColorTexturedBlur3D",
			layer = back_button:layer() - 1
		})
		blur_object:set_shape(back_button:shape())
		if not managers.menu:is_pc_controller() then
			blur_object:set_size(self._panel:w() * 0.5, tweak_data.menu.pd2_medium_font_size)
			blur_object:set_rightbottom(self._panel:w() - 2, self._panel:h() - 2)
		end
	end
	WalletGuiObject.set_wallet(self._panel)
	WalletGuiObject.set_layer(30)
	WalletGuiObject.move_wallet(10, -10)
	local text_id = Global.game_settings.single_player and "menu_crimenet_offline" or "cn_menu_num_players_offline"
	local num_players_text = self._panel:text({
		name = "num_players_text",
		text = managers.localization:to_upper_text(text_id, {amount = "1"}),
		align = "left",
		vertical = "top",
		font_size = tweak_data.menu.pd2_small_font_size,
		font = tweak_data.menu.pd2_small_font,
		color = tweak_data.screen_colors.text,
		layer = 40
	})
	self:make_fine_text(num_players_text)
	num_players_text:set_left(10)
	num_players_text:set_top(10)
	do
		local blur_object = self._panel:bitmap({
			name = "num_players_blur",
			texture = "guis/textures/test_blur_df",
			render_template = "VertexColorTexturedBlur3D",
			layer = num_players_text:layer() - 1
		})
		blur_object:set_shape(num_players_text:shape())
	end
	local legends_button = self._panel:text({
		name = "legends_button",
		text = managers.localization:to_upper_text("menu_cn_legend_show", {
			BTN_X = managers.localization:btn_macro("menu_toggle_legends")
		}),
		font_size = tweak_data.menu.pd2_medium_font_size,
		font = tweak_data.menu.pd2_medium_font,
		color = tweak_data.screen_colors.text,
		layer = 40,
		blend_mode = "add"
	})
	self:make_fine_text(legends_button)
	legends_button:set_left(num_players_text:left())
	legends_button:set_top(num_players_text:bottom())
	do
		local blur_object = self._panel:bitmap({
			name = "legends_button_blur",
			texture = "guis/textures/test_blur_df",
			render_template = "VertexColorTexturedBlur3D",
			layer = legends_button:layer() - 1
		})
		blur_object:set_shape(legends_button:shape())
	end
	if managers.menu:is_pc_controller() then
		legends_button:set_color(tweak_data.screen_colors.button_stage_3)
	end
	do
		local w, h
		local mw, mh = 0
		local legend_panel = self._panel:panel({
			name = "legend_panel",
			layer = 40,
			visible = false,
			x = 10,
			y = legends_button:bottom() + 4
		})
		local host_icon = legend_panel:bitmap({
			texture = "guis/textures/pd2/crimenet_legend_host",
			x = 10,
			y = 10
		})
		local host_text = legend_panel:text({
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			x = host_icon:right() + 2,
			y = host_icon:top(),
			text = managers.localization:to_upper_text("menu_cn_legend_host"),
			blend_mode = "add"
		})
		mw = math.max(mw, self:make_fine_text(host_text))
		local join_icon = legend_panel:bitmap({
			texture = "guis/textures/pd2/crimenet_legend_join",
			x = 10,
			y = host_text:bottom()
		})
		local join_text = legend_panel:text({
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			x = host_text:left(),
			y = join_icon:top(),
			text = managers.localization:to_upper_text("menu_cn_legend_join"),
			blend_mode = "add"
		})
		mw = math.max(mw, self:make_fine_text(join_text))
		self:make_color_text(join_text, tweak_data.screen_colors.regular_color)
		local friends_text = legend_panel:text({
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			x = host_text:left(),
			y = join_text:bottom(),
			text = managers.localization:to_upper_text("menu_cn_legend_friends"),
			blend_mode = "add"
		})
		mw = math.max(mw, self:make_fine_text(friends_text))
		self:make_color_text(friends_text, tweak_data.screen_colors.friend_color)
		local pc_icon = legend_panel:bitmap({
			texture = "guis/textures/pd2/crimenet_legend_payclass",
			x = 10,
			y = friends_text:bottom()
		})
		local pc_text = legend_panel:text({
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			x = host_text:left(),
			y = pc_icon:top(),
			text = managers.localization:to_upper_text("menu_cn_legend_pc"),
			color = tweak_data.screen_colors.text,
			blend_mode = "add"
		})
		mw = math.max(mw, self:make_fine_text(pc_text))
		local risk_icon = legend_panel:bitmap({
			texture = "guis/textures/pd2/crimenet_legend_risklevel",
			x = 10,
			y = pc_text:bottom()
		})
		local risk_text = legend_panel:text({
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			x = host_text:left(),
			y = risk_icon:top(),
			text = managers.localization:to_upper_text("menu_cn_legend_risk"),
			color = tweak_data.screen_colors.risk,
			blend_mode = "add"
		})
		mw = math.max(mw, self:make_fine_text(risk_text))
		local pro_text = legend_panel:text({
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			x = host_text:left(),
			y = risk_text:bottom(),
			text = managers.localization:to_upper_text("menu_cn_legend_pro"),
			color = tweak_data.screen_colors.pro_color,
			blend_mode = "add"
		})
		mw = math.max(mw, self:make_fine_text(pro_text))
		legend_panel:set_size(host_text:left() + mw + 10, pro_text:bottom() + 10)
		legend_panel:rect({
			color = Color.black,
			alpha = 0.4,
			layer = -1
		})
		BoxGuiObject:new(legend_panel, {
			sides = {
				1,
				1,
				1,
				1
			}
		})
		legend_panel:bitmap({
			texture = "guis/textures/test_blur_df",
			w = legend_panel:w(),
			h = legend_panel:h(),
			render_template = "VertexColorTexturedBlur3D",
			layer = -1
		})
	end
	if not no_servers then
		local id = is_x360 and "menu_cn_friends" or "menu_cn_filter"
		local filter_button = self._panel:text({
			name = "filter_button",
			text = managers.localization:to_upper_text(id, {
				BTN_Y = managers.localization:btn_macro("menu_toggle_filters")
			}),
			font_size = tweak_data.menu.pd2_medium_font_size,
			font = tweak_data.menu.pd2_medium_font,
			color = tweak_data.screen_colors.text,
			layer = 40,
			blend_mode = "add"
		})
		self:make_fine_text(filter_button)
		filter_button:set_right(self._panel:w() - 10)
		filter_button:set_top(10)
		do
			local blur_object = self._panel:bitmap({
				name = "filter_button_blur",
				texture = "guis/textures/test_blur_df",
				render_template = "VertexColorTexturedBlur3D",
				layer = filter_button:layer() - 1
			})
			blur_object:set_shape(filter_button:shape())
		end
		if managers.menu:is_pc_controller() then
			filter_button:set_color(tweak_data.screen_colors.button_stage_3)
		end
		if is_ps3 then
			local invites_button = self._panel:text({
				name = "invites_button",
				text = managers.localization:get_default_macro("BTN_BACK") .. " " .. managers.localization:to_upper_text("menu_view_invites"),
				font_size = tweak_data.menu.pd2_medium_font_size,
				font = tweak_data.menu.pd2_medium_font,
				color = tweak_data.screen_colors.text,
				layer = 40,
				blend_mode = "add"
			})
			self:make_fine_text(invites_button)
			invites_button:set_right(filter_button:right())
			invites_button:set_top(filter_button:bottom())
			do
				local blur_object = self._panel:bitmap({
					name = "invites_button_blur",
					texture = "guis/textures/test_blur_df",
					render_template = "VertexColorTexturedBlur3D",
					layer = filter_button:layer() - 1
				})
				blur_object:set_shape(invites_button:shape())
			end
			if not self._ps3_invites_controller then
				local invites_cb = callback(self, self, "ps3_invites_callback")
				self._ps3_invites_controller = managers.controller:create_controller("ps3_invites_controller", managers.controller:get_default_wrapper_index(), false)
				self._ps3_invites_controller:add_trigger("back", invites_cb)
			end
			self._ps3_invites_controller:set_enabled(true)
		end
	end
	self._map_size_w = 2048
	self._map_size_h = 1024
	local aspect = 1.7777778
	local sw = math.min(self._map_size_w, self._map_size_h * aspect)
	local sh = math.min(self._map_size_h, self._map_size_w / aspect)
	local dw = self._map_size_w / sw
	local dh = self._map_size_h / sh
	self._map_size_w = dw * 1280
	self._map_size_h = dh * 720
	local pw, ph = self._map_size_w, self._map_size_h
	self._pan_panel_border = 2.7777777
	self._pan_panel_job_border_x = full_16_9.convert_x + self._pan_panel_border * 2
	self._pan_panel_job_border_y = full_16_9.convert_y + self._pan_panel_border * 2
	self._pan_panel = self._panel:panel({
		name = "pan",
		w = pw,
		h = ph,
		layer = 0
	})
	self._pan_panel:set_center(self._fullscreen_panel:w() / 2, self._fullscreen_panel:h() / 2)
	self._jobs = {}
	self._map_panel = self._fullscreen_panel:panel({
		name = "map",
		w = pw,
		h = ph
	})
	self._map_panel:bitmap({
		name = "map",
		texture = "guis/textures/crimenet_map",
		layer = 0,
		w = pw,
		h = ph
	})
	self._map_panel:child("map"):set_halign("scale")
	self._map_panel:child("map"):set_valign("scale")
	self._map_panel:set_shape(self._pan_panel:shape())
	self._map_x, self._map_y = self._map_panel:position()
	if not managers.menu:is_pc_controller() then
		managers.mouse_pointer:confine_mouse_pointer(self._panel)
		managers.menu:active_menu().input:activate_controller_mouse()
		managers.mouse_pointer:set_mouse_world_position(managers.gui_data:safe_to_full(self._panel:world_center()))
	end
	self.MIN_ZOOM = 1
	self.MAX_ZOOM = 9
	self._zoom = 1
	local cross_indicator_h1 = self._fullscreen_panel:bitmap({
		name = "cross_indicator_h1",
		texture = "guis/textures/pd2/skilltree/dottedline",
		w = self._fullscreen_panel:w(),
		h = 2,
		blend_mode = "add",
		layer = 17,
		color = tweak_data.screen_colors.crimenet_lines,
		alpha = 0.1,
		wrap_mode = "wrap"
	})
	local cross_indicator_h2 = self._fullscreen_panel:bitmap({
		name = "cross_indicator_h2",
		texture = "guis/textures/pd2/skilltree/dottedline",
		w = self._fullscreen_panel:w(),
		h = 2,
		blend_mode = "add",
		layer = 17,
		color = tweak_data.screen_colors.crimenet_lines,
		alpha = 0.1,
		wrap_mode = "wrap"
	})
	local cross_indicator_v1 = self._fullscreen_panel:bitmap({
		name = "cross_indicator_v1",
		texture = "guis/textures/pd2/skilltree/dottedline",
		h = self._fullscreen_panel:h(),
		w = 2,
		blend_mode = "add",
		layer = 17,
		color = tweak_data.screen_colors.crimenet_lines,
		alpha = 0.1,
		wrap_mode = "wrap"
	})
	local cross_indicator_v2 = self._fullscreen_panel:bitmap({
		name = "cross_indicator_v2",
		texture = "guis/textures/pd2/skilltree/dottedline",
		h = self._fullscreen_panel:h(),
		w = 2,
		blend_mode = "add",
		layer = 17,
		color = tweak_data.screen_colors.crimenet_lines,
		alpha = 0.1,
		wrap_mode = "wrap"
	})
	local line_indicator_h1 = self._fullscreen_panel:rect({
		name = "line_indicator_h1",
		w = 0,
		h = 2,
		blend_mode = "add",
		layer = 17,
		color = tweak_data.screen_colors.crimenet_lines,
		alpha = 0.1
	})
	local line_indicator_h2 = self._fullscreen_panel:rect({
		name = "line_indicator_h2",
		w = 0,
		h = 2,
		blend_mode = "add",
		layer = 17,
		color = tweak_data.screen_colors.crimenet_lines,
		alpha = 0.1
	})
	local line_indicator_v1 = self._fullscreen_panel:rect({
		name = "line_indicator_v1",
		h = 0,
		w = 2,
		blend_mode = "add",
		layer = 17,
		color = tweak_data.screen_colors.crimenet_lines,
		alpha = 0.1
	})
	local line_indicator_v2 = self._fullscreen_panel:rect({
		name = "line_indicator_v2",
		h = 0,
		w = 2,
		blend_mode = "add",
		layer = 17,
		color = tweak_data.screen_colors.crimenet_lines,
		alpha = 0.1
	})
	local fw = self._fullscreen_panel:w()
	local fh = self._fullscreen_panel:h()
	cross_indicator_h1:set_texture_coordinates(Vector3(0, 0, 0), Vector3(fw, 0, 0), Vector3(0, 2, 0), Vector3(fw, 2, 0))
	cross_indicator_h2:set_texture_coordinates(Vector3(0, 0, 0), Vector3(fw, 0, 0), Vector3(0, 2, 0), Vector3(fw, 2, 0))
	cross_indicator_v1:set_texture_coordinates(Vector3(0, 2, 0), Vector3(0, 0, 0), Vector3(fh, 2, 0), Vector3(fh, 0, 0))
	cross_indicator_v2:set_texture_coordinates(Vector3(0, 2, 0), Vector3(0, 0, 0), Vector3(fh, 2, 0), Vector3(fh, 0, 0))
	self:_create_locations()
	self._num_layer_jobs = 0
	local player_level = managers.experience:current_level()
	local positions_tweak_data = tweak_data.gui.crime_net.map_start_positions
	local start_position
	for _, position in ipairs(positions_tweak_data) do
		if player_level <= position.max_level then
			start_position = position
			break
		end
	end
	if start_position then
		self:_set_zoom("in", fw * 0.5, fh * 0.5)
		self:_set_zoom("in", fw * 0.5, fh * 0.5)
		self:_set_zoom("in", fw * 0.5, fh * 0.5)
		self:_goto_map_position(start_position.x, start_position.y)
	end
	return
end

function CrimeNetGui:make_fine_text(text)
	local x, y, w, h = text:text_rect()
	text:set_size(w, h)
	text:set_position(math.round(text:x()), math.round(text:y()))
	return w, h
end

function CrimeNetGui:make_color_text(text_object, color)
	local text = text_object:text()
	local text_dissected = utf8.characters(text)
	local idsp = Idstring("#")
	local start_ci = {}
	local end_ci = {}
	local first_ci = true
	for i, c in ipairs(text_dissected) do
		if Idstring(c) == idsp then
			local next_c = text_dissected[i + 1]
			if next_c and Idstring(next_c) == idsp then
				if first_ci then
					table.insert(start_ci, i)
				else
					table.insert(end_ci, i)
				end
				first_ci = not first_ci
			end
		end
	end
	if #start_ci ~= #end_ci then
	else
		for i = 1, #start_ci do
			start_ci[i] = start_ci[i] - ((i - 1) * 4 + 1)
			end_ci[i] = end_ci[i] - (i * 4 - 1)
		end
	end
	text = string.gsub(text, "##", "")
	text_object:set_text(text)
	text_object:clear_range_color(1, utf8.len(text))
	if #start_ci ~= #end_ci then
		Application:error("CrimeNetGui:make_color_text: Not even amount of ##'s in text", #start_ci, #end_ci)
	else
		for i = 1, #start_ci do
			text_object:set_range_color(start_ci[i], end_ci[i], color or tweak_data.screen_colors.resource)
		end
	end
end

function CrimeNetGui:_create_polylines()
	local regions = tweak_data.gui.crime_net.regions
	if alive(self._region_panel) then
		self._map_panel:remove(self._region_panel)
		self._region_panel = nil
	end
	self._region_panel = self._map_panel:panel({halign = "scale", valign = "scale"})
	self._region_locations = {}
	local xs, ys, num, vectors, my_polyline
	local tw = math.max(self._map_panel:child("map"):texture_width(), 1)
	local th = math.max(self._map_panel:child("map"):texture_height(), 1)
	local region_text_data, region_text, x, y
	for _, region in ipairs(regions) do
		xs = region[1]
		ys = region[2]
		num = math.min(#xs, #ys)
		vectors = {}
		my_polyline = self._region_panel:polyline({
			line_width = 2,
			alpha = 0.6,
			layer = 1,
			closed = region.closed,
			blend_mode = "add",
			halign = "scale",
			valign = "scale",
			color = tweak_data.screen_colors.crimenet_lines
		})
		for i = 1, num do
			table.insert(vectors, Vector3(xs[i] / tw * self._map_size_w * self._zoom, ys[i] / th * self._map_size_h * self._zoom, 0))
		end
		my_polyline:set_points(vectors)
		vectors = {}
		my_polyline = self._region_panel:polyline({
			line_width = 5,
			alpha = 0.2,
			layer = 1,
			closed = region.closed,
			blend_mode = "add",
			halign = "scale",
			valign = "scale",
			color = tweak_data.screen_colors.crimenet_lines
		})
		for i = 1, num do
			table.insert(vectors, Vector3(xs[i] / tw * self._map_size_w * self._zoom, ys[i] / th * self._map_size_h * self._zoom, 0))
		end
		my_polyline:set_points(vectors)
		region_text_data = region.text
		if region_text_data then
			x = region_text_data.x / tw * self._map_size_w * self._zoom
			y = region_text_data.y / th * self._map_size_h * self._zoom
			if region_text_data.title_id then
				region_text = self._region_panel:text({
					font = tweak_data.menu.pd2_large_font,
					font_size = tweak_data.menu.pd2_large_font_size,
					text = managers.localization:to_upper_text(region_text_data.title_id),
					layer = 1,
					alpha = 0.6,
					blend_mode = "add",
					halign = "scale",
					valign = "scale",
					rotation = 0
				})
				local _, _, w, h = region_text:text_rect()
				region_text:set_size(w, h)
				region_text:set_center(x, y)
				table.insert(self._region_locations, {
					object = region_text,
					size = region_text:font_size()
				})
			end
			if region_text_data.sub_id then
				region_text = self._region_panel:text({
					font = tweak_data.menu.pd2_small_font,
					font_size = tweak_data.menu.pd2_small_font_size,
					text = managers.localization:to_upper_text(region_text_data.sub_id),
					align = "center",
					vertical = "center",
					layer = 1,
					alpha = 0.6,
					blend_mode = "add",
					halign = "scale",
					valign = "scale",
					rotation = 0
				})
				local _, _, w, h = region_text:text_rect()
				region_text:set_size(w, h)
				if region_text_data.title_id then
					region_text:set_position(self._region_locations[#self._region_locations].object:left(), self._region_locations[#self._region_locations].object:bottom() - 5)
				else
					region_text:set_center(x, y)
				end
				table.insert(self._region_locations, {
					object = region_text,
					size = region_text:font_size()
				})
			end
		end
	end
	if Application:production_build() and tweak_data.gui.crime_net.debug_options.regions then
		for _, data in ipairs(tweak_data.gui.crime_net.locations) do
			local location = data[1]
			if location and location.dots then
				for _, dot in ipairs(location.dots) do
					self._region_panel:rect({
						w = 1,
						h = 1,
						color = Color.red,
						x = dot[1] / tw * self._map_size_w * self._zoom,
						y = dot[2] / th * self._map_size_h * self._zoom,
						halign = "scale",
						valign = "scale",
						layer = 1000
					})
				end
			end
		end
	end
end

function CrimeNetGui:set_players_online(players)
	local players_string = managers.money:add_decimal_marks_to_string(string.format("%.3d", players))
	local num_players_text = self._panel:child("num_players_text")
	num_players_text:set_text(managers.localization:to_upper_text("cn_menu_num_players_online", {amount = players_string}))
	self:make_fine_text(num_players_text)
	self._panel:child("num_players_blur"):set_shape(num_players_text:shape())
end

function CrimeNetGui:_create_locations()
	self._locations = deep_clone(self._tweak_data.locations) or {}
	self:_create_polylines()
end

function CrimeNetGui:_add_location(contact, data)
	do return end
	self._locations[contact] = self._locations[contact] or {}
	table.insert(self._locations[contact], data)
end

function CrimeNetGui:_get_contact_locations()
	return self._locations[1]
end

function CrimeNetGui:_get_random_location()
	return self._pan_panel_job_border_x + math.random(self._map_size_w - 2 * self._pan_panel_job_border_x), self._pan_panel_job_border_y + math.random(self._map_size_h - 2 * self._pan_panel_job_border_y)
end

function CrimeNetGui:_get_job_location(data)
	local locations = self:_get_contact_locations()
	if locations and 0 < #locations then
		local found_point = false
		local x, y, randomized_location
		local break_limit = 100
		local dots = locations[1].dots
		local randomized_dot = math.random(#dots)
		local choosen_dot = randomized_dot
		randomized_location = dots[choosen_dot]
		while randomized_location[3] do
			choosen_dot = choosen_dot % #dots + 1
			randomized_location = dots[choosen_dot]
			if choosen_dot == randomized_dot then
				Application:error("[CrimeNetGui:_get_job_location] All spawning points are taken!")
				return self:_get_random_location()
			end
		end
		x = randomized_location[1]
		y = randomized_location[2]
		if x and y then
			local tw = math.max(self._map_panel:child("map"):texture_width(), 1)
			local th = math.max(self._map_panel:child("map"):texture_height(), 1)
			x = math.round(x / tw * self._map_size_w)
			y = math.round(y / th * self._map_size_h)
			return x, y, randomized_location
		end
	end
	return self:_get_random_location()
end

function CrimeNetGui:add_preset_job(preset_id)
	self:remove_job(preset_id)
	local preset = managers.crimenet:preset(preset_id)
	local gui_data = self:_create_job_gui(preset, "preset")
	gui_data.preset_id = preset_id
	self._jobs[preset_id] = gui_data
end

function CrimeNetGui:add_server_job(data)
	local gui_data = self:_create_job_gui(data, "server")
	gui_data.server = true
	gui_data.host_name = data.host_name
	self._jobs[data.id] = gui_data
end

function CrimeNetGui:_create_job_gui(data, type, fixed_x, fixed_y, fixed_location)
	local level_id = data.level_id
	local level_data = tweak_data.levels[level_id]
	local narrative_data = data.job_id and tweak_data.narrative.jobs[data.job_id]
	local is_server = type == "server"
	local is_professional = narrative_data and narrative_data.professional
	local got_job = data.job_id and true or false
	local x = fixed_x
	local y = fixed_y
	local location = fixed_location
	if not x and not y then
		x, y, location = self:_get_job_location(data)
	end
	local color = Color.white
	local friend_color = tweak_data.screen_colors.friend_color
	local regular_color = tweak_data.screen_colors.regular_color
	local pro_color = tweak_data.screen_colors.pro_color
	local side_panel = self._pan_panel:panel({layer = 26, alpha = 0})
	local stars_panel = side_panel:panel({
		name = "stars_panel",
		layer = -1,
		visible = true,
		w = 100
	})
	local num_stars = 0
	local star_size = 8
	local job_num = 0
	local job_cash = 0
	local difficulty_name = side_panel:text({
		name = "difficulty_name",
		text = "",
		vertical = "center",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		color = color,
		blend_mode = "add",
		layer = 0
	})
	if data.job_id then
		local x = 0
		local y = 0
		local job_stars = math.ceil(tweak_data.narrative.jobs[data.job_id].jc / 10)
		local difficulty_stars = data.difficulty_id - 2
		local job_and_difficulty_stars = job_stars + difficulty_stars
		for i = 1, 10 do
			stars_panel:bitmap({
				texture = "guis/textures/pd2/crimenet_paygrade_marker",
				x = x,
				y = y,
				blend_mode = "normal",
				layer = 0,
				color = i > job_stars + difficulty_stars and Color.black or i > job_stars and tweak_data.screen_colors.risk or color
			})
			x = x + star_size
			num_stars = num_stars + 1
		end
		local money_multiplier = managers.money:get_contract_difficulty_multiplier(difficulty_stars)
		local money_stage_stars = managers.money:get_stage_payout_by_stars(job_stars)
		local money_job_stars = managers.money:get_job_payout_by_stars(job_stars)
		local plvl = managers.experience:current_level()
		local player_stars = math.max(math.ceil(plvl / 10), 1)
		local money_manager = tweak_data.money_manager.level_limit
		if player_stars <= job_and_difficulty_stars + tweak_data:get_value("money_manager", "level_limit", "low_cap_level") then
			local diff_stars = math.clamp(job_and_difficulty_stars - player_stars, 1, #money_manager.pc_difference_multipliers)
			local level_limit_mul = tweak_data:get_value("money_manager", "level_limit", "pc_difference_multipliers", diff_stars)
			local plr_difficulty_stars = math.max(difficulty_stars - diff_stars, 0)
			local plr_money_multiplier = managers.money:get_contract_difficulty_multiplier(plr_difficulty_stars) or 0
			local white_player_stars = player_stars - plr_difficulty_stars
			local cash_plr_stage_stars = managers.money:get_stage_payout_by_stars(white_player_stars, true)
			cash_plr_stage_stars = cash_plr_stage_stars + cash_plr_stage_stars * plr_money_multiplier
			local cash_stage = money_stage_stars + money_stage_stars * money_multiplier
			local diff_stage = cash_stage - cash_plr_stage_stars
			local new_cash_stage = cash_plr_stage_stars + diff_stage * level_limit_mul
			money_stage_stars = money_stage_stars * (new_cash_stage / cash_stage)
			local cash_plr_job_stars = managers.money:get_job_payout_by_stars(white_player_stars, true)
			cash_plr_job_stars = cash_plr_job_stars + cash_plr_job_stars * plr_money_multiplier
			local cash_job = money_job_stars + money_job_stars * money_multiplier
			local diff_job = cash_job - cash_plr_job_stars
			local new_cash_job = cash_plr_job_stars + diff_job * level_limit_mul
			money_job_stars = money_job_stars * (new_cash_job / cash_job)
		end
		job_num = #tweak_data.narrative.jobs[data.job_id].chain
		job_cash = managers.experience:cash_string(math.round(money_job_stars + tweak_data:get_value("money_manager", "flat_job_completion") + money_job_stars * money_multiplier + (money_stage_stars + tweak_data:get_value("money_manager", "flat_stage_completion") + money_stage_stars * money_multiplier) * #tweak_data.narrative.jobs[data.job_id].chain))
		local difficulty_string = managers.localization:to_upper_text(tweak_data.difficulty_name_ids[tweak_data.difficulties[data.difficulty_id]])
		difficulty_name:set_text(difficulty_string)
		difficulty_name:set_color(0 < difficulty_stars and tweak_data.screen_colors.risk or tweak_data.screen_colors.text)
	end
	local host_string = data.host_name or is_professional and managers.localization:to_upper_text("cn_menu_pro_job") or " "
	local job_string = data.job_id and managers.localization:to_upper_text(tweak_data.narrative.jobs[data.job_id].name_id) or data.level_name or "NO JOB"
	local contact_string = utf8.to_upper(data.job_id and managers.localization:text(tweak_data.narrative.contacts[tweak_data.narrative.jobs[data.job_id].contact].name_id)) or "BAIN"
	contact_string = contact_string .. ": "
	local info_string = managers.localization:to_upper_text("cn_menu_contract_short_" .. (1 < job_num and "plural" or "singular"), {days = job_num, money = job_cash})
	info_string = info_string .. (data.state_name and " / " .. data.state_name or "")
	local host_name = side_panel:text({
		name = "host_name",
		text = host_string,
		vertical = "center",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		color = data.is_friend and friend_color or is_server and regular_color or pro_color,
		blend_mode = "add",
		layer = 0
	})
	local job_name = side_panel:text({
		name = "job_name",
		text = job_string,
		vertical = "center",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		color = color,
		blend_mode = "add",
		layer = 0
	})
	local contact_name = side_panel:text({
		name = "contact_name",
		text = contact_string,
		vertical = "center",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		color = color,
		blend_mode = "add",
		layer = 0
	})
	local info_name = side_panel:text({
		name = "info_name",
		text = info_string,
		vertical = "center",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		color = color,
		blend_mode = "add",
		layer = 0
	})
	stars_panel:set_w(star_size * math.min(10, #stars_panel:children()))
	stars_panel:set_h(star_size)
	local focus = self._pan_panel:bitmap({
		name = "focus",
		texture = "guis/textures/crimenet_map_circle",
		layer = 10,
		color = color:with_alpha(0.6),
		blend_mode = "add"
	})
	do
		local _, _, w, h = host_name:text_rect()
		host_name:set_size(w, h)
		host_name:set_position(0, 0)
		if not is_server then
		end
	end
	do
		local _, _, w, h = job_name:text_rect()
		job_name:set_size(w, h)
		job_name:set_position(0, host_name:bottom())
	end
	do
		local _, _, w, h = contact_name:text_rect()
		contact_name:set_size(w, h)
		contact_name:set_top(job_name:top())
		contact_name:set_right(0)
	end
	do
		local _, _, w, h = info_name:text_rect()
		info_name:set_size(w, h)
		info_name:set_top(contact_name:bottom())
		info_name:set_right(0)
	end
	do
		local _, _, w, h = difficulty_name:text_rect()
		difficulty_name:set_size(w, h)
		difficulty_name:set_top(info_name:bottom())
		difficulty_name:set_right(0)
	end
	if not got_job then
		job_name:set_text(data.state_name or managers.localization:to_upper_text("menu_lobby_server_state_in_lobby"))
		local _, _, w, h = job_name:text_rect()
		job_name:set_size(w, h)
		job_name:set_position(0, host_name:bottom())
		contact_name:set_text(" ")
		contact_name:set_w(0, 0)
		contact_name:set_position(0, host_name:bottom())
		info_name:set_text(" ")
		info_name:set_size(0, 0)
		info_name:set_position(0, host_name:bottom())
		difficulty_name:set_text(" ")
		difficulty_name:set_w(0, 0)
		difficulty_name:set_position(0, host_name:bottom())
	end
	stars_panel:set_position(0, job_name:bottom())
	side_panel:set_h(math.max(stars_panel:bottom(), difficulty_name:bottom()))
	side_panel:set_w(300)
	self._num_layer_jobs = (self._num_layer_jobs + 1) % 1
	local marker_panel = self._pan_panel:panel({
		w = 36,
		h = 66,
		layer = 11 + self._num_layer_jobs * 3,
		alpha = 0
	})
	local select_panel = marker_panel:panel({
		name = "select_panel",
		w = 36,
		h = 38,
		x = -2,
		y = 0
	})
	local glow_panel = self._pan_panel:panel({
		w = 960,
		h = 192,
		layer = 10,
		alpha = 0
	})
	local glow_center = glow_panel:bitmap({
		texture = "guis/textures/pd2/crimenet_marker_glow",
		w = 192,
		h = 192,
		blend_mode = "add",
		alpha = 0.55,
		color = is_professional and pro_color or regular_color
	})
	local glow_stretch = glow_panel:bitmap({
		texture = "guis/textures/pd2/crimenet_marker_glow",
		w = 960,
		h = 50,
		blend_mode = "add",
		alpha = 0.55,
		color = is_professional and pro_color or regular_color
	})
	local glow_center_dark = glow_panel:bitmap({
		texture = "guis/textures/pd2/crimenet_marker_glow",
		w = 150,
		h = 150,
		blend_mode = "normal",
		alpha = 0.7,
		color = Color.black,
		layer = -1
	})
	local glow_stretch_dark = glow_panel:bitmap({
		texture = "guis/textures/pd2/crimenet_marker_glow",
		w = 990,
		h = 55,
		blend_mode = "normal",
		alpha = 0.7,
		color = Color.black,
		layer = -1
	})
	glow_center:set_center(glow_panel:w() / 2, glow_panel:h() / 2)
	glow_stretch:set_center(glow_panel:w() / 2, glow_panel:h() / 2)
	glow_center_dark:set_center(glow_panel:w() / 2, glow_panel:h() / 2)
	glow_stretch_dark:set_center(glow_panel:w() / 2, glow_panel:h() / 2)
	local marker_dot = marker_panel:bitmap({
		name = "marker_dot",
		texture = "guis/textures/pd2/crimenet_marker_" .. (is_server and "join" or "host") .. (is_professional and "_pro" or ""),
		color = color,
		w = 32,
		h = 64,
		x = 2,
		y = 2,
		layer = 1
	})
	if is_professional then
		marker_panel:bitmap({
			name = "marker_pro_outline",
			texture = "guis/textures/pd2/crimenet_marker_pro_outline",
			w = 64,
			h = 64,
			x = 0,
			y = 0,
			rotation = 0,
			layer = 0,
			alpha = 1,
			blend_mode = "add"
		})
	end
	local timer_rect, peers_panel
	if is_server then
		peers_panel = self._pan_panel:panel({
			layer = 11 + self._num_layer_jobs * 3,
			visible = true,
			w = 32,
			h = 62,
			alpha = 0
		})
		local cx = 0
		local cy = 0
		for i = 1, 4 do
			cx = 3 + 6 * (i - 1)
			cy = 8
			local player_marker = peers_panel:bitmap({
				name = tostring(i),
				texture = "guis/textures/pd2/crimenet_marker_peerflag",
				w = 8,
				h = 16,
				color = color,
				layer = 2,
				blend_mode = "normal",
				visible = i <= data.num_plrs
			})
			player_marker:set_position(cx, cy)
		end
	else
		timer_rect = marker_panel:bitmap({
			name = "timer_rect",
			texture = "guis/textures/pd2/crimenet_timer",
			color = Color.white,
			w = 32,
			h = 32,
			x = 1,
			y = 2,
			render_template = "VertexColorTexturedRadial",
			layer = 2
		})
		timer_rect:set_texture_rect(32, 0, -32, 32)
	end
	marker_panel:set_center(x * self._zoom, y * self._zoom)
	focus:set_center(marker_panel:center())
	glow_panel:set_world_center(marker_panel:child("select_panel"):world_center())
	local text_on_right = x < self._map_size_w - 200
	if text_on_right then
		side_panel:set_left(marker_panel:right())
	else
		job_name:set_text(contact_name:text() .. job_name:text())
		contact_name:set_text("")
		contact_name:set_w(0)
		local _, _, w, h = job_name:text_rect()
		job_name:set_size(w, h)
		host_name:set_right(side_panel:w())
		job_name:set_right(side_panel:w())
		contact_name:set_left(side_panel:w())
		info_name:set_left(side_panel:w())
		difficulty_name:set_left(side_panel:w())
		stars_panel:set_right(side_panel:w())
		side_panel:set_right(marker_panel:left())
	end
	side_panel:set_center_y(marker_panel:top() + 11)
	if peers_panel then
		peers_panel:set_center_x(marker_panel:center_x())
		peers_panel:set_center_y(marker_panel:center_y())
	end
	if not Application:production_build() or peers_panel then
	end
	local callout
	if narrative_data and narrative_data.crimenet_callouts and 0 < #narrative_data.crimenet_callouts then
		local variant = math.random(#narrative_data.crimenet_callouts)
		callout = narrative_data.crimenet_callouts[variant]
	end
	if location then
		location[3] = true
	end
	managers.menu:post_event("job_appear")
	local job = {
		room_id = data.room_id,
		job_id = data.job_id,
		level_id = level_id,
		level_data = level_data,
		marker_panel = marker_panel,
		peers_panel = peers_panel,
		timer_rect = timer_rect,
		side_panel = side_panel,
		focus = focus,
		difficulty = data.difficulty,
		difficulty_id = data.difficulty_id,
		num_plrs = data.num_plrs,
		job_x = x,
		job_y = y,
		state = data.state,
		layer = 11 + self._num_layer_jobs * 3,
		glow_panel = glow_panel,
		callout = callout,
		text_on_right = text_on_right,
		location = location
	}
	self:update_job_gui(job, 3)
	return job
end

function CrimeNetGui:remove_job(id)
	local data = self._jobs[id]
	if not data then
		return
	end
	if not alive(self._panel) then
		return
	end
	self._pan_panel:remove(data.marker_panel)
	self._pan_panel:remove(data.glow_panel)
	self._pan_panel:remove(data.side_panel)
	self._pan_panel:remove(data.focus)
	if data.location then
		data.location[3] = nil
	end
	if data.peers_panel then
		self._pan_panel:remove(data.peers_panel)
	end
	if data.expanded then
	end
	self._jobs[id] = nil
end

function CrimeNetGui:update_server_job(data, i)
	local job_index = data.id or i
	local job = self._jobs[job_index]
	if not job then
		return
	end
	local level_id = data.level_id
	local level_data = tweak_data.levels[level_id]
	local recreate_job = false
	recreate_job = recreate_job or self:_update_job_variable(job_index, "room_id", data.room_id)
	recreate_job = recreate_job or self:_update_job_variable(job_index, "job_id", data.job_id)
	recreate_job = recreate_job or self:_update_job_variable(job_index, "level_id", level_id)
	recreate_job = recreate_job or self:_update_job_variable(job_index, "level_data", level_data)
	recreate_job = recreate_job or self:_update_job_variable(job_index, "difficulty", data.difficulty)
	recreate_job = recreate_job or self:_update_job_variable(job_index, "difficulty_id", data.difficulty_id)
	recreate_job = recreate_job or self:_update_job_variable(job_index, "state", data.state)
	self:_update_job_variable(job_index, "state_name", data.state_name)
	if self:_update_job_variable(job_index, "num_plrs", data.num_plrs) and job.peers_panel then
		for i, peer_icon in ipairs(job.peers_panel:children()) do
			peer_icon:set_visible(i <= job.num_plrs)
		end
	end
	if recreate_job then
		print("[CrimeNetGui] update_server_job", "job_index", job_index)
		local is_server = job.server
		local x = job.job_x
		local y = job.job_y
		local location = job.location
		self:remove_job(job_index)
		local gui_data = self:_create_job_gui(data, is_server and "server" or "contract", x, y, location)
		gui_data.server = is_server
		self._jobs[job_index] = gui_data
	end
end

function CrimeNetGui:_update_job_variable(id, variable, value)
	local data = self._jobs[id]
	if not data then
		return
	end
	local updated = data[variable] ~= value
	data[variable] = value
	return updated
end

function CrimeNetGui:update_job(id, t, dt)
	local data = self._jobs[id]
	if not data then
		return
	end
	data.focus:set_alpha(data.focus:alpha() - dt / 2)
	data.focus:set_size(data.focus:w() + dt * 200, data.focus:h() + dt * 200)
	data.focus:set_center(data.marker_panel:center())
end

function CrimeNetGui:feed_timer(id, t, max_t)
	local data = self._jobs[id]
	if not data then
		return
	end
	if not data.timer_rect then
		return
	end
	data.timer_rect:set_color(Color(t / max_t, 1, 1))
	if max_t - t < 4 then
	else
		if t < 4 then
		else
		end
	end
end

function CrimeNetGui:update(t, dt)
	self._rasteroverlay:set_texture_rect(0, -math.mod(Application:time() * 5, 32), 32, 640)
	if self._released_map then
		self._released_map.dx = math.lerp(self._released_map.dx, 0, dt * 2)
		self._released_map.dy = math.lerp(self._released_map.dy, 0, dt * 2)
		self:_set_map_position(self._released_map.dx, self._released_map.dy)
		if self._map_panel:x() >= -5 or -5 <= self._fullscreen_panel:w() - self._map_panel:right() then
			self._released_map.dx = 0
		end
		if -5 <= self._map_panel:y() or -5 <= self._fullscreen_panel:h() - self._map_panel:bottom() then
			self._released_map.dy = 0
		end
		self._released_map.t = self._released_map.t - dt
		if 0 > self._released_map.t then
			self._released_map = nil
		end
	end
	if not self._grabbed_map then
		local speed = 5
		if self._map_panel:x() > -self:_get_pan_panel_border() then
			local mx = math.lerp(0, -self:_get_pan_panel_border() - self._map_panel:x(), dt * speed)
			self:_set_map_position(mx, 0)
		end
		if self._fullscreen_panel:w() - self._map_panel:right() > -self:_get_pan_panel_border() then
			local mx = math.lerp(0, self:_get_pan_panel_border() - (self._map_panel:right() - self._fullscreen_panel:w()), dt * speed)
			self:_set_map_position(mx, 0)
		end
		if self._map_panel:y() > -self:_get_pan_panel_border() then
			local my = math.lerp(0, -self:_get_pan_panel_border() - self._map_panel:y(), dt * speed)
			self:_set_map_position(0, my)
		end
		if self._fullscreen_panel:h() - self._map_panel:bottom() > -self:_get_pan_panel_border() then
			local my = math.lerp(0, self:_get_pan_panel_border() - (self._map_panel:bottom() - self._fullscreen_panel:h()), dt * speed)
			self:_set_map_position(0, my)
		end
	end
	if not managers.menu:is_pc_controller() and managers.mouse_pointer:mouse_move_x() == 0 and managers.mouse_pointer:mouse_move_y() == 0 then
		local closest_job
		local closest_dist = 100000000
		local closest_job_x, closest_job_y = 0, 0
		local mouse_pos_x, mouse_pos_y = managers.mouse_pointer:modified_mouse_pos()
		local job_x, job_y
		local dist = 0
		local x, y
		for id, job in pairs(self._jobs) do
			job_x, job_y = job.marker_panel:child("select_panel"):world_center()
			x = job_x - mouse_pos_x
			y = job_y - mouse_pos_y
			dist = x * x + y * y
			if closest_dist > dist then
				closest_job = job
				closest_dist = dist
				closest_job_x = job_x
				closest_job_y = job_y
			end
		end
		if closest_job then
			closest_dist = math.sqrt(closest_dist)
			if closest_dist < self._tweak_data.controller.snap_distance then
				managers.mouse_pointer:force_move_mouse_pointer(math.lerp(mouse_pos_x, closest_job_x, dt * self._tweak_data.controller.snap_speed) - mouse_pos_x, math.lerp(mouse_pos_y, closest_job_y, dt * self._tweak_data.controller.snap_speed) - mouse_pos_y)
			end
		end
	end
end

function CrimeNetGui:feed_server_timer(id, t)
	local data = self._jobs[id]
	if not data then
		return
	end
	if not data.timer_rect then
		return
	end
	if t < 4 then
		data.timer_rect:set_visible(true)
		data.timer_rect:set_color(Color(math.sin(t * 750), 1, 1))
	else
		data.timer_rect:set_visible(false)
	end
end

function CrimeNetGui:toggle_legend()
	managers.menu_component:post_event("menu_enter")
	self._panel:child("legend_panel"):set_visible(not self._panel:child("legend_panel"):visible())
	self._panel:child("legends_button"):set_text(managers.localization:to_upper_text(self._panel:child("legend_panel"):visible() and "menu_cn_legend_hide" or "menu_cn_legend_show", {
		BTN_X = managers.localization:btn_macro("menu_toggle_legends")
	}))
	self:make_fine_text(self._panel:child("legends_button"))
	self._panel:child("legends_button_blur"):set_shape(self._panel:child("legends_button"):shape())
end

function CrimeNetGui:mouse_button_click(button)
	return button == Idstring("0")
end

function CrimeNetGui:button_wheel_scroll_up(button)
	return button == Idstring("mouse wheel up")
end

function CrimeNetGui:button_wheel_scroll_down(button)
	return button == Idstring("mouse wheel down")
end

function CrimeNetGui:confirm_pressed()
	if not self._crimenet_enabled then
		return false
	end
	return self:check_job_pressed(managers.mouse_pointer:modified_mouse_pos())
end

function CrimeNetGui:special_btn_pressed(button)
	if not self._crimenet_enabled then
		return false
	end
	if button == Idstring("menu_toggle_legends") then
		self:toggle_legend()
		return true
	end
	if self._panel:child("filter_button") and button == Idstring("menu_toggle_filters") then
		managers.menu_component:post_event("menu_enter")
		if is_x360 then
			XboxLive:show_friends_ui(managers.user:get_platform_id())
		else
			managers.menu:open_node("crimenet_filters", {})
		end
		return true
	end
	return false
end

function CrimeNetGui:previous_page()
	if not self._crimenet_enabled then
		return
	end
	self:_set_zoom("out", managers.mouse_pointer:modified_mouse_pos())
	return true
end

function CrimeNetGui:next_page()
	if not self._crimenet_enabled then
		return
	end
	self:_set_zoom("in", managers.mouse_pointer:modified_mouse_pos())
	return true
end

function CrimeNetGui:input_focus()
	return self._crimenet_enabled and 1
end

function CrimeNetGui:check_job_mouse_over(x, y)
end

function CrimeNetGui:check_job_pressed(x, y)
	for id, job in pairs(self._jobs) do
		if job.mouse_over == 1 then
			job.expanded = not job.expanded
			local data = {
				difficulty = job.difficulty,
				difficulty_id = job.difficulty_id,
				job_id = job.job_id,
				level_id = job.level_id,
				id = id,
				room_id = job.room_id,
				server = job.server or false,
				num_plrs = job.num_plrs or 0,
				state = job.state,
				host_name = job.host_name
			}
			managers.menu_component:post_event("menu_enter")
			managers.menu:open_node(Global.game_settings.single_player and "crimenet_contract_singleplayer" or job.server and "crimenet_contract_join" or "crimenet_contract_host", {data})
			if job.expanded then
				for id2, job2 in pairs(self._jobs) do
					if job2 ~= job then
						job2.expanded = false
					end
				end
			end
			return true
		end
	end
end

function CrimeNetGui:mouse_pressed(o, button, x, y)
	if not self._crimenet_enabled then
		return
	end
	if self:mouse_button_click(button) then
		if self._panel:child("back_button"):inside(x, y) then
			managers.menu:back()
			return
		end
		if self._panel:child("legends_button"):inside(x, y) then
			self:toggle_legend()
			return
		end
		if self._panel:child("filter_button") and self._panel:child("filter_button"):inside(x, y) then
			managers.menu_component:post_event("menu_enter")
			managers.menu:open_node("crimenet_filters", {})
			return
		end
		if self:check_job_pressed(x, y) then
			return true
		end
		if self._panel:inside(x, y) then
			self._released_map = nil
			self._grabbed_map = {
				x = x,
				y = y,
				dirs = {}
			}
		end
	elseif self:button_wheel_scroll_down(button) then
		if self._one_scroll_out_delay then
			self._one_scroll_out_delay = nil
		end
		self:_set_zoom("out", x, y)
		return true
	elseif self:button_wheel_scroll_up(button) then
		if self._one_scroll_in_delay then
			self._one_scroll_in_delay = nil
		end
		self:_set_zoom("in", x, y)
		return true
	end
	return true
end

function CrimeNetGui:start_job()
	for id, job in pairs(self._jobs) do
		if job.expanded then
			if job.preset_id then
				MenuCallbackHandler:start_job(job)
				self:remove_job(job.preset_id)
				return true
			else
				print("Is a server, don't want to join", id, job.side_panel:child("host_name"):text() == "WWWWWWWWWWWW\194\181QQW")
				managers.network.matchmake:join_server_with_check(id)
				return
			end
		end
	end
end

function CrimeNetGui:mouse_released(o, button, x, y)
	if not self._crimenet_enabled then
		return
	end
	if not self:mouse_button_click(button) then
		return
	end
	if self._grabbed_map and #self._grabbed_map.dirs > 0 then
		local dx, dy = 0, 0
		for _, values in ipairs(self._grabbed_map.dirs) do
			dx = dx + values[1]
			dy = dy + values[2]
		end
		dx = dx / #self._grabbed_map.dirs
		dy = dy / #self._grabbed_map.dirs
		self._released_map = {
			t = 2,
			dx = dx,
			dy = dy
		}
		self._grabbed_map = nil
	end
end

function CrimeNetGui:_get_pan_panel_border()
	return self._pan_panel_border * self._zoom
end

function CrimeNetGui:_set_map_position(mx, my)
	local x = self._map_x + mx
	local y = self._map_y + my
	self._pan_panel:set_position(x, y)
	if self._pan_panel:left() > 0 then
		self._pan_panel:set_left(0)
	end
	if self._pan_panel:right() < self._fullscreen_panel:w() then
		self._pan_panel:set_right(self._fullscreen_panel:w())
	end
	if 0 < self._pan_panel:top() then
		self._pan_panel:set_top(0)
	end
	if self._pan_panel:bottom() < self._fullscreen_panel:h() then
		self._pan_panel:set_bottom(self._fullscreen_panel:h())
	end
	self._map_x, self._map_y = self._pan_panel:position()
	self._pan_panel:set_position(math.round(self._map_x), math.round(self._map_y))
	x, y = self._map_x, self._map_y
	self._map_panel:set_shape(self._pan_panel:shape())
	self._pan_panel:set_position(managers.gui_data:full_16_9_to_safe(x, y))
	local full_16_9 = managers.gui_data:full_16_9_size()
	local w_ratio = self._fullscreen_panel:w() / self._map_panel:w()
	local h_ratio = self._fullscreen_panel:h() / self._map_panel:h()
	local panel_x = -(self._map_panel:x() / self._fullscreen_panel:w()) * w_ratio
	local panel_y = -(self._map_panel:y() / self._fullscreen_panel:h()) * h_ratio
	local cross_indicator_h1 = self._fullscreen_panel:child("cross_indicator_h1")
	local cross_indicator_h2 = self._fullscreen_panel:child("cross_indicator_h2")
	local cross_indicator_v1 = self._fullscreen_panel:child("cross_indicator_v1")
	local cross_indicator_v2 = self._fullscreen_panel:child("cross_indicator_v2")
	local line_indicator_h1 = self._fullscreen_panel:child("line_indicator_h1")
	local line_indicator_h2 = self._fullscreen_panel:child("line_indicator_h2")
	local line_indicator_v1 = self._fullscreen_panel:child("line_indicator_v1")
	local line_indicator_v2 = self._fullscreen_panel:child("line_indicator_v2")
	cross_indicator_h1:set_y(full_16_9.convert_y + self._panel:h() * panel_y)
	cross_indicator_h2:set_bottom(self._fullscreen_panel:child("cross_indicator_h1"):y() + self._panel:h() * h_ratio)
	cross_indicator_v1:set_x(full_16_9.convert_x + self._panel:w() * panel_x)
	cross_indicator_v2:set_right(self._fullscreen_panel:child("cross_indicator_v1"):x() + self._panel:w() * w_ratio)
	line_indicator_h1:set_position(cross_indicator_v1:x(), cross_indicator_h1:y())
	line_indicator_h2:set_position(cross_indicator_v1:x(), cross_indicator_h2:y())
	line_indicator_v1:set_position(cross_indicator_v1:x(), cross_indicator_h1:y())
	line_indicator_v2:set_position(cross_indicator_v2:x(), cross_indicator_h1:y())
	line_indicator_h1:set_w(cross_indicator_v2:x() - cross_indicator_v1:x())
	line_indicator_h2:set_w(cross_indicator_v2:x() - cross_indicator_v1:x())
	line_indicator_v1:set_h(cross_indicator_h2:y() - cross_indicator_h1:y())
	line_indicator_v2:set_h(cross_indicator_h2:y() - cross_indicator_h1:y())
end

function CrimeNetGui:goto_lobby(lobby)
	print(lobby:id())
	local job = self._jobs[lobby:id()]
	if job then
		local x = job.marker_panel:child("select_panel"):center_x() + job.marker_panel:w() / 2
		local y = job.marker_panel:child("select_panel"):center_y() + job.marker_panel:h() - 2
		job.focus:set_size(job.focus:texture_width(), job.focus:texture_height())
		job.focus:set_color(job.focus:color():with_alpha(1))
		self:_goto_map_position(x, y)
	end
end

function CrimeNetGui:goto_bain()
	for _, job in pairs(self._jobs) do
	end
end

function CrimeNetGui:_goto_map_position(x, y)
	local tw = math.max(self._map_panel:child("map"):texture_width(), 1)
	local th = math.max(self._map_panel:child("map"):texture_height(), 1)
	local mx = self._map_panel:x() + x / tw * self._map_size_w * self._zoom - self._fullscreen_panel:w() * 0.5
	local my = self._map_panel:y() + y / th * self._map_size_h * self._zoom - self._fullscreen_panel:h() * 0.5
	self:_set_map_position(-mx, -my)
end

function CrimeNetGui:_set_zoom(zoom, x, y)
	local w1, h1 = self._pan_panel:size()
	local wx1 = (-self._fullscreen_panel:x() - self._pan_panel:x() + x) / self._pan_panel:w()
	local wy1 = (-self._fullscreen_panel:y() - self._pan_panel:y() + y) / self._pan_panel:h()
	local prev_zoom = self._zoom
	if zoom == "in" then
		local new_zoom = math.clamp(self._zoom * 1.1, self.MIN_ZOOM, self.MAX_ZOOM)
		if new_zoom ~= self._zoom then
			managers.menu_component:post_event("zoom_in")
		end
		self._zoom = new_zoom
	else
		local new_zoom = math.clamp(self._zoom / 1.1, self.MIN_ZOOM, self.MAX_ZOOM)
		if new_zoom ~= self._zoom then
			managers.menu_component:post_event("zoom_out")
		end
		self._zoom = new_zoom
	end
	self._pan_panel_border = 6.25 * self._zoom
	if prev_zoom == self._zoom then
		if zoom == "in" then
			self._one_scroll_out_delay = true
		else
			self._one_scroll_in_delay = true
		end
	end
	local cx, cy = self._pan_panel:center()
	self._pan_panel:set_size(self._map_size_w * self._zoom, self._map_size_h * self._zoom)
	self._pan_panel:set_center(cx, cy)
	local w2, h2 = self._pan_panel:size()
	self:_set_map_position((w1 - w2) * wx1, (h1 - h2) * wy1)
	for id, job in pairs(self._jobs) do
		job.marker_panel:set_center(job.job_x * self._zoom, job.job_y * self._zoom)
		job.glow_panel:set_world_center(job.marker_panel:child("select_panel"):world_center())
		job.focus:set_center(job.marker_panel:center())
		if job.text_on_right then
			job.side_panel:set_left(job.marker_panel:right())
		else
			job.side_panel:set_right(job.marker_panel:left())
		end
		job.side_panel:set_center_y(job.marker_panel:top() + 11)
		if job.peers_panel then
			job.peers_panel:set_center_x(job.marker_panel:center_x())
			job.peers_panel:set_center_y(job.marker_panel:center_y())
		end
	end
	for _, region_location in ipairs(self._region_locations) do
		region_location.object:set_font_size(self._zoom * region_location.size)
	end
end

function CrimeNetGui:update_job_gui(job, inside)
	if job.mouse_over ~= inside then
		job.mouse_over = inside
		
		local function animate_alpha(o, objects, job, alphas, inside)
			local wanted_alpha = alphas[1]
			local wanted_text_alpha = alphas[2]
			local start_h = job.side_panel:h()
			local h = start_h
			local host_name = job.side_panel:child("host_name")
			local job_name = job.side_panel:child("job_name")
			local contact_name = job.side_panel:child("contact_name")
			local info_name = job.side_panel:child("info_name")
			local difficulty_name = job.side_panel:child("difficulty_name")
			local stars_panel = job.side_panel:child("stars_panel")
			local base_h = math.round(host_name:h() + job_name:h() + stars_panel:h())
			local expand_h = math.round(base_h + info_name:h() + difficulty_name:h())
			local start_x = 0
			local max_x = math.round(math.max(contact_name:w(), info_name:w(), difficulty_name:w()))
			if job.text_on_right then
				start_x = math.round(math.min(contact_name:right(), info_name:right(), difficulty_name:right()))
			else
				start_x = math.round(job.side_panel:w() - math.min(contact_name:left(), info_name:left(), difficulty_name:left()))
			end
			local x = start_x
			local object_alpha = {}
			local text_alpha = job.side_panel:alpha()
			local alpha_met = false
			local glow_met = false
			local expand_met = false
			local pushout_met = x == 0
			local dt
			while not (alpha_met and glow_met and expand_met) or not pushout_met do
				dt = coroutine.yield()
				if not alpha_met then
					alpha_met = true
					for i, object in ipairs(objects) do
						if object and alive(object) then
							object_alpha[i] = object_alpha[i] or object:alpha()
							object_alpha[i] = math.step(object_alpha[i], wanted_alpha, dt)
							object:set_alpha(object_alpha[i])
							alpha_met = alpha_met and object_alpha[i] == wanted_alpha
						end
					end
					text_alpha = math.step(text_alpha, wanted_text_alpha, dt * 2)
					job.side_panel:set_alpha(text_alpha)
					alpha_met = alpha_met and text_alpha == wanted_text_alpha
					if not alpha_met or inside then
					end
				end
				if not glow_met then
					job.glow_panel:set_alpha(math.step(job.glow_panel:alpha(), inside and 0.2 or 0, dt * 5))
					glow_met = job.glow_panel:alpha() == (inside and 0.2 or 0)
					if glow_met and inside then
						local animate_pulse = function(o)
							while true do
								over(1, function(p)
									o:set_alpha(math.sin(p * 180) * 0.4 + 0.2)
								end)
							end
						end
						job.glow_panel:animate(animate_pulse)
					end
				end
				if not expand_met and pushout_met then
					h = math.step(h, inside and expand_h or base_h, (inside and expand_h or base_h) * dt * 4)
					job.side_panel:set_h(h)
					job.side_panel:set_center_y(o:top() + 11)
					stars_panel:set_bottom(job.side_panel:h())
					expand_met = h == (inside and expand_h or base_h)
					if expand_met then
						pushout_met = x == (inside and max_x or 0)
					end
				end
				if not pushout_met then
					x = math.step(x, inside and max_x or 0, max_x * dt * 4)
					stars_panel:set_alpha(1 - x / math.min(max_x, 1))
					if job.text_on_right then
						job_name:set_left(math.round(math.min(x, contact_name:w())))
						contact_name:set_left(math.round(math.min(x - contact_name:w(), 0)))
						info_name:set_left(math.round(math.min(x - info_name:w(), 0)))
						difficulty_name:set_left(math.round(math.min(x - difficulty_name:w(), 0)))
					else
						job_name:set_right(math.round(job.side_panel:w() - math.min(x, contact_name:w())))
						contact_name:set_right(math.round(job.side_panel:w() - math.min(x - contact_name:w(), 0)))
						info_name:set_right(math.round(job.side_panel:w() - math.min(x - info_name:w(), 0)))
						difficulty_name:set_right(math.round(job.side_panel:w() - math.min(x - difficulty_name:w(), 0)))
					end
					pushout_met = x == (inside and max_x or 0)
				end
			end
			if inside and job.callout and self._crimenet_enabled then
				Application:debug(job.callout)
				managers.menu_component:post_event(job.callout, true)
			end
		end
		
		local text_alpha = inside == 1 and 1 or inside == 2 and 0 or 1
		local object_alpha = inside == 1 and 1 or inside == 2 and 0.3 or 1
		local alphas = {object_alpha, text_alpha}
		local objects = {
			job.marker_panel,
			job.peers_panel
		}
		job.glow_panel:stop()
		if inside == 1 then
			managers.menu_component:post_event("highlight")
			job.side_panel:child("job_name"):set_blend_mode("normal")
			job.side_panel:child("contact_name"):set_blend_mode("normal")
			job.side_panel:child("info_name"):set_blend_mode("normal")
			job.side_panel:child("difficulty_name"):set_blend_mode("normal")
		else
			job.side_panel:child("job_name"):set_blend_mode("add")
			job.side_panel:child("contact_name"):set_blend_mode("add")
			job.side_panel:child("info_name"):set_blend_mode("add")
			job.side_panel:child("difficulty_name"):set_blend_mode("normal")
		end
		job.marker_panel:stop()
		if job.peers_panel then
			job.peers_panel:set_layer(inside == 1 and 20 or job.layer)
		end
		job.marker_panel:set_layer(inside == 1 and 20 or job.layer)
		job.glow_panel:set_layer(job.marker_panel:layer() - 1)
		job.marker_panel:animate(animate_alpha, objects, job, alphas, inside == 1)
	end
end

function CrimeNetGui:mouse_moved(o, x, y)
	if not self._crimenet_enabled then
		return
	end
	if managers.menu:is_pc_controller() then
		if self._panel:child("back_button"):inside(x, y) then
			if not self._back_highlighted then
				self._back_highlighted = true
				self._panel:child("back_button"):set_color(tweak_data.screen_colors.button_stage_2)
				managers.menu_component:post_event("highlight")
			end
			return false, "arrow"
		elseif self._back_highlighted then
			self._back_highlighted = false
			self._panel:child("back_button"):set_color(tweak_data.screen_colors.button_stage_3)
		end
		if self._panel:child("legends_button"):inside(x, y) then
			if not self._legend_highlighted then
				self._legend_highlighted = true
				self._panel:child("legends_button"):set_color(tweak_data.screen_colors.button_stage_2)
				managers.menu_component:post_event("highlight")
			end
			return false, "arrow"
		elseif self._legend_highlighted then
			self._legend_highlighted = false
			self._panel:child("legends_button"):set_color(tweak_data.screen_colors.button_stage_3)
		end
		if self._panel:child("filter_button") then
			if self._panel:child("filter_button"):inside(x, y) then
				if not self._filter_highlighted then
					self._filter_highlighted = true
					self._panel:child("filter_button"):set_color(tweak_data.screen_colors.button_stage_2)
					managers.menu_component:post_event("highlight")
				end
				return false, "arrow"
			elseif self._filter_highlighted then
				self._filter_highlighted = false
				self._panel:child("filter_button"):set_color(tweak_data.screen_colors.button_stage_3)
			end
		end
	end
	if self._grabbed_map then
		local left = x > self._grabbed_map.x
		local right = not left
		local up = y > self._grabbed_map.y
		local down = not up
		local mx = x - self._grabbed_map.x
		local my = y - self._grabbed_map.y
		if left and self._map_panel:x() > -self:_get_pan_panel_border() then
			mx = math.lerp(mx, 0, 1 - self._map_panel:x() / -self:_get_pan_panel_border())
		end
		if right and self._fullscreen_panel:w() - self._map_panel:right() > -self:_get_pan_panel_border() then
			mx = math.lerp(mx, 0, 1 - (self._fullscreen_panel:w() - self._map_panel:right()) / -self:_get_pan_panel_border())
		end
		if up and self._map_panel:y() > -self:_get_pan_panel_border() then
			my = math.lerp(my, 0, 1 - self._map_panel:y() / -self:_get_pan_panel_border())
		end
		if down and self._fullscreen_panel:h() - self._map_panel:bottom() > -self:_get_pan_panel_border() then
			my = math.lerp(my, 0, 1 - (self._fullscreen_panel:h() - self._map_panel:bottom()) / -self:_get_pan_panel_border())
		end
		table.insert(self._grabbed_map.dirs, 1, {mx, my})
		self._grabbed_map.dirs[10] = nil
		self:_set_map_position(mx, my)
		self._grabbed_map.x = x
		self._grabbed_map.y = y
		return true, "grab"
	end
	local closest_job
	local closest_dist = 100000000
	local closest_job_x, closest_job_y = 0, 0
	local job_x, job_y
	local dist = 0
	local inside_any_job = false
	local math_x, math_y
	for id, job in pairs(self._jobs) do
		local inside = job.marker_panel:child("select_panel"):inside(x, y) and self._panel:inside(x, y)
		inside_any_job = inside_any_job or inside
		if inside then
			job_x, job_y = job.marker_panel:child("select_panel"):world_center()
			math_x = job_x - x
			math_y = job_y - y
			dist = math_x * math_x + math_y * math_y
			if closest_dist > dist then
				closest_job = job
				closest_dist = dist
				closest_job_x = job_x
				closest_job_y = job_y
			end
		end
	end
	for id, job in pairs(self._jobs) do
		local inside = job == closest_job and 1 or inside_any_job and 2 or 3
		self:update_job_gui(job, inside)
	end
	if not managers.menu:is_pc_controller() then
		local to_left = x
		local to_right = self._panel:w() - x - 19
		local to_top = y
		local to_bottom = self._panel:h() - y - 23
		local panel_border = self._pan_panel_border
		to_left = 1 - math.clamp(to_left / panel_border, 0, 1)
		to_right = 1 - math.clamp(to_right / panel_border, 0, 1)
		to_top = 1 - math.clamp(to_top / panel_border, 0, 1)
		to_bottom = 1 - math.clamp(to_bottom / panel_border, 0, 1)
		local mouse_pointer_move_x = managers.mouse_pointer:mouse_move_x()
		local mouse_pointer_move_y = managers.mouse_pointer:mouse_move_y()
		local mp_left = -math.min(0, mouse_pointer_move_x)
		local mp_right = -math.max(0, mouse_pointer_move_x)
		local mp_top = -math.min(0, mouse_pointer_move_y)
		local mp_bottom = -math.max(0, mouse_pointer_move_y)
		local push_x = mp_left * to_left + mp_right * to_right
		local push_y = mp_top * to_top + mp_bottom * to_bottom
		if push_x ~= 0 or push_y ~= 0 then
			self:_set_map_position(push_x, push_y)
		end
	end
	if inside_any_job then
		return false, "arrow"
	end
	if self._panel:inside(x, y) then
		return false, "hand"
	end
end

function CrimeNetGui:ps3_invites_callback()
	if managers.system_menu and managers.system_menu:is_active() and not managers.system_menu:is_closing() then
		return true
	end
	if managers.menu:active_menu() and managers.menu:active_menu().input:get_accept_input() then
		managers.menu:active_menu().renderer:disable_input(0.2)
		MenuCallbackHandler:view_invites()
	end
end

function CrimeNetGui:enable_crimenet()
	self._crimenet_enabled = true
	managers.crimenet:activate()
	if self._ps3_invites_controller then
		self._ps3_invites_controller:set_enabled(true)
	end
end

function CrimeNetGui:disable_crimenet()
	self._crimenet_enabled = false
	managers.crimenet:deactivate()
	if self._ps3_invites_controller then
		self._ps3_invites_controller:set_enabled(false)
	end
end

function CrimeNetGui:close()
	managers.crimenet:stop()
	if self._crimenet_ambience then
		self._crimenet_ambience:stop()
		self._crimenet_ambience = nil
	end
	managers.menu_component:stop_event()
	managers.menu:active_menu().renderer.ws:show()
	self._ws:panel():remove(self._panel)
	self._fullscreen_ws:panel():remove(self._fullscreen_panel)
	Overlay:gui():destroy_workspace(self._blackborder_workspace)
	self._blackborder_workspace = nil
	if managers.controller:get_default_wrapper_type() ~= "pc" then
		managers.menu:active_menu().input:deactivate_controller_mouse()
		managers.mouse_pointer:release_mouse_pointer()
	end
	if self._ps3_invites_controller then
		self._ps3_invites_controller:set_enabled(false)
		self._ps3_invites_controller:destroy()
		self._ps3_invites_controller = nil
	end
end
