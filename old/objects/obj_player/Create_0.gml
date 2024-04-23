event_inherited();

is_controlled_by_player = true;
base_is_hand_visible = true;
base_is_draw_pile_visible = false;
is_hand_visible = base_is_hand_visible;
is_draw_pile_visible = base_is_draw_pile_visible;

hand_width = 224;
hand_x = (room_width / 2) - (hand_width / 2);
hand_right = hand_x + hand_width;
hand_y = room_height - 98;
draw_pile_x = hand_right + 4;
draw_pile_y = room_height - 98;
graveyard_x = hand_right + 64 + 12;
graveyard_y = room_height - 98;
offset_direction = -1;

name = "Player";