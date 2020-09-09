/// scr_can_play_seance(target, source);
function scr_can_play_card_revenge_from_beyond() {
	var target = argument[0];
	var source = argument[1];

	return ds_list_size(target.graveyard) > 0;


}
