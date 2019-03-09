event_inherited();

draw_set_halign(fa_left);

if (obj_battle_manager.turn_of_character == self) {
	draw_set_color(global.palette_4);
	draw_text(448, 106, "@");	
}

draw_set_color(global.palette_1);
draw_text(448, 82, "Hand");
draw_text(448, 90, "AP");

draw_set_halign(fa_right);

if (debug_mode) {
	draw_text(496, 114, state_name);
}

draw_text(496, 106, "Opponent");
draw_set_color(global.palette_5);
draw_text(496,82, string(ds_list_size(hand)) + "/8");
draw_set_color(global.palette_3);
draw_text(496, 90, string(ability_points) + "/3");