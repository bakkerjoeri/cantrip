event_inherited();

label = "Screen shake";
explanation = "Some card effects, like damage, use screen shake for emphasis when this is turned on.";
is_on = obj_game_manager.prefers_screen_shake;
on_toggle = function(value) {
	obj_game_manager.prefers_screen_shake = value;
	scr_save_game();
}