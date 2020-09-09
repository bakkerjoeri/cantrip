/// scr_can_play_stamina_potion(target, source);
function scr_can_play_card_stamina_potion() {
	var source = argument[1];

	return source.ability_points < source.max_ability_points;


}
