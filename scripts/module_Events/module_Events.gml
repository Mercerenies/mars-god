
#macro Events global.__module_Events

Events = {};

// Events
// * step
// * draw
// * mouseDown
// * gMouseDown
// * mouseUp
// * gMouseUp
// * cleanup

Events.callOn = function(object, fname) {
  var fn = object[$ fname];
  if (!is_undefined(fn)) {
    object.__Events_callOn = fn;
    object.__Events_callOn();
  }
}

Events.delegateTo = function(list, fname) {
  for (var i = 0; i < ds_list_size(list); i++) {
    list[| i].event(fname);
  }
}
