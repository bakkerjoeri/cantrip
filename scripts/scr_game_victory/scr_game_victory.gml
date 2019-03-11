if (state_new) {
	if (room != room_victory) {
		runs_won = runs_won + 1;
		room_goto(room_victory);
	}
}