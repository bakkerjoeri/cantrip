/// scr_can_play_transmute_shields(target, source);
function scr_can_play_card_transmute_shields() {
	var source = argument[1];

	for (var c = 0; c <= ds_list_size(source.hand) - 1; c += 1) {
		var card = ds_list_find_value(source.hand, c);
	
		if (card.name == "shield") {
			return true;
		}
	}

	return false;


}
