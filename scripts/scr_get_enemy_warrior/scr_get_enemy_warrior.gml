function scr_get_enemy_warrior() {
	var enemy = ds_map_create();

	enemy[? "name"] = "Warrior";
	enemy[? "deck_list"] = scr_get_deck_list_warrior();
	enemy[? "max_ability_points"] = 2;
	enemy[? "max_hand_size"] = 6;

	return enemy;


}
