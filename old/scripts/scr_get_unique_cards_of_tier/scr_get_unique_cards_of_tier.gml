/// scr_get_unique_cards_of_tier(amount_of_cards, tier);
function scr_get_unique_cards_of_tier(amount_of_cards, tier) {
	var cards_of_tier = scr_get_cards_of_tier(tier);
	var cards_of_tier_left = ds_list_create();
	var selected_cards = ds_list_create();

	while (ds_list_size(selected_cards) < amount_of_cards) {
		if (ds_list_empty(cards_of_tier_left)) {
			ds_list_copy(cards_of_tier_left, cards_of_tier);
		}
	
		var chosen_card = scr_choose_from_list(cards_of_tier_left);
		scr_move_item_between_lists(chosen_card, cards_of_tier_left, selected_cards);
	}

	return selected_cards;


}
