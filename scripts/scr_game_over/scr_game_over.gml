if (state_new) {	
	if (room != room_game_over) {
		room_goto(room_game_over);
	}
	
	instance_create_layer(0, 0, "Instances", obj_game_over_message);
}