function scr_get_deck_list_test_mana() {
	var deck_map = ds_map_create();

	deck_map[? "mana_burst"] = 3;
	deck_map[? "stamina_potion"] = 3;
	deck_map[? "radiant_burst"] = 1;
	deck_map[? "lunar_surge"] = 1;
	deck_map[? "full_moon"] = 1;
	deck_map[? "meditate"] = 1;
	deck_map[? "wellspring"] = 1;
	deck_map[? "transmute"] = 2;
	deck_map[? "lichen_curse"] = 1;

	return scr_create_deck_list_from_deck(deck_map);
}
