function scr_generate_floors() {
	var floors = ds_list_create();

	var number_of_floors = 3;
	var number_of_rooms = 3;

	for (var floor_number = 0; floor_number <= number_of_floors - 1; floor_number += 1) {
		var new_floor = ds_map_create();
		var rooms = ds_list_create();
	
		for (var room_number = 0; room_number <= number_of_rooms - 1; room_number += 1) {
			var new_room = ds_map_create();
			var room_tier = floor_number;
		
			if (room_number < number_of_rooms - 1) {
				if (floor_number <= 1 && room_number >= 1) {
					if (irandom(3) == 0) {
						room_tier += 1;
					}
				}
			
				new_room[? "type"] = "battle";
				new_room[? "room_tier"] = room_tier;
				new_room[? "reward_tier"] = room_tier;
				new_room[? "enemy"] = scr_choose_from_list(scr_get_enemies_of_tier(room_tier));
			} else {
				new_room[? "type"] = "boss";
				new_room[? "room_tier"] = room_tier;
				new_room[? "reward_tier"] = min(room_tier + 1, 2);
				new_room[? "enemy"] = scr_choose_from_list(scr_get_bosses_of_tier(room_tier));
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
