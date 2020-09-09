/// scr_card_effect_shield_bash(target, source);
function scr_card_effect_shield_bash() {
	var target = argument[0];
	var source = argument[1];

	var shield_cards_in_hand = 0;

	for (var c = 0; c <= ds_list_size(source.hand) - 1; c += 1) {
		var card = ds_list_find_value(source.hand, c);
	
		if (card.name == "shield") {
			shield_cards_in_hand += 1;
		}
	}

	scr_take_damage(target, shield_cards_in_hand, source);


}
