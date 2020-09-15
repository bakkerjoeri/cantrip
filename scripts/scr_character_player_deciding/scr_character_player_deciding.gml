function scr_character_player_deciding() {
	if (obj_battle_manager.state_name == "turnPlayPhase") {
		var card_under_mouse =  scr_get_top_object_under_mouse(obj_card_base, 20, 0, 20, 0);
	
		if (ds_list_find_index(hand, card_under_mouse) >= 0) {
			obj_battle_manager.card_with_focus = card_under_mouse;
		} else {
			obj_battle_manager.card_with_focus = noone;
		}
	}
}
