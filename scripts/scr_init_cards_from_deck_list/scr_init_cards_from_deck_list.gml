function scr_init_cards_from_deck_list(deck_list, owner) {
	var cards = ds_list_create();

	for (var c = 0; c <= ds_list_size(deck_list) - 1; c += 1) {
		var card_name = ds_list_find_value(deck_list, c);
		var card = scr_create_card(card_name);
		card.owner = owner;
		
		ds_list_add(cards, card);
	
		with (card) {
			state_switch("inDrawPile");
		}
	}

	return cards;
}
