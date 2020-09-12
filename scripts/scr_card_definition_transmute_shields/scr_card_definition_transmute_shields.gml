function scr_card_definition_transmute_shields() {
	var definition = {
		name: "transmute_shields",
		title: "transmute shields",
		cost: 0,
		text: "Discard all \"shield\" cards, draw that amount of cards.",
		effect: do_transmute_shields_effect,
		condition: can_play_transmute_shields,
	}
	
	return definition;
}

function do_transmute_shields_effect(target, source) {
	var shield_cards_in_hand = 0;

	for (var c = 0; c <= ds_list_size(source.hand) - 1; c += 1) {
		var card = ds_list_find_value(source.hand, c);
	
		if (card.name == "shield") {
			shield_cards_in_hand += 1;
			ds_queue_enqueue(source.cards_to_discard, card);
		
			with (source) {
				state_switch("discardingCards");
			}
		}
	}

	source.amount_of_cards_to_draw += shield_cards_in_hand;
}

function can_play_transmute_shields(target, source) {
	for (var c = 0; c <= ds_list_size(source.hand) - 1; c += 1) {
		var card = ds_list_find_value(source.hand, c);
	
		if (card.name == "shield") {
			return true;
		}
	}

	return false;
}