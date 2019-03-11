/// scr_card_effect_shield_bash(target, source);
var source = argument[1];

var shield_cards_in_hand = 0;

for (var c = 0; c <= ds_list_size(source.hand) - 1; c += 1) {
	var card = ds_list_find_value(source.hand, c);
	
	if (card.name = "shield") {
		shield_cards_in_hand += 1;
		ds_queue_enqueue(source.cards_to_discard, card);
		
		with (source) {
			state_switch("discardingCards");
		}
	}
}

source.amount_of_cards_to_draw += shield_cards_in_hand;