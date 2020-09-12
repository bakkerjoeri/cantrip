function scr_card_definition_siphon() {
	var definition = {
		name: "siphon",
		title: "siphon",
		cost: 0,
		text: "Steal up to 2 AP from your opponent.",
		effect: do_siphon_effect,
		condition: can_play_siphon,
	}
	
	return definition;
}

function do_siphon_effect(target, source) {
	scr_take_damage(source, 1, source);
	scr_take_damage(target, 2, source);
}

function can_play_siphon(target, source) {
	return target.ability_points > 0;
}