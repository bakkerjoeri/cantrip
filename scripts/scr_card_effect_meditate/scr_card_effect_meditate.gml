///scr_card_effect_meditate(target, source);
var source = argument[1];

scr_add_start_of_turn_effect(
	source,
	"meditate",
	scr_card_effect_meditate_start_of_turn,
	1,
);