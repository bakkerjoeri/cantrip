function scr_get_enemy_adventurer() {
	var enemy = ds_map_create();

	enemy[? "name"] = "Adventurer";
	enemy[? "deck_list"] = scr_get_deck_list_adventurer();
	enemy[? "max_ability_points"] = 3;
	enemy[? "max_hand_size"] = 7;

	return enemy;
}

function scr_get_deck_list_adventurer() {
	var deck_map = ds_map_create();

	deck_map[? "attack"] = 4;
	deck_map[? "shield"] = 2;
	deck_map[? "rest"] = 2;
	deck_map[? "fireblast"] = 1;
	deck_map[? "healing_potion"] = 1;

	return scr_create_deck_list_from_deck(deck_map);
}
