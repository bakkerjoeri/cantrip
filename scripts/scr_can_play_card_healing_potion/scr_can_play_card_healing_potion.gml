/// scr_can_play_healing_potion(target, source);
var source = argument[1];

return ds_list_size(source.draw_pile) > 0 || ds_list_size(source.graveyard) > 0;