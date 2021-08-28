
// Width and height of display area
// Note: Min width is 48; min height is 24
width = 240;
height = 120;

window_body = undefined;

anchor_dragging = false;
anchor_x = 0;
anchor_y = 0;

getTotalWidth = function() {
  return width + 4;
}

getTotalHeight = function() {
  return height + 2 + sprite_get_height(spr_TitlebarActive);
}

pointInTitlebar = function(xx, yy) {
  return point_in_rectangle(xx, yy, x, y, x + getTotalWidth(), y + sprite_get_height(spr_TitlebarActive));
}

pointIn = function(xx, yy) {
  return point_in_rectangle(xx, yy, x, y, x + getTotalWidth(), y + getTotalHeight());
}

// "Draw" Event
draw = function() {

  var titlebar = spr_TitlebarActive;
  var sprwidth = sprite_get_width(titlebar);
  var sprheight = sprite_get_height(titlebar);

  var w = getTotalWidth();
  var h = getTotalHeight();

  // Contents
  draw_set_color(Colors.GRAY);
  draw_rectangle(x + 1, y + 1, x + w - 1, y + h - 1, false);

  // Titlebar
  draw_sprite(titlebar, 0, x, y);
  draw_sprite_stretched(titlebar, 1, x + sprwidth, y, w - sprwidth * 2, sprheight);
  draw_sprite(titlebar, 2, x + w - sprwidth, y);

  draw_set_font(fnt_Titlebar);
  draw_set_color(Colors.WHITE);
  draw_text(x + 4, y + 4, window_body.windowTitle());

  // Border
  draw_set_color(Colors.WHITE);
  draw_line(x, y + 1, x, y + h - 1);
  draw_set_color(Colors.BLACK);
  draw_line(x + w - 1, y + 1, x + w - 1, y + h - 1);
  draw_line(x - 1, y + h, x + w - 1, y + h);

}

// Mouse down
mouseDown = function() {
  if (pointInTitlebar(cursor_x(), cursor_y())) {
    anchor_dragging = true;
    anchor_x = cursor_x() - x;
    anchor_y = cursor_y() - y;
  }
}

// Mouse up
mouseUp = function() {}

// Global mouse up
gMouseUp = function() {
  anchor_dragging = false;
}

// Step (only called if not minimized)
step = function() {
  if (anchor_dragging) {
    x = cursor_x() - anchor_x;
    y = cursor_y() - anchor_y;
  }

  x = clamp(x, ScreenRegion.LEFT - getTotalWidth() + 64, ScreenRegion.RIGHT - 64);
  y = clamp(y, ScreenRegion.TOP - 8, ScreenRegion.BOTTOM - 96);

}
