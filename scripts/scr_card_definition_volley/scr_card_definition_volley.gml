function scr_card_definition_volley(card) {
	card.name = "volley";
	card.title = "volley";
	card.cost = 1;
	card.text = "At the start of your next turn, do 2 damage."
	card.effect = do_volley_effect;
	card.rarity = 3;
}

function do_volley_effect(target, source, card) {
	scr_add_start_of_turn_effect(source, "volley", resolve_volley, 1, false);
}

function resolve_volley(target, source) {
	scr_take_damage(target, 2, source);
}