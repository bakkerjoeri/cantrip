/// animation_add_next(wait_duration)
function animation_add_wait() {
	var wait_duration = argument[0];

	var wait_to_add = ds_map_create();

	ds_map_add(wait_to_add, "type", "wait");
	wait_to_add[? "type"] = "wait";
	wait_to_add[? "duration"] = wait_duration;
	wait_to_add[? "elapsed"] = 0;

	ds_queue_enqueue(animation_queue, wait_to_add);
	animation_is_finished = false;


}
