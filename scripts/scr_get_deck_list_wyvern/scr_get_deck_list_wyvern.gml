var deck_map = ds_map_create();

deck_map[? "attack"] = 4;
deck_map[? "combust"] = 2;
deck_map[? "fireblast"] = 4;

return scr_create_deck_list_from_deck(deck_map);