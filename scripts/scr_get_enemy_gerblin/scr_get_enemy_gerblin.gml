function scr_get_enemy_gerblin() {
	var enemy = ds_map_create();

	enemy[? "name"] = "Gerblin";
	enemy[? "deck_list"] = scr_get_deck_list_gerblin();
	enemy[? "max_hand_size"] = 4;
	enemy[? "max_ability_points"] = 3;
	enemy[? "loot"] = "rage";

	return enemy;
}

function scr_get_deck_list_gerblin() {
	var deck_map = ds_map_create();

	deck_map[? "attack"] = 3;
	deck_map[? "rage"] = 1;
	deck_map[? "shield"] = 1;
	deck_map[? "rest"] = 2;
	
	return scr_create_deck_list_from_deck(deck_map);
}
