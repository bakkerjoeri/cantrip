draw_self();

draw_set_halign(fa_center);
draw_set_valign(fa_center);

if (is_active) {
	if (has_focus) {
		draw_set_color(global.palette_4);
	} else {
		draw_set_color(global.palette_1);
	}
} else {
	draw_set_color(global.palette_7);
}

draw_text_ext(x + (sprite_width / 2), y + (sprite_height / 2), label, 8, sprite_width - 4);

draw_set_halign(fa_left);
draw_set_valign(fa_top);