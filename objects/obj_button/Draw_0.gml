draw_self();

draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_color(global.palette_1);

draw_text(x + (sprite_width / 2) + 1, y + (sprite_height / 2), label);

draw_set_halign(fa_left);
draw_set_valign(fa_top);