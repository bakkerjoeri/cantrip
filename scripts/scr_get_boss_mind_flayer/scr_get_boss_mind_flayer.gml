var boss = ds_map_create();

boss[? "name"] = "Mind Flayer";
boss[? "deck_list"] = scr_get_deck_list_mind_flayer();
boss[? "max_ability_points"] = 3;
boss[? "max_hand_size"] = 6;

return boss;