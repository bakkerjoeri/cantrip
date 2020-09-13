/// scr_get_enemies_of_tier
function scr_get_enemies_of_tier() {
	var tier = argument[0];

	var enemies = ds_list_create();

	if (tier == 0) {
		ds_list_add(enemies, scr_get_enemy_gerblin());
		ds_list_add(enemies, scr_get_enemy_kobold());
		ds_list_add(enemies, scr_get_enemy_warrior());
	}

	if (tier == 1) {
		ds_list_add(enemies, scr_get_enemy_rogue());
		ds_list_add(enemies, scr_get_enemy_warlock());
		ds_list_add(enemies, scr_get_boss_mind_flayer());
	}

	if (tier == 2) {
		ds_list_add(enemies, scr_get_enemy_adventurer());
		ds_list_add(enemies, scr_get_enemy_wyvern());
		ds_list_add(enemies, scr_get_boss_blacksmith());
	}

	return enemies;


}
