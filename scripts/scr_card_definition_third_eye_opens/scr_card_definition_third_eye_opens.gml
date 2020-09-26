function scr_card_definition_third_eye_opens(card) {
	card.name = "third_eye_opens";
	card.title = "third eye opens";
	card.cost = 0;
	card.text = "For 3 turns, your opponent's hand is visible to you.";
	card.effect = do_third_eye_opens_effect;
	card.rarity = 0;
}

function do_third_eye_opens_effect(target, source) {
	target.is_hand_visible = true;
	
	var effect_exists = false;

	for (var e = 0; e <= ds_list_size(source.end_of_turn_effects) - 1; e += 1) {
		var end_of_turn_effect = ds_list_find_value(source.end_of_turn_effects, e);
		
		if (end_of_turn_effect[? "name"] == "third_eye_opens") {
			end_of_turn_effect[? "duration"] = 3;
			effect_exists = true;
		}
	}
	
	if (!effect_exists) {
		scr_add_end_of_turn_effect(
			source,
			"third_eye_opens",
			do_third_eye_opens_turn_effect,
			3,
		);
	}
}

function do_third_eye_opens_turn_effect(target, source, turnsLeft) {
	if (turnsLeft == 0) {
		target.is_hand_visible = false;
	}
}