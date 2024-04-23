function scr_game_goto_travel() {
	if (state_new) {
		if (room != room_travel) {
			var previous_floor = current_floor;
			var previous_room = current_room;
			
			current_floor = scr_get_next_floor(floors, previous_floor, previous_room);
			current_room = scr_get_next_room(floors, previous_floor, previous_room);
			current_floor_number = ds_list_find_index(floors, current_floor) + 1;
			current_room_number = ds_list_find_index(current_floor[? "rooms"], current_room) + 1;
			
			with (obj_music_controller) {
				if (previous_floor != obj_game_manager.current_floor && obj_game_manager.current_floor_number == 1) {
					add_tracks(music_for_forest);
				} else if (previous_floor != obj_game_manager.current_floor && obj_game_manager.current_floor_number == 2) {
					add_tracks(music_for_village);
				} else if (previous_floor != obj_game_manager.current_floor && obj_game_manager.current_floor_number == 3) {
					add_tracks(music_for_tower);
				} else if (obj_game_manager.current_floor_number == 3) {
					if (obj_game_manager.current_room[? "enemy"][? "id"] == "lord_of_lightning") {
						add_tracks(music_for_lord_of_lightning);
						add_tracks(music_for_finale);
					} else if (obj_game_manager.current_room[? "enemy"][? "id"] == "crimson_mage") {
						add_tracks(music_for_crimson_mage);
						add_tracks(music_for_finale);
					} else if (obj_game_manager.current_room[? "enemy"][? "id"] == "void_priest") {
						add_tracks(music_for_void_priest);
						add_tracks(music_for_finale);
					}
				}
			}
			
			room_goto(room_travel);
			exit;
		}
		
		state_switch("travel");
	}
}
