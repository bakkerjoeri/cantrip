/// scr_get_enemies_of_tier
var tier = argument[0];

var enemies = ds_list_create();
var index = -1;

if (tier == 0) {
	ds_list_add(enemies, scr_get_enemy_gerblin());
}

if (tier == 1) {
	ds_list_add(enemies, scr_get_enemy_rogue());
}

if (tier == 2) {
	ds_list_add(enemies, scr_get_enemy_adventurer());
}

return enemies;