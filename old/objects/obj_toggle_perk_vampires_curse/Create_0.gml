event_inherited();

label = "Vampire's curse";
explanation = "You no longer draw cards at the start of your turn. Draw a card for each point of damage you do. Dark pact is removed from the game.";
is_on = obj_game_manager.perks.vampires_curse;
on_toggle = function(value) {
	if (value) {
		obj_game_manager.perks.vampires_curse = true;
	} else {
		obj_game_manager.perks.vampires_curse = false;
	}
}