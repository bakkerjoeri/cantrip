function scr_battle_start() {
	if (state_new) {
		player.max_hand_size = obj_game_manager.player_max_hand_size;
		player.max_ability_points = obj_game_manager.player_max_ability_points;
		player.draw_pile = scr_init_cards_from_deck_list(obj_game_manager.player_deck_list, player);

		var enemy = obj_game_manager.current_room[? "enemy"];
		opponent.name = enemy[? "name"];
		opponent.max_hand_size = enemy[? "max_hand_size"];
		opponent.max_ability_points = enemy[? "max_ability_points"];
		opponent.draw_pile = scr_init_cards_from_deck_list(enemy[? "deck_list"], opponent);
		
		if (obj_game_manager.perks.clairvoyant) {
			player.base_is_hand_visible = true;
			player.is_hand_visible = true;
			player.base_is_draw_pile_visible = true;
			player.is_draw_pile_visible = true;
			opponent.base_is_hand_visible = true;
			opponent.is_hand_visible = true;
			opponent.base_is_draw_pile_visible = true;
			opponent.is_draw_pile_visible = true;
		}
	
		ds_list_shuffle(player.draw_pile);
		ds_list_shuffle(opponent.draw_pile);

		scr_draw_cards(player, player.max_hand_size);
		scr_draw_cards(opponent, opponent.max_hand_size);

		exit;
	}

	if (player.state_name == "waiting" && opponent.state_name == "waiting") {
		turn_of_character = player;
		state_switch("turnStart");
	}


}
