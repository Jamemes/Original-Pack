function PlayerDamage:damage_bullet(attack_data)
	if not self:_chk_can_take_dmg() then
		return
	end

	local damage_info = {
		result = {
			variant = "bullet",
			type = "hurt"
		},
		attacker_unit = attack_data.attacker_unit
	}

	local pm = managers.player
	local dmg_mul = pm:damage_reduction_skill_multiplier("bullet")
	if CopDamage.is_gangster(attack_data.attacker_unit:base()._tweak_table) then
		dmg_mul = dmg_mul * managers.player:upgrade_value("player", "gangster_damage_dampener", 1)
	end
	attack_data.damage = attack_data.damage * dmg_mul
	attack_data.damage = managers.mutators:modify_value("PlayerDamage:TakeDamageBullet", attack_data.damage)
	attack_data.damage = managers.modifiers:modify_value("PlayerDamage:TakeDamageBullet", attack_data.damage)

	if _G.IS_VR then
		local distance = mvector3.distance(self._unit:position(), attack_data.attacker_unit:position())

		if tweak_data.vr.long_range_damage_reduction_distance[1] < distance then
			local step = math.clamp(distance / tweak_data.vr.long_range_damage_reduction_distance[2], 0, 1)
			local mul = 1 - math.step(tweak_data.vr.long_range_damage_reduction[1], tweak_data.vr.long_range_damage_reduction[2], step)
			attack_data.damage = attack_data.damage * mul
		end
	end

	local damage_absorption = pm:damage_absorption()

	if damage_absorption > 0 then
		attack_data.damage = math.max(0, attack_data.damage - damage_absorption)
	end
	local dodge_roll = math.random()
	local dodge_value = tweak_data.player.damage.DODGE_INIT or 0
	local armor_dodge_chance = pm:body_armor_value("dodge")
	local skill_dodge_chance = pm:skill_dodge_chance(self._unit:movement():running(), self._unit:movement():crouching(), self._unit:movement():zipline_unit())
	dodge_value = dodge_value + armor_dodge_chance + skill_dodge_chance

	if self._temporary_dodge_t and TimerManager:game():time() < self._temporary_dodge_t then
		dodge_value = dodge_value + self._temporary_dodge
	end

	local smoke_dodge = 0

	for _, smoke_screen in ipairs(managers.player._smoke_screen_effects or {}) do
		if smoke_screen:is_in_smoke(self._unit) then
			smoke_dodge = tweak_data.projectiles.smoke_screen_grenade.dodge_chance

			break
		end
	end

	dodge_value = 1 - (1 - dodge_value) * (1 - smoke_dodge)

	if dodge_roll < dodge_value then
		if attack_data.damage > 0 then
			self:_send_damage_drama(attack_data, 0)
		end

		self:_call_listeners(damage_info)
		self:play_whizby(attack_data.col_ray.position)
		self:_hit_direction(attack_data.attacker_unit:position())

		self._next_allowed_dmg_t = Application:digest_value(pm:player_timer():time() + self._dmg_interval, true)
		self._last_received_dmg = attack_data.damage

		managers.player:send_message(Message.OnPlayerDodge)

		return
	end

	if self._god_mode then
		if attack_data.damage > 0 then
			self:_send_damage_drama(attack_data, attack_data.damage)
		end

		self:_call_listeners(damage_info)

		return
	elseif self._invulnerable or self._mission_damage_blockers.invulnerable then
		self:_call_listeners(damage_info)

		return
	elseif self:incapacitated() then
		return
	elseif self:is_friendly_fire(attack_data.attacker_unit) then
		return
	elseif self:_chk_dmg_too_soon(attack_data.damage) then
		return
	elseif self._unit:movement():current_state().immortal then
		return
	elseif self._revive_miss and math.random() < self._revive_miss then
		self:play_whizby(attack_data.col_ray.position)

		return
	end
	
	if attack_data.attacker_unit:base()._tweak_table == "tank" then
		managers.achievment:set_script_data("dodge_this_fail", true)
	end

	if self:get_real_armor() > 0 then
		self._unit:sound():play("player_hit")
	else
		self._unit:sound():play("player_hit_permadamage")
	end

	local shake_armor_multiplier = pm:body_armor_value("damage_shake") * pm:upgrade_value("player", "damage_shake_multiplier", 1)
	local gui_shake_number = tweak_data.gui.armor_damage_shake_base / shake_armor_multiplier
	gui_shake_number = gui_shake_number + pm:upgrade_value("player", "damage_shake_addend", 0)
	shake_armor_multiplier = tweak_data.gui.armor_damage_shake_base / gui_shake_number
	local shake_multiplier = math.clamp(attack_data.damage, 0.2, 2) * shake_armor_multiplier

	self._unit:camera():play_shaker("player_bullet_damage", 1 * shake_multiplier)

	if not _G.IS_VR then
		managers.rumble:play("damage_bullet")
	end

	self:_hit_direction(attack_data.attacker_unit:position())
	pm:check_damage_carry(attack_data)

	attack_data.damage = managers.player:modify_value("damage_taken", attack_data.damage, attack_data)

	if self._bleed_out then
		self:_bleed_out_damage(attack_data)

		return
	end

	if not attack_data.ignore_suppression and not self:is_suppressed() then
		return
	end

	self:_check_chico_heal(attack_data)

	local armor_reduction_multiplier = 0

	if self:get_real_armor() <= 0 then
		armor_reduction_multiplier = 1
	end

	local health_subtracted = self:_calc_armor_damage(attack_data)

	if attack_data.armor_piercing then
		attack_data.damage = attack_data.damage - health_subtracted
	else
		attack_data.damage = attack_data.damage * armor_reduction_multiplier
	end

	health_subtracted = health_subtracted + self:_calc_health_damage(attack_data)
	self._next_allowed_dmg_t = Application:digest_value(managers.player:player_timer():time() + self._dmg_interval, true)
	self._last_received_dmg = health_subtracted
		
		if not self._bleed_out and health_subtracted > 0 then
			self:_send_damage_drama(attack_data, health_subtracted)
		elseif self._bleed_out and attack_data.attacker_unit and attack_data.attacker_unit:alive() and attack_data.attacker_unit:base()._tweak_table == "tank" then
			self._kill_taunt_clbk_id = "kill_taunt" .. tostring(self._unit:key())
			managers.enemy:add_delayed_clbk(self._kill_taunt_clbk_id, callback(self, self, "clbk_kill_taunt", attack_data), TimerManager:game():time() + 0.1 + 0.1 + 0.1)	
		elseif self._bleed_out and attack_data.attacker_unit and attack_data.attacker_unit:alive() and attack_data.attacker_unit:base()._tweak_table == "taser" then
			self._kill_taunt_clbk_id = "kill_taunt" .. tostring(self._unit:key())
			managers.enemy:add_delayed_clbk(self._kill_taunt_clbk_id, callback(self, self, "clbk_kill_taunt_tase", attack_data), TimerManager:game():time() + 0.1 + 0.1 + 0.1)	
		elseif self._bleed_out and attack_data.attacker_unit and attack_data.attacker_unit:alive() then
			self._kill_taunt_clbk_id = "kill_taunt" .. tostring(self._unit:key())
			managers.enemy:add_delayed_clbk(self._kill_taunt_clbk_id, callback(self, self, "clbk_kill_taunt_common", attack_data), TimerManager:game():time() + 0.1 + 0.1 + 0.1)			
		end

	pm:send_message(Message.OnPlayerDamage, nil, attack_data)
	self:_call_listeners(damage_info)
