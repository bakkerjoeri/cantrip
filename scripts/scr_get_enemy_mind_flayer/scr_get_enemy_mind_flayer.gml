function scr_get_enemy_mind_flayer() {
	var boss = ds_map_create();

	boss[? "name"] = "Mind Flayer";
	boss[? "deck_list"] = scr_get_deck_list_mind_flayer();
	boss[? "max_ability_points"] = 3;
	boss[? "max_hand_size"] = 6;
	boss[? "loot"] = "possess";

	return boss;
}

function scr_get_deck_list_mind_flayer() {
	var deck_map = ds_map_create();

	deck_map[? "possess"] = 3;
	deck_map[? "mindswap"] = 1;
	deck_map[? "read_mind"] = 1;
	deck_map[? "siphon"] = 2;
	deck_map[? "eldritch_blast"] = 2;
	deck_map[? "mana_burst"] = 1;

	return scr_create_deck_list_from_deck(deck_map);
}
