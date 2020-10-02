function scr_get_array_slice(array, start, length) {
	var new_array_length = min(length, array_length(array) - start);
	var new_array = array_create(new_array_length);
	array_copy(new_array, 0, array, start, length);
	
	return new_array;
}