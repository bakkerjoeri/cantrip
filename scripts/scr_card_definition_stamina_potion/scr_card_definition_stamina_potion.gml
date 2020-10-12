function scr_card_definition_stamina_potion(card) {
	card.name = "stamina_potion";
	card.title = "stamina potion";
	card.cost = 0;
	card.text = "Gain 1 AP.";
	card.effect = do_stamina_potion_effect;
	card.condition = can_play_stamina_potion;
	card.rarity = 0;
	card.has_priority = check_priority_for_stamina_potion;
}

function do_stamina_potion_effect(target, source) {
	scr_character_gains_ap(source, 1);
	
	scr_add_event_log(source.name + " takes a swig of a gold-coloured potion. They now have " + string(source.ability_points) + " AP.");
}

function can_play_stamina_potion(target, source) {
	return source.ability_points < source.max_ability_points;
}

function check_priority_for_stamina_potion(target, source, playable_cards, unplayable_cards) {
	var gained_ap = min(source.max_ability_points - source.ability_points, 1);
	var potential_ap = source.ability_points + gained_ap;
	
	for (var c = 0; c <= ds_list_size(unplayable_cards) - 1; c += 1) {
		var unplayable_card = ds_list_find_value(unplayable_cards, c);
		
		if (
			variable_instance_exists(unplayable_card, "cost")
			&& potential_ap >= unplayable_card.cost
		) {
			return true;
		}
	}
	
	return false;
}