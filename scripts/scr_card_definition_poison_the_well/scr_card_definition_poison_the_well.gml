function scr_card_definition_poison_the_well(card) {
	card.name = "poison_the_well";
	card.title = "poison the well";
	card.cost = 2;
	card.text = "For 3 turns, when your foe gains AP, do that much damage.";
	card.effect = do_poison_the_well_effect;
	card.rarity = 1;
	card.has_priority = check_priority_for_poison_the_well;
}

function do_poison_the_well_effect(target, source) {
	ds_list_add(target.active_effects, "poison_the_well");

	scr_add_end_of_turn_effect(
		target,
		"poison_the_well",
		do_poison_the_well_turn_effect,
		3,
		true,
	);
	
	scr_add_event_log("A putrid scent surrounds " + target.name + ".");
}

function do_poison_the_well_turn_effect(target, source, turnsLeft) {
	if (turnsLeft == 0) {
		scr_remove_item_from_list(source.active_effects, "poison_the_well");
	}
	
	if (turnsLeft == 0) {
		scr_add_event_log("The putrid scent surrounding " + target.name + " dissipates.");
	} else if (turnsLeft == 1) {
		scr_add_event_log("Poison the well has " + string(turnsLeft) + " turn left.");
	} else {
		scr_add_event_log("Poison the well has " + string(turnsLeft) + " turns left.");
	}
}

function check_priority_for_poison_the_well() {
	return true;
}