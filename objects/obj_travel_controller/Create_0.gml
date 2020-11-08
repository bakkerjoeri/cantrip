intro_for_floor = "The forest closes in around you..."
intro_for_enemy = "A few not-so-subtle rustling leaves and snapping branches made you suspect something was following you.\n\nYour suspicions are confirmed when, loudly yelping, a gerblin jumps out of the bushes and runs for you."
is_first_room_of_floor = obj_game_manager.current_room_number == 0;
intro = intro_for_enemy;

if (is_first_room_of_floor) {
	intro = intro_for_floor + "\n\n" + intro;
}