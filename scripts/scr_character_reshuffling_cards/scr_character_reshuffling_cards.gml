if (state_new) {
	_card_reshuffle_delay = 0;
}

if (_card_reshuffle_delay <= 0 && ds_list_empty(graveyard)) {
	ds_list_shuffle(draw_pile);
	state_switch_previous();
	exit;
}

if (_card_reshuffle_delay <= 0 && !ds_list_empty(graveyard)) {
	var card_to_reshuffle = ds_list_find_value(graveyard, 0);
	
	ds_list_delete(graveyard, 0);
	ds_list_add(draw_pile, card_to_reshuffle);
	
	with (card_to_reshuffle) {
		state_switch("beingReshuffled");
	}
	
	_card_reshuffle_delay = 0.1 * room_speed;
	exit;
}

_card_reshuffle_delay -= 1;