function HostStateInGame:on_peer_finished_loading(data, peer)
	self:_introduce_new_peer_to_old_peers(data, peer, false, peer:name(), peer:character(), "remove", peer:xuid(), peer:xnaddr())
	self:_introduce_old_peers_to_new_peer(data, peer)

	if data.game_started then
		peer:send("set_dropin")
	end

	if self._new_peers[peer:id()] then
		if peer:rank() > 25 then	
			managers.menu:post_event("player_join")
			managers.menu:post_event("goat")
		elseif peer:rank() >= 15 then
			managers.menu:post_event("player_join")
		elseif peer:rank() == 14 then
			managers.menu:post_event("infamous_ace_join_stinger")
		elseif peer:rank() > 10 then
			managers.menu:post_event("infamous_elite_join_stinger")
		elseif peer:rank() > 0 then
			managers.menu:post_event("infamous_player_join_stinger")
		else
			managers.menu:post_event("player_join")
		end

		managers.network:session():send_to_peers_except(peer:id(), "peer_joined_sound", peer:rank() > 0)
		managers.crime_spree:on_peer_finished_loading(peer)
	end
end