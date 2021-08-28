
if (!ScreenRegion.pointIn(cursor_x(), cursor_y())) {
  exit;
}

if (cursor_y() >= obj_Taskbar.y) {
  // We clicked in the taskbar.
  obj_Taskbar.mouseDown();
  exit;
}

var found = false;
for (var index = ds_list_size(z_order) - 1; index >= 0; index--) {
  with (z_order[| index]) {
    if ((!found) && (pointIn(cursor_x(), cursor_y()))) {
      other.moveToFront(id);
      mouseDown();
      found = true;
    }
  }
}
