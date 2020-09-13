camera_set_view_pos(
	view_camera[0],
	irandom_range(-shake, shake),
	irandom_range(-shake, shake)
);

if (shake > 0) {
	shake -= 1;
}