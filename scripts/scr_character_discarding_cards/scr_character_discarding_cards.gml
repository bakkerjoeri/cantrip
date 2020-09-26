function scr_character_discarding_cards() {
	if (state_new) {
		_card_discard_delay = 0;
	}

	if (_card_discard_delay <= 0 && ds_queue_empty(cards_to_discard)) {
		state_switch_previous();
		exit;
	}

	if (_card_discard_delay <= 0 && !ds_queue_empty(cards_to_discard)) {
		var card_to_discard = ds_queue_dequeue(cards_to_discard);
	
		scr_move_item_between_lists(card_to_discard, hand, graveyard);
		
		with (card_to_discard) {
			state_switch("beingDiscarded");
		}
	
		// If there's other cards left to be discarded, set a short timer
		if (!ds_queue_empty(cards_to_discard)) {
			_card_discard_delay = 0.1 * room_speed;
			exit;
		}
	
		// If that was the last card left to discard, set a longer timer
		_card_discard_delay = 0.5 * room_speed;
		exit;
	}

	_card_discard_delay -= 1;


}
