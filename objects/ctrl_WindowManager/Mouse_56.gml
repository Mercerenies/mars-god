
if (!ScreenRegion.pointIn(cursor_x(), cursor_y())) {
  exit;
}

var found = false;
for (var index = ds_list_size(z_order) - 1; index >= 0; index--) {
  with (z_order[| index]) {
    event("gMouseUp");
    if ((!found) && (pointIn(cursor_x(), cursor_y()))) {
      event("mouseUp");
      found = true;
    }
  }
}
