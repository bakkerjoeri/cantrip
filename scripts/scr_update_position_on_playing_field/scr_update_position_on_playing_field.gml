function scr_update_position_on_playing_field() {
	if (!variable_instance_exists(self.id, "previous_playing_field_position")) {
		previous_playing_field_position = -1;
	}
	
	if (!variable_instance_exists(self.id, "previous_playing_field_size")) {
		previous_playing_field_size = 0;
	}
	
	var current_playing_field_size = ds_list_size(obj_battle_manager.playing_field);
	var current_playing_field_position = ds_list_find_index(obj_battle_manager.playing_field, self.id);
	
	// Animate to new position if playing field composition has changed
	if (
		current_playing_field_position != -1 && (
			current_playing_field_size != previous_playing_field_size ||
			current_playing_field_position != previous_playing_field_position ||
			state_new
		)
	) {
		animation_cancel();
		animation_add_next(
			scr_calculate_position_x_in_playing_field(
				current_playing_field_position,
				current_playing_field_size,
				room_width / 2
			),
			(room_height / 2) - (sprite_height / 2),
			0.2 * room_speed,
			ease_out_quint,
		);
		
		previous_playing_field_position = current_playing_field_position;
		previous_playing_field_size = current_playing_field_size;
	}

}