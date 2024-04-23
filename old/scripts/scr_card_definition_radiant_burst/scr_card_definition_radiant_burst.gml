function scr_card_definition_radiant_burst(card) {
	card.name = "radiant_burst";
	card.title = "radiant burst";
	card.cost = 2;
	card.text = "Do damage equal to the amount of 0 cost cards in your hand plus 1.";
	card.effect = do_radiant_burst_effect;
	card.condition = can_play_radiant_burst;
	card.rarity = 1;
	card.has_priority = check_priority_for_radiant_burst;
	card.highlight = radiant_burst_highlight;
}

function do_radiant_burst_effect(target, source) {
	var zero_cost_cards_in_hand = 0;

	for (var c = 0; c <= ds_list_size(source.hand) - 1; c += 1) {
		var card = ds_list_find_value(source.hand, c);
	
		if (variable_instance_exists(card, "cost") && card.cost == 0) {
			zero_cost_cards_in_hand += 1;
		}
	}
	
	var damage = zero_cost_cards_in_hand + 1;

	scr_take_damage(target, damage, source);
	
	if (damage <= 2) {
		scr_add_event_log(source.name + " shoots a burst of multi-colored light toward " + target.name + ".");
	} else if (damage <= 3) {
		scr_add_event_log("Blinding, multi-colored prisms of light soar and pierce through " + target.name + ".");
	} else {
		scr_add_event_log("In awe, " + target.name + " notices they are surrounded by rainbow glimmers. Then, in a flash, the light collapses in on them!");
	}
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

function radiant_burst_highlight(target, source) {
	var highlighted_cards = ds_list_create();
	
	for (var c = 0; c <= ds_list_size(source.hand) - 1; c += 1) {
		var card = ds_list_find_value(source.hand, c);
	
		if (variable_instance_exists(card, "cost") && card.cost == 0) {
			ds_list_add(highlighted_cards, card);
		}
	}
	
	return highlighted_cards;
}