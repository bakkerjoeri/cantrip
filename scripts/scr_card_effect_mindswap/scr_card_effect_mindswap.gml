///scr_card_effect_mind_swap(target, source);
var target = argument[0];
var source = argument[1];

scr_card_effect_swap_hands(target, source);

scr_add_start_of_turn_effect(
	source,
	"mindswap",
	scr_card_effect_swap_hands,
	1,
);