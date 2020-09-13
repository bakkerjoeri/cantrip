function scr_get_deck_list_necromancer() {
	var deck_map = ds_map_create();

	deck_map[? "attack"] = 2;
	deck_map[? "siphon"] = 2;
	deck_map[? "seance"] = 1;
	deck_map[? "desecrate"] = 1;
	deck_map[? "revenge_from_beyond"] = 1;
	deck_map[? "raise_the_dead"] = 1;
	deck_map[? "necrotic_blast"] = 2;

	return scr_create_deck_list_from_deck(deck_map);


}