end

function PlayerDamage:_hit_direction(position_vector)
	if position_vector then
		local dir = (self._unit:camera():position() - position_vector):normalized()
		local infront = math.dot(self._unit:camera():forward(), dir)
		if infront < -0.9 then
			managers.environment_controller:hit_feedback_front()
		elseif infront > 0.9 then
			managers.environment_controller:hit_feedback_back()
		else
			local polar = self._unit:camera():forward():to_polar_with_reference(-dir, Vector3(0, 0, 1))
			local direction = Vector3(polar.spin, polar.pitch, 0):normalized()
			if math.abs(direction.x) > math.abs(direction.y) then
				if 0 > direction.x then
					managers.environment_controller:hit_feedback_left()
				else
					managers.environment_controller:hit_feedback_right()
				end
			elseif 0 > direction.y then
				managers.environment_controller:hit_feedback_up()
			else
				managers.environment_controller:hit_feedback_down()
			end
			if position_vector then
				managers.hud:on_hit_direction(position_vector, HUDHitDirection.DAMAGE_TYPES.HEALTH)
			end
		end
	else
	end
end
	
function PlayerDamage:damage_tase(attack_data)
	if self._god_mode then
		return
	end
	   
	local cur_state = self._unit:movement():current_state_name()
	   
	if cur_state ~= "tased" and cur_state ~= "fatal" then
		self:on_tased(false)
	   
		self._tase_data = attack_data
	   
		managers.player:set_player_state("tased")
	   
		local damage_info = {
			result = {
				variant = "tase",
				type = "hurt"
			}
		}
	   
		self:_call_listeners(damage_info)
	   
		if attack_data.attacker_unit and attack_data.attacker_unit:alive() and attack_data.attacker_unit:base()._tweak_table == "taser" then
			attack_data.attacker_unit:sound():say("post_tasing_taunt")
	
			if managers.blackmarket:equipped_mask().mask_id == tweak_data.achievement.its_alive_its_alive.mask then
				managers.achievment:award_progress(tweak_data.achievement.its_alive_its_alive.stat)
			end
		end
	end
	if cur_state == "tased" then
		if attack_data.attacker_unit:base()._tweak_table == "taser" or attack_data.attacker_unit:base()._tweak_table == "taser_titan" then
		   attack_data.attacker_unit:sound():say("post_tasing_taunt")
		end
	end	
