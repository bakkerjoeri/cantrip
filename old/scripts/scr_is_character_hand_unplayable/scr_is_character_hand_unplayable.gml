function scr_is_character_hand_unplayable() {
	var hand_to_check = argument[0]
	var playable_cards = 0;

	for (var c = 0; c <= ds_list_size(hand_to_check) - 1; c += 1) {
		var card_to_check = ds_list_find_value(hand_to_check, c);
			
		if (!card_to_check.is_unplayable) {
			playable_cards += 1;
		}
	}

	return playable_cards == 0;


}
