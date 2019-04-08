/// scr_generate_draft_rounds_of_tier(tier);
var tier = argument[0];
var draft_rounds_list = ds_list_create();
var draft_rounds_queue = ds_queue_create();

if (tier == 0) {
	ds_list_add(draft_rounds_list, scr_generate_draft_round_of_tier(0));
	ds_list_add(draft_rounds_list, scr_generate_draft_round_of_tier(0));
	ds_list_add(draft_rounds_list, scr_generate_draft_round_of_tier(1));
}

if (tier == 1) {
	ds_list_add(draft_rounds_list, scr_generate_draft_round_of_tier(0));
	ds_list_add(draft_rounds_list, scr_generate_draft_round_of_tier(1));
	ds_list_add(draft_rounds_list, scr_generate_draft_round_of_tier(1));
}

if (tier == 2) {
	ds_list_add(draft_rounds_list, scr_generate_draft_round_of_tier(0));
	ds_list_add(draft_rounds_list, scr_generate_draft_round_of_tier(1));
	ds_list_add(draft_rounds_list, scr_generate_draft_round_of_tier(2));
}

ds_list_shuffle(draft_rounds_list);

// Convert the list into a queue
for (var d = 0; d <= ds_list_size(draft_rounds_list) - 1; d += 1) {
	ds_queue_enqueue(draft_rounds_queue, ds_list_find_value(draft_rounds_list, d));
}

ds_list_destroy(draft_rounds_list);

return draft_rounds_queue;