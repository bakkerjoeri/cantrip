function scr_get_enemy_kobold() {
	var enemy = ds_map_create();

	enemy[? "id"] = "kobold";
	enemy[? "name"] = "Kobold";
	enemy[? "deck_list"] = scr_get_deck_list_kobold();
	enemy[? "max_hand_size"] = 5;
	enemy[? "max_ability_points"] = 3;
	enemy[? "loot"] = "fire trap";

	return enemy;
}

function scr_get_deck_list_kobold() {
	var deck_map = ds_map_create();

	deck_map[? "attack"] = 3;
	deck_map[? "pickpocket"] = 1;
	deck_map[? "volatile_mixture"] = 1;
	deck_map[? "fishy_chest"] = 1;
	deck_map[? "shield"] = 2;
	deck_map[? "rest"] = 2;

	return scr_create_deck_list_from_deck(deck_map);
}
