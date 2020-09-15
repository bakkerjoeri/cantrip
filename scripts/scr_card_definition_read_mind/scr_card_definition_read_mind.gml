function scr_card_definition_read_mind() {
	var definition = {
		name: "read_mind",
		title: "read mind",
		cost: 1,
		text: "Copy 2 random cards from your opponent's hand.",
		effect: do_read_mind_effect,
		condition: can_play_read_mind,
	}
	
	return definition;
}

function do_read_mind_effect(target, source) {
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

function can_play_read_mind(target, source) {
	return ds_list_size(target.hand) > 0;
}