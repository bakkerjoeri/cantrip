event_inherited();

is_controlled_by_player = true;
is_hand_visible = true;

hand_width = 224;
hand_x = (room_width / 2) - (hand_width / 2);
hand_right = hand_x + hand_width;
hand_y = room_height - 98;
draw_pile_x = hand_right + 4;
draw_pile_y = room_height - 98;
graveyard_x = hand_right + 64 + 12;
graveyard_y = room_height - 98;

name = "Player";