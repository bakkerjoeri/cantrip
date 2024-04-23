/// scr_find_cards_with_discard_priority(card_list, discard_priority)
function scr_find_cards_with_discard_priority() {
	var card_list = argument[0];
	var discard_priority = argument[1];

	var filtered_cards = ds_list_create();

	show_debug_message("Looking for cards with discard priority " + string(discard_priority));
	for (var c = 0; c <= ds_list_size(card_list) - 1; c += 1) {
		var card_to_check = ds_list_find_value(card_list, c);
	
		if (card_to_check.discard_priority == discard_priority) {
			show_debug_message("Found card " + card_to_check.title + " (" + string(card_to_check.discard_priority) + ") ");
			ds_list_add(filtered_cards, card_to_check);
		}
	}

	return filtered_cards;


}
