function scr_get_enemy_cave_spider() {
	var enemy = ds_map_create();

	enemy[? "name"] = "Ravenous Spider";
	enemy[? "deck_list"] = get_deck_list_for_cave_spider();
	enemy[? "max_hand_size"] = 5;
	enemy[? "max_ability_points"] = 2;
	enemy[? "loot"] = "venomous_bite";

	return enemy;
}

function get_deck_list_for_cave_spider() {
	var deck_map = ds_map_create();

	deck_map[? "attack"] = 5;
	deck_map[? "siphon"] = 2;
	deck_map[? "venomous_bite"] = 1;

	return scr_create_deck_list_from_deck(deck_map);
}