function scr_get_enemy_warlock() {
	var enemy = ds_map_create();

	enemy[? "name"] = "Warlock";
	enemy[? "deck_list"] = scr_get_deck_list_warlock();
	enemy[? "max_ability_points"] = 4;
	enemy[? "max_hand_size"] = 6;
	enemy[? "loot"] = "eldritch_blast";

	return enemy;
}

function scr_get_deck_list_warlock() {
	var deck_map = ds_map_create();

	deck_map[? "attack"] = 3;
	deck_map[? "eldritch_blast"] = 3;
	deck_map[? "lichen_curse"] = 1;
	deck_map[? "siphon"] = 2;
	deck_map[? "leech"] = 1;

	return scr_create_deck_list_from_deck(deck_map);
}
