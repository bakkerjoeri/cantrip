draw_set_halign(fa_center);
draw_set_colour(global.palette_4);
draw_text_ext(room_width / 2, 84, "You are victorious!", 8, 160);

draw_set_colour(global.palette_1);
draw_text_ext(room_width / 2, 100, "You've beaten room " + string(current_room_number) + " on floor " + string(current_floor_number) + "\nafter winning " + string(battles_won) + " battles.", 8, 160);