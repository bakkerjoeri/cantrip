function scr_card_definition_attack() {
	var definition = {
		name: "attack",
		title: "attack",
		cost: 1,
		text: "Do 1 damage.",
		effect: attack_effect,
	};
	
	return definition;
}

function attack_effect(target, source) {
	scr_take_damage(target, 1, source);
}
