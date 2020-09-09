/// ease_linear(time, start_value, change, duration)
function ease_linear() {

	var time = argument[0];
	var start_value = argument[1];
	var change = argument[2];
	var duration = argument[3];

	time /= duration;

	return change * time + start_value;


}
