var boss = ds_map_create();

boss[? "name"] = "Wyvern";
boss[? "deck_list"] = scr_get_deck_list_wyvern();
boss[? "max_ability_points"] = 2;
boss[? "max_hand_size"] = 10;

return boss;