function scr_get_enemy_lord_of_lightning() {
	var boss = ds_map_create();

	boss[? "id"] = "lord_of_lightning";
	boss[? "name"] = "Lord of Lightning";
	boss[? "deck_list"] = scr_get_deck_list_lord_of_lightning();
	boss[? "max_ability_points"] = 4;
	boss[? "max_hand_size"] = 7;
	boss[? "loot"] = "lightning_bolt";

	return boss;
}

function scr_get_deck_list_lord_of_lightning() {
	var deck_map = ds_map_create();

	deck_map[? "attack"] = 2;
	deck_map[? "lightning_bolt"] = 3;
	deck_map[? "corrupted_aether"] = 1;
	deck_map[? "rest"] = 1;
	deck_map[? "stamina_potion"] = 2;
	deck_map[? "meditate"] = 1;

	return scr_create_deck_list_from_deck(deck_map);
}
