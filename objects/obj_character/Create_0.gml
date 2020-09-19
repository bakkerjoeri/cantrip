state_machine_init();
state_create("waiting", scr_character_waiting);
state_create("deciding", scr_character_deciding);
state_create("drawingCards", scr_character_drawing_cards);
state_create("playingCards", scr_character_playing_cards);
state_create("reshufflingCards", scr_character_reshuffling_cards);
state_create("discardingCards", scr_character_discarding_cards);
state_create("takingDamage", scr_character_taking_damage);
state_init("waiting");

name = "";
max_hand_size = 0;
max_ability_points = 0;
ability_points = 0;

draw_pile = ds_list_create();
hand = ds_list_create();
graveyard = ds_list_create();

amount_of_cards_to_draw = 0;
card_being_played = noone;
cards_to_play = ds_queue_create();
cards_to_discard = ds_queue_create();
damage_events = ds_queue_create();

start_of_turn_effects = ds_list_create();
end_of_turn_effects = ds_list_create();
active_effects = ds_list_create();