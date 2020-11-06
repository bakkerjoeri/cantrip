function scr_card_definition_waning(card) {
	card.name = "waning";
	card.title = "waning";
	card.cost = 1;
	card.text = "Until next turn, your foe's cards cost 1 more."
	card.effect = do_waning_effect;
	card.rarity = 1;
	card.has_priority = check_priority_for_waning;
}

function do_waning_effect(target, source, card) {
	var cards = scr_concat_lists(target.hand, target.graveyard, target.draw_pile);
	
	if (!variable_instance_exists(target, "waned_cards")) {
		target.waned_cards = ds_list_create();
	}
	
	for (var c = 0; c <= ds_list_size(cards) - 1; c += 1) {
		var affected_card = ds_list_find_value(cards, c);

		if (variable_instance_exists(affected_card, "cost")) {
			affected_card.cost += 1;
			ds_list_add(target.waned_cards, affected_card);
		}
	}
	
	scr_add_start_of_turn_effect(source, "waning", end_waning, 1, true);
	
	scr_add_event_log("The moon flickers crimson. " + target.name + "'s movements start to feel heavy and slow.");
}

function end_waning(target, source) {
	for (var c = 0; c <= ds_list_size(target.waned_cards) - 1; c += 1) {
		var card = ds_list_find_value(target.waned_cards, c);
		card.cost -= 1;
	}
	
	scr_make_list_empty(target.waned_cards);
	
	scr_add_event_log(source.name + " no longer feels sluggish. The waning fades.", 2);
}

function check_priority_for_waning() {
	return true;
}