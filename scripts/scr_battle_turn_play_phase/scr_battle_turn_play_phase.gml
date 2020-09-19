function scr_battle_turn_play_phase() {
	if (state_new) {
		with (turn_of_character) {
			state_switch("deciding");
		}
	}

	var card_under_mouse = scr_get_top_object_under_mouse(obj_card_base, 20, 0, 20, 0);
	
	if (
		card_under_mouse
		&& card_under_mouse.state_name == "inHand"
	) {
		obj_battle_manager.card_with_focus = card_under_mouse;
	} else {
		obj_battle_manager.card_with_focus = noone;
	}
}
