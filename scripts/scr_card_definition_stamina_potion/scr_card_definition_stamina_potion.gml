function scr_card_definition_stamina_potion(card) {
	card.name = "stamina_potion";
	card.title = "stamina potion";
	card.cost = 0;
	card.text = "Gain 1 AP.";
	card.effect = do_stamina_potion_effect;
	card.condition = can_play_stamina_potion;
	card.rarity = 0;
}

function do_stamina_potion_effect(target, source) {
	scr_character_gains_ap(source, 1);
}

function can_play_stamina_potion(target, source) {
	return source.ability_points < source.max_ability_points;
}