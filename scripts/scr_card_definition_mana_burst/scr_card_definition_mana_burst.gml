function scr_card_definition_mana_burst() {
	var definition = {
		name: "mana_burst",
		title: "mana burst",
		cost: 0,
		text: "Do damage equal to your AP.",
		effect: do_mana_burst_effect,
		condition: can_play_mana_burst,
	}
	
	return definition;
}

function do_mana_burst_effect(target, source) {
	scr_take_damage(target, source.ability_points, source);
}

function can_play_mana_burst(target, source) {
	return source.ability_points > 0;
}