function scr_card_definition_transmute(card) {
	card.name = "transmute";
	card.title = "transmute";
	card.cost = 0;
	card.text = "Discard all your cards, draw that many cards.";
	card.effect = do_transmute_effect;
	card.condition = can_play_transmute;
	card.rarity = 0;
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