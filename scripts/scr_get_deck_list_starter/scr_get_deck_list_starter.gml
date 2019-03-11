var deck_map = ds_map_create();


deck_map[? "stamina_potion"] = 2;
deck_map[? "revenge_from_beyond"] = 2;
deck_map[? "seance"] = 2;
//deck_map[? "rest"] = 2;
//deck_map[? "combust"] = 1;

return scr_create_deck_list_from_deck(deck_map);