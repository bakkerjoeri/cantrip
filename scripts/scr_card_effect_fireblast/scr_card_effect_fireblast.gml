///scr_card_effect_fireblast(target, source);
function scr_card_effect_fireblast() {
	var target = argument[0];
	var source = argument[1];

	scr_take_damage(target, 3, source);


}
