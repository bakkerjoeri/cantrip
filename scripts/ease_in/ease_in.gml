/// ease_in(time, start_value, change, duration)

var time = argument[0];
var start_value = argument[1];
var change = argument[2];
var duration = argument[3];

time /= duration;

return change * time * time * time + start_value;