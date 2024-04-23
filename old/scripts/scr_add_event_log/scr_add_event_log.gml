function scr_add_event_log(event_message) {
	var importance = 0;
	
	if (argument_count >= 2) {
		importance = argument[1];
	}
		
	var event = ds_map_create();
	event[? "message"] = event_message;
	event[? "importance"] = importance;

	with (obj_battle_event_log) {
		ds_list_add(events, event);
	}
	
	return event;
}