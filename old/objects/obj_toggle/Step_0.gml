if (scr_is_point_in_area(mouse_x, mouse_y, y, x + width, y + sprite_height, x)) {
	is_hovering = true;
} else {
	is_hovering = false;
}

if (mouse_check_button_released(mb_left) && is_hovering) {
	is_on = !is_on;
	on_toggle(is_on);
}