var deck_list = ds_list_create();

repeat (6) {
	ds_list_add(deck_list, scr_choose_from_list(scr_get_cards_of_tier(0)));
}

repeat (4) {
	ds_list_add(deck_list, scr_choose_from_list(scr_get_cards_of_tier(1)));
}

repeat (4) {
	ds_list_add(deck_list, scr_choose_from_list(scr_get_cards_of_tier(2)));
}

return deck_list;