function scr_card_definition_call_of_the_void(card) {
	card.name = "call_of_the_void";
	card.title = "call of the void";
	card.cost = 5;
	card.text = "Destroy your foe's graveyard and draw pile. Each turn this costs 1 less.";
	card.effect = do_call_of_the_void_effect;
	card.on_turn_end = call_of_the_void_reduce;
	card.on_discard = call_of_the_void_on_discard;
	card.rarity = 2;
}

function do_call_of_the_void_effect(target, source, card) {
	do_damage_effect();

	with (obj_screen_manager) {
		shake = 16;
	}
	
	var cards_to_destroy = scr_concat_lists(target.draw_pile, target.graveyard);
	
	for (var c = 0; c <= ds_list_size(cards_to_destroy) - 1; c += 1) {
		var card_to_destroy = ds_list_find_value(cards_to_destroy, c);

		with (card_to_destroy) {
			state_switch("destroyed");
		}	
	}
	
	scr_make_list_empty(target.graveyard);
	scr_make_list_empty(target.draw_pile);
	
	scr_add_event_log("In a rush of static, infinite darkness unfolds. " + target.name + "'s graveyard and draw pile are swallowed into it.");
	
	ds_list_destroy(cards_to_destroy);
}

function call_of_the_void_reduce(target, source, card) {
	card.cost = max(0, card.cost - 1);
}

function call_of_the_void_on_discard(target, source, card) {
	card.cost = 5;
}