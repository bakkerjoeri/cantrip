function scr_get_enemy_crimson_mage() {
	var boss = ds_map_create();

	boss[? "name"] = "Crimson Mage";
	boss[? "deck_list"] = scr_get_deck_list_crimson_mage();
	boss[? "max_ability_points"] = 3;
	boss[? "max_hand_size"] = 8;
	boss[? "loot"] = "life_link";

	return boss;
}

function scr_get_deck_list_crimson_mage() {
	var deck_map = ds_map_create();

	deck_map[? "dark_pact"] = 2;
	deck_map[? "life_link"] = 1;
	deck_map[? "rest"] = 1;
	deck_map[? "healing_potion"] = 1;
	deck_map[? "siphon"] = 2;
	deck_map[? "eldritch_blast"] = 2;
	deck_map[? "attack"] = 2;

	return scr_create_deck_list_from_deck(deck_map);
}
