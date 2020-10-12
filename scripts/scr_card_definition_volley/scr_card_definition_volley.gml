function scr_card_definition_volley(card) {
	card.name = "volley";
	card.title = "volley";
	card.cost = 1;
	card.text = "At the start of your next turn, do 2 damage."
	card.effect = do_volley_effect;
	card.rarity = 3;
	card.has_priority = check_priority_for_volley;
}

function do_volley_effect(target, source, card) {
	scr_add_start_of_turn_effect(source, "volley", resolve_volley, 1, false);
	
	scr_add_event_log(source.name + " fires two arrows high up in a large arc.");
}

function resolve_volley(target, source) {
	scr_take_damage(target, 2, source);
	
	scr_add_event_log("Something whistles through the air. The two arrows hit " + target.name + "!");
}

function check_priority_for_volley(target, source, playable_cards, unplayable_cards, card) {
	if (ds_list_size(target.hand) <= 2) {
		return true;
	}
	
	return false;
}