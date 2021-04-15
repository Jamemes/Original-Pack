if string.lower(RequiredScript) == "lib/tweak_data/crimespreetweakdata" then
	local data = CrimeSpreeTweakData.init
	function CrimeSpreeTweakData:init(tweak_data)
		data(self, tweak_data)
		self.base_difficulty = "sm_wish"
		self.base_difficulty_index = 7
		self.initial_cost = 3
		self.continue_cost = {1, 0}
		self.catchup_bonus = 0
		self.winning_streak = 0
		self.randomization_cost = 1
		self.randomization_multiplier = 1
		self.starting_levels = {0}
		self.cost_per_level = 0
		self.crash_causes_loss = false
		
		self.repeating_modifiers.forced[1].data.health[1] = 5
		self.repeating_modifiers.forced[1].data.damage[1] = 1
		self.modifiers.forced[1].data.health[1] = 5
		self.modifiers.forced[1].data.damage[1] = 1

		table.remove(self.modifiers.loud, 24)
		table.remove(self.modifiers.loud, 22)
		table.remove(self.modifiers.loud, 21)
		table.remove(self.modifiers.loud, 20)
		table.remove(self.modifiers.loud, 19)
		table.remove(self.modifiers.loud, 18)
		table.remove(self.modifiers.loud, 15)
		table.remove(self.modifiers.loud, 14)
		table.remove(self.modifiers.loud, 13)
		table.remove(self.modifiers.loud, 8)
		table.remove(self.modifiers.loud, 7)
		table.remove(self.modifiers.loud, 6)
		table.remove(self.modifiers.loud, 4)
		
		for i = 1, 3 do
			for _, m in pairs(self.missions[i]) do
			
				if m.add >= 15 then
					m.add = 7
				elseif m.add >= 14 then
					m.add = 6
				elseif m.add >= 13 then
					m.add = 5
				elseif m.add >= 12 then
					m.add = 4
				elseif m.add >= 8 then
					m.add = 3
				elseif m.add >= 5 then
					m.add = 2
				elseif m.add >= 3 then
					m.add = 1
				end
				
				local function stage(id, value)
					if m.id == id then
						m.add = value
					end
				end
				
				stage("bb_cash", 1)
				stage("cage", 2)
				stage("kosugi", 3)
				stage("dark", 2)
				stage("fs_2", 1)
				stage("hox_3", 1)
				stage("fish", 2)
				stage("ed_2", 2)
				stage("crojob1", 3)
				stage("framing_frame_3", 3)
				stage("arm_for", 6)
				stage("friend", 3)
				stage("big", 5)
				stage("mus", 3)
				stage("roberts", 4)
				stage("red2", 3)
				stage("wwh", 4)
				stage("rvd1", 3)
				stage("rvd2", 5)
				stage("brb", 5)
				stage("arm_cro", 7)
				stage("arm_und", 4)
				stage("arm_hcm", 6)
				stage("arm_par", 4)
				stage("arm_fac", 5)
				stage("biker_2", 3)
				stage("fs_1", 3)
				stage("watchdogs_1_d", 5)
				stage("pines", 4)
				stage("moon", 3)
				stage("spa", 5)
				stage("cane", 3)
				stage("mia_2", 4)
				stage("pbr2", 6)
				stage("pal", 2)
				stage("flat", 3)
				stage("born", 5)
				stage("hoxton_2", 4)
				stage("hoxton_1", 6)
				stage("bo_2", 7)
				stage("mia_1", 3)
				stage("cook_off", 2)
				stage("pbr", 7)
				stage("glace", 7)
				stage("run", 6)
				stage("man", 4)
				stage("dinner", 5)
				stage("jolly", 4)
				stage("nail", 6)
				stage("bex", 3)
				stage("tag", 4)
				stage("arena", 3)
				stage("help", 4)
				stage("pex", 3)
				stage("sah", 3)
			end
		end

		self.rewards[1].amount = 200000
		self.rewards[2].amount = 3500000
		self.rewards[3].amount = 0.25
		self.rewards[4].amount = 0.5
		self.rewards[5].amount = 0.07
		
		local low = 1
		local medium = 2
		local high = 3
		local must_have = 5
		
		self.assets.explosion_immunity = nil
		self.assets.increased_absorption = nil
		self.assets.melee_invulnerability = nil
		self.assets.life_steal = nil

		self.assets.increased_throwables.cost = low
		self.assets.increased_deployables.cost = must_have
		self.assets.quick_reload.cost = low
		self.assets.quick_switch.cost = low
		self.assets.increased_lives.cost = high
		self.assets.increased_stamina.cost = low
		self.assets.increased_ammo.cost = low
		self.assets.increased_health.cost = medium
		self.assets.increased_armor.cost = medium
		self.assets.quick_pagers.cost = medium
		self.assets.increased_body_bags.cost = medium
		self.assets.quick_locks.cost = low
		
		self.assets.quick_locks.data.speed = 15
		self.assets.increased_body_bags.data.bags = 1
		self.assets.quick_pagers.data.speed = 15
		self.assets.increased_armor.data.armor = 20
		self.assets.increased_health.data.health = 25
		
	end
elseif string.lower(RequiredScript) == "lib/managers/crimespreemanager" then
	function CrimeSpreeManager:unlocked()
		return managers.experience:current_rank() >= tweak_data.unlock_crimespree
	end
end