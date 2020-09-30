function scr_get_enemy_rogue() {
	var enemy = ds_map_create();

	enemy[? "name"] = "Rogue";
	enemy[? "deck_list"] = get_deck_list_for_rogue();
	enemy[? "max_ability_points"] = 3;
	enemy[? "max_hand_size"] = 6;
	enemy[? "loot"] = "sneak_attack";

	return enemy;
}

function get_deck_list_for_rogue() {
	var deck_map = ds_map_create();

	deck_map[? "attack"] = 2;
	deck_map[? "sneak_attack"] = 1;
	deck_map[? "leech"] = 3;
	deck_map[? "riposte"] = 1;
	deck_map[? "siphon"] = 1;

	return scr_create_deck_list_from_deck(deck_map);
}
