function scr_get_deck_list_warrior() {
	var deck_map = ds_map_create();

	deck_map[? "attack"] = 2;
	deck_map[? "piercing_strike"] = 3;
	deck_map[? "shield"] = 1;
	deck_map[? "stamina_potion"] = 1;
	deck_map[? "shields_up"] = 1;

	return scr_create_deck_list_from_deck(deck_map);
}
