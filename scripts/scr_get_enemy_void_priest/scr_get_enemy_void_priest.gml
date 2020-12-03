function scr_get_enemy_void_priest() {
	var boss = ds_map_create();

	boss[? "id"] = "void_priest";
	boss[? "name"] = "Void Priest";
	boss[? "deck_list"] = scr_get_deck_list_void_priest();
	boss[? "max_ability_points"] = 2;
	boss[? "max_hand_size"] = 7;
	boss[? "loot"] = "call_of_the_void";

	return boss;
}

function scr_get_deck_list_void_priest() {
	var deck_map = ds_map_create();

	deck_map[? "call_of_the_void"] = 1;
	deck_map[? "the_hunger"] = 1;
	deck_map[? "seance"] = 1;
	deck_map[? "shield"] = 4;
	deck_map[? "lunar_surge"] = 1;
	deck_map[? "necrotic_blast"] = 2;
	deck_map[? "meditate"] = 1;
	deck_map[? "attack"] = 2;

	return scr_create_deck_list_from_deck(deck_map);
}
