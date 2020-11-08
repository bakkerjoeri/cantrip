function scr_get_enemy_blacksmith() {
	var boss = ds_map_create();

	boss[? "name"] = "Shieldbearer";
	boss[? "deck_list"] = scr_get_deck_list_blacksmith();
	boss[? "max_ability_points"] = 3;
	boss[? "max_hand_size"] = 8;
	boss[? "loot"] = "shield_bash";

	return boss;
}

function scr_get_deck_list_blacksmith() {
	var deck_map = ds_map_create();

	deck_map[? "attack"] = 2;
	deck_map[? "rest"] = 2;
	deck_map[? "shield"] = 2;
	deck_map[? "stamina_potion"] = 2;
	deck_map[? "shields_up"] = 1;
	deck_map[? "shield_bash"] = 1;
	deck_map[? "transmute"] = 1;

	return scr_create_deck_list_from_deck(deck_map);
}
