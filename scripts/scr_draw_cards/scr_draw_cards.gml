/// scr_draw_cards(character, damage);
function scr_draw_cards() {
	var source = argument[0];
	var amount_of_cards = argument[1];

	with (source) {
		amount_of_cards_to_draw += amount_of_cards;
		state_switch("drawingCards");
	}
}
