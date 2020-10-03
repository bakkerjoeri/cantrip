function scr_card_definition_siphon(card) {
	card.name = "siphon";
	card.title = "siphon";
	card.cost = 0;
	card.text = "Steal up to 2 AP from your foe.";
	card.effect = do_siphon_effect;
	card.condition = can_play_siphon;
	card.rarity = 1;
	card.has_priority = check_priority_for_siphon;
}

function do_siphon_effect(target, source) {
	var stolen_ap = min(target.ability_points, 2);

	scr_character_loses_ap(target, stolen_ap)
	scr_character_gains_ap(source, stolen_ap);
}

function can_play_siphon(target, source) {
	return target.ability_points > 0;
}

function check_priority_for_siphon(target, source, playable_cards, unplayable_cards) {
	var stolen_ap = min(target.ability_points, 2);
	var gained_ap = min(source.max_ability_points - source.ability_points, stolen_ap);
	
	if (gained_ap == 2) {
		return true;
	}
	
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