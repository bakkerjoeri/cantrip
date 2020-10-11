event_inherited();

if (debug_mode) {
	draw_set_halign(fa_left);
	draw_text(4, room_height - 48, state_name);
}

if (obj_battle_manager.turn_of_character == self.id) {
	draw_set_halign(fa_right);
	draw_set_color(global.palette_4);
	draw_text(52, room_height - 40, "@");	
}

draw_set_halign(fa_left);
draw_set_color(global.palette_1);
draw_text(4, room_height - 40, "You");

draw_set_halign(fa_left);
draw_set_color(global.palette_1);
draw_text(4, room_height - 24, "Hand");
draw_set_halign(fa_right);
draw_set_color(global.palette_5);
draw_text(52, room_height - 24, string(ds_list_size(hand)) + "/" + string(max_hand_size));

draw_set_halign(fa_left);
draw_set_color(global.palette_1);
draw_text(4, room_height - 16, "AP");
draw_set_halign(fa_right);
draw_set_color(global.palette_3);
draw_text(52, room_height - 16, string(ability_points) + "/" + string(max_ability_points));