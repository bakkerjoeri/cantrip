state_machine_init();
state_create("init", scr_battle_init);
state_create("start", scr_battle_start);
state_create("turnStart", scr_battle_turn_start);
state_create("turnDrawPhase", scr_battle_turn_draw_phase);
state_create("turnPointsPhase", scr_battle_turn_points_phase);
state_create("turnPlayPhase", scr_battle_turn_play_phase);
state_create("turnEnd", scr_battle_turn_end);
state_create("end", scr_battle_end);
state_create("lost", scr_battle_lost);
state_create("won", scr_battle_won);
state_init("init");

turn_of_character = noone;
card_with_focus = noone;
character_that_lost = noone;

player = instance_create_layer(0, 0, "Controllers", obj_player);
opponent = instance_create_layer(0, 0, "Controllers", obj_opponent);

instance_create_layer(432, 136, "Instances", obj_button_win_battle);

if (debug_mode) {
	instance_create_layer(432, 184, "Instances", obj_button_lose_battle);
}