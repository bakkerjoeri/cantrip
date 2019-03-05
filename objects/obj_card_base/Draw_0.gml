draw_self();

var padding = 5;

if (is_face_up) {
	draw_set_color(c_black);
	
	draw_set_halign(fa_left);
	draw_text_ext(x + padding, y + padding, name, 8, sprite_width - 18);

	draw_set_halign(fa_right);
	draw_text(x + sprite_width - padding, y + padding, string(cost));

	draw_set_halign(fa_left);
	draw_text_ext(x + padding, y + 46, text, 8, sprite_width - padding);
}
