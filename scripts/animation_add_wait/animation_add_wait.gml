/// animation_add_next(wait_duration)
if (!variable_instance_exists(self, animation_queue)) {
	animation_init();
}

var wait_duration = argument[0];

var wait_to_add = ds_map_create();

ds_map_add(wait_to_add, "type", "wait");
wait_to_add[? "type"] = "wait";
wait_to_add[? "duration"] = wait_duration;
wait_to_add[? "elapsed"] = 0;

ds_queue_enqueue(animation_queue, wait_to_add);