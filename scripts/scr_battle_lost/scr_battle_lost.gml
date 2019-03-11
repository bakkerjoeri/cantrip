if (state_new) {
	instance_create_layer(0, 0, "Overlays", obj_battle_lost_fade);
}

if (state_timer >= 3.5 * room_speed) {
	with(obj_game_manager) {
		state_switch("gameOver");
	}
}