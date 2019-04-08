/// scr_calculate_position_x_in_hand(index_of_card_in_hand, amount_of_cards_in_hand, hand_position_x, hand_width);
var index_of_card_in_hand = argument[0];
var amount_of_cards_in_hand = argument[1];
var hand_position_x = argument[2];
var hand_width = argument[3];

var card_width = 64;

if ((amount_of_cards_in_hand * card_width) <= hand_width) {
	return (hand_position_x + (hand_width / 2)) - ((card_width / 2) * amount_of_cards_in_hand) + (index_of_card_in_hand * card_width);
}

return 	hand_position_x + (index_of_card_in_hand * (hand_width / amount_of_cards_in_hand));