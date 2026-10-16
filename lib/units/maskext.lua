local mvec1 = Vector3()
local mvec2 = Vector3()
local mvec3 = Vector3()
local IDS_MATERIAL = Idstring("material")
local IDS_MATERIAL_AMOUNT = Idstring("material_amount")
local IDS_REFLECTION_TEXTURE = Idstring("reflection_texture")
local IDS_MATERIAL_TEXTURE = Idstring("material_texture")
local IDS_DIFFUSE_LAYER0_TEXTURE = Idstring("diffuse_layer0_texture")
local IDS_DIFFUSE_LAYER1_TEXTURE = Idstring("diffuse_layer1_texture")
local IDS_DIFFUSE_LAYER2_TEXTURE = Idstring("diffuse_layer2_texture")
local IDS_MATERIAL_AMOUNTS = Idstring("material_amounts")
local MATCAP_MODE_MATCAP = 1
function MaskExt:apply_blueprint(blueprint, async_clbk)
	if not blueprint or not blueprint.material then
		Application:error("[MaskExt:apply_blueprint] No blueprint or not even a base material applied", blueprint and inspect(blueprint))

		return
	end

	local td_bm_mats = tweak_data.blackmarket.materials
	local texture_load_result_clbk = async_clbk and callback(self, self, "clbk_texture_loaded", async_clbk)

	if not self._materials and not self._materials_mat3 then
		local materials = self._unit:get_objects_by_type(IDS_MATERIAL)

		self._materials = {}
		self._materials_mat3 = {}

		for _, material in ipairs(materials) do
			if material:variable_exists(IDS_MATERIAL_AMOUNTS) then
				table.insert(self._materials_mat3, material)
			elseif material:variable_exists(IDS_MATERIAL_AMOUNT) then
				table.insert(self._materials, material)
				Application:warn("[MaskExt] Using outdated material modes, please update this mask to use solid_mask:MATS_3 render template", self._unit)
			end
		end
	end

	local material_id = blueprint.material.id
	local pattern_id = blueprint.pattern.id
	local color_a_id = blueprint.color_a and blueprint.color_a.id or "strip_paint"
	local color_b_id = blueprint.color_a and blueprint.color_b.id or "strip_paint"
	local color_c_id = blueprint.color_c and blueprint.color_c.id or "strip_paint"

	self._tint_color_a = mvec1
	self._tint_color_b = mvec2
	self._tint_color_c = mvec3

	local material_data = td_bm_mats[material_id]
	local color_a_data = td_bm_mats[color_a_id]
	local color_b_data = td_bm_mats[color_b_id]
	local color_c_data = td_bm_mats[color_c_id]

	if not material_data then
		Application:error("Missing material id", blueprint.material.id)

		return
	end

	if not color_a_data and color_a_id ~= "nothing" then
		Application:error("Missing color_a id", blueprint.color_a.id)
	end

	if not color_b_data and color_b_id ~= "nothing" then
		Application:error("Missing color_b id", blueprint.color_b.id)
	end

	if not color_c_data and color_c_id ~= "nothing" then
		Application:error("Missing color_c id", blueprint.color_c.id)
	end

	mvector3.set_static(self._tint_color_a, (color_a_data and color_a_data.color or Color.red):unpack())
	mvector3.set_static(self._tint_color_b, (color_b_data and color_b_data.color or Color.green):unpack())
	mvector3.set_static(self._tint_color_c, (color_c_data and color_c_data.color or Color.blue):unpack())

	if material_id ~= "nothing" then
		local old_reflection = self._textures.reflection and self._textures.reflection.name
		local new_reflection = Idstring(material_data.texture)

		if old_reflection ~= new_reflection then
			self._textures.reflection = {
				ready = 0,
				texture = false,
				name = new_reflection,
				target = IDS_REFLECTION_TEXTURE
			}
		end
	end

	local old_pattern = self._textures.pattern and self._textures.pattern.name
	local new_pattern = Idstring(tweak_data.blackmarket.textures[pattern_id].texture)

	if old_pattern ~= new_pattern then
		self._textures.pattern = {
			ready = 0,
			texture = false,
			name = new_pattern,
			target = IDS_MATERIAL_TEXTURE
		}
	end

	if color_a_id ~= "nothing" then
		local old_color_a = self._textures.new_color_a and self._textures.new_color_a.name
		local new_color_a = Idstring(color_a_data.texture)

		if old_color_a ~= new_color_a then
			self._textures.color_a = {
				ready = 0,
				texture = false,
				name = new_color_a,
				target = IDS_DIFFUSE_LAYER0_TEXTURE
			}
		end
	end

	if color_b_id ~= "nothing" then
		local old_color_b = self._textures.new_color_b and self._textures.new_color_b.name
		local new_color_b = Idstring(color_b_data.texture)

		if old_color_b ~= new_color_b then
			self._textures.color_b = {
				ready = 0,
				texture = false,
				name = new_color_b,
				target = IDS_DIFFUSE_LAYER1_TEXTURE
			}
		end
	end

	if color_c_id ~= "nothing" then
		local old_color_c = self._textures.new_color_c and self._textures.new_color_c.name
		local new_color_c = Idstring(color_c_data.texture)

		if old_color_c ~= new_color_c then
			self._textures.color_c = {
				ready = 0,
				texture = false,
				name = new_color_c,
				target = IDS_DIFFUSE_LAYER2_TEXTURE
			}
		end
	end

	self._material_amount = material_data.material_amount or MATCAP_MODE_MATCAP
	self._material_amounts = Vector3(color_a_data and color_a_data.material_amount or MATCAP_MODE_MATCAP, color_b_data and color_b_data.material_amount or MATCAP_MODE_MATCAP, color_c_data and color_c_data.material_amount or MATCAP_MODE_MATCAP)

	if (not blueprint.color_a or blueprint.color_a.id ~= "nothing") and self._mat_tintables_a and not color_a_data.does_not_apply_color then
		for mat_name, value_id in pairs(self._mat_tintables_a) do
			local material = self._unit:material(Idstring(mat_name))

			material:set_variable(Idstring(value_id), self._tint_color_a)
		end
	elseif self._mat_tintables_a_default then
		for mat_name, original_value in pairs(self._mat_tintables_a_default) do
			local material = self._unit:material(Idstring(mat_name))
			local variable_name = self._mat_tintables_a[mat_name]

			material:set_variable(Idstring(variable_name), original_value)
		end
	end

	if (not blueprint.color_b or blueprint.color_b.id ~= "nothing") and self._mat_tintables_b and not color_b_data.does_not_apply_color then
		for mat_name, value_id in pairs(self._mat_tintables_b) do
			local material = self._unit:material(Idstring(mat_name))

			material:set_variable(Idstring(value_id), self._tint_color_b)
		end
	elseif self._mat_tintables_b_default then
		for mat_name, original_value in pairs(self._mat_tintables_b_default) do
			local material = self._unit:material(Idstring(mat_name))
			local variable_name = self._mat_tintables_b[mat_name]

			material:set_variable(Idstring(variable_name), original_value)
		end
	end

	if not async_clbk then
		self:_apply_mask_variables()
	end

	self._requesting = async_clbk and true

	for tex_id, texture_data in pairs(self._textures) do
		if async_clbk then
			if not texture_data.ready or texture_data.ready <= 0 then
				TextureCache:request(texture_data.name, "normal", texture_load_result_clbk, 90)
			end
		else
			self:_apply_mask_textures(texture_data)
		end
	end

	self._requesting = nil

	if async_clbk then
		self:_chk_load_complete(async_clbk)
	end
end