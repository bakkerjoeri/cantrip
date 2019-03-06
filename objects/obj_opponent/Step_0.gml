var draw_pile_size = ds_list_size(draw_pile);
var hand_size = ds_list_size(hand);
var graveyard_size = ds_list_size(graveyard);
var hand_width = 196;

// Position the draw pile.
for (c = 0; c <= draw_pile_size - 1; c += 1) {
	var current_card = ds_list_find_value(draw_pile, c);
	
	current_card.y = 2;
	current_card.x = 364;
}

// Position the hand.
for (c = 0; c <= hand_size - 1; c += 1) {
	var current_card = ds_list_find_value(hand, c);
	
	current_card.depth = hand_size - c;
	current_card.y = 2;
	current_card.x = ((room_width / 2) - (hand_width / 2)) + (c * (((hand_width - 4)/hand_size) - 2));
}

// Position the graveyard
for (c = 0; c <= graveyard_size - 1; c += 1) {
	var current_card = ds_list_find_value(graveyard, c);
	
	current_card.y = 2;
	current_card.x = 84;
}