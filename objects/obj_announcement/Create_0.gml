with (obj_announcement) {
	if (id != other.id) {
		instance_destroy();
	}
}

animation_init();
should_leave = true;
is_leaving = false;
announcement_started = false;
announcement_seen = false;
text = "";
text_color = global.palette_1;
text_width = 0;
visible = false;
depth = -2;