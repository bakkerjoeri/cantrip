function scr_card_definition_shield_bash(card) {
		card.name = "shield_bash";
		card.title = "shield bash";
		card.cost = 2;
		card.text = "Do damage equal to the \"shield\" cards in your hand.";
		card.effect = do_shield_bash_effect;
		card.condition = can_play_shield_bash;
}

function do_shield_bash_effect(target, source) {
	var shield_cards_in_hand = 0;

	for (var c = 0; c <= ds_list_size(source.hand) - 1; c += 1) {
		var card = ds_list_find_value(source.hand, c);
	
		if (card.name == "shield") {
			shield_cards_in_hand += 1;
		}
	}

	scr_take_damage(target, shield_cards_in_hand, source);
}

function can_play_shield_bash(target, source) {
	for (var c = 0; c <= ds_list_size(source.hand) - 1; c += 1) {
		var card = ds_list_find_value(source.hand, c);
	
		if (card.name == "shield") {
			return true;
		}
	}

	return false;
}