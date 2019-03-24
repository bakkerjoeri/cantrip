if (state_new) {
	animation_add_wait(.5 * room_speed);

	exit;
}

if (animation_is_finished) {
	if (!is_undefined(effect)) {
		var target = noone;
		var source = obj_battle_manager.turn_of_character;

		if (source == obj_battle_manager.player) {
			target = obj_battle_manager.opponent;
		} else {
			target = obj_battle_manager.player;
		}
		
		script_execute(effect, target, source);
	}
	
	state_switch("isResolved");
}