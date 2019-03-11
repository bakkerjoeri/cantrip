var deck_map = ds_map_create();

deck_map[? "leech"] = 2
deck_map[? "read_mind"] = 4;
deck_map[? "stamina_potion"] = 2;
deck_map[? "mindswap"] = 1;

return scr_create_deck_list_from_deck(deck_map);