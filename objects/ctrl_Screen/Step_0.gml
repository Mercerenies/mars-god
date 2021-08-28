
if (ScreenRegion.mouseIn()) {
  window_set_cursor(cr_none);
} else {
  window_set_cursor(cr_default);
}

caret_tick += 1;
