function scr_get_deck_list_test_shields() {
	var deck_map = ds_map_create();

	deck_map[? "attack"] = 2;
	deck_map[? "shield"] = 4;
	deck_map[? "shields_up"] = 1;
	deck_map[? "shield_bash"] = 1;
	deck_map[? "embed_spikes"] = 2;
	deck_map[? "transmute"] = 2;

	return scr_create_deck_list_from_deck(deck_map);
}
