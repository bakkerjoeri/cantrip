///scr_draw_card(character <Character>);
var character = argument[0];

// Before drawing, check if the graveyard needs to be reshuffled into the draw pile.
if (ds_list_size(character.draw_pile) <= 0 && ds_list_size(character.graveyard) > 0) {
	for (c = 0; c <= ds_list_size(character.graveyard) - 1; c += 1) {
		var cardToMove = ds_list_find_value(character.graveyard, c);
		
		cardToMove.is_face_up = false;
		ds_list_delete(character.graveyard, c);
		ds_list_add(character.draw_pile, cardToMove);
	}
	
	ds_list_shuffle(character.draw_pile);
}

// Only draw if there's still cards in the draw pile.
if (ds_list_size(character.draw_pile > 0)) {
	var cardToDraw = ds_list_find_value(character.draw_pile, 0);
	
	ds_list_delete(character.draw_pile, 0);
	ds_list_add(character.hand, cardToDraw);
	
	if (character.is_player) {
		cardToDraw.is_face_up = true;
	}
}