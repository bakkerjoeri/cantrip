function scr_is_custom_game() {
	return obj_game_manager.perks.supermoon
		|| obj_game_manager.perks.clairvoyant
		|| obj_game_manager.perks.forbidden_alchemy
		|| obj_game_manager.perks.vampires_curse
		|| obj_game_manager.game_mode = "draft";
}