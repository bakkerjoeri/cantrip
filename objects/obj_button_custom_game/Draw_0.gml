event_inherited();

if (!obj_game_manager.is_custom_game_unlocked) {
	draw_set_halign(fa_center);
	draw_text(x + (sprite_width / 2), y + sprite_height + 8, "Unlock by winning a run");
}