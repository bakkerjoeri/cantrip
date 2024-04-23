if (surface_exists(pause_surface)) {
	if (state_name == "paused" || (state_name == "unpaused" && state_new)) {
		draw_surface(pause_surface, 0, 0);
		draw_sprite_tiled(spr_overlay_fade_out, 1, 0, 0);
	}
}