function scr_battle_start() {
	if (state_new) {
		player.max_hand_size = obj_game_manager.player_max_hand_size;
		player.max_ability_points = obj_game_manager.player_max_ability_points;
		player.draw_pile = scr_init_cards_from_deck_list(obj_game_manager.player_deck_list, player);
		ds_list_shuffle(player.draw_pile);

		var enemy = obj_game_manager.current_room[? "enemy"];
		opponent.name = enemy[? "name"];
		opponent.max_hand_size = enemy[? "max_hand_size"];
		opponent.max_ability_points = enemy[? "max_ability_points"];
		opponent.draw_pile = scr_init_cards_from_deck_list(enemy[? "deck_list"], opponent);
	
		ds_list_shuffle(opponent.draw_pile);
	
		with (player) {
			amount_of_cards_to_draw += max_hand_size;
			state_switch("drawingCards");
		}
	
		with (opponent) {
			amount_of_cards_to_draw += max_hand_size;
			state_switch("drawingCards");
		}
	
		exit;
	}

	if (player.state_name == "waiting" && opponent.state_name == "waiting") {
		turn_of_character = player;
		state_switch("turnStart");
	}


}