end
	
function PlayerDamage:clbk_kill_taunt_tase(attack_data)
	if attack_data.attacker_unit and attack_data.attacker_unit:alive() then
		self._kill_taunt_clbk_id = nil

		attack_data.attacker_unit:sound():say("post_tasing_taunt")
	end
end		

function PlayerDamage:clbk_kill_taunt_common(attack_data)
	if attack_data.attacker_unit and attack_data.attacker_unit:alive() then
		if not attack_data.attacker_unit:base()._tweak_table then
			return
		end
		self._kill_taunt_clbk_id = nil

		attack_data.attacker_unit:sound():say("i03")
	end
end	

local data = PlayerDamage.revive
function PlayerDamage:revive(silent)
	data(self, silent)
	local arrested = self:arrested()
	if managers.player:has_category_upgrade("player", "revived_health_regain_solid_amount") then
		if not arrested then
			local amount = managers.player:has_category_upgrade("player", "melee_damage_health_ratio_multiplier") and managers.player:upgrade_value("player", "revived_health_regain_solid_wolverine") or managers.player:upgrade_value("player", "revived_health_regain_solid_amount")
			self:set_health(self:_max_health() * amount)
		end
	end
end

local data = PlayerDamage.on_downed
function PlayerDamage:on_downed()
	data(self)
	if PlayerManager.walking_bleedout > tweak_data.upgrades.walking_bleedout_time_to_fatal_state then
		managers.player:set_player_state("fatal")
	end
	if PlayerManager.walking_bleedout > 0 then
		PlayerManager.walking_bleedout = 0
	end
end

local data = PlayerDamage.update
function PlayerDamage:update(unit, t, dt)
	data(self, unit, t, dt)
	if PlayerManager.walking_bleedout > 0 then
		local ticks = managers.player:upgrade_value("player", "walking_bleedout_ticks_to_ressurection", 10^10) - (self:remaining_delayed_damage() * 2)
		PlayerManager.walking_bleedout = 1 + ticks
	end
	if self:dead() then
		PlayerManager.walking_bleedout = 0
	end
	if PlayerManager.walking_bleedout > managers.player:upgrade_value("player", "walking_bleedout_ticks_to_ressurection", 10^10) then
		PlayerManager.walking_bleedout = 0
	end
	local ticks_to_ressurection = managers.player:upgrade_value("player", "walking_bleedout_ticks_to_ressurection", 10^10)
	local bleeder = PlayerManager.walking_bleedout
	local time_to_bleed = managers.player:upgrade_value("player", "walking_bleedout_time_to_bleed", 0)
	local reability = ticks_to_ressurection - time_to_bleed
	local total_bleed_penalty = bleeder > reability and self:remaining_delayed_damage() * 2 or bleeder > time_to_bleed and time_to_bleed or bleeder
	self._down_time = tweak_data.player.damage.DOWNED_TIME - math.floor(total_bleed_penalty)

end
	
local data = PlayerDamage._chk_cheat_death
function PlayerDamage:_chk_cheat_death()
	data(self)
	if math.rand(1) < managers.player:upgrade_value("player", "walking_bleedout_chance", 0) then
		if PlayerManager.walking_bleedout == 0 then
			self:set_health(self:_max_health() * managers.player:upgrade_value("player", "walking_bleedout_temporary_health_mul", 0))
			self:delay_damage(managers.player:upgrade_value("player", "walking_bleedout_ticks_to_ressurection", 10^10) * 0.5, managers.player:upgrade_value("player", "walking_bleedout_ticks_to_ressurection", 10^10))
			PlayerManager.walking_bleedout = 1
		end
	end
end

local data = PlayerDamage.band_aid_health
function PlayerDamage:band_aid_health()
	data(self)
	if PlayerManager.walking_bleedout > 0 and math.rand(1) < managers.player:upgrade_value("player", "walking_bleedout_fak_self_revive", 0) + managers.player:upgrade_value("player", "walking_bleedout_fak_self_revive_additional", 0) then 
		self:clear_delayed_damage()
		PlayerManager.walking_bleedout = 0
	end
end

local data = PlayerDamage.recover_health
function PlayerDamage:recover_health()
	data(self)
	if PlayerManager.walking_bleedout > 0 and managers.player:has_category_upgrade("player", "walking_bleedout_doctor_bag_self_revive") then
		self:clear_delayed_damage()
		PlayerManager.walking_bleedout = 0
	end
end