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
	var stolen_ap = min(target.ability_points, 2);

	scr_character_loses_ap(target, stolen_ap)
	scr_character_gains_ap(source, stolen_ap);
}

function can_play_siphon(target, source) {
	return target.ability_points > 0;
}