
original_order = ds_list_create();
z_order = ds_list_create(); // End of list is on top

_override_object = undefined;

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
  window.alarm[0] = 1;
}

windowCount = function() {
  return ds_list_size(original_order);
}

activeWindowCount = function() {
  return ds_list_size(z_order);
}

findWindowById = function(id_) {
  for (var index = 0; index < ds_list_size(original_order); index++) {
    if (original_order[| index].window_body.windowId() == id_) {
      return original_order[| index];
    }
  }
  return undefined;
}

setOverride = function(obj) {
  _override_object = obj;
}

getOverride = function() {
  return _override_object;
}

hasOverride = function() {
  return !is_undefined(getOverride());
}
