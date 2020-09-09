function scr_get_enemy_warlock() {
	var enemy = ds_map_create();

	enemy[? "name"] = "Warlock";
	enemy[? "deck_list"] = scr_get_deck_list_warlock();
	enemy[? "max_ability_points"] = 4;
	enemy[? "max_hand_size"] = 6;

	return enemy;


}
