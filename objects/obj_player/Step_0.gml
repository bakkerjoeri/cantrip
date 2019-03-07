var draw_pile_size = ds_list_size(draw_pile);
var hand_size = ds_list_size(hand);
var graveyard_size = ds_list_size(graveyard);
var hand_width = 196;

// Position the draw pile.
for (var c = 0; c <= draw_pile_size - 1; c += 1) {
	var current_card = ds_list_find_value(draw_pile, c);
	
	current_card.y = room_height - 98;
	current_card.x = 84;
}

// Position the hand.
for (var c = 0; c <= hand_size - 1; c += 1) {
	var current_card = ds_list_find_value(hand, c);
	
	//if (!current_card.is_drawing) {
	//	if (obj_battle_manager.card_with_focus == current_card) {
	//		current_card.y = room_height - 108;
	//		current_card.depth = 0;
	//	} else {
	//		current_card.y = room_height - 98;
		
	//		if (obj_battle_manager.card_with_focus) {
	//			current_card.depth = abs(ds_list_find_index(hand, obj_battle_manager.card_with_focus) - c);
	//		} else {
	//			current_card.depth = c;
	//		}
	//	}
	
	//	current_card.x = ((room_width / 2) - (hand_width / 2)) + (c * (((hand_width - 4)/hand_size) - 2));
	//}
}

// Position the graveyard
for (var c = 0; c <= graveyard_size - 1; c += 1) {
	var current_card = ds_list_find_value(graveyard, c);
	
	current_card.depth = -c;
	current_card.y = room_height - 98;
	current_card.x = 364;
}