function scr_get_enemy_warrior() {
	var enemy = ds_map_create();

	enemy[? "name"] = "Spear Knight";
	enemy[? "deck_list"] = scr_get_deck_list_warrior();
	enemy[? "max_ability_points"] = 3;
	enemy[? "max_hand_size"] = 7;
	enemy[? "loot"] = "piercing_strike";

	return enemy;


}
