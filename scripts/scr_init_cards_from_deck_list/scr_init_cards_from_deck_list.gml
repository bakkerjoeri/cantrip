var deck_list = argument[0];
var owner = argument[1];

var cards = ds_list_create();

for (var c = 0; c <= ds_list_size(deck_list) - 1; c += 1) {
	var card_name = ds_list_find_value(deck_list, c);
	var card = instance_create_layer(0, 0, "Instances", asset_get_index("obj_card_" + card_name));
	ds_list_add(cards, card);
	card.owner = owner;
	
	with (card) {
		state_switch("inDrawPile");
	}
}

return cards;

