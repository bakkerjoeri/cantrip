draw_set_halign(fa_center);

if (last_enemy) {
	draw_set_colour(global.palette_5);
	draw_text(room_width / 2, 84, "You died!");

	draw_set_colour(global.palette_1);
	draw_text(room_width / 2, 100, "You've been defeated by the " + last_enemy[? "name"]);
} else {
	draw_set_colour(global.palette_5);
	draw_text(room_width / 2, 84, "You gave up!");

	draw_set_colour(global.palette_1);
	draw_text(room_width / 2, 100, "You decided to leave safely");
}

if (obj_game_manager.battles_won == 1) {
	draw_text(room_width / 2, 108, "after " + string(obj_game_manager.battles_won) + " battle.");
} else {
	draw_text(room_width / 2, 108, "after " + string(obj_game_manager.battles_won) + " battles.");
}


draw_set_colour(global.palette_1);
if (random_message == 0) {
	draw_text(room_width / 2, 124, "It just wasn't in the cards for you...");
} else if (random_message == 1) {
	draw_text(room_width / 2, 124, "Bad luck of the draw, eh?");
} else if (random_message == 2) {
	draw_text(room_width / 2, 124, "Seems like the deck was stacked against you.");
} else {
	draw_text(room_width / 2, 124, "Better luck next life!");
}