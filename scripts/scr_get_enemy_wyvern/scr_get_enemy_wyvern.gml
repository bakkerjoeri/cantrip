function scr_get_enemy_wyvern() {
	var enemy = ds_map_create();

	enemy[? "name"] = "Wyvern";
	enemy[? "deck_list"] = scr_get_deck_list_wyvern();
	enemy[? "max_ability_points"] = 2;
	enemy[? "max_hand_size"] = 9;

	return enemy;


}
