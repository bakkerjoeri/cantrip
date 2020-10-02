function scr_card_definition_dark_pact(card) {
	card.name = "dark_pact";
	card.title = "dark pact";
	card.cost = 1;
	card.text = "Until the end of your next turn, when you draw a card, do 1 damage.";
	card.effect = do_dark_pact_effect;
	card.rarity = 2;
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
}

function remove_dark_pact_effect(target, source, turnsLeft) {
	if (turnsLeft == 0) {
		scr_remove_item_from_list(source.active_effects, "dark_pact");
	}
}

