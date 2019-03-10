var enemy = ds_map_create();

enemy[? "name"] = "Gerblin";
enemy[? "deck_list"] = scr_get_deck_list_gerblin();
enemy[? "max_hand_size"] = 4;
enemy[? "max_ability_points"] = 2;

return enemy;