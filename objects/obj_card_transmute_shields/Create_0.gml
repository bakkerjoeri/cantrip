event_inherited();

name = "transmute_shields";
title = "transmute shields";
cost = 0;
text = "Discard all \"Shield\" cards, draw that amount of cards.";
effect = scr_card_effect_transmute_shields;
condition = scr_can_play_card_transmute_shields;