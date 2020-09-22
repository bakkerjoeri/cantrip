function scr_card_definition_attack() {
	var definition = {
		name: "the_hunger",
		title: "the hunger",
		cost: 3,
		text: "Do 1 damage.\n\nAt the end of your turn, damage increases by 1.",
		effect: do_attack_effect,
	};
	
	return definition;
}

function do_attack_effect(target, source, card) {
	scr_take_damage(target, card.damage, source);
}
