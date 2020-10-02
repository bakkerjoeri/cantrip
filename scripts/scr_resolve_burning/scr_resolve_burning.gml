function resolve_burning(target, source, card) {
	scr_take_damage(card.owner, 1, card.owner, {
		cards: [card],
	});

	var own_position = ds_list_find_index(card.owner.hand, card);
	var card_to_left = ds_list_find_value(card.owner.hand, own_position - 1);
	var card_to_right = ds_list_find_value(card.owner.hand, own_position + 1);
	
	if (!is_undefined(card_to_left)) {
		card_to_left.is_burning = true;
	}
	
	if (!is_undefined(card_to_right)) {
		card_to_right.is_burning = true;
	}
}