if (debug_mode) {
	draw_set_color(global.palette_1);
	draw_set_halign(fa_left);
	draw_text(384, 10, "mouse: " + string(mouse_x) + ", " + string(mouse_y));
	draw_text(384, 18, "game state: " + state_name);
	
	if (current_floor && current_room) {
		draw_text(384, 34, current_room[? "type"] + " " + string(ds_list_find_index(current_floor[? "rooms"], current_room) + 1) + "-" + string(ds_list_find_index(floors, current_floor) + 1));
		draw_text(384, 42, "room tier " + string(current_room[? "room_tier"]));
		draw_text(384, 50, "reward tier " + string(current_room[? "reward_tier"]));
	}
}