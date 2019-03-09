///scr_card_effect_healing_potion(target, source);
var target = argument[0];
var source = argument[1];

var card_to_steal = scr_choose_from_list(target.hand);

if (card_to_steal) {	
	with (card_to_steal) {
		ds_list_delete(target.hand, ds_list_find_index(target.hand, card_to_steal));
		ds_list_add(source.hand, card_to_steal);
		owner = source;
		state_switch("beingDrawn");
	}
}