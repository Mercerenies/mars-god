
#macro Windows global.__module_Windows

Windows = {};

Windows.createWindow = function(body, xx, yy, w, h) {
  var xvalue = ScreenRegion.LEFT + xx;
  var yvalue = ScreenRegion.TOP + yy;
  var obj = instance_create_layer(xvalue, yvalue, "Instances_Windows", obj_DisplayedWindow);
  with (obj) {
    window_body = body;
    body.setOwner(self.id);
    width = w;
    if (width < 0) {
      width = body.desiredWidth();
    }
    height = h;
    if (height < 0) {
      height = body.desiredHeight();
    }
  }
  return obj;
}

Windows.addNewWindow = function(body, xx, yy, w, h) {
  var window = Windows.createWindow(body, xx, yy, w, h);
  ctrl_WindowManager.addWindow(window);
  return window;
}

Windows.addOrFindWindow = function(body, xx, yy, w, h) {
  var id_ = body.windowId();
  var existing = ctrl_WindowManager.findWindowById(id_);
  if (!is_undefined(existing)) {
    ctrl_WindowManager.moveToFront(existing);
    return existing;
  } else {
    return Windows.addNewWindow(body, xx, yy, w, h);
  }
}
