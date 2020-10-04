if (ds_list_size(events) == 0) {
	exit;
}

var vertical_offset = 0;

for (var e = ds_list_size(events) - 1; e >= 0; e -= 1) {
	var event = ds_list_find_value(events, e);
	var event_message = event[? "message"];
	
	draw_set_halign(fa_left);
	draw_set_color(global.palette_2);
	draw_text(4, 114 + vertical_offset, "> ");
	draw_set_color(global.palette_1);
	draw_text_ext(12, 114 + vertical_offset, event_message, 8, 192);

	var event_message_height = string_height_ext(event[? "message"], 8, 192);
	vertical_offset += event_message_height;
}