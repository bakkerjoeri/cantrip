var intro_for_floor = "";
var intro_for_enemy = "";

var floors = obj_game_manager.floors;

var current_room = obj_game_manager.current_room;
var current_floor_number = obj_game_manager.current_floor_number;
var current_room_number = obj_game_manager.current_room_number;

var intro_for_floor = get_intro_for_floor(current_floor_number, floors);
var intro_for_enemy = get_intro_for_enemy(current_room[? "enemy"][? "id"], floors, current_room_number, obj_game_manager.player_deck_list);
var is_first_room_of_floor = current_room_number == 1;

if (is_first_room_of_floor) {
	intro = intro_for_floor + "\n\n" + intro_for_enemy;
} else {
	intro = intro_for_enemy
}