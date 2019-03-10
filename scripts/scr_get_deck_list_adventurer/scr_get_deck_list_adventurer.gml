var deck_map = ds_map_create();

deck_map[? "attack"] = 4;
deck_map[? "shield"] = 2;
deck_map[? "rest"] = 2;
deck_map[? "fireblast"] = 1;
deck_map[? "healing_potion"] = 1;

return scr_create_deck_list_from_deck(deck_map);