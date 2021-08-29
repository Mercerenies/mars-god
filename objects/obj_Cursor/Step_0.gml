
if (ScreenRegion.mouseIn()) {
  x = mouse_x;
  y = mouse_y;
  visible = true;
  been_visible = true;
}

if (been_visible) {
  var override = ctrl_WindowManager.getOverride();
  if ((!is_undefined(override)) && (override.hidesCursor())) {
    visible = false;
  } else {
    visible = true;
  }
}
