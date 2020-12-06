function scr_card_definition_wellspring(card) {
	card.name = "wellspring";
	card.title = "wellspring";
	card.cost = 1;
	card.text = "For 3 turns, when you draw a card, gain 1 AP. Draw a card.";
	card.effect = do_wellspring_effect;
	card.rarity = 2;
	card.has_priority = check_priority_for_wellspring;
}

function do_wellspring_effect(target, source, card) {
	ds_list_add(source.active_effects, "wellspring");
	
	scr_add_end_of_turn_effect(
		source,
		"wellspring",
		remove_wellspring_effect,
		3,
		true,
	);
	
	scr_draw_cards(source, 1);

	scr_add_event_log(source.name + " drinks the fresh water. They are filled with a vibrant energy.");
}

function remove_wellspring_effect(target, source, turnsLeft) {
	if (turnsLeft == 0) {
		scr_remove_item_from_list(source.active_effects, "wellspring");
	}
	
	if (turnsLeft == 0) {
		scr_add_event_log(source.name + " feels the effects of the wellspring dissipate.", 2);
	} else if (turnsLeft == 1) {
		scr_add_event_log(source.name + "'s wellspring has " + string(turnsLeft) + " turn left.", 2);
	} else {
		scr_add_event_log(source.name + "'s wellspring has " + string(turnsLeft) + " turns left.", 2);
	}
}

function check_priority_for_wellspring(target, source) {
	if (scr_does_list_contain_item(source.active_effects, "wellspring")) {
		return false;
	}
	
	return true;
}