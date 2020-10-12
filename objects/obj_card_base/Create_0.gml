animation_init();
state_machine_init();
state_create("undealt", scr_card_undealt);
state_create("inDrawPile", scr_card_in_draw_pile);
state_create("beingDrawn", scr_card_being_drawn);
state_create("inHand", scr_card_in_hand);
state_create("startPlay", scr_card_start_play);
state_create("beingPlayed", scr_card_being_played);
state_create("isResolved", scr_card_is_resolved);
state_create("beingDiscarded", scr_card_being_discarded);
state_create("damaged", scr_card_damaged);
state_create("destroyed", scr_card_destroyed);
state_create("hasDeflected", scr_card_has_deflected);
state_create("inGraveyard", scr_card_in_graveyard);
state_create("beingReshuffled", scr_card_being_reshuffled);
state_create("draftReveal", scr_card_draft_reveal);
state_create("draftable", scr_card_draftable);
state_create("draftPicked", scr_card_draft_picked);
state_create("draftNotPicked", scr_card_draft_not_picked);
state_init("undealt");

// card stats
name = "base";
title = "";
is_unplayable = false;
is_burning = false;
discard_priority = 1;
text = "";
effect = undefined;
condition = undefined;
has_priority = undefined;
rarity = 0;

// card state
owner = noone;
is_face_up = true;
has_focus = false;

// look
alpha = 1;
visible = false;