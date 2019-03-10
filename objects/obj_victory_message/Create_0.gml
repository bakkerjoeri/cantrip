current_floor_number = ds_list_find_index(obj_game_manager.current_floor[? "rooms"], obj_game_manager.current_room) + 1;
current_room_number = ds_list_find_index(obj_game_manager.floors, obj_game_manager.current_floor) + 1;
battles_won = obj_game_manager.battles_won;