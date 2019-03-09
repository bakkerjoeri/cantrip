var amount_of_cards = argument[0];
var owner = argument[1];
var deck = ds_list_create();

var deck_map = ds_map_create();

deck_map[? "attack"] = 3;
deck_map[? "combust"] = 2;
deck_map[? "leech"] = 2;
deck_map[? "rest"] = 2;
deck_map[? "meditate"] = 1;
deck_map[? "fireblast"] = 1;
deck_map[? "healing_potion"] = 1;

var card_name = ds_map_find_first(deck_map);

for (var i = 0; i < ds_map_size(deck_map); i += 1) {
	repeat(deck_map[? card_name]) {
		var card = instance_create_layer(0, 0, "Instances_default", asset_get_index("obj_card_" + card_name));
		
		card.owner = owner;
		ds_list_add(deck, card);
	}
	
	var card_name = ds_map_find_next(deck_map, card_name);
}

return deck;