function scr_get_deck_list_test_dark_pact() {
	var deck_map = ds_map_create();

	deck_map[? "attack"] = 2;
	deck_map[? "dark_pact"] = 1;
	deck_map[? "transmute"] = 2;
	deck_map[? "catalyst"] = 1;
	deck_map[? "full_moon"] = 1;
	deck_map[? "stamina_potion"] = 3;
	deck_map[? "barter_for_power"] = 2;

	return scr_create_deck_list_from_deck(deck_map);
}
