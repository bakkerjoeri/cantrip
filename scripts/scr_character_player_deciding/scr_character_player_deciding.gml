if (amount_of_cards_to_draw > 0) {
	state_switch("drawingCards");
	exit;
}

if (!ds_queue_empty(cards_to_play)) {
	state_switch("playingCards");
	exit;
}

if (!ds_queue_empty(cards_to_discard)) {
	state_switch("discardingCards");
	exit;
}

if (damage_to_take > 0) {
	state_switch("takingDamage");
	exit;
}

if (obj_battle_manager.state_name == "turnPlayPhase") {
	var card_under_mouse =  scr_get_top_object_under_mouse(obj_card_base);
	
	if (ds_list_find_index(hand, card_under_mouse) >= 0) {
		obj_battle_manager.card_with_focus = card_under_mouse;
	} else {
		obj_battle_manager.card_with_focus = noone;
	}
}
