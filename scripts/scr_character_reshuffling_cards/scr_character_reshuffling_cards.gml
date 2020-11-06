function scr_character_reshuffling_cards() {
	if (state_new) {
		_card_reshuffle_delay = 0;
		_shuffle_list = scr_clone_list(graveyard);
		scr_move_all_items_between_lists(graveyard, draw_pile);
		ds_list_shuffle(draw_pile);
	}

	if (_card_reshuffle_delay <= 0 && ds_list_empty(_shuffle_list)) {
		var are_all_cards_in_draw_pile = true;
		
		for (var c = 0; c <= ds_list_size(draw_pile) - 1; c += 1) {
			var card = ds_list_find_value(draw_pile, c);
		
			if (card.state_name != "inDrawPile") {
				are_all_cards_in_draw_pile = false;
				break;
			}
		}
		
		if (are_all_cards_in_draw_pile) {
			state_switch_previous();
			exit;
		}

		exit;
	}

	if (_card_reshuffle_delay <= 0 && !ds_list_empty(_shuffle_list)) {
		var card_to_reshuffle = ds_list_find_value(_shuffle_list, 0);
		scr_remove_item_from_list(_shuffle_list, card_to_reshuffle);

		with (card_to_reshuffle) {
			state_switch("beingReshuffled");
		}

		_card_reshuffle_delay = 0.1 * room_speed;
		
		exit;
	}

	_card_reshuffle_delay -= 1;
}
