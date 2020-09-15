function scr_card_definition_transmute() {
	var definition = {
		name: "transmute",
		title: "transmute",
		cost: 0,
		text: "Discard all your cards, draw that many cards.",
		effect: do_transmute_effect,
		condition: can_play_transmute,
	}
	
	return definition;
}

function do_transmute_effect(target, source) {
	for (var c = 0; c <= ds_list_size(source.hand) - 1; c += 1) {
		ds_queue_enqueue(source.cards_to_discard, card);	
		source.amount_of_cards_to_draw += 1;
	}
	
	with (source) {
		state_switch("discardingCards");
	}
}

function can_play_transmute(target, source) {
	for (var c = 0; c <= ds_list_size(source.hand) - 1; c += 1) {
		var card = ds_list_find_value(source.hand, c);
	
		if (card.name == "shield") {
			return true;
		}
	}

	return false;
}