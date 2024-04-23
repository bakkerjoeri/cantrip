function scr_get_enemy_witch() {
	var enemy = ds_map_create();

	enemy[? "id"] = "witch";
	enemy[? "name"] = "Yaga";
	enemy[? "deck_list"] = get_deck_list_for_witch();
	enemy[? "max_ability_points"] = 3;
	enemy[? "max_hand_size"] = 6;
	enemy[? "loot"] = "full_moon";

	return enemy;
}

function get_deck_list_for_witch() {
	var deck_map = ds_map_create();
	
	deck_map[? "attack"] = 3;
	deck_map[? "wellspring"] = 1;
	deck_map[? "corrupted_aether"] = 1;
	deck_map[? "full_moon"] = 1;
	deck_map[? "barter_for_power"] = 2;
	deck_map[? "poison_the_well"] = 1;
	deck_map[? "waning"] = 1;

	return scr_create_deck_list_from_deck(deck_map);
}