if (state_new) {
	_animation_finished = false;
	_pos_starting_x = x;
	_pos_starting_y = y;
	_pos_target_pos_y = room_height - 98;
	_animation_duration = 0.5 * room_speed;
	_animation_time = 0;
}

_pos_target_pos_x = ((room_width / 2) - (196 / 2)) + (ds_list_find_index(owner.hand, self) * (((196 - 4)/ds_list_size(owner.hand)) - 2));

if (_animation_time < _animation_duration) {
	x = ease_out_quint(_animation_time, _pos_starting_x, (_pos_target_pos_x - _pos_starting_x), _animation_duration);
	y = ease_out_quint(_animation_time, _pos_starting_y, (_pos_target_pos_y - _pos_starting_y), _animation_duration);
	
	_animation_time += 1;
} else if (_animation_time >= _animation_duration) {
	_animation_finished = true;
}

if (_animation_finished) {
	is_drawing = false;
	state_switch("inHand");
}
