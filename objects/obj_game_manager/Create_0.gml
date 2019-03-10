state_machine_init();
state_create("start", scr_game_start);
state_create("startRun", scr_game_start_run);
state_create("gotoBattle", scr_game_goto_battle);
state_create("battle", scr_game_battle);
state_create("gotoDraft", scr_game_goto_draft);
state_create("draft", scr_game_draft);
state_create("gameOver", scr_game_over);
state_create("quit", scr_quit);
state_init("start");

floors = ds_stack_create();
current_floor = noone;
current_room = noone;

battles_won = 0;
runs_won = 0;