if (ds_list_size(events) == 0) {
	exit;
}

var vertical_offset = 0;
var event_index = 0;
var vertical_margin = 3;

for (var e = ds_list_size(events) - 1; e >= 0; e -= 1) {
	var event = ds_list_find_value(events, e);
	var event_message = event[? "message"];
	var event_message_height = string_height_ext(event_message, 8, event_log_width);
	var message_y = event_log_bottom - event_message_height - vertical_offset - vertical_margin;
	
	if (message_y < event_log_top) {
		break;
	}
	
	var current_alpha = 1 - (floor(event_index / 3) * 0.1);
	
	draw_set_halign(fa_left);
	draw_set_alpha(current_alpha);
	
	if (event[? "importance"] == 1) {
		draw_set_color(global.palette_3);
		draw_text(4, message_y, "> ");
	} else if (event[? "importance"] == 2) {
		draw_set_color(global.palette_2);
		draw_text(4, message_y, "> ");
	}
	
	draw_set_color(global.palette_1);
	draw_text_ext(12, message_y, event_message, 8, event_log_width);

	vertical_offset += event_message_height + vertical_margin;
	event_index += 1;
}