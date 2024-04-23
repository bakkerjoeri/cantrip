event_inherited();

width = 100;
label = "Full screen";
is_on = window_get_fullscreen();
on_toggle = function(value) {
	window_set_fullscreen(value);
}