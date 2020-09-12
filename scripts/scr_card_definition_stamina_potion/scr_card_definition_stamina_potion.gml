function scr_card_definition_stamina_potion() {
	var definition = {
		name: "stamina_potion",
		title: "stamina potion",
		cost: 0,
		text: "Gain 1 AP.",
		effect: do_stamina_potion_effect,
		condition: can_play_stamina_potion,
	}
	
	return definition;
}

function do_stamina_potion_effect(target, source) {
	scr_character_gains_ap(source, 1);
}

function can_play_stamina_potion(target, source) {
	return source.ability_points < source.max_ability_points;
}