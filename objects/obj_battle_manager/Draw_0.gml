if (debug_mode) {
	draw_set_color(global.palette_1);
	draw_text(5, 10, "mouse: " + string(mouse_x) + ", " + string(mouse_y));
	draw_text(5, 18, "state: " + state_name);
}