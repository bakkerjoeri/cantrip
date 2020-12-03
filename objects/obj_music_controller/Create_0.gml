current_track = undefined;
track_pool = ds_list_create();
track_queue = ds_list_create();

music_for_title_screen = [_01_I, _02_II];
music_for_forest = [_01_I, _02_II, _11_XI_part_1];
music_for_village = [_03_III, _07_VII];
music_for_tower = [_04_IV, _05_V];
music_for_finale = [_06_VI, _08_VIII];
music_for_lord_of_lightning = [_10_X];
music_for_crimson_mage = [_08_VIII];
music_for_void_priest = [_09_IX];

function add_tracks(track_array) {
	var new_track_list = scr_create_list_from_array(track_array);
	ds_list_shuffle(new_track_list);
	
	for (var li = 0; li <= ds_list_size(new_track_list) - 1; li += 1) {
		var track = ds_list_find_value(new_track_list, li);
		
		show_debug_message("Trying to add " + audio_get_name(track));
	
		if (!scr_does_list_contain_item(track_pool, track)) {
			ds_list_add(track_pool, track);
		}
		
		// (re-)insert this track at the beginning of the queue
		scr_remove_item_from_list(track_queue, track);
		
		if (current_track == track) {
			ds_list_add(track_queue, track);
		} else {
			ds_list_insert(track_queue, 0, track);
		}
	}
}