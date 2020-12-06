event_inherited();

width = 100;
label = "Music";
is_on = obj_game_manager.prefers_music;
on_toggle = function(value) {
	obj_game_manager.prefers_music = value;
	scr_save_game();
}