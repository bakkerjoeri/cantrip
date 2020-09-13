function scr_card_definition_attack() {
	var definition = {
		name: "attack",
		title: "attack",
		cost: 1,
		text: "Do 1 damage.",
		effect: do_attack_effect,
	};
	
	return definition;
}

function do_attack_effect(target, source) {
	show_debug_message("Joehooooeee");
	scr_take_damage(target, 1, source);
}
