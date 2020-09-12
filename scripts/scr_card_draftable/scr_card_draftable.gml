function scr_card_draftable() {
	// Change depth and position based on focus
	if (obj_draft_manager.card_with_focus == self.id) {
		if (!has_focus) {
			has_focus = true;
			animation_cancel();
			animation_add_next(
				x,
				obj_draft_manager.draft_list_y - 12,
				.1 * room_speed,
				ease_in_out_quint,
			);
		}
	} else {
		if (has_focus) {
			has_focus = false;
			animation_cancel();
			animation_add_next(
				x,
				obj_draft_manager.draft_list_y,
				.1 * room_speed,
				ease_in_out_quint,
			);
		}
	}

	if (
		mouse_check_button_released(mb_left)
		&& instance_position(mouse_x, mouse_y, self.id)
		&& scr_get_top_object_under_mouse(obj_card_base) == self.id
	) {
		with (obj_draft_manager) {
			picked_card = other.id;
		}
	}


}
