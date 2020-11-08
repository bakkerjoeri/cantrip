var intro_for_floor = "";
var intro_for_enemy = "";

var floors = obj_game_manager.floors;
var previous_floor = obj_game_manager.current_floor;
var previous_room = obj_game_manager.current_room;
	
if (!scr_has_next_room(floors, previous_floor, previous_room)) {
	exit;
}
	
var current_floor = scr_get_next_floor(floors, previous_floor, previous_room);
var current_room = scr_get_next_room(floors, previous_floor, previous_room);
var current_floor_number = ds_list_find_index(floors, current_floor) + 1;
var current_room_number = ds_list_find_index(current_floor[? "rooms"], current_room) + 1;

var intro_for_floor = get_intro_for_floor(current_floor_number, floors);
var intro_for_enemy = get_intro_for_enemy(current_room[? "enemy"][? "id"], floors);
var is_first_room_of_floor = current_room_number == 1;

if (is_first_room_of_floor) {
	intro = intro_for_floor + "\n\n" + intro_for_enemy;
} else {
	intro = intro_for_enemy
}