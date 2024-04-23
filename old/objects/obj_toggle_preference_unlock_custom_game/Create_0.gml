event_inherited();

label = "Unlock custom run mode";
explanation = "If, for whatever reason, you want to get into custom runs without beating the game first, feel free to unlock it here. Enjoy!";
is_on = obj_game_manager.is_custom_game_unlocked;
on_toggle = function(value) {
	obj_game_manager.is_custom_game_unlocked = value;
	scr_save_game();
}