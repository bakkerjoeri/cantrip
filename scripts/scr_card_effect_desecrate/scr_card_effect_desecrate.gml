///scr_card_effect_healing_potion(target, source);
var target = argument[0];
var source = argument[1];

var card_to_steal = ds_list_find_value(target.graveyard, ds_list_size(target.graveyard) - 1);

if (card_to_steal) {	
	with (card_to_steal) {
		ds_list_delete(target.graveyard, ds_list_find_index(target.graveyard, card_to_steal));
		ds_list_add(source.hand, card_to_steal);
		owner = source;
		state_switch("beingDrawn");
	}
}