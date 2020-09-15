// Inherit the parent event
event_inherited();

state_create("deciding", scr_character_player_deciding);

is_controlled_by_player = false;
is_hand_visible = false;

hand_width = 192;
hand_x = (room_width / 2) - (hand_width / 2);
hand_y = 2;
draw_pile_x = (room_width / 2) - (hand_width / 2) - 64 - 16;
draw_pile_y = 2;
graveyard_x = (room_width / 2) - (hand_width / 2) - 128 - 32;
graveyard_y = 2;