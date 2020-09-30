function scr_get_enemies_of_tier(tier, type) {
	var enemies = ds_list_create();
	var index = -1;

	if (tier == 0 && type == "enemy") {
		enemies[| index++] = scr_get_enemy_gerblin();
		enemies[| index++] = scr_get_enemy_kobold();
		enemies[| index++] = scr_get_enemy_cave_spider();
	}
	
	if (tier == 0 && type == "boss") {
		enemies[| index++] = scr_get_enemy_mind_flayer();
		enemies[| index++] = scr_get_enemy_hunter();
	}

	if (tier == 1 && type == "enemy") {
		enemies[| index++] = scr_get_enemy_rogue();
		enemies[| index++] = scr_get_enemy_warrior();
		enemies[| index++] = scr_get_enemy_necromancer();
	}
	
	if (tier == 1 && type == "boss") {
		enemies[| index++] = scr_get_enemy_warlock();
		enemies[| index++] = scr_get_enemy_blacksmith();
	}

	if (tier == 2 && type == "enemy") {
		enemies[| index++] = scr_get_enemy_adventurer();
		enemies[| index++] = scr_get_enemy_wyvern();
	}
	
	if (tier == 2 && type == "boss") {
		enemies[| index++] = scr_get_enemy_ancient_wizard();
		enemies[| index++] = scr_get_enemy_enigma();
	}

	return enemies;
}
