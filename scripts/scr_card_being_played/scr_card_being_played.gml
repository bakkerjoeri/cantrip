if (state_new) {
	animation_add_wait(.5 * room_speed);

	exit;
}

if (animation_is_finished) {
	var target;
	var source = obj_battle_manager.turn_of_character;

	if (source == obj_battle_manager.player) {
		target = obj_battle_manager.opponent;
	} else {
		target = obj_battle_manager.player;
	}

	for (var e = 0; e <= ds_list_size(effects) - 1; e += 1) {
		var effect = ds_list_find_value(effects, e);
		
		script_execute(effect, target, source);
	}
	
	state_switch("isResolved");
}