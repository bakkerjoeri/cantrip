event_inherited();

label = "Clairvoyant";
explanation = "Your opponent's hand is always visible. Third eye opens is removed from the game.";
is_on = obj_game_manager.perks.clairvoyant;
on_toggle = function(value) {
	if (value) {
		obj_game_manager.perks.clairvoyant = true;
	} else {
		obj_game_manager.perks.clairvoyant = false;
	}
}