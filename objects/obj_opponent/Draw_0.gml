event_inherited();

draw_set_halign(fa_left);

if (obj_battle_manager.turn_of_character == self) {
	draw_set_color(global.palette_4);
	draw_text(448, 106, "@");	
}

draw_set_color(global.palette_1);
draw_text(448, 90, "Hand");
draw_text(448, 82, "AP");

draw_set_halign(fa_right);

if (debug_mode) {
	draw_text(496, 114, state_name);
}

draw_text(496, 106, name);
draw_set_color(global.palette_5);
draw_text(496, 90, string(ds_list_size(hand)) + "/" + string(max_hand_size));
draw_set_color(global.palette_3);
draw_text(496, 82, string(ability_points) + "/" + string(max_ability_points));