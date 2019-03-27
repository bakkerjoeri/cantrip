pause_surface = surface_create(room_width, room_height);

state_machine_init();
state_create("unpaused", scr_game_unpaused);
state_create("paused", scr_game_paused);
state_init("unpaused");