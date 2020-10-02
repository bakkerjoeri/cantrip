function scr_card_definition_lightning_bolt(card) {
	card.name = "lightning_bolt";
	card.title = "lightning bolt";
	card.cost = 2;
	card.text = "Damage a random card and all cards with the same cost in your foe's hand.";
	card.effect = do_lightning_bolt_effect;
	card.rarity = 3;
	card.condition = can_play_lightning_bolt;
}

function do_lightning_bolt_effect(target, source, card) {
	var chosen_card = scr_choose_from_list(target.hand);
	var chosen_card_has_cost = variable_instance_exists(chosen_card, "cost");
	var damaged_cards = ds_list_create();
	
	for (var c = 0; c <= ds_list_size(target.hand) - 1; c += 1) {
		var current_card = ds_list_find_value(target.hand, c);
		
		if (
			(chosen_card_has_cost && variable_instance_exists(current_card, "cost") && current_card.cost == chosen_card.cost) ||
			(!chosen_card_has_cost && !variable_instance_exists(current_card, "cost"))
		) {
			ds_list_add(damaged_cards, current_card);
		}
	}
	
	scr_take_damage(target, ds_list_size(damaged_cards), source, {
		cards: scr_create_array_from_list(damaged_cards),
	});
	
	ds_list_destroy(damaged_cards);
}

function can_play_lightning_bolt(target, source) {
	return ds_list_size(target.hand) > 0;
}