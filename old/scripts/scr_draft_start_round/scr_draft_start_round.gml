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
		
		exit;
	}
	
	var all_cards_ready = true;
	
	for (var c = 0; c <= ds_list_size(draft_list) - 1; c += 1) {
		var card = ds_list_find_value(draft_list, c);
		
		if (!card.is_face_up) {
			all_cards_ready = false;
			break;
		}
	}
	
	if (all_cards_ready) {
		state_switch("awaitPick");
	}
}
