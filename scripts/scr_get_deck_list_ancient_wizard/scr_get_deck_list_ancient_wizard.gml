function scr_get_deck_list_ancient_wizard() {
	var deck_map = ds_map_create();

	deck_map[? "attack"] = 2;
	deck_map[? "rest"] = 2;
	deck_map[? "siphon"] = 2;
	deck_map[? "fireblast"] = 2;
	deck_map[? "mana_burst"] = 1;
	deck_map[? "meditate"] = 1;

	return scr_create_deck_list_from_deck(deck_map);


}
