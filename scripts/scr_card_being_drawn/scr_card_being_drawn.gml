function scr_card_being_drawn() {
	audio_play_sound(card, 1, false);
	state_switch("inHand");
}
