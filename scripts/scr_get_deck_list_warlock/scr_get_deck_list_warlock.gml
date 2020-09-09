function scr_get_deck_list_warlock() {
	var deck_map = ds_map_create();

	deck_map[? "attack"] = 2;
	deck_map[? "siphon"] = 2;
	deck_map[? "combust"] = 1;
	deck_map[? "leech"] = 1;
	deck_map[? "fireblast"] = 1;
	deck_map[? "stamina_potion"] = 1;

	return scr_create_deck_list_from_deck(deck_map);


}
