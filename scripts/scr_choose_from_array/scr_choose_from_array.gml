function scr_choose_from_array(array) {
	var amount_of_items = array_length(array);
	
	if (amount_of_items <= 0) {
		return undefined;
	}
	
	return array_get(array, irandom(amount_of_items - 1));
}
