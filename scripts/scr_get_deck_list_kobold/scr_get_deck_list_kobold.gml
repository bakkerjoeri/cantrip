function scr_get_deck_list_kobold() {
	var deck_map = ds_map_create();

	deck_map[? "attack"] = 3;
	deck_map[? "combust"] = 1;
	deck_map[? "leech"] = 1;
	deck_map[? "shield"] = 2;
	deck_map[? "rest"] = 2;

	return scr_create_deck_list_from_deck(deck_map);


}
