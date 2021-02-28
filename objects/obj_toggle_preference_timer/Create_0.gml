event_inherited();

width = 100;
label = "Display timer";
is_on = obj_game_manager.prefers_display_timer;
on_toggle = function(value) {
	obj_game_manager.prefers_display_timer = value;
	scr_save_game();
}