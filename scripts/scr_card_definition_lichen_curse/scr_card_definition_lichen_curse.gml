function scr_card_definition_lichen_curse(card) {
	card.name = "lichen_curse";
	card.title = "lichen curse";
	card.cost = 1;
	card.text = "Until the end of next turn, when you do damage, gain that much AP.";
	card.effect = do_lichen_curse_effect;
	card.rarity = 2;
	card.has_priority = check_priority_for_lichen_curse;
}

function do_lichen_curse_effect(target, source) {
	ds_list_add(target.active_effects, "lichen_curse");

	scr_add_end_of_turn_effect(
		target,
		"lichen_curse",
		do_lichen_curse_turn_effect,
		2,
		true,
	);
}

function do_lichen_curse_turn_effect(target, source, turnsLeft) {
	if (turnsLeft == 0) {
		scr_remove_item_from_list(source.active_effects, "lichen_curse");
		scr_add_event_log("The lichen curse has been lifted.", 2);
	}
}

function check_priority_for_lichen_curse(target, source) {
	if (scr_does_list_contain_item(source.active_effects, "lichen_curse")) {
		return false;
	}
	
	return true;
}