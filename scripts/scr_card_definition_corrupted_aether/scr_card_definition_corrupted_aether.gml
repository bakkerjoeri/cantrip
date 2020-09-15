function scr_card_definition_corrupted_aether() {
	var definition = {
		name: "corrupted_aether",
		title: "corrupted aether",
		cost: 1,
		text: "Do damage equal to your opponent's AP.",
		effect: do_corrupted_aether_effect,
		condition: can_play_corrupted_aether,
	}
	
	return definition;
}

function do_corrupted_aether_effect(target, source) {
	scr_take_damage(target, target.ability_points, source);
}

function can_play_corrupted_aether(target, source) {
	return target.ability_points > 0;
}