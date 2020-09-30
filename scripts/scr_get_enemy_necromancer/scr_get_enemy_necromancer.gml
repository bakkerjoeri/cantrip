function scr_get_enemy_necromancer() {
	var boss = ds_map_create();

	boss[? "name"] = "Necromancer";
	boss[? "deck_list"] = scr_get_deck_list_necromancer();
	boss[? "max_ability_points"] = 3;
	boss[? "max_hand_size"] = 7;
	boss[? "loot"] = "seance";

	return boss;


}
