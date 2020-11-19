function scr_card_definition_third_eye_opens(card) {
	card.name = "third_eye_opens";
	card.title = "third eye opens";
	card.cost = 0;
	card.text = "For 6 turns, all cards are visible to you.";
	card.effect = do_third_eye_opens_effect;
	card.rarity = 0;
}

function do_third_eye_opens_effect(target, source, card) {
	if (source.is_controlled_by_player) {
		target.is_draw_pile_visible = true;
		target.is_hand_visible = true;
		source.is_draw_pile_visible = true;
		source.is_hand_visible = true;
	}
	
	scr_add_start_of_turn_effect(
		source,
		"third_eye_opens",
		do_third_eye_opens_turn_effect,
		6,
		true,
	);
	
	scr_add_event_log(source.name + " opens their third eye, revealing what was once hidden.");
}

function do_third_eye_opens_turn_effect(target, source, turnsLeft) {
	if (turnsLeft == 0) {
		source.is_draw_pile_visible = source.base_is_draw_pile_visible;
		source.is_hand_visible = source.base_is_hand_visible;
		target.is_draw_pile_visible = target.base_is_draw_pile_visible;
		target.is_hand_visible = target.base_is_hand_visible;
	}
	
	if (turnsLeft == 0) {
		scr_add_event_log(source.name + "'s third eye shuts once more.", 2);
	} else if (turnsLeft == 1) {
		scr_add_event_log(source.name + "'s third eye will stay open for " + string(turnsLeft) + " more turn.", 2);
	} else {
		scr_add_event_log(source.name + "'s third eye will stay open for " + string(turnsLeft) + " more turns.", 2);
	}
}