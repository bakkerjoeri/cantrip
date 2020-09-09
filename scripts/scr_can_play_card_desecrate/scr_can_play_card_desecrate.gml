/// scr_can_play_desecrate(target, source);
function scr_can_play_card_desecrate() {
	var target = argument[0];

	return ds_list_size(target.graveyard) > 0;


}
