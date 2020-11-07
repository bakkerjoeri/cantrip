event_inherited();

label = "Sealed deck";
explanation = "Instead of drafting after each battle, build a deck at the start of the run through 24 rounds of draft.";
is_on = obj_game_manager.game_mode == "draft";
on_toggle = function(value) {
	if (value) {
		obj_game_manager.game_mode = "draft";
	} else {
		obj_game_manager.game_mode = "loot";
	}
}