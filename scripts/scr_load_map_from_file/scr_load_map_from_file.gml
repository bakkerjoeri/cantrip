function scr_load_map_from_file() {
	var filename = argument[0];

	var buffer = buffer_load(filename);
	var string_from_file = buffer_read(buffer, buffer_string);
	buffer_delete(buffer);

	return json_decode(string_from_file);



}
