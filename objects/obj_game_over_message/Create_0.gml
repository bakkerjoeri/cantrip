random_message = irandom(4);

if (obj_game_manager.current_room) {
	last_enemy = obj_game_manager.current_room[? "enemy"];
} else {
	last_enemy = noone;
}