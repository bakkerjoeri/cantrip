var boss = ds_map_create();

boss[? "name"] = "Ancient wizard";
boss[? "deck_list"] = scr_get_deck_list_ancient_wizard();
boss[? "max_ability_points"] = 4;
boss[? "max_hand_size"] = 7;

return boss;