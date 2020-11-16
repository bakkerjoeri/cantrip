event_inherited();

label = "Full screen";
is_on = window_get_fullscreen();
on_toggle = function(value) {
	window_set_fullscreen(value);
	scr_save_game();
}