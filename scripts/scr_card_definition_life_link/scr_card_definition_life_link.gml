function scr_card_definition_life_link(card) {
	card.name = "life_link";
	card.title = "life link";
	card.cost = 2;
	card.text = "For 3 turns, when your opponent draws a card, you draw a card.";
	card.effect = do_life_link_effect;
	card.rarity = 1;
	card.has_priority = check_priority_for_life_link;
}

function do_life_link_effect(target, source, card) {
	ds_list_add(source.active_effects, "life_link");
	
	scr_add_start_of_turn_effect(
		source,
		"life_link",
		remove_life_link_effect,
		3,
		true,
	);
}

function remove_life_link_effect(target, source, turnsLeft) {
	if (turnsLeft == 0) {
		scr_remove_item_from_list(source.active_effects, "life_link");
		scr_add_event_log("The life link dissipates.");
	}
}

function check_priority_for_life_link() {
	return true;
}