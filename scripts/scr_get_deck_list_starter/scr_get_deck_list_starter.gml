function scr_get_deck_list_starter() {
	var deck_map = ds_map_create();

	deck_map[? "attack"] = 0;
	deck_map[? "combust"] = 0;
	deck_map[? "shield"] = 10;
	deck_map[? "embed_spikes"] = 10;
	deck_map[? "rest"] = 0;

	return scr_create_deck_list_from_deck(deck_map);
}
