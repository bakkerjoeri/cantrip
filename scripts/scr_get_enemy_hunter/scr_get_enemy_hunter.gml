function scr_get_enemy_hunter() {
	var enemy = ds_map_create();

	enemy[? "name"] = "Hunter";
	enemy[? "deck_list"] = get_deck_list_for_hunter();
	enemy[? "max_ability_points"] = 3;
	enemy[? "max_hand_size"] = 7;
	enemy[? "loot"] = "volley";

	return enemy;
}

function get_deck_list_for_hunter() {
	var deck_map = ds_map_create();

	deck_map[? "attack"] = 2;
	deck_map[? "volley"] = 2;
	deck_map[? "quickshot"] = 3;
	deck_map[? "riposte"] = 1;
	deck_map[? "rest"] = 2;
	deck_map[? "stamina_potion"] = 1;

	return scr_create_deck_list_from_deck(deck_map);
}