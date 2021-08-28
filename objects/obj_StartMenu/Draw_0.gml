
if (!active) {
  exit;
}

draw_self();

var highlighted = highlightedCell();

draw_set_font(fnt_StartMenu);
for (var idx = 0; idx < cellCount(); idx++) {
  var xx = cellX(idx);
  var yy = cellY(idx);

  var fgcolor = Colors.BLACK;
  if (highlighted == idx) {
    fgcolor = Colors.WHITE;
    draw_set_color(Colors.BLUE);
    draw_rectangle(xx, yy, xx + cellWidth(), yy + cellHeight(), false);
  }
  draw_set_color(fgcolor);

  if (idx == 0) {
    // Up arrow
    draw_sprite_ext(spr_StartArrow, 0, mean(xx, xx + cellWidth()), yy, 1, 1, 0, fgcolor, 1);
  } else if (idx == cellCount() - 1) {
    // Down arrow
    draw_sprite_ext(spr_StartArrow, 1, mean(xx, xx + cellWidth()), yy, 1, 1, 0, fgcolor, 1);
  } else {
    // Other
    var entry = getEntry(cellToEntryIndex(idx));
    if (!is_undefined(entry)) {
      draw_sprite(spr_Icon, entry.getIcon(), xx + 2, yy + 2);
      draw_text(xx + 4 + ICON_WIDTH, yy + 2, entry.getName());
    }
  }

}
