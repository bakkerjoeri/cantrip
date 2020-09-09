/// scr_can_play_seance(target, source);
function scr_can_play_card_seance() {
	var target = argument[0];
	var source = argument[1];

	return ds_list_size(source.graveyard) > 0;


}
