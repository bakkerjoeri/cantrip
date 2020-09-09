/// scr_card_effect_seance(target, source);
function scr_card_effect_seance() {
	var source = argument[1];

	var card_to_play = ds_list_find_value(source.graveyard, ds_list_size(source.graveyard) - 1);

	if (card_to_play) {
		ds_list_delete(source.graveyard, ds_list_find_index(source.graveyard, card_to_play));
		with (card_to_play) {
			state_switch("startPlay");
		}
	}


}
