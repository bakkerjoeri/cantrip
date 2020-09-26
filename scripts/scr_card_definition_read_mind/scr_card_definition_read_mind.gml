function scr_card_definition_read_mind(card) {
	card.name = "read_mind";
	card.title = "read mind";
	card.cost = 1;
	card.text = "Copy 2 random cards from your opponent's hand.";
	card.effect = do_read_mind_effect;
	card.condition = can_play_read_mind;
	card.rarity = 0;
}

function do_read_mind_effect(target, source) {
	repeat(min(2, ds_list_size(target.hand), source.max_hand_size - ds_list_size(source.hand))) {
		var card_to_copy = scr_choose_from_list(target.hand);

		if (card_to_copy) {
			var copied_card = scr_create_card(card_to_copy.name);
			ds_list_add(source.hand, copied_card);
	
			with (copied_card) {
				x = card_to_copy.x;
				y = card_to_copy.y;
				owner = source;
				state_switch("beingDrawn");
			}
		}
	}
}

function can_play_read_mind(target, source) {
	return ds_list_size(target.hand) > 0;
}