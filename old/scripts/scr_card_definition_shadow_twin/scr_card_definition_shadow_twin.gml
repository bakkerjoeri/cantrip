function scr_card_definition_shadow_twin(card) {
	card.name = "shadow_twin";
	card.title = "shadow twin";
	card.cost = 1;
	card.text = "The effect of the next card you play happens twice.";
	card.effect = do_shadow_twin_effect;
	card.rarity = 2;
	card.has_priority = check_priority_for_shadow_twin;
}

function do_shadow_twin_effect(target, source) {
	ds_list_add(source.active_effects, "shadow_twin");
}

function check_priority_for_shadow_twin(target, source) {
	return true;
}