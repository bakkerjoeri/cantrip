/// scr_can_play_read_mind(target, source);
function scr_can_play_card_read_mind() {
	var target = argument[0];

	return ds_list_size(target.hand) > 0;


}
