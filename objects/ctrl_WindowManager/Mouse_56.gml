
if (!ScreenRegion.pointIn(cursor_x(), cursor_y())) {
  exit;
}

var found = false;

obj_Taskbar.event("gMouseUp");
if (cursor_y() >= obj_Taskbar.y) {
  // We clicked in the taskbar.
  obj_Taskbar.event("mouseUp");
  found = true;
}

obj_StartMenu.event("gMouseUp");
if ((cursor_x() < obj_StartMenu.bbox_right) && (obj_StartMenu.isActive()) && (!found)) {
  // We clicked in the start menu.
  obj_StartMenu.event("mouseUp");
  found = true;
}

for (var index = ds_list_size(z_order) - 1; index >= 0; index--) {
  with (z_order[| index]) {
    event("gMouseUp");
    if ((!found) && (pointIn(cursor_x(), cursor_y()))) {
      event("mouseUp");
      found = true;
    }
  }
}
