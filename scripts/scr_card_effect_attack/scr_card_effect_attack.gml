///scr_card_effect_attack(target, source);
function scr_card_effect_attack() {
	var target = argument[0];
	var source = argument[1];

	scr_take_damage(target, 1, source);


}
