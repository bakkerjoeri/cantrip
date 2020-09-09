/// scr_card_effect_seance(target, source);
function scr_card_effect_revenge_from_beyond() {
	var target = argument[0];
	var source = argument[1];

	var card_to_play = ds_list_find_value(target.graveyard, ds_list_size(target.graveyard) - 1);

	if (card_to_play) {
		ds_list_delete(target.graveyard, ds_list_find_index(target.graveyard, card_to_play));
	
		with (card_to_play) {
			state_switch("startPlay");
		}
	}


}
