function scr_card_definition_third_eye_opens(card) {
	card.name = "third_eye_opens";
	card.title = "third eye opens";
	card.cost = 0;
	card.text = "For 3 turns, your foe's hand is visible to you.";
	card.effect = do_third_eye_opens_effect;
	card.rarity = 0;
}

function do_third_eye_opens_effect(target, source, card) {
	target.is_hand_visible = true;

	scr_add_start_of_turn_effect(
		source,
		"third_eye_opens",
		do_third_eye_opens_turn_effect,
		3,
		true,
	);
	
	scr_add_event_log(source.name + " opens their third eye, revealing what was once hidden.");
}

function do_third_eye_opens_turn_effect(target, source, turnsLeft) {
	if (turnsLeft == 0) {
		target.is_hand_visible = target.base_is_hand_visible;
	}
	
	if (turnsLeft == 0) {
		scr_add_event_log(source.name + "'s third eye shuts once more.", 2);
	} else if (turnsLeft == 1) {
		scr_add_event_log(source.name + "'s third eye opens has " + string(turnsLeft) + " turn left.", 2);
	} else {
		scr_add_event_log(source.name + "'s third eye opens has " + string(turnsLeft) + " turns left.", 2);
	}
}