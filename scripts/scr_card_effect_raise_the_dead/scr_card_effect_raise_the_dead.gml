///scr_card_effect_healing_potion(target, source);
var source = argument[1];

var card_to_retrieve = ds_list_find_value(source.graveyard, ds_list_size(source.graveyard) - 1);

if (card_to_retrieve) {	
	with (card_to_retrieve) {
		ds_list_delete(source.graveyard, ds_list_find_index(source.graveyard, card_to_retrieve));
		ds_list_add(source.hand, card_to_retrieve);
		state_switch("beingDrawn");
	}
}