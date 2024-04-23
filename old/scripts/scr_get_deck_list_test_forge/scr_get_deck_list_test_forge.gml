function scr_get_deck_list_test_forge() {
	var deck_map = ds_map_create();

	deck_map[? "attack"] = 5;
	deck_map[? "forge"] = 2;
	deck_map[? "transmute"] = 2;
	deck_map[? "catalyst"] = 1;
	deck_map[? "shield"] = 2;
	deck_map[? "lunar_surge"] = 1;

	return scr_create_deck_list_from_deck(deck_map);
}
