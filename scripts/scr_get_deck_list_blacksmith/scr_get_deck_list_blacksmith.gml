function scr_get_deck_list_blacksmith() {
	var deck_map = ds_map_create();

	deck_map[? "attack"] = 2;
	deck_map[? "rest"] = 3;
	deck_map[? "shield"] = 2;
	deck_map[? "stamina_potion"] = 1;
	deck_map[? "shields_up"] = 1;
	deck_map[? "shield_bash"] = 1;
	deck_map[? "forge"] = 1;

	return scr_create_deck_list_from_deck(deck_map);


}
