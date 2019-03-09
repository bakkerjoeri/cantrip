if (state_new) {
	animation_add_wait(1.25 * room_speed);
}

if (animation_is_finished) {
	state_switch("beingDiscarded");
}