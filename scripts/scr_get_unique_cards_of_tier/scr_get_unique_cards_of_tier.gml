/// scr_get_unique_cards_of_tier(amount_of_cards, tier);
var amount_of_cards = argument[0];
var tier = argument[1];

var cards_of_tier = scr_get_cards_of_tier(tier);
var cards_of_tier_left = ds_list_create();
var selected_cards = ds_list_create();

while (ds_list_size(selected_cards) < amount_of_cards) {
	if (ds_list_empty(cards_of_tier_left)) {
		ds_list_copy(cards_of_tier_left, cards_of_tier);
	}
	
	var chosen_card = scr_choose_from_list(cards_of_tier_left);
	
	ds_list_add(selected_cards, chosen_card);
	ds_list_delete(cards_of_tier_left, ds_list_find_index(cards_of_tier_left, chosen_card));
}

return selected_cards;