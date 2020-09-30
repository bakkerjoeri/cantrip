function scr_card_definition_third_eye_opens(card) {
	card.name = "third_eye_opens";
	card.title = "third eye opens";
	card.cost = 0;
	card.text = "For 3 turns, your foe's hand is visible to you.";
	card.effect = do_third_eye_opens_effect;
	card.rarity = 0;
}

function do_third_eye_opens_effect(target, source) {
	target.is_hand_visible = true;

	scr_add_end_of_turn_effect(
		source,
		"third_eye_opens",
		do_third_eye_opens_turn_effect,
		3,
		true,
	);
}

function do_third_eye_opens_turn_effect(target, source, turnsLeft) {
	if (turnsLeft == 0) {
		target.is_hand_visible = false;
	}
}