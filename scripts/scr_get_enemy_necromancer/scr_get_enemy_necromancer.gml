function scr_get_enemy_necromancer() {
	var boss = ds_map_create();

	boss[? "name"] = "Necromancer";
	boss[? "deck_list"] = scr_get_deck_list_necromancer();
	boss[? "max_ability_points"] = 3;
	boss[? "max_hand_size"] = 7;
	boss[? "loot"] = "seance";

	return boss;
}

function scr_get_deck_list_necromancer() {
	var deck_map = ds_map_create();

	deck_map[? "attack"] = 2;
	deck_map[? "leech"] = 2;
	deck_map[? "necrotic_blast"] = 2;
	deck_map[? "seance"] = 1;
	deck_map[? "desecrate"] = 1;
	deck_map[? "revenge_from_beyond"] = 1;
	deck_map[? "raise_the_dead"] = 1;

	return scr_create_deck_list_from_deck(deck_map);
}