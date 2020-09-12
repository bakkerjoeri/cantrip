function scr_card_definition_fireblast() {
	var definition = {
		name: "fireblast",
		title: "fireblast",
		cost: 2,
		text: "Do 3 damage.",
		effect: do_fireblast_effect,
	};
	
	return definition;
}

function do_fireblast_effect(target, source) {
	scr_take_damage(target, 3, source);
}
