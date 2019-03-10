/// scr_generate_draft_round_of_tier(tier);
var tier = argument[0];

var draft_round = ds_map_create();

draft_round[? "cards"] = scr_get_unique_cards_of_tier(3, tier);

return draft_round;