function scr_get_enemy_wyvern() {
	var enemy = ds_map_create();

	enemy[? "id"] = "wyvern";
	enemy[? "name"] = "Wyvern";
	enemy[? "deck_list"] = scr_get_deck_list_wyvern();
	enemy[? "max_ability_points"] = 2;
	enemy[? "max_hand_size"] = 9;
	enemy[? "loot"] = ["blaze", "fireblast"];

	return enemy;
}

function scr_get_deck_list_wyvern() {
	var deck_map = ds_map_create();

	deck_map[? "attack"] = 4;
	deck_map[? "rest"] = 4;
	deck_map[? "blaze"] = 2;
	deck_map[? "fireblast"] = 2;

	return scr_create_deck_list_from_deck(deck_map);
}
