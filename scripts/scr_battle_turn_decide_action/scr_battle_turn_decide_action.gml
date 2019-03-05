if (state_new && turn_of_character == opponent) {
	_opponent_turn_delay = 2 * room_speed;
}

if (turn_of_character == opponent) {
	if (_opponent_turn_delay <= 0) {
		state_switch("turnEnd");
		exit;
	}

	_opponent_turn_delay -= 1;
}