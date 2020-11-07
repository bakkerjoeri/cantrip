function scr_is_point_in_area(point_x, point_y, top, right, bottom, left) {
	return top <= point_y
		&& bottom >= point_y
		&& left <= point_x
		&& right >= point_x;
}