state_machine_init();
state_create("start", scr_draft_start);
state_create("toNextRound", scr_draft_to_next_round);
state_create("startRound", scr_draft_start_round);
state_create("awaitSelection", scr_draft_await_selection);
state_init("start");

draft_rounds = ds_queue_create();
reward_tier = 0;