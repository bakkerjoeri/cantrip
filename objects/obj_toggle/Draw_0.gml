draw_self();

var text_offset = sprite_width + 8;
var text_left = x + text_offset;

draw_set_color(global.palette_1);
draw_set_valign(fa_center);
draw_text_ext(text_left, y + (sprite_height / 2), label, 8, width - text_offset);

draw_set_valign(fa_top);
if (explanation != "") {
	draw_set_color(global.palette_2);
	draw_text_ext(text_left, y + sprite_height, explanation, 8, width - text_offset);
}
