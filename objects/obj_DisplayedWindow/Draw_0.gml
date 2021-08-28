
var titlebar = spr_TitlebarActive;
var sprwidth = sprite_get_width(titlebar);
var sprheight = sprite_get_height(titlebar);

draw_sprite(titlebar, 0, x, y);
draw_sprite_stretched(titlebar, 1, x + sprwidth, y, getTotalWidth() - sprwidth * 2, sprheight);
draw_sprite(titlebar, 2, x + getTotalWidth() - sprwidth, y);