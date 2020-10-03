function scr_card_definition_barter_for_power(card) {
	card.name = "barter_for_power";
	card.title = "barter for power";
	card.cost = 0;
	card.text = "Give away as much AP as possible. Draw as many cards plus 1.";
	card.effect = do_barter_for_power_effect;
	card.condition = can_play_barter_for_power;
	card.rarity = 0;
	card.has_priority = check_priority_for_barter_for_power;
}

function do_barter_for_power_effect(target, source) {
	var lost_ap = min(target.max_ability_points - target.ability_points, source.ability_points);
	
	scr_character_loses_ap(source, lost_ap);
	scr_character_gains_ap(target, lost_ap);
	
	source.amount_of_cards_to_draw += lost_ap + 1;
}

function can_play_barter_for_power(target, source) {
	if (target.ability_points == target.max_ability_points) {
		return false;
	}
	
	if (source.ability_points = 0) {
		return false;
	}
	
	return true;
}

function check_priority_for_barter_for_power(target, source, playable_cards, unplayable_cards) {
	if (scr_does_list_contain_item(target.active_effects, "poison_the_well")) {
		return true;
	}
	
	var lost_ap = min(target.max_ability_points - target.ability_points, source.ability_points);
	var space_in_hand = source.max_hand_size - ds_list_size(source.hand);
	
	if (space_in_hand >= lost_ap) {
		return true;
	}
	
	return false;
}