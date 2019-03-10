reward_tier = obj_game_manager.current_room[? "reward_tier"];
draft_rounds = scr_generate_draft_rounds_of_tier(reward_tier);
	
state_switch("toNextRound");