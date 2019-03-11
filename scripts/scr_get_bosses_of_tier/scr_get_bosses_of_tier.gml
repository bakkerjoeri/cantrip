/// scr_get_enemies_of_tier
var tier = argument[0];

var enemies = ds_list_create();
var index = -1;

if (tier == 0) {
	enemies[| index++] = scr_get_boss_mind_flayer();
	enemies[| index++] = scr_get_boss_necromancer();
}

if (tier == 1) {
	enemies[| index++] = scr_get_boss_mind_flayer();
	enemies[| index++] = scr_get_boss_the_blacksmith();
}

if (tier == 2) {
	enemies[| index++] = scr_get_boss_wyvern();
	enemies[| index++] = scr_get_boss_ancient_wizard();
	enemies[| index++] = scr_get_boss_enigma();
}

return enemies;