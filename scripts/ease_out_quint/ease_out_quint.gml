/// ease_in(time, start_value, change, duration)
function ease_out_quint() {

	var time = argument[0];
	var start_value = argument[1];
	var change = argument[2];
	var duration = argument[3];

	return change * (power(time / duration - 1, 5) + 1) + start_value;


}
