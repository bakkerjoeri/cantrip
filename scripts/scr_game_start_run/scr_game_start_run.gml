if (state_new) {	
	if (room != room_combat) {
		room_goto(room_combat);
	}
	
	current_room = 1;
	current_floor = 1;
}