function scr_get_deck_list_rogue() {
	var deck_map = ds_map_create();

	deck_map[? "attack"] = 3;
	deck_map[? "leech"] = 3;
	deck_map[? "shield"] = 1;
	deck_map[? "siphon"] = 1;

	return scr_create_deck_list_from_deck(deck_map);


}
