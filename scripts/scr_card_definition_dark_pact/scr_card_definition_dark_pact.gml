function scr_card_definition_dark_pact(card) {
	card.name = "dark_pact";
	card.title = "dark pact";
	card.cost = 1;
	card.text = "Until the end of your next turn, when you draw a card, do 1 damage.";
	card.effect = do_dark_pact_effect;
	card.rarity = 2;
	card.has_priority = check_priority_for_dark_pact;
}

function do_dark_pact_effect(target, source, card) {
	ds_list_add(source.active_effects, "dark_pact");
	
	scr_add_end_of_turn_effect(
		source,
		"dark_pact",
		remove_dark_pact_effect,
		2,
		true,
	);
	
	var r = irandom(2);
	
	if (r == 0) {
		scr_add_event_log(source.name + " calls upon the darkness. Whispers echo from all sides...");
	} else if (r == 1) {
		scr_add_event_log(source.name + " mumbles a dark prayer. A red mist appears.");
	} else {
		scr_add_event_log(source.name + " makes an unspeakable deal. A feeling of dread fills the space.");
	}
	
}

function remove_dark_pact_effect(target, source, turnsLeft) {
	if (turnsLeft == 0) {
		scr_remove_item_from_list(source.active_effects, "dark_pact");
		
	}
	
	if (turnsLeft == 0) {
		scr_add_event_log(source.name + "'s dark pact dissipates.", 2);
	} else if (turnsLeft == 1) {
		scr_add_event_log(source.name + "'s dark pact has " + string(turnsLeft) + " turn left.", 2);
	} else {
		scr_add_event_log(source.name + "'s dark pact has " + string(turnsLeft) + " turns left.", 2);
	}
}

function check_priority_for_dark_pact() {
	return true;
}