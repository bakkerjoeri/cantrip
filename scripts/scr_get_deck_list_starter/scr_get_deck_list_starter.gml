function scr_get_deck_list_starter() {
	var deck_map = ds_map_create();

	deck_map[? "attack"] = 4;
	deck_map[? "combust"] = 0;
	deck_map[? "shield"] = 0;
	deck_map[? "rest"] = 0;

	return scr_create_deck_list_from_deck(deck_map);


}
