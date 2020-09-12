function scr_card_definition_shield_bash() {
	var definition = {
		name: "shield_bash",
		title: "shield bash",
		cost: 2,
		text: "Do damage equal to the \"Shield\" cards in your hand.",
		effect: do_shield_bash_effect,
		condition: can_play_shield_bash,
	}
	
	return definition;
}

function do_shield_bash_effect(target, source) {
	var shield_cards_in_hand = 0;

	for (var c = 0; c <= ds_list_size(source.hand) - 1; c += 1) {
		var card = ds_list_find_value(source.hand, c);
	
		if (card.name == "shield") {
			shield_cards_in_hand += 1;
		}
	}

	scr_take_damage(target, shield_cards_in_hand, source);
}

function can_play_shield_bash(target, source) {
	for (var c = 0; c <= ds_list_size(source.hand) - 1; c += 1) {
		var card = ds_list_find_value(source.hand, c);
	
		if (card.name == "shield") {
			return true;
		}
	}

	return false;
}