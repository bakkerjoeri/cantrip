function scr_card_definition_full_moon(card) {
	card.name = "full_moon";
	card.title = "full moon";
	card.cost = 0;
	card.text = "Everyone regains all AP.";
	card.effect = do_full_moon_effect;
	card.condition = can_play_full_moon;
	card.rarity = 2;
	card.has_priority = check_priority_for_full_moon;
}

function do_full_moon_effect(target, source) {
	scr_character_gains_ap(source, source.max_ability_points - source.ability_points);
	scr_character_gains_ap(target, target.max_ability_points - target.ability_points);
}

function can_play_full_moon(target, source) {
	if (
		source.ability_points == source.max_ability_points &&
		target.ability_points == target.max_ability_points
	) {
		return false;
	}

	return true;
}

function check_priority_for_full_moon(target, source, playable_cards, unplayable_cards) {
	if (scr_does_list_contain_item(target.active_effects, "poison_the_well")) {
		return true;
	}
	
	var potential_ap = source.ability_points;

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