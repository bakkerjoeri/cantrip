function scr_generate_floors() {
	var floors = ds_list_create();

	var number_of_floors = 3;
	var number_of_rooms = 3;

	for (var floor_number = 0; floor_number <= number_of_floors - 1; floor_number += 1) {
		var new_floor = ds_map_create();
		var rooms = ds_list_create();
		var enemy_pool = ds_list_create();
		var boss_pool = ds_list_create();
	
		for (var room_number = 0; room_number <= number_of_rooms - 1; room_number += 1) {
			var new_room = ds_map_create();
			var room_tier = floor_number;
		
			if (room_number < number_of_rooms - 1) {
				// refresh the enemy pool if necessary
				if (ds_list_empty(enemy_pool)) {
					ds_list_destroy(enemy_pool);
					enemy_pool = scr_clone_list(scr_get_enemies_of_tier(room_tier, "enemy"));
				}
				
				new_room[? "type"] = "battle";
				new_room[? "room_tier"] = room_tier;
				new_room[? "reward_tier"] = room_tier;
				new_room[? "enemy"] = scr_choose_from_list(enemy_pool);
				scr_remove_item_from_list(enemy_pool, new_room[? "enemy"]);
			} else {
				// refresh the boss pool if necessary
				if (ds_list_empty(boss_pool)) {
					ds_list_destroy(boss_pool);
					boss_pool = scr_clone_list(scr_get_enemies_of_tier(room_tier, "boss"));
				}
				
				new_room[? "type"] = "boss";
				new_room[? "room_tier"] = room_tier;
				new_room[? "reward_tier"] = min(room_tier + 1, 2);
				new_room[? "enemy"] = scr_choose_from_list(scr_get_enemies_of_tier(room_tier, "boss"));
				scr_remove_item_from_list(enemy_pool, new_room[? "enemy"]);
			}
			
			if (ds_map_exists(new_room[? "enemy"], "loot")) {
				new_room[? "loot"] = new_room[? "enemy"][? "loot"];
			}
		
			ds_list_add(rooms, new_room);
		}
	
		new_floor[? "rooms"] = rooms;
	
		ds_list_add(floors, new_floor);
	}

	return floors;
}