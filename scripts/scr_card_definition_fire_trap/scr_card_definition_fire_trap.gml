function scr_card_definition_fire_trap(card) {
	card.name = "fire_trap";
	card.title = "fire trap";
	card.is_unplayable = true;
	card.text = "When hit, burn one of the cards in your foe's hand.";
	card.counter = do_fire_trap_counter;
	card.rarity = 3;
}

function do_fire_trap_counter(target, source, card) {
	if (ds_list_size(target.hand) == 0) {
		return;
	}
	
	var possible_cards = ds_list_create();

	for (var c = 0; c <= ds_list_size(target.hand) - 1; c += 1) {
		var card_to_check = ds_list_find_value(target.hand, c);
			
		if (!card_to_check.is_burning) {
			ds_list_add(possible_cards, card_to_check);
		}
	}
	
	if (ds_list_size(possible_cards) == 0) {
		ds_list_destroy(possible_cards);
		return;
	}
	
	var chosen_card = scr_choose_from_list(possible_cards);
	chosen_card.is_burning = true;
	
	if (chosen_card.is_face_up) {
		scr_add_event_log("Flames burst forth. " + chosen_card.owner.name + "'s " + chosen_card.title + " starts burning!");
	} else {
		scr_add_event_log("Flames burst forth. One of " + chosen_card.owner.name + "'s cards starts burning!");
	}
	
	ds_list_destroy(possible_cards);	
}