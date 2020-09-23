function scr_card_definition_shields_up(card) {
	card.name = "shields_up";
	card.title = "shields up";
	card.cost = 1;
	card.text = "Add 2 \"shield\" cards to your hand.";
	card.effect = do_shields_up_effect;
}

function do_shields_up_effect(target, source) {
	repeat(min(2, source.max_hand_size - ds_list_size(source.hand))) {
		var shield_card = scr_create_card("shield");
		shield_card.x = (room_width / 2) - 32;
		shield_card.y = (room_height / 2) - 48;
	
		with (shield_card) {
			ds_list_add(source.hand, shield_card);
			owner = source;
			state_switch("beingDrawn");
		}	
	}
}
