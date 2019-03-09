if (state_new) {
	ds_list_copy(player.draw_pile, player.deck);
	ds_list_shuffle(player.draw_pile);

	ds_list_copy(opponent.draw_pile, opponent.deck);
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