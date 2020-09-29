function scr_card_definition_catalyst(card) {
	card.name = "catalyst";
	card.title = "catalyst";
	card.cost = 1;
	card.text = "This turn, when you play a card, draw a card.";
	card.effect = do_catalyst_effect;
	card.rarity = 2;
}

function do_catalyst_effect(target, source) {
	ds_list_add(source.active_effects, "catalyst");

	scr_add_end_of_turn_effect(
		source,
		"catalyst",
		remove_catalyst_effect,
		1,
		true,
	);
}

function remove_catalyst_effect(target, source) {
	scr_remove_item_from_list(source.active_effects, "catalyst");
}