if (debug_mode) {
	draw_set_color(global.palette_1);
	draw_set_halign(fa_left);
	draw_text(384, 26, "draft state: " + state_name);
}

if (state_name != "end") {
	draw_set_halign(fa_center);
	
	if (
		obj_game_manager.current_room_number == 0
		&& obj_game_manager.current_floor_number == 0
	) {
		draw_set_color(global.palette_1);
		draw_text(room_width / 2, 64, "It's dangerous to go alone!\nDraft cards to add to your deck.");
	} else {
		draw_set_color(global.palette_1);
		draw_text(room_width / 2, 64, "Reap your reward!\nDraft cards to add to your deck.");
	}
	
	draw_set_color(global.palette_4);
	draw_text(room_width / 2, 88, string(ds_queue_size(draft_rounds) + 1) + " draft picks left.");

	draw_sprite(spr_card_backside, 0, deck_x, deck_y);
} else {
	draw_set_halign(fa_center);
	draw_set_color(global.palette_1);
	draw_text(room_width / 2, 136, "Draft finished.");
}
