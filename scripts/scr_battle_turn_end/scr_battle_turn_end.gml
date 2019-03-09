if (
	(player.state_name == "waiting" || player.state_name == "deciding")
	&& (opponent.state_name == "waiting" || opponent.state_name == "deciding")
) {
	// Set the current character to waiting.
	with (turn_of_character) {
		state_switch("waiting");
	}
	
	// Switch turns to the other character.
	if (turn_of_character == player) {
		turn_of_character = opponent;
	} else {
		turn_of_character = player;
	}

	state_switch("turnStart");
}