function scr_card_definition_radiant_burst(card) {
		card.name = "radiant_burst";
		card.title = "radiant burst";
		card.cost = 2;
		card.text = "Do damage equal to the amount of 0 cost cards in your hand.";
		card.effect = do_radiant_burst_effect;
		card.condition = can_play_radiant_burst;
		card.rarity = 0;
		card.has_priority = check_priority_for_radiant_burst;
}

function do_radiant_burst_effect(target, source) {
	var zero_cost_cards_in_hand = 0;

	for (var c = 0; c <= ds_list_size(source.hand) - 1; c += 1) {
		var card = ds_list_find_value(source.hand, c);
	
		if (variable_instance_exists(card, "cost") && card.cost == 0) {
			zero_cost_cards_in_hand += 1;
		}
	}

	scr_take_damage(target, zero_cost_cards_in_hand, source);
}

function can_play_radiant_burst(target, source) {
	for (var c = 0; c <= ds_list_size(source.hand) - 1; c += 1) {
		var card = ds_list_find_value(source.hand, c);
	
		if (variable_instance_exists(card, "cost") && card.cost == 0) {
			return true;
		}
	}

	return false;
}

function check_priority_for_radiant_burst(target, source) {
	var zero_cost_cards_in_hand = 0;

	for (var c = 0; c <= ds_list_size(source.hand) - 1; c += 1) {
		var card_to_check = ds_list_find_value(source.hand, c);
	
		if (variable_instance_exists(card_to_check, "cost") && card_to_check.cost == 0) {
			zero_cost_cards_in_hand += 1;
		}
	}
	
	if (zero_cost_cards_in_hand >= 2) {
		return true;
	}
	
	return false;
}