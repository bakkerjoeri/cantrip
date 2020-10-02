function scr_get_enemies_of_tier(tier, type) {
	var enemies = ds_list_create();

	if (tier == 0 && type == "enemy") {
		ds_list_add(enemies, scr_get_enemy_gerblin());
		ds_list_add(enemies, scr_get_enemy_kobold());
		ds_list_add(enemies, scr_get_enemy_cave_spider());
	}
	
	if (tier == 0 && type == "boss") {
		ds_list_add(enemies, scr_get_enemy_mind_flayer());
		ds_list_add(enemies, scr_get_enemy_hunter());
	}

	if (tier == 1 && type == "enemy") {
		ds_list_add(enemies, scr_get_enemy_mad_chemist());
		ds_list_add(enemies, scr_get_enemy_rogue());
		ds_list_add(enemies, scr_get_enemy_warrior());
		ds_list_add(enemies, scr_get_enemy_necromancer());
	}
	
	if (tier == 1 && type == "boss") {
		ds_list_add(enemies, scr_get_enemy_warlock());
		ds_list_add(enemies, scr_get_enemy_blacksmith());
	}

	if (tier == 2 && type == "enemy") {
		ds_list_add(enemies, scr_get_enemy_adventurer());
		ds_list_add(enemies, scr_get_enemy_wyvern());
		ds_list_add(enemies, scr_get_enemy_witch());
	}
	
	if (tier == 2 && type == "boss") {
		ds_list_add(enemies, scr_get_enemy_ancient_wizard());
		ds_list_add(enemies, scr_get_enemy_enigma());
	}

	return enemies;
}
