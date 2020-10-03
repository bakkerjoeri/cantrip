function scr_card_definition_transmute(card) {
	card.name = "transmute";
	card.title = "transmute";
	card.cost = 0;
	card.text = "Discard all your cards, draw that many cards plus 1.";
	card.effect = do_transmute_effect;
	card.rarity = 0;
	card.has_priority = check_priority_for_transmute;
}

function do_transmute_effect(target, source) {
	for (var c = 0; c <= ds_list_size(source.hand) - 1; c += 1) {
		var card = ds_list_find_value(source.hand, c);
		ds_queue_enqueue(source.cards_to_discard, card);	
		source.amount_of_cards_to_draw += 1;
	}
	
	source.amount_of_cards_to_draw += 1;
	
	with (source) {
		state_switch("discardingCards");
	}
}

function check_priority_for_transmute(target, source, playable_cards) {
	if (scr_does_list_contain_item(source.active_effects, "dark_pact")) {
		return true;
	}

	if (ds_list_size(playable_cards) <= 1) {
		return true;
	}
	
	return false;
}