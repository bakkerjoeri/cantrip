function scr_character_drawing_cards() {
	if (state_new) {
		_card_draw_delay = 0;
	}

	if (_card_draw_delay <= 0 && amount_of_cards_to_draw == 0) {
		state_switch_previous();
		exit;
	}

	if (_card_draw_delay <= 0 && amount_of_cards_to_draw > 0) {
		// Stop drawing if it will exceed the max hand size.
		if (ds_list_size(hand) >= max_hand_size) {
			amount_of_cards_to_draw = 0;
			state_switch_previous();
			exit;
		}
	
		// Reshuffle cards if there aren't enough in the draw pile.
		if (ds_list_size(draw_pile) == 0 && ds_list_size(graveyard) > 0) {
			state_switch("reshufflingCards");
			exit;
		}
	
		// Stop trying to draw if there are none left.
		if (ds_list_size(draw_pile) == 0 && ds_list_size(graveyard) == 0) {
			amount_of_cards_to_draw = 0;
			state_switch_previous();
			exit;
		}
	
		var card_to_draw = ds_list_find_value(draw_pile, ds_list_size(draw_pile) - 1);
	
		ds_list_delete(draw_pile, ds_list_size(draw_pile) - 1);
		ds_list_add(hand, card_to_draw);
	
		with (card_to_draw) {
			state_switch("beingDrawn");
		}
	
		amount_of_cards_to_draw -= 1;
	
		// If there's other cards left to draw, set a short timer
		if (!amount_of_cards_to_draw == 0) {
			_card_draw_delay = 0.25 * room_speed;
			exit;
		}
	
		// If that was the last card left to draw, set a longer timer
		_card_draw_delay = 0.5 * room_speed;
		exit;
	}

	_card_draw_delay -= 1;


}
