function scr_card_definition_volatile_mixture() {
	var definition = {
		name: "volatile_mixture",
		title: "volatile mixture",
		cost: 1,
		text: "Do 2 damage. When hit, take 1 damage.",
		effect: do_volatile_mixture_effect,
		counter: do_volatile_mixture_counter,
	};
	
	return definition;
}

function do_volatile_mixture_effect(target, source) {
	scr_take_damage(target, 2, source);
}

function do_volatile_mixture_counter(target, source) {
	scr_take_damage(source, 1, source);
}