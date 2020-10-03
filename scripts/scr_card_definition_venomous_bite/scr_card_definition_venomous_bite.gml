function scr_card_definition_venomous_bite(card) {
	card.name = "venomous_bite";
	card.title = "venomous bite";
	card.cost = 1;
	card.text = "For 3 turns, your foe takes 1 damage at the start of their turn.";
	card.effect = do_venomous_bite_effect;
	card.rarity = 3;
	card.has_priority = check_priority_for_venomous_bite;
}

function do_venomous_bite_effect(target, source) {
	scr_add_start_of_turn_effect(
		target,
		"venomous_bite",
		venomous_bite_start_of_turn_effect,
		3,
		false,
	);
}

function venomous_bite_start_of_turn_effect(target, source) {
	scr_take_damage(source, 1, source);
}

function check_priority_for_venomous_bite() {
	return true;
}