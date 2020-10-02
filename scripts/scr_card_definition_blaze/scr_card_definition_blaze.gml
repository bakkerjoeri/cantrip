function scr_card_definition_blaze(card) {
	card.name = "blaze";
	card.title = "searing flame";
	card.cost = 1;
	card.text = "A random card in your foe's hand starts \"burning\"";
	card.effect = do_blaze_effect;
	card.rarity = 3;
	card.condition = can_play_blaze;
}

function do_blaze_effect(target, source) {
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
	ds_list_destroy(possible_cards);
}

function can_play_blaze(target, source) {
	if (ds_list_size(target.hand) == 0) {
		return false;
	}
	
	return true;
}