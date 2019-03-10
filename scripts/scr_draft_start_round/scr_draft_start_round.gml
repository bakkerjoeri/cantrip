var cards_to_draft = current_round[? "cards"];
var amount_of_cards_to_draft = ds_list_size(cards_to_draft);

for (var c = 0; c <= amount_of_cards_to_draft - 1; c += 1) {
	var card_name = ds_list_find_value(cards_to_draft, c);
	var card = instance_create_layer(
		(room_width / 2) - ((32 + 4) * amount_of_cards_to_draft) + c * (64 + 6),
		(room_height / 2) - (96 / 2),
		"Instances",
		asset_get_index("obj_card_" + card_name)
	);
}

state_switch("awaitSelection");