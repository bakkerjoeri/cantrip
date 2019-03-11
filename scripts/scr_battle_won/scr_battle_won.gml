if (state_new) {
	var battle_won_announcement = instance_create_layer(0, 0, "Overlays", obj_announcement);
	battle_won_announcement.text = "Victory!";
	battle_won_announcement.text_color = global.palette_4;
}

if (state_timer >= 3 * room_speed) {
	with (obj_game_manager) {
		battles_won += 1;
		
		if (!scr_has_next_room(floors, current_floor, current_room)) {
			state_switch("victory");
			exit;
		}
		
		state_switch("gotoDraft");
		exit;
	}
}