function animation_execute() {
	if (!animation_current && ds_queue_empty(animation_queue)) {
		animation_is_finished = true;
		exit;
	}
	
	if (!animation_current) {
		animation_is_finished = false;
		animation_current = ds_queue_dequeue(animation_queue);
		animation_current[? "start_x"] = x;
		animation_current[? "start_y"] = y;
	}

	if (animation_current[? "elapsed"] <= animation_current[? "duration"]) {
		if (animation_current[? "type"] == "animation") {
			x = script_execute(animation_current[? "easing_function"],
				animation_current[? "elapsed"],
				animation_current[? "start_x"],
				animation_current[? "end_x"] - animation_current[? "start_x"],
				animation_current[? "duration"],
			);
	
			y = script_execute(animation_current[? "easing_function"],
				animation_current[? "elapsed"],
				animation_current[? "start_y"],
				animation_current[? "end_y"] - animation_current[? "start_y"],
				animation_current[? "duration"],
			);
		}
	
		animation_current[? "elapsed"] += 1;
	} else {
		animation_current = noone;
	}
}
