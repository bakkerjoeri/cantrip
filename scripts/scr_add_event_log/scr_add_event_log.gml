function scr_add_event_log(event_message) {
	var event = ds_map_create();
	event[? "message"] = event_message;

	with (obj_battle_event_log) {
		ds_list_add(events, event);
	}
	
	return event;
}