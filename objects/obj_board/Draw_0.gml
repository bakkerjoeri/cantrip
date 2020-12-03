if (instance_exists(obj_player)) {
	draw_set_color(global.palette_2);

	draw_set_halign(fa_left);
	draw_text(obj_player.draw_pile_x + 4, obj_player.draw_pile_y - 14, "draw pile");
	draw_text(obj_player.graveyard_x + 4, obj_player.graveyard_y - 14, "graveyard");
	
	draw_set_halign(fa_right);
	draw_text(obj_player.draw_pile_x + 60, obj_player.draw_pile_y - 14, string(ds_list_size(obj_player.draw_pile)));
	draw_text(obj_player.graveyard_x + 60, obj_player.graveyard_y - 14, string(ds_list_size(obj_player.graveyard)));
	
	if (debug_mode) {
		draw_set_halign(fa_left);
		draw_text(obj_player.draw_pile_x, (room_height / 2) - 4, "playing field " + string(ds_list_size(obj_battle_manager.playing_field)));
	}
}

if (instance_exists(obj_opponent)) {
	draw_set_color(global.palette_2);

	draw_set_halign(fa_left);
	draw_text(obj_opponent.draw_pile_x + 4, obj_opponent.draw_pile_y + 96 + 6, "draw pile");
	draw_text(obj_opponent.graveyard_x + 4, obj_opponent.graveyard_y + 96 + 6, "graveyard");
	
	draw_set_halign(fa_right);
	draw_text(obj_opponent.draw_pile_x + 60, obj_opponent.draw_pile_y + 96 + 6, string(ds_list_size(obj_opponent.draw_pile)));
	draw_text(obj_opponent.graveyard_x + 60, obj_opponent.graveyard_y + 96 + 6, string(ds_list_size(obj_opponent.graveyard)));
}