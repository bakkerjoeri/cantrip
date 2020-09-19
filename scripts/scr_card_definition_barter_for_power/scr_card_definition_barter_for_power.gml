function scr_card_definition_barter_for_power() {
	var definition = {
		name: "barter_for_power",
		title: "barter for power",
		cost: 0,
		text: "Give away as much AP as possible. Draw as many cards plus 1.",
		effect: do_barter_for_power_effect,
		condition: can_play_barter_for_power,
	}
	
	return definition;
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