function scr_card_definition_volatile_mixture(card) {
	card.name = "volatile_mixture";
	card.title = "volatile mixture";
	card.cost = 1;
	card.text = "Do 2 damage. When hit, take 1 damage.";
	card.effect = do_volatile_mixture_effect;
	card.counter = do_volatile_mixture_counter;
}

function do_volatile_mixture_effect(target, source) {
	scr_take_damage(target, 2, source);
}

function do_volatile_mixture_counter(target, source) {
	scr_take_damage(source, 1, source);
}