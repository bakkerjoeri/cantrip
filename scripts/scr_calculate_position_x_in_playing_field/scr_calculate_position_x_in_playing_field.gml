function scr_calculate_position_x_in_playing_field(
	index_of_card_in_list,
	amount_of_cards_in_list,
	list_middle
) {
	var gap = 8;
	var card_width = 64;

	return floor(list_middle - (((card_width + gap) / 2) * amount_of_cards_in_list) + (gap / 2) + (index_of_card_in_list * (card_width + gap)));
}
