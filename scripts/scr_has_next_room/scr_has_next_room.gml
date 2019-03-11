var floors = argument[0];
var previous_floor = argument[1];
var previous_room = argument[2];

return !is_undefined(scr_get_next_room(floors, previous_floor, previous_room));