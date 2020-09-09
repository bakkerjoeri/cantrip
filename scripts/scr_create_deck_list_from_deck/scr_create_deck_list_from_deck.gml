/// scr_create_deck_list_from_deck
function scr_create_deck_list_from_deck() {
	var deck_map = argument[0];

	var deck_list = ds_list_create();
	var card_name = ds_map_find_first(deck_map);

	for (var i = 0; i < ds_map_size(deck_map); i += 1) {
		repeat(deck_map[? card_name]) {
			ds_list_add(deck_list, card_name);
		}
	
		card_name = ds_map_find_next(deck_map, card_name);
	}

	return deck_list;


}
