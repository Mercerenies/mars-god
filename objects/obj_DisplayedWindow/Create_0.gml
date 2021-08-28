
// Width and height of display area
// Note: Min width is 128; min height is 64
width = 240;
height = 120;

getTotalWidth = function() {
  return width + 4;
}

getTotalHeight = function() {
  return height + 2 + sprite_get_height(spr_TitlebarActive);
}