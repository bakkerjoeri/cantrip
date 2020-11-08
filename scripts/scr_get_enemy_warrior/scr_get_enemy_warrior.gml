function scr_get_enemy_warrior() {
	var enemy = ds_map_create();

	enemy[? "name"] = "Spear Knight";
	enemy[? "deck_list"] = scr_get_deck_list_warrior();
	enemy[? "max_ability_points"] = 3;
	enemy[? "max_hand_size"] = 7;
	enemy[? "loot"] = "piercing_strike";

	return enemy;
}

function scr_get_deck_list_warrior() {
	var deck_map = ds_map_create();

	deck_map[? "attack"] = 3;
	deck_map[? "piercing_strike"] = 3;
	deck_map[? "shield"] = 2;
	deck_map[? "riposte"] = 1;
	deck_map[? "stamina_potion"] = 1;


	return scr_create_deck_list_from_deck(deck_map);
}
