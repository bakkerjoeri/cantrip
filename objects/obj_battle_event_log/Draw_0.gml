if (ds_list_size(events) == 0) {
	exit;
}

var vertical_offset = 0;

for (var e = ds_list_size(events) - 1; e >= 0; e -= 1) {
	var event = ds_list_find_value(events, e);
	var event_message = event[? "message"];
	var event_message_height = string_height_ext(event_message, 8, event_log_width);
	
	if (event_log_y + vertical_offset + event_message_height > event_log_vertical_limit) {
		break;
	}
	
	draw_set_halign(fa_left);
	
	if (event[? "importance"] == 1) {
		draw_set_color(global.palette_3);
	} else {
		draw_set_color(global.palette_2);
	}
	
	draw_text(4, event_log_y + vertical_offset, "> ");
	draw_set_color(global.palette_1);
	draw_text_ext(12, event_log_y + vertical_offset, event_message, 8, event_log_width);

	vertical_offset += event_message_height;
}