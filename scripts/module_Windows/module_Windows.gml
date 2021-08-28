
#macro Windows global.__module_Windows

Windows = {};

Windows.createWindow = function(body, xx, yy, w, h) {
  var xvalue = ScreenRegion.LEFT + xx;
  var yvalue = ScreenRegion.TOP + yy;
  var obj = instance_create_layer(xvalue, yvalue, "Instances_Windows", obj_DisplayedWindow);
  with (obj) {
    window_body = body;
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
