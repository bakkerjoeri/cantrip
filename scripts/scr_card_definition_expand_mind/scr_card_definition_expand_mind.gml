function scr_card_definition_expand_mind(card) {
	card.name = "expand_mind";
	card.title = "expand mind";
	card.cost = 1;
	card.text = "Increase your maximum AP by 1.";
	card.effect = do_expand_mind_effect;
	card.rarity = 2;
}

function do_expand_mind_effect(target, source, card) {
	source.max_ability_points += 1;
	scr_add_event_log(source.name + " senses an awakening. Their maximum AP is now " + string(source.max_ability_points) + ".");
}
