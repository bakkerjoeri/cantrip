function scr_get_enemy_mad_chemist() {
	var enemy = ds_map_create();

	enemy[? "name"] = "Mad Chemist";
	enemy[? "deck_list"] = get_deck_list_for_mad_chemist();
	enemy[? "max_hand_size"] = 8;
	enemy[? "max_ability_points"] = 3;
	enemy[? "loot"] = "plague_bomb";

	return enemy;
}

function get_deck_list_for_mad_chemist() {
	var deck_map = ds_map_create();

	deck_map[? "attack"] = 3;
	deck_map[? "corrupted_aether"] = 2;
	deck_map[? "volatile_mixture"] = 3;
	deck_map[? "plague_bomb"] = 1;
	deck_map[? "healing_potion"] = 1;
	deck_map[? "stamina_potion"] = 1;

	return scr_create_deck_list_from_deck(deck_map);
}