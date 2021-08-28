
original_order = ds_list_create();
z_order = ds_list_create(); // End of list is on top

// Takes obj_DisplayedWindow instance
addWindow = function(window) {
  ds_list_add(original_order, window.id);
  ds_list_add(z_order, window.id);
}

moveToFront = function(window) {
  var index = -1;
  for (var i = 0; i < ds_list_size(z_order); i++) {
    if (z_order[| i] == window.id) {
      index = i;
      break;
    }
  }
  if (index >= 0) {
    ds_list_delete(z_order, index);
  }
  ds_list_add(z_order, window.id);
}

isActiveWindow = function(window) {
  var size = ds_list_size(z_order);
  return (size > 0) && (z_order[| size - 1] == window.id);
}

minimize = function(window) {
  var index = -1;
  for (var i = 0; i < ds_list_size(z_order); i++) {
    if (z_order[| i] == window.id) {
      index = i;
      break;
    }
  }
  if (index >= 0) {
    ds_list_delete(z_order, index);
  }
}

closeButKeep = function(window) {
  minimize(window);
  var index = -1;
  for (var i = 0; i < ds_list_size(original_order); i++) {
    if (original_order[| i] == window.id) {
      index = i;
      break;
    }
  }
  if (index >= 0) {
    ds_list_delete(original_order, index);
  }
}

close = function(window) {
  closeButKeep(window);
  instance_destroy(window);
}

windowCount = function() {
  return ds_list_size(original_order);
}

activeWindowCount = function() {
  return ds_list_size(z_order);
}

// DEBUG CODE
addWindow(Windows.createWindow(new SampleWindow("Sample Window I"), 64, 64, -1, -1));
addWindow(Windows.createWindow(new SampleWindow("Sample Window II with Long Titlebar Name Blah Blah Blah"), 128, 128, -1, -1));
