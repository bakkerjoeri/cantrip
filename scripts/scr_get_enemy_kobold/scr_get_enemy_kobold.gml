var enemy = ds_map_create();

enemy[? "name"] = "Kobold";
enemy[? "deck_list"] = scr_get_deck_list_kobold();
enemy[? "max_hand_size"] = 4;
enemy[? "max_ability_points"] = 3;

return enemy;