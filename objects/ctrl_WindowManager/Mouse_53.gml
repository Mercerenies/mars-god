
if (!ScreenRegion.pointIn(cursor_x(), cursor_y())) {
  exit;
}

var override = getOverride();
if (!is_undefined(override)) {
  override.event("gMouseDown");
  override.event("mouseDown");
  exit;
}

var found = false;

obj_Stapley.event("gMouseDown");
if (obj_Stapley.isActive() && (!found) && (point_in_rectangle(cursor_x(), cursor_y(), obj_Stapley.bbox_left, obj_Stapley.bbox_top, obj_Stapley.bbox_right, obj_Stapley.bbox_bottom))) {
  // We clicked Stapley.
  obj_Stapley.event("mouseDown");
  found = true;
}

obj_Taskbar.event("gMouseDown");
if ((!found) && (cursor_y() >= obj_Taskbar.y)) {
  // We clicked in the taskbar.
  obj_Taskbar.event("mouseDown");
  found = true;
}

obj_StartMenu.event("gMouseDown");
if ((cursor_x() < obj_StartMenu.bbox_right) && (obj_StartMenu.isActive()) && (!found)) {
  // We clicked in the start menu.
  obj_StartMenu.event("mouseDown");
  found = true;
}

for (var index = ds_list_size(z_order) - 1; index >= 0; index--) {
  with (z_order[| index]) {
    event("gMouseDown");
    if ((!found) && (pointIn(cursor_x(), cursor_y()))) {
      other.moveToFront(id);
      event("mouseDown");
      found = true;
    }
  }
}
