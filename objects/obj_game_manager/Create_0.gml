state_machine_init();
state_create("start", scr_game_start);
state_create("startRun", scr_game_start_run);
state_create("gotoSetupCustomGame", scr_game_goto_setup_custom_game);
state_create("setupCustomGame", scr_game_setup_custom_game);
state_create("gotoBattle", scr_game_goto_battle);
state_create("battle", scr_game_battle);
state_create("gotoDraft", scr_game_goto_draft);
state_create("draft", scr_game_draft);
state_create("gotoTravel", scr_game_goto_travel);
state_create("travel", scr_game_travel);
state_create("victory", scr_game_victory);
state_create("gameOver", scr_game_over);
state_create("gotoSettings", scr_game_goto_settings);
state_create("settings", scr_game_settings);
state_create("quit", scr_game_quit);
state_init("start");

floors = ds_list_create();

current_floor = undefined;
current_room = undefined;
current_room_number = 0;
current_floor_number = 0;

game_mode = "loot";

perks = {
	forbidden_alchemy: false,
	supermoon: false,
	clairvoyant: false,
	vampires_curse: false,
};

battles_won = 0;
runs_won = 0;
current_run_streak = 0;
max_run_streak = 0;

prefers_screen_shake = true;
prefers_screen_flashes = true;
is_custom_game_unlocked = false;

shake = 0;