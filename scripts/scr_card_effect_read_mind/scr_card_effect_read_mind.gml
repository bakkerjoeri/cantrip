///scr_card_effect_read_mind(target, source);
function scr_card_effect_read_mind() {
	var target = argument[0];
	var source = argument[1];

	repeat(min(2, ds_list_size(target.hand), source.max_hand_size - ds_list_size(source.hand))) {
		var card_to_copy = scr_choose_from_list(target.hand);
	
		if (card_to_copy) {	
			var copied_card = instance_create_layer(card_to_copy.x, card_to_copy.y, "Instances", card_to_copy.object_index);
	
			ds_list_add(source.hand, copied_card);
	
			with (copied_card) {
				owner = source;
				state_switch("beingDrawn");
			}
		}
	}


}
