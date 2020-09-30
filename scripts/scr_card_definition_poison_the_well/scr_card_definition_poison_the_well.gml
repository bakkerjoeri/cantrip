function scr_card_definition_poison_the_well(card) {
	card.name = "poison_the_well";
	card.title = "poison the well";
	card.cost = 2;
	card.text = "For 3 turns, when your foe gains AP, do that much damage.";
	card.effect = do_poison_the_well_effect;
	card.rarity = 1;
}

function do_poison_the_well_effect(target, source) {
	ds_list_add(target.active_effects, "poison_the_well");

	scr_add_end_of_turn_effect(
		source,
		"poison_the_well",
		do_poison_the_well_turn_effect,
		3,
		true,
	);
}

function do_poison_the_well_turn_effect(target, source, turnsLeft) {
	if (turnsLeft == 0) {
		scr_remove_item_from_list(source.active_effects, "poison_the_well");
	}
}