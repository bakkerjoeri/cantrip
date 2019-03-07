state_create("inDrawPile", scr_card_in_draw_pile);
state_create("beingDrawn", scr_card_being_drawn);
state_create("inHand", scr_card_in_hand);
//state_create("inHandActive", );
//state_create("beingPlayed", );
//state_create("beingDiscarded", );
//state_create("inGraveyard", );
state_init("inDrawPile");

// card stats
name = "";
cost = 0;
text = "";
effects = ds_list_create();

// card state
owner = noone;
is_face_up = true;
has_focus = false;
is_drawing = false;