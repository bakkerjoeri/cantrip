var deck_map = ds_map_create();

deck_map[? "attack"] = 3;
deck_map[? "shield"] = 2;
deck_map[? "combust"] = 2;
deck_map[? "leech"] = 2;
deck_map[? "rest"] = 2;
deck_map[? "meditate"] = 1;
deck_map[? "fireblast"] = 1;
deck_map[? "healing_potion"] = 1;

return scr_create_deck_list_from_deck(deck_map);