/// scr_generate_draft_rounds_of_tier(tier);
var tier = argument[0];

var draft_rounds = ds_queue_create();

ds_queue_enqueue(draft_rounds, scr_generate_draft_round_of_tier(0));

if (reward_tier == 0) {
	ds_queue_enqueue(draft_rounds, scr_generate_draft_round_of_tier(0));
}
	
if (reward_tier >= 1) {
	ds_queue_enqueue(draft_rounds, scr_generate_draft_round_of_tier(1));
}
	
if (reward_tier >= 2) {
	ds_queue_enqueue(draft_rounds, scr_generate_draft_round_of_tier(2));
}

return draft_rounds;