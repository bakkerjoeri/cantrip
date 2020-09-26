function scr_card_definition_lunar_surge(card) {
	card.name = "lunar_surge";
	card.title = "lunar surge";
	card.cost = 1;
	card.text = "Until next turn, your cards cost 1 less."
	card.effect = do_lunar_surge_effect;
	card.rarity = 1;
}

function do_lunar_surge_effect(target, source, card) {
	var cards = scr_concat_lists(source.hand, source.graveyard, source.draw_pile);
	
	if (!variable_instance_exists(source, "lunar_surged_cards")) {
		source.lunar_surged_cards = ds_list_create();
	}
	
	for (var c = 0; c <= ds_list_size(cards) - 1; c += 1) {
		var affected_card = ds_list_find_value(cards, c);

		if (
			variable_instance_exists(affected_card, "cost")
			&& affected_card.cost >= 1
		) {
			affected_card.cost -= 1;
			ds_list_add(source.lunar_surged_cards, affected_card);
		}
	}
	
	scr_add_start_of_turn_effect(source, "lunar_surge", end_lunar_surge, 1);
}

function end_lunar_surge(target, source) {
	for (var c = 0; c <= ds_list_size(source.lunar_surged_cards) - 1; c += 1) {
		var card = ds_list_find_value(source.lunar_surged_cards, c);
		card.cost += 1;
	}
	
	scr_make_list_empty(source.lunar_surged_cards);
}