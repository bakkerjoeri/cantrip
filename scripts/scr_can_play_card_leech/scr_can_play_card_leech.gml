/// scr_can_play_leech(target, source);
function scr_can_play_card_leech() {
	var target = argument[0];

	return ds_list_size(target.hand) > 0;


}
