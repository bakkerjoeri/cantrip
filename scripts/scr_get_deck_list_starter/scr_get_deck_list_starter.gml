function scr_get_deck_list_starter() {
	var deck_map = ds_map_create();

	deck_map[? "attack"] = 2;
	deck_map[? "shield"] = 2;
	deck_map[? "third_eye_opens"] = 2;

	if (obj_game_manager.perks.supermoon) {
		deck_map[? "attack"] += 1;
		deck_map[? "shield"] += 1;
	} else {
		deck_map[? "rest"] = 2;
	}

	return scr_create_deck_list_from_deck(deck_map);
}
