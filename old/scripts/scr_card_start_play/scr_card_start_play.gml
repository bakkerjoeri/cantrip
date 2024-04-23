function scr_card_start_play() {
	if (state_new) {
		scr_remove_item_from_list(owner.hand, self.id);
		move_card_to_list(self.id, obj_battle_manager.playing_field);
		
		depth = -1;
		is_face_up = true;

		animation_add_next(
			scr_calculate_position_x_in_playing_field(
				ds_list_find_index(obj_battle_manager.playing_field, self.id),
				ds_list_size(obj_battle_manager.playing_field),
				room_width / 2,
			),
			(room_height / 2) - (sprite_height / 2),
			0.25 * room_speed,
			ease_out_quint
		);
	
		exit;
	}

	if (animation_is_finished) {
		state_switch("beingPlayed");
	}
}
