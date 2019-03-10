#macro max_hand_size 8
#macro max_ability_points 3

state_machine_init();
state_create("battleInit", scr_battle_init);
state_create("battleStart", scr_battle_start);
state_create("turnStart", scr_battle_turn_start);
state_create("turnDrawPhase", scr_battle_turn_draw_phase);
state_create("turnPointsPhase", scr_battle_turn_points_phase);
state_create("turnPlayPhase", scr_battle_turn_play_phase);
state_create("turnEnd", scr_battle_turn_end);
state_create("battleEnd", scr_battle_end);
//state_create("battleLost", scr_battle_lost);
//state_create("battleWon", scr_battle_won);
state_init("battleInit");

turn_of_character = noone;
card_with_focus = noone;

player = instance_create_layer(0, 0, "Controllers", obj_player);
	opponent = instance_create_layer(0, 0, "Controllers", obj_opponent);