event_inherited();

label = "Forbidden alchemy"
explanation = "When a character plays a card, they draw a card. Catalyst is removed from the game.";
is_on = obj_game_manager.perks.forbidden_alchemy;
on_toggle = function(value) {
	if (value) {
		obj_game_manager.perks.forbidden_alchemy = true;
	} else {
		obj_game_manager.perks.forbidden_alchemy = false;
	}
}