state_machine_init();
state_create("start", scr_draft_start);
state_create("toNextRound", scr_draft_to_next_round);
state_create("startRound", scr_draft_start_round);
state_create("awaitPick", scr_draft_await_pick);
state_create("handlePick", scr_draft_handle_pick);
state_create("handleSkipRound", scr_draft_skip_round);
state_create("end", scr_draft_end);
state_init("start");

card_with_focus = noone;
picked_card = noone;
draft_rounds = ds_queue_create();
reward_tier = 0;

draft_list = ds_list_create();
draft_list_y = (room_height / 2) - (96 / 2);
deck_x = (room_width / 2) - (64 / 2);
deck_y = room_height - 40;

if (debug_mode) {
	instance_create_layer(432, 164, "Instances", obj_button_end_draft);
}