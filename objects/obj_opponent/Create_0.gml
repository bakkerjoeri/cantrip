// Inherit the parent event
event_inherited();

is_controlled_by_player = true;
is_hand_visible = true;

hand_width = 192;
hand_x = (room_width / 2) - (hand_width / 2);
hand_y = 2;
draw_pile_x = (room_width / 2) - (hand_width / 2) - 64 - 16;
draw_pile_y = 2;
graveyard_x = (room_width / 2) - (hand_width / 2) - 128 - 32;
graveyard_y = 2;