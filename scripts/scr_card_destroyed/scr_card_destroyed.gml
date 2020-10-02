function scr_card_destroyed() {
	if (state_new) {
		_animation_duration = random(1) + 0.5 * room_speed;
	
		if (owner == obj_battle_manager.player) {
			animation_add_next(
				round(random_range(x - 8, x + 8)),
				round(random_range(y - 16, y - 24)),
				random(1) + 0.5 * room_speed,
				ease_out_quint
			);
		}
	
		if (owner == obj_battle_manager.opponent) {
			animation_add_next(
				round(random_range(x - 8, x + 8)),
				round(random_range(y + 16, y + 24)),
				random(1) + 0.5 * room_speed,
				ease_out_quint
			);
		}
	
		exit;
	}
	
	alpha -= 1 / _animation_duration;

	if (animation_is_finished) {
		instance_destroy(self.id, true);
	}
}
