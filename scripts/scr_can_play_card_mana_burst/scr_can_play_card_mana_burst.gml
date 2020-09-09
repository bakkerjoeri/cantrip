/// scr_can_play_mana_burst(target, source);
function scr_can_play_card_mana_burst() {
	var source = argument[1];

	return source.ability_points > 0;


}
