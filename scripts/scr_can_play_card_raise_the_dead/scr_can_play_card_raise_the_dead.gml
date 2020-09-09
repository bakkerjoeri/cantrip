/// scr_can_play_raise_the_dead(target, source);
function scr_can_play_card_raise_the_dead() {
	var source = argument[1];

	return ds_list_size(source.graveyard) > 0;


}
