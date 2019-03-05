if (state_new) {	
	ds_list_copy(player.draw_pile, player.deck);
	ds_list_shuffle(player.draw_pile);

	ds_list_copy(opponent.draw_pile, opponent.deck);
	ds_list_shuffle(opponent.draw_pile);

	repeat(3) {
		scr_character_draws_card(player);
		scr_character_draws_card(opponent);
	}

	turn_of_character = player;
}

state_switch("turnStart");