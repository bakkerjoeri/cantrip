event_inherited();

label = "Sounds";
width = 100;
is_on = obj_game_manager.prefers_sounds;
on_toggle = function(value) {
	obj_game_manager.prefers_sounds = value;
	scr_save_game();
}