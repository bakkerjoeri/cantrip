function scr_draft_start() {
	reward_tier = 0;
	
	if (obj_game_manager.current_room) {
		reward_tier = obj_game_manager.current_room[? "reward_tier"];
	}
	
	if (
		obj_game_manager.current_room
		&& ds_map_exists(obj_game_manager.current_room, "loot")
	) {
		draft_rounds = scr_generate_draft_rounds_of_tier(reward_tier, obj_game_manager.current_room[? "loot"]);
	} else {
		draft_rounds = scr_generate_draft_rounds_of_tier(reward_tier);
	}
	
	state_switch("toNextRound");
}
