event_inherited();

label = "Supermoon";
explanation = "Each character starts their turn with full AP. Meditate and rest are removed from the game.";
is_on = obj_game_manager.perks.supermoon;
on_toggle = function(value) {
	if (value) {
		obj_game_manager.perks.supermoon = true;
	} else {
		obj_game_manager.perks.supermoon = false;
	}
}