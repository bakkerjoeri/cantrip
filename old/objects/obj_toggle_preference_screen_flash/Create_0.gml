event_inherited();

label = "Screen flashes";
explanation = "Some card effects, like damage, emit a short, coloured flash on the screen for emphasis when this is turned on.";
is_on = obj_game_manager.prefers_screen_flashes;
on_toggle = function(value) {
	obj_game_manager.prefers_screen_flashes = value;
	scr_save_game();
}