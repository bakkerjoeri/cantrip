function scr_draw_cards(character, amount_of_cards) {
	with (character) {
		amount_of_cards_to_draw += amount_of_cards;
		state_switch("drawingCards");
	}
}
