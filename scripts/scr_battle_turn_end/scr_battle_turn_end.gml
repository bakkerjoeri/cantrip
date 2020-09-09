function scr_battle_turn_end() {
	if (
		(player.state_name == "waiting" || player.state_name == "deciding")
		&& (opponent.state_name == "waiting" || opponent.state_name == "deciding")
	) {
		// Set the current character to waiting.
		with (turn_of_character) {
			state_switch("waiting");
		}
	
		// Switch turns to the other character.
		turn_of_character = scr_get_opponent_of_character(turn_of_character);

		state_switch("turnStart");
	}


}
