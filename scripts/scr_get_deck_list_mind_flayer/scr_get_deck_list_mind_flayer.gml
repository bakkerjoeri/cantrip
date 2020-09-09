function scr_get_deck_list_mind_flayer() {
	var deck_map = ds_map_create();

	deck_map[? "leech"] = 2;
	deck_map[? "siphon"] = 2;
	deck_map[? "read_mind"] = 1;
	deck_map[? "stamina_potion"] = 1;
	deck_map[? "mana_burst"] = 2;
	deck_map[? "mindswap"] = 1;

	return scr_create_deck_list_from_deck(deck_map);


}
