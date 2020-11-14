// Inherit the parent event
event_inherited();

is_controlled_by_player = false;
base_is_hand_visible = false;
base_is_draw_pile_visible = false;
is_hand_visible = base_is_hand_visible;
is_draw_pile_visible = base_is_draw_pile_visible;

hand_width = 224;
hand_x = (room_width / 2) - (hand_width / 2);
hand_right = hand_x + hand_width;
hand_y = 2;
draw_pile_x = hand_right + 4;
draw_pile_y = 2;
graveyard_x = hand_right + 64 + 12;
graveyard_y = 2;
offset_direction = 1;