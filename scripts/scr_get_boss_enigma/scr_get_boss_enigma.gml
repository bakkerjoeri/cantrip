var boss = ds_map_create();

boss[? "name"] = "Enigma";
boss[? "deck_list"] = scr_get_deck_list_enigma();
boss[? "max_ability_points"] = 3;
boss[? "max_hand_size"] = 9;

return boss;