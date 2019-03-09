/// animation_add_next(end_x, end_y, duration, easing_function = ease_linear)
var end_x = argument[0];
var end_y = argument[1];
var animation_duration = argument[2];
var easing_function = ease_linear;
if (argument_count >= 4 && script_exists(argument[3])) {
	easing_function = argument[3];
}

var animation_to_add = ds_map_create();

animation_to_add[? "type"] = "animation";
animation_to_add[? "end_x"] = end_x;
animation_to_add[? "end_y"] = end_y;
animation_to_add[? "easing_function"] = easing_function;
animation_to_add[? "duration"] = animation_duration;
animation_to_add[? "elapsed"] = 0;

ds_queue_enqueue(animation_queue, animation_to_add);
animation_is_finished = false;