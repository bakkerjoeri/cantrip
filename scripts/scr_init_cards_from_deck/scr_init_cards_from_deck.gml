var deck = argument[0];
var owner = argument[1];

var card_list = ds_list_create();
var card_name = ds_map_find_first(deck);

for (var i = 0; i < ds_map_size(deck); i += 1) {
	repeat(deck[? card_name]) {
		var card = instance_create_layer(0, 0, "Instances_default", asset_get_index("obj_card_" + card_name));
		
		card.owner = owner;
		ds_list_add(card_list, card);
	}
	
	var card_name = ds_map_find_next(deck, card_name);
}

return card_list;