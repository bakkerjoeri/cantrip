function scr_card_definition_shield_bash(card) {
		card.name = "shield_bash";
		card.title = "shield bash";
		card.cost = 2;
		card.text = "Do damage equal to the \"shield\" cards in your hand.";
		card.effect = do_shield_bash_effect;
		card.condition = can_play_shield_bash;
		card.rarity = 1;
		card.has_priority = check_priority_for_shield_bash;
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
	
	if (shield_cards_in_hand > 0) {
		scr_add_event_log(source.name + " rushes toward " + target.name + " with their shield held out.");
	}
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

function check_priority_for_shield_bash(target, source) {
	var amount_of_cards = 0;
	
	for (var c = 0; c <= ds_list_size(source.hand) - 1; c += 1) {
		var card_to_check = ds_list_find_value(source.hand, c);
	
		if (card_to_check.name == "attack") {
			amount_of_cards += 1;
		}
	}
	
	if (amount_of_cards >= 2) {
		return true;
	}

	return false;
}