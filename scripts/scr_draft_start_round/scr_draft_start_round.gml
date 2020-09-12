function scr_draft_start_round() {
	if (state_new) {
		picked_card = noone;
		ds_list_clear(draft_list);

		var card_list_to_draft = current_round[? "cards"];
		var amount_of_cards_to_draft = ds_list_size(card_list_to_draft);

		for (var c = 0; c <= amount_of_cards_to_draft - 1; c += 1) {
			var card_name = ds_list_find_value(card_list_to_draft, c);
			var card = scr_create_card(card_name);
			card.x = (room_width / 2) - (((64 * amount_of_cards_to_draft) / 2) + (((amount_of_cards_to_draft - 1) * 6) / 2)) + (c * (64 + 6));
			card.y = -96;
		
			with (card) {
				animation_add_wait(c * 0.1 * room_speed);
				state_switch("draftReveal");
			}
	
			ds_list_add(draft_list, card);
		}
	
		_round_start_delay = 1.5 * room_speed;
	}

	if (_round_start_delay <= 0) {
		state_switch("awaitPick");
	}

	_round_start_delay -= 1;


}
