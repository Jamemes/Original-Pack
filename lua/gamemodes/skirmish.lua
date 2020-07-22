if string.lower(RequiredScript) == "lib/tweak_data/crimespreetweakdata" then
	local data = SkirmishTweakData.init
	function SkirmishTweakData:init(tweak_data)
		data(self, tweak_data)
		self.ransom_amounts = {
			1000000,
			1400000,
			2500000,
			4000000,
			7000000,
			10000000,
			12000000,
			15000000,
			25000000
		}
		local health_damage_multipliers = {
			{
				damage = 1,
				health = 1
			},
			{
				damage = 1.1,
				health = 1.1
			},
			{
				damage = 1.2,
				health = 1.2
			},
			{
				damage = 1.3,
				health = 1.3
			},
			{
				damage = 1.4,
				health = 1.4
			},
			{
				damage = 1.5,
				health = 1.5
			},
			{
				damage = 1.6,
				health = 1.6
			},
			{
				damage = 1.7,
				health = 1.7
			},
			{
				damage = 1.8,
				health = 1.8
			},
			{
				damage = 1.9,
				health = 1.9
			},
			{
				damage = 2,
				health = 2
			},
			{
				damage = 2.1,
				health = 2.1
			},
			{
				damage = 2.2,
				health = 2.2
			},
			{
				damage = 2.3,
				health = 2.3
			},
			{
				damage = 2.4,
				health = 2.4
			},
			{
				damage = 2.5,
				health = 2.5
			},
			{
				damage = 2.6,
				health = 2.6
			},
			{
				damage = 2.7,
				health = 2.7
			},
			{
				damage = 2.8,
				health = 2.8
			},
			{
				damage = 2.9,
				health = 2.9
			},
			{
				damage = 3,
				health = 3
			}
		}
		self.wave_modifiers[1] = {
			{
				class = "ModifierEnemyHealthAndDamageByWave",
				data = {
					waves = health_damage_multipliers
				}
			},
			{
				class = "ModifierCloakerArrest"
			}
		}
	end

	function SkirmishTweakData:_init_spawn_group_weights(tweak_data)
		local nice_human_readable_table = {
			{
				18,
				18,
				18,
				18,
				3,
				4,
				3,
				5,
				5,
				3,
				5
			},
			{
				17.71,
				17.71,
				17.71,
				17.71,
				3.1,
				4.1,
				3.1,
				5.13,
				5.13,
				3.1,
				5.5
			},
			{
				17.43,
				17.43,
				17.43,
				17.43,
				3.2,
				4.2,
				3.2,
				5.25,
				5.25,
				3.2,
				6
			},
			{
				17.14,
				17.14,
				17.14,
				17.14,
				3.3,
				4.3,
				3.3,
				5.38,
				5.38,
				3.3,
				6.5
			},
			{
				16.85,
				16.85,
				16.85,
				16.85,
				3.4,
				4.4,
				3.4,
				5.5,
				5.5,
				3.4,
				7
			},
			{
				16.56,
				16.56,
				16.56,
				16.56,
				3.5,
				4.5,
				3.5,
				5.63,
				5.63,
				3.5,
				7.5
			},
			{
				16.28,
				16.28,
				16.28,
				16.28,
				3.6,
				4.6,
				3.6,
				5.75,
				5.75,
				3.6,
				8
			},
			{
				15.99,
				15.99,
				15.99,
				15.99,
				3.7,
				4.7,
				3.7,
				5.88,
				5.88,
				3.7,
				8.5
			},
			{
				15.7,
				15.7,
				15.7,
				15.7,
				3.8,
				4.8,
				3.8,
				6,
				6,
				3.8,
				9
			},
			{
				15.41,
				15.41,
				15.41,
				15.41,
				3.9,
				4.9,
				3.9,
				6.13,
				6.13,
				3.9,
				9.5
			},
			{
				15.13,
				15.13,
				15.13,
				15.13,
				4,
				5,
				4,
				6.25,
				6.25,
				4,
				10
			},
			{
				14.84,
				14.84,
				14.84,
				14.84,
				4.1,
				5.1,
				4.1,
				6.38,
				6.38,
				4.1,
				10.5
			},
			{
				14.55,
				14.55,
				14.55,
				14.55,
				4.2,
				5.2,
				4.2,
				6.5,
				6.5,
				4.2,
				11
			},
			{
				14.26,
				14.26,
				14.26,
				14.26,
				4.3,
				5.3,
				4.3,
				6.63,
				6.63,
				4.3,
				11.5
			},
			{
				13.98,
				13.98,
				13.98,
				13.98,
				4.4,
				5.4,
				4.4,
				6.75,
				6.75,
				4.4,
				12
			},
			{
				13.69,
				13.69,
				13.69,
				13.69,
				4.5,
				5.5,
				4.5,
				6.88,
				6.88,
				4.5,
				12.5
			},
			{
				13.4,
				13.4,
				13.4,
				13.4,
				4.6,
				5.6,
				4.6,
				7,
				7,
				4.6,
				13
			},
			{
				13.11,
				13.11,
				13.11,
				13.11,
				4.7,
				5.7,
				4.7,
				7.13,
				7.13,
				4.7,
				13.5
			},
			{
				12.83,
				12.83,
				12.83,
				12.83,
				4.8,
				5.8,
				4.8,
				7.25,
				7.25,
				4.8,
				14
			},
			{
				12.54,
				12.54,
				12.54,
				12.54,
				4.9,
				5.9,
				4.9,
				7.38,
				7.38,
				4.9,
				14.5
			},
			{
				12.25,
				12.25,
				12.25,
				12.25,
				5,
				6,
				5,
				7.5,
				7.5,
				5,
				15
			}
		}
		local ordered_spawn_group_names = {
			"FBI_swats",
			"FBI_heavys",
			"FBI_shields",
			"FBI_tanks",
			"CS_tazers",
			"FBI_spoocs",
			"CS_swats",
			"CS_heavys",
			"CS_shields",
			"CS_tanks",
			"single_spooc"
		}

		for _, wave in ipairs(nice_human_readable_table) do
			local total_weight = 0

			for _, weight in ipairs(wave) do
				total_weight = total_weight + weight
			end

			for i, weight in ipairs(wave) do
				wave[i] = weight / total_weight
			end
		end

		self.assault = {
			groups = {}
		}

		for i, src_weights in ipairs(nice_human_readable_table) do
			local dst_weights = {}

			for j, weight in ipairs(src_weights) do
				local group_name = ordered_spawn_group_names[j]
				dst_weights[group_name] = {
					weight,
					weight,
					weight
				}
			end

			self.assault.groups[i] = dst_weights
		end

		local skirmish_assault_meta = {
			__index = function (t, key)
				if key == "groups" then
					local current_wave = managers.skirmish:current_wave_number()
					local current_wave_index = math.clamp(current_wave, 1, #self.assault.groups)

					return self.assault.groups[current_wave_index]
				else
					return rawget(t, key)
				end
			end
		}

		setmetatable(tweak_data.group_ai.skirmish.assault, skirmish_assault_meta)
	end
elseif string.lower(RequiredScript) == "lib/managers/crimespreemanager" then
	function SkirmishManager:is_unlocked()
		return managers.experience:current_rank() >= tweak_data.unlock_skirmish
	end
end