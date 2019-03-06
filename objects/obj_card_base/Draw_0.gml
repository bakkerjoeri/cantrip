draw_self();

if (is_face_up) {
	var padding = 5;
	
	draw_set_color(global.palette_0);
	
	draw_set_halign(fa_left);
	draw_text_ext(x + padding, y + padding, name, 8, sprite_width - 18);

	if (cost == 0) {
		draw_set_color(global.palette_4);
	} else if (cost == 1) {
		draw_set_color(global.palette_3);
	} else if (cost >= 2) {
		draw_set_color(global.palette_5);
	}
	
	draw_set_halign(fa_right);
	draw_text(x + sprite_width - padding, y + padding, string(cost));

	
	draw_set_color(global.palette_0);
	draw_set_halign(fa_left);
	draw_text_ext(x + padding, y + 46, text, 8, sprite_width - (2 * padding));
}
