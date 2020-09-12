function scr_init_cards_from_deck_list(deck_list, owner) {
	var cards = ds_list_create();

	for (var c = 0; c <= ds_list_size(deck_list) - 1; c += 1) {
		var card_name = ds_list_find_value(deck_list, c);
		var card_definition_map = scr_get_card_definition_map();
		var card;
		
		if (ds_map_exists(card_definition_map, card_name)) {
			var card_definition = ds_map_find_value(card_definition_map, card_name);
			card = scr_create_card_from_definition(card_definition, owner);
		} else {
			card = instance_create_layer(0, 0, "Instances", asset_get_index("obj_card_" + card_name));
			card.owner = owner;
		}
		
		ds_list_add(cards, card);
	
		with (card) {
			state_switch("inDrawPile");
		}
	}

	return cards;
}
