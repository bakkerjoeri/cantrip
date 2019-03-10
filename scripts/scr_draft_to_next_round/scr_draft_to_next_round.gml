if (ds_queue_empty(draft_rounds)) {
	state_switch("end");
	exit;
}

current_round = ds_queue_dequeue(draft_rounds);
state_switch("startRound");