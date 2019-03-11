var boss = ds_map_create();

boss[? "name"] = "The blacksmith";
boss[? "deck_list"] = scr_get_deck_list_the_blacksmith();
boss[? "max_ability_points"] = 3;
boss[? "max_hand_size"] = 8;

return boss;