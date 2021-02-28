function scr_create_timestamp(seconds) {
	var minutes_label = string(floor(seconds / 60) mod 60);
	var seconds_label = string_replace_all(string_format(floor(seconds mod 60), 2, 0), " ", "0");
	return minutes_label + ":" + seconds_label;
}