animation_init();
state_machine_init();
state_create("inDrawPile", scr_card_in_draw_pile);
state_create("beingDrawn", scr_card_being_drawn);
state_create("inHand", scr_card_in_hand);
state_create("startPlay", scr_card_start_play);
state_create("beingPlayed", scr_card_being_played);
state_create("isResolved", scr_card_is_resolved);
state_create("beingDiscarded", scr_card_being_discarded);
state_create("damaged", scr_card_damaged);
state_create("inGraveyard", scr_card_in_graveyard);
state_create("beingReshuffled", scr_card_being_reshuffled);
state_init("inDrawPile");

// card stats
name = "";
cost = 0;
is_unplayable = false;
discard_priority = 1;
text = "";
effects = ds_list_create();

// card state
owner = noone;
is_face_up = true;
has_focus = false;
is_drawing = false;