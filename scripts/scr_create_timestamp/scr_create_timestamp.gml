function scr_create_timestamp(seconds) {
	var should_show_milliseconds = false;

	if (argument_count >= 2) {
		should_show_milliseconds = argument[1];
	}
	
	var minutes_label = string(floor(seconds / 60) mod 60);
	var seconds_label = string_replace_all(string_format(floor(seconds mod 60), 2, 0), " ", "0");
	
	if (!should_show_milliseconds) {
		return minutes_label + ":" + seconds_label;
	}
	
	var milliseconds_label = string_replace_all(string_format(floor((seconds * 100) mod 100), 2, 0), " ", "0");
	
	return minutes_label + ":" + seconds_label + "." + milliseconds_label;
}