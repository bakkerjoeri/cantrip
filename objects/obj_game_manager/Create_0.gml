state_machine_init();
state_create("start", scr_game_start);
state_create("goToStartRun", scr_game_go_to_start_run);
state_create("startRun", scr_game_start_run);
state_create("gameOver", scr_game_over);
state_create("quit", scr_quit);
state_init("start");

rooms = ds_stack_create();
floors = ds_stack_create();

battles_won = 0;
current_floor_number = 0;
current_room = noone;
rooms = ds_stack_create();