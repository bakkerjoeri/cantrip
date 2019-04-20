var enemy = ds_map_create();

enemy[? "name"] = "Adventurer";
enemy[? "deck_list"] = scr_get_deck_list_adventurer();
enemy[? "max_ability_points"] = 3;
enemy[? "max_hand_size"] = 7;

return enemy;