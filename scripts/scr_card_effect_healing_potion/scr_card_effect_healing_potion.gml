///scr_card_effect_healing_potion(target, source);
var source = argument[1];

with (source) {
	amount_of_cards_to_draw += 3;
	state_switch("drawingCards");
}