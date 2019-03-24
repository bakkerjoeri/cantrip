/// scr_can_play_transmute_shields(target, source);
var source = argument[1];

var shield_cards_in_hand = 0;

for (var c = 0; c <= ds_list_size(source.hand) - 1; c += 1) {
	var card = ds_list_find_value(source.hand, c);
	
	if (card.name = "shield") {
		return true;
	}
}

return false;