var enemy = ds_map_create();

enemy[? "name"] = "Rogue";
enemy[? "deck_list"] = scr_get_deck_list_rogue();
enemy[? "max_ability_points"] = 3;
enemy[? "max_hand_size"] = 5;

return enemy;