state_execute();

if (prefers_screen_shake && shake > 0) {
	camera_set_view_pos(view_camera[0], irandom_range(-shake, shake), irandom_range(-shake, shake));
	shake -= 1;
}

if (is_run_timer_running) {
	run_duration += (delta_time * 0.000001);
}