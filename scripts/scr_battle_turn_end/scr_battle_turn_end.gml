if (turn_of_character == player) {
	turn_of_character = opponent;
} else {
	turn_of_character = player;
}

state_switch("turnStart");