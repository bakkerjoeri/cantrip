function scr_draft_await_pick() {
	if (state_new) {
		for (var c = 0; c <= ds_list_size(draft_list) - 1; c += 1) {
			with (ds_list_find_value(draft_list, c)) {
				state_switch("draftable");
			}
		}
	}

	
	var card_under_mouse;
	
	if (card_with_focus) {
		card_under_mouse = scr_get_top_object_under_mouse(obj_card_base, 20, 0, 20, 0);
	} else {
		card_under_mouse = scr_get_top_object_under_mouse(obj_card_base);
	}

	if (card_under_mouse) {
		card_with_focus = card_under_mouse;
	} else {
		card_with_focus = noone;
	}

	if (picked_card) {
		card_with_focus = noone;
		state_switch("handlePick");
	}
}
