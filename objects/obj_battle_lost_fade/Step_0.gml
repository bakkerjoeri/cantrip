if (_next_frame_delay <= 0 && overlay_index < sprite_get_number(spr_overlay_fade_out) - 1) {
	overlay_index += 1;
	
	_next_frame_delay = 0.75 * room_speed;
	exit;
}

_next_frame_delay -= 1;