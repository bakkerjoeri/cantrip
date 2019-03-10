if (state_new) {
	player.draw_pile = scr_init_cards_from_deck_list(obj_game_manager.player_deck_list, player);
	ds_list_shuffle(player.draw_pile);
	
	opponent.draw_pile = scr_init_cards_from_deck_list(scr_get_deck_list_flexible(), opponent);
	ds_list_shuffle(opponent.draw_pile);
	
	with (player) {
		amount_of_cards_to_draw += 3;
		state_switch("drawingCards");
	}
	
	with (opponent) {
		amount_of_cards_to_draw += 3;
		state_switch("drawingCards");
	}
	
	exit;
}

if (player.state_name == "waiting" && opponent.state_name == "waiting") {
	turn_of_character = player;
	state_switch("turnStart");
}