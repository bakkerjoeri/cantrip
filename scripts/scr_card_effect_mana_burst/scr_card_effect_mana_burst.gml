///scr_card_mana_burst(target, source);
function scr_card_effect_mana_burst() {
	var target = argument[0];
	var source = argument[1];

	scr_take_damage(target, source.ability_points, source);


}
