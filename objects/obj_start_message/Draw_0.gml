draw_set_halign(fa_center);

if (obj_game_manager.runs_won > 0) {
	draw_set_colour(global.palette_4);
	draw_text(room_width / 2, 280, "Victories: " + string(obj_game_manager.runs_won));	
}

draw_set_colour(global.palette_1);
draw_text(room_width / 2, 288, "created by @bakkerjoeri");
draw_text(room_width / 2, 296, "for 7drl 2019");