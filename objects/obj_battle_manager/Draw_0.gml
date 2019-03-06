if (debug_mode) {
	draw_set_color(global.palette_1);
	draw_set_halign(fa_left);
	draw_text(5, 10, "mouse: " + string(mouse_x) + ", " + string(mouse_y));
	draw_text(5, 18, "battle state: " + state_name);
}