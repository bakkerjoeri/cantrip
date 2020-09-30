function scr_get_enemy_blacksmith() {
	var boss = ds_map_create();

	boss[? "name"] = "Blacksmith";
	boss[? "deck_list"] = scr_get_deck_list_blacksmith();
	boss[? "max_ability_points"] = 3;
	boss[? "max_hand_size"] = 8;

	return boss;


}
