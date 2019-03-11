if (instance_exists(obj_player)) {
	draw_set_color(global.palette_8);

	draw_set_halign(fa_left);
	draw_text(obj_player.draw_pile_x + 4, obj_player.draw_pile_y - 14, "draw pile");
	draw_text(obj_player.graveyard_x + 4, obj_player.graveyard_y - 14, "graveyard");
	
	draw_set_halign(fa_right);
	draw_text(obj_player.draw_pile_x + 60, obj_player.draw_pile_y - 14, string(ds_list_size(obj_player.draw_pile)));
	draw_text(obj_player.graveyard_x + 60, obj_player.graveyard_y - 14, string(ds_list_size(obj_player.graveyard)));
}