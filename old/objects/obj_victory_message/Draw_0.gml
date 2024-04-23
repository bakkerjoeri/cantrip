var outro_top = 24;

draw_set_halign(fa_center);
draw_set_colour(global.palette_4);
draw_text_ext(room_width / 2, outro_top, "You are victorious!", 8, 160);

draw_set_halign(fa_left);
draw_set_color(global.palette_1);
draw_text_ext(
	room_width / 3,
	outro_top + 16,
	outro,
	8,
	room_width / 3
);